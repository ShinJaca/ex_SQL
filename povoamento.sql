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