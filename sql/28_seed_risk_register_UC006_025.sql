-- ============================================================
-- Risk register entries for UC-006 through UC-025 (20 rows)
-- ============================================================
-- Same convention as the original 5: RISK-0XX matches UC-0XX.
-- Each entry ties to the highest-scoring risk dimension for that
-- use case (see risk_assessment.risk_scores) with a concrete
-- mitigation action. Run after all use-case and risk-score batches.

USE CATALOG ai_governance;

INSERT INTO risk_register.risks VALUES
('RISK-006', 'UC-006', 'reputational',
 'Automated decision support in service delivery/payments carries elevated public scrutiny given this domain''s prior history with automated decision-making incidents',
 'High', 'Maintain and publicly reaffirm the explicit "AI does not process claims" restriction; independent periodic audit of the boundary between AI-assisted and AI-decided actions', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-007', 'UC-007', 'privacy',
 'Census and survey data processed by AI classification systems at national population scale, despite ABS self-assessing the risk as low',
 'Medium', 'Independent verification of the "lower potential risk" self-assessment; periodic re-assessment as genAI use expands beyond the Census chatbot', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-008', 'UC-008', 'bias',
 'Domain-level disclosure prevents assessment of whether any AI-assisted regulatory decisioning carries fairness risk for regulated entities',
 'Medium', 'Request use-case-level disclosure from ASIC directly, or monitor future ANAO/parliamentary review of the regulator''s own AI use', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-009', 'UC-009', 'regulatory',
 'Minimal disclosed risk given explicit scope restriction, but no formal review mechanism confirms the restriction is consistently honoured over time',
 'Low', 'Periodic confirmation that AIC''s AI use has not expanded beyond the explicitly disclosed internal-research scope', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-010', 'UC-010', 'reputational',
 'As the department responsible for the Australian AI Safety Institute, any gap between its own AI governance practice and the standards it promotes carries disproportionate reputational risk',
 'Medium', 'Independent internal audit of the department''s own AI Governance Committee practices against the standard it administers for others', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-011', 'UC-011', 'regulatory',
 'Reliance on cross-agency guidance (DTA, Industry, CSIRO) rather than a DFAT-specific policy creates ambiguity about which body is accountable if a gap emerges',
 'Medium', 'Formalise a DFAT-specific AI policy referencing but not solely relying on cross-agency guidance', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-012', 'UC-012', 'reputational',
 'Deliberate non-disclosure of AI capability detail, while defensible on security grounds, itself creates a transparency gap that could attract scrutiny independent of any specific incident',
 'High', 'Publish a redacted capability summary sufficient for public assurance without compromising operational security, following models used by other five-eyes law enforcement agencies', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-013', 'UC-013', 'regulatory',
 'Confirmed OAIC finding of a Privacy Act breach from unauthorised biometric data collection via an informal vendor trial with no prior privacy assessment',
 'Critical', 'Implement mandatory pre-trial privacy impact assessment and formal procurement review for any biometric or facial recognition technology, regardless of trial/free-tier status', 'High',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-014', 'UC-014', 'bias',
 'Unanswered question about whether the facial recognition technology was tested on First Nations faces before a live public deployment, raised explicitly by a human rights law expert',
 'High', 'Independent, published demographic accuracy testing before continuing or expanding the trial; formal response to the raised concern', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-015', 'UC-015', 'security',
 'Internal agent-assist tool integrated with Azure OpenAI Service; standard enterprise access controls assumed but not independently confirmed',
 'Medium', 'Independent security review of data flows between the customer service platform and the underlying LLM service', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-016', 'UC-016', 'operational',
 'Fully autonomous network remediation at large scale (2.5 million actions/year) with no disclosed human-in-loop or fallback mechanism if the system misfires',
 'High', 'Implement and disclose a fallback/circuit-breaker mechanism with defined thresholds for automatic escalation to human network engineers', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-017', 'UC-017', 'reputational',
 'Public-facing chatbot errors are directly customer-visible, unlike UC-015''s staff-mediated tool, with no disclosed detail on output monitoring',
 'Medium', 'Implement and disclose output monitoring/guardrails specifically for the public-facing channel, distinct from internal-tool controls', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-018', 'UC-018', 'regulatory',
 'Confirmed, current, sector-wide gap: AI scribes that suggest diagnoses meet the legal definition of a medical device, yet none is TGA-approved despite ~40% GP adoption',
 'Critical', 'Individual practices should confirm whether their specific AI scribe tool suggests diagnoses and, if so, cease use pending TGA registration or vendor compliance confirmation', 'High',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-019', 'UC-019', 'bias',
 'A single reported accuracy figure (94.5%) does not disclose performance variance across demographic or tissue-density subgroups relevant to mammography specifically',
 'Medium', 'Request or commission subgroup-level accuracy reporting from the tool vendors before relying on the aggregate figure for clinical decisions', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-020', 'UC-020', 'privacy',
 'Consolidates customer communications, documents, and case notes into an LLM-accessible unified view for ~1,500 staff, with data handling detail not disclosed',
 'Medium', 'Independent review of data retention, access logging, and staff permission scoping within the Single View of Claim tool', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-021', 'UC-021', 'operational',
 'Confirmed "zero manual intervention" in fully automated claims determination at meaningful scale (7,000+ claims), with no disclosed fairness testing or appeal pathway',
 'High', 'Introduce a disclosed appeal/review pathway for automatically-determined claims and independent audit of determination accuracy before scaling further', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-022', 'UC-022', 'bias',
 'Self-disclosed limitation: AI detection scores can reflect disclosed, legitimate AI use rather than misconduct, yet are used to trigger serious academic integrity processes',
 'High', 'Institution-wide policy requiring a detection score alone can never be sole grounds for a misconduct finding; mandatory human review with the student''s right of response', 'Medium',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-023', 'UC-023', 'operational',
 'AFCA''s dispute resolution operations are already measurably affected by external AI use (23% complaint volume increase) despite AFCA having no AI system of its own yet deployed',
 'Medium', 'Develop triage guidance for identifying and appropriately handling AI-generated complaint content without penalising legitimate AI-assisted submissions', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-024', 'UC-024', 'reputational',
 'AI now assists nearly 50% of customer support calls at a health insurer already carrying elevated public trust sensitivity following its 2022 cybercrime event',
 'Medium', 'Independent customer-trust survey specifically assessing sentiment toward AI-assisted support, given the company''s recent trust-rebuilding context', 'Low',
 'N/A - public case study', DATE('2027-03-01')),

('RISK-025', 'UC-025', 'bias',
 'Speech analytics inferring customer vulnerability from voice carries meaningful misclassification risk across accents, speech patterns, and disabilities, with no disclosed fairness testing',
 'High', 'Independent fairness audit of the vulnerability-detection model across diverse speaker populations before further scaling', 'Medium',
 'N/A - public case study', DATE('2027-03-01'));
