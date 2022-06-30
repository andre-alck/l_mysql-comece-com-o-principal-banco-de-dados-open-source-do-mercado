DROP DATABASE IF EXISTS comercial;

-- 3.sql
CREATE DATABASE comercial;

SHOW DATABASES;

USE comercial;

-- 4.sql
CREATE TABLE comclien (
    n_numeclien INT NOT NULL AUTO_INCREMENT,
    c_codiclien VARCHAR(10),
    c_nomeclien VARCHAR(100),
    c_razaclien VARCHAR(100),
    d_dataclien DATE,
    c_cnpjclien VARCHAR(20),
    c_foneclien VARCHAR(20),
    PRIMARY KEY (n_numeclien)
);

CREATE TABLE comforne (
    n_numeforne INT NOT NULL AUTO_INCREMENT,
    c_codiforne VARCHAR(10),
    c_nomeforne VARCHAR(100),
    c_razaforne VARCHAR(100),
    c_foneforne VARCHAR(20),
    PRIMARY KEY (n_numeforne)
);

CREATE TABLE comvende (
    n_numevende INT NOT NULL AUTO_INCREMENT,
    c_codivende VARCHAR(10),
    c_nomevende VARCHAR(100),
    c_razavende VARCHAR(100),
    c_fonevende VARCHAR(20),
    n_porcvende FLOAT(10, 2),
    PRIMARY KEY (n_numevende)
);

CREATE TABLE comprodu (
    n_numeprodu INT NOT NULL AUTO_INCREMENT,
    c_codiprodu VARCHAR(10),
    c_descprodu VARCHAR(100),
    n_valoprodu FLOAT(10, 2),
    c_situprodu VARCHAR(1),
    n_numeforne INT,
    PRIMARY KEY (n_numeprodu)
);

CREATE TABLE comvenda (
    n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien int NOT NULL,
    n_numeforne int NOT NULL,
    n_numevende int NOT NULL,
    n_valovenda float(10, 2),
    n_descvenda float(10, 2),
    n_totavenda float(10, 2),
    d_datavenda DATE,
    PRIMARY KEY (n_numevenda)
);

CREATE TABLE comvendas (
    n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien int NOT NULL,
    n_numeforne int NOT NULL,
    n_numevende int NOT NULL,
    n_valovenda float(10, 2),
    n_descvenda float(10, 2),
    n_totavenda float(10, 2),
    d_datavenda DATE,
    PRIMARY KEY (n_numevenda)
);

CREATE TABLE comivenda (
    n_numeivenda INT NOT NULL AUTO_INCREMENT,
    n_numevenda INT NOT NULL,
    n_numeprodu INT NOT NULL,
    n_valoivenda FLOAT(10, 2),
    n_qtdeivenda INT,
    n_descivenda FLOAT(10, 2),
    PRIMARY KEY (n_numeivenda)
);

-- 5.sql
ALTER TABLE
    comvenda
ADD
    CONSTRAINT fk_comprodu_comforne FOREIGN KEY(n_numeforne) REFERENCES comforne(n_numeforne) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    comvenda
ADD
    CONSTRAINT fk_comprodu_comvende FOREIGN KEY(n_numevende) REFERENCES comvende(n_numevende) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    comvenda
ADD
    CONSTRAINT fk_comvenda_comclien FOREIGN KEY(n_numeclien) REFERENCES comclien(n_numeclien) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    comivenda
ADD
    CONSTRAINT fk_comivenda_comprodu FOREIGN KEY(n_numeprodu) REFERENCES comprodu(n_numeprodu) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    comivenda
ADD
    CONSTRAINT fk_comivenda_comvenda FOREIGN KEY(n_numevenda) REFERENCES comvenda(n_numevenda) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 7.sql
ALTER TABLE
    comclien
ADD
    COLUMN c_cidaclien VARCHAR(50);

ALTER TABLE
    comclien
ADD
    COLUMN c_estclien VARCHAR(50);

-- c_estclien está fora do padrão, considerando que só possui 3 (est). Portanto, é necessário deletar a coluna e refazê-la
ALTER TABLE
    comclien DROP COLUMN c_estclien;

ALTER TABLE
    comclien
ADD
    COLUMN c_estaclien VARCHAR(50);

-- ALTER TABLE
--     comclien
-- MODIFY
--     COLUMN c_estaclien INT;
-- ALTER TABLE
--     comclien
-- MODIFY
--     COLUMN c_estaclien VARCHAR(100);
-- 8.sql
DROP TABLE comvendas;

-- 9.sql
INSERT INTO
    comclien(
        n_numeclien,
        c_codiclien,
        c_nomeclien,
        c_razaclien,
        d_dataclien,
        c_cnpjclien,
        c_foneclien,
        c_cidaclien,
        c_estaclien
    )
VALUES
    (
        1,
        '0001',
        'AARONSON',
        'AARONSON FURNITURE LTDA',
        '2015-02-17',
        '17.807.928/0001-85',
        '(21) 8167-6584',
        'QUEIMADOS',
        'RJ'
    );

INSERT INTO
    comclien(
        n_numeclien,
        c_codiclien,
        c_nomeclien,
        c_razaclien,
        d_dataclien,
        c_cnpjclien,
        c_foneclien,
        c_cidaclien,
        c_estaclien
    )
VALUES
    (
        2,
        '0001',
        'AARONSON',
        'AARONSON FURNITURE LTDA',
        '2015-02-17',
        '17.807.928/0001-85',
        '(21) 8167-6584',
        'QUEIMADOS',
        'RJ'
    );

-- 10.sql
UPDATE
    comclien
SET
    c_nomeclien = "AARONSON FURNITURE",
    c_cidaclien = "LONDRINA",
    c_estaclien = "PR"
WHERE
    n_numeclien = 1;

COMMIT;

-- 11.sql
DELETE FROM
    comclien
WHERE
    n_numeclien = 1;

COMMIT;

DELETE FROM
    comclien;

COMMIT;

-- 12_popula.sql
-- TRUNCATE TABLE comclien;
/*
 *******************************************
 *   Editora: Casa do Código               *
 *   Livro..: MySQL do básico ao Avançado  *
 *   ISBN...:                              *  
 *   Autor..: Vinicius Carvalho de Souza   *
 *******************************************
 
 Arquivo: popula_banco.sql
 
 */
DELETE FROM
    comclien;

DELETE FROM
    comforne;

DELETE FROM
    comvende;

DELETE FROM
    comprodu;

DELETE FROM
    comvenda;

DELETE FROM
    comivenda;

COMMIT;

INSERT INTO
    comclien
VALUES
    (
        1,
        '0001',
        'AARONSON FURNITURE',
        'AARONSON FURNITURE LTD',
        '2015-02-17 23:14:50',
        '17.807.928/0001-85',
        '(21) 8167-6584',
        'QUEIMADOS',
        'RJ'
    );

INSERT INTO
    comclien
VALUES
    (
        2,
        '0002',
        'LITTLER ',
        'LITTLER  LTDA',
        '2015-02-17 23:14:50',
        '55.643.605/0001-92',
        '(27) 7990-9502',
        'SERRA',
        'ES'
    );

INSERT INTO
    comclien
VALUES
    (
        3,
        '0003',
        'KELSEY  NEIGHBOURHOOD',
        'KELSEY  NEIGHBOURHOOD',
        '2015-02-17 23:14:50',
        '05.202.361/0001-34',
        '(11) 4206-9703',
        'BRAGANÇA PAULISTA',
        'SP'
    );

INSERT INTO
    comclien
VALUES
    (
        4,
        '0004',
        'GREAT AMERICAN MUSIC',
        'GREAT AMERICAN MUSIC',
        '2015-02-17 23:14:50',
        '11.880.735/0001-73',
        '(75) 7815-7801',
        'SANTO ANTÔNIO DE JESUS',
        'BA'
    );

INSERT INTO
    comclien
VALUES
    (
        5,
        '0005',
        'LIFE PLAN COUNSELLING',
        'LIFE PLAN COUNSELLING',
        '2015-02-17 23:14:50',
        '75.185.467/0001-52',
        '(17) 4038-9355',
        'BEBEDOURO',
        'SP'
    );

INSERT INTO
    comclien
VALUES
    (
        6,
        '0006',
        'PRACTI-PLAN',
        'PRACTI-PLAN LTDA',
        '2015-02-17 23:14:50',
        '32.518.106/0001-78',
        '(28) 2267-6159',
        'CACHOEIRO DE ITAPEMIRI',
        'ES'
    );

INSERT INTO
    comclien
VALUES
    (
        7,
        '0007',
        'SPORTSWEST',
        'SPORTSWEST LTDA',
        '2015-02-17 23:14:50',
        '83.175.645/0001-92',
        '(61) 4094-7184',
        'TAGUATINGA',
        'DF'
    );

INSERT INTO
    comclien
VALUES
    (
        8,
        '0008',
        'HUGHES MARKETS',
        'HUGHES MARKETS LTDA',
        '2015-02-17 23:14:50',
        '04.728.160/0001-02',
        '(21) 7984-9809',
        'RIO DE JANEIRO',
        'RJ'
    );

INSERT INTO
    comclien
VALUES
    (
        9,
        '0009',
        'AUTO WORKS',
        'AUTO WORKS LTDA',
        '2015-02-17 23:14:50',
        '08.271.985/0001-00',
        '(21) 8548-5555',
        'RIO DE JANEIRO',
        'RJ'
    );

INSERT INTO
    comclien
VALUES
    (
        10,
        '00010',
        'DAHLKEMPER ',
        'DAHLKEMPER  LTDA',
        '2015-02-17 23:14:50',
        '49.815.047/0001-00',
        '(11) 4519-7670',
        'SÃO PAULO',
        'SP'
    );

INSERT INTO
    comvende
VALUES
    (
        1,
        '0001',
        'CARLOS FERNANDES',
        'CARLOS FERNANDES LTDA',
        '(47) 7535-8144',
        12
    );

INSERT INTO
    comvende
VALUES
    (
        2,
        '0002',
        'JÚLIA	GOMES',
        'JÚLIA GOMES LTDA',
        '(12) 8037-6661',
        25
    );

INSERT INTO
    comforne
VALUES
    (
        1,
        '0001',
        'DUN RITE LAWN MAINTENANCE',
        'DUN RITE LAWN MAINTENANCE LTDA',
        '(85) 7886-8837'
    );

INSERT INTO
    comforne
VALUES
    (
        2,
        '0002',
        'SEWFRO FABRICS',
        'SEWFRO FABRICS LTDA',
        '(91) 5171-8483'
    );

INSERT INTO
    comprodu
VALUES
    (
        1,
        '123131',
        'NOTEBOOK',
        '1251.29',
        'A',
        1
    );

INSERT INTO
    comprodu
VALUES
    (
        2,
        '123223',
        'SMARTPHONE',
        '1242.21',
        'A',
        2
    );

INSERT INTO
    comprodu
VALUES
    (3, '1231', 'DESKTOP', '1241.21', 'A', 1);

INSERT INTO
    comprodu
VALUES
    (
        4,
        '142123',
        'TELEVISÃO',
        '2564.92',
        'A',
        2
    );

INSERT INTO
    comprodu
VALUES
    (5, '7684', 'DRONE', '2325.32', 'A', 1);

INSERT INTO
    comvenda
VALUES
    (
        1,
        '1',
        1,
        1,
        1,
        '25141.02',
        0,
        '25141.02',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        2,
        '2',
        2,
        2,
        2,
        '12476.58',
        0,
        '12476.58',
        '2015-01-02'
    );

INSERT INTO
    comvenda
VALUES
    (
        3,
        '3',
        3,
        1,
        1,
        '16257.32',
        0,
        '16257.32',
        '2015-01-03'
    );

INSERT INTO
    comvenda
VALUES
    (
        4,
        '4',
        4,
        2,
        2,
        '8704.55',
        0,
        '8704.55',
        '2015-01-04'
    );

INSERT INTO
    comvenda
VALUES
    (
        5,
        '5',
        5,
        1,
        1,
        '13078.81',
        0,
        '13078.81',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        6,
        '6',
        6,
        2,
        2,
        '6079.19',
        0,
        '6079.19',
        '2015-01-02'
    );

INSERT INTO
    comvenda
VALUES
    (
        7,
        '7',
        7,
        1,
        1,
        '7451.26',
        0,
        '7451.26',
        '2015-01-03'
    );

INSERT INTO
    comvenda
VALUES
    (
        8,
        '8',
        8,
        2,
        2,
        '15380.47',
        0,
        '15380.47',
        '2015-01-04'
    );

INSERT INTO
    comvenda
VALUES
    (
        9,
        '9',
        9,
        1,
        1,
        '13508.34',
        0,
        '13508.34',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        10,
        '10',
        1,
        2,
        2,
        '20315.07',
        0,
        '20315.07',
        '2015-01-02'
    );

INSERT INTO
    comvenda
VALUES
    (
        11,
        '11',
        1,
        1,
        1,
        '8704.55',
        0,
        '8704.55',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        12,
        '12',
        2,
        2,
        2,
        '11198.05',
        0,
        '11198.05',
        '2015-01-02'
    );

INSERT INTO
    comvenda
VALUES
    (
        13,
        '13',
        3,
        1,
        1,
        '4967.84',
        0,
        '4967.84',
        '2015-01-03'
    );

INSERT INTO
    comvenda
VALUES
    (
        14,
        '14',
        3,
        2,
        2,
        '7451.26',
        0,
        '7451.26',
        '2015-01-04'
    );

INSERT INTO
    comvenda
VALUES
    (
        15,
        '15',
        5,
        1,
        1,
        '10747.359',
        0,
        '10747.36',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        16,
        '16',
        6,
        2,
        2,
        '13502.34',
        0,
        '13502.34',
        '2015-01-02'
    );

INSERT INTO
    comvenda
VALUES
    (
        17,
        '17',
        7,
        1,
        1,
        '22222.99',
        0,
        '22222.99',
        '2015-01-03'
    );

INSERT INTO
    comvenda
VALUES
    (
        18,
        '18',
        8,
        2,
        2,
        '15465.69',
        0,
        '15465.69',
        '2015-01-04'
    );

INSERT INTO
    comvenda
VALUES
    (
        19,
        '19',
        9,
        1,
        1,
        '4650.64',
        0,
        '4650.64',
        '2015-01-01'
    );

INSERT INTO
    comvenda
VALUES
    (
        20,
        '20',
        9,
        2,
        2,
        '6975.96',
        0,
        '6975.96',
        '2015-01-02'
    );

INSERT INTO
    comivenda
VALUES
    (1, 1, 1, '1251.29', 1, 0);

INSERT INTO
    comivenda
VALUES
    (2, 1, 2, '1242.21', 2, 0);

INSERT INTO
    comivenda
VALUES
    (3, 1, 3, '1241.21', 3, 0);

INSERT INTO
    comivenda
VALUES
    (4, 1, 4, '1513.77', 4, 0);

INSERT INTO
    comivenda
VALUES
    (5, 1, 5, '2325.32', 5, 0);

INSERT INTO
    comivenda
VALUES
    (6, 2, 1, '1251.29', 6, 0);

INSERT INTO
    comivenda
VALUES
    (7, 3, 3, '1241.21', 7, 0);

INSERT INTO
    comivenda
VALUES
    (8, 4, 1, '1251.29', 1, 0);

INSERT INTO
    comivenda
VALUES
    (9, 5, 3, '1241.21', 2, 0);

INSERT INTO
    comivenda
VALUES
    (10, 6, 1, '1251.29', 3, 0);

INSERT INTO
    comivenda
VALUES
    (11, 7, 2, '1242.21', 4, 0);

INSERT INTO
    comivenda
VALUES
    (12, 8, 5, '2325.32', 5, 0);

INSERT INTO
    comivenda
VALUES
    (13, 9, 2, '1242.21', 6, 0);

INSERT INTO
    comivenda
VALUES
    (14, 10, 3, '1241.21', 7, 0);

INSERT INTO
    comivenda
VALUES
    (15, 11, 1, '1251.29', 1, 0);

INSERT INTO
    comivenda
VALUES
    (16, 12, 1, '1251.29', 2, 0);

INSERT INTO
    comivenda
VALUES
    (17, 13, 2, '1242.21', 3, 0);

INSERT INTO
    comivenda
VALUES
    (18, 14, 2, '1242.21', 4, 0);

INSERT INTO
    comivenda
VALUES
    (19, 15, 3, '1241.21', 5, 0);

INSERT INTO
    comivenda
VALUES
    (20, 16, 3, '1241.21', 6, 0);

INSERT INTO
    comivenda
VALUES
    (21, 17, 4, '1513.77', 7, 0);

INSERT INTO
    comivenda
VALUES
    (22, 18, 4, '1513.77', 1, 0);

INSERT INTO
    comivenda
VALUES
    (23, 19, 5, '2325.32', 2, 0);

INSERT INTO
    comivenda
VALUES
    (24, 20, 5, '2325.32', 3, 0);

INSERT INTO
    comivenda
VALUES
    (25, 2, 2, '1242.21', 4, 0);

INSERT INTO
    comivenda
VALUES
    (26, 3, 4, '1513.77', 5, 0);

INSERT INTO
    comivenda
VALUES
    (27, 4, 2, '1242.21', 6, 0);

INSERT INTO
    comivenda
VALUES
    (28, 5, 4, '1513.77', 7, 0);

INSERT INTO
    comivenda
VALUES
    (29, 6, 5, '2325.32', 1, 0);

INSERT INTO
    comivenda
VALUES
    (30, 7, 3, '1241.21', 2, 0);

INSERT INTO
    comivenda
VALUES
    (31, 8, 1, '1251.29', 3, 0);

INSERT INTO
    comivenda
VALUES
    (32, 9, 4, '1513.77', 4, 0);

INSERT INTO
    comivenda
VALUES
    (33, 10, 5, '2325.32', 5, 0);

INSERT INTO
    comivenda
VALUES
    (34, 11, 2, '1242.21', 6, 0);

INSERT INTO
    comivenda
VALUES
    (35, 12, 2, '1242.21', 7, 0);

INSERT INTO
    comivenda
VALUES
    (36, 13, 3, '1241.21', 1, 0);

INSERT INTO
    comivenda
VALUES
    (37, 14, 3, '1241.21', 2, 0);

INSERT INTO
    comivenda
VALUES
    (38, 15, 4, '1513.77', 3, 0);

INSERT INTO
    comivenda
VALUES
    (39, 16, 4, '1513.77', 4, 0);

INSERT INTO
    comivenda
VALUES
    (40, 17, 5, '2325.32', 5, 0);

INSERT INTO
    comivenda
VALUES
    (41, 18, 5, '2325.32', 6, 0);

-- 13.sql
SELECT
    *
FROM
    comclien;

SELECT
    n_numeclien,
    c_codiclien,
    c_razaclien
FROM
    comclien;

SELECT
    n_numeclien,
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    c_codiclien = '0001';

SELECT
    n_numeclien,
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    c_codiclien <> '0001';

SELECT
    n_numeclien,
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    c_nomeclien LIKE "L%";

-- 14.sql
SELECT
    n_numeclien
FROM
    comvenda;

-- 15.sql
SELECT
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien IN (1, 2);

SELECT
    c_codiclien,
    c_razaclien
FROM
    comclien
WHERE
    n_numeclien NOT IN (1, 2);

-- 16.sql
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
    );

-- 17.sql
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

-- 18.sql
SELECT
    c_codiclien CODIGO,
    c_nomeclien CLIENTE
FROM
    comclien
WHERE
    n_numeclien NOT IN (1, 2, 3, 4);

-- 19.sql
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

-- 20.sql
SELECT
    c_codiclien,
    c_razaclien,
    c_codivenda Cod_venda
FROM
    comvenda,
    comclien
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;

-- 21.sql
SELECT
    c_codiclien codigo,
    c_razaclien razao_social,
    c_codivenda codi_venda
FROM
    comvenda
    JOIN comclien ON comvenda.n_numeclien = comclien.n_numeclien
ORDER BY
    c_razaclien;

-- 22.sql
CREATE TABLE comclien_bkp AS(
    SELECT
        *
    FROM
        comclien
    WHERE
        c_estaclien = 'SP'
);

-- 23.sql
CREATE TABLE comcontato (
    n_numecontato int NOT NULL AUTO_INCREMENT,
    c_nomecontato varchar(200),
    c_fonecontato varchar(30),
    c_cidacontato varchar(200),
    c_estacontato varchar(2),
    n_numeclien int,
    PRIMARY KEY(n_numecontato)
);

INSERT INTO
    comcontato(
        SELECT
            n_numeclien,
            c_nomeclien,
            c_foneclien,
            c_cidaclien,
            c_estaclien,
            n_numeclien
        FROM
            comclien
    );

SELECT
    *
FROM
    comcontato;

-- 24.sql
UPDATE
    comcontato
SET
    c_cidacontato = 'LONDRINA',
    c_estacontato = 'PR'
WHERE
    n_numeclien IN (
        SELECT
            n_numeclien
        FROM
            comclien_bkp
    );

-- 25.sql
DELETE FROM
    comcontato
WHERE
    n_numeclien NOT IN (
        SELECT
            n_numeclien
        FROM
            comvenda
    );

-- 26.sql
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

-- 27.sql
SELECT
    c_codiclien Cod_Cliente,
    c_razaclien Razao_Cliente
FROM
    comclien,
    comvenda
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
GROUP BY
    c_codiclien,
    c_razaclien
ORDER BY
    c_razaclien;

-- 28.sql
SELECT
    c_codiclien Cod_Cliente,
    c_razaclien Razao_Cliente,
    count('este parâmetro não é relevante') Qtde
FROM
    comclien,
    comvenda
WHERE
    comvenda.n_numeclien = comclien.n_numeclien
GROUP BY
    c_codiclien,
    c_razaclien
ORDER BY
    c_razaclien;

-- 29.sql
SELECT
    count(*)
FROM
    comclien;

-- 30.sql
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

-- 31.sql
SELECT
    max(n_valovenda) maior_venda
FROM
    comvenda;

SELECT
    min(n_valovenda) menor_venda
FROM
    comvenda;

SELECT
    min(n_valovenda) menor_venda,
    max(n_valovenda) maior_venda
FROM
    comvenda;

-- 32.sql
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
-- 33.sql
-- SELECT
--     avg(n_numeclien)
-- FROM
--     comclien;
SELECT
    format(AVG(n_numeclien), 2)
FROM
    comclien;

-- 34.sql
SELECT
    c_codiprodu,
    c_descprodu
FROM
    comprodu
WHERE
    substr(c_codiprodu, 1, 3) = '123'
    AND length(c_codiprodu) > 4;

-- 35.sql
SELECT
    substr(c_razaclien, 1, 5) Razao__Cliente,
    length(c_codiclien) Codigo_Cliente
FROM
    comclien;

-- 36.sql
SELECT
    concat(c_razaforne, ' - fone: ', c_foneforne) Dados_Fornecedores
FROM
    comforne
ORDER BY
    c_razaforne;

-- 37.sql
SELECT
    concat(c_codiclien, ' ', c_razaclien, ' ', c_nomeclien)
FROM
    comclien
WHERE
    c_razaclien LIKE 'GREA%';

-- 38.sql
SELECT
    concat_ws(';', c_codiclien, c_razaclien, c_nomeclien)
FROM
    comclien
WHERE
    c_razaclien LIKE 'GREA%';

-- 39.sql
SELECT
    lcase(c_razaclien)
FROM
    comclien;

-- 40.sql
SELECT
    ucase('banco de dados mysql')
FROM
    dual;

-- 41.sql
SELECT
    round(213.14999999999, 2)
FROM
    dual;

-- 42.sql
SELECT
    format(213.14999999999, 2)
FROM
    dual;

-- 43.sql
SELECT
    TRUNCATE(213.14999999999, 1)
FROM
    dual;

-- 44.sql
SELECT
    sqrt(213.14999999999)
FROM
    dual;

-- 45.sql
SELECT
    pi();

SELECT
    sin(pi());

SELECT
    cos(pi());

SELECT
    tan(pi());

-- 46.sql
SELECT
    (n_qtdeivenda * n_valoivenda) multiplicação
FROM
    comivenda
WHERE
    n_numeivenda = 4;

-- 47.sql
SELECT
    TRUNCATE(sum(n_valoivenda) / count(n_numeivenda), 2) divisão
FROM
    comivenda;

-- 48.sql
SELECT
    n_descivenda + n_valoivenda adição
FROM
    comivenda
WHERE
    n_numeivenda = 4;

-- 49.sql
SELECT
    n_valoivenda - n_descivenda subtração
FROM
    comivenda
WHERE
    n_numeivenda = 4;

-- 50.sql
SELECT
    curdate();

SELECT
    NOW();

SELECT
    sysdate();

SELECT
    curtime();

SELECT
    datediff('2022-06-28 16:21:00', '2015-06-28 16:21:00');

SELECT
    date_add('2013-01-01', INTERVAL 31 DAY);

SELECT
    dayname('2022-06-28');

SELECT
    dayofmonth('2022-06-28');

SELECT
    extract(
        year
        FROM
            '2022-06-28'
    );

SELECT
    last_day('2022-06-28');

-- 51.sql
SELECT
    date_format('2022-06-28', get_format(date, 'EUR')) manual,
    date_format(curdate(), get_format(date, 'EUR')) automático;

-- 52.sql
SELECT
    str_to_date('01.01.2015', get_format(date, 'USA'));

-- 53.sql

ALTER TABLE
    comvende
ADD
    n_porcvende float(10, 2);
    -- possível erro

ALTER TABLE
    comvenda
ADD
    n_vcomvenda float(10, 2);

-- 54.sql

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
    n_vcomvenda = valor_comissao
WHERE
    n_numevenda = venda;

COMMIT;

ELSEIF(comissao = 0) THEN
UPDATE
    comvenda
SET
    n_vcomvenda = 0
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
    n_vcomvenda = valor_comissao
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

END $$

DELIMITER ;

call processa_comissionamento('2015-01-01', '2015-05-30', @a);

SELECT
    @a;

-- 55.sql

use comercial;

delimiter $$;

CREATE FUNCTION rt_nome_cliente(vn_numeclien int) RETURNS varchar(50) DETERMINISTIC

BEGIN

declare nome varchar(50);

SELECT
    c_nomeclien INTO nome
FROM
    comclien
WHERE
    n_numeclien = vn_numeclien;

RETURN nome;

END $$;

delimiter ;

-- 56.sql

select rt_nome_cliente(1);

-- 57.sql

SELECT
    c_codivenda,
    rt_nome_cliente(n_numeclien),
    d_datavenda
FROM
    comvenda
ORDER BY
    2,
    3;

-- 58.sql

SELECT
    'teste'
FROM
    dual;

SELECT
    rt_nome_cliente(10)
FROM
    dual;

-- 59.sql

SET
    GLOBAL event_scheduler = ON;

-- 60.sql

delimiter $$

CREATE event processa_comissao ON schedule every 1 week starts '2015-03-01 23:38:00' DO BEGIN call processa_comissionamento(
    current_date() - INTERVAL 7 DAY,
    current_date(),
    @a
);

END

$$

delimiter ;

ALTER event processa_comissao disable;

-- 61.sql

delimiter $$

CREATE event processa_comissao_event
ON schedule every 10 MINUTE
starts NOW()
ends NOW() + INTERVAL 30 MINUTE
DO
BEGIN
    call processa_comissionamento(
        current_date() - INTERVAL 7 DAY,
        current_date(),
        @a
    );

END $$

delimiter ;

ALTER event processa_comissao_event disable;