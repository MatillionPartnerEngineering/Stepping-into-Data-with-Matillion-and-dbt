SELECT 
    STORE_LOCATION,
    TRANSACTION_YEAR,
    TRANSACTION_MONTH, 
    COUNT (*) as COUNT_BY_LOCATION
FROM 
    {{ ref('STG_CHARLIES_SALES') }}
GROUP BY 
    STORE_LOCATION,
    TRANSACTION_YEAR,
    TRANSACTION_MONTH