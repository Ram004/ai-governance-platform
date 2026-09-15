"""
AI Governance Platform - Enterprise AI Risk & Compliance Framework

A comprehensive governance platform implementing NIST AI RMF and ISO 42001 
frameworks with integrated LLM guardrail evaluation capabilities.
"""

__version__ = "0.1.0"
__author__ = "Ram Purmessur"

from .guardrails import run_guardrails

__all__ = ["run_guardrails"]
