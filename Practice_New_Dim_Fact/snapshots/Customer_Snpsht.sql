{% snapshot Customer_Snpsht %}
	{{
		config(
			target_database='analytics',
			target_schema='snapshots',
			unique_key='c_custKey',
			strategy='check',
			check_cols=['c_name', 'c_address', 'c_nationKey', 'c_phone']
		)
	}}
	
	select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER

{% endsnapshot %}