CREATE TABLE batch_runs (
    run_id VARCHAR(100) PRIMARY KEY,
    pipeline_name VARCHAR(200) NOT NULL,
    batch_date DATE,
    started_at TIMESTAMP NOT NULL,
    completed_at TIMESTAMP,
    status VARCHAR(30) NOT NULL,
    rows_read BIGINT,
    rows_written BIGINT,
    error_message TEXT
);
