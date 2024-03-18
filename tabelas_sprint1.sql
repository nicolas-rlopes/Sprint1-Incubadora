create database SafeSleep;

use SafeSleep;

create table medico (
idmedico int primary key,
nome varchar (50),
email varchar(45),
senha varchar(45),
nomeHospital varchar(100)
); -- tabela para registrar os dados do medico

insert into medico values
(1,'Fabio Santana', 'fabiosantana@gmail.com', '#f35Zy423','Estadual de Sumaré'),
(2,'Felipe Ferro', 'felipenogueira@hotmail.com','E121s120@1','Regional Público da Transamazônica'),
(3, 'Enzo Bizeli', 'enzobizeli@sptech.school', 'Eb2034#12','Servidor Publico Municipal'),
(4, 'Nicolas Reis', 'nicolasreis@gmail.com','reis2024#123','Clínicas da Faculdade de Medicina da USP'),
(5, 'Vinicius Miralha','viniciusmiralha@hotmail.com','miralha@24zxk','Amaral Carvalho');

select * from medico ;

select * from medico 
where email like '%hotmail%';

select * from medico 
where senha like '%@%';

create table bebe (
idBebe int primary key,
idIncubadora int,
nomeBebe varchar(50),
dtNasc datetime,
nomePai varchar(40),
nomeMae varchar (40)
); -- tabela para registrar os dados do bebe

insert into bebe values
(1, 4, 'Felipe Ferro', '2024-02-23 23:44:01','Kleber Machado', 'Eliude Ferro'),
(2, 1, 'Maite Silva','2024-02-25 06:25:48','Dilson Silva','Eliane Pereira'),
(3, 2, 'Enzo Maciel','2024-03-17 13:14:13','Paulo Rocha','Maria Maciel'),
(4, 5, 'Nicolas Reis','2024-05-05 10:20:45','Marcio Reis','Miriam Oliveira'),
(5, 3, 'Vinicius Miralha','2024-06-02 22:30:28','Carlos Alberto','Regina Miralha');

select * from bebe;

select * from bebe
where nomePai like '%a';

select * from bebe
where nomeMae like '%e %';

select * from bebe
where idbebe > 2;

select * from bebe
where dtNasc like '%02%';

create table historico (
idHistorico int primary key,
idBebe int, -- relacionar data nascimento da tabela bebe
dataInserida datetime,
pesoAtual int
); -- tabela que o medico vai inserir os dados( dataInserida, pesoAtual) que futuramente sera comparado com a dtnasc do bebe

insert into historico values 
(1, 1, '2024-02-25 02:29:38','2600'),
(2, 2, '2024-02-28 08:10:08','1300'),
(3, 3, '2024-03-21 18:42:51','2010'),
(4, 4, '2024-05-10 12:50:46','1650'),
(5, 5, '2024-06-03 23:30:18','1140');

select * from historico
where dataInserida like '%2024-02%';

select * from historico
where idHistorico < 3;

select * from historico
where pesoAtual < 1500;

create table parametrizacao (
idParametrizacao int primary key,
diaVida char(3),
pesoInicial int,
pesoFinal int,
tempInicial decimal(15,2),
tempFinal decimal(15,2)
); -- tabela que compara primeiro a diferenca de dias da dtNasc do tabela bebe e a Data inserida da tabela historico para saber quantidade de dia de vida do bebe, e pega o pesoAtual da tabela historico e ve se o valor esta entre pesoinicial e pesofinal para saber qual sera a temp inicial e temp final.

insert into parametrizacao values 
(1, 1, 0, 1499, 33.5, 35.0),
(2, 1, 1500, 2499, 32.0, 34.0),
(3, 1, 2500, null, 31.0, 34.0),
(4, 2, 0, 1499, 33.0, 35.0),
(5, 2, 1500, 2499, 31.5, 33.5),
(6, 2, 2500, null, 30.5, 33.5),
(7, 3, 0, 1499, 33.0, 34.0),
(8, 3, 1500, 2499, 31.2, 33.4),
(9, 3, 2500, null, 30.1, 33.2),
(10, 4, 0, 1499, 33.0, 34.0),
(11, 4, 1500, 2499, 31.0, 33.2),
(12, 4, 2500, null, 29.8, 32.8),
(13, 5, 0, 1499, 33.0, 34.0),
(14, 5, 1500, 2499, 31.0, 33.0),
(15, 5, 2500, null, 29.0, 32.5);

select * from parametrizacao;

select * from parametrizacao 
where diaVida = 1 and pesoInicial > 1499 and pesoFinal < 2500;

create table incubadora (
idIncubadora int primary key,
cor varchar(20), 
codigoDeSerie varchar(7)); -- tabela de indentificacao de incubadora

insert into incubadora values
(1,'Vermelho', 'FLP2N15'),
(2,'Amarelo','ERS9X34'),
(3,'Verde','VMG1J87'),
(4,'Azul','ABC7K20'),
(5,'Roxo','GBR6I99');

select * from incubadora;

select * from incubadora
where cor like '%Verde%';

select * from incubadora
where idIncubadora >= 3;

create table metrica(
idMetrica int primary key,
idIncubadora int,
temperaturaRegistrada decimal (5,2),
dataHorario datetime
); -- tabela para registro do monitoramento de cada incubadora

insert into metrica values
(1, 5, 34.0,'2024-01-01 02:01:00'),
(2, 5, 34.2,'2024-01-01 02:02:00'),
(3, 5, 34.0,'2024-01-01 02:03:00'),
(4, 5, 33.8,'2024-01-01 02:04:00'),
(5, 5, 34.2,'2024-01-01 02:05:00'),
(6, 5, 33.0,'2024-01-01 02:06:00'),
(7, 2, 28.6,'2024-11-21 11:53:00'),
(8, 2, 28.8,'2024-11-21 11:54:00'),
(9, 2, 29.0,'2024-11-21 11:55:00'),
(10, 2, 28.2,'2024-11-21 11:56:00'),
(11, 2, 29.0,'2024-11-21 11:57:00'),
(13, 2, 29.2,'2024-11-21 11:58:00'),
(14, 4, 29.0,'2024-09-07 02:03:00');

select * from metrica;



