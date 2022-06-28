SELECT
    c_razaclien,
    count('este parâmetro não é relevante') Qtde
FROM
    comclien,
    comvenda
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
GROUP BY
    c_razaclien
HAVING
    count(n_numevenda) > 2;