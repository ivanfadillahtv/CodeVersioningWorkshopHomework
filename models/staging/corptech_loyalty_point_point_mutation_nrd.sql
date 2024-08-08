{{
    config(enabled=true)
}}

select
"2024-01-01" as partition_date,
"2024-01-01 00:00:00" as partition_time,
'Mutation' AS datasource,
1 AS order_id,
21313 AS posting_date,
"rmm" as booking_product_type,
  upper("success move") AS movement_messages
 