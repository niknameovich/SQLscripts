CREATE TABLE default.telemetry_ps90gp1 (dt DateTime DEFAULT toDateTime(ts) Codec(DoubleDelta, LZ4),ts Float64 Codec(Gorilla, LZ4),sensor_id String,n UInt32 Codec(T64, LZ4),value_float Float32 Codec(Gorilla, LZ4),equipment_id UInt32 Codec(T64, LZ4),engine_no String) ENGINE = MergeTree() PARTITION BY (equipment_id,toRelativeMonthNum(dt)) ORDER BY (equipment_id, ts, sensor_id);
CREATE TABLE default.telemetry_ps90gp1_distributed ON CLUSTER 'clickhouse_cluster_prod_01' AS default.telemetry_ps90gp1
ENGINE = Distributed('clickhouse_cluster_prod_01', 'default', 'telemetry_ps90gp1', rand());



CREATE TABLE IF NOT EXISTS DEFAULT.predict_math_result ON CLUSTER 'clickhouse_cluster_prod_01'
(

    dt Float64 Codec(Gorilla, LZ4),

    equipment_id UInt32 Codec(T64, LZ4),

    bind_model_id UInt32 Codec(T64, LZ4),

    bind_execution_id Int32 Codec(T64, LZ4),

    PK Float32 Codec(Gorilla, LZ4),

    PRPK Float32 Codec(Gorilla, LZ4),

    TCT Float32 Codec(Gorilla, LZ4),

    TCT_1 Float32 Codec(Gorilla, LZ4),

    TCT_2 Float32 Codec(Gorilla, LZ4),

    TCT_3 Float32 Codec(Gorilla, LZ4),

    TCT_4 Float32 Codec(Gorilla, LZ4),

    TCT_5 Float32 Codec(Gorilla, LZ4),

    TCT_6 Float32 Codec(Gorilla, LZ4),

    TCT_7 Float32 Codec(Gorilla, LZ4),

    TCT_8 Float32 Codec(Gorilla, LZ4),

    TCT_9 Float32 Codec(Gorilla, LZ4),

    TCT_10 Float32 Codec(Gorilla, LZ4),

    TCT_11 Float32 Codec(Gorilla, LZ4),

    TCT_12 Float32 Codec(Gorilla, LZ4),

    DG_POS Float32 Codec(Gorilla, LZ4),

    PK_avid_metric Float32 Codec(Gorilla, LZ4),

    PRPK_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_1_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_2_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_3_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_4_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_5_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_6_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_7_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_8_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_9_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_10_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_11_avid_metric Float32 Codec(Gorilla, LZ4),

    TCT_12_avid_metric Float32 Codec(Gorilla, LZ4),

    DG_POS_avid_metric Float32 Codec(Gorilla, LZ4),

    PH Float32 Codec(Gorilla, LZ4),

    PH_avid_metric Float32 Codec(Gorilla, LZ4),

    TH Float32 Codec(Gorilla, LZ4),

    TH_avid_metric Float32 Codec(Gorilla, LZ4),

    POCGTU_OPEN Float32 Codec(Gorilla, LZ4),

    POCGTU_OPEN_avid_metric Float32 Codec(Gorilla, LZ4),

    POCVOU_OPEN Float32 Codec(Gorilla, LZ4),

    POCVOU_OPEN_avid_metric Float32 Codec(Gorilla, LZ4),

    PG Float32 Codec(Gorilla, LZ4),

    PG_avid_metric Float32 Codec(Gorilla, LZ4),

    NGG Float32 Codec(Gorilla, LZ4),

    NGG_avid_metric Float32 Codec(Gorilla, LZ4),

    TVX Float32 Codec(Gorilla, LZ4),

    TVX_avid_metric Float32 Codec(Gorilla, LZ4),

    PDVXPС Float32 Codec(Gorilla, LZ4),

    PDVXPС_avid_metric Float32 Codec(Gorilla, LZ4),

    VNA_POS Float32 Codec(Gorilla, LZ4),

    VNA_POS_avid_metric Float32 Codec(Gorilla, LZ4),

    PRPCT Float32 Codec(Gorilla, LZ4),

    PRPCT_avid_metric Float32 Codec(Gorilla, LZ4),

    PT Float32 Codec(Gorilla, LZ4),

    PT_avid_metric Float32 Codec(Gorilla, LZ4),

    PDCT Float32 Codec(Gorilla, LZ4),

    PDCT_avid_metric Float32 Codec(Gorilla, LZ4),

    TT_5 Float32 Codec(Gorilla, LZ4),

    TT_5_avid_metric Float32 Codec(Gorilla, LZ4),

    TT_7 Float32 Codec(Gorilla, LZ4),

    TT_7_avid_metric Float32 Codec(Gorilla, LZ4),

    TTG_IN_DG Float32 Codec(Gorilla, LZ4),

    TTG_IN_DG_avid_metric Float32 Codec(Gorilla, LZ4),

    PTG_IN_DG Float32 Codec(Gorilla, LZ4),

    PTG_IN_DG_avid_metric Float32 Codec(Gorilla, LZ4)
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{shard}/{database}/{table}', '{replica}') PARTITION BY (bind_model_id,equipment_id) ORDER BY (bind_model_id,equipment_id, dt) 
TTL toDateTime(dt) + INTERVAL 6 MONTH RECOMPRESS CODEC(LZ4HC(12));

CREATE TABLE default.predict_math_result_distributed ON CLUSTER 'clickhouse_cluster_prod_01' AS default.predict_math_result
ENGINE = Distributed('clickhouse_cluster_prod_01', 'default', 'predict_math_result', rand());
