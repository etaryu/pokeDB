const {Client} = require('pg');
const axios = require('axios');

const cliente = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'postgres',
    password: 'minhasenha',
    port: 5433,
});

async function importarPokemon(nomePokemon) {
    await cliente.connect();
    const response = await axios.get(`https://pokeapi.co/api/v2/pokemon/${nomePokemon}`);
    const pokemon = response.data;

    const pokemonSQL = 'INSERT INTO pokemons (nome, identificacao, experiencia_base, altura, peso) VALUES ($1, $2, $3, $4, $5) RETURNING id';
    const valores = [
        pokemon.name,
        pokemon.id,
        pokemon.base_experience,
        pokemon.height,
        pokemon.weight
    ];
    const resultado = await cliente.query(pokemonSQL, valores);
    const pokemonId = resultado.rows[0].id;

    for (const tipo of pokemon.types) {
        const tipoSQL = 'INSERT INTO tipos (pokemon_id, tipo) VALUES ($1, $2)';
        const valoresTipo = [pokemonId, tipo.type.name];
        await cliente.query(tipoSQL, valoresTipo);
    }

    for (const habilidade of pokemon.abilities) {
        const habilidadeSQL = 'INSERT INTO habilidades (pokemon_id, habilidade) VALUES ($1, $2)';
        const valoresHabilidade = [pokemonId, habilidade.ability.name];
        await cliente.query(habilidadeSQL, valoresHabilidade);
    }

    console.log(`Pokémon ${pokemon.name} importado!`);
    await cliente.end();
}

const nomePokemon = process.argv[2];
importarPokemon(nomePokemon);