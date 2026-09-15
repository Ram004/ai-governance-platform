-- ============================================================
-- Seed batch 9 -- risk scores for UC-024 to UC-025
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 23_seed_use_cases_batch9.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-024: Medibank AI-assisted support calls + ahm chatbot
('RS-024-priv', 'UC-024', 'privacy',      3, 'Processes customer call and service interaction data at meaningful scale (approaching 50% of support calls) for a health insurer holding sensitive health-adjacent membership data', 'disclosed', DATE('2026-09-12')),
('RS-024-sec',  'UC-024', 'security',     2, 'Standard customer service platform integration; Medibank separately discloses ongoing IT security uplift following its 2022 cybercrime event, though not specifically tied to this AI system', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-024-bias', 'UC-024', 'bias',         2, 'Assists rather than replaces human agents in support interactions; no individual-level high-stakes decisioning disclosed for this specific function', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-024-reg',  'UC-024', 'regulatory',   2, 'Private health insurer subject to APRA prudential standards generally; no AI-specific compliance detail disclosed for this use', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-024-rep',  'UC-024', 'reputational', 3, 'Medibank carries elevated reputational sensitivity generally following its high-profile 2022 cybercrime event and ongoing related litigation, even though this AI function itself has no disclosed incident', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-024-ops',  'UC-024', 'operational',  3, 'Approaching 50% of all customer support calls now AI-assisted -- a high-volume, business-critical customer service function', 'disclosed', DATE('2026-09-12')),

-- UC-025: Medibank proactive speech analytics for vulnerable customers
('RS-025-priv', 'UC-025', 'privacy',      4, 'Analyses call audio to infer vulnerability indicators, a higher-sensitivity inference than standard service data given potential proxies for health, financial distress, or cognitive state', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-025-sec',  'UC-025', 'security',     2, 'No specific access or security control detail disclosed for this system', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-025-bias', 'UC-025', 'bias',         4, 'Vulnerability-detection systems inferring sensitive personal states from voice carry meaningful risk of misclassification across accents, speech patterns, or disabilities; no fairness testing disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-025-reg',  'UC-025', 'regulatory',   3, 'Handling of vulnerable-customer identification intersects general consumer protection and privacy obligations; no specific compliance detail disclosed for this system', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-025-rep',  'UC-025', 'reputational', 3, 'Positioned as a positive customer-protection initiative, though misclassifying a vulnerable customer (false positive or false negative) would carry meaningful reputational risk given the sensitivity of the population involved', 'disclosed', DATE('2026-09-12')),
('RS-025-ops',  'UC-025', 'operational',  2, 'Production, framed as an enhancement to existing customer protection processes rather than a sole determination mechanism', 'disclosed', DATE('2026-09-12'));
