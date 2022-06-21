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
    n_numeprodu int NOT NULL,
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
    comvenda
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

-- TRUNCATE TABLE comclien;