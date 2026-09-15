# Enterprise AI Governance & Assurance Platform -- Project Summary

## Overview

A Unity Catalog-native AI Governance & Assurance Platform assessing 25 real, publicly cited AI systems across 8 sectors against ISO/IEC 42001, NIST AI RMF, Australian Privacy Principles, and emerging AI governance requirements.

The platform includes a working AI assurance framework aligned to the OWASP Top 10 for LLM Applications (2025) and demonstrates how governance controls can be linked to measurable assurance outcomes.

**Portfolio target:** AI Governance Manager, Responsible AI, AI Assurance, AI Risk, Trusted AI, and Data Governance roles.

---

## Verified Platform Components

Every number below has been directly confirmed against live Unity Catalog tables and evaluation outputs.

| Component | Count | Notes |
|------------|----------|----------|
| Use cases | 25 | Real sources, cited, across 8 sectors |
| Risk scores | 150 | 6 dimensions × 25 use cases |
| Governance controls | 20 | 8 ISO/IEC 42001 controls + 12 NIST AI RMF controls |
| Control-to-use-case mappings | 500 | 20 controls × 25 use cases |
| Risk register entries | 25 | One per use case |
| ISO/IEC 42001 maturity scores | 20 | Initial maturity assessment dataset |
| Stewardship (RACI) records | 6 | Governance accountability assignments |
| Guardrail test prompts | 30 | 24 adversarial + 6 control prompts |
| OWASP LLM Categories Covered | 10 / 10 | Full OWASP Top 10 for LLM Applications (2025) coverage |

---

## AI Governance Assurance Results

The AI Governance Assurance Framework validates governance controls through OWASP Top 10 for LLM Applications (2025) testing and provides traceability to NIST AI RMF, ISO/IEC 42001, and Privacy Framework obligations.

The framework evaluates controls across five control layers:

1. Input Privacy Controls
2. Prompt Injection Controls
3. Resource Consumption Controls
4. Output Safety Controls
5. Output Privacy Controls

### Governance Assurance Results

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

## AI Control Architecture

The platform implements a five-layer AI control architecture.

### Layer 1: Input Privacy Controls

- PII detection and redaction
- Presidio-based entity recognition

### Layer 2: Prompt Injection Controls

- Rule-based prompt injection detection
- Regex and heuristic-based pattern matching

### Layer 3: Resource Protection Controls

- Token limits
- Character limits
- Resource consumption controls

### Layer 4: Output Safety Controls

- Toxicity detection
- Harmful-content classification
- BERT-based safety classifier

### Layer 5: Output Privacy Controls

- PII detection on generated responses
- Output redaction before release

---

## Representative Use Cases

### UC-001

**DTA** — AI-assisted decision support on procurement panel applications (Classical ML)

### UC-002

**DSS** — Domain-level AI disclosure only (LLM), included as a transparency and disclosure case study

### UC-003

**ATO** — Tax and superannuation compliance risk differentiation (Classical ML)

### UC-004

**CBA** — Real-time fraud and scam detection (Hybrid AI)

### UC-005

**BioCatch Cross-Bank Pilot** — Behavioural biometrics-based fraud detection with publicly disclosed false-positive limitations

---

## Framework Coverage

### ISO/IEC 42001

The platform evaluates evidence against eight Annex A control areas:

- Policy documentation
- Oversight roles and responsibilities
- AI impact assessments
- AI lifecycle management
- Data lineage and governance
- Model transparency and documentation
- Intended-use restrictions
- Third-party dependency management

### NIST AI RMF

Coverage spans all four functions:

#### GOVERN

- Accountable governance structures
- Risk management policies
- Organizational risk tolerance

#### MAP

- System context documentation
- Stakeholder impact mapping
- Risk identification and categorization

#### MEASURE

- Performance monitoring
- Fairness and bias testing
- Transparency and explainability

#### MANAGE

- Risk reviews
- Incident response
- Human oversight and escalation

### Privacy Framework Alignment

Mapped control coverage includes:

- APP 3: Collection of Personal Information
- APP 6: Use and Disclosure of Personal Information
- APP 10: Quality of Personal Information
- APP 11: Security of Personal Information

---

## Risk Assessment Methodology

### Six-Dimensional Risk Scoring Model

Every use case is assessed across six independent risk dimensions:

1. Privacy
2. Security
3. Bias
4. Regulatory
5. Reputational
6. Operational

### Why Six Dimensions Instead of One Score?

A single risk score hides which specific risk area is driving exposure.

Multi-dimensional risk assessment:

- Improves governance decisions
- Supports risk treatment planning
- Improves advisory reporting
- Enables targeted controls

---

## Key Methodological Decisions

### Why Disclosed vs Inferred Tagging?

Public AI governance disclosures vary significantly in maturity and detail.

Each assessment artefact is tagged as either:

```text
disclosed
```

or:

```text
inferred_by_assessor
```

This provides transparency regarding what was explicitly evidenced versus what required assessor judgement.

### Why Manual Review for Guardrail Evaluation?

Automated determination of attack success is often unreliable.

Given a manageable test volume, manual transcript review provides:

- Higher assurance confidence
- Better explainability
- Defensible governance evidence

### Why OWASP + NIST + ISO?

The frameworks provide complementary perspectives.

**OWASP Top 10 for LLM Applications (2025)**

- Technical AI threat taxonomy

**NIST AI RMF**

- Risk management operating model

**ISO/IEC 42001**

- Auditable AI management system controls

Together they create a governance approach spanning security, risk, assurance, and compliance.

---

## Current Strengths

### Governance

- Multi-framework traceability
- Risk register integration
- RACI accountability mapping
- AI control library

### Assurance

- OWASP Top 10 (2025) coverage
- Five-layer AI control architecture
- Manual adversarial review process
- Control effectiveness reporting
- Governance framework traceability
- False-positive validation using control prompts

### Data Platform

- Unity Catalog native
- Structured governance datasets
- Reusable evaluation framework
- Delta-based persistence

---

## Current Gaps and Future Roadmap

### Governance Expansion

- Extend from 25 to 50 assessed use cases
- Expand ISO/IEC 42001 maturity scoring across all use cases
- Introduce versioned assurance runs
- Add longitudinal control-effectiveness tracking

### Reporting & Visualization

Enhance governance reporting with:

- Control-effectiveness trends
- Framework traceability analytics
- OWASP coverage analytics
- Governance maturity dashboards
- Executive assurance reporting

---

## Current Portfolio Position

This platform demonstrates the integration of:

- AI Governance
- Responsible AI
- AI Risk Management
- AI Assurance
- Regulatory Alignment
- Governance Framework Mapping
- Technical AI Control Validation

into a single governance-oriented analytics platform.

The project demonstrates practical capability in operationalising governance frameworks, assessing AI risk, validating AI controls, and producing measurable assurance outcomes.