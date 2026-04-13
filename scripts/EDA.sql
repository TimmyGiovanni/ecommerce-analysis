-- Dimension Exploration
-- date
SELECT
	MIN(date) earliest_order,
	MAX(date) latest_order
FROM orders;

-- region
SELECT
	DISTINCT region
FROM orders;

-- channel
SELECT
	DISTINCT channel
FROM orders;

-- product_category
SELECT
	DISTINCT product_category
FROM orders;

-- customer segment
SELECT
	DISTINCT customer_segment
FROM orders;

-- ad_spend
-- total ad_spend
SELECT
	ROUND(SUM(ad_spend),2) total_ad_spend
FROM orders;

-- avg ad spend by category
SELECT
	product_category,
	ROUND(AVG(ad_spend),2) avg_ad_spend
FROM orders 
GROUP BY product_category;

-- price
-- avg price by product category
SELECT
	product_category,
	ROUND(AVG(price),2) avg_price
FROM orders
GROUP BY product_category;

-- discount_rate
-- avg discount_rate by product category
SELECT
	product_category,
	ROUND(AVG(discount_rate),4) avg_discount_rate
FROM orders
GROUP BY product_category;

-- market_reach
-- total market reach by category
SELECT
	product_category,
	SUM(market_reach) total_market_reach
FROM orders
GROUP BY product_category;

-- impressions
-- total impressions by category
SELECT
	product_category,
	SUM(impressions) total_impressions
FROM orders
GROUP BY product_category;

-- click_through_rate
-- avg ctr by product_category
SELECT
	product_category,
	ROUND(AVG(click_through_rate),4) avg_ctr
FROM orders
GROUP BY product_category;

-- competition_index
-- avg competition_index by category
SELECT
	product_category,
	ROUND(AVG(competition_index),4) avg_competition_index
FROM orders
GROUP BY product_category;

-- seasonality_index
SELECT
	product_category,
	ROUND(AVG(seasonality_index),4) avg_seasonality_index
FROM orders
GROUP BY product_category;

-- customer_lifetime_value
-- avg clv
SELECT
	product_category,
	ROUND(AVG(customer_lifetime_value),2) avg_clv
FROM orders
GROUP BY product_category;

-- sales_revenue
-- total revenue
SELECT
	product_category,
	ROUND(SUM(sales_revenue),2) total_revenue
FROM orders
GROUP BY product_category;

-- avg revenue
SELECT
	product_category,
	ROUND(AVG(sales_revenue),2) avg_revenue
FROM orders
GROUP BY product_category;