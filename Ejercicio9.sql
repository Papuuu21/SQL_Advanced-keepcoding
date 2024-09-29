CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_customer_flag` AS
(SELECT
    calls_ivr_id,
    step_name,
    step_result,
    CASE
        WHEN step_name = 'CUSTOMERINFOBYPHONE.TX' AND step_result = 'OK' THEN 1
        ELSE 0
    END AS customer_identified_flag
FROM 
    `keepcoding.ivr_details`)
    `keepcoding.ivr_details`;