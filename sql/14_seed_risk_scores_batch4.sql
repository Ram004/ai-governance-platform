-- ============================================================
-- Seed batch 4 -- risk scores for UC-015 to UC-017
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 13_seed_use_cases_batch4.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-015: Telstra Ask Telstra / One Sentence Summary -- internal agent-assist
('RS-015-priv', 'UC-015', 'privacy',      2, 'Internal staff/customer-service interaction data, used to assist not replace human agents', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-015-sec',  'UC-015', 'security',     2, 'Internal agent-facing tool via Azure OpenAI Service, standard enterprise access controls assumed, not confirmed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-015-bias', 'UC-015', 'bias',         1, 'Assists human agents rather than making decisions about customers directly; no individual-level automated decisioning disclosed', 'disclosed', DATE('2026-09-12')),
('RS-015-reg',  'UC-015', 'regulatory',   2, 'Telecommunications sector regulation (ACMA) would apply generally; no specific compliance detail disclosed in this vendor case study', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-015-rep',  'UC-015', 'reputational', 2, 'Internal tool with positive vendor-reported adoption metrics, no incident disclosed', 'disclosed', DATE('2026-09-12')),
('RS-015-ops',  'UC-015', 'operational',  2, 'Production, agent-assist function, human remains primary customer interaction point', 'disclosed', DATE('2026-09-12')),

-- UC-016: Telstra SmartFix -- autonomous network remediation, highest operational risk in the inventory
('RS-016-priv', 'UC-016', 'privacy',      1, 'Network telemetry data, not customer personal information, is the primary disclosed input', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-016-sec',  'UC-016', 'security',     3, 'System explicitly takes autonomous corrective action on network infrastructure at scale (2.5M actions/year) -- elevated risk profile by design', 'disclosed', DATE('2026-09-12')),
('RS-016-bias', 'UC-016', 'bias',         1, 'No individual-level decisioning about customers; network-level technical remediation only', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-016-reg',  'UC-016', 'regulatory',   2, 'Telecommunications infrastructure regulation (ACMA) would apply generally; no specific compliance detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-016-rep',  'UC-016', 'reputational', 2, 'Positively framed outcome (calls prevented), no incident disclosed, though autonomous network action carries latent risk if it were to misfire', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-016-ops',  'UC-016', 'operational',  4, 'Autonomous action taken at very large scale (2.5 million actions/year) directly on production network infrastructure, with no human-in-loop or fallback confirmed in disclosure', 'disclosed', DATE('2026-09-12')),

-- UC-017: Telstra Assistant -- first public-facing consumer chatbot in the inventory
('RS-017-priv', 'UC-017', 'privacy',      2, 'Customer query data processed by a public-facing chatbot; specific data handling/retention not detailed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-017-sec',  'UC-017', 'security',     2, 'Public-facing system increases attack surface (e.g. prompt injection exposure) relative to an internal-only tool; no specific security detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-017-bias', 'UC-017', 'bias',         1, 'Answers customer queries; no individual-level decisioning about creditworthiness, eligibility, or similar high-stakes outcomes disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-017-reg',  'UC-017', 'regulatory',   2, 'Telecommunications consumer protection and ACMA-adjacent obligations apply generally; no specific compliance detail disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-017-rep',  'UC-017', 'reputational', 3, 'Public-facing consumer chatbot carries higher visibility than an internal tool; errors are directly customer-visible rather than filtered through a human agent first', 'disclosed', DATE('2026-09-12')),
('RS-017-ops',  'UC-017', 'operational',  2, 'Production, escalation path to a human implied when the chatbot cannot resolve a query', 'disclosed', DATE('2026-09-12'));
