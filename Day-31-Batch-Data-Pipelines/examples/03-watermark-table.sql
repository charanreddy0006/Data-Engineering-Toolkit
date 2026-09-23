CREATE TABLE pipeline_watermarks (
    pipeline_name VARCHAR(200) PRIMARY KEY,
    source_name VARCHAR(200) NOT NULL,
    last_success_value TIMESTAMP,
    run_id VARCHAR(100),
    status VARCHAR(30) NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
