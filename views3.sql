-- 3. Crie uma view chamada "vw_relacionamento_cliente_vendedor" que mostre o relacionamento entre um cliente e o vendedor que o atendeu.
create database atendimento;
use atendimento;

CREATE TABLE Vendedor(
	Id int primary key auto_increment,
	Nome varchar(255) not null
);

CREATE TABLE Clientes(
	Id int primary key auto_increment,
	Nome varchar(255) not null,
	DataNascimento date not null,
	Telefone varchar(22) not null,
	IDVendedor int,
	foreign key (IDVendedor) references Vendedor(Id)
);
-- Inserir
insert into Vendedor(Nome)
Values("Felipe");

insert into Vendedor(Nome)
Values("Sofia");

insert into Vendedor(Nome)
Values("Mateus");

insert into Clientes(Nome, DataNascimento, Telefone, IDVendedor)
Values("Isabela", "1995-09-21", "(11) 98765-4321", 1);

insert into Clientes(Nome, DataNascimento, Telefone, IDVendedor)
Values("Rafael", "1988-07-15", "(22) 55555-8888", 2);

insert into Clientes(Nome, DataNascimento, Telefone, IDVendedor)
Values("Júlia", "1976-12-03", "(33) 12345-6789", 3);

 Create view vw_relacionamento_cliente_vendedor as
 select 
 C.Nome AS "Nome do Cliente",
 C.DataNascimento as "Data de Nascimento do Cliente",
 C.Telefone as "Telefone do Cliente",
 V.Nome as "Nome do Vendedor"
 From Vendedor V
 inner join Clientes C 
on V.Id = C.IDVendedor;

select * from vw_relacionamento_cliente_vendedor;