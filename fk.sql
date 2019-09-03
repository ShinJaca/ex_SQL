
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
