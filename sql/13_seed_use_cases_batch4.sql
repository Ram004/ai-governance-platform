-- ============================================================
-- Seed batch 4 -- 3 more real, cited use cases (UC-015 to UC-017)
-- ============================================================
-- First private-sector, non-banking batch -- adds telecommunications
-- and the inventory's first genuinely agentic/autonomous-action case.
-- Run after 11_seed_use_cases_batch3.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-015',
    'Telstra',
    'Telecommunications',
    'https://www.microsoft.com/en/customers/story/1740058425924206437-telstra-telecommunications-azure-openai-service',
    'vendor_case_study',
    'vendor_case_study',
    'Internal generative AI tools for customer service agents -- Ask Telstra (staff Q&A) and One Sentence Summary (call summarisation)',
    'LLM',
    'Production',
    'customer_service_data,staff_interaction_data',
    TRUE,
    DATE('2026-09-12'),
    'Microsoft (vendor) case study reports 90% of employees using One Sentence Summary report time savings and 20% less follow-up contact, and 84% of agents using Ask Telstra agree it positively impacts customer interactions. Built on Azure OpenAI Service. Outcome figures are vendor/company-reported, not independently verified.'
),
(
    'UC-016',
    'Telstra',
    'Telecommunications',
    'https://www.telstra.com.au/exchange/telstra-s-ai-transformation--strategy--partnerships-and-real-wor',
    'vendor_case_study',
    'vendor_case_study',
    'Automated network operations (SmartFix) -- proactively detects and fixes network issues before customers notice',
    'Agentic AI',
    'Production',
    'network_telemetry_data',
    NULL,
    DATE('2026-09-12'),
    'Telstra reports SmartFix performed 2.5 million proactive automated actions in FY25, preventing nearly 1 million support calls. First genuinely agentic/autonomous-action use case in this inventory -- notable that human-in-loop status is not disclosed for a system explicitly described as autonomously fixing issues, precisely the profile OWASP/NIST flag as needing the strongest oversight controls.'
),
(
    'UC-017',
    'Telstra',
    'Telecommunications',
    'https://www.telstra.com.au/exchange/telstra-s-ai-transformation--strategy--partnerships-and-real-wor',
    'vendor_case_study',
    'vendor_case_study',
    'Public-facing generative AI chatbot (Telstra Assistant) on website and MyTelstra app answering customer queries',
    'LLM',
    'Production',
    'customer_query_data',
    TRUE,
    DATE('2026-09-12'),
    'Telstra reports the chatbot has "almost tripled" the number of customer queries answered without escalation, implying a human escalation path remains for unresolved queries. First truly public-facing (non-staff) LLM use case in this inventory -- a materially different risk profile from UC-015 despite similar underlying technology, since errors are directly customer-visible rather than filtered through a human agent first.'
);
