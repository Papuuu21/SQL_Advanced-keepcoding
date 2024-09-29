CREATE OR REPLACE TABLE `keepcoding.ivr_summary` AS
(SELECT 
      details.calls_ivr_id AS ivr_id
    , details.calls_phone_number AS phone_number
    , details.calls_ivr_result AS ivr_result
    , agg.vdn_aggregation 
    , details.calls_start_date AS start_date
    , details.calls_end_date AS end_date
    , details.calls_total_duration  AS total_duration
    , details.calls_customer_segment AS customer_segmente
    , details.calls_ivr_language AS ivr_language
    , details.calls_steps_module AS steps_module
    , details.calls_module_aggregation
    , doc.document_type
    , doc.document_identification
    , phone.calls_phone_number AS customer_phone
    , billing.billing_account_id
    , masiva.averia_masiva_flag AS masiva_lg
    , info_phone.customer_identified_flag
    , info_dni.customer_identified_by_dni_flag
    , repetida.repeated_phone_24H AS repeat_phone_24h
    , repetida.cause_recall_phone_24H AS cause_recall_phone_24h
  FROM `keepcoding.ivr_details` AS details
  LEFT 
  JOIN `T00_TABLAS_VARIAS.vdn_aggregation` AS agg
    ON details.calls_ivr_id = agg.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_document` AS doc
   ON details.calls_ivr_id =  doc.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_phone` AS phone
    ON details.calls_ivr_id =  phone.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_billing` AS billing
    ON details.calls_ivr_id =  billing.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_masiva_flag` AS masiva
    ON details.calls_ivr_id =  masiva.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_customer_flag` AS info_phone
    ON details.calls_ivr_id =  info_phone.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_customer_dni_flag` AS info_dni
    ON details.calls_ivr_id =  info_dni.calls_ivr_id
  LEFT 
  JOIN `T00_TABLAS_VARIAS.tabla_24h` AS repetida
    ON details.calls_ivr_id =  repetida.ivr_id)