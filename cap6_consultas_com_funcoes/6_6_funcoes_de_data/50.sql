SELECT
    curdate();

SELECT
    NOW();

SELECT
    sysdate();

SELECT
    curtime();

SELECT
    datediff('2022-06-28 16:21:00', '2015-06-28 16:21:00');

SELECT
    date_add('2013-01-01', INTERVAL 31 DAY);

SELECT
    dayname('2022-06-28');

SELECT
    dayofmonth('2022-06-28');

SELECT
    extract(
        year
        FROM
            '2022-06-28'
    );

SELECT
    last_day('2022-06-28');