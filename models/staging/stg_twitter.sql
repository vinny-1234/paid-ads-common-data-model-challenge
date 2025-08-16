{{ config(materialized='view') }}

with src as (
  select * from {{ ref('src_promoted_tweets_twitter_all_data') }}
)

select
  -- 1  ad_id
  cast(null as string)                              as ad_id,
  -- 2  add_to_cart
  cast(null as int64)                               as add_to_cart,
  -- 3  adset_id
  cast(null as string)                              as adset_id,
  -- 4  campaign_id
  cast(campaign_id as string)                       as campaign_id,
  -- 5  channel
  lower(cast(channel as string))                    as channel,            -- 'twitter'
  -- 6  clicks
  cast(clicks as int64)                             as clicks,
  -- 7  comments
  cast(comments as int64)                           as comments,
  -- 8  creative_id
  cast(null as string)                              as creative_id,
  -- 9  date
  cast(date as date)                                as date,
  -- 10 engagements
  cast(engagements as int64)                        as engagements,
  -- 11 impressions
  cast(impressions as int64)                        as impressions,
  -- 12 installs
  cast(null as int64)                               as installs,
  -- 13 likes
  cast(likes as int64)                              as likes,
  -- 14 link_clicks
  cast(url_clicks as int64)                         as link_clicks,
  -- 15 placement_id
  cast(null as string)                              as placement_id,
  -- 16 post_click_conversions
  cast(null as int64)                               as post_click_conversions,
  -- 17 post_view_conversions
  cast(null as int64)                               as post_view_conversions,
  -- 18 posts
  cast(0 as int64)                                  as posts,
  -- 19 purchase
  cast(0 as int64)                                  as purchase,
  -- 20 registrations
  cast(0 as int64)                                  as registrations,
  -- 21 revenue
  cast(null as int64)                               as revenue,
  -- 22 shares
  cast(retweets as int64)                           as shares,
  -- 23 spend
  cast(spend as int64)                              as spend,
  -- 24 total_conversions
  cast(null as int64)                               as total_conversions,
  -- 25 video_views
  cast(video_total_views as int64)                  as video_views
from src
