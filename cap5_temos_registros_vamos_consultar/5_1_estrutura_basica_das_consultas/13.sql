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