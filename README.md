# bd-atividade-III

Definição:

Uma View é uma tabela virtual que é criada a partir de uma consulta SQL. A consulta pode ser simples, como uma seleção de colunas de uma tabela, ou pode ser mais complexa, como uma junção entre várias tabelas.

Um exemplo do uso de views no banco de dados MySQL:

Considere uma tabela chamada "clientes" com as colunas "id", "nome" e "idade". Podemos criar uma view chamada "vw_clientes_maiores_idade" que exibe apenas os clientes com idade igual ou superior a 18 anos.

CREATE TABLE tb_clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  idade INT NOT NULL
);

INSERT INTO tb_clientes (nome, idade) VALUES
('João', 25),
('Maria', 30),
('José', 45);

CREATE VIEW vw_clientes_maiores_idade AS
SELECT id, nome, idade
FROM tb_clientes
WHERE idade >= 18;

Agora, podemos consultar a view "vw_clientes_maiores_idade" como se fosse uma tabela:

SELECT * FROM vw_clientes_maiores_idade;

____________________________________________________________________________________________________________________

Implemente os exercícios abaixo:

1. Crie uma view chamada "vw_funcionarios_departamento" que mostre o nome e cargo de todos os funcionários do departamento "Administrativo".

2. Crie uma view chamada "vw_estoque_insuficiente" que mostre os produtos com quantidade em estoque abaixo de 5 produtos.

3. Crie uma view chamada "vw_relacionamento_cliente_vendedor" que mostre o relacionamento entre um cliente e o vendedor que o atendeu.

4. Crie uma view chamada "vw_produtos_caros" que mostre apenas os produtos com preço acima de R$ 100.

5. Crie uma view chamada "vw_pedidos_pendentes" que mostre os pedidos que ainda não foram entregues com status de "Pendente".


____________________________________________________________________________________________________________________

Definição: 

Triggers são blocos de código que são executados automaticamente em resposta a um evento específico, como a inserção, a atualização ou a exclusão de um registro em uma tabela.

Um exemplo do uso de triggers no banco de dados MySQL:

CREATE TABLE tb_funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255),
  email VARCHAR(255),
  data_nascimento DATE
);

DELIMITER //

CREATE TRIGGER tg_validar_data_nascimento
BEFORE INSERT ON 

tb_funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_nascimento < '1900-01-01' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de nascimento inválida';
    END IF;
END //

DELIMITER ;

Agora, podemos inserir um registro na tabela tb_funcionarios.

INSERT INTO 

tb_funcionarios (nome, email, data_nascimento) VALUES ('Marta', 'marta@gmail.com', '1800-01-01');

O registro não será inserido e será exibida a mensagem: "Data de nascimento inválida".

____________________________________________________________________________________________________________________

Implemente os exercícios abaixo:

1. Crie um trigger para validar a data de validade de um produto. O trigger deve impedir que o produto seja inserido com uma data de validade vencida.

2. Crie um trigger para aumentar o preço de um produto sempre que ele for atualizado. O aumento deve ser de 10%.

3. Crie um trigger para atualizar o estoque sempre que um produto for vendido. O trigger deve diminuir o número de itens em estoque sempre que uma venda for realizada.

4. Crie um trigger que seja acionado após a exclusão de um registro em uma tabela "tb_funcionarios" e insira os dados excluídos em outra tabela "tb_funcionarios_demitidos" de registro de exclusões.

5. Crie uma trigger que exclua um dependente da tabela "tb_dependentes" de um funcionário sempre que um funcionário for deletado da tabela "tb_uncionarios".
