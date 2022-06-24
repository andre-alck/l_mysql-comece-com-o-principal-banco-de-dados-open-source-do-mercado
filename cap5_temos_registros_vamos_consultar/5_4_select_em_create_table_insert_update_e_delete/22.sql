CREATE TABLE comclien_bkp AS(
    SELECT
        *
    FROM
        comclien
    WHERE
        c_estaclien = 'SP'
);