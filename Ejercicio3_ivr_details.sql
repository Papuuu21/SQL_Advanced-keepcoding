CREATE OR REPLACE TABLE keepcoding.ivr_details AS
  (SELECT calls.ivr_id AS calls_ivr_id
    , phone_number AS calls_phone_number
    , ivr_result AS calls_ivr_result
    , vdn_label AS calls_vdn_label
    , start_date AS calls_start_date
    , FORMAT_TIMESTAMP('%Y%m%d', start_date) AS calls_star_date_id
    , end_date AS calls_end_date
    , FORMAT_TIMESTAMP('%Y%m%d', end_date) AS calls_end_date_id
    , total_duration AS calls_total_duration
    , customer_segment AS calls_customer_segment
    , ivr_language AS calls_ivr_language
    , steps_module AS calls_steps_module
    , module_aggregation AS calls_module_aggregation
    , modules.module_sequece
    , modules.module_name
    , modules.module_duration
    , modules.module_result
    , steps.step_sequence
    , steps.step_name
    , steps.step_result
    , steps.step_description_error
    , steps.document_type
    , steps.document_identification
    , steps.customer_phone
    , steps.billing_account_id
    FROM `keepcoding.ivr_calls` calls
    LEFT 
    JOIN `keepcoding.ivr_modules` modules
      ON calls.ivr_id = modules.ivr_id
    LEFT 
    JOIN `keepcoding.ivr_steps` steps
      ON modules.ivr_id = steps.ivr_id AND modules.module_sequece = steps.module_sequece)