import psycopg2

def conectar_banco():
    try:
        conexao = psycopg2.connect(
            database="wmsaude",
            host="localhost",
            user="postgres",
            password="admin",
            port="5432"
        )
        return conexao
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        raise
