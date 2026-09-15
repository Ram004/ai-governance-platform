-- ============================================================
-- Map the 12 NIST AI RMF controls (CTRL-101 to CTRL-112) to
-- UC-001 through UC-005, matching the same use cases already
-- covered by the 8 ISO controls in 07_seed_governance_data.sql.
-- ============================================================
-- Run after 04_seed_controls.sql and 02_seed_use_cases.sql.
-- Brings use_case_controls to 20 controls x 5 use cases = 100 rows.

USE CATALOG ai_governance;

INSERT INTO controls.use_case_controls VALUES
-- UC-001: DTA procurement panel assessment -- external probity review disclosed
('UC-001', 'CTRL-101', 'implemented',     'Two named accountable officials disclosed for this specific use case'),
('UC-001', 'CTRL-102', 'partial',         'General DTA AI policy applies; no use-case-specific written risk policy disclosed'),
('UC-001', 'CTRL-103', 'not_implemented', 'No disclosed risk tolerance statement for this specific use case'),
('UC-001', 'CTRL-104', 'implemented',     'Purpose and context (panel application assessment) explicitly documented in the transparency statement'),
('UC-001', 'CTRL-105', 'partial',         'Applicants are the implied affected group; not formally documented as a stakeholder mapping exercise'),
('UC-001', 'CTRL-106', 'implemented',     'External probity, privacy, and technical advice functions as risk categorisation and review'),
('UC-001', 'CTRL-107', 'not_implemented', 'No performance metrics disclosed'),
('UC-001', 'CTRL-108', 'not_implemented', 'No fairness/bias testing disclosed'),
('UC-001', 'CTRL-109', 'partial',         'Human decision maker retains final say, functioning as a partial explainability safeguard'),
('UC-001', 'CTRL-110', 'not_implemented', 'No defined review cadence disclosed'),
('UC-001', 'CTRL-111', 'not_implemented', 'No incident response process disclosed'),
('UC-001', 'CTRL-112', 'implemented',     'Explicitly assists, does not replace, the human decision maker'),

-- UC-002: DSS -- domain-level disclosure only, weakest control evidence
('UC-002', 'CTRL-101', 'not_implemented', 'No case-specific accountable role disclosed'),
('UC-002', 'CTRL-102', 'partial',         'Governed under DTA policy and APS AI Plan generally'),
('UC-002', 'CTRL-103', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-104', 'partial',         'Domain scope named (service delivery, policy/legal, corporate) but not specific use context'),
('UC-002', 'CTRL-105', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-106', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-107', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-108', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-109', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-110', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-111', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-112', 'not_implemented', 'Not disclosed at this domain-level statement'),

-- UC-003: ATO -- strongest disclosed oversight of the government cases
('UC-003', 'CTRL-101', 'implemented',     'Chief Data Officer explicitly named as AI Accountable Official'),
('UC-003', 'CTRL-102', 'implemented',     'Explicit AI policy referencing OECD definition and DTA framework'),
('UC-003', 'CTRL-103', 'not_implemented', 'No specific risk tolerance statement disclosed'),
('UC-003', 'CTRL-104', 'implemented',     'Purpose (tax/super compliance risk differentiation) explicitly documented'),
('UC-003', 'CTRL-105', 'partial',         'Taxpayers are the implied affected group; not formally documented as stakeholder mapping'),
('UC-003', 'CTRL-106', 'partial',         'General compliance framework implies risk categorisation; no case-specific document disclosed'),
('UC-003', 'CTRL-107', 'not_implemented', 'No performance metrics disclosed'),
('UC-003', 'CTRL-108', 'not_implemented', 'No fairness testing disclosed for the risk differentiation approach'),
('UC-003', 'CTRL-109', 'partial',         'Human oversight stated as always maintained, a partial explainability safeguard'),
('UC-003', 'CTRL-110', 'not_implemented', 'No defined review cadence disclosed'),
('UC-003', 'CTRL-111', 'not_implemented', 'No incident response process disclosed'),
('UC-003', 'CTRL-112', 'implemented',     'Human oversight explicitly stated as always maintained'),

-- UC-004: CBA fraud/scam detection -- vendor case study, marketing framing
('UC-004', 'CTRL-101', 'not_implemented', 'No accountable role disclosed in the vendor case study'),
('UC-004', 'CTRL-102', 'not_implemented', 'No bank-side AI policy referenced'),
('UC-004', 'CTRL-103', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-104', 'partial',         'Purpose (fraud/scam detection) is clear; formal documentation not disclosed'),
('UC-004', 'CTRL-105', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-106', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-107', 'partial',         'Reduction in scam losses cited as an outcome metric, though not framed as an ongoing tracked metric'),
('UC-004', 'CTRL-108', 'not_implemented', 'No fairness testing disclosed'),
('UC-004', 'CTRL-109', 'not_implemented', 'No explainability mechanism disclosed'),
('UC-004', 'CTRL-110', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-111', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-112', 'partial',         'Customer-facing alert step implies some human/customer checkpoint, not full autonomy'),

-- UC-005: cross-bank BioCatch pilot -- honest about limitations, still pilot stage
('UC-005', 'CTRL-101', 'not_implemented', 'No accountable role disclosed across the consortium'),
('UC-005', 'CTRL-102', 'not_implemented', 'No consortium-level AI policy referenced'),
('UC-005', 'CTRL-103', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-104', 'partial',         'Purpose (suspicious account flagging) is clear from reporting'),
('UC-005', 'CTRL-105', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-106', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-107', 'implemented',     'False positives explicitly measured and disclosed during the pilot'),
('UC-005', 'CTRL-108', 'partial',         'False positive disclosure implies some fairness-adjacent monitoring, though not framed as formal bias testing'),
('UC-005', 'CTRL-109', 'not_implemented', 'No explainability mechanism disclosed'),
('UC-005', 'CTRL-110', 'implemented',     'Banks explicitly described as still learning to use and refine the capability'),
('UC-005', 'CTRL-111', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-112', 'partial',         'Pilot framing implies human oversight of results, not formally documented');
