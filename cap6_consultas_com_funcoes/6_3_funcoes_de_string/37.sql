SELECT
    concat(c_codiclien, ' ', c_razaclien, ' ', c_nomeclien)
FROM
    comclien
WHERE
    c_razaclien LIKE 'GREA%';