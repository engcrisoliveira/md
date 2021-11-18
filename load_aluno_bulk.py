import csv
import os
from dotenv import load_dotenv

load_dotenv()

from mysql.connector import Error, connect

# Lê o arquivo CSV e cria as queries

queries = []

with open('tabelas_em_csv/tabela_aluno.csv', encoding="utf8") as csv_file: # caminho para o arquivo CSV
    csv_reader = csv.reader(csv_file, delimiter=';')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        elif line_count == 1:
            query = f"""INSERT INTO aluno (id_aluno, cod_ies, raca, origem, genero, idade) VALUES ("{row[0]}", "{row[1]}", "{row[2]}", "{row[3]}", "{row[4]}", "{row[5]}")"""
            line_count += 1
        else:
            query += f""", ("{row[0]}", "{row[1]}", "{row[2]}", "{row[3]}", "{row[4]}", "{row[5]}")"""
            line_count += 1
    queries.append(query)
    print(f'Processed {line_count} lines.')

print("Queries: ", len(queries))

# Execução das queries

try:
    with connect(
        host=os.getenv("HOST_REMOTO"),
        user=os.getenv("LOGIN_REMOTO"),
        password=os.getenv("SENHA_REMOTO"),
        database=os.getenv("DATABASE_REMOTO")
    ) as connection:
        count = 0
        for query in queries:
            connection.cursor().execute(query)
            count += 1
            print(f"Executed queries: {count}")
        connection.commit()
        print(connection)
except Error as e:
    print(e)