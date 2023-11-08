-- Tigger 3

create database modelo1 ;
use modelo1;

-- 1- Crie um trigger para validar a data de validade de um produto. O trigger deve impedir que o produto seja inserido com uma data de validade vencida.

create table Produto(
Id int primary key auto_increment,
Nome varchar(255) not null,
Data_Validade Date,
Preco float,
Estoque int
);

CREATE TABLE Vendas (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Produto_id INT,
  Quantidade_vendida INT
);

DELIMITER //
CREATE TRIGGER abater_estoque_geral
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
  UPDATE Produto
  SET Estoque = Estoque - NEW.Quantidade_vendida
  WHERE ID = NEW.Produto_id;
END;
//
DELIMITER ;
 
 insert into Produto(Nome,Data_Validade,Preco,Estoque)
values("Café","2023-02-02",10.0,10);
 
INSERT INTO Vendas(Produto_id, Quantidade_vendida) VALUES
(1, 2);

select * from Produto;