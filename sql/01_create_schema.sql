-- ============================================================
-- Enterprise AI Governance & Risk Analytics Platform
-- Unity Catalog schema — Databricks Free Edition
-- ============================================================
-- Run this in a Databricks SQL editor or notebook (%sql cells).
-- If your Free Edition workspace restricts custom catalog
-- creation, swap CATALOG_NAME below for the default 'workspace'
-- catalog and skip the CREATE CATALOG statement.

CREATE CATALOG IF NOT EXISTS ai_governance
  COMMENT 'Enterprise AI Governance & Risk Analytics Platform';

USE CATALOG ai_governance;

-- ------------------------------------------------------------
-- Schemas
-- ------------------------------------------------------------
CREATE SCHEMA IF NOT EXISTS use_case_inventory COMMENT 'The 100-case AI use case repository';
CREATE SCHEMA IF NOT EXISTS risk_assessment    COMMENT 'Risk scoring across six dimensions';
CREATE SCHEMA IF NOT EXISTS controls           COMMENT 'ISO 42001-aligned control library';
CREATE SCHEMA IF NOT EXISTS risk_register      COMMENT 'Tracked risks, mitigations, residual ratings';
CREATE SCHEMA IF NOT EXISTS readiness          COMMENT 'ISO 42001 maturity scoring';
CREATE SCHEMA IF NOT EXISTS stewardship        COMMENT 'Data ownership, stewardship and RACI over governed assets';

-- ============================================================
-- use_case_inventory.ai_use_cases
-- ============================================================
CREATE TABLE IF NOT EXISTS use_case_inventory.ai_use_cases (
    use_case_id         STRING NOT NULL COMMENT 'Primary key, e.g. UC-001',
    org_name            STRING COMMENT 'Organisation name, or anonymised label',
    industry            STRING COMMENT 'e.g. Banking, Telecommunications, Government, Healthcare',
    source_url          STRING COMMENT 'Link to the original public source',
    source_type         STRING COMMENT 'government_register | vendor_case_study | annual_report | analyst_report',
    disclosure_type     STRING COMMENT 'Same categories as source_type — used for dashboard grouping',
    business_function    STRING COMMENT 'e.g. Customer Service, Credit Decisioning, Fraud Detection',
    ai_technique        STRING COMMENT 'e.g. LLM, Classical ML, Computer Vision, Agentic AI',
    deployment_status    STRING COMMENT 'Pilot | Production | Retired',
    data_types_used      STRING COMMENT 'Free text or comma-separated list, e.g. transaction_data,customer_pii',
    human_in_loop_flag   BOOLEAN COMMENT 'TRUE if a human reviews/approves outputs',
    date_captured        DATE COMMENT 'Date this record was added to the inventory',
    notes                STRING COMMENT 'Any additional context from the source'
)
USING DELTA
COMMENT 'One row per real-world AI use case sourced from public disclosures';

-- ============================================================
-- risk_assessment.risk_scores
-- ============================================================
CREATE TABLE IF NOT EXISTS risk_assessment.risk_scores (
    score_id            STRING NOT NULL COMMENT 'Primary key',
    use_case_id         STRING NOT NULL COMMENT 'FK to use_case_inventory.ai_use_cases',
    dimension           STRING NOT NULL COMMENT 'privacy | security | bias | regulatory | reputational | operational',
    score_1_5           INT NOT NULL COMMENT 'Score from 1 (low) to 5 (high) per the rubric',
    scoring_rationale    STRING COMMENT 'One-line justification tied to the rubric criteria',
    risk_data_source     STRING COMMENT 'disclosed | inferred_by_assessor',
    scored_date          DATE COMMENT 'Date this score was assigned'
)
USING DELTA
COMMENT 'Risk scores across six dimensions, one row per use case per dimension';

-- ============================================================
-- controls.control_library
-- ============================================================
CREATE TABLE IF NOT EXISTS controls.control_library (
    control_id           STRING NOT NULL COMMENT 'Primary key, e.g. CTRL-001',
    control_name         STRING NOT NULL COMMENT 'Short descriptive name',
    iso42001_clause      STRING COMMENT 'e.g. A.5, A.7, A.9',
    control_category     STRING COMMENT 'oversight | transparency | monitoring | auditability | privacy | security',
    control_description  STRING COMMENT 'What this control requires in practice',
    maturity_rating      STRING COMMENT 'absent | basic | managed | optimised — set at the library level as a default'
)
USING DELTA
COMMENT 'Reusable governance controls mapped to ISO 42001 Annex A';

-- ------------------------------------------------------------
-- controls.use_case_controls (junction table)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS controls.use_case_controls (
    use_case_id          STRING NOT NULL COMMENT 'FK to use_case_inventory.ai_use_cases',
    control_id            STRING NOT NULL COMMENT 'FK to controls.control_library',
    implementation_status STRING COMMENT 'not_implemented | partial | implemented | not_applicable',
    evidence_note          STRING COMMENT 'What in the source disclosure supports this status'
)
USING DELTA
COMMENT 'Many-to-many mapping of which controls apply to which use case, and their status';

-- ============================================================
-- risk_register.risks
-- ============================================================
CREATE TABLE IF NOT EXISTS risk_register.risks (
    risk_id              STRING NOT NULL COMMENT 'Primary key, e.g. RISK-001',
    use_case_id          STRING NOT NULL COMMENT 'FK to use_case_inventory.ai_use_cases',
    dimension            STRING COMMENT 'privacy | security | bias | regulatory | reputational | operational',
    risk_description     STRING COMMENT 'What could go wrong',
    inherent_rating      STRING COMMENT 'Low | Medium | High | Critical — before mitigation',
    mitigation_action    STRING COMMENT 'What control or action reduces this risk',
    residual_rating      STRING COMMENT 'Low | Medium | High | Critical — after mitigation',
    risk_owner           STRING COMMENT 'Accountable role, or N/A for public case studies',
    review_date          DATE COMMENT 'Next scheduled review'
)
USING DELTA
COMMENT 'Identified risks per use case, with mitigation and residual rating';

-- ============================================================
-- readiness.iso42001_maturity
-- ============================================================
CREATE TABLE IF NOT EXISTS readiness.iso42001_maturity (
    maturity_id          STRING NOT NULL COMMENT 'Primary key',
    use_case_id          STRING NOT NULL COMMENT 'FK to use_case_inventory.ai_use_cases',
    domain               STRING NOT NULL COMMENT 'leadership | risk_management | monitoring | continuous_improvement',
    maturity_score_0_4    INT NOT NULL COMMENT '0 (absent) to 4 (optimised)',
    assessment_note       STRING COMMENT 'Rationale for this maturity score',
    assessed_date         DATE COMMENT 'Date this assessment was made'
)
USING DELTA
COMMENT 'ISO 42001 maturity domain scores, one row per use case per domain';

-- ============================================================
-- stewardship.data_stewardship
-- ============================================================
CREATE TABLE IF NOT EXISTS stewardship.data_stewardship (
    stewardship_id        STRING NOT NULL COMMENT 'Primary key',
    asset_type            STRING NOT NULL COMMENT 'catalog | schema | table',
    asset_name             STRING NOT NULL COMMENT 'Fully qualified UC asset name, e.g. ai_governance.use_case_inventory.ai_use_cases',
    data_owner             STRING COMMENT 'Accountable role for this asset — sets policy, answerable for outcomes',
    data_steward           STRING COMMENT 'Operational role — maintains quality, applies classification day to day',
    data_custodian          STRING COMMENT 'Technical role — manages storage, access provisioning, platform controls',
    raci_role               STRING COMMENT 'Responsible | Accountable | Consulted | Informed, for the named role in context',
    classification_level     STRING COMMENT 'public | internal | sensitive | restricted',
    review_frequency         STRING COMMENT 'e.g. quarterly, annually',
    last_reviewed_date       DATE COMMENT 'Date this asset''s stewardship record was last confirmed accurate'
)
USING DELTA
COMMENT 'RACI and ownership over governed data assets — the operating-model layer of data governance, not just the technical catalog';

-- ============================================================
-- Column tagging example — demonstrates Unity Catalog governance
-- (run after tables are populated; syntax may need Free Edition
-- privilege checks — CREATE CATALOG rights are required for tags)
-- ============================================================
-- ALTER TABLE use_case_inventory.ai_use_cases
--   ALTER COLUMN org_name SET TAGS ('sensitivity' = 'attribution_sensitive');
-- ALTER TABLE use_case_inventory.ai_use_cases
--   ALTER COLUMN data_types_used SET TAGS ('sensitivity' = 'pii_adjacent');
