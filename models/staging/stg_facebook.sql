{{ config(materialized='view') }}

with src as (
  select * from {{ ref('src_ads_creative_facebook_all_data') }}
)

select
  /* identifiers (strings) */
  cast(ad_id as string)            as ad_id,
  cast(adset_id as string)         as adset_id,
  cast(campaign_id as string)      as campaign_id,

  /* normalized channel */
  lower(cast(channel as string))   as channel,

  /* date + core metrics mapped to MCDM field names */
  cast(date as date)               as date,
  cast(clicks as int64)            as clicks,
  cast(impressions as int64)       as impressions,
  cast(spend as int64)             as spend,

  /* revenue not present -> null unless your CSV has purchase_value you want to treat as revenue */
  cast(null as int64)              as revenue,

  /* conversions (post click) */
  cast(purchase as int64)          as purchase,                    -- purchase count
  cast(complete_registration as int64) as registrations,
  cast(null as int64)              as total_conversions,           -- not directly provided
  cast(null as int64)              as post_view_conversions,       -- not provided
  cast(null as int64)              as posts,                       -- not provided
  cast(add_to_cart as int64)       as add_to_cart,

  /* engagement-type / other metrics */
  cast(comments as int64)          as comments,
  cast(coalesce(inline_link_clicks, 0) as int64) as link_clicks,
  cast(likes as int64)             as likes,
  cast(shares as int64)            as shares,
  cast(views as int64)             as video_views,                 -- "views" → video_views

  /* fields not present -> null */
  cast(creative_id as string)      as creative_id,                 -- present
  cast(null as int64)              as engagements,                 -- not available in this CSV
  cast(null as int64)              as installs,                    -- not available
  cast(null as string)             as placement_id,                -- not available

  /* explicit MCDM metric: post_click_conversions (sum of various) */
  /* Here we’ll use purchase + complete_registration as our proxy if you want a single metric */
  (coalesce(cast(purchase as int64),0) + coalesce(cast(complete_registration as int64),0)) 
                                     as post_click_conversions

from src