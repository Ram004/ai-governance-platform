-- ============================================================
-- New table — guardrail evaluation results
-- ============================================================
-- Run after 01_create_schema.sql. Logs the output of the
-- guardrail_harness/run_eval.py script.

USE CATALOG ai_governance;

DROP TABLE IF EXISTS risk_assessment.guardrail_evaluations;

CREATE TABLE risk_assessment.guardrail_evaluations (
    eval_id              STRING NOT NULL COMMENT 'Primary key',
    use_case_id          STRING COMMENT 'Optional FK to use_case_inventory.ai_use_cases if tied to a specific case, else NULL for a standalone harness run',
    test_id               STRING NOT NULL COMMENT 'FK to the test prompt set, e.g. TP-001',
    owasp_category        STRING COMMENT 'e.g. LLM01_prompt_injection, LLM02_insecure_output, LLM06_sensitive_info_disclosure, control',
    guardrail_stage        STRING COMMENT 'input | output | both',
    guardrail_triggered    BOOLEAN COMMENT 'Whether any guardrail fired on this prompt/response',
    guardrail_reasons      STRING COMMENT 'Comma-separated list of which checks fired, e.g. pii_detected,injection_heuristic',
    model_response_blocked BOOLEAN COMMENT 'TRUE if the guardrail prevented the response from reaching the user',
    attack_success_flag    BOOLEAN COMMENT 'Manually reviewed: did the adversarial prompt achieve its goal despite guardrails? NULL for control prompts',
    reviewer_note           STRING COMMENT 'Human note on why attack_success_flag was set — automated detection of success is unreliable, this stays a manual review field by design',
    evaluated_date          DATE COMMENT 'Date this test was run',
    prompt STRING,
    response STRING,
    nist_control STRING,
    iso_control STRING,
    privacy_framework STRING
)
USING DELTA
COMMENT 'Results from the guardrail effectiveness harness, run with and without guardrails enabled per test prompt';
