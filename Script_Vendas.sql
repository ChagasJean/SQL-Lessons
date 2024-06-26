CREATE DATABASE VENDAS;
USE VENDAS;

CREATE TABLE PRODUTO(
	CODIGO_PRODUTO INT PRIMARY KEY,
	DESCRICAO_PRODUTO VARCHAR(30) NOT NULL,
	PRECO_PRODUTO FLOAT NOT NULL
);

CREATE TABLE NOTA_FISCAL(
	NUMERO_NF INT PRIMARY KEY,
	DATA_NF DATE NOT NULL,
	VALOR_NF FLOAT NOT NULL
);

CREATE TABLE ITENS(
	PRODUTO_CODIGO_PRODUTO INT PRIMARY KEY,
	NOTA_FISCAL_NUMERO_NF INT,
	NUM_ITEM INT NOT NULL,
	QTD_ITEM INT NOT NULL
);

ALTER TABLE PRODUTO
MODIFY DESCRICAO_PRODUTO VARCHAR(50) NOT NULL;

ALTER TABLE NOTA_FISCAL
ADD COLUMN ICMS FLOAT NOT NULL
AFTER NUMERO_NF;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT;

ALTER TABLE ITENS
DROP PRIMARY KEY;

ALTER TABLE ITENS
ADD CONSTRAINT PK_ITENS PRIMARY KEY(NUM_ITEM);

SELECT * FROM PRODUTO;
SELECT * FROM NOTA_FISCAL;

ALTER TABLE NOTA_FISCAL
RENAME COLUMN VALOR_NF TO VALORTOTAL_NF;

ALTER TABLE NOTA_FISCAL
DROP COLUMN DATA_NF;

DROP TABLE ITENS;

RENAME TABLE NOTA_FISCAL TO VENDA;