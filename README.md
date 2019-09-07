# Exercícios Banco de Dados

Exercícios propostos na diciplina de Banco de Dados 2019.1 UEFS.
Os exercícios cobrem diversos aspectos de linguagem SQL (Search Query Language) e Algebra Relacional.
___

## Parte 1
### Data Definition Language

Exercícios de definição de dados e de banco

1. ~~Crie todas as tabelas com as respectivas chaves primárias;~~
2. ~~Adicione as chaves estrangeiras (ALTER TABLE);~~
3. ~~Altere a tabela Funcionário colocando a característica NOT NULL no atributo nome;~~
4. ~~Apague a CONSTRAINT foreign Key da tabela Avaria. Em seguida, adicione;~~
5. ~~Crie um domínio DOMSEXO que receba somente os valores ‘F’, ‘f’, ‘m’, ‘M’ para os sexos;~~
6. ~~Em seguida, adicione o atributo SEXO na tabela Funcionário, pertencente ao domínio criado anteriormente;~~
7. ~~Tente apagar a tabela Departamento com a opção RESTRICT (lembre-se de relacionar Empregado a algum departamento antes de tentar apagar).~~

### Data Manipulation Language

Exercícios de manipulação de dados

 8. ~~Insira dados em todas as tabelas utilizando o Insert (insira pelo menos 5 tuplas em cada uma);~~
 9. ~~Antes de fazer as manipulações abaixo, crie cópias das tabelas utilizando o Create juntamente com o Select;~~
10. ~~Apague todos os funcionários;~~
11. ~~Apague todos os equipamentos que pertencem ao Departamento ‘Informática’;~~
12. ~~Atualize todos os equipamentos para a marca ‘Samsung’;~~
13. ~~Todas as pessoas com nomes começados em ‘Ricardo’ devem pertencer ao departamento 101;~~
14. ~~Todas as pessoas com nomes começados em ‘Ricardo’ devem pertencer ao departamento ‘Informática’;~~
15. ~~Selecione todos os funcionários;~~
16. ~~Selecione todos os funcionários do departamento ‘Comercial’ (Álgebra);~~
17. ~~Selecione todos os equipamentos da categoria ‘Computador’ (Álgebra);~~
18. ~~Selecione o nome de todos os funcionários responsáveis pelo cadastro das avarias (Álgebra);~~

## Parte 2

1. ~~Mostre a quantidade de funcionários por departamento, exibindo o nome do departamento e, ao lado, a quantidade.~~
2. ~~Adicione o atributo salário (real) na tabela funcionário.~~
3. ~~Mostre, em um mesmo select, o maior salário, o menor, a soma e a média salarial.~~
4. ~~Acrescente mais 4 avarias (tuplas).~~
5. ~~Mostre o nome de cada funcionário, seguido da quantidade de avarias.~~
6. ~~Mostre as intervenções, seguidas dos nomes dos funcionários, descrição e data das avarias (Álgebra).(JACA)~~
7. ~~Pesquise uma função de data que isola o ano de uma data.~~
8. Usando agrupamento, faça:
+ Usando a função de data pesquisada acima, mostre, por ano, a quantidade de equipamentos adquiridos.
+ Mostre, pela descrição do tipo de equipamento, a quantidade de equipamentos.
+ Mostre, por ano e pela descrição do tipo de equipamento (juntando os dois comandos anteriores), a quantidade de equipamentos adquiridos.
9. ~~Selecione o nome dos funcionários que recebem igual ao maior salário.~~
10. ~~Usando o IN, faça a seleção das avarias acontecidas nos equipamentos do tipo "Computador".~~
11. ~~Mostre os funcionários que não estão relacionados a Intervenções (usando EXISTS)~~
12. ~~Mostre as avarias que possuíram intervenções (primeiro usando EXISTS, depois usando IN e terceiro, usando JOIN) (Álgebra com Junção).~~
13. ~~Mostre a soma dos salários, agrupando por descrição de departamento.~~
14. ~~Mostre a média salarial de cada departamento por ordem decrescente.~~
15. ~~Mostre os nomes dos empregados que recebem salario maior que todos os salários do departamento Informática.~~
16. ~~Faça um cross join entre Departamento e Funcionário.~~
17. ~~Faça um cross joint entre Departamento e Funcionário, fazendo a equivalência entre as chaves (primária e estrangeira).~~
18. ~~Cadastre algum funcionário sem departamento. Em seguida, exclua os funcionários do departamento 104 e faça um outer Join (left e right) entre departamento e funcionário.~~
19. ~~Traga o nome do funcionário e o nome do departamento a que pertence, usando o inner join (Álgebra).~~

 Ex | Status
--- | ---
  1 | OK
  2 | OK
  3 | OK
  4 | OK
  5 | OK
  6 | OK
  7 | OK
  8 | undefined
  9 | OK
 10 | OK
 11 | OK
 12 | OK
 13 | OK
 14 | OK
 15 | OK
 16 | OK
 17 | OK
 18 | OK
 19 | OK
