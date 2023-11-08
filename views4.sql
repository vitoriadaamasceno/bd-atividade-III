-- 4. Crie uma view chamada "vw_produtos_caros" que mostre apenas os produtos com preço acima de R$ 100.
create database produtinhos;
use produtinhos;

 Create table Produtos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Preco float
 );
 
 insert into Produtos(Nome,Preco)
 Values("Perfume",444.00);
 
  insert into Produtos(Nome,Preco)
 Values("Toalha",22.00);
 
 insert into Produtos(Nome,Preco)
 Values("Hidratante",222.00);
 
 Create View vw_produtos_caros as
 select Nome,Preco
 From Produtos
 where Preco > 100;
 
 Select * from vw_produtos_caros;