WITH reservations_by_city AS (
    SELECT 
        m.city,
        r.country,
        SUM(r.revenue) AS revenue,
        AVG(revenue) AS revenue_avg,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY r.revenue) AS revenue_median,
        COUNT(r.reservation_id) AS reservations,
	COUNT(DISTINCT DATE(r.reservation_created_date)) AS active_days,
        COUNT(r.reservation_id)::numeric / COUNT(DISTINCT DATE(r.reservation_created_date)) AS reservations_per_day_avg,
        COUNT(DISTINCT r.customer_id) AS customers,
        COUNT(DISTINCT r.merchant_id) AS merchants
    FROM 
        reservations r
    LEFT JOIN 
        merchants m 
    ON 
	r.merchant_id = m.merchant_id
    GROUP BY 
        m.city, r.country
),

total_metrics AS (
    SELECT 
        SUM(revenue) AS revenue,
        COUNT(reservation_id) AS reservations,
        COUNT(DISTINCT customer_id) AS customers,
        COUNT(DISTINCT merchant_id) AS merchants
    FROM 
        reservations
)

SELECT 
    t.city,
    t.country,
	
    ROUND(t.revenue, 0) AS revenue_total,
    ROUND(100 * t.revenue / t_all.revenue, 1) AS revenue_percentage,
    RANK() OVER(ORDER BY t.revenue DESC) AS revenue_rank,
    RANK() OVER(PARTITION BY t.country ORDER BY t.revenue DESC) AS revenue_rank_in_country,
    ROUND(t.revenue_avg, 1) AS revenue_avg,
    ROUND(t.revenue_median::numeric, 1)  AS revenue_median,
	
    t.reservations,
    ROUND(100 * t.reservations::numeric / t_all.reservations, 1) AS reservations_percantage,
    t.active_days AS active_days,
    ROUND(t.reservations_per_day_avg, 0) AS reservations_per_day_avg,
	
    t.customers,
    RANK() OVER(ORDER BY t.customers DESC) AS customers_rank,
    RANK() OVER(PARTITION BY t.country ORDER BY t.customers DESC) AS customers_rank_in_country,
	
    t.merchants,
    RANK() OVER(ORDER BY t.merchants DESC) AS merchants_rank,
    RANK() OVER(PARTITION BY t.country ORDER BY t.merchants DESC) AS merchants_rank_in_country
FROM 
    reservations_by_city t, total_metrics t_all
ORDER BY
    t.revenue DESC
;
