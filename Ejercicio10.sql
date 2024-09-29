CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_customer_dni_flag` AS
(SELECT
    calls_ivr_id,
    step_name,
    step_result,
    CASE
        WHEN step_name = 'CUSTOMERINFOBYDNI.TX' AND step_result = 'OK' THEN 1
        ELSE 0
    END AS customer_identified_by_dni_flag
FROM 
    `keepcoding.ivr_details`)
