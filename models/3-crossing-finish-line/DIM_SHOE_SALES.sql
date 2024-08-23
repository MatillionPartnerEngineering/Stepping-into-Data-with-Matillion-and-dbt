{{
    config(
        materialized='incremental',
        unique_key='TRANSACTION_ID'
    )
}}

SELECT * FROM {{ ref('STG_CHARLIES_SALES_ALLSTATES') }}

{% if is_incremental() %}

WHERE TRANSACTION_ID not in (select TRANSACTION_ID from {{ this }})

{% endif %}
