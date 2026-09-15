# Interview Prep — Enterprise AI Governance Platform

Every number in this document is verified against the live Unity Catalog tables and governance assurance results. If a number here does not match a fresh query, the table is the source of truth.

## 30-Second Pitch

"I built an AI Governance & Assurance Platform on Databricks Unity Catalog that assesses 25 real, publicly cited AI systems across 8 sectors against a six-dimensional risk framework and 20 governance controls, including ISO/IEC 42001 and NIST AI RMF. The platform contains 500 control-to-use-case mappings, 150 risk assessments, a risk register, maturity scoring, and a working AI assurance framework aligned to the OWASP Top 10 for LLM Applications (2025). The assurance framework achieved 91.7% control effectiveness, resisting 22 of 24 adversarial test scenarios."

---

## Walk Me Through the Project

The project started from a simple question:

**What does operational AI governance actually look like when implemented, not just documented?**

I began with real governance frameworks, primarily ISO/IEC 42001, NIST AI RMF, Australian Privacy Principles, and public-sector AI guidance.

Rather than creating hypothetical examples, I sourced 25 real AI use cases from government AI transparency statements, bank disclosures, regulator publications, and vendor case studies.

One of the first findings was that many public disclosures describe governance at the domain level rather than the individual use-case level. That became part of the methodology itself and is reflected in the governance assessments.

I then designed a six-dimensional risk assessment model covering:

- Privacy
- Security
- Bias
- Regulatory
- Reputational
- Operational risk

Each use case was assessed against 20 governance controls:

- 8 ISO/IEC 42001 controls
- 12 NIST AI RMF controls

This resulted in:

- 25 use cases## What Were the Assurance Results?

The framework executed:

- 30 total tests
- 24 adversarial tests
- 6 control tests

Results:

- Controls Effective: 21 / 24
- Control Effectiveness: 87.5%
- Control Failures: 3
- Attack Success Rate: 12.5%
- OWASP Coverage: 10 / 10 Categories

The primary governance metric is **control effectiveness**, not attack count.

All adversarial outcomes were manually reviewed and documented using reviewer rationale rather than relying solely on automated attack-success classification.
- 150 risk scores
- 500 control mappings
- 25 risk register records

I then extended the platform into AI assurance by building a practical guardrail evaluation framework.

The assurance layer evaluates controls across five areas:

1. Input Privacy Controls
2. Prompt Injection Controls
3. Resource Protection Controls
4. Output Safety Controls
5. Output Privacy Controls

The framework was executed against a 30-prompt test suite aligned to all ten categories of the OWASP Top 10 for LLM Applications (2025).

Every adversarial outcome was manually reviewed and documented rather than relying entirely on automated attack-success classification.

---

## What Were the Assurance Results?

The framework executed:

- 30 total tests
- 24 adversarial tests
- 6 control tests

Results:

- Controls Effective: 21 / 24
- Control Effectiveness: 87.5%
- Control Failures: 3
- Attack Success Rate: 12.5%
- OWASP Coverage: 10 / 10 Categories

The primary governance metric is **control effectiveness**, not attack count.

All adversarial outcomes were manually reviewed and documented using reviewer rationale rather than relying solely on automated attack-success classification.

---

## What's the Difference Between Inherent and Residual Risk?

Inherent risk is the risk present before considering any controls.

Within the platform, the six-dimensional risk scores represent inherent risk.

Residual risk reflects the remaining exposure once governance controls are considered.

This is determined through the control implementation status stored against each use case:

- implemented
- partially_implemented
- not_implemented

Two use cases may have identical inherent risk scores but significantly different residual risks depending on their control coverage.

---

## Why Manual Review for Guardrail Success?

Attack-success determination is often more nuanced than a simple success/failure outcome.

For example:

- A model may partially comply with an instruction.
- A model may refuse while still revealing useful information.
- A jailbreak may appear successful but fail to bypass meaningful controls.

At the scale of 24 adversarial tests, manually reviewing each transcript and recording reviewer rationale is both practical and more defensible than relying purely on automated heuristics.

The objective is governance assurance, not benchmark gaming.

---

## What's a Real Technical Problem You Solved?

While implementing the guardrail framework, I initially attempted to create a custom model serving endpoint on Databricks and received a "Compute scale-out is required" error.

The issue was that Free Edition supports Foundation Model API endpoints but not dedicated custom serving infrastructure.

The solution was to use Databricks-hosted Foundation Model endpoints directly rather than attempting to deploy a custom serving endpoint.

That allowed the assurance framework to run against a live production-grade model while remaining within platform constraints.

---

## Why Use Both ISO/IEC 42001 and NIST AI RMF?

They solve different but complementary problems.

### ISO/IEC 42001

Provides:

- Management system requirements
- Auditable controls
- Governance artifacts
- Certification-oriented evidence

### NIST AI RMF

Provides:

- Risk management processes
- Ongoing governance activities
- Measurement and monitoring
- Operational decision support

Using both creates a more complete governance model than either framework alone.

---

## Why Use Six Risk Dimensions Instead of One Score?

A single risk number conceals important differences.

For example:

- A use case may have relatively low Privacy risk but high Bias risk.
- Another may have low Bias risk but extremely high Operational risk.

Multi-dimensional scoring supports better governance decisions because it reveals which specific risks are driving concern.

---

## Key Governance Lessons Learned

### Public Transparency Has Limits

Government transparency statements often disclose governance at a domain level rather than an individual use-case level.

That distinction matters when conducting assurance assessments.

### Methodology Governance Matters

A data-loading issue in the guardrail framework caused incorrect prompt data to be passed during testing.

Identifying and correcting the issue before reporting results was as important as the resulting metrics.

### Assurance Produces Better Governance Evidence

Framework mappings alone show intended governance.

Assurance testing demonstrates whether controls actually perform as expected.

---

## What Would You Change If You Built It Again?

1. Expand from 25 to 50 use cases to improve cross-sector analysis.
2. Extend maturity assessments across all assessed systems.
3. Introduce versioned assurance runs and historical trend monitoring.
4. Extend executive dashboards with multi-period assurance reporting.
5. Add automated trend analysis for control effectiveness over time.

---

## Honest Limitations

- 25 use cases toward a 50-use-case target
- Maturity scoring has not yet been expanded across the entire portfolio
- Much control implementation evidence is necessarily tagged as `inferred_by_assessor` rather than `disclosed`
- Assurance evaluation currently represents a point-in-time assessment rather than longitudinal monitoring across multiple evaluation cycles
- Sector coverage is broad but not exhaustive

---

## If Asked "What Makes This Different?"

Most governance projects stop at policies and framework mappings.

This platform goes further by connecting:

```text
AI Use Case
        ↓
Risk Assessment
        ↓
Governance Controls
        ↓
NIST AI RMF / ISO 42001
        ↓
Assurance Testing
        ↓
Control Effectiveness Metrics
        ↓
Executive Reporting
```

The goal was to demonstrate how governance frameworks can be translated into measurable assurance outcomes rather than remaining purely documentation exercises.