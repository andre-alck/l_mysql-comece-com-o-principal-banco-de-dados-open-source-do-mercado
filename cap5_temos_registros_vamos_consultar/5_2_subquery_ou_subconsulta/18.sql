SELECT
    c_codiclien CODIGO,
    c_nomeclien CLIENTE
FROM
    comclien
WHERE
    n_numeclien NOT IN (1, 2, 3, 4);