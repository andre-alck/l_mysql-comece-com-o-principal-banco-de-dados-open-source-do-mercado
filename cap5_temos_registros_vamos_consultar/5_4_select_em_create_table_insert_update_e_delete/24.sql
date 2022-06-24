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