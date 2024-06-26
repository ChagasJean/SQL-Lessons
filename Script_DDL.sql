/* LINGUAGEM DDL - DATA DEFINITION LANGUAGE - LINGUAGEM DE TIPAGEM DOS DADOS */

CREATE DATABASE DDL;
USE DDL;

/* CRIAÇÃO DA TABELA */
CREATE TABLE PESSOA(
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  sexo INT NOT NULL,
);

/* CHANGE -> COMANDO QUE PODE ALTERAR O NOME E O TIPO DA COLUNA */
ALTER TABLE PESSOA
CHANGE idade nova_idade INT NOT NULL;

/* MODIFY -> COMANDO PARA ALTERAR APENAS O TIPO DO DADO */
ALTER TABLE PESSOA
MODIFY sexo ENUM("M", "F") NOT NULL;

/* ADD -> COMANDO QUE ADICIONA UMA NOVA COLUNA NO FINAL DA LISTA */
ALTER TABLE PESSOA
ADD mãe VARCHAR(50) NOT NULL;

/* ADD AFTER -> COMANDO QUE ADICIONA UMA COLUNA DEPOIS DE UMA COLUNA DESEJADA */
ALTER TABLE PESSOA
ADD pai VARCHAR(50) NOT NULL
AFTER mãe;

/* ADD FIRTS -> COMANDO QUE ADICIONA A COLUNA EM PRIMEIRO LUGAR DA FILA */
ALTER TABLE PESSOA
ADD id INT PRIMARY KEY AUTO_INCREMENT
FIRST;

/* DROP COLUMN -> COMANDO PARA APAGAR A COLUNA DESEJADA */
ALTER TABLE PESSOA
DROP COLUMN mãe;
