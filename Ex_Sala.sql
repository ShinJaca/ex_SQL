-- Greek Letters π = 03c0, σ = 03c3


-- ex 1
-- SQL
SELECT *
  FROM Curso;

-- algebra
π CodCurso, Nome, CargaHoraria (Curso);


-- ex 2
-- SQL

-- ex 2.1
SELECT Nome
    FROM Funcionario
    WHERE CodDepart = 3;

-- algebra
π Nome (σ CodDepart = 3 (Funcionario))

-- ex 2.2
-- SQL
SELECT Funcionario.Nome
    FROM Funcionario
    JOIN Departamento
    USING (CodDepart)
    WHERE Departamento.Nome = 'Exatas';
-- algebra
π Funcionario.Nome (
    σ Departamento.Nome = 'Exatas' (
        Funcionario |x| 
        Funcionario.CodDepart=Departamento.CodDepart
        Departamento
    )
)

-- ex 3
SELECT COUNT(CodCurso) , CodDepart
FROM Vinculo
GROUP BY CodDepart;

-- ex 4
SELECT COUNT(Vinculo.CodCurso), Vinculo.CodDepart, Departamento.Nome
FROM Vinculo
JOIN Departamento USING(CodDepart)
GROUP BY Vinculo.CodDepart
ORDER BY Departamento.nome;