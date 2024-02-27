{% snapshot trf_shipments_snapshot %}

{{
    config 
    (
        target_database = 'QWT',
        target_schema = 'snapshots',
        unique_key = "OrderID || '-' || LineNo",

        strategy = 'timestamp',
        updated_at = 'ShipmentDate'
    )

}}

select * from
{{ ref('stg_shipments') }}

{% endsnapshot %}
