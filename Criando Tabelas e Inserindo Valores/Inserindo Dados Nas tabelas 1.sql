-- Inserções das Tabelas


-- Insert Into [nome da tabela] Values ()  ( Inserindo dados na minha tabela )

Insert Into tb_Produtos Values ('Suco de Laranja' , 4.5);
Insert Into tb_Produtos Values ('Suco de Limão' , 5.0);

-- Testando o Constrant  ( regra )

Insert Into tb_Vendas Values (5 , 3.2) -- vai dar errado, não tem a chave 5 inserida na tabela de produtos antes da tabela de vendas, como foi criado a regra 