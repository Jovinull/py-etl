CREATE TABLE especialidades (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE medicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade_id INTEGER REFERENCES especialidades(id) ON DELETE SET NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F'))
);

CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15),
    email VARCHAR(100),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F'))
);

CREATE TABLE consultas (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER REFERENCES pacientes(id) ON DELETE CASCADE,
    medico_id INTEGER REFERENCES medicos(id) ON DELETE CASCADE,
    data_consulta TIMESTAMP NOT NULL,
    tipo_consulta VARCHAR(50),
    observacoes TEXT
);

CREATE TABLE agendas (
    id SERIAL PRIMARY KEY,
    medico_id INTEGER REFERENCES medicos(id) ON DELETE CASCADE,
    data_hora TIMESTAMP NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

CREATE TABLE exames (
    id SERIAL PRIMARY KEY,
    paciente_id INTEGER REFERENCES pacientes(id) ON DELETE CASCADE,
    tipo_exame VARCHAR(100) NOT NULL,
    data_exame DATE,
    resultado TEXT,
    observacoes TEXT
);

-- Inserir especialidades
INSERT INTO especialidades (nome) VALUES
('Cardiologia'),
('Dermatologia'),
('Pediatria'),
('Ginecologia'),
('Oftalmologia');

-- Inserir médicos
INSERT INTO medicos (nome, crm, especialidade_id, telefone, email, sexo) VALUES
('Dr. João Silva', 'CRM12345', 1, '11987654321', 'joao@saude.com', 'M'),
('Dra. Maria Oliveira', 'CRM67890', 2, '11976543210', 'maria@saude.com', 'F'),
('Dr. Carlos Pereira', 'CRM11223', 3, '11965432100', 'carlos@saude.com', 'M');

-- Inserir pacientes
INSERT INTO pacientes (nome, data_nascimento, cpf, endereco, telefone, email, sexo) VALUES
('Ana Souza', '1985-06-15', '12345678901', 'Rua A, 123, São Paulo', '11987654321', 'ana@exemplo.com', 'F'),
('Carlos Santos', '1992-11-22', '23456789012', 'Rua B, 456, São Paulo', '11976543210', 'carlos@exemplo.com', 'M');

-- Inserir agendas
INSERT INTO agendas (medico_id, data_hora, disponivel) VALUES
(1, '2024-11-20 10:00:00', TRUE),
(1, '2024-11-20 14:00:00', TRUE),
(2, '2024-11-21 09:00:00', TRUE),
(3, '2024-11-21 13:00:00', TRUE);

-- Inserir consultas
INSERT INTO consultas (paciente_id, medico_id, data_consulta, tipo_consulta, observacoes) VALUES
(1, 1, '2024-11-20 10:00:00', 'Consulta de rotina', 'Paciente com histórico familiar de hipertensão'),
(2, 3, '2024-11-21 13:00:00', 'Consulta pediátrica', 'Paciente com queixa de dor abdominal');

-- Inserir exames
INSERT INTO exames (paciente_id, tipo_exame, data_exame, resultado, observacoes) VALUES
(1, 'Eletrocardiograma', '2024-11-19', 'Normal', 'Sem alterações significativas'),
(2, 'Exame de sangue', '2024-11-18', 'Resultados pendentes', 'Aguardando resultados');
