# Modular Architecture - Guardrail Evaluation Harness

## Overview

The guardrail evaluation harness is built as a **modular, pip-installable
architecture** that separates concerns, enables reusability, and
demonstrates professional software engineering practices. The
`ai_governance` package (with `setup.py`/`pyproject.toml` at the repo
root) is genuinely installable, not just structured to look like a package.

---

## Architecture Components

### **1. `ai_governance/guardrails.py` — Reusable Guardrail Module**

**Purpose:** Core 5-layer defense logic, importable by any notebook or script.

**Layers:**
1. **Input PII Detection** — Presidio analyzer/anonymizer for PII redaction
2. **Prompt Injection Heuristics** — Regex-based detection of known injection patterns
3. **Resource Limits** — Per-call caps on input chars and output tokens
4. **Output Toxicity Detection** — BERT-based toxicity classifier
5. **Output PII Detection** — Presidio on model responses

**Key Function:**
```python
def run_guardrails(input_text: str, model_response: str) -> dict:
    """
    Returns:
    {
        "triggered": bool,      # Any guardrail fired
        "reasons": str,         # Comma-separated reasons
        "blocked": bool,        # Would block from reaching user
        "redacted_input": str,  # PII-redacted input
        "redacted_output": str  # PII-redacted output
    }
    """
```

**Benefits:**
- Single source of truth for guardrail logic
- Import into any notebook: `from ai_governance.guardrails import run_guardrails`
- Fix a bug once, all callers benefit
- Unit testable in isolation (see `tests/README.md`)

---

### **2. `data/test_prompts.csv` — Data-Driven Test Cases**

**Purpose:** Adversarial and control prompts as structured data, not
hardcoded Python.

**Real schema (8 columns, in this exact order):**
```
test_id,owasp_category,nist_control,iso_control,privacy_framework,prompt,is_control,notes
```

`nist_control`, `iso_control`, and `privacy_framework` are currently
**not yet linked** to real control records in `control_library` -- see
`GOVERNANCE_TRACEABILITY.md` for the honest status of that gap. Leave
them blank (with the comma placeholder) for new rows until that's fixed.

**Benefits:**
- Add new test cases without editing code -- just append to CSV
- Non-technical reviewers can edit test prompts
- Version control tracks test evolution
- Easy to expand from 13 to 50+ prompts

---

### **3. `notebooks/ai_guardrail_evaluation.py` — Evaluation Runner**

**Purpose:** Orchestration layer that imports guardrails, loads test data, and writes to Unity Catalog.

**Benefits:**
- Native Databricks execution -- Foundation Model API + Unity Catalog
- Human-in-the-loop review workflow, with a real completed review
  already in the notebook (see `IMPLEMENTATION_NOTES.md` and
  `notebooks/README.md`)
- Audit trail -- results written to governed Delta table
- Self-contained -- everything runs in one notebook

**Known limitation:** the notebook currently uses a hardcoded absolute
workspace path rather than resolving relative to its own location --
see `notebooks/README.md` for the exact line to update before reusing
this notebook elsewhere.

---

### **4. `scripts/run_eval.py` — Standalone Script (Optional, Actively Maintained)**

**Purpose:** Command-line evaluation for CI/CD or local execution outside Databricks.

Not a legacy/deprecated fallback -- it's the current, maintained
alternative interface for contexts where a Databricks notebook isn't
available.

**When to Use:**
- CI/CD pipelines that can't run Databricks notebooks (no CI is
  currently configured in this repo -- see `scripts/README.md`)
- Local development/testing before deploying to Databricks

**When NOT to Use:**
- The notebook is the primary, recommended interface for most users

---

## Architecture Diagram

### **Two Execution Modes (Same Core Modules)**

```
EXECUTION MODES (Choose One)
+---------------------------------+---------------------------------+
| MODE 1: NOTEBOOK (Interactive)  | MODE 2: SCRIPT (Automated)      |
| Recommended for most users      | CI/CD, local testing            |
+---------------------------------+---------------------------------+
| ai_guardrail_evaluation.py      | run_eval.py                     |
| (Databricks Notebook)           | (CLI Script)                    |
+---------------------------------+---------------------------------+
              |                                |
              +--------------+  +--------------+
                             |  |
                             v  v
         +---------------------------+  +---------------------------+
         | ai_governance.guardrails  |  | data/test_prompts.csv     |
         | 5-Layer Defense Module    |  | 8 adversarial + 5 control |
         +---------------------------+  +---------------------------+
                             |  |
                             v  v
+---------------------------------+---------------------------------+
| MODE 1 writes to:               | MODE 2 writes to:               |
| Unity Catalog Delta Table       | eval_results.csv                |
| ai_governance.risk_assessment   | (manual load to UC after review)|
| .guardrail_evaluations          |                                  |
| Direct write, no manual loading | Two-step: CSV then UC load      |
+---------------------------------+---------------------------------+
```

---

## Before vs After Refactoring

### **Before (Monolithic):**
- Guardrail logic inline in notebook (70+ lines)
- Test prompts hardcoded as Python list of dicts
- Can't reuse guardrails in other projects

### **After (Modular):**
- `ai_governance/guardrails.py` -- reusable, pip-installable module
- `data/test_prompts.csv` -- data-driven testing
- Clean separation of concerns

---

## How to Use

### **Adding More Test Prompts:**

1. Open `data/test_prompts.csv`
2. Add new rows matching the real 8-column schema -- leave
   `nist_control`, `iso_control`, `privacy_framework` blank (as empty
   fields with their comma placeholders) until traceability linking is
   fixed:
   ```csv
   TP-014,LLM01_prompt_injection,,,,"# Modular Architecture - Guardrail Evaluation Harness

## Overview

The guardrail evaluation harness is built as a **modular, pip-installable
architecture** that separates concerns, enables reusability, and
demonstrates professional software engineering practices. The
`ai_governance` package (with `setup.py`/`pyproject.toml` at the repo
root) is genuinely installable, not just structured to look like a package.

---

## Architecture Components

### **1. `ai_governance/guardrails.py` — Reusable Guardrail Module**

**Purpose:** Core 5-layer defense logic, importable by any notebook or script.

**Layers:**
1. **Input PII Detection** — Presidio analyzer/anonymizer for PII redaction
2. **Prompt Injection Heuristics** — Regex-based detection of known injection patterns
3. **Resource Limits** — Per-call caps on input chars and output tokens
4. **Output Toxicity Detection** — BERT-based toxicity classifier
5. **Output PII Detection** — Presidio on model responses

**Key Function:**
```python
def run_guardrails(input_text: str, model_response: str) -> dict:
    """
    Returns:
    {
        "triggered": bool,      # Any guardrail fired
        "reasons": str,         # Comma-separated reasons
        "blocked": bool,        # Would block from reaching user
        "redacted_input": str,  # PII-redacted input
        "redacted_output": str  # PII-redacted output
    }
    """
```

**Benefits:**
- Single source of truth for guardrail logic
- Import into any notebook: `from ai_governance.guardrails import run_guardrails`
- Fix a bug once, all callers benefit
- Unit testable in isolation (see `tests/README.md`)

---

### **2. `data/test_prompts.csv` — Data-Driven Test Cases**

**Purpose:** Adversarial and control prompts as structured data, not
hardcoded Python.

**Real schema (8 columns, in this exact order):**
```
test_id,owasp_category,nist_control,iso_control,privacy_framework,prompt,is_control,notes
```

`nist_control`, `iso_control`, and `privacy_framework` are currently
**not yet linked** to real control records in `control_library` -- see
`GOVERNANCE_TRACEABILITY.md` for the honest status of that gap. Leave
them blank (with the comma placeholder) for new rows until that's fixed.

**Benefits:**
- Add new test cases without editing code -- just append to CSV
- Non-technical reviewers can edit test prompts
- Version control tracks test evolution
- Easy to expand from 13 to 50+ prompts

---

### **3. `notebooks/ai_guardrail_evaluation.py` — Evaluation Runner**

**Purpose:** Orchestration layer that imports guardrails, loads test data, and writes to Unity Catalog.

**Benefits:**
- Native Databricks execution -- Foundation Model API + Unity Catalog
- Human-in-the-loop review workflow, with a real completed review
  already in the notebook (see `IMPLEMENTATION_NOTES.md` and
  `notebooks/README.md`)
- Audit trail -- results written to governed Delta table
- Self-contained -- everything runs in one notebook

**Known limitation:** the notebook currently uses a hardcoded absolute
workspace path rather than resolving relative to its own location --
see `notebooks/README.md` for the exact line to update before reusing
this notebook elsewhere.

---

### **4. `scripts/run_eval.py` — Standalone Script (Optional, Actively Maintained)**

**Purpose:** Command-line evaluation for CI/CD or local execution outside Databricks.

Not a legacy/deprecated fallback -- it's the current, maintained
alternative interface for contexts where a Databricks notebook isn't
available.

**When to Use:**
- CI/CD pipelines that can't run Databricks notebooks (no CI is
  currently configured in this repo -- see `scripts/README.md`)
- Local development/testing before deploying to Databricks

**When NOT to Use:**
- The notebook is the primary, recommended interface for most users

---

## Architecture Diagram

### **Two Execution Modes (Same Core Modules)**

```
EXECUTION MODES (Choose One)
+---------------------------------+---------------------------------+
| MODE 1: NOTEBOOK (Interactive)  | MODE 2: SCRIPT (Automated)      |
| Recommended for most users      | CI/CD, local testing            |
+---------------------------------+---------------------------------+
| ai_guardrail_evaluation.py      | run_eval.py                     |
| (Databricks Notebook)           | (CLI Script)                    |
+---------------------------------+---------------------------------+
              |                                |
              +--------------+  +--------------+
                             |  |
                             v  v
         +---------------------------+  +---------------------------+
         | ai_governance.guardrails  |  | data/test_prompts.csv     |
         | 5-Layer Defense Module    |  | 8 adversarial + 5 control |
         +---------------------------+  +---------------------------+
                             |  |
                             v  v
+---------------------------------+---------------------------------+
| MODE 1 writes to:               | MODE 2 writes to:               |
| Unity Catalog Delta Table       | eval_results.csv                |
| ai_governance.risk_assessment   | (manual load to UC after review)|
| .guardrail_evaluations          |                                  |
| Direct write, no manual loading | Two-step: CSV then UC load      |
+---------------------------------+---------------------------------+
```

---

## Before vs After Refactoring

### **Before (Monolithic):**
- Guardrail logic inline in notebook (70+ lines)
- Test prompts hardcoded as Python list of dicts
- Can't reuse guardrails in other projects

### **After (Modular):**
- `ai_governance/guardrails.py` -- reusable, pip-installable module
- `data/test_prompts.csv` -- data-driven testing
- Clean separation of concerns

---

## How to Use

### **Adding More Test Prompts:**

1. Open `data/test_prompts.csv`
2. Add new rows matching the real 8-column schema -- leave
   `nist_control`, `iso_control`, `privacy_framework` blank (as empty
   fields with their comma placeholders) until traceability linking is
   fixed:
   ```csv
   TP-014,LLM01_prompt_injection,,,,"New adversarial prompt",FALSE,"Notes"
   ```
   Getting the comma count wrong here will silently misalign every
   column after the gap -- this exact bug happened once already in
   this project (control prompts were sent the literal string "TRUE"
   instead of their real text) before being caught and fixed.
3. Save and re-run the notebook or script -- no code changes needed

### **Reusing Guardrails:**
```python
# If ai_governance is pip-installed (pip install -e . from repo root):
from ai_governance.guardrails import run_guardrails

# If not installed, add the repo root to sys.path first:
import sys
sys.path.append("/Workspace/Users/<your-email>/<path-to-repo>")
from ai_governance.guardrails import run_guardrails

result = run_guardrails("User input", "Model response")
```

---

## Interview Talking Points

**"Why did you modularize this?"**

"I structured the guardrail harness as a pip-installable package --
`ai_governance/guardrails.py` for the reusable 5-layer defense logic,
`data/test_prompts.csv` for data-driven test cases, and the notebook
as a thin orchestration layer. This demonstrates separation of
concerns and reusability, not just scripting."

**"What's the benefit of data-driven testing?"**

"With CSV-based prompts, adding a new test case is appending a row,
not editing Python. The trade-off is real, though -- I once got the
column count wrong adding a batch of new fields and it silently
misaligned the data being sent to the model. I caught it by manually
reviewing the transcripts, which is exactly why I don't automate
attack-success detection either."

---

## Summary

- **Modular:** `ai_governance.guardrails` is a real, reusable, pip-installable module
- **Data-Driven:** `test_prompts.csv` enables no-code expansion, with a documented column-alignment risk
- **Two real interfaces:** notebook (primary) and script (CI/CD, local), both actively maintained
- **Honest about limitations:** hardcoded notebook path, unresolved CSV control-code traceability -- both documented, not hidden adversarial prompt",FALSE,"Notes"
   ```
   Getting the comma count wrong here will silently misalign every
   column after the gap -- this exact bug happened once already in
   this project (control prompts were sent the literal string "TRUE"
   instead of their real text) before being caught and fixed.
3. Save and re-run the notebook or script -- no code changes needed

### **Reusing Guardrails:**
```python
# If ai_governance is pip-installed (pip install -e . from repo root):
from ai_governance.guardrails import run_guardrails

# If not installed, add the repo root to sys.path first:
import sys
sys.path.append("/Workspace/Users/<your-email>/<path-to-repo>")
from ai_governance.guardrails import run_guardrails

result = run_guardrails("User input", "Model response")
```

---

## Interview Talking Points

**"Why did you modularize this?"**

"I structured the guardrail harness as a pip-installable package --
`ai_governance/guardrails.py` for the reusable 5-layer defense logic,
`data/test_prompts.csv` for data-driven test cases, and the notebook
as a thin orchestration layer. This demonstrates separation of
concerns and reusability, not just scripting."

**"What's the benefit of data-driven testing?"**

"With CSV-based prompts, adding a new test case is appending a row,
not editing Python. The trade-off is real, though -- I once got the
column count wrong adding a batch of new fields and it silently
misaligned the data being sent to the model. I caught it by manually
reviewing the transcripts, which is exactly why I don't automate
attack-success detection either."

---

## Summary

- **Modular:** `ai_governance.guardrails` is a real, reusable, pip-installable module
- **Data-Driven:** `test_prompts.csv` enables no-code expansion, with a documented column-alignment risk
- **Two real interfaces:** notebook (primary) and script (CI/CD, local), both actively maintained
- **Honest about limitations:** hardcoded notebook path, unresolved CSV control-code traceability -- both documented, not hidden