/* Modelagem básica */

CLIENTE
	NOME - CARACTER(30)
	CPF - NUMERICO(11)
	EMAIL - CARACTER(30)
	TELEFONE - CARACTER(30)
	ENDERECO - CARACTER(100)
	SEXO - CARACTER(1)
	
/* Processos de Modelagem */

1) Modelagem conceitual - Rascunho =>  AD (ADM de Dados);

2) Modelagem Lógica - Qualquer programa modelagem. ex: BRModelo, StarUML => AD;

3) Modelagem Física - Scripts do banco => AD ou DBA

/* Iniciando a modelagem física */

$ mysql -u root -p
CREATE DATABASE PROJETO;
USE PROJETO; -- Conectando ao banco.

/* Criando a tabela cliente */

CREATE TABLE CLIENTE (
	NOME VARCHAR (30),
	SEXO CHAR (1),
	EMAIL VARCHAR (30),
	CPF INT (11),
	TELEFONE VARCHAR (30),
	ENDERECO VARCHAR (100)
);
	
SHOW TABLES; -- Mostrando as tabelas.
DESC TABLES; -- Mostrando a estrutura de uma tabela.

/* Inserindo registros nas tabela cliente */
/* Sintaxe Básica: INSERT INTO TABELA... */

-- Forma 1: Omitindo as colunas.

INSERT INTO CLIENTE 
VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE 
VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');


-- Forma 2:  Colocando as colunas (preferível).

INSERT INTO CLIENTE (NOME,SEXO,ENDERECO,TELEFONE,CPF) 
VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);


-- Forma 3: Insert Compact, somente MYSQL.

INSERT INTO CLIENTE VALUES 
('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) 
VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) 
VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);

/* O Comando SELECT => projeção de colunas na tela */

SHOW TABLES; -- só funciona no Mysql => ponteiramento BD em cima do dicionário de dados;
SELECT NOW() as DATA_HORA, 'JOSÉ' AS ALUNO; -- informa data e hora
SELECT 'JOSÉ BEZERRA';

/* Alias de Colunas */

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;
SELECT EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

/* Apenas para fins acadêmicos */

SELECT * FROM CLIENTE;

/* Filtrando dados (registros - linhas) com WHERE e LIKE => seleção */

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';
SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'F';
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO = 'RJ';

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';

/* Caracter Coringa % */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%CENTRO%';

/* Exercícios */

CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE LIVROS (
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT (4)
);

INSERT INTO LIVROS VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

/* Trazer todos os dados */
select * from livros;

/* Trazer o nome do livro e editora */
select livro, editora from livros;

/*  Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino */
select autor, livro, uf from  livros where sexo = 'M';

/* Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino */
select autor, livro, paginas from livros where sexo = 'F';

/* Trazer os valores dos livros das editoras de SP */
select UF, livro, valor from livros where UF ='SP';

/* Trazer os dados dos autores do sexo masculino que tiveram livrso publicados por SP ou RJ */
select autor, sexo, uf 
from livros 
where sexo = 'M' and (UF = 'SP'or UF = 'RJ');

select autor, sexo, uf 
from livros 
where sexo = 'M' and UF = 'SP'and paginas > 100;

/* Operadores Lógicos
OR  -> Para que a  saída da query seja verdadeira, basta que apenas uma condição seja verdadeira.
AND -> Para que a saída seja verdadeira, todas as condições têm que ser verdadeiras.
*/

/* OR - OR */

show databases;
use projeto;
select * from cliente

select nome, sexo, endereco from cliente
where sexo = 'M'or endereco like '%RJ';

select nome, sexo, endereco from cliente
where sexo = 'F'or endereco like '%ESTACIO';

/* AND - E */

select nome, sexo, endereco from cliente
where sexo = 'M'and endereco like '%RJ';

select nome, sexo, endereco from cliente
where sexo = 'F' and endereco like '%ESTACIO';


/* Funções de agregações -> COUNT(*), GROUP BY, performance com operadores lógicos */

/* Contando os registros de uma tabela */
select count(*) from cliente;
select count(*) as 'Registros' from cliente;

/* Operador GROUP BY */
select sexo, count(*) from cliente
group by sexo;
 
/* Performance em operadores lógicos */

/* 1 milhão de registros */

-- Para contar 
select count(*) from cliente;
select sexo, count(*) from cliente group by sexo;
select cidade, count(*) from cliente group by cidade;

-- Condição: 
-- Sexo: 'F'
-- Cidade = 'Rio de Janeiro'

-- Tratando com OR (70% mulheres -> Sexo F, 30% mora no RJ)
select nome, sexo, endereco from cliente
where sexo = 'F'
OR cidade = 'Rio de Janeiro';

-- Tratando com AND (70% mulheres -> Sexo F, 30% mora no RJ)
select nome, sexo, endereco from cliente
where cidade = 'Rio de Janeiro'
and sexo = 'F';

/* Filtrando valores nulos */

select nome, sexo, endereco 
from cliente
where email is null;

select nome, sexo, endereco 
from cliente
where email is not null;

/* IS OU IS NOT NULL */

/* Utilizando o UPDATE para atualizar  valores */

select nome , email from cliente;

update cliente set email = 'lilian@hotmail.com';
-- cuidado com o comando anterior!!

select * from cliente
where nome = 'JOÃO';

update cliente 
set email = 'joao@ig.com.br'
where nome = 'joão';

update cliente 
set email = 'jorge@ig.com.br'
where nome = 'JORGE';

update cliente 
set email = 'celia@hotmail.com'
where nome = 'CELIA';

update cliente 
set email = 'ana@gmail.com'
where nome = 'ANA';

/* Commit e Rollback */
/* Deletando registros com a claúsula DELETE */

select count(*) from cliente;

delete from cliente
where nome = 'ANA';

select count(*) from cliente
where nome = 'ANA';

insert into cliente values ('CARLA', 'F', 'C.LOPES@UOL.COM.BR', 456266333, '84979996589', 'RUA COPPER LEAF - HAMBURG');

-- Sempre que for deletar, use um select para confirmar o que vai ser 
-- apagado de fato.

select * from cliente
where nome = 'CARLA'
or email = 'LILIAN@HOTMAIL.COM'; -- cuidado com o OR

select * from cliente
where nome = 'CARLA'
and email = 'C.LOPES@UOL.COM.BR';

delete from cliente
where nome = 'CARLA'
and email = 'C.LOPES@UOL.COM.BR';

/* Primeira forma normal - 03 regras */

/* 

1 - Todo campo vetorizado se torna outra tabela
ex: [amarelo, azul, laranja]

2 - Todo campo multivalorado se tornará outra tabela quando o campo for divisível.

3 - Toda tabela necessita de pelo menos um campo que identifique todo registro. 
Obs: Chave Natural(muito mais usada) x Chave Artificial

*/

/* MODELAGEM 

Estamos no início da modelagem para um sistema e o nosso gestor pediu a modelagem da tabela de clientes com a seguinte regra de negócios:

ENDEREÇO - Obrigatório o cadastro- no máximo 1;
(1, 1)

TELEFONE - Não é obrigatório, mas caso queira o cliente pode cadastrar mais de um.
(0, N)

A Cardinalidade é definida pela regra de negócio.
!! Não somos nós que definimos !!

[(0, N), (0, 1), (1, N), (1, 1)]

O Primeiro elemento de cada parêntesis referencia a obrigatoriedade de inserção do dado na tabela.
0 - NÃO OBRIGATÓRIO
1 - OBRIGATÓRIO

O segundo elemento referencia a cardinalidade, ou seja, a quantidade máxima de elementos.
1 - MÁXIMO DE UM
N - MAIS DE UM

*/

24/07/2020

CREATE DATABASE COMERCIO;
USE COMERCIO;
SHOW DATABASES;

DROP TABLE CLIENTE;
CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE) 
);
	
CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'CEL', 'COM') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

DESC CLIENTE; -- Verifica os campos da tabela.

/* ENDEREÇO OBRIGATÓRIO - CADASTRO DE SOMENTE UM
   TELEFONE NÃO OBRIGATÓRIO - CADASTRO DE MAIS DE UM (OPCIONAL) */

/* CHAVE ESTRANGEIRA É A CHAVE PRIMÁRIA DE UMA TABELA QUE VAI ATÉ OUTRA TABELA PARA FAZER REFERÊNCIA ENTRE REGISTROS */	

/* EM RELACIONAMENTO 1 X 1 , A FK FICA NA TABELA MAIS FRACA
   EM RELACIONAMENTO 1 X N, A FK FICA SEMPRE NA CARDINALIDADE N */

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

select * from cliente;

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+
6 rows in set (0.00 sec)

DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

SELECT * FROM  ENDERECO;
DESC TELEFONE

/* SELEÇÃO, PROJEÇÃO E JUNÇÃO */

/* PROJEÇÃO -> É TUDO QUE VAI SER MOSTRADO NA TELA
	 ex: Comando SELECT

   SELEÇÃO -> FILTRAR UM SUBCONJUNTO DE UMA TABELA COMPLETA
	 ex.: Comando WHERE (Claúsula de seleção)

	 SELECT NOME, SEXO, EMAIL -> PROJEÇÃO
	 FROM CLIENTE -> ORIGEM
	 WHERE SEXO -> SELECÁO(FILTRO)

	 JUNÇÃO -> JOIN
	 SELECT NOME, EMAIL, IDCLIENTE
	 FROM CLIENTE;

+--------+----------------+-----------+
| NOME   | EMAIL          | IDCLIENTE |
+--------+----------------+-----------+
| JOAO   | JOAOA@IG.COM   |         1 |
| CARLOS | CARLOSA@IG.COM |         2 |
| ANA    | ANA@IG.COM     |         3 |
| CLARA  | NULL           |         4 |
| JORGE  | JORGE@IG.COM   |         5 |
| CELIA  | JCELIA@IG.COM  |         6 |
+--------+----------------+-----------+
6 rows in set (0.00 sec)

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;
	
+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+
6 rows in set (0.00 sec)

SELECT NOME, SEXO, BAIRRO, CIDADE -> PROJECÁO
FROM CLIENTE, ENDERECO -> ORIGEM
WHERE IDCLIENTE = ID_CLIENTE; -> JUNÇAO(NÃO RECOMENDADO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
+--------+------+---------+----------------+------+----------+
10 rows in set (0.00 sec)

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* 
	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCT - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT  - (DML) */

insert into cliente values (null, 'Paula', 'M', NULL, '77437493')
insert into endereco values (null, 'Rua Joaquim Silva', 'Alvorada', 'Niterói', 'RJ', 7 )

/* Filtros */

select * from cliente
where sexo = 'M';

/* UPDATE

Sempre pesquise antes o registro a ser alterado.
*/

select * from cliente
where idcliente = 7;

update cliente
set sexo = 'F'
where idcliente = 7;

/* DELETE */

insert into cliente values (null, 'xxx', 'm', null, 'xxx');

select * from cliente;

select * from cliente 
where idcliente = 8;

delete from cliente 
where idcliente = 8;

/* DATA DEFINITION LANGUAGE - DDL 
	 OBS: Tipagem do dado
*/

CREATE TABLE PRODUTO (
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL );


/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE, MODIFY */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)


/* MODIFY - ALTERAR O TIPO */
ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO COLUNA EM ORDEM ESPECÍFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDEREÇO) */

DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
5 rows in set (0.03 sec)

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','CEL','COM') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
			 e.rua, e.bairro, e.cidade, e.estado, 
			 t.tipo, t.numero
from cliente c
inner join endereco e 
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| idcliente | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        15 | EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 44522578 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
26 rows in set (0.00 sec)

/* REALATÓRIO DE HOMENS */
/* CLAÚSULAS DE PROJEÇÃO: SELECT; JUNÇÃO: INNER JOIN; SELEÇÃO: WHERE */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
			 e.rua, e.bairro, e.cidade, e.estado, 
			 t.tipo, t.numero
from cliente c
inner join endereco e 
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'M';

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| idcliente | nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        15 | EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
17 rows in set (0.00 sec)

/* Correçao do sexo, ids 12, 13, 18, 19 */
/* Antes de atualizar, projete os registros que deseja alterar para evitar atualizações erradas */

select * from cliente
where idcliente = 12
or idcliente = 13
or idcliente = 18
or idcliente = 19;

/* outra maneira eficiente de projeçao */

select * from cliente
where idcliente in (12,13,18,19);

+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+
4 rows in set (0.00 sec)

update cliente set sexo = 'F'
where idcliente in (12,13,18,19);

/* RELATÓRIO DE MULHERES */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
			 e.rua, e.bairro, e.cidade, e.estado, 
			 t.tipo, t.numero
from cliente c
inner join endereco e 
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'F';

update cliente set sexo = 'M'
where idcliente = 16;

/* Quantidade de homens e mulheres, utilizamos a claúsula de agregação */

select count(*) as quantidade, sexo
from cliente
group by sexo;

+------------+------+
| quantidade | sexo |
+------------+------+
|         10 | M    |
|         10 | F    |
+------------+------+
2 rows in set (0.01 sec)


/* Ids e email de mulheres que moram no centro do RJ e não tenham celulares */

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------+-------------------+---------+------+
| IDCLIENTE | EMAIL             | NOME    | SEXO |
+-----------+-------------------+---------+------+
|         1 | JOAOA@IG.COM      | JOAO    | M    |
|         1 | JOAOA@IG.COM      | JOAO    | M    |
|         1 | JOAOA@IG.COM      | JOAO    | M    |
|         2 | CARLOSA@IG.COM    | CARLOS  | M    |
|         2 | CARLOSA@IG.COM    | CARLOS  | M    |
|         3 | ANA@IG.COM        | ANA     | F    |
|         3 | ANA@IG.COM        | ANA     | F    |
|         5 | JORGE@IG.COM      | JORGE   | M    |
|         5 | JORGE@IG.COM      | JORGE   | M    |
|         5 | JORGE@IG.COM      | JORGE   | M    |
|         9 | FLAVIO@IG.COM     | FLAVIO  | M    |
|         9 | FLAVIO@IG.COM     | FLAVIO  | M    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        11 | NULL              | GIOVANA | F    |
|        12 | KARLA@GMAIL.COM   | KARLA   | F    |
|        13 | DANIELE@GMAIL.COM | DANIELE | F    |
|        15 | NULL              | EDUARDO | M    |
|        16 | ANTONIO@IG.COM    | ANTONIO | M    |
|        17 | ANTONIO@UOL.COM   | ANTONIO | M    |
|        18 | ELAINE@GLOBO.COM  | ELAINE  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        19 | CARMEM@IG.COM     | CARMEM  | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
|        20 | ADRIANA@GMAIL.COM | ADRIANA | F    |
|        21 | JOICE@GMAIL.COM   | JOICE   | F    |
+-----------+-------------------+---------+------+
26 rows in set (0.01 sec)

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO';

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND (TIPO = 'RES' OR TIPO = 'COM');


/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME,
EMAIL E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO RJ */

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR  /* PROJEÇÃO */
FROM CLIENTE C /* ORIGEM */
INNER JOIN ENDERECO E /* JUNÇÃO */
ON C.IDCLIENTE = E.ID_CLIENTE /*JUNÇÃO CONDIÇÃO*/
INNER JOIN TELEFONE T /* JUNÇÃO */
ON C.IDCLIENTE = T.ID_CLIENTE /* JUNÇÃO CONDIÇÃO */
WHERE TIPO = 'CEL' AND ESTADO = 'RJ'; /* SELEÇÃO OU FILTRO */


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO
COM NOME, EMAIL, E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SP. */

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP';
