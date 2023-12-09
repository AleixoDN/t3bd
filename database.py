# Função para iniciar a conexão com a base de dados PostgreSQL
# Necessário substituir as credenciais abaixo para as do sistema Postgres do usuário

import psycopg2

def connect_to_db():
    try:
        conn = psycopg2.connect(
            host="localhost",
            database="postgres",
            user="postgres",
            password="password")
        return conn
    except psycopg2.Error as e:
        print('Erro ao se conectar ao PostgreSQL: ', e)
        return None