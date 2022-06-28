SELECT
    sum(n_valovenda) valor_venda,
    sum(n_descvenda) descontos,
    sum(n_totavenda) total_venda
FROM
    comvenda
WHERE
    d_datavenda BETWEEN '2015-01-01'
    AND '2015-01-31';

-- ERRO: no livro, valor de total_venda diferente... voltar aqui, caso necessário