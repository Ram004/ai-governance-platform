-- ============================================================
-- Seed batch 3 -- 4 more real, cited use cases (UC-011 to UC-014)
-- ============================================================
-- Adds law enforcement/facial recognition diversity -- a category
-- not previously in the inventory. UC-013 is notable as the first
-- use case with a formally confirmed regulatory violation (OAIC
-- finding), not just an inferred gap.
-- Run after 09_seed_use_cases_batch2.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-011',
    'Department of Foreign Affairs and Trade',
    'Government',
    'https://dfat.gov.au/about-us/corporate/artificial-intelligence-ai-transparency-statement',
    'government_register',
    'government_register',
    'Internal AI use across service delivery, scientific, and corporate/enabling domains; participant in the Whole of Australian Government Copilot trial',
    'LLM',
    'Production',
    'internal_documents',
    NULL,
    DATE('2026-09-12'),
    'DFAT explicitly states its internal AI policy draws on guidance from DTA, Department of Industry, and CSIRO. Reviewing AI use across three domains for efficiency, with mandatory staff training before access is granted -- specific use-case detail not disclosed.'
),
(
    'UC-012',
    'Australian Federal Police',
    'Government',
    'https://www.afp.gov.au/news-centre/feature/artificial-intelligence-ai-transparency-statement',
    'government_register',
    'government_register',
    'Law enforcement AI capabilities; specific use cases and technical methodology explicitly withheld from public disclosure for operational security reasons',
    'Classical ML',
    'Production',
    'law_enforcement_data',
    NULL,
    DATE('2026-09-12'),
    'AFP explicitly states detailed descriptions and specific use cases "can''t be published to protect sensitive AFP capability." References the Australia New Zealand Responsible and Ethical AI Framework. This is a case where the disclosure itself is deliberately incomplete by design, not merely brief -- ai_technique marked Classical ML as the most defensible general default given no specific technique is confirmed by the agency.'
),
(
    'UC-013',
    'Australian Federal Police (Clearview AI trial, historical)',
    'Government',
    'https://amp.abc.net.au/article/12451554',
    'news_report',
    'news_report',
    'Facial recognition identification via a third-party biometric matching service (Clearview AI), used on a free-trial basis',
    'Computer Vision',
    'Retired',
    'facial_biometric_data',
    NULL,
    DATE('2026-09-12'),
    'Distinct from UC-012''s current official statement -- this is a documented historical incident. AFP officers used Clearview AI on a free trial without an entered contract; AFP initially denied ties before confirming the trial. The OAIC separately found Clearview AI breached the Privacy Act by collecting facial images/biometrics without consent. Notable as the only use case in this inventory with a confirmed regulatory violation rather than an inferred gap.'
),
(
    'UC-014',
    'Western Australia Police',
    'Government (State)',
    'https://www.abc.net.au/news/2026-08-11/ai-police-face-screening-trial-sparks-privacy-concern/107009644',
    'news_report',
    'news_report',
    'Live public facial recognition scanning against a police watchlist in real time (Perth and Fremantle trial)',
    'Computer Vision',
    'Pilot',
    'facial_biometric_data',
    NULL,
    DATE('2026-09-12'),
    'Described as an "Australian-first" live public facial recognition trial. Real disclosed usage statistics: over 130,000 faces scanned, 33 alerts and 18 arrests reported in the first week. A human rights law expert publicly questioned whether the technology had been tested on First Nations faces before deployment -- WA Police did not respond to that question in the reporting.'
);
