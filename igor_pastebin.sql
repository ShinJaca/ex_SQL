CREATE DATABASE av_bd;

USE av_bd;
 
-- tabela de departamento
CREATE TABLE departamento (
    cod_departamento INT NOT NULL,
    descricao VARCHAR(30) NOT NULL,

    PRIMARY KEY `pk_cod_departamento`(`cod_departamento`),
);
 
ALTER TABLE departamento ADD PRIMARY KEY AUTO_INCREMENT (cod_departamento);
 
-- tabela de funcionário
CREATE TABLE funcionario (
    cod_funcionario INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cod_departamento INT NOT NULL,

    PRIMARY KEY `pk_cod_funcionario`(`cod_funcionario`)
);
 
 
ALTER TABLE funcionario
ADD CONSTRAINT fk_func_depart
FOREIGN KEY (cod_departamento)
REFERENCES departamento(cod_departamento);


ALTER TABLE `funcionario` ADD COLUMN `sexo` ENUM('F', 'f', 'M', 'm');

 
-- tabela de tipo de equipamento
CREATE TABLE tipo_equipamento (
    cod_tipo_equipamento INT NOT NULL,
    descricao VARCHAR(30),

    PRIMARY KEY `pk_cod_tipo_equipamento`(`cod_tipo_equipamento`)
);


-- tabela de equipament
CREATE TABLE equipamento (
    etiqueta VARCHAR(8) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    data_aquisicao DATE NOT NULL,
    cod_tipo_equipamento INT,
    cod_departamento INT,

    PRIMARY KEY (etiqueta)
);
 
 
ALTER TABLE equipamento
ADD CONSTRAINT fk_equip_tipo_equip
FOREIGN KEY (cod_tipo_equipamento)
REFERENCES tipo_equipamento(cod_tipo_equipamento);
 
ALTER TABLE equipamento
ADD CONSTRAINT fk_equip_depart
FOREIGN KEY (cod_departamento)
REFERENCES departamento(cod_departamento);
 
-- tabela de avaria
CREATE TABLE avaria (
    cod_avaria INT NOT NULL,
    descricao VARCHAR(30),
    data DATE NOT NULL,
    etiqueta VARCHAR(8) NOT NULL,
    cod_funcionario INT

    PRIMARY KEY `pk_cod_avaria`(`cod_avaria`)
);
 
 
ALTER TABLE avaria
ADD CONSTRAINT fk_avaria_etiqueta
FOREIGN KEY (etiqueta)
REFERENCES equipamento(etiqueta);
 
ALTER TABLE avaria
ADD CONSTRAINT fk_avaria_func
FOREIGN KEY (cod_funcionario)
REFERENCES funcionario(cod_funcionario);
 
-- tabela de Intervenção
CREATE TABLE intervencao (
    cod_intervencao INT NOT NULL,
    descricao VARCHAR(30),
    data DATE NOT NULL,
    cod_avaria VARCHAR(8) NOT NULL,
    cod_funcionario INT,

    PRIMARY KEY `pk_cod_intervencao`(`cod_intervencao`)
);
 
 
ALTER TABLE intervencao
ADD CONSTRAINT fk_interv_avaria
FOREIGN KEY (cod_avaria)
REFERENCES avaria(cod_avaria);
 
ALTER TABLE intervencao
ADD CONSTRAINT fk_interv_func
FOREIGN KEY (cod_funcionario)
REFERENCES funcionario(cod_funcionario);