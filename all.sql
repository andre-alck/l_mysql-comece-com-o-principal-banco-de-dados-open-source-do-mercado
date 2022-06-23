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