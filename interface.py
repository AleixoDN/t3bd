# Uma classe guardando strings para a 'interface' da aplicação apresentada no terminal

class Interface():
    def __init__(self) -> None:
        print('''
######################################

Boas-vindas ao sistema de missoes em exploracao da galaxia!
''')    
        self.main_menu = '''
######################################

Escolha o menu que quer acessar digitando
o numero correspondente.

---------------------------------------------------
| 0. <- SAIR                                      |
| 1. Admin - Sistemas estelares e corpos celestes |
| 2. Admin - Recursos presentes na galaxia        |
| 3. Admin - Governos envolvidos no programa      |
| 4. Admin - Corporacoes envolvidas no programa   |
| ...                                             |
---------------------------------------------------

> '''

        self.error_input = '''
Nao existe comando com esse numero.
Por favor, tente novamente.

> '''

        self.admin_sistemas_menu = '''
######################################

MENU - SISTEMAS E CORPOS CELESTES
Digite o numero indicado para
determinar a operacao desejada.

--------------------------------------
| 0. <- RETORNAR                     |
| 1. Inserir um novo sistema estelar |
| 2. Inserir um novo corpo celeste   |
| 3. Buscar sistemas ou estrelas     |
| 4. Buscar planetas                 |
| 5. Buscar satelites                |
| 6. Buscar asteroides               |
--------------------------------------

> '''

        self.admin_ins_sistema = '''
Insira, separado por virgula:

   Coordenada X (em anos-luz)
   Coordenada Y (em anos-luz)
   Nome do sistema

As coordenadas podem ser negativas,
ja que referenciam o centro da galaxia.

> '''

        self.admin_ins_corpo_celeste_1 = '''
Que tipo de corpo celeste voce esta inserindo?

E (Estrela) / P (Planeta) /
S (Satelite) / A (Asteroide)

> '''

        self.admin_ins_corpo_celeste_2 = '''
Insira, separado por virgula:
   Massa (kg)
   Raio Medio (km)

> '''

        self.admin_ins_estrela_1 = '''
Insira, separado por virgula:
   Nome da estrela
   Categoria (O, B, A, F, G, K ou M)

> '''

        self.admin_ins_estrela_2 = '''
Informe o sistema do qual a estrela faz parte.
Pode informar o nome do sistema (case-sensitive)
ou suas coordenadas X e Y, separadas por virgula.

> '''

        self.admin_ins_planeta_1 = '''
Insira, separado por virgula:

   Nome do planeta
   Estrela que orbita
   Distancia da estrela
   Periodo orbital

> '''

        self.admin_ins_planeta_2 = '''
Info adicional - Insira, separado por virgula:

   Categoria (Gasoso, Rochoso etc)
   Tempo de rotacao
   Respiravel? (S / N)

> '''

        self.admin_ins_satelite_1 = '''
Insira, separado por virgula:

   Nome do satelite
   Planeta que orbita
   Distancia do planeta
   Periodo orbital

> '''

        self.admin_ins_satelite_2 = '''
Info adicional - Insira, separado por virgula:

   Categoria (Gasoso, Rochoso etc)
   Tempo de rotacao
   Respiravel? (S / N)

> '''

        self.admin_ins_asteroide = '''
Insira, separado por virgula:

   Nome do asteroide
   Estrela que orbita
   Distancia da estrela
   Periodo orbital
   Tempo de rotacao

> '''

        self.admin_bus_sistema = '''
Digite o nome (case-sensitive) ou coordenadas X e
Y (separadas por virgula) do sistema a ser buscado.

Alternativamente, digite o nome (case-sensitive) da
estrela a ser buscada.

> '''

        self.admin_bus_planeta = '''

Digite o nome (case-sensitive) do planeta a ser
buscado.

> '''

        self.admin_bus_satelite = '''

Digite o nome (case-sensitive) do satelite a ser
buscado.

> '''

        self.admin_bus_asteroide = '''

Digite o nome (case-sensitive) do asteroide a ser
buscado.

> '''