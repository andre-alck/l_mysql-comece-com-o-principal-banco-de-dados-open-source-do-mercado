SELECT
    date_format('2022-06-28', get_format(date, 'EUR')) manual,
    date_format(curdate(), get_format(date, 'EUR')) automático;