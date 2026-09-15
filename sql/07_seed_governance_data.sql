-- ============================================================
-- Seed batch 2 -- complete the governance picture for UC-001..005
-- ============================================================
-- Run after 02_seed_use_cases.sql and 04_seed_controls.sql.
-- Populates: controls.use_case_controls, risk_register.risks,
-- readiness.iso42001_maturity -- closing the loop on the five
-- cases already in the inventory before scaling to more.

USE CATALOG ai_governance;

-- ------------------------------------------------------------
-- controls.use_case_controls -- which of the 8 controls apply,
-- and their implementation status per use case
-- ------------------------------------------------------------
INSERT INTO controls.use_case_controls VALUES
-- UC-001: DTA / procurement panel application assessment -- real decision-support use case with disclosed external probity review
('UC-001', 'CTRL-001', 'implemented',     'DTA is the policy owner of the AI transparency standard itself'),
('UC-001', 'CTRL-002', 'implemented',     'DTA explicitly named as accountable for AI policy across government, plus two named accountable officials for this use case'),
('UC-001', 'CTRL-003', 'implemented',     'External probity, privacy and technical advice disclosed as part of implementation -- functions as a pre-deployment impact assessment'),
('UC-001', 'CTRL-004', 'partial',         'Described as a current production use case; no formal stage-gate detail disclosed'),
('UC-001', 'CTRL-005', 'not_implemented', 'No lineage detail disclosed at this level'),
('UC-001', 'CTRL-006', 'partial',         'Transparency statement functions as a use-case-level disclosure, but not a full model card'),
('UC-001', 'CTRL-007', 'implemented',     'Explicitly scoped to assisting, not replacing, the human decision maker on panel applications'),
('UC-001', 'CTRL-008', 'not_applicable',  'No third-party AI vendor named for this specific use case'),

-- UC-002: DSS -- domain-level only, least governance detail disclosed
('UC-002', 'CTRL-001', 'implemented',     'Governed under DTA policy and the APS AI Plan, both named'),
('UC-002', 'CTRL-002', 'not_implemented', 'No case-specific accountable role disclosed'),
('UC-002', 'CTRL-003', 'not_implemented', 'Not disclosed at domain-level statement'),
('UC-002', 'CTRL-004', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-005', 'not_implemented', 'Not disclosed'),
('UC-002', 'CTRL-006', 'not_implemented', 'No use-case-level artefact published'),
('UC-002', 'CTRL-007', 'partial',         'Domain scope stated (service delivery, policy/legal, corporate) but not restrictions within it'),
('UC-002', 'CTRL-008', 'not_applicable',  'No specific vendor named at this disclosure level'),

-- UC-003: ATO -- strongest disclosed oversight statement of the government cases
('UC-003', 'CTRL-001', 'implemented',     'Explicit AI policy referencing OECD definition and DTA framework'),
('UC-003', 'CTRL-002', 'implemented',     'Chief Data Officer explicitly named as AI Accountable Official'),
('UC-003', 'CTRL-003', 'partial',         'General compliance framework implies assessment, no case-specific document disclosed'),
('UC-003', 'CTRL-004', 'not_implemented', 'No lifecycle-stage detail disclosed'),
('UC-003', 'CTRL-005', 'not_implemented', 'No lineage detail disclosed'),
('UC-003', 'CTRL-006', 'not_implemented', 'No model-card-equivalent published for the risk differentiation approach specifically'),
('UC-003', 'CTRL-007', 'implemented',     'Scope explicitly limited to tax/super compliance risk differentiation, human oversight stated as always maintained'),
('UC-003', 'CTRL-008', 'not_applicable',  'No third-party vendor named -- appears internally developed'),

-- UC-004: CBA fraud/scam detection -- vendor case study, marketing framing
('UC-004', 'CTRL-001', 'not_implemented', 'No bank-side AI policy referenced in the vendor case study'),
('UC-004', 'CTRL-002', 'not_implemented', 'No accountable role disclosed'),
('UC-004', 'CTRL-003', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-004', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-005', 'not_implemented', 'Not disclosed'),
('UC-004', 'CTRL-006', 'not_implemented', 'No model card equivalent published'),
('UC-004', 'CTRL-007', 'partial',         'Intended use (fraud/scam detection) is clear from the case study, restrictions are not'),
('UC-004', 'CTRL-008', 'implemented',     'H2O.ai explicitly named as the vendor/technology provider'),

-- UC-005: cross-bank BioCatch pilot -- honest about limitations, still weak on formal governance disclosure
('UC-005', 'CTRL-001', 'not_implemented', 'No consortium-level AI policy referenced in reporting'),
('UC-005', 'CTRL-002', 'not_implemented', 'No accountable role disclosed'),
('UC-005', 'CTRL-003', 'partial',         'Pilot framing itself functions as an informal impact assessment stage'),
('UC-005', 'CTRL-004', 'implemented',     'Explicitly disclosed as a pilot stage, not yet production'),
('UC-005', 'CTRL-005', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-006', 'not_implemented', 'Not disclosed'),
('UC-005', 'CTRL-007', 'partial',         'Intended use (suspicious account flagging) is clear, formal restrictions are not'),
('UC-005', 'CTRL-008', 'implemented',     'BioCatch explicitly named as the technology provider');

-- ------------------------------------------------------------
-- risk_register.risks -- one representative risk per use case
-- ------------------------------------------------------------
INSERT INTO risk_register.risks VALUES
('RISK-001', 'UC-001', 'bias',
 'Applicants may not know their submission is partly assessed by AI, and disclosed fairness safeguards (external probity/technical review) have not been independently verified',
 'Medium', 'Independent post-implementation review of assessment consistency across applicant segments; ongoing human decision-maker sign-off', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-002', 'UC-002', 'regulatory',
 'Domain-level disclosure limits external ability to verify whether individual use cases within Service Delivery meet stated compliance obligations',
 'Medium', 'Request use-case-level disclosure or cross-reference against ANAO audit findings when published', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-003', 'UC-003', 'bias',
 'High-stakes tax/superannuation compliance risk-scoring on individual taxpayers without disclosed fairness testing creates disparate-impact risk across taxpayer segments',
 'High', 'Independent fairness audit of the risk differentiation approach; documented human review at the point of final compliance decision', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-004', 'UC-004', 'privacy',
 'Large-scale transaction and behavioural data processing across all banking channels, with fraud-reduction outcomes reported by the bank/vendor and not independently verified',
 'High', 'Independent third-party or regulator verification of detection accuracy and data handling claims', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-005', 'UC-005', 'bias',
 'False positives explicitly acknowledged during the pilot may disproportionately affect customers with newly opened, legitimate accounts',
 'Medium', 'Threshold refinement before production, clear appeal/review pathway for flagged legitimate accounts', 'Low',
 'N/A - public case study', DATE('2027-03-01'));

-- ------------------------------------------------------------
-- readiness.iso42001_maturity -- 4 domains x 5 use cases = 20 rows
-- ------------------------------------------------------------
INSERT INTO readiness.iso42001_maturity VALUES
-- UC-001: DTA -- strongest disclosed oversight of the government cases (external probity review, named officials)
('MAT-001-L', 'UC-001', 'leadership',             3, 'DTA is explicitly the policy owner and accountable body, with two named accountable officials for this use case', DATE('2026-09-11')),
('MAT-001-R', 'UC-001', 'risk_management',        3, 'External probity, privacy and technical advice disclosed as part of implementing this specific use case', DATE('2026-09-11')),
('MAT-001-M', 'UC-001', 'monitoring',             2, 'Described as ongoing production use, no explicit post-deployment monitoring detail disclosed', DATE('2026-09-11')),
('MAT-001-C', 'UC-001', 'continuous_improvement', 2, 'Transparency statement itself updated 17 Jun 2026, showing active iteration', DATE('2026-09-11')),

-- UC-002: DSS -- weakest disclosure of the government cases
('MAT-002-L', 'UC-002', 'leadership',             2, 'Governed under DTA/APS frameworks but no agency-specific accountable role named', DATE('2026-09-10')),
('MAT-002-R', 'UC-002', 'risk_management',        1, 'No case-specific risk process disclosed', DATE('2026-09-10')),
('MAT-002-M', 'UC-002', 'monitoring',             1, 'No monitoring detail disclosed', DATE('2026-09-10')),
('MAT-002-C', 'UC-002', 'continuous_improvement', 1, 'No iteration or review cycle disclosed', DATE('2026-09-10')),

-- UC-003: ATO -- strongest disclosed oversight of the government cases
('MAT-003-L', 'UC-003', 'leadership',             3, 'Chief Data Officer explicitly named as AI Accountable Official', DATE('2026-09-10')),
('MAT-003-R', 'UC-003', 'risk_management',        2, 'Risk differentiation is itself a risk-management tool, but no disclosed AI-specific risk process around its own use', DATE('2026-09-10')),
('MAT-003-M', 'UC-003', 'monitoring',             2, 'Human oversight stated as always maintained, implying some ongoing review, detail not disclosed', DATE('2026-09-10')),
('MAT-003-C', 'UC-003', 'continuous_improvement', 1, 'No iteration or review cycle disclosed for this approach specifically', DATE('2026-09-10')),

-- UC-004: CBA -- vendor case study, marketing framing, weakest governance disclosure overall
('MAT-004-L', 'UC-004', 'leadership',             1, 'No governance roles disclosed in the vendor-authored case study', DATE('2026-09-10')),
('MAT-004-R', 'UC-004', 'risk_management',        1, 'No risk process disclosed', DATE('2026-09-10')),
('MAT-004-M', 'UC-004', 'monitoring',             2, 'Real-time detection claim implies monitoring infrastructure exists, detail not disclosed', DATE('2026-09-10')),
('MAT-004-C', 'UC-004', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-10')),

-- UC-005: BioCatch pilot -- least mature but most honest about limitations
('MAT-005-L', 'UC-005', 'leadership',             1, 'No named accountable role across the consortium disclosed', DATE('2026-09-10')),
('MAT-005-R', 'UC-005', 'risk_management',        1, 'No formal risk process disclosed beyond the pilot framing itself', DATE('2026-09-10')),
('MAT-005-M', 'UC-005', 'monitoring',             2, 'False positives explicitly monitored and disclosed during the pilot', DATE('2026-09-10')),
('MAT-005-C', 'UC-005', 'continuous_improvement', 2, 'Banks explicitly described as still learning to use the capability -- active iteration disclosed', DATE('2026-09-10'));
