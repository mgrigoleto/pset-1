/* QUESTÃO 01 */
SELECT numero_departamento AS Número_do_Departamento, CAST(AVG(salario) AS DECIMAL(10,2)) AS Média_salarial FROM funcionarios GROUP BY numero_departamento;

/* QUESTÃO 02 */
SELECT sexo AS Sexo, CAST(AVG(salario) AS DECIMAL(10,2)) AS Média_salarial FROM funcionarios GROUP BY Sexo;

/* QUESTÃO 03 */
/* Floor aproxima o resultado da data atual MENOS a data de nascimento. Como o resultado será em dias, basta dividir por 365.25,
que é a quantidade de dias que tem em um ano. */
SELECT nome_departamento AS Departamento, primeiro_nome AS Nome, nome_meio AS Nome_do_meio, ultimo_nome AS Sobrenome, 
data_nascimento AS Data_de_nascimento, 
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Salário 
FROM funcionarios f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
ORDER BY nome_departamento;

/* QUESTÃO 04 */
SELECT primeiro_nome AS Nome, nome_meio AS Nome_do_meio, ultimo_nome AS Sobrenome, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Salário, salario*0.2 AS Novo salário
WHERE salario < '35000'
UNION

