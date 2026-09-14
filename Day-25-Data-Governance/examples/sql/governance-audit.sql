-- Example governance evidence queries.
-- Adapt table/column names to the platform in use.

-- 1. Critical assets without an owner
SELECT dataset_name
FROM governance_catalog
WHERE criticality = 'CRITICAL'
  AND owner_name IS NULL;

-- 2. Critical assets without classification
SELECT dataset_name
FROM governance_catalog
WHERE criticality = 'CRITICAL'
  AND classification IS NULL;

-- 3. Stale metadata
SELECT dataset_name, metadata_updated_at
FROM governance_catalog
WHERE metadata_updated_at < CURRENT_DATE - INTERVAL '90 days';

-- 4. Exceptions approaching expiry
SELECT exception_id, dataset_name, expires_at
FROM governance_exceptions
WHERE expires_at < CURRENT_DATE + INTERVAL '30 days'
ORDER BY expires_at;

-- 5. Access reviews overdue
SELECT principal, dataset_name, review_due_date
FROM access_reviews
WHERE review_due_date < CURRENT_DATE
  AND review_status <> 'completed';
