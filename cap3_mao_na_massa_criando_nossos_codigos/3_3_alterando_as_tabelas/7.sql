ALTER TABLE
    comclien
ADD
    COLUMN c_cidaclien VARCHAR(50);

ALTER TABLE
    comclien
ADD
    COLUMN c_estclien VARCHAR(50);

-- c_estclien está fora do padrão, considerando que só possui 3 (est). Portanto, é necessário deletar a coluna e refazê-la
ALTER TABLE
    comclien DROP COLUMN c_estaclien;

ALTER TABLE
    comclien
ADD
    COLUMN c_estaclien VARCHAR(50);

-- ALTER TABLE
--     comclien
-- MODIFY
--     COLUMN c_estaclien INT;
-- ALTER TABLE
--     comclien
-- MODIFY
--     COLUMN c_estaclien VARCHAR(100);