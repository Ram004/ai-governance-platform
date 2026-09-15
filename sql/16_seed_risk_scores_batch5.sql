-- ============================================================
-- Seed batch 5 -- risk scores for UC-018 to UC-019
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 15_seed_use_cases_batch5.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-018: AI medical scribes -- documented TGA compliance gap, sector-wide
('RS-018-priv', 'UC-018', 'privacy',      4, 'Processes patient consultation and clinical note data across an estimated 40% of Australian GP practices -- sensitive health information at meaningful national scale', 'disclosed', DATE('2026-09-12')),
('RS-018-sec',  'UC-018', 'security',     2, 'Standard practice-management software access assumed; no specific security detail disclosed in the AHPRA case study', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-018-bias', 'UC-018', 'bias',         4, 'AHPRA explicitly documents hallucination risk -- plausible but incorrect or misleading AI-generated diagnostic suggestions -- as a known error mode across these tools', 'disclosed', DATE('2026-09-12')),
('RS-018-reg',  'UC-018', 'regulatory',   5, 'A documented, current, sector-wide compliance gap: tools that suggest diagnoses meet the legal definition of a medical device requiring TGA/ARTG approval, yet as of August 2026 none has been approved despite widespread use', 'disclosed', DATE('2026-09-12')),
('RS-018-rep',  'UC-018', 'reputational', 3, 'Growing regulatory and industry scrutiny of the TGA compliance gap (multiple 2026 legal/industry articles specifically addressing it), though no single high-profile public incident cited', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-018-ops',  'UC-018', 'operational',  3, 'Production, used in an estimated 40% of GP practices; practitioner remains explicitly responsible for the resulting record and any diagnosis decision', 'disclosed', DATE('2026-09-12')),

-- UC-019: AI-assisted mammography -- secondary-sourced accuracy claim
('RS-019-priv', 'UC-019', 'privacy',      3, 'Medical imaging data is highly sensitive; specific handling/retention practice not disclosed in this secondary source', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-019-sec',  'UC-019', 'security',     2, 'No specific access or security detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-019-bias', 'UC-019', 'bias',         3, 'A single reported accuracy figure (94.5%) does not disclose performance across demographic subgroups; no fairness/subgroup testing detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-019-reg',  'UC-019', 'regulatory',   2, 'Diagnostic imaging AI sits within TGA''s SaMD framework generally; no specific compliance status disclosed for these particular tools in this source', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-019-rep',  'UC-019', 'reputational', 2, 'Positively framed accuracy result, no incident disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-019-ops',  'UC-019', 'operational',  2, 'Used for triage/support of radiologist review rather than as a sole diagnostic authority, per the source description', 'disclosed', DATE('2026-09-12'));
