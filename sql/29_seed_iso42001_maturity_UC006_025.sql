-- ============================================================
-- ISO 42001 maturity scores for UC-006 through UC-025
-- ============================================================
-- 20 use cases x 4 domains = 80 rows. Calibrated against the
-- original UC-001-005 scores (0=absent to 4=optimised) and
-- cross-checked against use_case_controls and risk_scores for the
-- same use cases, so the three tables tell a consistent story.
-- Run after all use-case batches are seeded.

USE CATALOG ai_governance;

INSERT INTO readiness.iso42001_maturity VALUES
-- UC-006: Services Australia
('MAT-006-L', 'UC-006', 'leadership',             2, 'Domains disclosed and general policy alignment stated, no named accountable executive for this specific use', DATE('2026-09-14')),
('MAT-006-R', 'UC-006', 'risk_management',        1, 'No case-specific risk process disclosed beyond general policy reference', DATE('2026-09-14')),
('MAT-006-M', 'UC-006', 'monitoring',             1, 'No ongoing monitoring detail disclosed', DATE('2026-09-14')),
('MAT-006-C', 'UC-006', 'continuous_improvement', 1, 'No iteration or review cycle disclosed', DATE('2026-09-14')),

-- UC-007: ABS
('MAT-007-L', 'UC-007', 'leadership',             2, 'Self-assessment of lower risk implies some governance awareness, no accountable executive named', DATE('2026-09-14')),
('MAT-007-R', 'UC-007', 'risk_management',        2, 'Self-assessment functions as an informal risk categorisation exercise', DATE('2026-09-14')),
('MAT-007-M', 'UC-007', 'monitoring',             1, 'No ongoing monitoring metrics disclosed beyond the self-assessment', DATE('2026-09-14')),
('MAT-007-C', 'UC-007', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-008: ASIC -- weakest disclosure, matches its 0% control coverage
('MAT-008-L', 'UC-008', 'leadership',             1, 'Only staff training disclosed, no accountable role named', DATE('2026-09-14')),
('MAT-008-R', 'UC-008', 'risk_management',        1, 'No risk process disclosed beyond general compliance statement', DATE('2026-09-14')),
('MAT-008-M', 'UC-008', 'monitoring',             0, 'No monitoring detail disclosed at all', DATE('2026-09-14')),
('MAT-008-C', 'UC-008', 'continuous_improvement', 0, 'No iteration or review disclosed', DATE('2026-09-14')),

-- UC-009: AIC -- low-risk contrast case, explicit scope statement
('MAT-009-L', 'UC-009', 'leadership',             2, 'Explicit OECD-definition-based policy statement, no named executive', DATE('2026-09-14')),
('MAT-009-R', 'UC-009', 'risk_management',        2, 'Explicit scope restriction to internal research functions as a de facto risk control', DATE('2026-09-14')),
('MAT-009-M', 'UC-009', 'monitoring',             1, 'No ongoing monitoring detail disclosed', DATE('2026-09-14')),
('MAT-009-C', 'UC-009', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-010: Dept of Industry, Science and Resources -- AI Safety Institute context
('MAT-010-L', 'UC-010', 'leadership',             3, 'AI Governance Committee explicitly disclosed as the accountable structure', DATE('2026-09-14')),
('MAT-010-R', 'UC-010', 'risk_management',        2, 'Alignment with the Voluntary AI Safety Standard disclosed, no case-specific process detailed', DATE('2026-09-14')),
('MAT-010-M', 'UC-010', 'monitoring',             1, 'No ongoing monitoring metrics disclosed', DATE('2026-09-14')),
('MAT-010-C', 'UC-010', 'continuous_improvement', 2, 'Department actively administers the evolving AI Safety Institute and standard, implying active iteration', DATE('2026-09-14')),

-- UC-011: DFAT
('MAT-011-L', 'UC-011', 'leadership',             1, 'References cross-agency guidance (DTA, Industry, CSIRO) rather than a DFAT-specific accountable role', DATE('2026-09-14')),
('MAT-011-R', 'UC-011', 'risk_management',        1, 'No case-specific risk process disclosed', DATE('2026-09-14')),
('MAT-011-M', 'UC-011', 'monitoring',             1, 'Monitoring effectiveness disclosed as a general governance activity', DATE('2026-09-14')),
('MAT-011-C', 'UC-011', 'continuous_improvement', 1, 'No specific iteration cycle disclosed', DATE('2026-09-14')),

-- UC-012: AFP official statement -- deliberately redacted
('MAT-012-L', 'UC-012', 'leadership',             1, 'Capability detail explicitly withheld, limiting assessment of leadership structure', DATE('2026-09-14')),
('MAT-012-R', 'UC-012', 'risk_management',        2, 'Internal National Guideline governance instrument explicitly referenced', DATE('2026-09-14')),
('MAT-012-M', 'UC-012', 'monitoring',             0, 'No monitoring detail disclosed by design', DATE('2026-09-14')),
('MAT-012-C', 'UC-012', 'continuous_improvement', 0, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-013: AFP Clearview AI -- confirmed regulatory violation
('MAT-013-L', 'UC-013', 'leadership',             0, 'No accountable role disclosed at the time of the informal trial', DATE('2026-09-14')),
('MAT-013-R', 'UC-013', 'risk_management',        0, 'No risk process applied before the trial began, per OAIC findings', DATE('2026-09-14')),
('MAT-013-M', 'UC-013', 'monitoring',             0, 'No monitoring in place before public disclosure forced scrutiny', DATE('2026-09-14')),
('MAT-013-C', 'UC-013', 'continuous_improvement', 1, 'Trial was discontinued following disclosure -- a reactive, not proactive, improvement', DATE('2026-09-14')),

-- UC-014: WA Police live facial recognition trial
('MAT-014-L', 'UC-014', 'leadership',             0, 'No accountable role disclosed in reporting', DATE('2026-09-14')),
('MAT-014-R', 'UC-014', 'risk_management',        0, 'No risk management process referenced', DATE('2026-09-14')),
('MAT-014-M', 'UC-014', 'monitoring',             1, 'Real usage statistics (alerts, arrests) disclosed during the pilot', DATE('2026-09-14')),
('MAT-014-C', 'UC-014', 'continuous_improvement', 0, 'No response to the raised First Nations testing question disclosed', DATE('2026-09-14')),

-- UC-015: Telstra AskTelstra / One Sentence Summary
('MAT-015-L', 'UC-015', 'leadership',             1, 'No Telstra-specific governance role disclosed in the vendor case study', DATE('2026-09-14')),
('MAT-015-R', 'UC-015', 'risk_management',        1, 'No risk process disclosed', DATE('2026-09-14')),
('MAT-015-M', 'UC-015', 'monitoring',             2, 'Adoption and time-savings metrics explicitly tracked and reported', DATE('2026-09-14')),
('MAT-015-C', 'UC-015', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-016: Telstra SmartFix -- autonomous, no disclosed human-in-loop
('MAT-016-L', 'UC-016', 'leadership',             0, 'No governance role disclosed for this autonomous system', DATE('2026-09-14')),
('MAT-016-R', 'UC-016', 'risk_management',        0, 'No risk process disclosed for an autonomous action system', DATE('2026-09-14')),
('MAT-016-M', 'UC-016', 'monitoring',             2, 'Scale metrics (2.5M actions/year, calls prevented) explicitly tracked', DATE('2026-09-14')),
('MAT-016-C', 'UC-016', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-017: Telstra Assistant -- public chatbot
('MAT-017-L', 'UC-017', 'leadership',             1, 'No governance role disclosed', DATE('2026-09-14')),
('MAT-017-R', 'UC-017', 'risk_management',        1, 'No risk process disclosed', DATE('2026-09-14')),
('MAT-017-M', 'UC-017', 'monitoring',             2, 'Escalation-avoidance metric explicitly tracked and reported', DATE('2026-09-14')),
('MAT-017-C', 'UC-017', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-018: AI medical scribes -- regulator-documented compliance gap
('MAT-018-L', 'UC-018', 'leadership',             1, 'AHPRA (regulator) documents the issue, but no sector-wide practice-level accountable structure exists', DATE('2026-09-14')),
('MAT-018-R', 'UC-018', 'risk_management',        1, 'Hallucination risk explicitly documented by the regulator, but not managed at the practice level', DATE('2026-09-14')),
('MAT-018-M', 'UC-018', 'monitoring',             1, 'No sector-wide monitoring of tool accuracy or compliance disclosed', DATE('2026-09-14')),
('MAT-018-C', 'UC-018', 'continuous_improvement', 1, 'Growing regulatory scrutiny (multiple 2026 articles) suggests emerging, not yet realised, improvement', DATE('2026-09-14')),

-- UC-019: AI mammography -- secondary-sourced
('MAT-019-L', 'UC-019', 'leadership',             1, 'No governance role disclosed in this secondary source', DATE('2026-09-14')),
('MAT-019-R', 'UC-019', 'risk_management',        1, 'No risk process disclosed', DATE('2026-09-14')),
('MAT-019-M', 'UC-019', 'monitoring',             1, 'Accuracy figure reported once, not framed as ongoing monitoring', DATE('2026-09-14')),
('MAT-019-C', 'UC-019', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-020: Suncorp SunGPT / Single View of Claim -- ethics award
('MAT-020-L', 'UC-020', 'leadership',             1, 'No named accountable role, though the ethics/responsibility award implies some governance oversight exists', DATE('2026-09-14')),
('MAT-020-R', 'UC-020', 'risk_management',        2, 'Ethics/responsibility award implies an internal review process was applied', DATE('2026-09-14')),
('MAT-020-M', 'UC-020', 'monitoring',             2, 'Review-time-reduction metrics explicitly tracked and reported', DATE('2026-09-14')),
('MAT-020-C', 'UC-020', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14')),

-- UC-021: Suncorp automated cyclone claims -- confirmed zero manual intervention
('MAT-021-L', 'UC-021', 'leadership',             0, 'No accountable role disclosed for this fully automated pathway', DATE('2026-09-14')),
('MAT-021-R', 'UC-021', 'risk_management',        0, 'No risk process disclosed for a fully autonomous claims determination', DATE('2026-09-14')),
('MAT-021-M', 'UC-021', 'monitoring',             1, 'Claims-volume metric disclosed, not framed as an ongoing accuracy monitoring process', DATE('2026-09-14')),
('MAT-021-C', 'UC-021', 'continuous_improvement', 1, 'Positioned by the CEO as an ongoing capability, though no formal improvement cycle disclosed', DATE('2026-09-14')),

-- UC-022: Universities AI detection -- self-disclosed limitation
('MAT-022-L', 'UC-022', 'leadership',             2, 'Most institutions have generative AI policies, per the source', DATE('2026-09-14')),
('MAT-022-R', 'UC-022', 'risk_management',        1, 'Source explicitly notes a gap between policy and practice implementation', DATE('2026-09-14')),
('MAT-022-M', 'UC-022', 'monitoring',             1, 'Adoption rate (over 50%) tracked at a sector level, not institution-by-institution', DATE('2026-09-14')),
('MAT-022-C', 'UC-022', 'continuous_improvement', 1, 'No sector-wide iteration cycle disclosed', DATE('2026-09-14')),

-- UC-023: AFCA -- early-stage strategy, strong human-decision commitment
('MAT-023-L', 'UC-023', 'leadership',             2, 'AI roadmap/framework development explicitly underway, no named executive yet', DATE('2026-09-14')),
('MAT-023-R', 'UC-023', 'risk_management',        2, 'Explicit, firm commitment that dispute decisions remain human-made functions as a strong early risk control', DATE('2026-09-14')),
('MAT-023-M', 'UC-023', 'monitoring',             1, 'No system deployed yet to monitor; awareness of external AI impact (complaint volume) is disclosed', DATE('2026-09-14')),
('MAT-023-C', 'UC-023', 'continuous_improvement', 2, 'Actively developing a framework in direct response to observed external AI impact -- genuine early iteration', DATE('2026-09-14')),

-- UC-024: Medibank AI-assisted support calls + ahm chatbot
('MAT-024-L', 'UC-024', 'leadership',             1, 'No accountable role named for this specific system', DATE('2026-09-14')),
('MAT-024-R', 'UC-024', 'risk_management',        1, 'No risk process disclosed for this system specifically', DATE('2026-09-14')),
('MAT-024-M', 'UC-024', 'monitoring',             2, 'Approaching-50%-of-calls adoption metric explicitly tracked and reported', DATE('2026-09-14')),
('MAT-024-C', 'UC-024', 'continuous_improvement', 1, 'No iteration cycle disclosed for this system specifically', DATE('2026-09-14')),

-- UC-025: Medibank speech analytics for vulnerable customers
('MAT-025-L', 'UC-025', 'leadership',             1, 'No accountable role named', DATE('2026-09-14')),
('MAT-025-R', 'UC-025', 'risk_management',        1, 'No formal risk process disclosed for this sensitive-inference system', DATE('2026-09-14')),
('MAT-025-M', 'UC-025', 'monitoring',             1, 'No ongoing accuracy or fairness monitoring metrics disclosed', DATE('2026-09-14')),
('MAT-025-C', 'UC-025', 'continuous_improvement', 1, 'No iteration cycle disclosed', DATE('2026-09-14'));
