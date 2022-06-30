DELIMITER $ $ CREATE PROCEDURE soma_vendas(OUT soma float(10, 2)) BEGIN DECLARE vv FLOAT(10, 2) DEFAULT 0;

DECLARE fimloop INT DEFAULT 0;

END $ $ DELIMITER;

CALL soma_vendas(@ret);

SELECT
    @ret;