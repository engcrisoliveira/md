import csv
import os
from dotenv import load_dotenv

load_dotenv()

from mysql.connector import Error, connect

try:
    conn = connect(
        host=os.getenv("HOST_REMOTO"),
        user=os.getenv("LOGIN_REMOTO"),
        password=os.getenv("SENHA_REMOTO"),
        database=os.getenv("DW_REMOTO")
    )
    cursor = conn.cursor()
    cursor.execute("DESCRIBE dimdeficiencia")
    data = cursor.fetchall()
    # data_list = [i[0] for i in data]
    # print(", ".join(data_list))
    # print(len(data_list))
    # os._exit(1)
except Exception as err:
    print(err)
    os._exit(1)
# Lê o arquivo CSV e cria as queries

queries = []

with open('tabelas_em_csv/tabela_dimdeficiencia.csv', encoding="utf8") as csv_file: # caminho para o arquivo CSV
    csv_reader = csv.reader(csv_file, delimiter=';')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are {", ".join(row)}')
            line_count += 1
        elif line_count == 1:
            query = f"""INSERT INTO dimdeficiencia (`key`, id_aluno, deficiencia_auditiva, deficiencia_fisica, deficiencia_intelectual, deficiencia_multipla, deficiencia_surdez, deficiencia_surdocegueira, deficiencia_baixa_visao, deficiencia_cegueira, deficiencia_superdotacao, deficiencia_tgd_autismo, deficiencia_tgd_sindrome_asperger, deficiencia_tgd_sindrome_rett, deficiencia_tgd_transtor_desintegrativo) VALUES ({row[0]}, {row[1]}, {row[2]}, {row[3]}, {row[4]}, {row[5]}, {row[6]}, {row[7]}, {row[8]}, {row[9]}, {row[10]}, {row[11]}, {row[12]}, {row[13]}, {row[14]})"""
            line_count += 1
        else:
            query += f""", ({row[0]}, {row[1]}, {row[2]}, {row[3]}, {row[4]}, {row[5]}, {row[6]}, {row[7]}, {row[8]}, {row[9]}, {row[10]}, {row[11]}, {row[12]}, {row[13]}, {row[14]})"""
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
        database=os.getenv("DW_REMOTO")
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