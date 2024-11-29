CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome_Usuario CHAR(7),
	Sobrenome_Usuario CHAR (7),
    Email CHAR(20),
    Endereco CHAR(13),
    Senha CHAR(8),
    Data_Nascimento DATE,
    Data_Criacao_Conta INT
);


CREATE TABLE Produtos (
    ID_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(30) NOT NULL,
    Descricao TEXT NULL,
    Preco NUMERIC CHECK (Preco > 0) NOT NULL,
    Qtde_Estoque SMALLINT DEFAULT 0
);

CREATE TABLE Pedidos (
    ID_Pedido SERIAL PRIMARY KEY,
    ID_Cliente INT NOT NULL REFERENCES Usuario (ID_Usuario),
    ID_Produto INT NOT NULL,
    Qtde SMALLINT NOT NULL,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos (ID_Produto)
);


ALTER TABLE Usuario
ALTER COLUMN Email TYPE VARCHAR(255),
ALTER COLUMN Email SET NOT NULL;


ALTER TABLE Produtos
RENAME COLUMN Preco to Money


ALTER TABLE Pedidos 
DROP COLUMN Qtde;


CREATE TABLE Categoria (
ID_Categoria INT PRIMARY KEY,
);


DROP TABLE Categoria;


TRUNCATE TABLE 
Pedidos,
Usuario CASCADE;

INSERT INTO Usuario(ID_Usuario, Nome_Usuario, Sobrenome_Usuario,)
Values (1, ‘João’, ‘Silveira’),
Values (2, ‘Guilherme’, ‘Oliveira’),
Values (3, ‘Isadora’, ‘Vargas’);



INSERT INTO Produtos(ID_Produto, Nome_Produto, Descricao, Preco, Qtde_Estoque)
Values
(1,'Bola', 'Bola Volei', 15,00, 13),
(2,'Agua', 'Agua com gas', 12,00, 10),
(3,'Baly', 'Energetico saborizado', 15,00, 4);

INSERT INTO Pedidos(ID_Pedido, ID_Usuario, ID_Produto)
Values
(1,3,2),
(2,1,1),
(3,2,3);












