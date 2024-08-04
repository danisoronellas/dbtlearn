{% snapshot scd_raw_reviews %}

{{
    config(
        target_schema='dev',
        unique_key='listing_id',
        strategy='check',
        check_cols=['date', 'reviewer_name', 'comments'],
        invalidate_hard_deletes=True
    )
}}

select *
from {{ source('airbnb', 'reviews') }}

{% endsnapshot %}