"""
Setup configuration for ai-governance-platform package.
"""

from setuptools import setup, find_packages
import os

# Read README for long description
def read_file(filename):
    with open(os.path.join(os.path.dirname(__file__), filename), encoding="utf-8") as f:
        return f.read()

# Read requirements
def read_requirements(filename):
    with open(os.path.join(os.path.dirname(__file__), filename), encoding="utf-8") as f:
        return [line.strip() for line in f if line.strip() and not line.startswith("#")]

setup(
    name="ai-governance-platform",
    version="0.1.0",
    author="Ram Purmessur",
    author_email="ram.purmessur@gmail.com",
    description="Enterprise AI Governance & Risk Analytics Platform with LLM guardrail evaluation",
    long_description=read_file("README.md"),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/ai-governance-platform",
    packages=find_packages(exclude=["tests", "notebooks", "scripts", "docs"]),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
    ],
    python_requires=">=3.9",
    install_requires=read_requirements("requirements.txt"),
    package_data={
        "ai_governance": ["data/*.csv"],
    },
    include_package_data=True,
    entry_points={
        "console_scripts": [
            "ai-governance-eval=scripts.run_eval:main",
        ],
    },
    project_urls={
        "Documentation": "https://github.com/yourusername/ai-governance-platform/tree/main/docs",
        "Source": "https://github.com/yourusername/ai-governance-platform",
        "Tracker": "https://github.com/yourusername/ai-governance-platform/issues",
    },
)
