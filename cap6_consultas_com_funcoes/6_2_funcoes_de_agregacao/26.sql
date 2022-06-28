SELECT
    c_codiclien,
    c_razaclien
FROM
    comvenda,
    comclien
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;

-- selecione o codigo e razao do cliente
-- importe as tabelas comvenda e comclien
-- selecione o codigo e razao do cliente somente se o numero de cliente estiver presente em ambas as tabelas importadas
-- sorteie alfabeticamente a partir da razao...