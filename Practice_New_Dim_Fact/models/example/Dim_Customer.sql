{{ config(materialized='table') }}

	
with cust as (
    --select * from snapshots.Customer_Snpsht
    select * from {{ ref('Customer_Snpsht') }}
	where DBT_VALID_TO is null
),

nat as (
    --select * from snapshots.Nation_Snpsht
    select * from {{ ref('Nation_Snpsht') }}
	where DBT_VALID_TO is null
),

final as (
    
    select C_CUSTKEY,
	       C_NAME,
	       C_ADDRESS,
	       C_NATIONKEY,
	       C_PHONE,
	       C_ACCTBAL,
	       C_MKTSEGMENT,
	       C_COMMENT,
		   nat.N_NAME
	FROM cust
	LEFT JOIN nat
		ON cust.C_NATIONKEY = nat.N_NATIONKEY
)

select * from final