import os
import csv
from db_connection import conectar_banco

def exportar_dados():
    pasta_csv = "database-csv"
    os.makedirs(pasta_csv, exist_ok=True)

    conexao = conectar_banco()
    cursor = conexao.cursor()

    try:
        cursor.execute("""
            SELECT table_name FROM information_schema.tables 
            WHERE table_schema = 'public'
        """)
        tabelas = cursor.fetchall()

        for tabela in tabelas:
            nome_tabela = tabela[0]
            cursor.execute(f"SELECT * FROM {nome_tabela}")
            dados = cursor.fetchall()

            colunas = [description[0] for description in cursor.description]

            caminho_arquivo_csv = os.path.join(pasta_csv, f"{nome_tabela}.csv")

            with open(caminho_arquivo_csv, mode='w', newline='', encoding='utf-8') as arquivo_csv:
                escritor_csv = csv.writer(arquivo_csv)
                escritor_csv.writerow(colunas)
                escritor_csv.writerows(dados)

    except Exception as e:
        print(f"Erro durante a exportação: {e}")
    finally:
        cursor.close()
        conexao.close()

    print("Dados exportados com sucesso!")
