CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_billing` AS
(WITH row_billing AS (
  SELECT
      calls_ivr_id
    , billing_account_id
    , ROW_NUMBER() OVER (PARTITION BY CAST(calls_ivr_id AS STRING) ORDER BY calls_ivr_id, billing_account_id) AS row_num
  FROM
    `keepcoding.ivr_details`
)

SELECT
  calls_ivr_id,
  billing_account_id
FROM
  row_billing
WHERE
  row_num = 1)