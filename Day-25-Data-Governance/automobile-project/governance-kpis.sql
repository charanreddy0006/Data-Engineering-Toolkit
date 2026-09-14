-- Portfolio governance scorecard examples.

SELECT
    COUNT(*) FILTER (WHERE owner_name IS NOT NULL) * 100.0 / COUNT(*) AS pct_owned,
    COUNT(*) FILTER (WHERE classification IS NOT NULL) * 100.0 / COUNT(*) AS pct_classified,
    COUNT(*) FILTER (WHERE lineage_status = 'available') * 100.0 / COUNT(*) AS pct_lineage
FROM governance_catalog
WHERE criticality = 'CRITICAL';

SELECT
    AVG(CASE WHEN quality_status = 'certified' THEN 1.0 ELSE 0.0 END) * 100
      AS pct_certified_quality
FROM governance_catalog
WHERE domain = 'connected_vehicle';
