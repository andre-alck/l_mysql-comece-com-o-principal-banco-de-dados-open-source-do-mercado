SELECT
    c_codivenda,
    rt_nome_cliente(n_numeclien),
    d_datavenda
FROM
    comvenda
ORDER BY
    2,
    3;