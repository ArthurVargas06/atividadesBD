CREATE TABLE Genero (
    ID_genero INT PRIMARY KEY,
    Nome_do_genero Char (26),
    Descricao Char (50)
);

CREATE TABLE Episodio (
    ID_episodio INT  PRIMARY KEY,
    Duracao_episodio Char (30),
    Sinopse_episodio Char (35),
    fk_Serie_fk_Conteudo_ID_conteudo INT 
);

CREATE TABLE Avaliacao (
    ID_avaliacao INT  PRIMARY KEY,
    Nota INT ,
    Comentario Char (100),
    Data_avaliacao INT ,
    fk_Usuario_ID_usuario INT 
);

CREATE TABLE Assinaturas (
    ID_assinatura INT  PRIMARY KEY,
    Tipo_de_plano Char (15),
    Data_inicio INT ,
    Status Char (20),
    Pagamento Char (20),
    Valor_mensal Char (15),
    fk_Usuario_ID_usuario INT 
);

CREATE TABLE Legenda (
    ID_legenda INT  PRIMARY KEY,
    Idioma Char (25),
    Fonte Char (30),
    fk_Conteudo_ID_conteudo INT 
);

CREATE TABLE Usuario (
    ID_usuario INT  PRIMARY KEY,
    Email Char (25),
    Senha Char (25),
    Nome Char (40),
    Data_de_nascimento INT 
);

CREATE TABLE Conteudo (
    ID_conteudo INT  PRIMARY KEY,
    Duracao Char (10),
    Tipo_de_conteudo Char (12),
    Trailer Char (50)
);

CREATE TABLE Filme (
    tipo_filme Char (16),
    Duracao_filme Char (27),
    fk_Conteudo_ID_conteudo INT  PRIMARY KEY
);

CREATE TABLE Serie (
    Temporada INT ,
    fk_Conteudo_ID_conteudo INT  PRIMARY KEY
);

CREATE TABLE Vizualizacao_Assiste (
    fk_Usuario_ID_usuario INT ,
    fk_Conteudo_ID_conteudo INT 
);

CREATE TABLE E__Assoc__1_vera (
    fk_Usuario_ID_usuario INT ,
    fk_Conteudo_ID_conteudo INT 
);

CREATE TABLE Tem1 (
    fk_Genero_ID_genero INT ,
    fk_Conteudo_ID_conteudo INT 
);

CREATE TABLE Tem2 (
    fk_Conteudo_ID_conteudo INT ,
    fk_Avaliacao_ID_avaliacao INT 
);
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Serie_fk_Conteudo_ID_conteudo)
    REFERENCES Serie (fk_Conteudo_ID_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_2
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Assinaturas ADD CONSTRAINT FK_Assinaturas_2
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Legenda ADD CONSTRAINT FK_Legenda_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Vizualizacao_Assiste ADD CONSTRAINT FK_Vizualizacao_Assiste_1
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario);
 
ALTER TABLE Vizualizacao_Assiste ADD CONSTRAINT FK_Vizualizacao_Assiste_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo);
 
ALTER TABLE E__Assoc__1_vera ADD CONSTRAINT FK_E__Assoc__1_vera_1
    FOREIGN KEY (fk_Usuario_ID_usuario)
    REFERENCES Usuario (ID_usuario);
 
ALTER TABLE E__Assoc__1_vera ADD CONSTRAINT FK_E__Assoc__1_vera_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo);
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Genero_ID_genero)
    REFERENCES Genero (ID_genero)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Conteudo_ID_conteudo)
    REFERENCES Conteudo (ID_conteudo)
    ON DELETE SET NULL;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Avaliacao_ID_avaliacao)
    REFERENCES Avaliacao (ID_avaliacao)
    ON DELETE SET NULL;