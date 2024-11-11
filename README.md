# Pokémon VGC Team Builder

Este projeto é um aplicativo de Flutter que permite aos usuários criar e gerenciar times de Pokémon para competições VGC (Video Game Championships). A aplicação inclui funcionalidades como gerenciamento de times, visualização e edição de Pokémon.

## Funcionalidades

- Criação e gerenciamento de usuários.
- Visualização, criação e edição de times de Pokémon.
- Interface interativa com suporte a cards para cada Pokémon.
- Identificação automática de Pokémon duplicados no time, com destaque visual.
- Salvamento automático de dados no Json-Server.


## Como iniciar
- Usuário: Kannon
Senha: 123

- Usuário: Seraph
Senha: 123

## Dependências

O projeto utiliza os seguintes pacotes principais:
- flutter
- flutter_local_storage: para armazenamento de dados local em JSON.
- provider: para gerenciamento de estado.


## Como rodar o projeto
1. Certifique-se de ter o Flutter SDK instalado em sua máquina.
2. Clone o repositório: git clone [https://github.com/seu-usuario/pokemon_vgc.git](https://github.com/EmersonTanno/pokemon_vgc.git)
3. Navegue até o diretório do projeto: cd pokemon_vgc
4. Navegue até a pasta correta para instalar as depéndências do flutter: cd mobile
5. Instale as dependências: flutter pub get
6. Navegue até a pasta correta para instalar dependências via npm: cd backend
7. Instale as dependências: npm install
8. Execute o backend (estando em ./backend): npx json-server ./api/db.json
9. Execute o aplicativo: F5

