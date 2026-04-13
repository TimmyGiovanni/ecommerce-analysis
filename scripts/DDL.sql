/*
===============================================================================
DDL Script: Create Orders Tables
===============================================================================
Script Purpose:
    This script creates Orders table, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of Orders table
===============================================================================
*/

IF OBJECT_ID('orders', 'U') IS NOT NULL
	DROP TABLE orders
GO

CREATE TABLE orders (
id INT primary key,
date DATE,
month INT,
year INT,
region NVARCHAR(50),
channel NVARCHAR(255),
product_category NVARCHAR(255),
customer_segment NVARCHAR(255),
ad_spend FLOAT,
price FLOAT,
discount_rate FLOAT,
market_reach INT,
impressions INT,
click_through_rate FLOAT,
competition_index FLOAT,
seasonality_index FLOAT,
campaign_duration_days INT,
customer_lifetime_value FLOAT,
sales_revenue FLOAT
);

