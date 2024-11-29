CREATE TABLE cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(20) NOT NULL,
    Sobrenome_Cliente VARCHAR(40) NOT NULL
);

CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(20) NOT NULL,
    Descricao TEXT NULL,
    Preco NUMERIC CHECK (Preco > 0) NOT NULL,
    Qtde_Estoque SMALLINT DEFAULT 0
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    ID_Cliente INT NOT NULL REFERENCES cliente(ID_Cliente),
    ID_Produto INT NOT NULL,
    Qtde SMALLINT NOT NULL, 
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

INSERT INTO cliente(ID_Cliente, Nome_Cliente, Sobrenome_Cliente)
VALUES
(1, 'João', 'Silveira'),
(2, 'Marcelo', 'Oliveira'),
(3, 'Isadora', 'Vargas');

INSERT INTO Produto(ID_Produto, Nome_Produto, Descricao, Preco, Qtde_Estoque)
VALUES 
(1, 'Bola', 'Bola colorida', 15.00, 13),
(2, 'Água', 'Água em garrafa de plástico de 1l', 5.00, 52);

INSERT INTO Pedido(ID_Pedido, ID_Cliente, ID_Produto, Qtde)
VALUES 
(1, 1, 1, 3),
(2, 2, 2, 2),
(3, 3, 1, 1);

ALTER TABLE cliente ADD GENERO VARCHAR(20);
ALTER TABLE cliente ADD SALARIO NUMERIC;
ALTER TABLE cliente ADD CPF VARCHAR(11);

UPDATE cliente 
SET GENERO = 'masculino', SALARIO = 1300, CPF = '93792828341' WHERE ID_Cliente = 1;

UPDATE cliente 
SET GENERO = 'masculino', SALARIO = 1200, CPF = '92829640192' WHERE ID_Cliente = 2;

UPDATE cliente 
SET GENERO = 'feminino', SALARIO = 1350, CPF = '92850190201' WHERE ID_Cliente = 3;

INSERT INTO cliente(ID_Cliente, Nome_Cliente, Sobrenome_Cliente, GENERO, SALARIO, CPF)
VALUES
(4, 'João', 'Teixeira', 'masculino', 1347.50, '05903901478'),
(5, 'Pedro', 'Assis', 'masculino', 1209.04, '01938204571'),
(6, 'Amanda', 'Alves', 'feminino', 1358.19, '1923041849');

SELECT * FROM cliente;

SELECT DISTINCT Nome_Cliente FROM cliente;

SELECT Nome_Cliente, CPF FROM cliente;

SELECT Nome_Cliente, CPF FROM cliente WHERE GENERO = 'feminino';

SELECT Nome_Cliente, CPF FROM cliente WHERE GENERO = 'feminino' ORDER BY Nome_Cliente DESC;

SELECT Nome_Cliente, SALARIO FROM cliente WHERE GENERO = 'masculino' AND SALARIO < 3000;

SELECT COUNT(*) AS numero_de_Usuarios FROM cliente;

SELECT COUNT(*) AS usuarios_Mulheres FROM cliente WHERE GENERO = 'feminino';

SELECT COUNT(*) FROM Produto;

SELECT COUNT(*) FROM Pedido WHERE ID_Cliente = 2;

SELECT COUNT(*) FROM Pedido WHERE ID_Produto = 1;

SELECT COUNT(DISTINCT ID_Cliente) FROM Pedido;

SELECT AVG(SALARIO) FROM cliente;

SELECT AVG(Preco) AS Preco_Medio FROM Produto;

SELECT AVG(Qtde) AS Qtde_Media FROM Pedido;

SELECT AVG(num_pedidos) 
FROM (SELECT ID_Cliente, COUNT(*) AS num_pedidos FROM Pedido GROUP BY ID_Cliente) AS qtde_pedidos;

SELECT SUM(SALARIO) FROM cliente;

SELECT SUM(Preco / 3) FROM Produto;

SELECT GENERO, AVG(SALARIO) AS Media_Salarial FROM cliente GROUP BY GENERO;

SELECT SUM(CASE WHEN GENERO = 'masculino' THEN 1 ELSE 0 END) AS usuarios_masculinos, SUM(CASE WHEN GENERO = 'feminino' THEN 1 ELSE 0 END) AS usuarios_femininos FROM cliente;


Select nome_cliente, qtde
from cliente, pedido
where Pedido.id_cliente = Cliente.id_cliente and qtde > 2

SELECT Cliente.Nome_Cliente, Pedido.ID_Pedido
FROM Cliente, Pedido
WHERE Pedido.ID_Cliente = Cliente.ID_Cliente

Select Produto.Nome_Produto, Pedido.Qtde
from Produto, Pedido
where Pedido.ID_Produto = Produto.ID_Produto

Select Cliente.Nome_Cliente, Pedido.ID_Pedido
from Cliente, Pedido
where pedido.ID_cliente = Cliente.ID_Cliente and qtde < 2

select id_pedido, nome_produto, qtde
from pedido pe
join produto
on pe.id_produto = produto.id_produto
join cliente cl
on pe.id_cliente = cl.id_cliente

select distinct Produto.Nome_Produto
from Pedido
join Produto 
on Pedido.ID_Produto = Produto.ID_Produto
where Pedido.ID_Cliente = 2

create table Categoria (
ID_Categoria INT PRIMARY KEY,
Nome_Categoria VARCHAR(50) NOT NULL
);


alter table produto add id_categoria int references Categoria(ID_Categoria)


insert into Categoria (id_categoria, nome_categoria)
values
(1, 'brinquedo'),
(2, 'bebida')

select Nome_Produto, Nome_Categoria
FROM Produto
right join Categoria
on Produto.ID_Categoria = Categoria.ID_Categoria

select nome_cliente, ID_pedido
from Cliente
RIGHT JOIN Pedido
on Cliente.ID_Cliente = Pedido.ID_Cliente

select nome_produto, nome_cliente
from produto
cross join Cliente


select nome_produto, nome_categoria 
from produto
full outer join categoria
on produto.ID_categoria=categoria.ID_categoria

select Nome_categoria, Nome_produto
from categoria
left join produto
on Categoria.ID_Categoria = Produto.ID_Categoria

Select ID_Pedido, Nome_Cliente
from cliente
right join pedido
On Cliente.ID_Cliente = Pedido.ID_Cliente

select Nome_Produto, Nome_categoria
from Produto
cross join Categoria
where Categoria.Nome_categoria like '%brinquedo%'

select ID_Pedido, Nome_Produto, Nome_Categoria
from Pedido
full outer join Produto 
on Pedido.ID_Produto = Produto.ID_Produto
full outer join Categoria 
on Produto.ID_Categoria = Categoria.ID_Categoria


create or replace view produtos_comprados AS
select PE.ID_Pedido as Numero_Pedido, Nome_Cliente, Nome_Produto,
	PE.qtde as Quantidade, PE.Qtde *Preco as Fatura
	from Pedido PE
	inner join produto
	on PE.ID_Produto = Produto.ID_Produto
	inner join cliente
	on PE.ID_Cliente = Cliente.ID_Cliente


select * from produtos_comprados

create or replace view produtos_categorias as
select Nome_Produto, Nome_Categoria
from Produto
left join Categoria 
on Produto.ID_Categoria = Categoria.ID_Categoria;

select * from produtos_categorias

create or replace view Pedidos_Feitos as
select ID_Pedido, Nome_Cliente
from Pedido
right join Cliente
on Pedido.ID_Cliente = Cliente.ID_Cliente

select * from Pedidos_Feitos

create index on Cliente (ID_Cliente)

create index on Produto using hash (ID_Produto)

create index on Pedido (ID_Pedido)

CREATE TABLE historico_salarial (
    ID_Historico SERIAL PRIMARY KEY,
    ID_Cliente INT NOT NULL REFERENCES cliente(ID_Cliente),
    data_alteracao date ,
    salario money NOT NULL 
);

CREATE OR REPLACE FUNCTION atualizacao_salario() 
RETURNS TRIGGER AS $$ BEGIN 
INSERT INTO historico_salarial(ID_Cliente, data_alteracao, salario)
VALUES (NEW.ID_Cliente, NOW(), NEW.salario);
RETURN NULL; END; $$LANGUAGE plpgsql; 

CREATE TRIGGER trigger_atualiza_salario
AFTER INSERT OR UPDATE ON Cliente FOR EACH ROW 
EXECUTE FUNCTION atualizacao_salario()

select * from cliente

update cliente set salario = '1500'
where ID_cliente = 3

update cliente set salario = '1500'
where ID_cliente = 4


update cliente set salario = '1500'
where ID_cliente = 2


update cliente set salario = '1500'
where ID_cliente = 1

	
select * from historico_salarial


create table historico_preco_produto (
ID_Historico serial primary key, 
ID_Produto INT not null references Produto(ID_Produto),
data_alteracao date ,
preco numeric not null )

CREATE OR REPLACE FUNCTION atualizacao_preco_produto() 
RETURNS TRIGGER AS $$ BEGIN 
INSERT INTO historico_preco_produto(ID_Produto, data_alteracao, preco)
VALUES (NEW.ID_Produto, NOW (), NEW.Preco);
RETURN NULL; END; $$LANGUAGE plpgsql; 

CREATE TRIGGER historico_preco_produto
AFTER INSERT OR UPDATE ON Produto FOR EACH ROW 
EXECUTE FUNCTION atualizacao_preco_produto()
















