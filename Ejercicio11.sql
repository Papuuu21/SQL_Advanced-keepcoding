CREATE OR REPLACE TABLE `T00_TABLAS_VARIAS.tabla_24h` AS
WITH ranked_calls AS (
  SELECT 
    calls_ivr_id,
    calls_phone_number,
    calls_start_date,
    calls_end_date,
    
    ROW_NUMBER() OVER (PARTITION BY calls_phone_number ORDER BY calls_start_date) AS rrow,
    LAG(calls_end_date) OVER (PARTITION BY calls_phone_number ORDER BY calls_start_date) AS previous_end_date,
    LEAD(calls_start_date) OVER (PARTITION BY calls_phone_number ORDER BY calls_start_date) AS next_start_date

  FROM `keepcoding.ivr_details`
  WHERE calls_phone_number != 'UNKNOWN'
)

SELECT 
  calls.ivr_id,

  CASE
    WHEN rrow = 1 THEN 0 
    WHEN TIMESTAMP_DIFF(calls_start_date, previous_end_date, HOUR) <= 24 THEN 1 
    ELSE 0
  END AS repeated_phone_24H,

  CASE
    WHEN next_start_date IS NULL THEN 0
    WHEN TIMESTAMP_DIFF(next_start_date, end_date, HOUR) <= 24 THEN 1 
    ELSE 0
  END AS cause_recall_phone_24H

FROM `keepcoding.ivr_calls` AS calls
LEFT JOIN ranked_calls ON calls.ivr_id = ranked_calls.calls_ivr_id
ORDER BY ranked_calls.calls_phone_number DESC;
