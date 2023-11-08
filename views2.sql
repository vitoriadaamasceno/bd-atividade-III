-- 2. Crie uma view chamada "vw_estoque_insuficiente" que mostre os produtos com quantidade em estoque abaixo de 5 produtos.
create database estoque;
use estoque;

Create table Produtos(
	 ID int primary key auto_increment,
	 Nome varchar(255) not null,
	 Estoque int
 );
 
 insert into Produtos(Nome,Estoque)
 Values("Cadeira F",15);
 
  insert into Produtos(Nome,Estoque)
 Values("Mesa",2);
 
  insert into Produtos(Nome,Estoque)
 Values("Mesa de Centro",10);
 
 Create View vw_estoque_insuficiente as
 select Nome,Estoque
 From Produtos
 where Estoque < 5;
 
 Select * from vw_estoque_insuficiente;