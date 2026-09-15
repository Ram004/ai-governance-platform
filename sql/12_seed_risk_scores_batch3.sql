-- ============================================================
-- Seed batch 3 -- risk scores for UC-011 to UC-014
-- ============================================================
-- Applies 00_risk_rubric.md. Run after 11_seed_use_cases_batch3.sql.

USE CATALOG ai_governance;

INSERT INTO risk_assessment.risk_scores VALUES
-- UC-011: DFAT -- internal use, low disclosed detail
('RS-011-priv', 'UC-011', 'privacy',      2, 'Internal document/staff use disclosed; no large-scale personal data processing detailed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-011-sec',  'UC-011', 'security',     2, 'Internal governance and training-gated access disclosed, no autonomous action', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-011-bias', 'UC-011', 'bias',         1, 'No individual-level public decisioning disclosed; internal productivity and service delivery review only', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-011-reg',  'UC-011', 'regulatory',   2, 'Aligns with DTA policy and cross-references guidance from Dept of Industry and CSIRO', 'disclosed', DATE('2026-09-12')),
('RS-011-rep',  'UC-011', 'reputational', 2, 'Internal/corporate use, low public visibility disclosed', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-011-ops',  'UC-011', 'operational',  2, 'Production but described as ongoing review of domains for efficiency, not core mission-critical function', 'inferred_by_assessor', DATE('2026-09-12')),

-- UC-012: AFP official statement -- deliberately redacted capability detail
('RS-012-priv', 'UC-012', 'privacy',      3, 'Law enforcement context implies handling of sensitive personal/biometric data, though the agency explicitly withholds specific capability detail', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-012-sec',  'UC-012', 'security',     3, 'Elevated-access law enforcement context; specific access controls not disclosed by design', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-012-bias', 'UC-012', 'bias',         3, 'Individual-level law enforcement decisioning is plausible given the domain, but AFP does not disclose which specific AI capabilities are in use, limiting assessment precision', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-012-reg',  'UC-012', 'regulatory',   2, 'Explicitly references the Australia New Zealand Responsible and Ethical AI Framework and an internal governance instrument', 'disclosed', DATE('2026-09-12')),
('RS-012-rep',  'UC-012', 'reputational', 4, 'Law enforcement AI carries inherently high public scrutiny; the agency''s own deliberate non-disclosure of capability detail raises transparency concerns independent of any specific incident', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-012-ops',  'UC-012', 'operational',  3, 'Described as production capability with governance frameworks; specific criticality not disclosed', 'inferred_by_assessor', DATE('2026-09-12')),

-- UC-013: AFP Clearview AI -- confirmed regulatory violation
('RS-013-priv', 'UC-013', 'privacy',      5, 'OAIC found Clearview AI breached the Privacy Act by collecting facial images/biometrics without consent -- a documented violation, not an inferred risk', 'disclosed', DATE('2026-09-12')),
('RS-013-sec',  'UC-013', 'security',     3, 'Third-party biometric matching service adopted via informal free trial with reportedly minimal internal control before uptake', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-013-bias', 'UC-013', 'bias',         4, 'Facial recognition systems are well-documented in research literature to carry demographic accuracy disparities; no fairness testing disclosed for this specific deployment', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-013-reg',  'UC-013', 'regulatory',   5, 'OAIC formally found a Privacy Act breach -- the only use case in this inventory with a confirmed regulatory violation rather than an inferred gap', 'disclosed', DATE('2026-09-12')),
('RS-013-rep',  'UC-013', 'reputational', 5, 'Extensive negative media coverage (ABC News investigation); AFP initially denied ties before confirming a trial had occurred', 'disclosed', DATE('2026-09-12')),
('RS-013-ops',  'UC-013', 'operational',  2, 'Reported as an informal free-trial engagement, not a procured production system; use appears discontinued following disclosure', 'disclosed', DATE('2026-09-12')),

-- UC-014: WA Police live facial recognition trial
('RS-014-priv', 'UC-014', 'privacy',      4, 'Live scanning of the public (130,000+ faces reported) against a police watchlist without individual consent', 'disclosed', DATE('2026-09-12')),
('RS-014-sec',  'UC-014', 'security',     3, 'Real-time biometric matching infrastructure; no detail on data retention or access controls disclosed in reporting', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-014-bias', 'UC-014', 'bias',         4, 'A human rights law expert specifically raised unanswered questions about whether the technology was tested on First Nations faces prior to the trial; no fairness testing disclosed by WA Police', 'disclosed', DATE('2026-09-12')),
('RS-014-reg',  'UC-014', 'regulatory',   3, 'Described as an "Australian-first" trial with reported ongoing data collection, but no specific finding of non-compliance disclosed (contrast with UC-013)', 'inferred_by_assessor', DATE('2026-09-12')),
('RS-014-rep',  'UC-014', 'reputational', 4, 'Publicly criticised by privacy experts and legal advocates; explicit lack-of-transparency concerns raised by a named academic', 'disclosed', DATE('2026-09-12')),
('RS-014-ops',  'UC-014', 'operational',  3, 'Pilot stage explicitly, with real disclosed usage statistics (33 alerts, 18 arrests in first week)', 'disclosed', DATE('2026-09-12'));
