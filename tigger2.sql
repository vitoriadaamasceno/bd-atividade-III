-- Tigger 2 
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
-- 2. Crie um trigger para aumentar o preço de um produto sempre que ele for atualizado. O aumento deve ser de 10%.

DELIMITER //
CREATE TRIGGER aumento_produto
before UPDATE ON 
Produto
FOR EACH ROW
BEGIN
    SET new.Preco = new.Preco + (new.Preco * 0.10);
END //
DELIMITER ;

-- Inserir
insert into Produto(Nome,Data_Validade,Preco,Estoque)
values("Desodorante","2023-12-02",30,2);
-- Atualizar
update Produto SET Preco = 50 
where id = 1;
-- Verificar
select * from Produto;


drop database modelo1;
