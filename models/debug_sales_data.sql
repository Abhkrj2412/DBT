{{ config(materialized='table') }}  

WITH debug_data AS (
    {{ debug_query() }}  
)

SELECT * FROM debug_data;
