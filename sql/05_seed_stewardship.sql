-- ============================================================
-- Seed batch 1 — data stewardship / RACI over the platform's own assets
-- ============================================================
-- Run after 01_create_schema.sql. Solo-project note: owner, steward and
-- custodian are all Ram for now — in a real org these would be distinct
-- people, which is itself worth explaining in interviews.

USE CATALOG ai_governance;

INSERT INTO stewardship.data_stewardship VALUES
('ST-001', 'schema', 'ai_governance.use_case_inventory', 'Ram', 'Ram', 'Ram', 'Accountable', 'internal', 'quarterly', DATE('2026-09-10')),
('ST-002', 'schema', 'ai_governance.risk_assessment',    'Ram', 'Ram', 'Ram', 'Accountable', 'sensitive', 'quarterly', DATE('2026-09-10')),
('ST-003', 'schema', 'ai_governance.controls',            'Ram', 'Ram', 'Ram', 'Accountable', 'internal', 'annually', DATE('2026-09-10')),
('ST-004', 'schema', 'ai_governance.risk_register',       'Ram', 'Ram', 'Ram', 'Accountable', 'sensitive', 'quarterly', DATE('2026-09-10')),
('ST-005', 'schema', 'ai_governance.readiness',           'Ram', 'Ram', 'Ram', 'Accountable', 'internal', 'annually', DATE('2026-09-10')),
('ST-006', 'schema', 'ai_governance.stewardship',         'Ram', 'Ram', 'Ram', 'Accountable', 'internal', 'annually', DATE('2026-09-10'));
