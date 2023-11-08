-- Tigger 
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

DELIMITER //

CREATE TRIGGER tg_validar_data_validade
BEFORE INSERT ON Produto
FOR EACH ROW
BEGIN
    IF NEW.Data_Validade < '2023-11-07' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de validade vencida';
    END IF;
END //

DELIMITER ;

insert into Produto(Nome,Data_Validade,Preco,Estoque)
values("Café","2023-02-02",10.0,1);