{{
  config(
    materialized = 'view',
    tags = ['dag.dwh_daily'],
  )
}}

select
_PARTITIONDATE as partition_date,
_PARTITIONTIME as partition_time,
'Mutation' AS datasource,
SAFE_CAST(original_transaction_id as integer) AS order_id,
SAFE_CAST(posting_date as date) AS posting_date,
booking_product_type,
transaction_currency,
nature_transaction,
movement_type,
user_profile_id,
  movement_messages,
  unique_key,
  UPPER(transaction_type) AS transaction_type,
UPPER(cost_type_id) AS cost_type_id,
  SAFE_CAST(point_amount_in_transaction_currency AS NUMERIC) AS point_amount_in_transaction_currency
FROM
{{ source('raw.realtime.s3', 'loyalty_point_point_mutation_nrd') }}