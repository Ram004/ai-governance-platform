# Risk Scoring Rubric

## Purpose

This rubric is used to assess AI use cases consistently across six governance risk dimensions.

Each dimension is scored from:

- **1 = Low Risk**
- **5 = High Risk**

For every score assigned:

- Record a one-line rationale.
- Record whether the assessment is based on:
  - `disclosed`
  - `inferred_by_assessor`

This rubric supports:

- AI Governance assessments
- AI Risk Management
- NIST AI RMF aligned reviews
- ISO/IEC 42001 assessments
- Privacy impact assessments
- Responsible AI reviews
- Executive governance reporting

The objective is to provide transparent, explainable, and auditable risk assessments rather than relying on a single opaque risk score.

---

## Required Assessment Fields

Every assessment should include:

| Field | Description |
|---------|---------|
| score | Risk rating between 1 and 5 |
| rationale | One-line explanation supporting the score |
| evidence_basis | `disclosed` or `inferred_by_assessor` |
| confidence_level | High / Medium / Low (optional) |

---

Score every use case 1 (low) to 5 (high) on each of six dimensions.

Always record a one-line rationale and whether the score is based on information the source `disclosed` or that you `inferred_by_assessor`.

## Privacy

1. No personal data involved
2. De-identified/aggregated personal data only
3. Personal data used with consent, low sensitivity (e.g. contact details)
4. Personal data used, includes sensitive categories (health, financial) — consent basis unclear
5. Sensitive personal data used at scale with no disclosed consent/legal basis or cross-border transfer

## Security

1. No system access beyond read-only public data
2. Internal system, standard access controls, no autonomous action
3. Internal system with elevated access or write permissions
4. Autonomous action capability (agentic, automated decisions) with limited oversight
5. Autonomous system with write/action capability over critical infrastructure or high-value transactions

## Bias

1. No protected-attribute-correlated data, no individual-level decisioning
2. Individual-level decisioning, but low-stakes (e.g. content recommendation)
3. Individual-level decisioning, moderate stakes, some fairness testing disclosed
4. High-stakes decision (credit, employment, benefits) on protected-attribute-correlated data, fairness testing not disclosed
5. High-stakes decision with disclosed bias incident or known disparate impact

## Regulatory

1. No specific AI/data regulation applies
2. Falls under general data protection law (e.g. Privacy Act) with standard compliance posture
3. Falls under sector-specific regulation (financial services, health) with compliance disclosed
4. Falls under emerging/high-risk AI regulation (EU AI Act high-risk, APS mandatory register) — compliance status unclear
5. Non-compliant or compliance status explicitly flagged as a gap in the source

## Reputational

1. Internal tool, no public-facing element
2. Public-facing but low visibility/low stakes
3. Public-facing, moderate visibility, some public scrutiny plausible
4. High-profile deployment, prior public controversy in this category (e.g. facial recognition, automated decision-making)
5. Documented reputational incident tied to this specific use case

## Operational

1. Pilot/proof-of-concept only, no production dependency
2. Production but non-critical, human fallback exists
3. Production, moderately critical, some automation without full fallback
4. Production, business-critical, limited human oversight
5. Production, mission-critical, autonomous, no disclosed fallback or kill-switch

## A note on ai_technique and scoring

`ai_technique` (LLM / Classical ML / Computer Vision / Agentic AI / Hybrid) is not itself a scored dimension, but it should inform your rationale — particularly for Security and Operational.

Agentic/autonomous systems tend to score higher on those two even at similar Bias/Regulatory risk, purely because human oversight is structurally reduced by design.

Don't let `ai_technique` silently bias your Bias or Regulatory scores — those should be driven by the decision's stakes and data sensitivity, not by whether the underlying model is generative or classical.

A Classical ML credit-scoring model and an LLM-based one carrying the same decision stakes should score similarly on Bias and Regulatory.

---

## Overall Risk Rating

The six dimensions should be scored independently.

For reporting purposes, an average score may be calculated:

| Average Score | Risk Rating |
|---------|---------|
| 1.0 – 1.9 | Low |
| 2.0 – 2.9 | Moderate |
| 3.0 – 3.9 | High |
| 4.0 – 5.0 | Critical |

**Important:** Individual dimension scores should always be retained.

A high score in a single dimension (for example Privacy, Bias, or Regulatory) should not be hidden by averaging across lower-risk dimensions.

---

## Governance Alignment

This rubric supports governance assessments aligned to:

- NIST AI RMF
- ISO/IEC 42001
- Australian Privacy Principles (APPs)
- Responsible AI reviews
- AI assurance activities
- AI risk registers
- Executive governance reporting

The rubric is intended to support practical governance decision-making rather than serve as a compliance checklist.

---

## Assessment Guidance

When evidence is incomplete:

- Prefer `disclosed` evidence where available.
- Use `inferred_by_assessor` where reasonable professional judgement is required.
- Record assumptions in the rationale.
- Use confidence levels where evidence quality varies.

Transparency of reasoning is considered part of the assessment outcome.