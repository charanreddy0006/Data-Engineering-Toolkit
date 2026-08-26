{{ config(materialized='table') }}

select
    vehicle_id,
    count(*) as service_count,
    sum(cost) as total_service_cost,
    avg(cost) as average_service_cost,
    min(service_date) as first_service_date,
    max(service_date) as latest_service_date
from {{ ref('int_vehicle_service') }}
group by vehicle_id
