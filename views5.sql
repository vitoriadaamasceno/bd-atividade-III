-- 5. Crie uma view chamada "vw_pedidos_pendentes" que mostre os pedidos que ainda não foram entregues com status de "Pendente".
create database restaurante;
use restaurante;

 Create table Pedidos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Status varchar(255) not null,
 Mesa int
 );
 
 insert into Pedidos(Nome,Status,Mesa)
 Values("File com Fritas","Pendente",1);
 
insert into Pedidos(Nome,Status,Mesa)
 Values("Arroz maroquino","Entregue",2);
 
 insert into Pedidos(Nome,Status,Mesa)
 Values("Sobremesa","Entregue",1);
 
 Create View vw_pedidos_pendentes as
 select Nome,Status,Mesa
 From Pedidos
 where Status = "Pendente";
 
 Select * from vw_pedidos_pendentes;
 