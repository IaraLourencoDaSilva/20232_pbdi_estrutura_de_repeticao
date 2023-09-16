--CONTINUE
DO $$
DECLARE
	contador INT := 0;
BEGIN
	LOOP
		contador := contador + 1;
		EXIT WHEN contador > 100;
		-- ignorando as iterações em que multiplo de 7 
		IF contador % 7 = 0 THEN 
			CONTINUE;
		END IF;
		CONTINUE WHEN contador % 11 = 0; 
		RAISE NOTICE '%', contador;
	END LOOP;
END;
$$


-- --EXIT WHEN
-- DO $$
-- DECLARE 
-- 	contador INT := 1;
-- BEGIN 
-- 	LOOP
-- 		RAISE NOTICE 'Contador: %', contador;
-- 		contador := contador + 1;
-- 		EXIT WHEN contador > 10;
-- 	END LOOP;
-- END;
-- $$




-- --IF/EXIT
-- DO $$
-- DECLARE 
-- 	contador INT := 1;
-- BEGIN 
-- 	LOOP
-- 		RAISE NOTICE 'Contador: %', contador;
-- 		contador := contador + 1;
-- 		IF contador > 10 THEN
-- 			EXIT
-- 		END IF;
-- 	END LOOP;
-- END;
-- $$


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