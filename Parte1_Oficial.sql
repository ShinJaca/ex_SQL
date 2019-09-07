-- PARTE 1 DO EXERCICIO DE BANCO DE DADOS


-- QUESTÃO 1


CREATE DATABASE `av_db`;
USE `av_db`;

-- [TABLE] Departamento
CREATE TABLE IF NOT EXISTS `Departamento` (
  `CodDepartamento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(255),
  PRIMARY KEY `pk_CodDepartamento`(`CodDepartamento`)
  
) ENGINE = InnoDB;

-- [TABLE] Funcionário
CREATE TABLE IF NOT EXISTS `Funcionario` (
  `CodFuncionario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255),
  `CodDepartamento` INT UNSIGNED,
  
  PRIMARY KEY `pk_CodFuncionario`(`CodFuncionario`)
) ENGINE = InnoDB;

-- [TABLE] TipoEquipamento
CREATE TABLE IF NOT EXISTS `TipoEquipamento` (
  `CodTipoEquipamento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(255),

  PRIMARY KEY `pk_CodTipoEquipamento`(`CodTipoEquipamento`)
) ENGINE = InnoDB;

-- [TABLE] Equipamento
CREATE TABLE IF NOT EXISTS `Equipamento` (
  `Etiqueta` VARCHAR(50) NOT NULL,
  `Marca` VARCHAR(255),
  `Descricao` VARCHAR(255),
  `dataAquisicao` DATE,
  `CodTipoEquipamento` INT UNSIGNED,
  `CodDepartamento` INT UNSIGNED,
  PRIMARY KEY `pk_Etiqueta`(`Etiqueta`)
) ENGINE = InnoDB;

-- [TABLE] Avaria

CREATE TABLE IF NOT EXISTS `Avaria` (
  `CodAvaria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(255),
  `Data` DATE,
  `Etiqueta` VARCHAR (50),
  `CodFuncionario` INT UNSIGNED,
  PRIMARY KEY `pk_CodAvaria`(`CodAvaria`)
) ENGINE = InnoDB;

-- [TABLE] Interveção 
CREATE TABLE IF NOT EXISTS `Intervencao` (
  `CodIntervencao` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(255),
  `Data` DATE,
  `CodAvaria` INT UNSIGNED,
  `CodFuncionario` INT UNSIGNED,
  PRIMARY KEY `pk_CodIntervencao`(`CodIntervencao`)
) ENGINE = InnoDB;


-- QUESTÃO 2


-- [FOREIGN KEYS]

ALTER TABLE `Funcionario`
ADD CONSTRAINT `fk_Funcionario_Departamento`
  FOREIGN KEY (`CodDepartamento`)
  REFERENCES `Departamento` (`CodDepartamento`);

ALTER TABLE `Equipamento`
ADD CONSTRAINT `fk_Equipamento_TipoEquipamento`
  FOREIGN KEY (`CodTipoEquipamento`)
  REFERENCES `TipoEquipamento` (`CodTipoEquipamento`);

ALTER TABLE `Equipamento`
ADD CONSTRAINT `fk_Equipamento_Departamento`
  FOREIGN KEY (`CodDepartamento`)
  REFERENCES `Departamento` (`CodDepartamento`);

ALTER TABLE `Avaria`
ADD CONSTRAINT `fk_Avaria_Equipamento`
  FOREIGN KEY (`Etiqueta`)
  REFERENCES `Equipamento` (`Etiqueta`);

ALTER TABLE `Avaria`
ADD CONSTRAINT `fk_Avaria_Funcionario`
  FOREIGN KEY (`CodFuncionario`)
  REFERENCES `Funcionario` (`CodFuncionario`);

ALTER TABLE `Intervencao`
ADD CONSTRAINT `fk_Intervencao_Avaria`
  FOREIGN KEY (`CodAvaria`)
  REFERENCES `Avaria` (`CodAvaria`);

ALTER TABLE `Intervencao`
ADD CONSTRAINT `fk_Intervencao_Funcionario`
  FOREIGN KEY (`CodFuncionario`)
  REFERENCES `Funcionario` (`CodFuncionario`);


-- Definição DDL

-- QUESTÃO 3 

ALTER TABLE `Funcionario` MODIFY `Nome` VARCHAR(255) NOT NULL;

-- QUESTÃO 4

ALTER TABLE `Avaria`
DROP FOREIGN KEY `fk_Avaria_Equipamento`;

ALTER TABLE `Avaria`
ADD CONSTRAINT `fk_Avaria_Equipamento`
  FOREIGN KEY (`Etiqueta`)
  REFERENCES `Equipamento` (`Etiqueta`);

-- QUESTÃO 5, 6

-- Adicionar um ENUM com valores F ou f mapeam para a mesma posição
-- Basta colocar o M (maiúsculo) ou o F (maiúsculo), que o resultado sera o mesmo (Não é Case Sensitive)
ALTER TABLE `Funcionario` ADD COLUMN `Sexo` ENUM('F', 'M');

-- QUESTÃO 7

DROP TABLE `Departamento` RESTRICT;

-- Povoamento

-- QUESTÃO 8

INSERT INTO `Departamento`(`CodDepartamento`, `Descricao`) VALUES
(101, 'Contabilidade')
;

INSERT INTO `Departamento`(`Descricao`) VALUES
('Comercial'),
('Recursos Humanos'),
('Informática'),
('Financeiro')
;

-- No campo sexo, foi posto um número, porque o mySql não possui Domínio, logo, foi feito com ENUM.
INSERT INTO `Funcionario`(`Nome`, `CodDepartamento`,`Sexo`) VALUES
('Ana Souza', 101, 1),
('Paulo Mendes', 101, 2),
('Ricardo Freitas', 102, 2),
('Ricardo Alves', 102, 2),
('Catarina Rios', 102, 1),
('Leonor Santos', 103, 1),
('Alan Passos', 104, 2),
('José Maria', 104, 2),
('Jaca',105,2),
('Igor',105,2)
;

INSERT INTO `TipoEquipamento`(`Descricao`) VALUES
('Computador'),
('Impressora'),
('Fax'),
('Monitor'),
('Fotocopiadora')
;


INSERT INTO `Equipamento`(`Etiqueta`, `Marca`, `Descricao`, `dataAquisicao`, `CodTipoEquipamento`, `CodDepartamento`) VALUES
('PC001CTB','HP','Computador DualCore 200GB','2011-02-03',1,101),
('PC002CTB','HP','Computador DualCore 200GB','2012-02-19',1,101),
('PC001INF','HP','Computador DualCore 500GB','2012-12-19',1,104),
('PC002INF','HP','Computador DualCore 500GB','2012-03-20',1,104),
('IMP001INF','HP','Impressora HP Laserjet','2012-03-28',2,104)
;


INSERT INTO `Avaria`(`Descricao`, `Data`, `Etiqueta`, `CodFuncionario` ) VALUES
('O computador não dá partida', '2011-03-03', 'PC001CTB', 2),
('Trocar tonner', '2012-05-28', 'IMP001INF', 7),
('O computador está esquentando', '2012-05-29', 'PC002CTB', 6),
('O computador pegou fogo', '2012-05-29', 'PC002INF', 1),
('O computador está com o vídeo estrago', '2012-05-29', 'PC001INF', 10)
;

INSERT INTO `Intervencao`(`Descricao`, `Data`, `CodAvaria`, `CodFuncionario`) VALUES
('Trocada a placa mãe', '2011-03-05', 1, 8),
('Trocada a pasta termica', '2012-05-30', 3, 10),
('Trocado o cooler', '2012-05-30', 3, 6),
('Trocado o processador', '2011-03-05', 1, 8),
('Trocado a placa de vídeo', '2011-03-05', 1, 3)
;


-- QUESTÃO 9

CREATE TABLE `Funcionario_S` AS
SELECT *
FROM `Funcionario`;

CREATE TABLE `Avaria_S` AS
SELECT *
FROM `Avaria`;

CREATE TABLE `Departamento_S` AS
SELECT *
FROM `Departamento`;

CREATE TABLE `Equipamento_S` AS
SELECT *
FROM `Equipamento`;

CREATE TABLE `Intervencao_S` AS
SELECT *
FROM `Intervencao`;

CREATE TABLE `TipoEquipamento_S` AS
SELECT *
FROM `TipoEquipamento`;


-- QUESTÃO 10

DELETE FROM `Funcionario`;

-- QUESTÃO 11 

DELETE FROM `Equipamento` WHERE `CodDepartamento` = (
      SELECT
        `CodDepartamento`
      FROM `Departamento`
      WHERE `Descricao` = 'Informática'
  );

-- QUESTÃO 12

UPDATE `Equipamento` SET
  `Marca` = 'Samsung';

-- QUESTÃO 13 

UPDATE `Funcionario` SET
  `CodDepartamento` = 101
WHERE `Nome` LIKE 'Ricardo%';

-- QUESTÃO 14

UPDATE `Funcionario` SET
  `CodDepartamento` = (
      SELECT
        `CodDepartamento`
      FROM `Departamento`
      WHERE `Descricao` = 'Informática'
  )
WHERE `Nome` LIKE 'Ricardo%';

-- QUESTÃO 15
SELECT *
  FROM Funcionario;

-- QUESTÃO 16

-- SQL
SELECT
  `Funcionario`.*
FROM `Funcionario`
INNER JOIN `Departamento` AS `Dept` ON ( `Dept`.`CodDepartamento` = `Funcionario`.`CodDepartamento` )
WHERE `Dept`.`Descricao` = 'Comercial';

-- Algebra
-- π Funcionario.* (
--   σ Departamento.Descricao = 'Comercial'(
--     Departamento |x|
--       Departamento.CodDepartamento = Funcionario.CodDepartamento
--     Funcionario
--   )
-- )

-- QUESTÃO 17

-- SQL
SELECT `Equipamento`.*
FROM `Equipamento`
JOIN `TipoEquipamento` USING (`CodTipoEquipamento`)
WHERE `TipoEquipamento`.`Descricao` = 'Computador';

-- Algebra
-- π Equipamento.* (
--   σ TipoEquipamento.Descricao = 'Computador'(
--     Equipamento |x| Equipamento.CodTipoEquipamento = TipoEquipamento.CodTipoEquipamento
--     TipoEquipamento
--   )
-- )

-- QUESTÃO 18

-- SQL
SELECT `Funcionario`.`Nome`
FROM `Avaria`
JOIN `Funcionario` USING (`CodFuncionario`);

-- Algebra
-- π Funcionario.* (
--   Avaria |x| Avaria.CodFuncionario = Funcionario.CodFuncionario
--   Funcionario
-- )

