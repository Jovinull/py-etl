# Projeto de Banco de Dados Médico

## Descrição
Este projeto tem como objetivo gerenciar as informações de médicos, pacientes, consultas, agendas e exames de uma clínica médica. Utiliza PostgreSQL para o banco de dados e Python para a exportação dos dados em formato CSV.

## Estrutura do Projeto
O projeto é composto pelos seguintes arquivos:

- `wmsaude.sql`: Script SQL para criação das tabelas e inserção de dados iniciais.
- `db_connection.py`: Script Python para conectar ao banco de dados PostgreSQL.
- `data_export.py`: Script Python para exportar os dados das tabelas para arquivos CSV.
- `main.py`: Script Python principal para agendamento da tarefa de exportação.
- `requirements.txt`: Arquivo de requisitos com as dependências do projeto.

## Requisitos
Os seguintes pacotes Python são necessários para executar os scripts:
- psycopg2==2.9.10
- schedule==1.2.2

Para instalá-los, execute:
```bash
pip install -r requirements.txt
