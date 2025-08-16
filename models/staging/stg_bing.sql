{{ config(materialized='view') }}

with src as (
  select * from {{ ref('src_ads_bing_all_data') }}
)

select
  cast(ad_id as string)                     as ad_id,
  cast(adset_id as string)                  as adset_id,
  cast(campaign_id as string)               as campaign_id,
  lower(cast(channel as string))            as channel,
  cast(date as date)                        as date,
  cast(clicks as int64)                     as clicks,
  cast(imps as int64)                       as impressions,
  cast(spend as int64)                      as spend,
  cast(revenue as int64)                    as revenue,
  cast(conv as int64)                       as post_click_conversions,
  cast(null as int64)                       as add_to_cart,
  cast(null as int64)                       as comments,
  cast(null as string)                      as creative_id,
  cast(null as int64)                       as engagements,
  cast(null as int64)                       as installs,
  cast(null as int64)                       as likes,
  cast(null as int64)                       as link_clicks,
  cast(null as string)                      as placement_id,
  cast(null as int64)                       as post_view_conversions,
  cast(null as int64)                       as posts,
  cast(null as int64)                       as purchase,
  cast(null as int64)                       as registrations,
  cast(null as int64)                       as shares,
  cast(null as int64)                       as total_conversions,
  cast(null as int64)                       as video_views
from src
