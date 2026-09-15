# Implementation Notes -- Guardrail Evaluation Harness

Two runtime issues encountered while running the harness on Databricks
Serverless compute, both confirmed real, along with the fixes applied.

---

## 1. Rate limiting (HTTP 429)

**Problem:** Sending all 13 prompts to the model serving endpoint in a
tight loop with no delay triggered `429 Too Many Requests`.

**Fix:** a 2-second delay between requests (skipped on the first
iteration):

```python
import time

results = []
for i, p in enumerate(test_prompts):
    if i > 0:
        time.sleep(2)
    raw_response = call_model(p["prompt"])
    gr = run_guardrails(p["prompt"], raw_response)
    results.append({...})
```

Adds ~24 seconds total overhead across 13 prompts, which is a fine
trade-off for reliability at this scale. Not something you'd want to
scale to hundreds of prompts without exponential backoff instead of a
fixed delay.

---

## 2. Python environment instability writing to Delta

**Problem:** After `%pip install`-ing the guardrail libraries and
restarting Python (`dbutils.library.restartPython()`), building a
Spark DataFrame from the results (`spark.createDataFrame(rows)`) failed
partway through the session with an environment setup error —
Databricks' pip-installed environment carries a TTL, and once it
expired mid-session, Python-to-Spark serialization broke.

**Fix:** bypass the DataFrame API entirely and write via direct SQL
`INSERT` statements instead, since SQL runs in the Spark/JVM layer and
doesn't need the Python environment to serialize anything:

```python
for row in rows_to_write:
    spark.sql(f"""
        INSERT INTO ai_governance.risk_assessment.guardrail_evaluations
        VALUES (
            '{row['eval_id']}',
            {f"'{row['use_case_id']}'" if row['use_case_id'] else 'NULL'},
            '{row['test_id']}',
            '{row['owasp_category']}',
            '{row['guardrail_stage']}',
            {str(row['guardrail_triggered']).lower()},
            '{row['guardrail_reasons'].replace("'", "''")}',
            {str(row['model_response_blocked']).lower()},
            {str(row['attack_success_flag']).lower() if row['attack_success_flag'] is not None else 'NULL'},
            {f"'{row['reviewer_note'].replace("'", "''")}'" if row['reviewer_note'] else 'NULL'},
            '{row['evaluated_date']}'
        )
    """)
```

**Trade-offs, stated honestly:** more robust against environment
corruption and works reliably on serverless compute, but less elegant
than the DataFrame API, needs manual SQL escaping (`'` → `''`), and
issues one INSERT per row rather than a single batched statement.

---

## Why this is worth knowing beyond "it worked"

Both fixes are tactical workarounds for real Databricks Serverless
constraints, not textbook best practice — a legitimate thing to say
plainly in an interview. Elegant code sometimes takes a back seat to a
working fix when the "correct" API isn't reliably available.

## Recommended future improvement

Batch the INSERT into a single multi-row statement rather than one
INSERT per row, and consider moving the pip dependencies to a cluster
init script to avoid the environment TTL issue entirely rather than
working around it after the fact.