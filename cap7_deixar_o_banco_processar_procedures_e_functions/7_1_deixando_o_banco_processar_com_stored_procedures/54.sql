USE `comercial`;

DELIMITER $$

CREATE PROCEDURE processa_comissionamento(
    IN data_inicial date,
    IN data_final date,
    OUT total_processado int
) BEGIN DECLARE total_venda float(10, 2) DEFAULT 0;

DECLARE venda int DEFAULT 0;

DECLARE vendedor int DEFAULT 0;

DECLARE comissao float(10, 2) DEFAULT 0;

DECLARE valor_comissao float(10, 2) DEFAULT 0;

DECLARE aux int DEFAULT 0;

DECLARE fimloop int DEFAULT 0;

DECLARE busca_pedido CURSOR FOR
SELECT
    n_numevenda,
    n_totavenda,
    n_numevende
FROM
    comvenda
WHERE
    d_datavenda BETWEEN data_inicial
    AND data_final
    AND n_totavenda > 0;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
SET
    fimloop = 1;

OPEN busca_pedido;

vendas: LOOP IF fimloop = 1 THEN LEAVE vendas;

END IF;

FETCH busca_pedido INTO venda,
total_venda,
vendedor;

SELECT
    n_porcvende INTO comissao
FROM
    comvende
WHERE
    n_numevende = vendedor;

IF (comissao > 0) THEN
SET
    valor_comissao = ((total_venda * comissao) / 100);

UPDATE
    comvenda
SET
    n_comvenda = valor_comissao
WHERE
    n_numevenda = venda;

COMMIT;

ELSEIF(comissao = 0) THEN
UPDATE
    comvenda
SET
    n_comvenda = 0
WHERE
    n_numevenda = venda;

COMMIT;

ELSE
SET
    comissao = 1;

SET
    valor_comissao = ((total_venda * comissao) / 100);

UPDATE
    comvenda
SET
    n_comvenda = valor_comissao
WHERE
    n_numevenda = venda;

COMMIT;

END IF;

SET
    comissao = 0;

SET
    aux = aux + 1;

END LOOP vendas;

SET
    total_processado = aux;

CLOSE busca_pedido;

END $ $

DELIMITER ;

call processa_comissionamento('2015-01-01', '2015-05-30', @a);

SELECT
    @a;