CREATE TABLE ALUNO(
	idAluno INT PRIMARY KEY AUTO_INCREMENT, /* ESSE COMANDO SÓ EXISTE NO MYSQL */
	nomeAluno VARCHAR(50) NOT NULL,
	idadeAluno INT NOT NULL,
	sexoAluno ENUM("M", "F") NOT NULL
	emailAluno VARCHAR(50) UNIQUE /* ESSE COMANDO É PRA DIZER QUE ESSA VARIÁVEL É UNICA POR REGISTRO */
);

CREATE TABLE TELEFONE( /* CRIAR A FK PARA FAZER A CHAVE ESTRANGEIRA */
	idTel INT PRIMARY KEY AUTO_INCREMENT,
	numTel VARCHAR(15) NOT NULL,
	tipoTel ENUM("CEL", "RES", "COM") NOT NULL
	Id_Aluno INT,

	FOREIGN KEY(Id_Cliente)
	REFERENCES ALUNO(idAluno)
);

CREATE TABLE ENDERECO( /* CRIAR A FK PARA FAZER A CHAVE ESTRANGEIRA */
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
	Rua VARCHAR(50) NOT NULL,
	Bairro VARCHAR(50) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Estado CHAR(2) NOT NULL,
	Id_Aluno INT UNIQUE,

	FOREIGN KEY(Id_Aluno)
	REFERENCES ALUNO(IdAluno)
);

CREATE TABLE TREINO(
	idTreino INT PRIMARY KEY AUTO_INCREMENT,
	tipoTreino ENUM("Musculação", "Pilates", "Aeróbico", "Luta") NOT NULL,
	horaTreino VARCHAR(30) NOT NULL,
	valorTreino FLOAT(5,2) NOT NULL
	id_Aluno INT,
	
	FOREIGN KEY(Id_Aluno)
	REFERENCES ALUNO(IdAluno)
);

CREATE TABLE INSTRUTOR(
	idInstrutor INT PRIMARY KEY AUTO_INCREMENT,
	nomeInstrutor VARCHAR(50) NOT NULL,
	sexoInstrutor ENUM("M", "F") NOT NULL,
	horaInstrutor VARCHAR(30) NOT NULL
	Id_Aluno INT UNIQUE,

	FOREIGN KEY(Id_Aluno)
	REFERENCES ALUNO(IdAluno)
);

CREATE TABLE PAGAMENTO(
	idPagamentos INT PRIMARY KEY AUTO_INCREMENT,
	tipoPagamento ENUM("Crédito", "Débito", "Pix", "Dinheiro")
	id_Aluno INT,

	FOREIGN KEY(Id_Aluno)
	REFERENCES ALUNO(IdAluno)	
);

/* PRÁTICAS DE PROJEÇÃO (SELECT) */
/* Projeção é tudo que você quer ver na tela */
SELECT idAluno, nomeAluno, sexoAluno, idadeAluno
FROM ALUNO;

/* PRÁTICAS DE SELEÇÃO (WHERE) */
/* Seleção é o filtramento para transformar grupos em sub-grupos */
SELECT idAluno, nomeAluno, sexoAluno, idadeAluno
FROM ALUNO
WHERE sexoAluno = "F";

/* PRÁTICAS DE JUNÇÃO (INNER JOIN ON) */
/* Junção é a união de duas tabelas */
SELECT idAluno, nomeAluno, idadeAluno, tipoTreino, valorTreino
FROM ALUNO
INNER JOIN TREINO
ON idAluno = id_Aluno

/* Para filtrar, utilizamos WHERE */
SELECT idAluno, nomeAluno, idadeAluno, tipoTreino, valorTreino
FROM ALUNO
INNER JOIN TREINO
ON idAluno = id_Aluno
WHERE tipoTreino = "Musculação"

/* Podemos juntar várias tabelas da seguinte forma */
/* Fazer o ponteamento é uma forma de melhorar a perfomance e o profissionalismo do seu banco de dados */
SELECT A.idAluno, A.nomeAluno, A.idadeAluno, T.tipoTreino, T.valorTreino, I.nomeInstrutor
FROM ALUNO A
INNER JOIN TREINO T
ON A.idAluno = T.id_Aluno
INNER JOIN INSTRUTOR I
ON A.idAluno = I.id_Aluno
