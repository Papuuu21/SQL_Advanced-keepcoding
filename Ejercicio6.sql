CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_phone` AS
(WITH row_phone AS (
  SELECT
    calls_ivr_id,
    calls_phone_number
    ROW_NUMBER() OVER (PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY calls_ivr_id, calls_phone_number) AS row_num
  FROM
    `keepcoding.ivr_details`
)

SELECT
  calls_ivr_id,
  calls_phone_number
FROM
  row_phone
WHERE
  row_num = 1)