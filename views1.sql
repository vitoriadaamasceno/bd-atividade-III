-- Views
 -- 1. Crie uma view chamada "vw_funcionarios_departamento" que mostre o nome e cargo de todos os funcionários do departamento "Administrativo".
create database empresa;
use empresa;
 Create table Funcionarios(
	ID int primary key auto_increment,
	Nome varchar(255),
    Departamento varchar(100)
 );
 -- Inserir
insert into Funcionarios(Nome,Departamento)
 Values("Maria","Administrativo");
 
insert into Funcionarios(Nome,Departamento)
 Values("Pontes", "Engenharia");
 
insert into Funcionarios(Nome,Departamento)
 Values("Macita", "Administrativo");
 
CREATE VIEW vw_funcionarios_departamento AS
SELECT Nome, Departamento
FROM Funcionarios
WHERE Departamento = 'Administrativo';
 
SELECT * FROM vw_funcionarios_departamento;
