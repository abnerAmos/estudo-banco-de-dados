-- Seleciona a tabela ao qual será utilizada
USE banco_donkey;

-- Exclue a tabela (derruba)
DROP TABLE conta;

-- Criando uma tabela no DB (database)
CREATE TABLE conta (
id			INT				NOT NULL	AUTO_INCREMENT		,
numero		INT(4)			NOT NULL						,
agencia		INT(8)			NOT NULL						,
tp_conta	VARCHAR (10)	NOT NULL	DEFAULT 'Corrente'	,
cliente		VARCHAR (100)	NOT NULL						,
saldo		DECIMAL (13, 2)	NOT NULL						,
PRIMARY KEY (id)
);

-- Insere dados na tabela
INSERT INTO conta (numero, agencia, cliente, saldo) VALUES (1001, 12345678, 'Abner Amos', 1000);
INSERT INTO conta (numero, agencia, cliente, saldo) VALUES (1002, 87654321, 'Edney Ronan', 2000);
INSERT INTO conta (numero, agencia, cliente, saldo) VALUES (1003, 43215678, 'Erik Gonzaga', 4000);

-- Alterando a estrutura de uma tabela
ALTER TABLE conta ADD COLUMN endereco VARCHAR (255);
ALTER TABLE conta ADD COLUMN email VARCHAR (255) UNIQUE; -- Deixa um dado unico, não pode ser repetido

-- Alterando um registro na tabela
UPDATE conta SET endereco = 'Rua Mere Marie' WHERE cliente = 'Edney Ronan';
UPDATE conta SET email = 'edney.roldao@gmail.com' WHERE cliente = 'Erik Gonzaga';

-- Pesquisa itens na tabela (* pesquisa todos os itens da tabela)
SELECT * FROM conta;
SELECT email, endereco FROM conta;

-- Pesquisa com critérios
SELECT cliente, saldo FROM conta WHERE saldo > 1000;

-- Deletando uma linha da tabela
DELETE FROM conta WHERE id = 3;

-- NORMALIZAÇÃO DE TABELA
CREATE TABLE contato (
id			INT				NOT NULL	AUTO_INCREMENT	,
fixo		INT 	(10)	NOT NULL					,
celular		BIGINT	(11)	NOT NULL					,
id_contato	INT 			NOT NULL					,
PRIMARY KEY (id)										,
FOREIGN KEY (id_contato) REFERENCES conta (id)
);

INSERT INTO contato (fixo, celular, id_contato) VALUES (1122563138, 11973851774, 3)

SELECT * FROM contato
DROP TABLE contato;

-- Selecionando todos os contatos de um cliente
SELECT ct.cliente, ctt.celular, ctt.fixo FROM conta ct INNER JOIN contato ctt ON (ctt.id_contato = ct.id);
SELECT * FROM conta ct INNER JOIN contato ctt ON (ctt.id_contato = ct.id);

-- Tabela Associativa
-- São tabelas que são interligadas a 2 ou mais tabelas que não se conversão.