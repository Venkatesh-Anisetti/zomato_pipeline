with spine as (
    select 
        dateadd(day, seq4(), '2024-01-01'::date) as date_day 
    from table(generator(rowcount=>1200))
        )

select 
    date_day,
    year(date_day) as year,
    month(date_day) as month,
    monthname(date_day) as month_name,
    dayname(date_day) as day_name,
    (dayofweekiso(date_day)>=6) as is_weekend,
    DATEDIFF(
        day,
        CURRENT_DATE(),
        date_day
    ) AS rolling_day,
    DATEDIFF(
        week,
        DATE_TRUNC('week', CURRENT_DATE()),
        DATE_TRUNC('week', date_day)
    ) AS rolling_week,
    DATEDIFF(
        month,
        DATE_TRUNC('month', CURRENT_DATE()),
        DATE_TRUNC('month', date_day)
    ) AS rolling_month,
    DATEDIFF(
        quarter,
        DATE_TRUNC('quarter', CURRENT_DATE()),
        DATE_TRUNC('quarter', date_day)
    ) AS rolling_quarter,
    DATEDIFF(
        year,
        DATE_TRUNC('year', CURRENT_DATE()),
        DATE_TRUNC('year', date_day)
    ) AS rolling_year
from spine where date_day <= '2026-12-31'