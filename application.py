# Funções principais para a aplicação, executada em main.py

import aux_functions as aux
from interface import Interface
from database import connect_to_db

conn = connect_to_db() # Conectar à base de dados PostegreSQL

# ----------------

class Sistema():
    def __init__(self, reset = False) -> None:
        self.i = Interface()
        self.m_main = True
        if reset:
            with conn.cursor() as cursor:
                cursor.execute(open('drop_all.pgsql', 'r').read())
                cursor.execute(open('esquema.pgsql', 'r').read())
                cursor.execute(open('dados.pgsql', 'r').read())
                conn.commit()
        while self.m_main:
            self.main_menu()
        conn.close()
    
    # MENUS

    def main_menu(self):
        print(self.i.main_menu, end='')
        try:
            inp = int(input())
        except ValueError:
            inp = -1

        while inp not in range(5): # Invalido
            try:
                inp = int(input(self.i.error_input))
            except ValueError:
                inp = -1

        if inp == 0: # Fechar o menu
            self.m_main = False
            print('\nAte mais!\n')
            return

        elif inp == 1: # Sistemas e corpos celestes
            self.m_sistemas = True
            while self.m_sistemas:
                self.admin_sistemas_menu()
        
        elif inp in range(2,5):
            aux.in_progress()
            return


    def admin_sistemas_menu(self):
        print(self.i.admin_sistemas_menu, end='')
        try:
            inp = int(input())
        except ValueError:
            inp = -1

        while inp not in range(7): # Invalido
            try:
                inp = int(input(self.i.error_input))
            except ValueError:
                inp = -1

        if inp == 0: # Fechar o menu
            self.m_sistemas = False
            return

        elif inp == 1: # Inserir sistema
            self.insert_sistema()
        elif inp == 2: # Inserir corpo celeste
            self.insert_corpo_celeste()
        elif inp == 3: # Buscar sistema/estrela
            self.search_sistema_estrela()
        elif inp == 4: # Buscar planeta
            self.search_planeta()
        elif inp == 5: # Buscar satelite
            self.search_asteroide()
        elif inp == 6: # Buscar asteroide
            self.search_asteroide()


    # SISTEMAS E CORPOS CELESTES

    def insert_sistema(self):
        insert = input(self.i.admin_ins_sistema)
        try:
            x, y, nome = insert.split(',')
            x, y = float(x.strip()), float(y.strip())
        except ValueError:
            print('\nErro no input. Por favor, tente novamente.\n')
            _ = input('Pressione Enter para retornar.')
            return
        if not aux.validate_numeric(x, 8, 2) or not aux.validate_numeric(y, 8, 2):
            print('\nCoordenadas excedem precisao (8) ou escala (2) permitida. Tente novamente.\n')
            _ = input('Pressione Enter para retornar.')
            return
        nome = nome.strip()
        with conn.cursor() as cursor:
            cursor.execute('''INSERT INTO SISTEMA (COORDENADA_X, COORDENADA_Y, NOME) 
                           VALUES (%s, %s, %s);''', (x, y, nome))
            conn.commit()
        
        print('\nSistema inserido com sucesso!\n')
        _ = input('Pressione Enter para retornar.')
        

    def insert_corpo_celeste(self):
        insert = input(self.i.admin_ins_corpo_celeste_1).upper().strip()
        if insert in ['E', 'ESTRELA']:

            estrela = input(self.i.admin_ins_estrela_1)
            try:
                nome, categ = estrela.split(',')
            except ValueError:
                print('\nErro no input. Por favor, tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            nome, categ = nome.strip(), categ.upper().strip()
            if len(nome) > 29:
                print('\nNome deve ter menos de 30 caracteres. Tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            if len(nome) < 1:
                print('\nPor favor, insira um nome valido. Tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            if categ not in ['O', 'B', 'A', 'F', 'G', 'K', 'M']:
                print('\nCategoria invalida para estrela. Tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            
            sistema = input(self.i.admin_ins_estrela_2)
            if ',' in sistema: # Pesquisando pelas coordenadas
                try:
                    x, y = sistema.split(',')
                    x, y = float(x.strip()), float(y.strip())
                except ValueError:
                    print('\nErro no input. Por favor, tente novamente.\n')
                    _ = input('Pressione Enter para retornar.')
                    return
                with conn.cursor() as cursor:
                    cursor.execute('''SELECT COORDENADA_X, COORDENADA_Y FROM 
                                   SISTEMA WHERE COORDENADA_X = %s AND COORDENADA_Y = %s;''', (x, y))
                    results = cursor.fetchall()
            else: # Pesquisando pelo nome
                sistema = sistema.strip()
                with conn.cursor() as cursor:
                    cursor.execute('''SELECT COORDENADA_X, COORDENADA_Y FROM 
                                   SISTEMA WHERE NOME = %s;''', (sistema,))
                    results = cursor.fetchall()
            if len(results) == 0:
                print('\nNao foi encontrado sistema com esses dados.\nPor favor, tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            x, y = results[0][0], results[0][1]
            
            estrela = input(self.i.admin_ins_corpo_celeste_2)
            try:
                massa, raio = estrela.split(',')
                massa, raio = float(massa.strip()), float(raio.strip())
            except ValueError:
                print('\nErro no input. Por favor, tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            if not aux.validate_numeric(massa, 38, 2):
                print('\nMassa excede precisao (38) ou escala (2). Tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            if not aux.validate_numeric(raio, 12, 2):
                print('\nRaio medio excede precisao (12) ou escala (2). Tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            else: # Temos as informações e podemos inserir a estrela nova
                with conn.cursor() as cursor:
                    cursor.execute('''INSERT INTO CORPOCELESTE (NOME, TIPO) 
                                   VALUES (%s, %s)''', (nome, 'ESTRELA'))
                    cursor.execute('''INSERT INTO ESTRELA (NOME, RAIO_MEDIO, 
                                   MASSA, CATEGORIA, COORDENADA_X, COORDENADA_Y) 
                                   VALUES (%s, %s, %s, %s, %s, %s);''', 
                                   (nome, raio, massa, categ, x, y))
                    conn.commit()
                print('\nEstrela inserida com sucesso!\n')
                _ = input('Pressione Enter para retornar.')

            """with conn.cursor() as cursor:
                cursor.execute('''''')"""
        elif insert in ['P', 'PLANETA']:
            aux.in_progress()
            return
        elif insert in ['S', 'SATELITE']:
            aux.in_progress()
            return
        elif insert in ['A', 'ASTEROIDE']:
            aux.in_progress()
            return
        else:
            print('\nErro no input. Por favor, tente novamente.\n')
            _ = input('Pressione Enter para retornar.')
            return

    
    def search_sistema_estrela(self):
        search = input(self.i.admin_bus_sistema)
        if ',' in search: # Busca por coordenadas
            try:
                x, y = search.split(',')
                x, y = float(x.strip()), float(y.strip())
            except ValueError:
                print('\nErro no input. Por favor, tente novamente.\n')
                _ = input('Pressione Enter para retornar.')
                return
            with conn.cursor() as cursor:
                cursor.execute('''SELECT * FROM SISTEMA WHERE COORDENADA_X = %s AND COORDENADA_Y = %s;''', (x, y))
                sistemas = cursor.fetchall()
            with conn.cursor() as cursor:
                cursor.execute('''SELECT * FROM ESTRELA WHERE COORDENADA_X = %s AND COORDENADA_Y = %s;''', (x, y))
                estrelas = cursor.fetchall()
        else: # Busca por nome
            nome = search.strip()
            with conn.cursor() as cursor:
                cursor.execute('''SELECT * FROM SISTEMA WHERE NOME = %s;''', (nome,))
                sistemas = cursor.fetchall()
            if len(sistemas) > 0:
                with conn.cursor() as cursor:
                    cursor.execute('''SELECT * FROM ESTRELA WHERE COORDENADA_X = %s AND COORDENADA_Y = %s;''', 
                                   (sistemas[0][0], sistemas[0][1]))
                    estrelas = cursor.fetchall()
            else:
                with conn.cursor() as cursor:
                    cursor.execute('''SELECT * FROM ESTRELA WHERE NOME = %s;''', (nome,))
                    estrelas = cursor.fetchall()
        if len(estrelas) > 0:
            with conn.cursor() as cursor:
                cursor.execute('''SELECT * FROM SISTEMA WHERE COORDENADA_X = %s AND COORDENADA_Y = %s;''', (estrelas[0][4], estrelas[0][5]))
                sistemas = cursor.fetchall()
        # Imprimir resultados
        print('\n[SISTEMAS ENCONTRADOS]\n')
        if len(sistemas) > 0:
            for sistema in sistemas: aux.print_sistema(sistema)
        else: print('Nao foi encontrado sistema com esses dados.\n')
        print('\n[ESTRELAS ENCONTRADAS]\n')
        if len(estrelas) > 0:
            for estrela in estrelas: aux.print_estrela(estrela, sistemas[0])
        else: print('Nao foi encontrada estrela com esses dados.\n')
        _ = input('Pressione Enter para retornar.')
        
    
    def search_planeta(self):
        aux.in_progress()
        return
        # search = input(self.i.admin_bus_planeta)
    
    def search_satelite(self):
        aux.in_progress()
        return
        # search = input(self.i.admin_bus_satelite)
    
    def search_asteroide(self):
        aux.in_progress()
        return
        # search = input(self.i.admin_bus_asteroide)

    # RECURSOS

    # GOVERNOS

    # CORPORAÇÕES E NAVES

    # CONTRATOS E MISSÕES

# --------------------------------