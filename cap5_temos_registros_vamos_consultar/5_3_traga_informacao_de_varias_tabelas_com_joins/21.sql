SELECT
    c_codiclien codigo,
    c_razaclien razao_social,
    c_codivenda codi_venda
FROM
    comvenda
    JOIN comclien ON comvenda.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;