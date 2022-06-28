SELECT
    c_codiclien Cod_Cliente,
    c_razaclien Razao_Cliente
FROM
    comclien,
    comvenda
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
GROUP BY
    c_codiclien,
    c_razaclien
ORDER BY
    c_razaclien;