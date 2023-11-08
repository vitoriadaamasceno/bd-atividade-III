-- Tiger 5
-- 5. Crie uma trigger que exclua um dependente da tabela "tb_dependentes" de um funcionário sempre que um funcionário for deletado da tabela "tb_funcionarios".
create database mix;
use mix;
create table tb_funcionarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255)
);

create table tb_dependentes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Id_funcionario INT,
    FOREIGN KEY (Id_funcionario) REFERENCES tb_funcionarios(ID) ON DELETE CASCADE
);

DELIMITER //
CREATE TRIGGER exclui_dependente
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes WHERE Id_funcionario = OLD.ID;
END //

DELIMITER ;

INSERT INTO tb_funcionarios (Nome) 
VALUES ('João'), 
	('Maria');

INSERT INTO tb_dependentes (Nome, Id_funcionario)
 VALUES ('Filho do João', 1), 
		('Filha da Maria', 2);
        
DELETE FROM tb_funcionarios WHERE ID = 1;

SELECT * FROM tb_dependentes;


