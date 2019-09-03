-- Definição DDL

-- ex 3 
ALTER TABLE `Funcionario` MODIFY `Nome` VARCHAR(255) NOT NULL;

-- ex 4
ALTER TABLE `Avaria`
DROP FOREIGN KEY `fk_Avaria_Equipamento`;

ALTER TABLE `Avaria`
ADD CONSTRAINT `fk_Avaria_Equipamento`
  FOREIGN KEY (`Etiqueta`)
  REFERENCES `Equipamento` (`Etiqueta`);

-- ex 5, 6
-- Adicionar um ENUM com valores F ou f mapeam para a mesma posição
ALTER TABLE `Funcionario` ADD COLUMN `Sexo` ENUM('F', 'M');

-- ex 7
DROP TABLE `Departamento` RESTRICT;

-- ex 9
CREATE TABLE `Funcionario_S` AS
SELECT *
FROM `Funcionario`
;
CREATE TABLE `Avaria_S` AS
SELECT *
FROM `Avaria`
;
CREATE TABLE `Departamento_S` AS
SELECT *
FROM `Departamento`
;
CREATE TABLE `Equipamento_S` AS
SELECT *
FROM `Equipamento`
;
CREATE TABLE `Intervencao_S` AS
SELECT *
FROM `Intervencao`
;
CREATE TABLE `TipoEquipamento_S` AS
SELECT *
FROM `TipoEquipamento`
;

-- ex 10
DELETE FROM `Funcionario`;

-- ex 11 
DELETE FROM `Equipamento` WHERE `CodDepartamento` = (
      SELECT
        `CodDepartamento`
      FROM `Departamento`
      WHERE `Descricao` = 'Informática'
  );

-- ex 12
UPDATE `Equipamento` SET
  `Marca` = 'Samsung';

-- ex 13 
UPDATE `Funcionario` SET
  `CodDepartamento` = 101
WHERE `Nome` LIKE 'Ricardo%';

-- ex 14
UPDATE `Funcionario` SET
  `CodDepartamento` = (
      SELECT
        `CodDepartamento`
      FROM `Departamento`
      WHERE `Descricao` = 'Informática'
  )
WHERE `Nome` LIKE 'Ricardo%';

-- ex 15

SELECT *
  FROM Funcionario;

-- ex 16
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

-- ex 17
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

-- ex 18
-- SQL

SELECT `Funcionario`.*
FROM `Avaria`
JOIN `Funcionario` USING (`CodFuncionario`);

-- Algebra
-- π Funcionario.* (
--   Avaria |x| Avaria.CodFuncionario = Funcionario.CodFuncionario
--   Funcionario
-- )