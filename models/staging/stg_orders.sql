with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('in.c-dbt_jaffle_shop', 'raw_orders') }}

),

renamed as (

    select
        "id" as order_id,
        "user_id" as customer_id,
        "order_date" as order_date,
        "status" as status

    from source

)

select * from renamed
