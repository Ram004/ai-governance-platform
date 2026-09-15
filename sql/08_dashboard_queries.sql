-- ============================================================
-- Minimal dashboard queries
-- ============================================================
-- Paste each into a Databricks SQL editor cell, run, then "Pin to
-- dashboard" -- that builds a Databricks SQL Dashboard without
-- needing Power BI connectivity at all. Run after 07_seed_governance_data.sql.

USE CATALOG ai_governance;

-- ------------------------------------------------------------
-- Tile 1: Portfolio overview -- one row per use case with its
-- average risk score across all six dimensions
-- ------------------------------------------------------------
SELECT
    u.use_case_id,
    u.org_name,
    u.industry,
    u.ai_technique,
    u.disclosure_type,
    ROUND(AVG(r.score_1_5), 1) AS avg_risk_score,
    MAX(r.score_1_5) AS highest_dimension_score
FROM use_case_inventory.ai_use_cases u
JOIN risk_assessment.risk_scores r ON u.use_case_id = r.use_case_id
GROUP BY u.use_case_id, u.org_name, u.industry, u.ai_technique, u.disclosure_type
ORDER BY avg_risk_score DESC;

-- ------------------------------------------------------------
-- Tile 2: Risk distribution by dimension (portfolio-wide) --
-- shows which risk dimension is scoring highest across all cases
-- ------------------------------------------------------------
SELECT
    dimension,
    ROUND(AVG(score_1_5), 1) AS avg_score,
    MIN(score_1_5) AS min_score,
    MAX(score_1_5) AS max_score,
    SUM(CASE WHEN risk_data_source = 'disclosed' THEN 1 ELSE 0 END) AS disclosed_count,
    SUM(CASE WHEN risk_data_source = 'inferred_by_assessor' THEN 1 ELSE 0 END) AS inferred_count
FROM risk_assessment.risk_scores
GROUP BY dimension
ORDER BY avg_score DESC;

-- ------------------------------------------------------------
-- Tile 3: Control implementation coverage -- what fraction of
-- applicable controls are actually implemented, per use case
-- ------------------------------------------------------------
SELECT
    use_case_id,
    COUNT(*) AS total_controls_assessed,
    SUM(CASE WHEN implementation_status = 'implemented' THEN 1 ELSE 0 END) AS implemented,
    SUM(CASE WHEN implementation_status = 'partial' THEN 1 ELSE 0 END) AS partial,
    SUM(CASE WHEN implementation_status = 'not_implemented' THEN 1 ELSE 0 END) AS not_implemented,
    ROUND(
        SUM(CASE WHEN implementation_status = 'implemented' THEN 1 ELSE 0 END) * 100.0
        / NULLIF(SUM(CASE WHEN implementation_status != 'not_applicable' THEN 1 ELSE 0 END), 0), 0
    ) AS pct_implemented
FROM controls.use_case_controls
GROUP BY use_case_id
ORDER BY pct_implemented ASC;

-- ------------------------------------------------------------
-- Tile 4: ISO 42001 maturity heat map -- average score per domain
-- per use case, ready for a heat-map visual in the SQL dashboard
-- ------------------------------------------------------------
SELECT
    use_case_id,
    domain,
    maturity_score_0_4
FROM readiness.iso42001_maturity
ORDER BY use_case_id, domain;

-- ------------------------------------------------------------
-- Tile 5: Open risk register -- inherent vs residual rating,
-- shows mitigation is actually reducing risk on paper
-- ------------------------------------------------------------
SELECT
    risk_id,
    use_case_id,
    dimension,
    inherent_rating,
    residual_rating,
    mitigation_action,
    review_date
FROM risk_register.risks
ORDER BY
    CASE inherent_rating WHEN 'Critical' THEN 4 WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 ELSE 1 END DESC;

-- ------------------------------------------------------------
-- Tile 6: Source quality mix -- how much of the inventory is
-- government_register vs vendor_case_study vs news_report, etc.
-- Useful to show you're tracking sourcing diversity deliberately.
-- ------------------------------------------------------------
SELECT
    disclosure_type,
    COUNT(*) AS use_case_count
FROM use_case_inventory.ai_use_cases
GROUP BY disclosure_type
ORDER BY use_case_count DESC;
