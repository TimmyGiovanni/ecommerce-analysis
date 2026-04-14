-- PRODUCT CATEGORY performance
-- GENERAL
-- avg price, discount
SELECT
	product_category,
	ROUND(AVG(price),2) avg_price,
	ROUND(avg(discount_rate),4) avg_discount
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- customer segment
SELECT
	product_category,
	customer_segment,
	COUNT(customer_segment) total_customer
FROM orders
GROUP BY product_category,customer_segment
HAVING product_category LIKE 'general';

-- revenue identification
SELECT
	year,
	product_category,
	CASE
		WHEN total_revenue > LAG(total_revenue) OVER(PARTITION BY product_category ORDER BY year) THEN 'Increase'
		WHEN total_revenue < LAG(total_revenue) OVER(PARTITION BY product_category ORDER BY year) THEN 'Decrease'
		ELSE 'Same'
	END performance
FROM(
SELECT
	year,
	product_category,
	ROUND(SUM(sales_revenue),2) total_revenue
FROM orders
GROUP BY year, product_category
)t
WHERE product_category LIKE 'general'
ORDER BY year, product_category;

-- orders identification
SELECT
	year,
	product_category,
	CASE
		WHEN amount > LAG(amount) OVER(PARTITION BY product_category ORDER BY year) THEN 'Increase'
		WHEN amount < LAG(amount) OVER(PARTITION BY product_category ORDER BY year) THEN 'Decrease'
		ELSE 'Same'
	END performance
FROM(
SELECT
	year,
	product_category,
	COUNT(product_category) amount
FROM orders
GROUP BY year, product_category
)t
WHERE product_category LIKE 'general'
ORDER BY year, product_category;

-- total orders
SELECT
	product_category,
	count(*) total_orders
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- order amount
SELECT
	year,
	product_category,
	COUNT(product_category) amount
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year, amount DESC;

-- total revenue
SELECT
	product_category,
	SUM(sales_revenue) total_revenue
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- revenue
SELECT
	year,
	product_category,
	SUM(sales_revenue) revenue
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year, revenue DESC;

-- avg impression, reach, and ctr
SELECT
	product_category,
	AVG(impressions) avg_impression,
	AVG(market_reach) avg_reach,
	ROUND(AVG(click_through_rate),4) avg_ctr
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- yearly avg impression, reach, and ctr
SELECT
	year,
	product_category,
	AVG(impressions) avg_impression,
	AVG(market_reach) avg_reach,
	ROUND(AVG(click_through_rate),4) avg_ctr
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year;

-- AOV
SELECT
	product_category,
	SUM(sales_revenue) / COUNT(product_category) as AOV
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- yearly AOV
SELECT
	year,
	product_category,
	ROUND(SUM(sales_revenue) / COUNT(product_category),2) as AOV
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general';

-- ad spend
SELECT 
	year,
	product_category,
	ROUND(SUM(ad_spend),2) ad_spend
FROM orders
GROUP BY year,product_category
HAVING product_category LIKE 'general'
ORDER BY year;

-- ctr
SELECT
	product_category,
	year,
	ROUND(AVG(click_through_rate),4) avg_ctr
FROM orders
GROUP BY product_category, year
HAVING product_category LIKE 'general'
ORDER BY year;

-- most channel used to purchase product
SELECT
	year,
	product_category,
	channel,
	COUNT(*) channel_used
FROM orders
GROUP BY year, product_category, channel
HAVING product_category LIKE 'general'
ORDER BY year;

-- generality index
SELECT
	year,
	product_category,
	seasonality_index,
	COUNT(*) season_impact
FROM orders
GROUP BY year, product_category, seasonality_index
HAVING product_category LIKE 'general'
ORDER BY year;

-- average campaign duration
SELECT
	year,
	product_category,
	AVG(campaign_duration_days) avg_campaign_duration
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year;

-- average customer lifetime value
SELECT
	year,
	product_category,
	ROUND(AVG(customer_lifetime_value),2) avg_clv
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year;

-- overall performance of the course of 2009-2011 in ads, ctr, and revenue
WITH CTE_avg AS(
SELECT
	product_category,
	ROUND(AVG(ad_spend),2) avg_ad_spend,
	ROUND(AVG(market_reach),2) avg_reach,
	ROUND(AVG(click_through_rate),4) avg_ctr,
	ROUND(AVG(sales_revenue),2) avg_revenue
FROM orders
GROUP BY product_category
)
, cte_performance AS (
		SELECT
			year,
			o.product_category,
			CASE
				WHEN ad_spend > avg_ad_spend THEN 'High'
				WHEN ad_spend < avg_ad_spend THEN 'Low'
				ELSE 'Average'
			END ad_performance,
			CASE
				WHEN market_reach > avg_reach THEN 'High'
				WHEN market_reach < avg_reach THEN 'Low'
				ELSE 'Average'
			END reach_performance,
			CASE
				WHEN click_through_rate > avg_ctr THEN 'High'
				WHEN click_through_rate < avg_ctr THEN 'Low'
				ELSE 'Average'
			END ctr_performance,
			CASE
				WHEN sales_revenue > avg_revenue THEN 'High'
				WHEN market_reach < avg_revenue THEN 'Low'
				ELSE 'Average'
			END revenue_performance
		FROM orders o
		LEFT JOIN CTE_avg ca
		ON o.product_category = ca.product_category
		)
SELECT
	COUNT(*)
FROM cte_performance
WHERE product_category LIKE 'general' AND revenue_performance LIKE 'high' AND ctr_performance LIKE 'high' AND ad_performance LIKE 'high' AND reach_performance LIKE 'high'

-- ROAS
SELECT
	product_category,
	ROUND(SUM(sales_revenue) / SUM(ad_spend),2) roas
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';

-- yearly ROAS
SELECT
	year,
	product_category,
	ROUND(SUM(sales_revenue) / SUM(ad_spend),2) roas
FROM orders
GROUP BY year, product_category
HAVING product_category LIKE 'general'
ORDER BY year;

-- ROAS by region
SELECT 
	region,
	product_category,
	ROUND(SUM(sales_revenue) / SUM(ad_spend),2) roas
FROM orders
GROUP BY region,product_category
HAVING product_category LIKE 'general'
ORDER BY roas DESC;

-- yearly ROAS by region
SELECT 
	year,
	region,
	product_category,
	ROUND(SUM(sales_revenue) / SUM(ad_spend),2) roas
FROM orders
GROUP BY year, region,product_category
HAVING product_category LIKE 'general'
ORDER BY year, roas DESC;

-- AOV by region
SELECT
	region,
	product_category,
	ROUND(SUM(sales_revenue) / COUNT(product_category),2) AOV
FROM orders
GROUP BY region, product_category
HAVING product_category LIKE 'general'
ORDER BY AOV DESC;

-- yearly AOV by region
SELECT
	year,
	region,
	product_category,
	ROUND(SUM(sales_revenue) / COUNT(product_category),2) AOV
FROM orders
GROUP BY year, region, product_category
HAVING product_category LIKE 'general'
ORDER BY year, AOV DESC;

-- avg competition index
SELECT
	product_category,
	ROUND(AVG(competition_index),2) avg_competition_index
FROM orders
GROUP BY product_category
HAVING product_category LIKE 'general';
/*============================================================================================================*/
