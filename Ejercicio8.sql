CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_masiva_flag` AS
(SELECT
    calls_ivr_id,
    calls_vdn_label,
    CASE 
        WHEN calls_vdn_label = 'AVERIA_MASIVA' THEN 1
        ELSE 0
    END AS averia_masiva_flag
FROM 
    `keepcoding.ivr_details`)