-- ============================================================
-- Seed batch 1 -- governance control library
-- ============================================================
-- 20 controls: 8 ISO/IEC 42001 Annex A + 12 NIST AI RMF, across
-- GOVERN, MAP, MEASURE, MANAGE. Run after 01_create_schema.sql.
-- Independent of use case data.

USE CATALOG ai_governance;

-- Rebuild the table with a proper framework column instead of
-- overloading iso42001_clause with non-ISO codes.
CREATE OR REPLACE TABLE controls.control_library (
    control_id           STRING NOT NULL COMMENT 'Primary key, e.g. CTRL-001',
    control_name         STRING NOT NULL COMMENT 'Short descriptive name',
    framework             STRING COMMENT 'ISO42001 | NIST_AI_RMF',
    framework_control_code STRING COMMENT 'The actual code within its framework, e.g. A.5 (ISO) or GV-1.1 (NIST)',
    control_category     STRING COMMENT 'oversight | transparency | monitoring | auditability | privacy | security',
    control_description  STRING COMMENT 'What this control requires in practice',
    maturity_rating      STRING COMMENT 'absent | basic | managed | optimised'
)
USING DELTA
COMMENT 'Governance control library -- ISO 42001 Annex A and NIST AI RMF, kept in separate framework/code columns';

INSERT INTO controls.control_library VALUES
-- ISO 42001 Annex A (8 controls)
('CTRL-001', 'AI policy documentation',           'ISO42001', 'A.2',  'transparency', 'A documented, versioned AI policy stating objectives and scope, linked to every model at intake', 'basic'),
('CTRL-002', 'Defined AI oversight roles',        'ISO42001', 'A.3',  'oversight',     'Named roles and responsibilities for AI governance decisions, captured per use case', 'basic'),
('CTRL-003', 'Pre-deployment impact assessment',  'ISO42001', 'A.5',  'oversight',     'Mandatory impact assessment completed and recorded before a model is promoted to production', 'managed'),
('CTRL-004', 'Lifecycle stage tracking',          'ISO42001', 'A.6',  'auditability',  'Every model/use case tagged with its current lifecycle stage (design/dev/deployment/retirement)', 'basic'),
('CTRL-005', 'Data lineage and provenance',       'ISO42001', 'A.7',  'privacy',       'Lineage tracked from raw ingestion through to any model training or scoring step', 'managed'),
('CTRL-006', 'Model card / transparency artefact','ISO42001', 'A.8',  'transparency',  'Auto-generated summary of purpose, data, and risk profile published per use case', 'basic'),
('CTRL-007', 'Defined intended use and restrictions', 'ISO42001', 'A.9', 'oversight',  'Explicit allowed-use scope and escalation threshold recorded for the use case', 'basic'),
('CTRL-008', 'Third-party AI dependency register','ISO42001', 'A.10', 'security',      'Any third-party model, API, or vendor dependency flagged and risk-assessed', 'absent'),
-- NIST AI RMF (12 controls) -- control_name, control_category,
-- control_description, and maturity_rating all confirmed via live
-- query against your actual seeded data, not reconstructed.
('CTRL-101', 'Accountable AI governance structure',     'NIST_AI_RMF', 'GV-1.1',  'oversight',    'Named senior accountable executive for AI outcomes, with clear authority and decision rights', 'basic'),
('CTRL-102', 'AI risk management policy',                'NIST_AI_RMF', 'GV-1.3',  'oversight',    'Documented AI risk management policy integrated into enterprise risk framework', 'basic'),
('CTRL-103', 'Organizational AI risk tolerance',          'NIST_AI_RMF', 'GV-1.5',  'oversight',    'Defined risk appetite statements for AI systems by deployment context (high-risk vs low-risk)', 'absent'),
('CTRL-104', 'AI system context documentation',           'NIST_AI_RMF', 'MP-1.1',  'transparency', 'Intended purpose, expected benefits, known limitations documented before deployment', 'basic'),
('CTRL-105', 'Stakeholder impact mapping',                 'NIST_AI_RMF', 'MP-2.2',  'oversight',    'Identification of affected individuals and communities per AI system', 'basic'),
('CTRL-106', 'AI risk identification and categorization',  'NIST_AI_RMF', 'MP-3.1',  'oversight',    'Proactive identification of trustworthiness risks (bias, privacy, security, explainability)', 'managed'),
('CTRL-107', 'Performance metrics tracking',                'NIST_AI_RMF', 'MS-1.1',  'monitoring',   'Defined AI performance metrics tracked over time with thresholds for acceptable drift', 'managed'),
('CTRL-108', 'Bias and fairness testing',                   'NIST_AI_RMF', 'MS-2.7',  'auditability', 'Pre-deployment and ongoing fairness evaluation across demographic segments', 'basic'),
('CTRL-109', 'Transparency and explainability',             'NIST_AI_RMF', 'MS-2.10', 'transparency', 'Model explanations or transparency mechanisms appropriate to the use case risk level', 'basic'),
('CTRL-110', 'Regular AI risk review and updates',          'NIST_AI_RMF', 'MG-2.1',  'monitoring',   'Periodic re-assessment of AI risks as system or context changes', 'basic'),
('CTRL-111', 'Incident response for AI failures',           'NIST_AI_RMF', 'MG-3.1',  'monitoring',   'Documented procedures for detecting, responding to, and learning from AI incidents', 'absent'),
('CTRL-112', 'Human oversight and intervention',            'NIST_AI_RMF', 'MG-3.2',  'oversight',    'Humans can override, disengage, or intervene in high-stakes AI decisions', 'managed');
