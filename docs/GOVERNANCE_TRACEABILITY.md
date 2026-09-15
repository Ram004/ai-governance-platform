# Governance Traceability — Status

## Current Status

Governance traceability is now fully integrated into the AI Governance Assurance Framework.

Each guardrail evaluation test is linked to:

- OWASP Top 10 for LLM Applications (2025)
- NIST AI RMF controls
- ISO/IEC 42001 controls
- Privacy Framework controls

This allows every assurance result to be traced from a technical test outcome to a governance control and framework obligation.

---

## Framework Mapping Coverage

The current test suite contains **30 test cases**:

- 24 adversarial tests
- 6 control tests

Covering all **10 OWASP Top 10 for LLM Applications (2025)** categories.

Every test includes governance metadata:

| Field | Purpose |
|----------|----------|
| `owasp_category` | AI risk category being tested |
| `nist_control` | NIST AI RMF control mapping |
| `iso_control` | ISO/IEC 42001 control mapping |
| `privacy_framework` | Privacy control mapping |
| `test_id` | Assurance traceability identifier |

---

## Example Traceability

| Test | OWASP Category | NIST AI RMF | ISO/IEC 42001 | Privacy Framework |
|----------|----------|----------|----------|----------|
| TP-001 | LLM01 Prompt Injection | MG-3.2 | A.9 | APP_11 |
| TP-004 | LLM05 Improper Output Handling | MG-3.1 | A.8 | APP_11 |
| TP-006 | LLM02 Sensitive Information Disclosure | MP-3.1 | A.7 | APP_3 |
| TP-016 | LLM06 Excessive Agency | GV-2.1 | A.9 | APP_6 |
| TP-020 | LLM07 System Prompt Leakage | MG-3.2 | A.9 | APP_11 |
| TP-029 | LLM09 Misinformation | MS-1.4 | A.8 | APP_10 |

This provides traceability from:

```text
Test Case
        ↓
OWASP Category
        ↓
Framework Control
        ↓
Assurance Result
```

---

## Governance Assurance Results

The AI Governance Assurance Framework validates governance controls through OWASP Top 10 for LLM Applications (2025) testing and provides traceability to NIST AI RMF, ISO/IEC 42001, and Privacy Framework obligations.

| Metric | Result |
|----------|----------|
| Total Tests Executed | 30 |
| Adversarial Tests | 24 |
| Control Tests | 6 |
| Controls Effective | 21 / 24 |
| Control Effectiveness | 87.5% |
| Control Failures | 3 |
| Attack Success Rate | 12.5% |
| Attacks Resisted | 21 |
| Attack Successes | 3 |
| OWASP Coverage | 10 / 10 Categories |

All adversarial outcomes were manually reviewed and documented to provide a defensible assurance process.

Following a prompt-handling correction and re-evaluation of the assurance test suite, control effectiveness was revised from 91.7% to 87.5%. Updated results reflect the corrected methodology and latest assurance run.

The primary governance metric is **control effectiveness**, which measures the proportion of adversarial scenarios successfully resisted by the control framework.

The assurance framework provides traceability from:

```text
OWASP Risk
        ↓
NIST AI RMF Control
        ↓
ISO/IEC 42001 Control
        ↓
Privacy Framework Control
        ↓
Assurance Test Result
```

---

## Why Traceability Matters

The goal is not simply to answer:

> "Did the model block the attack?"

The more valuable governance question is:

> "Which control objective was validated, and what governance framework does that control support?"

For example:

```text
Prompt Injection Test
        ↓
LLM01 Prompt Injection
        ↓
NIST AI RMF MG-3.2
        ↓
ISO/IEC 42001 A.9
        ↓
Control Effectiveness Result
```

This transforms technical testing into governance evidence.

---

## Governance Reporting Capability

The platform supports reporting across:

- OWASP LLM Top 10 (2025)
- NIST AI RMF
- ISO/IEC 42001
- Privacy Framework controls
- Control effectiveness metrics
- AI assurance outcomes

This enables governance stakeholders to trace:

```text
AI Use Case
        ↓
Risk Assessment
        ↓
Governance Control
        ↓
Assurance Test
        ↓
Control Effectiveness Result
```

rather than treating security testing and governance reporting as separate activities.

---

## Outcome

The platform demonstrates governance traceability from framework requirements through to measurable assurance outcomes.

Instead of reporting:

> "The model blocked an attack."

the platform can report:

> "The assurance framework validated a specific governance control, mapped to NIST AI RMF, ISO/IEC 42001, and privacy obligations, with evidence captured in the guardrail evaluation results."

That level of traceability is a core capability of a mature AI governance and assurance program.