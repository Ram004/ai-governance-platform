-- ============================================================
-- Seed batch 9 -- 2 more real, cited use cases (UC-024 to UC-025)
-- ============================================================
-- Medibank -- both sourced directly from Medibank's own 2024 Annual
-- Report (primary source, not a secondary vendor case study).
-- Run after 21_seed_use_cases_batch8.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-024',
    'Medibank',
    'Health Insurance',
    'https://www.medibank.com.au/content/dam/retail/about-assets/pdfs/investor-centre/annual-reports/Medibank_Annual_Report_2024.pdf',
    'annual_report',
    'annual_report',
    'AI assisting customer support calls (approaching 50% of all support calls) and a generative AI chatbot integrated into the ahm app for customer service',
    'Hybrid',
    'Production',
    'customer_call_data,customer_service_data',
    TRUE,
    DATE('2026-09-12'),
    'Medibank''s own 2024 Annual Report explicitly discloses AI is "now assisting in almost 50% of support calls from our customers" and describes introducing a "friendly chat bot" in the ahm app. A primary-source, quantified disclosure directly from the company''s own annual report, not a secondary vendor case study. Medibank has also been subject to litigation and regulatory proceedings connected to a major 2022 cybercrime event (unrelated to this AI use, but relevant context for the company''s broader risk/trust posture and its ongoing CPS 230 and Financial Accountability Regime compliance program).'
),
(
    'UC-025',
    'Medibank',
    'Health Insurance',
    'https://www.medibank.com.au/content/dam/retail/about-assets/pdfs/investor-centre/annual-reports/Medibank_Annual_Report_2024.pdf',
    'annual_report',
    'annual_report',
    'Proactive speech analytics system to identify and enhance protections for vulnerable Medibank and ahm customers during calls',
    'Classical ML',
    'Production',
    'customer_call_audio_data',
    TRUE,
    DATE('2026-09-12'),
    'Disclosed in the same 2024 Annual Report: "we also enhanced protections for vulnerable Medibank and ahm customers with the launch of a proactive speech analytics system." Distinct from UC-024 -- analyses call audio to detect vulnerability indicators, a higher-sensitivity application given it may infer health, financial distress, or cognitive vulnerability from voice patterns, with genuine bias/fairness and privacy considerations not addressed in this brief disclosure.'
);
