CREATE TABLE IF NOT EXISTS data_quality_run (
    run_id TEXT PRIMARY KEY,
    dataset TEXT NOT NULL,
    started_at TIMESTAMP NOT NULL,
    finished_at TIMESTAMP,
    status TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS data_quality_result (
    run_id TEXT NOT NULL REFERENCES data_quality_run(run_id),
    rule_id TEXT NOT NULL,
    total_rows BIGINT NOT NULL,
    failed_rows BIGINT NOT NULL,
    pass_rate NUMERIC(8,4) NOT NULL,
    severity TEXT NOT NULL,
    status TEXT NOT NULL,
    message TEXT,
    PRIMARY KEY (run_id, rule_id)
);
