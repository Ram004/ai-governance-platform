# GitHub Workflows & Repository Configuration

This directory contains GitHub configuration, governance workflows, and repository automation supporting the Enterprise AI Governance & Assurance Platform.

The configuration demonstrates governance-oriented development practices including code review requirements, dependency management, automated validation, and change tracking.

---

## Repository Governance Components

### Continuous Integration (`ci.yml`)

Provides automated validation of repository changes.

**Capabilities:**

- Unit testing
- Linting
- Code quality checks
- Coverage reporting

**Triggers:**

- Push to `main`
- Push to `develop`
- Pull requests

---

### Dependency Governance (`dependabot.yml`)

Provides automated monitoring and updating of project dependencies.

**Capabilities:**

- Weekly dependency reviews
- Python package update monitoring
- GitHub Actions update monitoring
- Security update notifications
- Automated update grouping

---

### Code Ownership (`CODEOWNERS`)

Defines governance responsibilities for repository assets and enables structured review processes for changes impacting assurance logic, governance controls, and SQL assets.

**Examples:**

- Guardrail evaluation logic requires review
- SQL assets require review
- Governance documentation changes can be assigned to designated reviewers

---

### Pull Request Governance (`PULL_REQUEST_TEMPLATE.md`)

Standardizes change reviews through a structured governance process.

**Required elements:**

- Description of changes
- Testing evidence
- Governance impact assessment
- Security considerations
- Review checklist
- Validation steps

---

## Why These Files Matter

The platform focuses on governance, assurance, and accountability.

The GitHub configuration demonstrates governance practices such as:

- Change management
- Structured reviews
- Traceability
- Auditability
- Automated validation
- Dependency monitoring

These practices complement the governance controls, assurance testing, and framework mappings implemented throughout the platform.

---

## Recommended Repository Setup

### Enable GitHub Actions

Navigate to:

```text
Settings
    ↓
Actions
    ↓
General
```

Enable:

```text
Allow all actions and reusable workflows
```

---

### Configure Branch Protection

Recommended settings for the `main` branch:

- Require pull request reviews
- Require status checks to pass
- Require conversation resolution before merge
- Restrict direct commits to the main branch

---

### Configure Dependabot

Dependabot should be enabled to:

- Monitor dependency updates
- Track security advisories
- Generate update pull requests
- Improve supply-chain governance

---

## Local Validation

Before pushing changes, run:

```bash
# Run tests
pytest tests/ -v

# Lint code
flake8 .

# Check repository status
git status
```

---

## Troubleshooting

### CI Passes Locally but Fails in GitHub

Check:

- Python version compatibility
- Missing dependencies
- Environment-specific configuration
- Workflow permissions

### Dependabot Not Creating Pull Requests

Check:

- `dependabot.yml` syntax
- Repository security settings
- Dependency file locations

### CODEOWNERS Not Working

Check:

- File location is `.github/CODEOWNERS`
- Usernames are correct
- Repository permissions allow review assignment

---

## Repository Governance Alignment

This configuration supports governance practices aligned to:

- ISO/IEC 42001
- NIST AI RMF
- Change Management
- Risk Management
- Assurance Activities
- Traceability Requirements

The objective is not simply automation, but demonstrating governance-oriented development 