{{ config(materialized='table') }}

	
with cust as (
    select * from {{ ref('Dim_Customer') }}
),

orders as (
    --select * from snapshots.Nation_Snpsht
    select * from {{ ref('Orders_Snpsht') }}
	where DBT_VALID_TO is null
),

final as (
    
    select o.O_ORDERKEY,
	       o.O_CUSTKEY,
	       o.O_ORDERSTATUS,
	       o.O_TOTALPRICE,
	       o.O_ORDERDATE,
	       o.O_ORDERPRIORITY,
	       o.O_CLERK,
	       o.O_SHIPPRIORITY,
	       o.O_COMMENT,
		   c.N_NAME
	FROM orders as o
	LEFT JOIN cust as c
		ON c.c_CUSTKEY = o.O_CUSTKEY
)

select * from final
