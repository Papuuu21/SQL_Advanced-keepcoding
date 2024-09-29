CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.vdn_aggregation` AS
(SELECT 
    calls_ivr_id,
    calls_vdn_label,
    CASE 
        WHEN calls_vdn_label LIKE 'FRONT%' THEN 'FRONT'
        WHEN calls_vdn_label LIKE 'TECH%' THEN 'TECH'
        WHEN calls_vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
        ELSE 'RESTO'
    END AS vdn_aggregation
FROM 
    `keepcoding.ivr_details`)