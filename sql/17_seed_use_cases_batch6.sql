-- ============================================================
-- Seed batch 6 -- 2 more real, cited use cases (UC-020 to UC-021)
-- ============================================================
-- First insurance-sector cases. UC-021 is notable as the first use
-- case with an explicitly CONFIRMED absence of human oversight
-- (CEO-quoted "zero manual intervention"), rather than an undisclosed
-- gap like most other cases in the inventory.
-- Run after 15_seed_use_cases_batch5.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-020',
    'Suncorp',
    'Insurance',
    'https://www.insurancebusinessmag.com/au/news/technology/suncorp-eyes-ai-platform-overhaul-565914.aspx',
    'news_report',
    'news_report',
    'Generative AI tool (Single View of Claim, built on internal SunGPT platform) that consolidates communications, documents, and case notes into a unified claims summary and recommends next steps',
    'LLM',
    'Production',
    'claims_data,customer_communications,case_notes',
    TRUE,
    DATE('2026-09-12'),
    'SunGPT is built on Databricks, connecting customer/operational data with LLMs. Single View of Claim is accessible to ~1,500 claims staff and reduces per-claim review time by 5-30 minutes depending on complexity. Won the Financial Review AI Award 2025 for Ethics and Responsibility, per Microsoft''s published customer case study as reported by industry press. Notable for being built on the same underlying data platform (Databricks) as this governance project itself.'
),
(
    'UC-021',
    'Suncorp',
    'Insurance',
    'https://www.insurancebusinessmag.com/au/news/technology/whats-generative-ai-doing-to-brokers-insurance-submissions-544248.aspx',
    'news_report',
    'news_report',
    'Fully automated processing of food spoilage insurance claims following a declared natural disaster event',
    'Hybrid',
    'Production',
    'claims_data,customer_data',
    FALSE,
    DATE('2026-09-12'),
    'Suncorp CEO Steve Johnston publicly stated AI helped process more than 7,000 food spoilage claims from Tropical Cyclone Alfred with "zero manual intervention," explicitly disclosed as a positive result. First use case in the inventory with an explicitly CONFIRMED absence of human-in-loop (most others are undisclosed rather than confirmed absent) -- a useful contrast to UC-020 from the same company, where a similar AI capability is deployed with a human decision-maker in the loop instead.'
);
