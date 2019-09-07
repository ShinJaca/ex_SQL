-- PARTE 2 DO EXERCICIO DE BANCO DE DADOS

-- QUESTÃO 1
SELECT Departamento.Descricao,COUNT(*)
  FROM `Departamento`
  JOIN `Funcionario` USING (CodDepartamento)
  GROUP BY Departamento.Descricao
  ;

-- QUESTÃO 2

ALTER TABLE `Funcionario` 
    ADD COLUMN `salario` DOUBLE;

-- QUESTÃO 3

SELECT
    MAX(Funcionario.salario) AS `Max_Salario`,
    MIN(Funcionario.salario) AS `Min_Salario`,
    SUM(Funcionario.salario) AS `Soma_Salario`,
    AVG(Funcionario.salario) AS `Media`
  FROM `Funcionario`
  ;

-- QUESTÃO 4

INSERT INTO `Avaria`(`Descricao`, `Data`, `Etiqueta`, `CodFuncionario` ) VALUES
('Molhou a placa de vídeo', '2019-09-06', 'PC001CTB', 5),
('Sem cartucho', '2019-05-02', 'IMP001INF', 2),
('Queimou a tela', '2019-07-12', 'PC002CTB', 9),
('Queimou o teclado', '2019-07-20', 'PC001INF', 2)
;

-- QUESTÃO 5

SELECT
    Funcionario.Nome AS Nome, COUNT(*)
  FROM `Funcionario` 
  INNER JOIN `Avaria` USING(CodFuncionario)
  GROUP BY Funcionario.CodFuncionario
;

-- QUESTÃO 6

-- SQL
SELECT
    `I`.`Descricao` AS `Intervencao`, `F`.`Nome`, `A`.`Descricao`, `A`.`Data`
  FROM `Intervencao` AS `I`
  JOIN `Funcionario` AS `F` USING (CodFuncionario)
  JOIN `Avaria` AS `A` USING (CodAvaria);

-- Algebra
-- π Intervencao.Descricao, Funcionario.Nome, Avaria.Descricao, Avaria.Data (
--     Funcionario |x| Intervencao.CodFuncionario = Funcionario.CodFuncionario
--     (Intervencao |x| Intervencao.CodAvaria = Avaria.CodAvaria
--     Avaria)
-- )

-- QUESTÃO 7

SELECT YEAR(Intervencao.Data) AS Ano
  FROM Intervencao
;

-- QUESTÃO 8

  -- QUESTÃO 8.1

    SELECT YEAR(Equipamento.dataAquisicao) AS `Data_Aquisicao`,COUNT(*) AS `Quantidade`
      FROM Equipamento
      GROUP BY(`Data_Aquisicao`);

  -- QUESTÃO 8.2

    SELECT Equipamento.Descricao AS `Descricao`,COUNT(*) AS `Quantidade`
      FROM Equipamento
      GROUP BY(`Descricao`);

  -- QUESTÃO 8.3

    SELECT YEAR(dataAquisicao) AS Ano,COUNT(*) AS `Quantidade`,TipoEquipamento.Descricao
      FROM Equipamento
      JOIN TipoEquipamento ON (
        TipoEquipamento.CodTipoEquipamento = Equipamento.CodTipoEquipamento
      )
      GROUP BY Ano,TipoEquipamento.Descricao
      ;



-- QUESTÃO 9

SELECT Funcionario.Nome AS Nome
  FROM Funcionario
    WHERE(
      (SELECT MAX(salario) FROM Funcionario)=Funcionario.salario
    )
;


-- QUESTÃO 10
SELECT * FROM Avaria 
  JOIN Equipamento USING(Etiqueta)
  WHERE (CodTipoEquipamento ) IN (
    SELECT TipoEquipamento.CodTipoEquipamento FROM TipoEquipamento 
    WHERE Descricao = "Computador"
  );

-- QUESTÃO 11

SELECT * FROM Funcionario
  WHERE NOT EXISTS (
    SELECT * FROM Intervencao 
      WHERE (Funcionario.CodFuncionario = Intervencao.CodFuncionario)
  );

-- QUESTÃO 12

-- SQL
SELECT * FROM Avaria
  WHERE EXISTS (
    SELECT * FROM Intervencao
    WHERE (Avaria.CodAvaria = Intervencao.CodAvaria)
  );
SELECT * FROM Avaria 
  WHERE (CodAvaria) IN (
    SELECT CodAvaria FROM Intervencao
  );
SELECT Avaria.* FROM Avaria 
  JOIN Intervencao ON(
    Avaria.CodAvaria = Intervencao.CodAvaria
  )
  GROUP BY(CodAvaria)
;

-- Algebra
-- π Intervencao.CodIntervencao, Intervencao.Descricao,
-- Intervencao.Data, Intervencao.CodFuncionario,
-- Avaria.CodAvaria, Avaria.Descricao,
-- Avaria.Data, (
--  Avaria |x| 
--    Avaria.CodAvaria = Intervencao.CodAvaria
--  Intervencao
-- )
  
-- QUESTÃO 13

SELECT SUM(salario),Departamento.Descricao FROM Funcionario
  JOIN Departamento USING(CodDepartamento)
  GROUP BY(Departamento.Descricao);

-- QUESTÃO 14

SELECT AVG(salario) AS media,Departamento.Descricao FROM Funcionario
  JOIN Departamento USING(CodDepartamento)
  GROUP BY(Departamento.Descricao)
  ORDER BY(media) DESC;

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

-- SQL
SELECT
    `F`.`Nome`, `D`.`Descricao`
  FROM `Funcionario` AS `F`
  INNER JOIN `Departamento` AS `D` USING(`CodDepartamento`)

-- Algebra
-- π Funcionario.Nome, Departamento.Descricao (
--     Funcionario |x| 
--         Funcionario.CodDepartamento = Departamento.CodDepartamento
--     Departamento
-- )

