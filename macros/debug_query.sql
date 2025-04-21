{% macro debug_query() %}
    SELECT 
        BRAND,
        "Revenue Stream",
        ROUND(SUM(SALES), 2) AS total_sales,
        ROUND(SUM(Gross_Profit), 2) AS total_gross_profit,
        ROUND(AVG("Gross Profit %"), 2) AS avg_gross_profit_pct
    FROM BOOTCAMP.MTS_RAW.MTS_SALES_DATA
    GROUP BY BRAND, "Revenue Stream"
    ORDER BY total_sales DESC
{% endmacro %}