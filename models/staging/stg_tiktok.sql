{{ config(materialized='view') }}

with src as (
  select * from {{ ref('src_ads_tiktok_ads_all_data') }}
)

select
  /* identifiers (strings) */
  cast(ad_id as string)            as ad_id,
  cast(adgroup_id as string)       as adset_id,           -- best available
  cast(campaign_id as string)      as campaign_id,

  /* normalized channel */
  lower(cast(channel as string))   as channel,

  /* date + core metrics */
  cast(date as date)               as date,
  cast(clicks as int64)            as clicks,
  cast(impressions as int64)       as impressions,
  cast(spend as int64)             as spend,
  cast(null as int64)              as revenue,            -- not provided

  /* conversions */
  cast(conversions as int64)       as post_click_conversions,
  cast(purchase as int64)          as purchase,
  cast(registrations as int64)     as registrations,
  cast(null as int64)              as total_conversions,  -- not provided
  cast(null as int64)              as post_view_conversions, -- not provided
  cast(null as int64)              as posts,              -- not provided
  cast(add_to_cart as int64)       as add_to_cart,

  /* engagement-type / other metrics */
  cast(null as int64)              as comments,          -- not present
  cast(null as string)             as creative_id,       -- not present
  cast(null as int64)              as engagements,       -- not present
  cast(rt_installs as int64)       as installs,          -- or skan_app_install if preferred
  cast(null as int64)              as likes,             -- not present
  cast(null as int64)              as link_clicks,       -- not present
  cast(null as string)             as placement_id,      -- not present
  cast(null as int64)              as shares,            -- not present
  cast(video_views as int64)       as video_views

from src

