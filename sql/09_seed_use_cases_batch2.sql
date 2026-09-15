-- ============================================================
-- Seed batch 2 -- 5 more real, cited use cases (UC-006 to UC-010)
-- ============================================================
-- Sourced from the DTA Central Register of AI Transparency Statements
-- (digital.gov.au/policy/ai/list-of-transparency-statements).
-- Run after 02_seed_use_cases.sql. Extends the inventory toward the
-- 100-case target, one real batch at a time.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-006',
    'Services Australia',
    'Government',
    'https://www.servicesaustralia.gov.au/automation-and-artificial-intelligence-transparency-statement',
    'government_register',
    'government_register',
    'Automation and AI for service delivery, payments, and administrative decision support',
    'Classical ML',
    'Production',
    'customer_service_data,payment_data',
    TRUE,
    DATE('2026-09-12'),
    'Explicitly discloses AI use in Decision making/administrative action and Service delivery domains, but explicitly states "We do not use AI to process claims" with human oversight retained. Notable given Services Australia''s prior public scrutiny of automated decision-making (Robodebt) in this exact policy domain.'
),
(
    'UC-007',
    'Australian Bureau of Statistics',
    'Government',
    'https://www.abs.gov.au/about/legislation-and-policy/ai-transparency-statement',
    'government_register',
    'government_register',
    'ML-based classification of statistical data; generative AI chatbot for the Census Test; generative AI for internal content drafting',
    'Hybrid',
    'Production',
    'survey_data,census_data',
    NULL,
    DATE('2026-09-12'),
    'Discloses three distinct AI uses in one statement -- classical ML classification, a public-facing genAI chatbot, and internal genAI drafting. ABS self-assesses these as "lower potential risk" due to transparency/traceability of the underlying methods.'
),
(
    'UC-008',
    'Australian Securities and Investments Commission (ASIC)',
    'Government',
    'https://www.asic.gov.au/about-asic/what-we-do/how-we-operate/accountability-and-reporting/artificial-intelligence-transparency-statement',
    'government_register',
    'government_register',
    'Domain-level AI governance disclosure for Australia''s financial services and markets regulator',
    'LLM',
    'Production',
    'unspecified_domain_level',
    NULL,
    DATE('2026-09-12'),
    'Statement focuses almost entirely on staff training and governance process, disclosing no specific use-case detail -- domain-level-only disclosure, similar to UC-002/DSS. Notable because ASIC is itself the regulator that assesses AI risk within the sector it oversees.'
),
(
    'UC-009',
    'Australian Institute of Criminology',
    'Government',
    'https://www.aic.gov.au/about-us/artificial-intelligence-ai-transparency-statement',
    'government_register',
    'government_register',
    'Internal AI use for criminological research; explicitly no public-facing or significantly-impactful AI use',
    'LLM',
    'Production',
    'research_data',
    TRUE,
    DATE('2026-09-12'),
    'Explicitly states the AIC does not propose to use AI where the public may directly interact with or be significantly impacted by it -- a genuine low-risk contrast case within the same policy framework as higher-stakes agencies like the ATO.'
),
(
    'UC-010',
    'Department of Industry, Science and Resources',
    'Government',
    'https://www.industry.gov.au/publications/artificial-intelligence-transparency-statement',
    'government_register',
    'government_register',
    'Internal AI tool use under the Voluntary AI Safety Standard; department also administers the Australian AI Safety Institute',
    'LLM',
    'Production',
    'internal_documents',
    TRUE,
    DATE('2026-09-12'),
    'Notable as the department responsible for the Australian AI Safety Institute (frontier AI monitoring under the National AI Plan) while itself subject to the same transparency requirements as other agencies. Explicitly states staff treat all AI outputs as drafts, not for decision-making.'
);
