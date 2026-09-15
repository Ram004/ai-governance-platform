-- ============================================================
-- Seed batch 1 — risk scores for UC-001 through UC-005
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 02_seed_use_cases.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-001: DTA / procurement panel application assessment — real decision-support use case, external probity review disclosed
('RS-001-priv', 'UC-001', 'privacy',      2, 'Applicant submission data used within a defined assessment process, no sensitive personal data category disclosed', 'inferred_by_assessor', DATE('2026-09-11')),
('RS-001-sec',  'UC-001', 'security',     2, 'Internal system supporting a defined administrative process, no autonomous action -- recommendations go to a human decision maker', 'disclosed', DATE('2026-09-11')),
('RS-001-bias', 'UC-001', 'bias',         3, 'Individual-level decisioning (panel application assessment) at moderate stakes, with disclosed external probity/technical review providing some fairness safeguard', 'disclosed', DATE('2026-09-11')),
('RS-001-reg',  'UC-001', 'regulatory',   2, 'Falls under the AI assurance framework with disclosed external probity/technical advice, plus general DTA policy coverage', 'disclosed', DATE('2026-09-11')),
('RS-001-rep',  'UC-001', 'reputational', 2, 'Procurement decision-support is moderate visibility; external probity advice was disclosed specifically to manage this risk', 'disclosed', DATE('2026-09-11')),
('RS-001-ops',  'UC-001', 'operational',  2, 'Production, assists but does not replace the human decision maker, moderate criticality to the procurement process', 'disclosed', DATE('2026-09-11')),

-- UC-002: DSS — domain-level disclosure only, several plausible use domains including service delivery
('RS-002-priv', 'UC-002', 'privacy',      3, 'Service delivery domain likely involves personal data; consent basis not stated at this disclosure level', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-002-sec',  'UC-002', 'security',     2, 'No autonomous action or elevated access disclosed', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-002-bias', 'UC-002', 'bias',         3, 'Service delivery domain could include individual-level decisioning; not confirmed at this disclosure level', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-002-reg',  'UC-002', 'regulatory',   3, 'Sector-relevant (social services) with compliance to DTA policy and APS AI Plan disclosed', 'disclosed', DATE('2026-09-10')),
('RS-002-rep',  'UC-002', 'reputational', 3, 'Public-facing service delivery agency, moderate visibility, no incident disclosed', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-002-ops',  'UC-002', 'operational',  2, 'Production, domain-level only, no autonomy or critical dependency disclosed', 'inferred_by_assessor', DATE('2026-09-10')),

-- UC-003: ATO — classical ML risk differentiation over taxpayer data, human oversight stated
('RS-003-priv', 'UC-003', 'privacy',      4, 'Taxpayer financial data at scale, sensitive category, oversight stated but consent basis is statutory not opt-in', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-003-sec',  'UC-003', 'security',     3, 'Internal system with elevated access to compliance/risk data', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-003-bias', 'UC-003', 'bias',         4, 'High-stakes compliance/audit decisioning on individual taxpayers, fairness testing not disclosed', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-003-reg',  'UC-003', 'regulatory',   3, 'Sector-specific (taxation) with compliance posture explicitly disclosed, CDO as Accountable Official', 'disclosed', DATE('2026-09-10')),
('RS-003-rep',  'UC-003', 'reputational', 3, 'Public-facing government function, moderate scrutiny plausible given enforcement context', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-003-ops',  'UC-003', 'operational',  3, 'Production, moderately critical to compliance operations, human oversight stated as always maintained', 'disclosed', DATE('2026-09-10')),

-- UC-004: CBA fraud/scam detection — hybrid predictive + genAI, vendor-reported outcomes
('RS-004-priv', 'UC-004', 'privacy',      4, 'Transaction and behavioural data at scale across all banking channels, consent basis not detailed by vendor', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-004-sec',  'UC-004', 'security',     3, 'Elevated access across multiple channels, real-time action (push alerts) but not autonomous fund movement', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-004-bias', 'UC-004', 'bias',         3, 'Individual-level flagging with moderate stakes (transaction friction), no fairness testing disclosed by vendor', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-004-reg',  'UC-004', 'regulatory',   3, 'Sector-specific financial services regulation applies, compliance not directly addressed in vendor case study', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-004-rep',  'UC-004', 'reputational', 2, 'Public-facing but positively framed outcome reported, no incident tied to this specific system', 'disclosed', DATE('2026-09-10')),
('RS-004-ops',  'UC-004', 'operational',  3, 'Production, business-critical fraud function, real-time but with customer-facing alert step not full automation', 'inferred_by_assessor', DATE('2026-09-10')),

-- UC-005: Cross-bank BioCatch pilot — classical ML, still in pilot, false positives disclosed
('RS-005-priv', 'UC-005', 'privacy',      3, 'Transaction and device/session data shared across a bank consortium network', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-005-sec',  'UC-005', 'security',     3, 'Cross-institution intelligence sharing network, elevated access by design', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-005-bias', 'UC-005', 'bias',         3, 'Individual account-level flagging, false positives explicitly acknowledged by banks during pilot', 'disclosed', DATE('2026-09-10')),
('RS-005-reg',  'UC-005', 'regulatory',   3, 'Financial services sector regulation applies to a multi-bank shared system', 'inferred_by_assessor', DATE('2026-09-10')),
('RS-005-rep',  'UC-005', 'reputational', 2, 'Still in pilot, publicly reported with an honest limitation disclosed rather than an incident', 'disclosed', DATE('2026-09-10')),
('RS-005-ops',  'UC-005', 'operational',  2, 'Pilot only, not yet production-critical, banks explicitly describe still learning to use the capability', 'disclosed', DATE('2026-09-10'));
