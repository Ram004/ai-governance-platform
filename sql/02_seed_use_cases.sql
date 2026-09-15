-- ============================================================
-- Seed batch 1 — real, publicly sourced use cases
-- ============================================================
-- Mix: government (domain-level disclosure) + private sector
-- (vendor case study), spanning LLM and classical ML.
-- Extracted using extraction_template.md.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-001',
    'Digital Transformation Agency',
    'Government',
    'https://www.dta.gov.au/ai-transparency-statement',
    'government_register',
    'government_register',
    'Automated decision-support for procurement panel application assessment',
    'Classical ML',
    'Production',
    'applicant_submission_data',
    TRUE,
    DATE('2026-09-11'),
    'DTA statement (updated 17 Jun 2026) discloses AI used to assess and recommend on Digital Marketplace Panel 2 applications to a human decision maker, run under the Australian Government AI assurance framework with external probity, privacy and technical advice. Two named accountable officials disclosed: AI Branch Manager Ramsey Beydoun and COO Tom Gilmartin.'
),
(
    'UC-002',
    'Department of Social Services',
    'Government',
    'https://www.dss.gov.au/doing-business-us/corporate-policies/artificial-intelligence-ai-transparency-statement',
    'government_register',
    'government_register',
    'Service delivery, policy and legal, corporate and enabling',
    'LLM',
    'Production',
    'unspecified_domain_level',
    NULL,
    DATE('2026-09-10'),
    'Transparency statement discloses approved AI use domains only, no individual use case detail. Governed under DTA policy and APS AI Plan. human_in_loop_flag left NULL — not stated at this disclosure level.'
),
(
    'UC-003',
    'Australian Taxation Office',
    'Government',
    'https://www.ato.gov.au/about-ato/commitments-and-reporting/information-and-privacy/ato-ai-transparency-statement',
    'government_register',
    'government_register',
    'Tax and superannuation compliance risk differentiation',
    'Classical ML',
    'Production',
    'taxpayer_data,transaction_data',
    TRUE,
    DATE('2026-09-10'),
    'ATO explicitly applies the OECD AI definition and includes ML/DL/genAI as AI, explicitly excludes rules-based if-then analytics. States human oversight is always maintained. Chief Data Officer is the AI Accountable Official. Use-case-level detail (e.g. specific audit-targeting models) not disclosed at this level — business_function is assessor-summarised from stated purpose, not a named system.'
),
(
    'UC-004',
    'Commonwealth Bank of Australia',
    'Banking',
    'https://h2o.ai/case-studies/cba/',
    'vendor_case_study',
    'vendor_case_study',
    'Real-time fraud and scam detection across banking channels',
    'Hybrid',
    'Production',
    'transaction_data,customer_behaviour_data',
    NULL,
    DATE('2026-09-10'),
    'Vendor (H2O.ai) case study: combines predictive AI and generative AI for real-time suspicious payment detection across app, online banking, branches, call centres. CBA reports meaningful reduction in customer scam losses. Outcome figures are vendor/bank-reported, not independently verified — treat accordingly in risk scoring.'
),
(
    'UC-005',
    'Big four Australian banks (ANZ, CBA, NAB, Westpac) + Suncorp',
    'Banking',
    'https://ia.acs.org.au/article/2024/big-four-banks-test-new-ai-based-fraud-tech.html',
    'news_report',
    'news_report',
    'Cross-bank suspicious account detection via shared intelligence network',
    'Classical ML',
    'Pilot',
    'transaction_data,device_session_data',
    TRUE,
    DATE('2026-09-10'),
    'Consortium pilot of BioCatch machine learning model to flag suspicious/recently-opened accounts before funds leave a sender. Banks openly acknowledged false positives during the pilot phase — useful for a bias/operational risk discussion since this is a rare source that discloses a limitation rather than only a success metric.'
);
