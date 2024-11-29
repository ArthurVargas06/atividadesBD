CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome_Usuario Char(7),
    Email Char(20),
    Endereco Char(13),
    Senha Char(8),
    Data_Nascimento DATE,
    Data_Criacao_Conta DATE,
    Ranking Char(20),
    Pontuacao_Rank INT,
    Posicao_Ranking INT
);

CREATE TABLE Rocket_League (
    ID_Jogo INT PRIMARY KEY,
    ID_Usuario INT,
    Data_Lancamento DATE,
    Preco INT,
    Categoria Char(12),
    Item Char(9)
);

CREATE TABLE Partida (
    ID_Partida INT PRIMARY KEY,
    ID_Jogo INT,
    ID_Usuario INT,
    ID_Ranking INT,
    Pontuacao_Jogo INT,
    Tempo_Jogo INT,
    Placar_Jogo INT,
    Arena Char(12),
    Tipo_De_Partida Char(10),
    Data_Partida DATE,
    Replay INT,
    Torneio Char(10)
);

CREATE TABLE Ranking (
    ID_Ranking INT PRIMARY KEY,
    ID_Partida INT,
    ID_Usuario INT,
    ID_Jogo INT,
    Bronze INT,
    Prata INT,
    Ouro INT,
    Platina INT,
    Diamante INT,
    Campeao INT,
    Grande_Campeao INT,
    Lenda_Supersonica INT,
    Pontuacao_Rank INT,
    Posicao_Ranking INT
);
 
ALTER TABLE Rocket_League ADD CONSTRAINT FK_Rocket_League_2
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Partida ADD CONSTRAINT FK_Partida_2
    FOREIGN KEY (ID_Jogo)
    REFERENCES Rocket_League (ID_Jogo);
 
ALTER TABLE Partida ADD CONSTRAINT FK_Partida_3
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Partida ADD CONSTRAINT FK_Partida_4
    FOREIGN KEY (ID_Ranking)
    REFERENCES Ranking (ID_Ranking);
 
ALTER TABLE Ranking ADD CONSTRAINT FK_Ranking_2
    FOREIGN KEY (ID_Partida)
    REFERENCES Partida (ID_Partida);
 
ALTER TABLE Ranking ADD CONSTRAINT FK_Ranking_3
    FOREIGN KEY (ID_Jogo)
    REFERENCES Rocket_League (ID_Jogo);
 
ALTER TABLE Ranking ADD CONSTRAINT FK_Ranking_4
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID_Usuario);