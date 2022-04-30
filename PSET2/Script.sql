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
salario AS Salário, CAST((salario*1.2) AS DECIMAL(10,2)) AS Novo_salário FROM funcionarios
WHERE salario < '35000'
UNION
SELECT primeiro_nome AS Nome, nome_meio AS Nome_do_meio, ultimo_nome AS Sobrenome, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Salário, CAST((salario*1.15) AS DECIMAL(10,2)) AS Novo_salário FROM funcionarios
WHERE salario >= '35000';

/* QUESTÃO 05 */
SELECT nome_departamento AS Departamento, g.primeiro_nome AS Gerente, f.primeiro_nome AS Funcionário, salario AS Salários
FROM departamento d INNER JOIN funcionarios f, 
(SELECT primeiro_nome, cpf FROM funcionarios f INNER JOIN departamento d WHERE f.cpf = d.cpf_gerente) AS g
WHERE d.numero_departamento = f.numero_departamento AND g.cpf = d.cpf_gerente
ORDER BY d.nome_departamento ASC, f.salario DESC;

/* QUESTÃO 06 */
SELECT f.primeiro_nome AS Nome, f.nome_meio AS Nome_meio, f.ultimo_nome AS Sobrenome, dto.nome_departamento AS Departamento,
dpd.nome_dependente AS Dependente, FLOOR(DATEDIFF(CURDATE(), dpd.data_nascimento)/365.25) AS Idade_dependente,
CASE WHEN dpd.sexo = 'M' THEN 'Masculino' WHEN dpd.sexo = 'm' THEN 'Masculino'
WHEN dpd.sexo = 'F' THEN 'Feminino' WHEN dpd.sexo = 'f' THEN 'Feminino' END AS Sexo_dependente
FROM funcionarios f 
INNER JOIN departamento dto ON f.numero_departamento = dto.numero_departamento
INNER JOIN dependente dpd ON dpd.cpf_funcionario = f.cpf;

/* QUESTÃO 07 */
SELECT DISTINCT f.primeiro_nome AS Nome, f.nome_meio AS Nome_meio, f.ultimo_nome AS Sobrenome, dto.nome_departamento AS Departamento,
f.salario AS Salário FROM funcionarios f
INNER JOIN departamento dto
INNER JOIN dependente dpd
WHERE dto.numero_departamento = f.numero_departamento AND
f.cpf NOT IN (SELECT dpd.cpf_funcionario FROM dependente dpd);
