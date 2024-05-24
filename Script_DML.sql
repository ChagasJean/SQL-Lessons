/* LINGUAGEM DML - DATA MANIPULATION LANGUAGE - LINGUAGEM DE MANIPULAÇÃO DE DADOS */

CREATE DATABASE DML_LANG;
USE DML_LANG;

CREATE TABLE PEOPLE (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(50),
  AGE INT,
  SEX CHAR(1)
);

/* INSERT - INSERT VALUES INTO THE TABLE - INSERIR VALORES PARA DENTRO DA TABELA */
INSERT INTO PEOPLE
VALUES
(NULL, "Jean", 20, "M"),
(NULL, "Maria", 19, "F"),
(NULL, "Jorge", 23, "M");

/* FILTER - FILTER TABLE VALUES - FILTRAR VALORES DA TABELA */
SELECT * FROM PEOPLE
WHERE SEX = "F";

/* UPDATE - UPDATE TABLE VALUES - ATUALIZAR VALORES DA TABELA */
UPDATE PEOPLE
SET NAME = "João"
WHERE ID = 1;
/* Também é possível alterar mais de um id ao mesmo tempo
   It is also possible to change more than one ID at the same time */
UPDATE PEOPLE
SET AGE = 50
WHERE ID IN (1,2,3);

/* DELETE - DELETE TABLE VALUES - DELETAR VALORES DA TABELA */
DELETE FROM PEOPLE
WHERE ID = 1;