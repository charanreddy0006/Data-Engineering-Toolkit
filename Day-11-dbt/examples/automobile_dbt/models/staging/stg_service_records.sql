{{ config(materialized='view') }}

select
    service_id,
    upper(trim(vehicle_id)) as vehicle_id,
    cast(service_date as date) as service_date,
    trim(service_type) as service_type,
    cast(cost as numeric(12,2)) as cost
from {{ source('automotive', 'service_records') }}
where service_id is not null
