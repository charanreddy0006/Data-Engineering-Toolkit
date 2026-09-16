SELECT pipeline_name, run_id, started_at, finished_at, status
FROM pipeline_runs
WHERE started_at >= CURRENT_TIMESTAMP - INTERVAL '1 day'
  AND status <> 'SUCCESS';

SELECT dataset_name, freshness_seconds, freshness_target_seconds
FROM dataset_observability
WHERE freshness_seconds > freshness_target_seconds
ORDER BY freshness_seconds DESC;

SELECT dataset_name, rule_name, failure_count
FROM data_quality_results
WHERE observed_at >= CURRENT_TIMESTAMP - INTERVAL '1 day'
  AND status = 'FAILED'
ORDER BY failure_count DESC;
