CREATE OR REPLACE FUNCTION Z99_FUNCTIONS.clean_integer(input_value INT64)
RETURNS INT64
AS (
    CASE 
        WHEN input_value IS NULL THEN -999999 
        ELSE input_value 
    END
);