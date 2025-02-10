
CREATE TABLE Usuario (
    Email VARCHAR(30) UNIQUE,
    CPF CHAR(11) PRIMARY KEY,
    Senha VARCHAR(20)
);

CREATE TABLE Administrador (
    CPF CHAR(11) PRIMARY KEY,
    Senha VARCHAR(20),
    Email VARCHAR(30) UNIQUE,
    fk_Usuario_CPF CHAR(11),
    FOREIGN KEY (fk_Usuario_CPF) REFERENCES Usuario (CPF)
);

CREATE TABLE Cliente (
    Codigo_Cliente CHAR(11) PRIMARY KEY,
    Telefone CHAR(11) UNIQUE,
    Nome VARCHAR(50),
    Endereco VARCHAR(50),
    fk_Usuario_CPF CHAR(11),
    FOREIGN KEY (fk_Usuario_CPF) REFERENCES Usuario (CPF)
);

CREATE TABLE Reserva (
    Data_Pedido TIMESTAMP,
    Codigo_Reserva INTEGER PRIMARY KEY,
    Forma_Pagamento CHAR(5),
    Status CHAR(5),
    Tipo CHAR(5),
    fk_Cliente_Codigo_Cliente CHAR(11),
    FOREIGN KEY (fk_Cliente_Codigo_Cliente) REFERENCES Cliente (Codigo_Cliente)
);

CREATE TABLE Hospedagem (
    Preco DECIMAL,
    Codigo_Hospedagem INTEGER PRIMARY KEY,
    Hotel VARCHAR(20),
    Quantidade_Hospedes INTEGER,
    Tipo_Quarto CHAR(5),
    Descricao VARCHAR(255),
    Data_Ida DATETIME,
    Data_Volta DATETIME
);

CREATE TABLE Voo (
    Codigo_Passagem INTEGER PRIMARY KEY,
    Origem VARCHAR(20),
    Preco DECIMAL,
    Destino VARCHAR(20),
    Data_Ida DATETIME,
    Companhia VARCHAR(15),
    Maximo_Passageiros INTEGER,
    Data_Volta DATETIME
);

CREATE TABLE Cruzeiro (
    Codigo_Cruzeiro INTEGER PRIMARY KEY,
    Nome VARCHAR(20),
    Preco DECIMAL,
    Descricao VARCHAR(255),
    Origem VARCHAR(20),
    Destino VARCHAR(20),
    Tipo_Cabine CHAR(5)
);

CREATE TABLE Reserva_Voo (
    fk_Voo_Codigo_Passagem INTEGER,
    fk_Reserva_Codigo_Reserva INTEGER,
    FOREIGN KEY (fk_Voo_Codigo_Passagem) REFERENCES Voo (Codigo_Passagem),
    FOREIGN KEY (fk_Reserva_Codigo_Reserva) REFERENCES Reserva (Codigo_Reserva)
);

CREATE TABLE Reserva_Cruzeiro (
    fk_Cruzeiro_Codigo_Cruzeiro INTEGER,
    fk_Reserva_Codigo_Reserva INTEGER,
    FOREIGN KEY (fk_Cruzeiro_Codigo_Cruzeiro) REFERENCES Cruzeiro (Codigo_Cruzeiro),
    FOREIGN KEY (fk_Reserva_Codigo_Reserva) REFERENCES Reserva (Codigo_Reserva)
);

CREATE TABLE Reserva_Hospedagem (
    fk_Hospedagem_Codigo_Hospedagem INTEGER,
    fk_Reserva_Codigo_Reserva INTEGER,
    FOREIGN KEY (fk_Hospedagem_Codigo_Hospedagem) REFERENCES Hospedagem (Codigo_Hospedagem),
    FOREIGN KEY (fk_Reserva_Codigo_Reserva) REFERENCES Reserva (Codigo_Reserva)
);
