-- ============================================================
-- Seed batch 5 -- 2 more real, cited use cases (UC-018 to UC-019)
-- ============================================================
-- First healthcare-sector cases. UC-018 is notable as a second
-- confirmed/documented compliance concern (alongside UC-013),
-- sourced directly from the health regulator (AHPRA) itself.
-- Run after 13_seed_use_cases_batch4.sql.

USE CATALOG ai_governance;

INSERT INTO use_case_inventory.ai_use_cases VALUES
(
    'UC-018',
    'Australian general practice (sector-wide, via AHPRA case study)',
    'Healthcare',
    'https://www.ahpra.gov.au/Resources/Artificial-Intelligence-in-healthcare/Case-studies.aspx',
    'government_register',
    'government_register',
    'AI medical scribe tools used in GP consultations; some tools additionally suggest diagnoses, which meets the legal definition of a medical device',
    'LLM',
    'Production',
    'patient_consultation_data,clinical_notes',
    TRUE,
    DATE('2026-09-12'),
    'AHPRA''s own published case study describes a real scenario: an AI scribing tool suggested a diagnosis, which meets TGA''s legal definition of a medical device requiring premarket approval and ARTG inclusion. As of August 2026 no AI medical scribe has been TGA-approved despite an estimated 40% of Australian GPs using these tools. AHPRA explicitly documents hallucination (plausible but incorrect diagnostic suggestions) as a known error mode. Practitioner remains responsible for the resulting record regardless.'
),
(
    'UC-019',
    'Australian private radiology clinics (Aidoc, Zebra Medical Vision tools)',
    'Healthcare',
    'https://www.medicalsearch.com.au/buying-guide/ai-in-diagnosis-what-s-working-and-what-s-hype/f/26694',
    'analyst_report',
    'analyst_report',
    'AI-assisted image analysis for breast cancer detection in mammography, used to triage/support radiologist review',
    'Computer Vision',
    'Production',
    'medical_imaging_data',
    TRUE,
    DATE('2026-09-12'),
    'A 2023 Lancet Oncology study found AI-assisted mammography achieved 94.5% accuracy, reportedly higher than many experienced radiologists on that measure. Tools such as Aidoc and Zebra Medical Vision reported in use at several Australian private radiology clinics for triage. Sourced via secondary industry commentary citing the underlying study, not the clinics or study authors directly -- treat the specific figures as analyst-relayed, not primary-confirmed.'
);
