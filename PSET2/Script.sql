/* QUESTÃO 01 */
SELECT numero_departamento as Número_do_Departamento, CAST(AVG(salario) AS DECIMAL(10,2)) AS Média_salarial FROM funcionarios GROUP BY numero_departamento;

