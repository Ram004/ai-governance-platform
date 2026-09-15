-- ============================================================
-- Seed batch 8 -- 1 more real, cited use case (UC-023)
-- ============================================================
-- AFCA -- notable because Ram is actively applying to AFCA's
-- Manager, AI Governance role, making this directly relevant
-- interview material, not just inventory-filling.
-- Medibank was searched but no genuine disclosed AI use case was
-- found -- not added, to avoid fabricating one.
-- Run after 19_seed_use_cases_batch7.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-023',
    'Australian Financial Complaints Authority (AFCA)',
    'Financial Services (Ombudsman, not-for-profit)',
    'https://www.afca.org.au/annual-review-delivering-on-our-strategy',
    'annual_report',
    'annual_report',
    'Developing an AI roadmap, strategy, and governance framework to explore AI options supporting service delivery and internal operations; explicit organisational commitment that all dispute resolution decisions remain human-made',
    'LLM',
    'Pilot',
    'internal_operational_data',
    TRUE,
    DATE('2026-09-12'),
    'AFCA''s FY26 annual review discloses it is developing an AI governance framework to "safely and ethically explore AI options," while explicitly and firmly committing that all dispute resolution decisions remain human-made -- a notably strong, direct human-oversight commitment. Deployment_status marked Pilot as the closest available schema value, though the disclosure describes strategy/roadmap development, arguably earlier than even a pilot. Separately, AFCA has disclosed (Capital Brief, June 2026) a real operational impact FROM external AI use: a 23% year-on-year rise in complaint volume partly attributed to AI-generated complaints containing inaccurate information or inapplicable legal arguments, slowing dispute resolution. A rare case of an organisation''s AI governance context being shaped by ambient external AI use, not just its own systems.'
);
