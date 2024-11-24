Nome dos Alunos: Shynji Miyazato, Yuggo Teruya
Youtube Link Apresentação: https://youtu.be/rFB31l-mwrI
Link GitHub do Projeto: https://github.com/etaryu/pokeDB

Como baixar ambiente (NECESSÁRIO: NODE.JS E DOCKER):
1- Baixe o repositório clone do pokeDB      
Execute o postgres.yml, usando o “docker compose -f postgres.yml up -d” no terminal

2- Conecte ao localhost:8090 (pode ser que demore um pouco para carregar)
Logue usando o email : “yuggo@gmail.com” e a senha: “senha1”

3- Conecte a um servidor pelo PgAdmin
Na aba General,coloque um nome para o Servidor
Na aba Connection, coloque da seguinte forma: 
	Host name/address : meucontainer
	Port: 5432
	Username: postgres
	Password: minhasenha

4- Após entrar no servidor, clique com o botão direito em Database, e crie um banco com o nome: “pokedb”

5- Após isso, retorne ao terminal no diretório do Projeto, e execute “node importPoke.js” para importar os pokémons da api para o banco de dados
Execute “node pokeForca.js” para poder jogar a forca no terminal.

