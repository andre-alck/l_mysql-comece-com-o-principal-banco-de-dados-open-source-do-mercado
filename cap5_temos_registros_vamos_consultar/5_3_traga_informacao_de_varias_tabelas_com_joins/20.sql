SELECT
    c_codiclien,
    c_razaclien,
    c_codivenda Cod_venda
FROM
    comvenda,
    comclien
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;