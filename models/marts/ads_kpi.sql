-- models/marts/ads_kpis.sql

with base as (
    select *
    from {{ ref('paid_ads_basic_performance') }}
)

select
    channel,
    date,

    -- Traffic & Engagement
    sum(impressions) as impressions,
    sum(clicks) as clicks,
    sum(video_views) as video_views,
    sum(engagements) as engagements,

    -- Conversions
    sum(total_conversions) as total_conversions,
    sum(post_click_conversions) as post_click_conversions,
    sum(post_view_conversions) as post_view_conversions,
    sum(purchase) as purchases,
    sum(revenue) as revenue,

    -- Spend
    sum(spend) as spend,

    -- Derived KPIs
    safe_divide(sum(clicks), sum(impressions)) as ctr,       -- Click-Through Rate
    safe_divide(sum(spend), sum(clicks)) as cpc,             -- Cost Per Click
    safe_divide(sum(spend), sum(impressions)) * 1000 as cpm, -- Cost Per Mille
    safe_divide(sum(revenue), sum(spend)) as roas            -- Return on Ad Spend

from base
group by channel, date
order by date, channel
