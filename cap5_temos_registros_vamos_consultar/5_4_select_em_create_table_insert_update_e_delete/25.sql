DELETE FROM
    comcontato
WHERE
    n_numeclien NOT IN (
        SELECT
            n_numeclien
        FROM
            comvenda
    );