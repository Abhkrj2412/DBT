{{ config(materialized='table') }}

SELECT *
FROM BOOTCAMP.MTS_RAW.MTS_SALES_DATA
