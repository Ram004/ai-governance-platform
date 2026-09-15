"""
Configuration defaults for the AI Governance Platform.

These can be overridden via environment variables or at runtime.
"""

import os

# ============================================================
# Model Endpoint Configuration
# ============================================================
DEFAULT_MODEL_ENDPOINT = "databricks-meta-llama-3-1-8b-instruct"

# Unity Catalog Configuration
DEFAULT_CATALOG = "ai_governance"
DEFAULT_SCHEMA = "risk_assessment"

# ============================================================
# Guardrail Thresholds
# ============================================================

# PII Detection (Presidio)
PII_DETECTION_ENABLED = True
PII_ENTITIES = [
    "CREDIT_CARD",
    "EMAIL_ADDRESS",
    "PHONE_NUMBER",
    "PERSON",
    "LOCATION",
    "US_SSN",
    "DATE_TIME",
]

# Prompt Injection Detection (Regex heuristics)
INJECTION_DETECTION_ENABLED = True

# Toxicity Detection (BERT)
TOXICITY_THRESHOLD = 0.5
TOXICITY_DETECTION_ENABLED = True

# Resource Limits
MAX_INPUT_CHARS = 4000
MAX_OUTPUT_TOKENS = 1000

# ============================================================
# Evaluation Configuration
# ============================================================
REQUEST_DELAY_SECONDS = 2  # Delay between model calls to avoid rate limits
DEFAULT_MAX_TOKENS = 300
DEFAULT_TIMEOUT_SECONDS = 30

# ============================================================
# Runtime Overrides (from environment variables)
# ============================================================
def get_config():
    """
    Returns current configuration, respecting environment variable overrides.
    """
    return {
        "model_endpoint": os.getenv("MODEL_ENDPOINT_NAME", DEFAULT_MODEL_ENDPOINT),
        "catalog": os.getenv("UC_CATALOG", DEFAULT_CATALOG),
        "schema": os.getenv("UC_SCHEMA", DEFAULT_SCHEMA),
        "pii_detection": os.getenv("PII_DETECTION_ENABLED", str(PII_DETECTION_ENABLED)).lower() == "true",
        "toxicity_threshold": float(os.getenv("TOXICITY_THRESHOLD", str(TOXICITY_THRESHOLD))),
        "max_input_chars": int(os.getenv("MAX_INPUT_CHARS", str(MAX_INPUT_CHARS))),
        "max_output_tokens": int(os.getenv("MAX_OUTPUT_TOKENS", str(MAX_OUTPUT_TOKENS))),
    }
