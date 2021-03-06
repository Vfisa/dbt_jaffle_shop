with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('in.c-dbt_jaffle_shop', 'raw_payments') }}

),

renamed as (

    select
        "id" as payment_id,
        "order_id" as order_id,
        "payment_method" as payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        "amount" / 100 as amount

    from source

)

select * from renamed
