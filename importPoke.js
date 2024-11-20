const { Client } = require('pg');
const axios = require('axios');

const cliente = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'pokedb',
  password: 'minhasenha',
  port: 5433,
});

async function criarBanco() {
  await cliente.connect();
  console.log("Conectado ao banco de dados");

  const tabelaPokemon = `
    CREATE TABLE IF NOT EXISTS pokemons (
      id SERIAL PRIMARY KEY,
      nome VARCHAR(50),
      identificacao INT,
      altura INT,
      peso INT
    );`;

  const tabelaTipos = `
    CREATE TABLE IF NOT EXISTS tipos (
      id SERIAL PRIMARY KEY,
      pokemon_id INT REFERENCES pokemons(id),
      tipo VARCHAR(50)
    );`;

  await cliente.query(tabelaPokemon);
  await cliente.query(tabelaTipos);
}

async function importarPokemon(nomePokemon) {
  const response = await axios.get(`https://pokeapi.co/api/v2/pokemon/${nomePokemon}`);
  const pokemon = response.data;

  const pokemonSQL = 'INSERT INTO pokemons (nome, identificacao, altura, peso) VALUES ($1, $2, $3, $4) RETURNING id';
  const valores = [pokemon.name, pokemon.id, pokemon.height, pokemon.weight];
  const resultado = await cliente.query(pokemonSQL, valores);
  const pokemonId = resultado.rows[0].id;

  for (const tipo of pokemon.types) {
    const tipoSQL = 'INSERT INTO tipos (pokemon_id, tipo) VALUES ($1, $2)';
    const valoresTipo = [pokemonId, tipo.type.name];
    await cliente.query(tipoSQL, valoresTipo);
  }

  console.log(`${pokemon.name} importado`);
}

async function importarTodosPokemons() {
  const result = await axios.get(`https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151`);
  const pokemons = result.data.results;

  for (const { name } of pokemons) {
    await importarPokemon(name);
  }
  console.log("Pokémons da primeira geração foram importados");
}

(async () => {
    await criarBanco();
    await importarTodosPokemons();
})();