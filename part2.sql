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


-- QUESTÃO 7

SELECT YEAR(data_inc) As Ano;

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