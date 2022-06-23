-- consulta para retornar a razão social dos clientes que possuem registro na tabela comvenda
SELECT
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien IN (
        SELECT
            DISTINCT n_numeclien
        FROM
            comvenda
    );

-- consulta para buscar os clientes que ainda não fizeram nenhuma venda. a consulta principal vai consultar todos os registros que não possuem  n_numeclien na tabela comvenda.
SELECT
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien NOT IN (
        SELECT
            DISTINCT n_numeclien
        FROM
            comvenda
    )