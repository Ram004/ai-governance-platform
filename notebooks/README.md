# Notebooks

This folder contains Databricks notebooks for interactive guardrail evaluation.

## Files

- **`ai_guardrail_evaluation.py`** - Main guardrail evaluation notebook
  - Imports the `ai_governance` package
  - Loads test prompts from `data/test_prompts.csv`
  - Runs LLM guardrail evaluations
  - Writes results to Unity Catalog Delta tables
  - Includes human-in-the-loop review workflow

## How to Use

### In Databricks Workspace

1. **Upload the notebook** to your Databricks workspace:
   - Navigate to your workspace folder
   - Click "Import" -> "File" -> Select `ai_guardrail_evaluation.py`

2. **Install dependencies** (first cell of notebook):
   ```python
   %pip install presidio-analyzer presidio-anonymizer transformers torch requests
   dbutils.library.restartPython()
   ```

3. **Configure model endpoint**:
   ```python
   SERVING_ENDPOINT_NAME = "databricks-meta-llama-3-1-8b-instruct"  # Update to your endpoint
   ```

4. **Update the hardcoded workspace path** -- this is the one manual
   step anyone reusing this notebook needs to do. The notebook
   currently has an absolute path hardcoded to a specific Databricks
   Workspace user folder:
   ```python
   sys.path.append("/Workspace/Users/<your-email>/portfolio-projects/ai-governance-platform")
   ...
   pd.read_csv("/Workspace/Users/<your-email>/portfolio-projects/ai-governance-platform/data/test_prompts.csv")
   ```
   Update `<your-email>` (and the folder path if different) to match
   where you've actually placed the repo in your own workspace before
   running. This is NOT automatically resolved relative to the
   notebook's own location -- it's a fixed absolute string.

5. **Run cells sequentially** - Each cell is numbered and includes instructions

### Requirements

- Databricks workspace with Unity Catalog enabled
- Model serving endpoint (Foundation Model API or custom)
- `ai_governance` package installed or accessible via `sys.path`
  (currently via the hardcoded path above, not a proper package install)

## Architecture

The notebook uses a modular architecture:

```
ai_guardrail_evaluation (notebook)
        |
        +--> ai_governance.run_guardrails()  (5-layer defense)
        +--> data/test_prompts.csv           (OWASP-based test cases)
```

All guardrail logic lives in the `ai_governance` package, making it
reusable across notebooks -- once the path above is updated for your
own workspace.

## Output

Results are written to:
- **Unity Catalog Table**: `ai_governance.risk_assessment.guardrail_evaluations`
- Fields: eval_id, use_case_id, test_id, owasp_category, guardrail_stage,
  guardrail_triggered, guardrail_reasons, model_response_blocked,
  attack_success_flag, reviewer_note, evaluated_date

## Notes on the manual review step

The notebook includes a real, completed manual review of all 8
adversarial test prompts (TP-001 through TP-008), with a specific
written rationale for each -- for example, TP-002 and TP-003 are
marked as successful attacks because the model explicitly confirmed
"DEVMODE ENABLED" and agreed to disregard its guidelines, while the
other 6 show the model explicitly declining. This gives a defensible,
source-verified 6-of-8 blocked (75%) result, not a self-reported one.

## Related Documentation

- [Project Summary](../docs/PROJECT_SUMMARY.md)
- [Modular Architecture](../docs/MODULAR_ARCHITECTURE.md)
- [Interview Prep](../docs/INTERVIEW_PREP.md)