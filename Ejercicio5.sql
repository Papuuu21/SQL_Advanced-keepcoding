CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_document` AS
(WITH row_calls AS (
  SELECT
    calls_ivr_id,
    document_type,
    document_identification,
    ROW_NUMBER() OVER (PARTITION BY cast(calls_ivr_id as string) ORDER BY calls_ivr_id, document_type) AS row_num
  FROM
    `keepcoding.ivr_details`
)

SELECT
  calls_ivr_id,
  document_type,
  document_identification
FROM
  row_calls
WHERE
  row_num = 1;)