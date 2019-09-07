-- QUESTÂO 15

SELECT Func.Nome
FROM Funcionario AS Func
WHERE Func.salario > (
    SELECT MAX(Funcionario.salario)
    FROM Funcionario
    JOIN Departamento USING (CodDepartamento)
    WHERE Departamento.Descricao = 'Informática'
);

-- QUESTÃO 16


SELECT
    `D`.*, `F`.*
  FROM `Departamento` AS `D`
  CROSS JOIN `Funcionario` AS `F`;

-- QUESTÃO 17

SELECT
    `D`.*, `F`.*
  FROM `Departamento` AS `D`
  CROSS JOIN `Funcionario` AS `F`;
  ON (F.CodDepartamento = D.CodDepartamento)

-- QUESTÂO 18

INSERT INTO `Funcionario`(`Nome`, `Sexo`, `salario`) VALUES
('João Torrão', 2, 1500.0)
;

DELETE FROM Funcionario
WHERE CodDepartamento = 104

SELECT *
FROM Funcionario
LEFT JOIN Departamento USING (CodDepartamento);

SELECT *
FROM Funcionario
RIGHT JOIN Departamento USING (CodDepartamento);


-- QUESTÃO 19

SELECT
    `F`.`Nome`, `D`.`Descricao`
  FROM `Funcionario` AS `F`
  INNER JOIN `Departamento` AS `D` USING(`CodDepartamento`)

-- π Funcionario.Nome, Departamento.Descricao (
--     Funcionario |x| 
--         Funcionario.CodDepartamento = Departamento.CodDepartamento
--     Departamento
-- )

-- QUESTÃO 6

SELECT
    `I`.`Descricao` AS `Intervencao`, `F`.`Nome`, `A`.`Descricao`, `A`.`Data`
  FROM `Intervencao` AS `I`
  JOIN `Funcionario` AS `F` USING (CodFuncionario)
  JOIN `Avaria` AS `A` USING (CodAvaria);

-- π Intervencao.Descricao, Funcionario.Nome, Avaria.Descricao, Avaria.Data (
--     Funcionario |x| Intervencao.CodFuncionario = Funcionario.CodFuncionario
--     (Intervencao |x| Intervencao.CodAvaria = Avaria.CodAvaria
--     Avaria)
-- )