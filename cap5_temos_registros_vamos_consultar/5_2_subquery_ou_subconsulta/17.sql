-- consulta para retornar o código das vendas e a razão social dos respectivos clientes que as fizeram.
SELECT
    c_codivenda Cod_Venda,
    (
        SELECT
            c_razaclien
        FROM
            comclien
        WHERE
            n_numeclien = comvenda.n_numeclien
    ) Nome_Cliente
FROM
    comvenda;