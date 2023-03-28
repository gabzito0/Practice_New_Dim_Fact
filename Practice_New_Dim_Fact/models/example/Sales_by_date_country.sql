{{ config(materialized='view') }}

	SELECT O_ORDERDATE as order_date, N_NAME as country_name, SUM(O_TOTALPRICE) as total_sales
FROM {{ ref('Fact_Orders') }}
GROUP BY O_ORDERDATE, N_NAME