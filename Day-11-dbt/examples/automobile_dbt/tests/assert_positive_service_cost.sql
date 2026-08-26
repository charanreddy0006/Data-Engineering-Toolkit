select service_id, cost
from {{ ref('stg_service_records') }}
where cost < 0
