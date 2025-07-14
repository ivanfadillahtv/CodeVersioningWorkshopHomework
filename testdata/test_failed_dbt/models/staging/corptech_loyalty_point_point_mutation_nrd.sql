{{
    config(enabled=true)
}}


select
1 as partition_date,
   2 as partition_time,
'Mutation' AS datasource,
  upper("success") as movement_messages,
        SAFE_CAST(2.0 as numeric) as point_amount_in_transaction_currency;
