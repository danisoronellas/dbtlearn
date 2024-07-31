{{ config(
    materialized = 'view'
) }}
with src_listings as (
    select * from {{ ref('src_listings') }}
)
select
    listing_id,
    listing_name,
    ROOM_TYPE,
    case
        when MINIMUM_NIGHTS = 0 then 1
        else MINIMUM_NIGHTS
    end as minimum_nights,
    HOST_ID,
    replace(
        price_str,
        '$'
    ) :: number(
        10,
        2
    ) as price,
    CREATED_AT,
    UPDATED_AT
from
    src_listings