/*
		Lojas de Sucos 

	* Vende sucos (principalmente de Laranja)

	* Dados dos clientes:
		Nome (texto)
		Nascimento ( dd/mm/aaaa)
		Sexo (numero)
		Endere�o
			Rua (texto)
			Cidade (texto)
			Estado (texto)
		Telefone (texto)

	* Dados das Vendas
		N�mero da venda (numero)
		Cliente que comprou (texto)
		Pre�o total (numero)

	* Dados do Produto
		Nome (texto)
		Pre�o (numero)
*/

Create Table tb_Clientes(
	cdCliente INT Primary Key Identity (1,1), -- Identidade, come�a pelo numero 1 e aumenta de 1 em 1 (Para fazer Liga��es Igual Power BI)
	nmCliente VARCHAR (50) Not Null, -- Obrigat�rio, maximo 50 caracteres
	dtNascimento DATE,  -- YYYY-MM-DD 
	inSexo VARCHAR(1) Not Null,
	nmEndere�o VARCHAR (50),
	nmCidade VARCHAR (50),
	nmEstado VARCHAR (30),
	nmCelular VARCHAR (50),
);

Create table tb_Produtos (
	cdProduto Int Primary Key Identity (1,1),  -- Identidade, come�a pelo numero 1 e aumenta de 1 em 1
	nmProduto Varchar(50) Not Null, -- Obrigat�rio, maximo 50 caracteres 
	vlProduto Decimal(6,2) Not Null, -- Obrigatorio, maximo 6 digitos com duas casas depois da virgula
);

Create Table tb_Vendas (
	cdVendas Int Primary Key Identity (1,1),
	cdProduto Int Foreign Key REFERENCES tb_Produtos(cdProduto),
	cdCliente Int Foreign Key REFERENCES tb_Clientes(cdCliente),
	vlProduto Decimal (6,2) Not Null,
	qtVendas INT DEFAULT 0,  -- Contagem de vendas come�ando do zero

);

-- Foreing Key ( ChaveEstrangeira )
-- CONSTRAINT ( � uma regra para que apenas haja uma venda de um produto se o bendito produto esta no banco de dados )

Alter Table tb_Vendas
Add Constraint  FK_Produto_Vendas
Foreign Key (cdProduto)
References tb_Produtos ( cdProduto)

SELECT*
FROM tb_Vendas





/* Inser��es nas Tabelas   */

-- Insert Into [nome da tabela] Values ()  ( Inserindo dados na minha tabela )


INSERT INTO tb_Produtos (nmProduto,vlProduto)
VALUES 
 ('Suco de Laranja' , 4.5),
 ('Suco de Lim�o' , 5.0),
 ('Pao de Queijo' , 2.5),
 ('Coxinha' , 5.5);


 SELECT*
FROM tb_Produtos


INSERT INTO tb_Clientes (nmCliente,dtNascimento,inSexo,nmEndere�o,nmCidade,nmEstado,nmCelular)
VALUES	
 ('Hiago Andrade', '1997-04-17', 'M', 'Raymundo Vaz de Melo', 'Belo Horizonte', 'Minas Gerais', '99818-3419'),
 ('Regina Andrade', '1968-03-17', 'F', 'Raymundo Vaz de Melo', 'Belo Horizonte', 'Minas Gerais', '99786-8931'),
 ('Amanda Gon�alves', '1997-08-29', 'F', 'Pedro Dutra', 'Belo Horizonte', 'Minas Gerais', ' ');





 /* Deletando e mudando dados nas tabelas */


DELETE FROM tb_Clientes        -- Deletando todos os dados da Tabela


UPDATE tb_Clientes
SET nmCelular = '99802-2908'
WHERE cdCliente = 3            -- Acrescentando o Celular apenas no ID 3 ( Que � o ID da Amanda Gon�alves )





/* Testando o Constrant  ( regra ) */

Insert Into tb_Vendas Values (5 , 3.2) -- vai dar errado, n�o tem a chave 5 inserida na tabela de produtos antes da tabela de vendas, como foi criado a regra 






/* Mudando os limites de espa�o nas tabelas e nomes de colunas */


ALTER TABLE tb_Produtos
ALTER COLUMN nmProduto Varchar(100)  -- era 50 passei para 100 


EXEC sp_rename 'tb_Produtos.nmProduto', 'nmProdutooooo','COLUMN'





/* Como dropar(Excluir) uma tabela do Banco de Dados */

TRUNCATE TABLE tb_Clientes


