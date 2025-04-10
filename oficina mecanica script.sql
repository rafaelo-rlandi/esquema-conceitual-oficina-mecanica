
create database oficina;
-- criando a base de dados que se usara 

use oficina;

-- Tabela para armazenar informações dos clientes.
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Telefone VARCHAR(15),
    Nome VARCHAR(100),
    Email VARCHAR(100),
    CPF CHAR(11) UNIQUE, 
    Endereco VARCHAR(200)
) ENGINE=InnoDB;

-- Comentários para a tabela Cliente:
-- idCliente     - Identificador único do cliente.
-- Telefone      - Telefone do cliente.
-- Nome          - Nome completo do cliente.
-- Email         - Endereço eletrônico do cliente.
-- CPF           - Documento nacional de identificação (11 dígitos). Não pode se repetir.
-- Endereco      - Endereço físico do cliente.

-- Tabela para armazenar informações sobre veículos.
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa CHAR(8) UNIQUE,
    Modelo VARCHAR(50),
    Ano INT(4),
    Marca VARCHAR(50),
    Cliente_id INT,
    FOREIGN KEY (Cliente_id) REFERENCES Cliente(idCliente)
) ENGINE=InnoDB;

-- Comentários para a tabela Veiculo:
-- idVeiculo     - Identificador único do veículo.
-- Placa         - Placa do veículo no padrão nacional. Não pode se repetir.
-- Modelo        - Modelo do veículo.
-- Ano           - Ano de fabricação.
-- Marca         - Marca do fabricante.
-- Cliente_id    - Relaciona o veículo a um cliente.

-- Tabela para armazenar autorizações de serviço.
CREATE TABLE Autorizacao (
    idAut INT AUTO_INCREMENT PRIMARY KEY,
    DataAut DATE,
    Aprovado ENUM('Sim', 'Não')
) ENGINE=InnoDB;

-- Comentários para a tabela Autorizacao:
-- idAut         - Identificador da autorização.
-- DataAut       - Data de autorização.
-- Aprovado      - Indica se a autorização foi concedida.

-- Tabela para registrar ordens de serviço.
CREATE TABLE OrdemServico (
    idOrdem INT AUTO_INCREMENT PRIMARY KEY,
    DataEmissao DATE,
    Status ENUM('Aberto', 'Concluído', 'Cancelado'),
    DataConclusao DATE,
    Veiculo_id INT,
    Cliente_id INT,
    Tipo ENUM('Revisão', 'Reparo', 'Instalação'),
    Valor DECIMAL(10,2),
    Aut_id INT,
    FOREIGN KEY (Veiculo_id) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (Cliente_id) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Aut_id) REFERENCES Autorizacao(idAut)
) ENGINE=InnoDB;

-- Comentários para a tabela OrdemServico:
-- idOrdem       - Identificador único da ordem.
-- DataEmissao   - Data de emissão da ordem.
-- Status        - Status atual da ordem.
-- DataConclusao - Data estimada para término.
-- Veiculo_id    - Relaciona a ordem ao veículo.
-- Cliente_id    - Relaciona a ordem ao cliente.
-- Tipo          - Tipo do serviço prestado.
-- Valor         - Custo total do serviço.
-- Aut_id        - Relaciona uma autorização à ordem.

-- Tabela para gerenciar peças no estoque.
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    DescPeca VARCHAR(100),
    Preco DECIMAL(10,2),
    Estoque INT
) ENGINE=InnoDB;

-- Comentários para a tabela Peca:
-- idPeca        - Identificador único da peça.
-- DescPeca      - Detalhes ou descrição da peça.
-- Preco         - Preço unitário.
-- Estoque       - Quantidade em estoque.

-- Tabela para associar peças e ordens de serviço.
CREATE TABLE Ordem_has_Peca (
    Ordem_id INT,
    Peca_id INT,
    PRIMARY KEY (Ordem_id, Peca_id),
    FOREIGN KEY (Ordem_id) REFERENCES OrdemServico(idOrdem),
    FOREIGN KEY (Peca_id) REFERENCES Peca(idPeca)
) ENGINE=InnoDB;

-- Comentários para a tabela Ordem_has_Peca:
-- Ordem_id      - Relaciona à ordem de serviço.
-- Peca_id       - Relaciona à peça utilizada.
-- PRIMARY KEY   - Composta pelas duas colunas.
-- Chave estrangeira para OrdemServico.
-- Chave estrangeira para Peca.

-- Tabela para gerenciar tipos de serviços prestados.
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    DescServico VARCHAR(100),
    TempoEst TIME,
    Valor DECIMAL(10,2)
) ENGINE=InnoDB;

-- Comentários para a tabela Servico:
-- idServico     - Identificador único do serviço.
-- DescServico   - Descrição detalhada do serviço.
-- TempoEst      - Tempo estimado para execução.
-- Valor         - Valor do serviço.

-- Tabela para associar ordens de serviço e serviços realizados.
CREATE TABLE Ordem_has_Servico (
    Ordem_id INT,
    Servico_id INT,
    PRIMARY KEY (Ordem_id, Servico_id),
    FOREIGN KEY (Ordem_id) REFERENCES OrdemServico(idOrdem),
    FOREIGN KEY (Servico_id) REFERENCES Servico(idServico)
) ENGINE=InnoDB;

-- Comentários para a tabela Ordem_has_Servico:
-- Ordem_id      - Identifica a ordem relacionada.
-- Servico_id    - Identifica o serviço relacionado.
-- PRIMARY KEY   - Composta pelas duas colunas.
-- Chave estrangeira para OrdemServico.
-- Chave estrangeira para Servico.
