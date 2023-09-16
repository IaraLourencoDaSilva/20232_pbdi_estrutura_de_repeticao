--IF/EXIT
DO $$
DECLARE 
	contador INT := 1;
BEGIN 
	LOOP
		RAISE NOTICE 'Contador: %', contador;
		contador := contador + 1;
		IF contador > 10 THEN
			EXIT
		END IF;
	END LOOP;
END;
$$


-- DO $$
-- BEGIN 
-- 	LOOP
-- 		RAISE NOTICE 'teste loop simples'
-- 	END LOOP;
-- END;
-- $$



-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;