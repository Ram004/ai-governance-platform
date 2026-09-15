# SQL Scripts

Unity Catalog setup for the AI Governance Platform. Run in Databricks
SQL or a notebook, in the order below -- later scripts depend on
tables earlier ones create.

## Foundation (01-07) -- creates the schema, covers UC-001 to UC-005

1. **`01_create_schema.sql`** -- creates the `ai_governance` catalog and
   6 schemas: `use_case_inventory`, `risk_assessment`, `controls`,
   `risk_register`, `readiness`, `stewardship`
2. **`02_seed_use_cases.sql`** -- first 5 real, cited AI use cases
3. **`03_seed_risk_scores.sql`** -- 30 risk scores (6 dimensions x 5 use cases)
4. **`04_seed_controls.sql`** -- 20 governance controls (8 ISO 42001 Annex A
   + 12 NIST AI RMF)
5. **`05_seed_stewardship.sql`** -- RACI over the platform's own 6 schemas
6. **`06_create_guardrail_eval_table.sql`** -- empty table for guardrail results
7. **`07_seed_governance_data.sql`** -- ISO control mappings, risk register,
   and maturity scores, but only for UC-001-005

## Sourcing batches (09-24) -- adds UC-006 through UC-025

Each pair adds 1-5 more real, cited use cases plus their risk scores.
Run in numeric order:

8. `09_seed_use_cases_batch2.sql` + `10_seed_risk_scores_batch2.sql` (UC-006 to UC-010)
9. `11_seed_use_cases_batch3.sql` + `12_seed_risk_scores_batch3.sql` (UC-011 to UC-014)
10. `13_seed_use_cases_batch4.sql` + `14_seed_risk_scores_batch4.sql` (UC-015 to UC-017)
11. `15_seed_use_cases_batch5.sql` + `16_seed_risk_scores_batch5.sql` (UC-018 to UC-019)
12. `17_seed_use_cases_batch6.sql` + `18_seed_risk_scores_batch6.sql` (UC-020 to UC-021)
13. `19_seed_use_cases_batch7.sql` + `20_seed_risk_scores_batch7.sql` (UC-022)
14. `21_seed_use_cases_batch8.sql` + `22_seed_risk_scores_batch8.sql` (UC-023)
15. `23_seed_use_cases_batch9.sql` + `24_seed_risk_scores_batch9.sql` (UC-024 to UC-025)

## Extending controls and risk register to all 25 cases (25-28)

`07_seed_governance_data.sql` only covered the original 5 use cases.
These four files extend coverage to the full inventory:

16. `25_seed_nist_control_mappings.sql` -- adds the 12 NIST control
    mappings for UC-001-005 (these were missing from `07`, which
    predated the NIST controls being added to `04`)
17. `26_seed_use_case_controls_UC006_015.sql` -- 200 rows (10 use cases x 20 controls)
18. `27_seed_use_case_controls_UC016_025.sql` -- 200 rows (10 use cases x 20 controls)
19. `28_seed_risk_register_UC006_025.sql` -- 20 risk register entries

## Dashboard and guardrail harness

20. `08_dashboard_queries.sql` -- 7 verified queries to pin as dashboard
    tiles (2 additional queries referencing `nist_control`/`iso_control`
    CSV columns were dropped -- those columns don't yet resolve to real
    control records, see `GOVERNANCE_TRACEABILITY.md`)
21. `guardrail_harness/` or `notebooks/ai_guardrail_evaluation.py` --
    run separately, writes to `guardrail_evaluations`

## Verify after running everything

```sql
SELECT 'ai_use_cases' AS tbl, COUNT(*) FROM ai_governance.use_case_inventory.ai_use_cases
UNION ALL SELECT 'risk_scores', COUNT(*) FROM ai_governance.risk_assessment.risk_scores
UNION ALL SELECT 'control_library', COUNT(*) FROM ai_governance.controls.control_library
UNION ALL SELECT 'use_case_controls', COUNT(*) FROM ai_governance.controls.use_case_controls
UNION ALL SELECT 'stewardship', COUNT(*) FROM ai_governance.stewardship.data_stewardship
UNION ALL SELECT 'risks', COUNT(*) FROM ai_governance.risk_register.risks
UNION ALL SELECT 'iso42001_maturity', COUNT(*) FROM ai_governance.readiness.iso42001_maturity
UNION ALL SELECT 'guardrail_evaluations', COUNT(*) FROM ai_governance.risk_assessment.guardrail_evaluations;
```

Expected: **25 / 150 / 20 / 500 / 6 / 25 / 20 / 13**.

Note `iso42001_maturity` stays at 20 (4 domains x the original 5 use
cases) -- this is the one table not yet extended to the full
inventory, tracked honestly as an open item rather than silently
left inconsistent.

## Schema structure

```
ai_governance (catalog)
├── use_case_inventory
│   └── ai_use_cases                (25 rows)
├── risk_assessment
│   ├── risk_scores                 (150 rows)
│   └── guardrail_evaluations       (13 rows, from the harness)
├── controls
│   ├── control_library             (20 rows -- 8 ISO 42001 + 12 NIST AI RMF)
│   └── use_case_controls           (500 rows -- 20 controls x 25 use cases)
├── risk_register
│   └── risks                       (25 rows)
├── readiness
│   └── iso42001_maturity           (20 rows -- UC-001-005 only, not yet extended)
└── stewardship
    └── data_stewardship            (6 rows)
```

`control_library` has a `framework` column (`ISO42001` | `NIST_AI_RMF`)
and a `framework_control_code` column holding the actual code within
that framework (e.g. `A.5` for ISO, `GV-1.1` for NIST) -- kept
separate rather than overloading one column with both, which was an
earlier bug in this table that's since been fixed.