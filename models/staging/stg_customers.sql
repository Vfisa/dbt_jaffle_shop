with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('in.c-dbt_jaffle_shop', 'raw_customers') }}

),

renamed as (

    select
        "id" as customer_id,
        "first_name" as first_name,
        "last_name" as last_name

    from source

)

select * from renamed
