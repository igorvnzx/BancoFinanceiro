
CREATE DATABASE BancoFinanceiro;
USE BancoFinanceiro;
CREATE TABLE Cliente(
cod_cliente int PRIMARY KEY,
cliente varchar(100) NOT NULL,
profissao varchar(100),
localidade varchar(100)
);
CREATE TABLE Agencia(
cod_agencia int PRIMARY KEY,
agencia varchar(100) NOT NULL,
localidade varchar(100)
);
CREATE TABLE Conta(
num_conta int PRIMARY KEY,
tipo_conta varchar(50),
cod_cliente int,
cod_agencia int,
saldo decimal(15,2),
FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
FOREIGN KEY (cod_agencia) REFERENCES Agencia(cod_agencia)
);
CREATE TABLE Emprestimo(
num_emprestimo int PRIMARY KEY,
cod_cliente int,
cod_agencia int,
valor decimal(15,2),
FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente),
FOREIGN KEY (cod_agencia) REFERENCES Agencia(cod_agencia)
);
INSERT INTO cliente (cliente, profissao, localidade, cod_cliente)
VALUES ('João Martins', 'Motorista', 'Limoeiro','1234'),
       ('Pedro Lima', 'Atleta', 'Recife','5677'),
       ('Maria Fernanda', 'Atleta', 'Vitoria de Santo Antão','6788');
INSERT INTO Agencia (cod_agencia, agencia, localidade)
VALUES ('123', 'Brasil','Recife'),
       ('234', 'Bradesco', 'Limoeiro'),
       ('456', 'Itau', 'Vitoria de Santo Antão');
INSERT INTO Conta (num_conta, tipo_conta, cod_cliente, cod_agencia)
VALUES ('098','corrente','1234','123'),
	   ('765','corrente','5677','234'),
       ('432', 'poupança', '6788','456');
	
INSERT INTO Emprestimo (num_emprestimo,cod_cliente,cod_agencia,valor)
VALUES ('1', '1234', '123', '2500,00'),
       ('2', '5677', '234', '3400,80'),
       ('3', '6788', '456', '1679,80'); 

SELECT cod_cliente, cliente FROM Cliente;

SELECT cod_cliente, cliente FROM Cliente WHERE localidade = 'Recife';

SELECT c.cod_cliente, c.cliente 
FROM Cliente c
JOIN Conta co ON c.cod_cliente = co.cod_cliente
WHERE co.cod_agencia = 123;

SELECT DISTINCT c.cod_cliente, c.cliente 
FROM Cliente c
JOIN Agencia a ON c.localidade = a.localidade;

SELECT c.cod_cliente, c.cliente 
FROM Cliente c
JOIN Conta co ON c.cod_cliente = co.cod_cliente
JOIN Agencia a ON co.cod_agencia = a.cod_agencia
WHERE c.localidade = a.localidade;

SELECT c.cod_cliente, c.cliente 
FROM Cliente c
JOIN Emprestimo e ON c.cod_cliente = e.cod_cliente
WHERE e.valor > 2000.00;

SELECT c.cliente 
FROM Cliente c
WHERE c.profissao = (SELECT profissao FROM Cliente WHERE cod_cliente = 1234);

SELECT cod_cliente, cliente 
FROM Cliente 
WHERE cliente = 'João';

SELECT COUNT(DISTINCT c.cod_cliente) 
FROM Cliente c
JOIN Conta co ON c.cod_cliente = co.cod_cliente
WHERE co.cod_agencia = 123;

