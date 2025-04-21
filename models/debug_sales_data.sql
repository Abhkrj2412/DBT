-- models/debug_sales_data.sql

WITH debug_data AS (
    {{ debug_query() }}
)

SELECT * FROM debug_data;

