{{
    config(
        materialized='incremental',
        unique_key='TRANSACTION_ID'
    )
}}

SELECT * FROM {{ ref('STG_CHARLIES_SALES_ALLSTATES') }}
--UNION ALL
--SELECT * FROM {{ ref('STG_CHARLIES_SALES_OR') }}
--UNION ALL
--SELECT * FROM {{ ref('STG_CHARLIES_SALES_FL') }}

{% if is_incremental() %}

WHERE TRANSACTION_ID not in (select TRANSACTION_ID from {{ this }})

{% endif %}
