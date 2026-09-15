-- ============================================================
-- Seed batch 8 -- risk scores for UC-023
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 21_seed_use_cases_batch8.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
('RS-023-priv', 'UC-023', 'privacy',      2, 'Early-stage strategy development; no specific personal data processing detail disclosed yet', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-023-sec',  'UC-023', 'security',     1, 'No system deployed yet per this disclosure; strategy/framework development stage only', 'disclosed', DATE('2026-09-12')),
('RS-023-bias', 'UC-023', 'bias',         1, 'Explicit, strong organisational commitment that all dispute resolution decisions remain human-made -- structurally limits automated-decisioning bias risk by design', 'disclosed', DATE('2026-09-12')),
('RS-023-reg',  'UC-023', 'regulatory',   2, 'Explicitly developing AI governance aligned with existing data/information governance policy and ethical standards; still framework-development stage rather than a specific compliance finding', 'disclosed', DATE('2026-09-12')),
('RS-023-rep',  'UC-023', 'reputational', 2, 'As a financial ombudsman reliant on public trust in fair, human-led dispute resolution, any AI governance misstep would carry disproportionate reputational risk, though no incident is disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-023-ops',  'UC-023', 'operational',  3, 'Operationally already affected by ambient external AI use (AI-generated complaints) independent of AFCA''s own deployment -- a rare case of risk context being driven by AI use outside the organisation''s control', 'disclosed', DATE('2026-09-12'));
