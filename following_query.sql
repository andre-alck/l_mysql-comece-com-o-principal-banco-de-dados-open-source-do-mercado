-- 8.sql
CREATE TABLE tabelaerrada(
    n_numeerrada INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (n_numeerrada)
);

DROP TABLE tabelaerrada;

DROP TABLE IF EXISTS tblanima;

-- 4.sql
CREATE TABLE tblanima (
    n_numeanima INT NOT NULL AUTO_INCREMENT,
    c_codianima VARCHAR(10),
    c_nomeanima VARCHAR(100),
    c_razaanima VARCHAR(100),
    d_dataanima DATE,
    PRIMARY KEY (n_numeanima)
);

-- 7.sql
ALTER TABLE
    tblanima
ADD
    COLUMN colunaerrada VARCHAR(20);

ALTER TABLE
    tblanima DROP COLUMN colunaerrada;

ALTER TABLE
    tblanima
ADD
    COLUMN n_numeclien INT NOT NULL;

-- 5.sql
ALTER TABLE
    tblanima
ADD
    CONSTRAINT fk_tblanima_comclien FOREIGN KEY(n_numeclien) REFERENCES comclien(n_numeclien) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 9.sql
INSERT INTO
    tblanima(
        n_numeanima,
        c_codianima,
        c_nomeanima,
        c_razaanima,
        d_dataanima,
        n_numeclien
    )
VALUES
    (
        1,
        '1',
        'Alce',
        'Alce RAZÃO',
        '2015-01-17',
        1
    );

INSERT INTO
    tblanima
VALUES
    (
        2,
        '2',
        'Baleia',
        'Baleia RAZÃO',
        '2015-02-17',
        2
    );

INSERT INTO
    tblanima
VALUES
    (
        3,
        '3',
        'Canguru',
        'Canguru RAZÃO',
        '2015-03-17',
        3
    );

INSERT INTO
    tblanima
VALUES
    (
        4,
        '4',
        'Dromedário',
        'Dromedário RAZÃO',
        '2015-04-17',
        4
    );

INSERT INTO
    tblanima
VALUES
    (
        5,
        '5',
        'Escorpião',
        'Escorpião RAZÃO',
        '2015-05-17',
        5
    );

-- 10.sql
UPDATE
    tblanima
SET
    c_razaanima = 'ALCE RAZÃO SOCIAL'
WHERE
    n_numeanima = 1;

COMMIT;

UPDATE
    tblanima
SET
    c_razaanima = 'BALEIA RAZÃO SOCIAL'
WHERE
    n_numeanima = 2;

COMMIT;

UPDATE
    tblanima
SET
    c_razaanima = 'CANGURU RAZÃO SOCIAL'
WHERE
    n_numeanima = 3;

COMMIT;

UPDATE
    tblanima
SET
    c_razaanima = 'DROMEDÁRIO RAZÃO SOCIAL'
WHERE
    n_numeanima = 4;

COMMIT;

UPDATE
    tblanima
SET
    c_razaanima = 'ESCORPIÃO RAZÃO SOCIAL'
WHERE
    n_numeanima = 5;

COMMIT;

INSERT INTO
    tblanima
VALUES
    (
        6,
        6,
        'Falcão',
        'FALCÃO RAZÃO SOCIAL',
        '2015-06-17',
        6
    );

-- 11.sql
DELETE FROM
    tblanima
WHERE
    n_numeanima = 6;

COMMIT;

-- 13.sql
SELECT
    *
FROM
    tblanima;

SELECT
    n_numeanima,
    c_razaanima,
    n_numeclien
FROM
    tblanima;

SELECT
    n_numeanima,
    c_razaanima,
    n_numeclien
FROM
    tblanima
WHERE
    n_numeclien = 1;

SELECT
    n_numeanima,
    c_razaanima,
    n_numeclien
FROM
    tblanima
WHERE
    n_numeclien <> 1;

SELECT
    n_numeanima,
    c_razaanima,
    n_numeclien
FROM
    tblanima
WHERE
    c_razaanima LIKE '%RAZÃO SOCIAL%';

-- 15.sql
SELECT
    *
FROM
    tblanima
WHERE
    n_numeanima IN (1, 2, 3);

SELECT
    *
FROM
    tblanima
WHERE
    n_numeanima NOT IN (1, 2, 3);

-- 16.sql
-- Retorne a razão do animal para cada registro presente nos números de clientes.
SELECT
    c_razaanima
FROM
    tblanima
WHERE
    n_numeanima IN (
        SELECT
            n_numeclien
        FROM
            comclien
    );

-- Retorne a razão do cliente para cada cliente que não está registrado na coluna de números de animais.
SELECT
    c_razaclien,
    n_numeclien
FROM
    comclien
WHERE
    n_numeclien NOT IN (
        SELECT
            n_numeanima
        FROM
            tblanima
    );

-- 17.sql
-- Consulta para retornar o código dos animais e a razão social dos respectivos clientes os possuem registrados.
SELECT
    c_codianima Cod_Animal,
    c_razaanima Raz_Animal,
    (
        SELECT
            c_razaclien
        FROM
            comclien
        WHERE
            n_numeclien = tblanima.n_numeanima
    ) Razao_Cliente
FROM
    tblanima;

-- 20.sql
SELECT
    c_razaanima
FROM
    tblanima,
    comclien
WHERE
    tblanima.n_numeanima = comclien.n_numeclien
ORDER BY
    d_dataanima;

-- 21.sql
SELECT
    n_numeanima Num_Animal,
    c_razaanima Razao_Animal,
    c_razaclien Razao_Cliente
FROM
    tblanima
    JOIN comclien ON tblanima.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;

-- 22.sql
DROP TABLE IF EXISTS tblanima_testing;

CREATE TABLE tblanima_testing AS(
    SELECT
        *
    FROM
        tblanima
    WHERE
        n_numeanima IN (1, 2, 3, 4)
);

-- 24.sql
UPDATE
    tblanima_testing
SET
    n_numeanima = 0
WHERE
    c_razaanima LIKE '%A%';

-- 25.sql
DELETE FROM
    tblanima_testing
WHERE
    n_numeanima <> 0;

-- 26.sql
SELECT
    c_codianima,
    c_razaanima
FROM
    tblanima,
    comclien
WHERE
    comclien.n_numeclien = tblanima.n_numeclien
ORDER BY
    c_razaanima;

-- 27.sql
INSERT INTO
    tblanima
VALUES
    (
        6,
        1,
        'Falcão',
        'FALCÃO RAZÃO SOCIAL',
        '2015-06-17',
        6
    );

SELECT
    tblanima.n_numeclien Num_Clien_Animal,
    comclien.n_numeclien Num_Clien_Cliente,
    c_codianima Cod_Animal,
    c_razaanima Raz_Animal
FROM
    tblanima,
    comclien
WHERE
    comclien.n_numeclien = tblanima.n_numeclien
GROUP BY
    c_codianima
ORDER BY
    c_razaanima;

--  28.sql
SELECT
    tblanima.n_numeclien Num_Clien_Animal,
    comclien.n_numeclien Num_Clien_Cliente,
    c_codianima Cod_Animal,
    c_razaanima Raz_Animal,
    count('') Qtde
FROM
    tblanima,
    comclien
WHERE
    comclien.n_numeclien = tblanima.n_numeclien
GROUP BY
    c_codianima
ORDER BY
    c_razaanima;

-- 30.sql
SELECT
    c_razaanima,
    count(*)
FROM
    tblanima
GROUP BY
    c_codianima
HAVING
    count(*) >= 2 -- 31.sql
SELECT
    max(n_numeanima)
FROM
    tblanima;

SELECT
    min(n_numeanima)
FROM
    tblanima;

-- 32.sql
SELECT
    sum(n_numeanima)
FROM
    comvenda
WHERE
    d_dataanima BETWEEN '2015-03-17'
    AND '2015-05-17';

-- 33.sql
SELECT
    format(avg(n_numeanima), 2)
FROM
    tblanima;

-- 34.sql
SELECT
    c_razaanima
FROM
    tblanima
WHERE
    substr(c_razaanima, 1, 5);

-- 35.sql
SELECT
    c_razaanima
FROM
    tblanima
WHERE
    length(c_razaanima) > 20;

-- 36.sql
SELECT
    concat(
        'A Razão Social do animal ',
        c_nomeanima,
        ' é: ',
        c_razaanima
    ) Nome
FROM
    tblanima;

-- 37.sql
SELECT
    concat('Nome: ', c_nomeanima)
FROM
    tblanima
WHERE
    c_nomeanima LIKE '%D%';

-- 38.sql + 39.sql + 40.sql
SELECT
    concat_ws(';', c_nomeanima, c_codianima, c_razaanima) Nome
FROM
    tblanima;

SELECT
    concat(
        ucase('o nome deste animal é: '),
        lcase(c_razaanima)
    ) Nome
FROM
    tblanima
WHERE
    c_razaanima LIKE '%A%';

-- 41.sql + 42.sql + 43.sql + 44.sql + 45.sql
SELECT
    format(round(TRUNCATE(sqrt(pi()), 5), 5), 5)
FROM
    dual;

-- 46.sql + 47.sq + 48.sq + 49.sq 
UPDATE
    tblanima
SET
    c_codianima = ((((c_codianima + 1) - 1) * 1) / 1);

COMMIT;

select c_codianima from tblanima;

-- 50.sql + 51.sql + 52.sql

select d_dataanima d_dataanima, curdate(), datediff(curdate(), d_dataanima) datediff, extract(year FROM curdate()) this_year from tblanima;