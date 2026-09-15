-- ============================================================
-- Seed batch 7 -- 1 more real, cited use case (UC-022)
-- ============================================================
-- First education-sector case. Notable because the source itself
-- explicitly discloses a fairness/validity limitation in the
-- detection tool it describes -- rare for a source to self-flag its
-- own tool's risk rather than an outside party finding it.
-- Run after 17_seed_use_cases_batch6.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-022',
    'Australian universities (sector-wide)',
    'Education',
    'https://theconversation.com/more-than-50-of-australian-university-assignments-used-ai-how-should-unis-respond-287179',
    'analyst_report',
    'analyst_report',
    'AI-generated content detection applied to student assignments to flag potential undisclosed AI use for academic integrity review',
    'Classical ML',
    'Production',
    'student_assignment_data',
    TRUE,
    DATE('2026-09-12'),
    'A 2026 analysis found over 50% of Australian university assignments showed signs of AI use; most universities have generative AI policies but "significant gaps remain in translating these into practice." The source itself explicitly flags a fairness/validity concern: detection tools estimate likelihood of AI-assisted writing, not confirmed misconduct -- "a high AI score could reflect disclosed use rather than academic misconduct." A rare case of a source disclosing its own subject''s limitation rather than an outside party finding it.'
);
