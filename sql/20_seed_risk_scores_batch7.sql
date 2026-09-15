-- ============================================================
-- Seed batch 7 -- risk scores for UC-022
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 19_seed_use_cases_batch7.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
('RS-022-priv', 'UC-022', 'privacy',      2, 'Processes student-submitted assignment text; specific data handling/retention by detection tool vendors not detailed in this source', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-022-sec',  'UC-022', 'security',     2, 'Standard university learning-management-system integration assumed; no specific security detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-022-bias', 'UC-022', 'bias',         4, 'Source explicitly documents that a high AI-detection score can reflect disclosed, legitimate use rather than misconduct -- a genuine, self-acknowledged false-positive/fairness risk in a process that can trigger serious academic consequences for a student', 'disclosed', DATE('2026-09-12')),
('RS-022-reg',  'UC-022', 'regulatory',   2, 'University academic integrity policy and higher education sector regulation (TEQSA-adjacent) applies generally; source notes gaps between policy and practice rather than a specific compliance finding', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-022-rep',  'UC-022', 'reputational', 3, 'Documented gaps between policy and practice across the sector, plus the false-positive risk affecting students directly, carries meaningful reputational exposure for institutions, though no single incident is cited', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-022-ops',  'UC-022', 'operational',  3, 'Reported as sector-wide, applied to the majority of assignments (over 50% flagged) -- a high-volume, high-stakes application directly affecting student academic outcomes', 'disclosed', DATE('2026-09-12'));
