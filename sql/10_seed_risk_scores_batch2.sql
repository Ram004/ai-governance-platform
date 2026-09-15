-- ============================================================
-- Seed batch 2 -- risk scores for UC-006 to UC-010
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 09_seed_use_cases_batch2.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-006: Services Australia -- welfare/payments automation, explicit human oversight retained
('RS-006-priv', 'UC-006', 'privacy',      3, 'National-scale payment/customer data touched by automation, but explicit statement AI does not process claims directly', 'disclosed', DATE('2026-09-12')),
('RS-006-sec',  'UC-006', 'security',     2, 'Internal system supporting administrative workflows, no autonomous action disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-006-bias', 'UC-006', 'bias',         3, 'Automation touches administrative decisions and payments at national scale; disparate impact risk plausible given the domain''s history, no fairness testing disclosed either way', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-006-reg',  'UC-006', 'regulatory',   3, 'Explicitly aligns with AI Ethics Principles and the National AI assurance framework; social security law context raises sensitivity', 'disclosed', DATE('2026-09-12')),
('RS-006-rep',  'UC-006', 'reputational', 4, 'Significant prior public scrutiny of automated decision-making in this exact domain, despite current disclosure explicitly excluding AI from claims processing', 'disclosed', DATE('2026-09-12')),
('RS-006-ops',  'UC-006', 'operational',  3, 'Production use in service delivery and payments-adjacent processes, explicit human review retained for actual decisions', 'disclosed', DATE('2026-09-12')),

-- UC-007: ABS -- multiple disclosed AI uses, self-assessed as lower risk
('RS-007-priv', 'UC-007', 'privacy',      3, 'Census and survey data are highly sensitive at national population scale, though ABS self-assesses its AI use as lower potential risk', 'disclosed', DATE('2026-09-12')),
('RS-007-sec',  'UC-007', 'security',     2, 'Internal classification and public chatbot systems, no autonomous action or elevated access disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-007-bias', 'UC-007', 'bias',         2, 'Framed as transparent/traceable classification tasks, self-assessed as lower risk; no individual-level high-stakes decisioning disclosed', 'disclosed', DATE('2026-09-12')),
('RS-007-reg',  'UC-007', 'regulatory',   2, 'Explicit compliance statement citing DTA policy and applicable statistical legislation', 'disclosed', DATE('2026-09-12')),
('RS-007-rep',  'UC-007', 'reputational', 2, 'Public-facing Census chatbot but low-stakes informational function, no incident disclosed', 'disclosed', DATE('2026-09-12')),
('RS-007-ops',  'UC-007', 'operational',  2, 'Production but supporting/automating functions, not core statistical decisioning', 'disclosed', DATE('2026-09-12')),

-- UC-008: ASIC -- domain-level disclosure only, regulator context
('RS-008-priv', 'UC-008', 'privacy',      3, 'Regulator handling significant corporate/financial data; specific AI privacy handling not disclosed at this domain-level statement', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-008-sec',  'UC-008', 'security',     2, 'No specific access or autonomy detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-008-bias', 'UC-008', 'bias',         3, 'Domain-level disclosure only; regulatory decisions could be high-stakes but no specific AI-assisted decisioning detail is disclosed to assess', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-008-reg',  'UC-008', 'regulatory',   2, 'Explicit compliance with DTA policy and mandatory staff training disclosed', 'disclosed', DATE('2026-09-12')),
('RS-008-rep',  'UC-008', 'reputational', 3, 'As a financial regulator, any AI-driven finding would carry high visibility, though no specific use case is disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-008-ops',  'UC-008', 'operational',  2, 'Domain-level disclosure only, no specific production criticality detail given', 'inferred_by_assessor', DATE('2026-09-12')),

-- UC-009: AIC -- genuine low-risk contrast case
('RS-009-priv', 'UC-009', 'privacy',      1, 'AI use explicitly limited to internal research functions, no public-facing or personal-impact use disclosed', 'disclosed', DATE('2026-09-12')),
('RS-009-sec',  'UC-009', 'security',     1, 'No autonomous action or public-facing system disclosed', 'disclosed', DATE('2026-09-12')),
('RS-009-bias', 'UC-009', 'bias',         1, 'Explicitly no individual-level public decisioning; used for internal criminological research only', 'disclosed', DATE('2026-09-12')),
('RS-009-reg',  'UC-009', 'regulatory',   2, 'Compliant with DTA policy, explicitly applies the OECD AI definition in its statement', 'disclosed', DATE('2026-09-12')),
('RS-009-rep',  'UC-009', 'reputational', 1, 'No public-facing element and no incident; explicitly low-visibility internal use', 'disclosed', DATE('2026-09-12')),
('RS-009-ops',  'UC-009', 'operational',  1, 'Internal research support only, explicitly not for decision-making impacting the public', 'disclosed', DATE('2026-09-12')),

-- UC-010: Dept of Industry, Science and Resources -- internal tool use, AI Safety Institute context
('RS-010-priv', 'UC-010', 'privacy',      1, 'Internal tool and document use only, no personal data at scale disclosed', 'disclosed', DATE('2026-09-12')),
('RS-010-sec',  'UC-010', 'security',     2, 'Internal AI Governance Committee oversight disclosed, no autonomous action', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-010-bias', 'UC-010', 'bias',         1, 'Staff explicitly required to treat all AI outputs as drafts, not for decision-making -- no automated decisioning disclosed', 'disclosed', DATE('2026-09-12')),
('RS-010-reg',  'UC-010', 'regulatory',   2, 'Explicitly aligns with the Voluntary AI Safety Standard in addition to the mandatory DTA policy', 'disclosed', DATE('2026-09-12')),
('RS-010-rep',  'UC-010', 'reputational', 2, 'Department is also responsible for the Australian AI Safety Institute, raising visibility around its own AI governance practice', 'disclosed', DATE('2026-09-12')),
('RS-010-ops',  'UC-010', 'operational',  2, 'Production internal tool use with explicit human-review control disclosed', 'disclosed', DATE('2026-09-12'));
