-- ATIVIDADE BANCO DE DADOS
-- QUESTÃO 1

/* -- CREATE DATABASE `av_db`; */
USE `atividade`;
/*FIXME consertar para av_db*/

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

