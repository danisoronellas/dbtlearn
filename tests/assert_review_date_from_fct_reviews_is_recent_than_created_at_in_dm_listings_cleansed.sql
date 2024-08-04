select *
from {{ ref('dim_listings_cleansed') }} l
inner join {{ ref('fct_reviews') }} r
on (r.listing_id = l.listing_id)
where r.REVIEW_DATE < l.CREATED_AT