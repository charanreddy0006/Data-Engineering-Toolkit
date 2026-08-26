select
    vehicle_id,
    service_id,
    service_date,
    service_type,
    cost,
    case
        when cost >= 2000 then 'HIGH'
        when cost >= 1000 then 'MEDIUM'
        else 'LOW'
    end as cost_band
from {{ ref('stg_service_records') }}
