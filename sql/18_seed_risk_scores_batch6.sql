-- ============================================================
-- Seed batch 6 -- risk scores for UC-020 to UC-021
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 17_seed_use_cases_batch6.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-020: Suncorp SunGPT / Single View of Claim -- staff decision-support
('RS-020-priv', 'UC-020', 'privacy',      3, 'Consolidates customer communications and case notes at claims-staff scale; specific data handling/retention not detailed in this secondary reporting', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-020-sec',  'UC-020', 'security',     2, 'Internal Databricks-based platform with staff access; no specific security control detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-020-bias', 'UC-020', 'bias',         2, 'Assists staff with claims summarisation and next-step recommendations rather than making the final claims decision itself; no individual-level automated decisioning disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-020-reg',  'UC-020', 'regulatory',   2, 'Insurance sector regulation (APRA/ASIC-adjacent) applies generally; no specific compliance detail disclosed for this tool', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-020-rep',  'UC-020', 'reputational', 1, 'Publicly recognised with an industry ethics/responsibility award, positively framed with no incident disclosed', 'disclosed', DATE('2026-09-12')),
('RS-020-ops',  'UC-020', 'operational',  2, 'Production, decision-support role for ~1,500 staff, not a fully autonomous claims determination', 'disclosed', DATE('2026-09-12')),

-- UC-021: Suncorp automated cyclone claims -- confirmed zero manual intervention
('RS-021-priv', 'UC-021', 'privacy',      3, 'Processes customer claims data for insurance payout determination at meaningful scale (7,000+ claims cited); specific handling not detailed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-021-sec',  'UC-021', 'security',     2, 'No specific access or security detail disclosed for the automated processing pipeline', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-021-bias', 'UC-021', 'bias',         4, 'Fully automated claims determination (explicitly "zero manual intervention") with no disclosed fairness or error-rate testing -- higher risk than a human-reviewed process since no human check exists to catch a wrongful denial or miscalculation', 'disclosed', DATE('2026-09-12')),
('RS-021-reg',  'UC-021', 'regulatory',   3, 'Insurance claims determination is a regulated activity; no specific compliance detail disclosed for this fully-automated pathway', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-021-rep',  'UC-021', 'reputational', 2, 'Positively framed as a customer-service win by the CEO following a natural disaster, no incident disclosed', 'disclosed', DATE('2026-09-12')),
('RS-021-ops',  'UC-021', 'operational',  4, 'Explicitly fully autonomous claims processing at meaningful scale (7,000+ claims) with confirmed zero manual intervention -- among the highest operational-risk scores in the inventory given genuine end-to-end automation of a customer-impacting financial decision', 'disclosed', DATE('2026-09-12'));
