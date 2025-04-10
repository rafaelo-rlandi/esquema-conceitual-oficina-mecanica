use oficina;

-- Inserções na tabela Cliente
INSERT INTO Cliente (Telefone, Nome, Email, CPF, Endereco) VALUES
('84999112233', 'Carlos Silva', 'carlos.silva@email.com', '12345678901', 'Rua das Flores, 100'),
('84999112234', 'Ana Oliveira', 'ana.oliveira@email.com', '23456789012', 'Avenida Brasil, 200'),
('84999112235', 'João Souza', 'joao.souza@email.com', '34567890123', 'Rua das Palmeiras, 300'),
('84999112236', 'Mariana Costa', 'mariana.costa@email.com', '45678901234', 'Praça Central, 400'),
('84999112237', 'Pedro Rocha', 'pedro.rocha@email.com', '56789012345', 'Vila Nova, 500'),
('84999112238', 'Luciana Lima', 'luciana.lima@email.com', '67890123456', 'Beco das Rosas, 600'),
('84999112239', 'Rafael Santos', 'rafael.santos@email.com', '78901234567', 'Alameda Verde, 700'),
('84999112240', 'Fernanda Almeida', 'fernanda.almeida@email.com', '89012345678', 'Condomínio Azul, 800'),
('84999112241', 'Gustavo Pereira', 'gustavo.pereira@email.com', '90123456789', 'Centro Comercial, 900'),
('84999112242', 'Beatriz Mendes', 'beatriz.mendes@email.com', '01234567890', 'Rua da Paz, 1000');

-- Inserções na tabela Veiculo
INSERT INTO Veiculo (Placa, Modelo, Ano, Marca, Cliente_id) VALUES
('ABC1234', 'Civic', 2018, 'Honda', 1),
('DEF5678', 'Corolla', 2019, 'Toyota', 2),
('GHI9012', 'Focus', 2020, 'Ford', 3),
('JKL3456', 'Cruze', 2021, 'Chevrolet', 4),
('MNO7890', 'Golf', 2017, 'Volkswagen', 5),
('PQR1234', 'HB20', 2016, 'Hyundai', 6),
('STU5678', 'Onix', 2022, 'Chevrolet', 7),
('VWX9012', 'Uno', 2015, 'Fiat', 8),
('YZA3456', 'Palio', 2014, 'Fiat', 9),
('BCD7890', 'Corsa', 2013, 'Chevrolet', 10);

-- Inserções na tabela Autorizacao
INSERT INTO Autorizacao (DataAut, Aprovado) VALUES
('2025-01-10', 'Sim'),
('2025-01-12', 'Não'),
('2025-02-15', 'Sim'),
('2025-03-01', 'Sim'),
('2025-03-05', 'Não'),
('2025-04-10', 'Sim'),
('2025-04-15', 'Sim'),
('2025-05-20', 'Não'),
('2025-05-25', 'Sim'),
('2025-06-01', 'Sim');

-- Inserções na tabela OrdemServico
INSERT INTO OrdemServico (DataEmissao, Status, DataConclusao, Veiculo_id, Cliente_id, Tipo, Valor, Aut_id) VALUES
('2025-01-10', 'Aberto', '2025-01-15', 1, 1, 'Revisão', 200.00, 1),
('2025-01-12', 'Cancelado', '2025-01-20', 2, 2, 'Reparo', 350.50, 2),
('2025-02-15', 'Concluído', '2025-02-20', 3, 3, 'Instalação', 500.75, 3),
('2025-03-01', 'Aberto', '2025-03-10', 4, 4, 'Reparo', 150.30, 4),
('2025-03-05', 'Concluído', '2025-03-07', 5, 5, 'Revisão', 250.90, 5),
('2025-04-10', 'Aberto', '2025-04-20', 6, 6, 'Instalação', 400.00, 6),
('2025-04-15', 'Concluído', '2025-04-25', 7, 7, 'Revisão', 300.40, 7),
('2025-05-20', 'Cancelado', '2025-05-30', 8, 8, 'Reparo', 180.10, 8),
('2025-05-25', 'Concluído', '2025-06-05', 9, 9, 'Instalação', 600.00, 9),
('2025-06-01', 'Aberto', '2025-06-10', 10, 10, 'Revisão', 500.00, 10);

-- Inserções na tabela Peca
INSERT INTO Peca (DescPeca, Preco, Estoque) VALUES
('Filtro de Óleo', 50.00, 20),
('Pastilha de Freio', 120.00, 15),
('Correia Dentada', 200.00, 10),
('Velas de Ignição', 80.00, 25),
('Bateria', 400.00, 8),
('Amortecedor', 350.00, 12),
('Disco de Freio', 300.00, 9),
('Radiador', 500.00, 5),
('Pneus', 800.00, 20),
('Filtro de Combustível', 40.00, 30);

-- Inserções na tabela Ordem_has_Peca
INSERT INTO Ordem_has_Peca (Ordem_id, Peca_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);

-- Inserções na tabela Servico
INSERT INTO Servico (DescServico, TempoEst, Valor) VALUES
('Troca de Óleo', '00:30:00', 50.00),
('Alinhamento', '01:00:00', 100.00),
('Balanceamento', '01:00:00', 100.00),
('Revisão Completa', '03:00:00', 300.00),
('Troca de Freios', '02:00:00', 150.00),
('Troca de Pneus', '01:30:00', 200.00),
('Manutenção do Motor', '04:00:00', 500.00),
('Troca do Filtro de Ar', '00:45:00', 70.00),
('Troca da Correia', '02:30:00', 250.00),
('Reparo Elétrico', '02:00:00', 180.00);

-- Inserções na tabela Ordem_has_Servico
INSERT INTO Ordem_has_Servico (Ordem_id, Servico_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);



-- 1. Recuperações Simples
SELECT * FROM Cliente;
SELECT Nome, Email FROM Cliente;

-- 2. Filtros com WHERE
SELECT * FROM Veiculo WHERE Ano >= 2020;
SELECT * FROM OrdemServico WHERE Valor > 300;

-- 3. Atributos Derivados
SELECT idOrdem, Valor, Valor * 1.10 AS ValorComImposto FROM OrdemServico;
SELECT idPeca, DescPeca, Estoque * Preco AS ValorTotalEstoque FROM Peca;

-- 4. Ordenação de Dados
SELECT * FROM Cliente ORDER BY Nome ASC;
SELECT * FROM OrdemServico ORDER BY Valor DESC;

-- 5. Filtros com HAVING
SELECT idPeca, DescPeca, SUM(Estoque * Preco) AS ValorTotal
FROM Peca
GROUP BY idPeca, DescPeca
HAVING ValorTotal > 1000;

SELECT Cliente_id, COUNT(*) AS NumeroVeiculos
FROM Veiculo
GROUP BY Cliente_id
HAVING NumeroVeiculos > 1;

-- 6. Junções
SELECT os.idOrdem, os.DataEmissao, c.Nome AS NomeCliente
FROM OrdemServico os
JOIN Cliente c ON os.Cliente_id = c.idCliente;

SELECT v.Placa, v.Modelo, os.idOrdem, os.Status
FROM Veiculo v
JOIN OrdemServico os ON v.idVeiculo = os.Veiculo_id;

SELECT p.DescPeca, ohp.Ordem_id, p.Preco
FROM Ordem_has_Peca ohp
JOIN Peca p ON ohp.Peca_id = p.idPeca;









