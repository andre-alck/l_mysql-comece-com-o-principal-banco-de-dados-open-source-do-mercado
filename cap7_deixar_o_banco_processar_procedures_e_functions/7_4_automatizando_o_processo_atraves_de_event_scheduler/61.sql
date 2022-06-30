delimiter $$

CREATE event processa_comissao_event
ON schedule every 10 MINUTE
starts NOW()
ends NOW() + INTERVAL 30 MINUTE
DO
BEGIN
    call processa_comissionamento(
        current_date() - INTERVAL 7 DAY,
        current_date(),
        @a
    );

END $$

delimiter ;

ALTER event processa_comissao_event disable;