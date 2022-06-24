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