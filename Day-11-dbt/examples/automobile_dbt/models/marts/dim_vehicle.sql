select
    vehicle_id,
    min(service_date) as first_service_date,
    max(service_date) as latest_service_date,
    count(distinct service_type) as service_type_count
from {{ ref('int_vehicle_service') }}
group by vehicle_id
