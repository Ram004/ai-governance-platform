# Enterprise AI Governance & Risk Analytics Platform

## Overview

Built an AI Governance & Assurance Platform on Databricks Unity Catalog to answer a question I kept running into:

**What does AI governance actually look like when it's operationalised, not just documented?**

The platform assesses real-world AI systems against leading governance, risk, privacy, and assurance frameworks while providing measurable evidence of AI control effectiveness.

**Portfolio target:** AI Governance Manager, Responsible AI, AI Assurance, AI Risk, Data Governance, and Trusted AI roles.

---

## Platform Capabilities

### AI Risk Assessment

- 25 real, publicly cited AI systems
- 8 sectors:
  - Government
  - Banking
  - Insurance
  - Telecommunications
  - Healthcare
  - Education
  - Law Enforcement
  - Other regulated industries

### Six-Dimensional Risk Assessment Framework

Each use case is assessed across:

1. Privacy
2. Security
3. Bias
4. Regulatory
5. Reputational
6. Operational

This approach avoids hiding materially different risks behind a single aggregate score.

---

## Governance Framework Coverage

### NIST AI RMF

Coverage across all four functions:

- Govern
- Map
- Measure
- Manage

### ISO/IEC 42001

Coverage across key Annex A governance controls including:

- Governance policies
- Oversight responsibilities
- AI impact assessments
- AI lifecycle management
- Data governance
- Transparency and documentation
- Intended-use restrictions
- Third-party dependencies

### Privacy Controls

Mapped against:

- APP 3
- APP 6
- APP 10
- APP 11

---

## Verified Platform Components

| Component | Count |
|------------|----------|
| Use Cases | 25 |
| Risk Scores | 150 |
| Governance Controls | 20 |
| Control-to-Use-Case Mappings | 500 |
| Risk Register Entries | 25 |
| ISO/IEC 42001 Maturity Records | 20 |
| Stewardship (RACI) Records | 6 |
| Guardrail Test Prompts | 30 |
| OWASP Categories Covered | 10 / 10 |

---

## AI Governance Assurance Framework

In addition to governance assessment, the platform includes a working AI assurance capability aligned to the OWASP Top 10 for LLM Applications (2025).

### Five-Layer Control Architecture

#### Layer 1 – Input Privacy Controls

- PII detection
- PII redaction

#### Layer 2 – Prompt Injection Controls

- Prompt injection detection
- Heuristic rule-based validation

#### Layer 3 – Resource Protection Controls

- Token limits
- Character limits
- Resource consumption controls

#### Layer 4 – Output Safety Controls

- Toxicity detection
- Harmful-output classification

#### Layer 5 – Output Privacy Controls

- Output PII detection
- Output redaction

---

## Assurance Test Coverage

### OWASP Top 10 for LLM Applications (2025)

Coverage across:

- LLM01 Prompt Injection
- LLM02 Sensitive Information Disclosure
- LLM03 Supply Chain
- LLM04 Data and Model Poisoning
- LLM05 Improper Output Handling
- LLM06 Excessive Agency
- LLM07 System Prompt Leakage
- LLM08 Vector and Embedding Weaknesses
- LLM09 Misinformation
- LLM10 Unbounded Consumption

### Test Suite

| Type | Count |
|--------|--------|
| Adversarial Prompts | 24 |
| Control Prompts | 6 |
| Total Tests | 30 |

---

## Governance Assurance Results

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

The primary governance metric is **control effectiveness**, which measures the proportion of adversarial scenarios successfully resisted by the control framework. The assurance framework provides traceability from OWASP LLM risks through NIST AI RMF controls, ISO/IEC 42001 controls, and Privacy Framework obligations.


---

## Key Lessons Learned

### Transparency Reporting Has Limits

Government AI transparency statements often discuss governance at the domain level rather than the individual use-case level.

### Governance Requires Methodology Validation

A data-loading issue in the evaluation harness caused control prompts to send incorrect content to the model.

Finding and correcting this issue before reporting results was a governance outcome, not merely a technical fix.

### Multi-Dimensional Risk Scoring Matters

Some systems scored relatively low on Privacy risk while scoring materially higher on Bias or Operational risk.

A single combined risk score would have obscured these differences.

---

## Architecture

Built on Databricks Unity Catalog using:

- Unity Catalog
- Delta Tables
- Governance-aware schemas
- RACI stewardship assignments
- Framework mappings
- AI assurance testing
- Risk reporting datasets

The architecture is designed to support both governance oversight and assurance reporting.

---

## Future Roadmap

### Governance

- Expand from 25 to 50 use cases
- Extend maturity assessments across all use cases
- Historical assurance tracking and trend reporting

### Data Engineering

- Medallion Architecture
- Delta Live Tables (DLT)
- dbt
- Workflow Orchestration
- Terraform
- CI/CD

### Reporting

- Executive Governance Dashboard
- Risk Heatmaps
- Control Effectiveness Trends
- OWASP Coverage Analytics
- Framework Traceability Reporting

---

## Outcome

This project demonstrates how AI governance frameworks can be translated into:

- Risk assessments
- Governance controls
- Assurance testing
- Measurable control effectiveness
- Executive reporting

Rather than treating governance as documentation alone, the platform operationalises governance through evidence-based assessment and assurance practices.