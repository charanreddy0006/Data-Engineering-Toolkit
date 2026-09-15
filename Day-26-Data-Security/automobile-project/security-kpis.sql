SELECT COUNT(*) FILTER (WHERE encryption_status='encrypted')*100.0/COUNT(*) AS encryption_coverage_pct FROM security_catalog;
SELECT COUNT(*) FILTER (WHERE status='completed')*100.0/COUNT(*) AS access_review_completion_pct FROM access_reviews WHERE review_period='current';
SELECT COUNT(*) AS denied_sensitive_events FROM security_audit_log WHERE classification IN ('CONFIDENTIAL','RESTRICTED') AND action_result='DENIED' AND event_time >= CURRENT_DATE - INTERVAL '7 days';
