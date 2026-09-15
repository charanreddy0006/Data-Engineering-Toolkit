-- Adapt names to your platform.
SELECT dataset_name FROM security_catalog WHERE classification IN ('CONFIDENTIAL','RESTRICTED') AND owner_name IS NULL;
SELECT dataset_name FROM security_catalog WHERE criticality='CRITICAL' AND encryption_status <> 'encrypted';
SELECT principal,dataset_name,review_due_date FROM access_reviews WHERE review_due_date < CURRENT_DATE AND status <> 'completed';
SELECT principal,resource_name,event_time FROM security_audit_log WHERE action_result='DENIED' ORDER BY event_time DESC;
