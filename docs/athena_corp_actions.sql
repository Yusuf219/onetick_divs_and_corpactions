CREATE EXTERNAL TABLE onetick_corpactions.corp_actions (
    OID string,
    ACTION_ID string,
    ACTION_TYPE string,
    ACTION_ADJUST double,
    ACTION_CURRENCY string,
    ACTION_DATE int,
    DELETED_TIME timestamp,
    TICK_STATUS int,
    OMDSEQ bigint
)
PARTITIONED BY (ingest_dt string)
STORED AS PARQUET
LOCATION 's3://onetick-divs-c32d58e7cc/corp_actions/'
TBLPROPERTIES (
    'projection.enabled' = 'true',
    'projection.ingest_dt.type' = 'date',
    'projection.ingest_dt.range' = '2026-09-01,NOW',
    'projection.ingest_dt.format' = 'yyyy-MM-dd',
    'projection.ingest_dt.interval' = '1',
    'projection.ingest_dt.interval.unit' = 'DAYS',
    'storage.location.template' = 's3://onetick-divs-c32d58e7cc/corp_actions/ingest_dt=${ingest_dt}'
)
