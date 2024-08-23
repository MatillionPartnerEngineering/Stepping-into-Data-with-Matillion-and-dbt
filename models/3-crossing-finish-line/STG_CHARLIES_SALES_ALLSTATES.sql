SELECT
    '{{ run_started_at.strftime("%Y-%m-%d") }}' as LAST_UPDATED,
    "stores"."STORE_LOCATION",
    case when "sales"."STORE_ID" between 1 and 20 then 'FL' 
     when "sales"."STORE_ID" between 21 and 40 then 'CO'
     when "sales"."STORE_ID" between 41 and 60 then 'OR'
     else '' 
     end as STATE,
    "sales"."TRANSACTION_ID",
    "sales"."TRANSACTION_DATE" AS TRANSACTION_DATE,
    DATE_PART(year,"sales"."TRANSACTION_DATE") as TRANSACTION_YEAR,
    DATE_PART(month,"sales"."TRANSACTION_DATE") as TRANSACTION_MONTH,
    "sales"."PRODUCT_NAME" AS "PRODUCT_NAME", 
    "sales"."SALE_INDICATOR" AS "SALE_INDICATOR", 
    "sales"."PRODUCT_PRICE" AS "PRODUCT_PRICE", 
    "sales"."REVIEW_INDICATOR" AS "REVIEW_INDICATOR", 
    "sales"."REVIEW" AS "REVIEW", 
    "shoes"."PRIMARY_COLOR" AS "PRIMARY_COLOR", 
    "shoes"."SECONDARY_COLOR" AS "SECONDARY_COLAR", 
    "shoes"."PRODUCT_LINE" AS "PRODUCT_LINE", 
    "shoes"."COMFORT" AS "COMFORT", 
    "shoes"."RESPONSIVENESS" AS "RESPONSIVENESS", 
    "shoes"."WEIGHT_OZ" AS "WEIGHT_OZ", 
    "shoes"."CUSHIONING" AS "CUSHIONING", 
    "shoes"."BREATHABILITY" AS "BREATHABILITY" 
FROM 
    {{source('CHARLIES','SRC_CHARLIES_SHOE_EMPORIUM_SALES')}} as "sales"
LEFT JOIN
    {{source('CHARLIES','CHARLIES_SHOE_EMPORIUM_STORE_LOCATIONS')}} as "stores"
    ON "sales"."STORE_ID" = "stores"."STORE_ID" 
LEFT JOIN
    {{source('CHARLIES','CHARLIES_SHOE_EMPORIUM_SHOE_SPECIFICATIONS')}} as "shoes"
    ON "sales"."PRODUCT_NAME" = "shoes"."PRODUCT_NAME"