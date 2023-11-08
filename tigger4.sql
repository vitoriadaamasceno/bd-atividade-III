-- Tigger4
-- 4. Crie um trigger que seja acionado após a exclusão de um registro em uma tabela "tb_funcionarios" e insira os dados excluídos em outra tabela "tb_funcionarios_demitidos" de registro de exclusões.
create database empresas;
use empresas;
create table tb_funcionarios(
ID INT PRIMARY KEY auto_increment,
Nome varchar(255),
Salario decimal(10.2)
);

insert into tb_funcionarios(Nome,Salario)
values("Maria",2000);

insert into tb_funcionarios(Nome,Salario)
values("Malhado",200);
-- Criando a outra
create table tb_funcionarios_demitidos(
ID INT PRIMARY KEY auto_increment,
Nome varchar(255),
Salario decimal(10.2)
);

DELIMITER //
CREATE TRIGGER deletar_funcionario
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (ID, Nome, Salario)
    VALUES (OLD.ID, OLD.Nome, OLD.Salario);
END;
//
DELIMITER ;

delete from tb_funcionarios where ID = 2;

select * from tb_funcionarios;

select * from tb_funcionarios_demitidos;

