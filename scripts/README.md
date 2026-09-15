# Scripts

This folder contains standalone CLI scripts for automation and local testing.

## Files

- **`run_eval.py`** - Standalone CLI guardrail evaluation script (OPTIONAL)
  - Use for CI/CD pipelines, local testing, or CSV export
  - Most users should use the notebook instead

## When to Use

**MOST USERS SHOULD USE THE NOTEBOOK INSTEAD**

The notebook (`../notebooks/ai_guardrail_evaluation.py`) provides:
- Native Databricks Foundation Model API integration
- Direct Unity Catalog writes (no CSV loading step)
- Human-in-the-loop review workflow
- Self-contained execution (no environment setup)

**Use `run_eval.py` ONLY if you need:**
1. **CI/CD Pipelines** - Automated evaluation in Jenkins, GitHub Actions, etc.
   (no CI pipeline is currently configured in this repo -- the example
   below is illustrative for setting one up, not a description of
   existing automation)
2. **Local Testing** - Test guardrails on your laptop before deploying
3. **CSV Export** - Output `eval_results.csv` instead of Unity Catalog writes

## Quick Start (run_eval.py)

### Local Execution

Run these from the **repository root** -- `requirements.txt` lives
there, not inside `scripts/`:

```bash
# 1. From the repo root: install dependencies
pip install -r requirements.txt
python -m spacy download en_core_web_sm

# 2. Set environment variables
export MODEL_ENDPOINT_URL="https://your-workspace.databricks.com/serving-endpoints/your-endpoint/invocations"
export MODEL_API_KEY="dapi..."

# 3. Then move into scripts/ to run the evaluation
cd scripts/
python run_eval.py

# 4. Results written to eval_results.csv
```

### CI/CD Example (GitHub Actions) -- illustrative, not currently set up

This is a template for wiring up automated evaluation on every pull
request. No `.github/workflows/` currently exists in this repo -- add
this if and when you want that automation:

```yaml
name: Guardrail Evaluation

on:
  pull_request:
    branches: [main]

jobs:
  evaluate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: '3.10'

      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          python -m spacy download en_core_web_sm

      - name: Run guardrail evaluation
        env:
          MODEL_ENDPOINT_URL: ${{ secrets.DATABRICKS_ENDPOINT_URL }}
          MODEL_API_KEY: ${{ secrets.DATABRICKS_TOKEN }}
        run: python scripts/run_eval.py

      - name: Upload results
        uses: actions/upload-artifact@v3
        with:
          name: eval-results
          path: eval_results.csv
```

## Architecture

Both the notebook and script use the same core modules:

```
ai_guardrail_evaluation (notebook)      run_eval.py (script)
         |                                    |
         +----------> ai_governance <---------+
         |              (package)              |
         +--------> test_prompts.csv <---------+
```

`ai_governance` is a genuine pip-installable package (`setup.py`,
`pyproject.toml` at the repo root) -- both interfaces import
`run_guardrails` from `ai_governance.guardrails`, not copy-pasted logic.

## Output

`run_eval.py` outputs:
- **CSV file**: `eval_results.csv` in the current directory
- Includes a `_raw_response_for_review` column for manual inspection
- **Does NOT** auto-fill `attack_success_flag` - requires manual review,
  by design (see IMPLEMENTATION_NOTES.md for why)

To load into Unity Catalog after manual review, see the script's header documentation.

## Related Documentation

- [Modular Architecture](../docs/MODULAR_ARCHITECTURE.md)
- [Project Summary](../docs/PROJECT_SUMMARY.md)