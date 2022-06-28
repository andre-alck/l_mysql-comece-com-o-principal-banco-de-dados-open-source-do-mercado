SELECT
    c_codiprodu,
    c_descprodu
FROM
    comprodu
WHERE
    substr(c_codiprodu, 1, 3) = '123'
    AND length(c_codiprodu) > 4;