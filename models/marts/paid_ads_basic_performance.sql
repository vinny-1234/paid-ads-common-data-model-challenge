{{ config(materialized='table') }}

-- Explicit, type-safe union of all staging views
with all_src as (

  -- BING
  select
    cast(ad_id                  as string) as ad_id,
    cast(add_to_cart            as int64)  as add_to_cart,
    cast(adset_id               as string) as adset_id,
    cast(campaign_id            as string) as campaign_id,
    cast(channel                as string) as channel,
    cast(clicks                 as int64)  as clicks,
    cast(comments               as int64)  as comments,
    cast(creative_id            as string) as creative_id,
    cast(date                   as date)   as date,
    cast(engagements            as int64)  as engagements,
    cast(impressions            as int64)  as impressions,
    cast(installs               as int64)  as installs,
    cast(likes                  as int64)  as likes,
    cast(link_clicks            as int64)  as link_clicks,
    cast(placement_id           as string) as placement_id,
    cast(post_click_conversions as int64)  as post_click_conversions,
    cast(post_view_conversions  as int64)  as post_view_conversions,
    cast(posts                  as int64)  as posts,
    cast(purchase               as int64)  as purchase,
    cast(registrations          as int64)  as registrations,
    cast(revenue                as int64)  as revenue,
    cast(shares                 as int64)  as shares,
    cast(spend                  as int64)  as spend,
    cast(total_conversions      as int64)  as total_conversions,
    cast(video_views            as int64)  as video_views
  from {{ ref('stg_bing') }}

  union all

  -- FACEBOOK
  select
    cast(ad_id                  as string),
    cast(add_to_cart            as int64),
    cast(adset_id               as string),
    cast(campaign_id            as string),
    cast(channel                as string),
    cast(clicks                 as int64),
    cast(comments               as int64),
    cast(creative_id            as string),
    cast(date                   as date),
    cast(engagements            as int64),
    cast(impressions            as int64),
    cast(installs               as int64),
    cast(likes                  as int64),
    cast(link_clicks            as int64),
    cast(placement_id           as string),
    cast(post_click_conversions as int64),
    cast(post_view_conversions  as int64),
    cast(posts                  as int64),
    cast(purchase               as int64),
    cast(registrations          as int64),
    cast(revenue                as int64),
    cast(shares                 as int64),
    cast(spend                  as int64),
    cast(total_conversions      as int64),
    cast(video_views            as int64)
  from {{ ref('stg_facebook') }}

  union all

  -- TIKTOK
  select
    cast(ad_id                  as string),
    cast(add_to_cart            as int64),
    cast(adset_id               as string),
    cast(campaign_id            as string),
    cast(channel                as string),
    cast(clicks                 as int64),
    cast(comments               as int64),
    cast(creative_id            as string),
    cast(date                   as date),
    cast(engagements            as int64),
    cast(impressions            as int64),
    cast(installs               as int64),
    cast(likes                  as int64),
    cast(link_clicks            as int64),
    cast(placement_id           as string),
    cast(post_click_conversions as int64),
    cast(post_view_conversions  as int64),
    cast(posts                  as int64),
    cast(purchase               as int64),
    cast(registrations          as int64),
    cast(revenue                as int64),
    cast(shares                 as int64),
    cast(spend                  as int64),
    cast(total_conversions      as int64),
    cast(video_views            as int64)
  from {{ ref('stg_tiktok') }}

  union all

  -- TWITTER
  select
    cast(ad_id                  as string),
    cast(add_to_cart            as int64),
    cast(adset_id               as string),
    cast(campaign_id            as string),
    cast(channel                as string),
    cast(clicks                 as int64),
    cast(comments               as int64),
    cast(creative_id            as string),
    cast(date                   as date),
    cast(engagements            as int64),
    cast(impressions            as int64),
    cast(installs               as int64),
    cast(likes                  as int64),
    cast(link_clicks            as int64),
    cast(placement_id           as string),
    cast(post_click_conversions as int64),
    cast(post_view_conversions  as int64),
    cast(posts                  as int64),
    cast(purchase               as int64),
    cast(registrations          as int64),
    cast(revenue                as int64),
    cast(shares                 as int64),
    cast(spend                  as int64),
    cast(total_conversions      as int64),
    cast(video_views            as int64)
  from {{ ref('stg_twitter') }}

)

select * from all_src
