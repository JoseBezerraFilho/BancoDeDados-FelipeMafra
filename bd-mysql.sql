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