CREATE DATABASE ELEIÇÃO;
USE ELEIÇÃO;

CREATE TABLE Localidade (
    nome_localidade INTEGER,
    id_localidade INTEGER PRIMARY KEY
);

CREATE TABLE Zona (
    id_zona INTEGER PRIMARY KEY,
    num_zona INTEGER,
    fk_Localidade_id_localidade INTEGER
);

CREATE TABLE Secoes (
    id_secoes INTEGER PRIMARY KEY,
    num_secoes INTEGER
);

CREATE TABLE Eleitor (
    id_eleitor INTEGER PRIMARY KEY,
    nome_eleitor INTEGER,
    titulo_eleitor INTEGER
);

CREATE TABLE Candidato (
    id_candidato INTEGER PRIMARY KEY,
    id_partido INTEGER,
    id_cargo INTEGER,
    nome INTEGER,
    num_candidato INTEGER
);

CREATE TABLE Partido (
    id_partido INTEGER PRIMARY KEY,
    nome_partido INTEGER,
    SIGLA INTEGER,
    fk_Candidato_id_candidato INTEGER,
    fk_cargo_id_cargo INTEGER
);

CREATE TABLE cargo (
    id_cargo INTEGER PRIMARY KEY,
    nome_cargo INTEGER,
    fk_apuracao_id_apuracao INTEGER
);

CREATE TABLE apuracao (
    id_apuracao INTEGER PRIMARY KEY,
    resultados_apurados INTEGER
);

CREATE TABLE pertence (
    fk_Zona_id_zona INTEGER,
    fk_Secoes_id_secoes INTEGER
);

CREATE TABLE consta (
    fk_Secoes_id_secoes INTEGER,
    fk_Eleitor_id_eleitor INTEGER
);

CREATE TABLE vota (
    fk_Eleitor_id_eleitor INTEGER,
    fk_Candidato_id_candidato INTEGER
);

CREATE TABLE ocorre (
    fk_Secoes_id_secoes INTEGER,
    fk_apuracao_id_apuracao INTEGER
);
 
ALTER TABLE Zona ADD CONSTRAINT FK_Zona_2
    FOREIGN KEY (fk_Localidade_id_localidade)
    REFERENCES Localidade (id_localidade)
    ON DELETE CASCADE;
 
ALTER TABLE Partido ADD CONSTRAINT FK_Partido_2
    FOREIGN KEY (fk_Candidato_id_candidato)
    REFERENCES Candidato (id_candidato)
    ON DELETE RESTRICT;
 
ALTER TABLE Partido ADD CONSTRAINT FK_Partido_3
    FOREIGN KEY (fk_cargo_id_cargo)
    REFERENCES cargo (id_cargo)
    ON DELETE RESTRICT;
 
ALTER TABLE cargo ADD CONSTRAINT FK_cargo_2
    FOREIGN KEY (fk_apuracao_id_apuracao)
    REFERENCES apuracao (id_apuracao)
    ON DELETE RESTRICT;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_1
    FOREIGN KEY (fk_Zona_id_zona)
    REFERENCES Zona (id_zona)
    ON DELETE RESTRICT;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_2
    FOREIGN KEY (fk_Secoes_id_secoes)
    REFERENCES Secoes (id_secoes)
    ON DELETE RESTRICT;
 
ALTER TABLE consta ADD CONSTRAINT FK_consta_1
    FOREIGN KEY (fk_Secoes_id_secoes)
    REFERENCES Secoes (id_secoes)
    ON DELETE RESTRICT;
 
ALTER TABLE consta ADD CONSTRAINT FK_consta_2
    FOREIGN KEY (fk_Eleitor_id_eleitor)
    REFERENCES Eleitor (id_eleitor)
    ON DELETE RESTRICT;
 
ALTER TABLE vota ADD CONSTRAINT FK_vota_1
    FOREIGN KEY (fk_Eleitor_id_eleitor)
    REFERENCES Eleitor (id_eleitor)
    ON DELETE RESTRICT;
 
ALTER TABLE vota ADD CONSTRAINT FK_vota_2
    FOREIGN KEY (fk_Candidato_id_candidato)
    REFERENCES Candidato (id_candidato)
    ON DELETE RESTRICT;
 
ALTER TABLE ocorre ADD CONSTRAINT FK_ocorre_1
    FOREIGN KEY (fk_Secoes_id_secoes)
    REFERENCES Secoes (id_secoes)
    ON DELETE RESTRICT;
 
ALTER TABLE ocorre ADD CONSTRAINT FK_ocorre_2
    FOREIGN KEY (fk_apuracao_id_apuracao)
    REFERENCES apuracao (id_apuracao)
    ON DELETE SET NULL;