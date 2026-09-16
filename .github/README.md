# Enterprise AI Governance & Assurance Platform

<img width="1727" height="855" alt="enterprise_ai_dashboard" src="https://github.com/user-attachments/assets/64172ed4-c80d-44a5-af3c-45c38934385f" />


A Unity Catalog-native AI Governance & Assurance Platform built on Databricks that assesses real-world AI systems against leading governance, risk, assurance, and privacy frameworks.

The platform evaluates **25 publicly cited AI systems across 8 sectors** and demonstrates how governance requirements can be translated into measurable controls, assurance testing, accountability structures, and risk reporting.

Framework coverage includes:

- ISO/IEC 42001
- NIST AI Risk Management Framework (AI RMF)
- Australian Privacy Principles (APPs)
- OWASP Top 10 for LLM Applications (2025)

The project combines AI Governance, Responsible AI, AI Risk Management, AI Assurance, and Data Governance into a single governance-oriented analytics platform.

---

# Platform Highlights

| Metric | Value |
|----------|----------|
| AI Systems Assessed | 25 |
| Industry Sectors | 8 |
| Risk Scores Generated | 150 |
| Governance Controls Evaluated | 20 |
| Control-to-Use Case Mappings | 500 |
| Risk Register Entries | 25 |
| ISO 42001 Maturity Assessments | 20 |
| Stewardship Assignments | 6 |
| Assurance Test Prompts | 30 |
| OWASP Coverage | 10 / 10 Categories |

---

# Problem Statement

As organizations deploy AI across critical business functions, governance teams face increasing challenges in:

- Identifying AI-related risks
- Demonstrating regulatory compliance
- Validating AI controls
- Tracking accountability
- Producing audit-ready evidence
- Measuring the effectiveness of governance controls

Many governance programs focus on documentation and policy creation but lack measurable assurance outcomes.

This project demonstrates how governance frameworks can be operationalized using structured datasets, governance controls, assurance testing, and measurable performance indicators.

---

# Governance Framework Traceability

<img width="1069" height="750" alt="framework_traceability" src="https://github.com/user-attachments/assets/7777b52c-fb8e-4472-a522-786ff8aa34eb" />


One of the platform's core capabilities is governance traceability.

The platform creates evidence-based mappings between:

```text
OWASP Top 10 Risks
        ↓
NIST AI RMF Controls
        ↓
ISO/IEC 42001 Controls
        ↓
Privacy Framework Controls
        ↓
Assurance Results
```

This enables technical control validation to be linked directly to governance and compliance obligations.

---

# AI Assurance Framework

The platform includes a practical AI Assurance Framework aligned with the OWASP Top 10 for LLM Applications (2025).

Governance controls are validated through adversarial testing and manual assurance review.

## Five-Layer AI Control Architecture

### Layer 1 — Input Privacy Controls

- PII detection
- Sensitive data identification
- Presidio-based privacy controls
- Data redaction

### Layer 2 — Prompt Injection Controls

- Prompt injection detection
- Adversarial prompt identification
- Heuristic pattern matching
- Rule-based validation

### Layer 3 — Resource Protection Controls

- Token limits
- Character limits
- Resource consumption controls
- Abuse prevention safeguards

### Layer 4 — Output Safety Controls

- Content moderation
- Toxicity detection
- Harmful content classification
- Safety validation

### Layer 5 — Output Privacy Controls

- Output PII detection
- Generated response review
- Data leakage prevention
- Privacy redaction

---

# Assurance Results

<img width="1620" height="412" alt="control_effectiveness" src="https://github.com/user-attachments/assets/4fd722c0-0654-4a5a-8a13-98510b397725" />


The assurance framework evaluates the effectiveness of governance controls through adversarial testing.

| Metric | Result |
|----------|----------|
| Total Tests Executed | 30 |
| Adversarial Tests | 24 |
| Control Tests | 6 |
| Controls Effective | 21 / 24 |
| Control Effectiveness | **87.5%** |
| Attack Success Rate | 12.5% |
| Attacks Resisted | 21 |
| Attack Successes | 3 |
| OWASP Coverage | 10 / 10 Categories |

All adversarial outcomes were manually reviewed and documented to provide defensible assurance evidence.

The primary governance metric is **Control Effectiveness**, which measures the proportion of adversarial scenarios successfully resisted by the AI Governance Assurance Framework.

---

# Governance Framework Coverage

## ISO/IEC 42001

The platform evaluates evidence against key Annex A control areas including:

- Policy documentation
- Governance oversight
- AI impact assessments
- Lifecycle management
- Data lineage and governance
- Model transparency and documentation
- Intended-use restrictions
- Third-party dependency management

## NIST AI Risk Management Framework

Coverage spans all four functions.

### GOVERN

- Governance structures
- Accountability models
- Risk management policies
- Organizational oversight

### MAP

- Context establishment
- Stakeholder analysis
- Risk identification
- Impact assessment

### MEASURE

- Performance monitoring
- Fairness evaluation
- Transparency assessment
- Explainability analysis

### MANAGE

- Risk treatment
- Incident response
- Human oversight
- Escalation mechanisms

## Australian Privacy Principles

The platform maps governance controls to:

- APP 3 – Collection of Personal Information
- APP 6 – Use and Disclosure of Personal Information
- APP 10 – Quality of Personal Information
- APP 11 – Security of Personal Information

---

# Risk Assessment Methodology

Each AI use case is assessed across six independent governance dimensions:

1. Privacy Risk
2. Security Risk
3. Bias Risk
4. Regulatory Risk
5. Reputational Risk
6. Operational Risk

Rather than relying on a single aggregated risk score, the platform uses multidimensional assessment to improve governance visibility and support targeted risk treatment decisions.

---

# Representative Use Cases

The platform includes assessments of publicly cited AI systems across government, financial services, and other regulated sectors.

Examples include:

### UC-001

**Digital Transformation Agency (DTA)**

AI-assisted procurement decision support.

### UC-002

**Digital Service Standard (DSS)**

AI disclosure and transparency case study.

### UC-003

**Australian Taxation Office (ATO)**

Tax and superannuation compliance risk differentiation.

### UC-004

**Commonwealth Bank of Australia (CBA)**

Real-time fraud and scam detection.

### UC-005

**BioCatch Cross-Bank Pilot**

Behavioural biometrics-based fraud detection with publicly disclosed governance limitations.

---

# Data & Governance Assets

The platform includes:

- AI Use Case Inventory
- AI Risk Register
- Governance Control Library
- ISO/IEC 42001 Maturity Assessments
- NIST AI RMF Mappings
- Privacy Framework Mappings
- RACI Accountability Assignments
- Governance Evidence Tracking
- Assurance Testing Results
- Control Effectiveness Reporting

---

# Technology Stack

## Platform

- Databricks
- Unity Catalog
- Delta Tables

## Languages

- Python
- SQL

## Governance Tooling

- GitHub
- GitHub Actions
- Dependabot

## AI Governance Frameworks

- ISO/IEC 42001
- NIST AI RMF
- OWASP Top 10 for LLM Applications (2025)
- Australian Privacy Principles

---

# Repository Structure

```text
ai_governance/
├── data/
├── docs/
├── images/
├── notebooks/
├── scripts/
├── sql/
└── tests/
```

---

# Key Methodological Decisions

## Disclosed vs Inferred Evidence

Public AI governance disclosures vary significantly in maturity and detail.

Each assessment artefact is tagged as:

```text
disclosed
```

or

```text
inferred_by_assessor
```

This provides transparency regarding what was explicitly evidenced versus what required assessor judgement.

## Manual Assurance Review

Automated determination of attack success can produce unreliable outcomes.

A manual review process was adopted to provide:

- Higher assurance confidence
- Improved explainability
- Defensible governance evidence
- Stronger auditability

---

# Future Roadmap

## Governance Expansion

- Expand from 25 to 50+ assessed AI systems
- Additional ISO/IEC 42001 maturity assessments
- Versioned assurance runs
- Longitudinal governance tracking

## Reporting & Analytics

- Executive dashboards
- Governance scorecards
- Control effectiveness trends
- OWASP coverage analytics
- Framework traceability analytics
- Assurance reporting

---

# Portfolio Purpose

This project demonstrates the integration of:

- AI Governance
- Responsible AI
- AI Risk Management
- AI Assurance
- Regulatory Alignment
- Governance Framework Mapping
- Technical AI Control Validation

into a single governance-oriented analytics platform.

The objective is not simply compliance documentation, but the creation of measurable governance evidence, assurance outcomes, and audit-ready decision-support artefacts that support trustworthy AI deployment.

---

# License

MIT License
