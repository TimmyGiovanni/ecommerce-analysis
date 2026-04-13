# ecommerce-analysis
A deep dive analysis of an ecommerce platform

## **Project Overview**

This project aims to analyse the performance of each product category on an e-commerce platform. The dataset was cleaned using Google Sheets, analysed with SQL Server, and visualized in Tableau.

Metrics to focus on are total revenue, total orders, AOV, ROAS, and yearly performance.

## **Dataset**

The dataset includes only one main table 'orders', with each row representing the category's investment and performance, and it consists of 18000 records with 16 fields.

## **Objectives**

The result of the analysis should help the platform to perform better budgeting and customer targeting.

## **Data Preparation & Cleaning**

During the cleaning process, issues were found and the list are below:
	
	- id
		No issues found, and this field is the unique identifier
	- date
		Format inconsistencies were found in the field, there were date and datetime formats. All data has been changed into a date format
	- month
		An additional field was created to make the analysis easier. This column did not exist in the original dataset
	- year
		An additional field was created to make the analysis easier. This column did not exist in the original dataset
	- region
		Naming issues were found, particularly in the word 'North'. Misspelled words have been corrected into 'North'
	- channel
		Naming issues were found, particularly in the word 'Social Media'. Misspelled words have been corrected into 'Social Media'
	- product_category
		No issues found
	- customer_segment
		No issues found
	- ad_spend
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **3.66% (658)**. Therefore, they were changed into 0. Also, formats were changed to a 2-decimal format.
	- price
		Formats were changed to a 2-decimal format.
	- discount_rate
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **4.19% (755)**. Therefore, they were changed into 0.
	- market_reach
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **3.81% (686)**. Therefore, they were changed into 0.
	- impressions
		Negative value records were found, and there was no way of retrieving the data. The magnitude of the missing data is **0.43% (77)**. Therefore, they were changed into 0.
	- click_through_rate
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **3.96% (713)**. Therefore, they were changed into 0. Also, formats were changed to a 4-decimal format.
	- competition_index
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **3.93% (707)**.
	- seasonality_index
		Changed the format to a 2-decimal format
	- campaign_duration_days
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **8.41% (1513)**.
	- customer_lifetime_value
		Missing records were found, and there was no way of retrieving the data. The magnitude of the missing data is **4.13% (743)**.
	- sales_revenue
		Changed the format to a 2-decimal format
## **Key Insights**
### Product Analysis

## **Recommendations**

## **Limitations & Assumptions**
