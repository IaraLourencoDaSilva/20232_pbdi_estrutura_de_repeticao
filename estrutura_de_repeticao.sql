--Exercio
--1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.

--terceira link
CREATE OR REPLACE FUNCTION sum_of_odds_between(X INT, Y INT) RETURNS INT AS 
DO $$
DECLARE
    sum_of_odds INT := 0;
    i INT;
BEGIN
    FOR i IN 1..6 LOOP
        -- Generate a random number between X and Y
        DECLARE
            random_num INT := valor_aleatorio_entre(1, 100);
        BEGIN
            RAISE NOTICE 'Generated number: %', random_num;
            IF random_num % 2 <> 0 THEN
                sum_of_odds := sum_of_odds + random_num;
            END IF;
        END;
    END LOOP;
END;
$$ LANGUAGE plpgsql;


--segunda link 
-- CREATE OR REPLACE FUNCTION count_positive_numbers() RETURNS VOID AS 

-- DO $$
-- DECLARE
--     num_count INT := 0;
--     i INT := 1;
--     input_number NUMERIC;
-- BEGIN
--     WHILE i <= 6 LOOP
--         -- Read the input number
--         input_number := valor_aleatorio_entre(-10, 10); -- Replace with your method of reading input

--         RAISE NOTICE 'Input number: %', input_number;

--         -- Check if the number is positive
--         IF input_number > 0 THEN
--             num_count := num_count + 1;
--         END IF;

--         i := i + 1;
--     END LOOP;

--     RAISE NOTICE 'Total positive numbers: %', num_count;
-- END;
-- $$ LANGUAGE plpgsql;


--primeiro link 
-- DO $$
-- DECLARE
--     num INT;
-- BEGIN
--     FOR i IN 1..100 LOOP
--         num := valor_aleatorio_entre(1, 100);
--         IF num % 2 = 0 THEN
--             RAISE NOTICE '%', num;
--         END IF;
--     END LOOP;
-- END;
-- $$ 



--Exemplo de tratar erro 
-- DO $$
-- DECLARE 
-- 	a INT := valor_aleatorio_entre(0,5);
-- BEGIN
-- 	IF a = 0 THEN
-- 		RAISE 'a não pode ser zero';
-- 		RAISE NOTICE 'Vejamos se chega aqui...';
-- 	ELSE
-- 		RAISE NOTICE 'Valor de a: %', a;
-- 	END IF;
-- EXCEPTION WHEN OTHERS THEN
-- 	--SQLState é o código da exceção
-- 	--SQLERRM é a mensagem (SQL Error Message)
-- 	RAISE NOTICE 'SQLState: %, SQLERRM: %', SQLSTATE, SQLERRM;
-- END;
-- $$

-- --Tratar um erro 
-- DO $$
-- BEGIN 
-- 	RAISE NOTICE '%', 1/0;
-- EXCEPTION
-- 	WHEN division_by_zero THEN 
-- 		RAISE NOTICE 'Não é possível fazer divisão por zero';
-- END;
-- $$


-- -- FOREACH usando slices (fatias)
-- DO $$
-- DECLARE
-- 	vetor INT[] := ARRAY[1,2,3];
-- 	matriz INT[] := ARRAY[
-- 		[1,2,3],
-- 		[4,5,6],
-- 		[7,8,9]
-- 	];
-- 	var_aux INT;
-- 	vet_aux INT[];
-- BEGIN 
-- 	RAISE NOTICE 'slide igual a 0';
-- 	FOREACH var_aux IN ARRAY vetor LOOP
-- 		RAISE NOTICE '%', var_aux;
-- 	END LOOP;
-- 	RAISE NOTICE '-------------------------';
-- 	RAISE NOTICE 'Slice igual a 1 sobre vetor';
-- 	FOREACH vet_aux SLICE 1 IN ARRAY vetor LOOP
-- 		RAISE NOTICE '%', vet_aux;
-- 		FOREACH var_aux IN ARRAY vet_aux LOOP
-- 			RAISE NOTICE '%', var_aux; 
-- 		END LOOP;
-- 	END LOOP;
-- 	RAISE NOTICE '-------------------------';
-- 	RAISE NOTICE 'matriz, slice 0';
-- 	FOREACH var_aux IN ARRAY matriz LOOP 
-- 		RAISE NOTICE '%', var_aux;
-- 	END LOOP;
-- 	RAISE NOTICE 'matriz, slice 1';
-- 	FOREACH vet_aux SLICE 1 IN ARRAY matriz LOOP
-- 		RAISE NOTICE '%', vet_aux;
-- 	END LOOP;
-- 	RAISE NOTICE 'matriz, slice 2';
-- 	FOREACH vet_aux SLICE 2 IN ARRAY matriz LOOP
-- 		RAISE NOTICE '%', vet_aux;
-- 	END LOOP;
-- END;
-- $$


-- -- foreach, iterando sobre os elementos de um array
-- DO 
-- $$
-- DECLARE 
-- 	valores INT[] := ARRAY[
-- 		valor_aleatorio_entre(1,10),
-- 		valor_aleatorio_entre(1,10),
-- 		valor_aleatorio_entre(1,10),
-- 		valor_aleatorio_entre(1,10),
-- 		valor_aleatorio_entre(1,10)
-- 	];
-- 	valor INT;
-- 	soma INT := 0;
-- BEGIN 
-- 	FOREACH valor IN ARRAY valores LOOP
-- 		RAISE NOTICE 'Valor da vez: %', valor;
-- 		soma := soma + valor;
-- 	END LOOP;
-- 	RAISE NOTICE 'Soma: %', soma;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	--RECORD: tipo para representar uma linha de uma linha 
-- 	aluno RECORD ;
-- 	media NUMERIC(10, 2) := 0;
-- 	total INT;
-- BEGIN
-- 	FOR aluno IM
-- 		SELECT * FROM tb_aluno 	
-- 	LOOP
-- 		--. é o operador de acesso a membro
-- 		RAISE NOTICE 'Nota : %',aluno.cod_aluno, aluno.nota;
-- 	END LOOP;
-- END;
-- $$


-- SELECT * FROM tb_aluno

-- DO $$
-- BEGIN 
-- 	--GErando notas 
-- 	FOR i IN 1..100 LOOP
-- 	INSERT INTO tb_aluno (nota) values (valor_aleatorio_entre(0,10);
-- 	END LOOP;
-- END;
-- $$

-- CREATE TABLE tb_aluno(
-- 	cod_aluno SERIAL PRIMARY KEY,
-- 	nota INT	
-- );

-- DO $$
-- BEGIN 
-- 	FOR i IN 1..10 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
	
-- 	FOR i IN 10..1 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
	
-- 	FOR i IN REVERSE 10..1 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
	
-- 	FOR i IN 1..50 BY 2 LOOP
-- 		RAISE NOTICE '%', i;
-- 	END LOOP;
-- END;
-- $$



-- DO $$
-- DECLARE
-- 	nota INT;
-- 	media NUMERIC(10, 2) := 0;
-- 	contador INT := 0;
-- BEGIN
-- 	SELECT valor_aleatorio_entre(0, 11) -1 INTO nota;
-- 	WHILE nota >= 0 LOOP
-- 		RAISE NOTICE '%', nota;
-- 		media := media + nota; --acumulador 
-- 		contador := contador + 1;
-- 		SELECT valor_aleatorio_entre(0, 11) -1 INTO nota;
-- 	END LOOP;
-- 	IF contador > 0 THEN -- se tem pelo menos uma nota 
-- 		RAISE NOTICE 'MEdia: %', media/ contador;
-- 	ELSE 
-- 		RAISE NOTICE 'Nenhuma nota gerada';
-- 	END IF;
-- END;
-- $$

-- DO $$
-- DECLARE 
-- 	i INT;
-- 	j INT;
-- BEGIN
-- 	i := 0;
-- 	-- esse é um rotulo 
-- 	<<externo>>
-- 	LOOP 
-- 		i := i + 1;
-- 		EXIT WHEN i > 10;
-- 		j :=  1;
-- 		<<interno>>
-- 		LOOP 
-- 			RAISE NOTICE '%, %', i, j;
-- 			j := j + 1;
-- 			EXIT WHEN j > 10;
-- 			EXIT externo WHEN j > 5;
-- 		END LOOP;
-- 	END LOOP;
-- END;
-- $$
-- 1 6 Não 
--1 5 Sim
--1 4 Sim
-- 1 3 Sim
--1 2 Sim
-- 0 1 Não aparece 
-- 1 1 Sim aparece

--CONTINUE
-- DO $$
-- DECLARE
-- 	contador INT := 0;
-- BEGIN
-- 	LOOP
-- 		contador := contador + 1;
-- 		EXIT WHEN contador > 100;
-- 		-- ignorando as iterações em que multiplo de 7 
-- 		IF contador % 7 = 0 THEN 
-- 			CONTINUE;
-- 		END IF;
-- 		CONTINUE WHEN contador % 11 = 0; 
-- 		RAISE NOTICE '%', contador;
-- 	END LOOP;
-- END;
-- $$


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