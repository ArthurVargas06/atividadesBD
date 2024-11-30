-- codigo do filme corra
CREATE TABLE Personagem (
Nome VARCHAR(50) NOT NULL,
ID_Personagem INT PRIMARY KEY,
Idade INT,
Etnia VARCHAR(30),
Profissao VARCHAR(50),
Genero VARCHAR(20),
fk_Tratamento_ID INT,
FOREIGN KEY (fk_Tratamento_ID) REFERENCES Tratamento(ID_Tratamento));

INSERT INTO Personagem (ID_Personagem, Nome, Idade, Etnia, Profissao, Genero, fk_Tratamento_ID)
VALUES 
(1, 'Chris Washington', 27, 'Moreno', 'Fotógrafo', 'Masculino', 1);

SELECT * FROM Personagem;

CREATE TABLE Tratamento (
Nome_Tratamento VARCHAR(50),
ID_Tratamento INT PRIMARY KEY,
Descricao VARCHAR(255));

INSERT INTO Tratamento (ID_Tratamento, Nome_Tratamento, Descricao)
VALUES 
(1, 'Transplante Cerebral', 'Procedimento onde a mente de uma
pessoa branca é transplantada para o corpo de uma pessoa negra.');

SELECT * FROM Tratamento;

CREATE TABLE Familia (
ID_Familia INT PRIMARY KEY,
Nome_Familia VARCHAR(50));

INSERT INTO Familia (ID_Familia, Nome_Familia)
VALUES (1, 'Armitage');

SELECT * FROM Familia;

CREATE TABLE Contexto_Sociocultural (
Cultura VARCHAR(100),
Classe_Social VARCHAR(50),
Valores VARCHAR(100),
Etnia VARCHAR(30),
ID_Contexto INT PRIMARY KEY,
fk_Familia_ID INT,
fk_Personagem_ID INT,
FOREIGN KEY (fk_Familia_ID) REFERENCES Familia(ID_Familia),
FOREIGN KEY (fk_Personagem_ID) REFERENCES Personagem(ID_Personagem));

-- contexto sociocultural
INSERT INTO Contexto_Sociocultural (Cultura, Classe_Social, Valores, Etnia, ID_Contexto, fk_Familia_ID, fk_Personagem_ID)
VALUES 
('Cultura americana', 'Alta', 'Riqueza e supremacia branca', 'Negra', 1, 1, 1);

SELECT * FROM Contexto_Sociocultural;

-- membros da família 
CREATE TABLE MembroFamilia_Tem (
Parentesco_Familia VARCHAR(50),
fk_Personagem_ID INT,
fk_Familia_ID INT,
PRIMARY KEY (fk_Personagem_ID, fk_Familia_ID),
FOREIGN KEY (fk_Personagem_ID) REFERENCES Personagem(ID_Personagem),
FOREIGN KEY (fk_Familia_ID) REFERENCES Familia(ID_Familia)
);

-- botando os membros da família
INSERT INTO MembroFamilia_Tem (Parentesco_Familia, fk_Personagem_ID, fk_Familia_ID)
VALUES 
('Pai', 1, 1);  

SELECT * FROM MembroFamilia_Tem;

-- definindo restricao e relacoinamentos
ALTER TABLE Personagem
ADD CONSTRAINT FK_Personagem_Tratamento
FOREIGN KEY (fk_Tratamento_ID) REFERENCES Tratamento(ID_Tratamento)
ON DELETE CASCADE;

ALTER TABLE Contexto_Sociocultural
ADD CONSTRAINT FK_Contexto_Familia
FOREIGN KEY (fk_Familia_ID) REFERENCES Familia(ID_Familia)
ON DELETE RESTRICT;

ALTER TABLE Contexto_Sociocultural
ADD CONSTRAINT FK_Contexto_Personagem
FOREIGN KEY (fk_Personagem_ID) REFERENCES Personagem(ID_Personagem)
ON DELETE RESTRICT;

ALTER TABLE MembroFamilia_Tem
ADD CONSTRAINT FK_Membro_Personagem
FOREIGN KEY (fk_Personagem_ID) REFERENCES Personagem(ID_Personagem);

ALTER TABLE MembroFamilia_Tem
ADD CONSTRAINT FK_Membro_Familia
FOREIGN KEY (fk_Familia_ID) REFERENCES Familia(ID_Familia);
