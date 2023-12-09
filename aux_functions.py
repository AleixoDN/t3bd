# Funções auxiliares ao funcionamento da aplicação, cujas funções estão em application.py

def validate_numeric(num, precision, scale):
    numeric = str(num).strip()
    if numeric[0] == '-': numeric = numeric[1:]
    whole, decimal = numeric.split('.')
    if len(decimal) > scale: return False
    if len(whole+decimal) > precision: return False
    return True

def print_sistema(sistema):
    print(f'Nome: {sistema[2]}')
    print(f'Coord X: {sistema[0]} (anos-luz do centro da galaxia)')
    print(f'Coord Y: {sistema[1]} (anos-luz do centro da galaxia)')
    print()

def print_estrela(estrela, sistema):
    print(f'Nome: {estrela[0]}')
    print(f'Raio medio: {estrela[1]} (km)')
    print(f'Massa: {estrela[2]} (kg)')
    print(f'Categoria: {estrela[3]}')
    print(f'Pertence ao sistema: {sistema[2]}')
    print()

def in_progress():
    print('\nEssa funcao ainda nao existe!\n')
    _ = input('Pressione Enter para retornar.')