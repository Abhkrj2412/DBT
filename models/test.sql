{{ config(materialized='view') }}

WITH base AS (
    SELECT *
    FROM BOOTCAMP.MTS_RAW.MTS_SALES_DATA
)

SELECT * FROM base
