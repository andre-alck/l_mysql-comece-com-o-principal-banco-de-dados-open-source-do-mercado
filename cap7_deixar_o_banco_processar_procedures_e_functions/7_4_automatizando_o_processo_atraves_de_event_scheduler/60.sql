delimiter $$

CREATE event processa_comissao ON schedule every 1 week starts '2015-03-01 23:38:00' DO BEGIN call processa_comissionamento(
    current_date() - INTERVAL 7 DAY,
    current_date(),
    @a
);

END

$$

delimiter ;

ALTER event processa_comissao disable;