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

-- QUESTÃO 7

SELECT YEAR(Intervencao.Data) As Ano
  FROM Intervencao
;

-- QUESTÃO 8
  -- QUESTÃO 8.1



  -- QUESTÃO 8.2


  -- QUESTÃO 8.3

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
  
-- QUESTÃO 13

SELECT SUM(salario),Departamento.Descricao FROM Funcionario
  JOIN Departamento USING(CodDepartamento)
  GROUP BY(Departamento.Descricao);

-- QUESTÃO 14

SELECT AVG(salario) AS media,Departamento.Descricao FROM Funcionario
  JOIN Departamento USING(CodDepartamento)
  GROUP BY(Departamento.Descricao)
  ORDER BY(media) DESC;