{% snapshot Nation_Snpsht %}
	{{
		config(
			target_database='analytics',
			target_schema='snapshots',
			unique_key='n_nationKey',
			strategy='check',
			check_cols=['n_name']
		)
	}}
	
	select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION

{% endsnapshot %}