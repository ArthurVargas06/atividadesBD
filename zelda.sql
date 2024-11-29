CREATE TABLE Personagem (
    Descricao CHAR(99),
    Afiliacao CHAR(30),
    ID_Personagem NUMERIC(10) PRIMARY KEY,
    Nome CHAR(30),
    fk_Locais_ID_Locais NUMERIC(10)
);

CREATE TABLE Item (
    Tipo CHAR(30),
    ID_Item NUMERIC(10) PRIMARY KEY,
    Efeito CHAR(10),
    Nome CHAR(10),
    Raridade CHAR(2)
);

CREATE TABLE Locais (
    Descricao CHAR(99),
    Nome CHAR(10),
    Tipo CHAR(10),
    ID_Locais NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Hilian (
    Velocidade CHAR(10),
    Super_Pulo CHAR(10),
    fk_Personagem_ID_Personagem NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Personagem_Item_Possui (
    Quantidade CHAR(10),
    fk_Personagem_ID_Personagem NUMERIC(10),
    fk_Item_ID_Item NUMERIC(10)
);

CREATE TABLE Zoro (
    Forca CHAR(10),
    Lanca_Pedras CHAR(10),
    fk_Personagem_ID_Personagem NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Goron (
    Magia CHAR(10),
    Lanca_Fogo CHAR(10),
    fk_Personagem_ID_Personagem NUMERIC(10) PRIMARY KEY
);

CREATE TABLE Relaciona (
    fk_Personagem_ID_Personagem NUMERIC(10),
    fk_Personagem_ID_Personagem_ NUMERIC(10),
    Tipo_De_Relacao CHAR(10)
);
 
ALTER TABLE Personagem ADD CONSTRAINT FK_Personagem_2
    FOREIGN KEY (fk_Locais_ID_Locais)
    REFERENCES Locais (ID_Locais)
    ON DELETE RESTRICT;
 
ALTER TABLE Hilian ADD CONSTRAINT FK_Hilian_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Personagem_Item_Possui ADD CONSTRAINT FK_Personagem_Item_Possui_1
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem);
 
ALTER TABLE Personagem_Item_Possui ADD CONSTRAINT FK_Personagem_Item_Possui_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Zoro ADD CONSTRAINT FK_Zoro_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Goron ADD CONSTRAINT FK_Goron_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Relaciona ADD CONSTRAINT FK_Relaciona_1
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Relaciona ADD CONSTRAINT FK_Relaciona_2
    FOREIGN KEY (fk_Personagem_ID_Personagem_)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE RESTRICT;