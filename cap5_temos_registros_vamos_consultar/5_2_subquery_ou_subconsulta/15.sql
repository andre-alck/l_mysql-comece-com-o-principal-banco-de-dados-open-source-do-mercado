SELECT
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien IN (1, 2);

SELECT
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien NOT IN (1, 2);