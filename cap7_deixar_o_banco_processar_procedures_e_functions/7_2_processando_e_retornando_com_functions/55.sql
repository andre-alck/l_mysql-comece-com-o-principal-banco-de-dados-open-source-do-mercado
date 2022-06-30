use comercial;

delimiter $$;

CREATE FUNCTION rt_nome_cliente(vn_numeclien int) RETURNS varchar(50) DETERMINISTIC

BEGIN

declare nome varchar(50);

SELECT
    c_nomeclien INTO nome
FROM
    comclien
WHERE
    n_numeclien = vn_numeclien;

RETURN nome;

END $$;

delimiter ;