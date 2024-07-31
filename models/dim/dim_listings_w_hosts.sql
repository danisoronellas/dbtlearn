with
l as (
    select
        *
    from
        {{ ref('dim_listings_cleansed') }}
),
h as (
    select *
    from {{ ref('dim_hosts_cleansed') }}
)

select
    l.listing_id,
    l.listing_name,
    l.ROOM_TYPE,
    l.minimum_nights,
    l.price,
    l.HOST_ID,
    h.host_name,
    h.IS_SUPERHOST as host_is_superhost,
    l.CREATED_AT,
    greatest(l.UPDATED_AT, h.UPDATED_AT) as updated_at
from l
left join h on (h.host_id = l.HOST_ID)
