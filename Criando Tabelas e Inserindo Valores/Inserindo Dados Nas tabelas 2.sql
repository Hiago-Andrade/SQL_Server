Create Database ArteAtuarial;
Create Database ArteAtuarialTeste;
Drop Database ArteAtuarialTeste;
-- será comentário
Use Arteatuarial;

 Create Table Alunos ( 
 id int not null IDENTITY   primary key, 
 nome varchar(45)   not null, 
 dataNascimento date   not null default '2000-01-01', 
 Cpf varchar(11) null , 
 Sexo char not null 
 )
 Alter table Alunos ALTER COLUMN nome varchar(150) not null; 
 
 
 Create Table Paises ( 
 id int not null IDENTITY   primary key, 
 pais varchar(100)   not null, 
 codigoPais int, 
 sigla varchar(5) not null , 
 )
 
 Create Table Estados ( 
 id int not null IDENTITY   primary key, 
 estado varchar(100)   not null, 
 sigla varchar(2)   not null,
 paisid int not null foreign key references Paises(id)
  )
  
 Create Table municipios ( 
 id int not null IDENTITY   primary key, 
 municipio varchar(100)   not null, 
 estadoid  int not null foreign key references Estados(id), 
 );
 
 Create Table endereço ( 
 id int not null IDENTITY   primary key, 
 logradouro varchar(100)   not null, 
 numero varchar(30)   not null, 
 complemento varchar(50) null, 
 cep varchar(8)   not null, 
 municipioid  int not null foreign key references municipios(id), 
 );
 Alter table Paises ALTER COLUMN pais varchar(120) not null; 
 Alter table municipios add CodigoIBGE  varchar(120) not null;
 
INSERT INTO Paises (pais, sigla,codigoPais) VALUES ('BRASIL','BR',256);
INSERT INTO Paises (pais, sigla, codigoPais) VALUES ('Estados Unidos', 'US', 100);
INSERT INTO Paises (pais, sigla, codigoPais) VALUES ('Portugal', 'PR', 121);
INSERT INTO Paises (pais, sigla, codigoPais) VALUES ('Argentina' ,'AR', 345);
INSERT INTO Paises (pais, sigla, codigoPais) VALUES ('Mexico', 'MX', 150);

SELECT * FROM Paises;
SELECT Pais as 'Nome', Sigla, CodigoPais FROM Paises;
SELECT Pais as 'Nome', Pais, CodigoPais FROM Paises; 
 
select * from paises 

INSERT INTO Estados (estado,sigla,paisid)
values ('RIO DE JANEIRO','RJ',1),('SAO PAULO','SP',1),('BUENOS AIRES','BA',4),('FLORIDA','FL',2),('PORTO','PT',3);

--drop table endereço
--drop table municipios
--drop table Estados
--drop table Paises


select * from paises

select * from estados where estado='Rio de Janeiro'
select * from estados where estado not in ('Rio de Janeiro','Buenos Aires')

select * from estados where estado='Rio de Janeiro' OR estado='Buenos Aires'

insert into municipios (municipio, codigoibge, estadoid) values ('Rio de Janeiro','2222',1)
insert into municipios (municipio, codigoibge, estadoid) values ('Niteroi','33333',1)
insert into municipios (municipio, codigoibge, estadoid) values ('São Paulo','44444',2)
insert into municipios (municipio, codigoibge, estadoid) values ('Buenos Aires','55555',3)
insert into municipios (municipio, codigoibge, estadoid) values ('Miami','6666',4)


select * from endereço
INSERT INTO endereço (logradouro, numero, complemento, municipioId, cep) VALUES ('Rua Laranjeiras', 78, null, 1, '20755320');
INSERT INTO endereço (logradouro, numero, complemento, municipioId, cep) VALUES ('Av Barata Ribeiro', 2154, 'Ap 301', 1, '20752302');
INSERT INTO endereço (logradouro, numero, complemento, municipioId, cep) VALUES ('Rua Itália', 123, null, 3, '06520213');
INSERT INTO endereço (logradouro, numero, complemento, municipioId, cep) VALUES ('Av Paulista', 10365, 'Andar 3', 3, '25688987');
INSERT INTO endereço (logradouro, numero, complemento, municipioId, cep) VALUES ('Av Don Helder Camara', 26, null, 1, '32014596');


select * from endereço where cep like '2075%' or logradouro like 'rua%';
select * from  endereço where ( cep not like '2075%' and  logradouro not like 'rua%') 
or (logradouro like 'rua%' and cep  like '2075%');


select * from endereço where complemento is null and numero>98

select * from municipios;
select*from endereço
 where cep like '%2075%'
 or logradouro like 'Rua%';
 
 select*from endereço
 where complemento is null 
 and numero > 98;
  
   
select pais as lista from Paises
union
select estado coluna from Estados;

SELECT ISNULL(complemento, 0) as TesteNulo FROM endereço
