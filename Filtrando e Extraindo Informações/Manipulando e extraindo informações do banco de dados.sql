-- Selecionando dados das Tabelas

-- Usamos SELECT [Colunas] FROM [Tabela]

SELECT coluna1,coluna2
FROM tabela



SELECT*  -- pega todas as colunas da tabela
FROM tabela

SELECT*
FROM Person.Person;

SELECT FirstName, LastName
FROM Person.Person




/* selecionando dados distintos e expecificos */

SELECT DISTINCT FirstName, LastName
FROM Person.Person

SELECT *
FROM Person.Person
WHERE LastName = 'miller' and FirstName = 'Anna'


SELECT*
FROM production.Product
WHERE color = 'blue' or color ='black' 

SELECT*
FROM production.Product
WHERE ListPrice > 1500 and ListPrice < 5000

SELECT*
FROM production.Product
WHERE color <> 'Red'


/*DESAFIO 1 - A equipe de produ��o de produtos precisa do nome de todas as pe�as que pesam mais que 500kg mas n�o mais que 700kg para inspe��o */
SELECT*
FROM production.Product
WHERE Weight > 500 and Weight < = 700

/*DESAFIO 2 - Foi pedido pelo marketing uma rela��o de todos os empregados que s�o casados e s�o asalariados*/

SELECT JobTitle, MaritalStatus, SalariedFlag
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1 

/*DESAFIO 3 - Um usuario chamado Peter Krebs est� devendo um pagamento, consiga o email dele para que possamos enviar uma cobran�a !*/

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' and LastName = 'Krebs'
-- O BusinessEntityID dele �  26
SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26




SELECT count (*) -- Contar o numero de linhas de toda a tabela  
FROM Person.Person

SELECT count (DISTINCT Title) -- Contar o numero de Titulos Distintos
FROM Person.Person

/*DESAFIO 1 - Quero saber quantos produtos temos cadastrados em nossa tabela de produtos */

SELECT count(Name)
FROM Production.Product

/*DESAFIO 2 - Quero saber quantos tamanhos de produtos temos cadastrados em nossa tabela de produtos */

SELECT count(DISTINCT Size)
FROM Production.Product





SELECT TOP 10 *  -- Retorna as 10 primeiras linhas de todas as colunas da Tabela
FROM Production.Product



SELECT *
FROM Person.Person
ORDER BY FirstName asc  -- ordenado por ordem crescente de nome

SELECT *
FROM Person.Person
ORDER BY FirstName asc, LastName desc -- ordenado por ordem crescente de nome E decrescente de sobrenome

/*DESAFIO 1 - Obter o ProductID dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato */

SELECT TOP 10 ProductID, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice desc

/*DESAFIO 2 - Obter o nome e n�mero do produtodos produtos que tem o ProductID entre 1 e 4 */

SELECT TOP 4 Name,ProductNumber, ProductID
FROM Production.Product
ORDER BY ProductID asc




SELECT*
FROM Production.Product
WHERE ListPrice between 1000 and 1500 -- filtrando valores entre 1.000 e 1.500

SELECT *
FROM HumanResources.Employee
WHERE HireDate between '2009/12/01' and '2010/12/01' -- padr�o ANO/M�S/DIA



SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)



/*DESAFIO 1 - Vamos dizer que vc quer encontrar uma pessoa no banco de dados que vc sabe que o nomme dela era ovi... alguma coisa*/

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'Ovi%' -- esse % significa que n�o importa oque vem depois dele 

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%essa%' -- Vai procurar "essa" no meio do nome da pessoa

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro_' --  _ funciona parecido com o %, mas ele vai se limitar � apenas um caracter  

/*DESAFIO 2 - Quantos produtos temos cadastrado que custam mais de 1500 dolares ?*/

SELECT COUNT(*)
FROM Production.Product
WHERE ListPrice > 1500

/*DESAFIO 3 - Quantas pessoas temos que iniciam com a letra P o Sobrenome ?*/

SELECT count (*)
FROM Person.Person
WHERE LastName LIKE 'P%'

/*DESAFIO 4 - Quantas cidades unicas est�o cadastrados nossos clientes ?*/

SELECT COUNT( DISTINCT City)
FROM Person.Address

/*DESAFIO 5 - Quais cidades unicas est�o cadastrados nossos clientes ?*/

SELECT DISTINCT City
FROM Person.Address



SELECT TOP 10 SUM(LINETOTAL) AS "soma"-- Faz a conta de soma e chama a coluna de "Soma
FROM Sales.SalesOrderDetail

SELECT TOP 10 MIN(LINETOTAL) -- O menos valor 
FROM Sales.SalesOrderDetail

SELECT TOP 10 MAX(LINETOTAL) -- O maior valor 
FROM Sales.SalesOrderDetail

SELECT TOP 10 AVG(LINETOTAL) -- A m�dia dos valores 
FROM Sales.SalesOrderDetail





/* SQL  INTERMEDIARIO */


SELECT SpecialOfferID, SUM (UnitPrice) AS "Soma"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID  -- Soma todos os pre�os unitarios e divide para cada ID de Oferta, como um soma se 

SELECT ProductID, COUNT (PRODUCTid) AS "CONTA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID


/*DESAFIO 1 - Preciso saber quantas pessoas tem o mesmo MiddleName agrupadas pelo MiddleName*/

SELECT MIDDLENAME, COUNT (MIDDLENAME) AS "CONTAGEM"
FROM  Person.Person
GROUP BY MiddleName

/*DESAFIO 2 - Preciso saber em m�dia qual a quantidade que cada produto � vendido na loja */

SELECT SalesOrderDetailID, AVG(ORDERQTY) AS "M�DIA"
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderDetailID

/*DESAFIO 3 - Quero saber qual foram as 10 vendas no total que tiveram os maiores valores de venda(line total) por produto
			  do maior para o menor */

SELECT TOP 10 ProductID, SUM(LineTotal) AS "Maximo"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Maximo desc

/*DESAFIO 4 - Eu preciso saber quantos produtos e qual a quantidade m�dia de produtos temos cadastrados nas nossas ordens de
			   servi�o (workOrder), agrupados por productID*/

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM", AVG(OrderQty) AS "M�DIA DE ORDEM" 
FROM Production.WorkOrder
GROUP BY ProductID




SELECT FirstName, COUNT(FirstName) AS "Quantidade" 
FROM Person.Person
GROUP BY FirstName
HAVING count (FirstName) > 10  -- O Having serve como um WHERE, mas utilizado depois que temos dados agrupados (GROUP BY)


/*DESAFIO 1 - Estamos querendo identificar as provincias(stateProvidenceID) com o maior numero de cadastros no nosso 
			  sistema, ent�o � preciso encontrar quais provicias ent�o registradas no banco de dados mais de 1000 vezes*/

SELECT TOP 100*
FROM Person.Address

SELECT StateProvinceID, COUNT(STATEPROVINCEID) AS "QUANTIDADE"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(STATEPROVINCEID) > 1000


/*DESAFIO 2 - Sabendo que se trata de uma multinacional os gerentes querem saber quais produtos (ProductID) n�o est�o trazendo 
			  em m�dia no minimo 1 milh�o em total de vendas (lineTotal)*/

SELECT TOP 10*
FROM Sales.SalesOrderDetail

SELECT ProductID, AVG(LINETOTAL) AS "M�DIA DE VENDAS"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LINETOTAL) < 1000000


SELECT TOP 10*
FROM Person.Person

SELECT TOP 10*
FROM Person.EmailAddress

SELECT P.BusinessEntityID, P.FirstName, P.LastName, PE.EmailAddress
FROM Person.Person AS P                                                                -- Estou dando um nome mais simpes para a tabela
INNER JOIN Person.EmailAddress AS PE    ON P.BusinessEntityID = PE.BusinessEntityID    -- dando um nome mais simples para a tabela de email tambem e falando que is ID devem ser conectados










/* Quero descobrir quantas pessoas tem o cart�o de credito registrado */

SELECT *
FROM Person.Person AS "PP"
INNER JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID

-- INNER JOIN = 19.118

SELECT *
FROM Person.Person AS "PP"
LEFT JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID

-- LEFT JOIN = 19.972

-- O resultado � t�o diferente pois o INNER JOIN s� vai mostrar as pessoas que possuem cart�o de credito, enquanto o LEFT JOIN vai mostrar todos os casos ( que foram preenchidos com cart�o ou n�o)

SELECT *
FROM Person.Person AS "PP"
LEFT JOIN Sales.PersonCreditCard AS "PC" ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL      -- Pessoas com nenhum cart�o de cr�dito registrado




SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'A'






/* SQL  AVAN�ADO */

SELECT TOP 10 *
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(MONTH,OrderDate) AS "M�s do Pedido"       -- Quero saber o m�s que foi feito esse pedido
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(DAY,OrderDate) AS "Dia do Pedido"         -- Dia
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(YEAR,OrderDate) AS "Ano do Pedido"        -- Ano
FROM Sales.SalesOrderHeader


SELECT AVG(TOTALDUE) AS "M�dia", DATEPART(MONTH,ORDERDATE) AS "M�s"
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH,ORDERDATE)  -- Agrupando a m�dia por m�s 
ORDER BY M�s




SELECT top 10 *
FROM Person.Person

SELECT CONCAT(FIRSTNAME,' ',LASTNAME) AS " Nome e Sobrenome"  -- Juntando na mesma coluna Nome e Sobrenome
FROM Person.Person



SELECT FirstName, UPPER(FirstName) AS "MAIUSCULO", LOWER(FirstName) AS "MINUSCULO"  -- Transforma pala letra maiuscula e minuscula
FROM Person.Person



SELECT FirstName, SUBSTRING(FirstName,1,3) -- extrai tr�s caracteres come�ando do 1� caracter
FROM Person.Person



SELECT ProductNumber,REPLACE(PRODUCTNUMBER, '-', '#') AS "Substitui��o"  -- substitui o "-" por "#" da coluna "ProductNumber"
FROM Production.Product





/* DESAFIO 1 - Monte um relat�rio pra mim de todos os produtos cadastrados quem tem o pre�o de venda acima da m�dia */

SELECT AVG(ListPrice) -- 438,66
FROM Production.Product

SELECT*
FROM Production.Product
WHERE ListPrice > 438.66

--ou

SELECT*
FROM Production.Product
WHERE ListPrice > ( SELECT AVG(ListPrice) FROM Production.Product)       /* Esse jeito � mais interessante, subSelect , pois a m�dia pode
																			mudar mas o codigo permanecer� valido */


SELECT TOP 10*
FROM Person.Address

SELECT TOP 10*
FROM Person.StateProvince


SELECT pa.AddressLine1, ps.Name
FROM Person.Address AS "pa"
INNER JOIN Person.StateProvince AS "ps" on pa.StateProvinceID = ps.StateProvinceID
AND ps.Name = 'Alberta'

-- OU

SELECT AddressLine1
FROM PERSON.Address
WHERE StateProvinceID IN (
SELECT StateProvinceID
FROM PERSON.StateProvince WHERE Name = 'Alberta')




/* Buscando os funcionarios contratados no mesmo ano */

SELECT top 10*
FROM HumanResources.Employee

SELECT TOP 10*
FROM Person.Person

SELECT CONCAT(pp.FirstName, ' ',pp.LastName), DATEPART(YEAR,hm.HireDate) AS "Ano de Contrata��o"
FROM Person.Person AS "pp"
INNER JOIN HumanResources.Employee AS "hm" on pp.BusinessEntityID = hm.BusinessEntityID
AND DATEPART(YEAR,hm.HireDate)= 2010
