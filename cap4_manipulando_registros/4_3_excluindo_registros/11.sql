DELETE FROM
    comclien
WHERE
    n_numeclien = 1;

COMMIT;

DELETE FROM
    comclien;

COMMIT;

-- TRUNCATE TABLE comclien;