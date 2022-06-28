-- SELECT
--     avg(n_numeclien)
-- FROM
--     comclien;
SELECT
    format(AVG(n_numeclien), 2)
FROM
    comclien;