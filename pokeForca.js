const { Client } = require('pg');
const axios = require('axios');
const readline = require('readline');

const cliente = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'pokedb',
  password: 'minhasenha',
  port: 5433,
});

async function selecionarPokemonAleatorio() {
  const resultado = await cliente.query('SELECT * FROM pokemons ORDER BY RANDOM() LIMIT 1');
  return resultado.rows[0]; 
}

function iniciarJogo(pokemonAleatorio) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  
  const pokemonData = pokemonAleatorio;

  (async () => {
    const tipos = await cliente.query('SELECT tipo FROM tipos WHERE pokemon_id = $1', [pokemonData.id]);

    console.log(`Dica: Este Pokémon pesa ${pokemonData.peso} e tem ${pokemonData.altura} de altura.`);
    console.log("Tipos:", tipos.rows.map((t) => t.tipo).join(', '));

    let palavra = pokemonData.nome.toUpperCase();
    let tentativas = 6;
    let letrasAcertadas = Array(palavra.length).fill('_');

    const verificarLetra = (letra) => {
      let acertou = false;
      for (let i = 0; i < palavra.length; i++) {
        if (palavra[i] === letra) {
          letrasAcertadas[i] = letra;
          acertou = true;
        }
      }
      return acertou;
    };

    const pedirLetra = () => {
      console.log("Palavra:", letrasAcertadas.join(' '));
      if (letrasAcertadas.join('') === palavra) {
        console.log("Parabéns! Você acertou o nome do Pokémon!");
        rl.close();
        return;
      }
      if (tentativas <= 0) {
        console.log("Você perdeu! O nome do Pokémon era:", palavra);
        rl.close();
        return;
      }

      rl.question("Digite uma letra: ", (letra) => {
        letra = letra.toUpperCase();
        if (letra.length !== 1) {
          console.log("Digite apenas uma letra!");
        } else if (verificarLetra(letra)) {
          console.log("Você acertou uma letra!");
        } else {
          console.log("Letra errada!");
          tentativas--;
          console.log(`Tentativas restantes: ${tentativas}`);
        }
        pedirLetra();
      });
    };

    pedirLetra();
  })();
}

(async () => {
  await cliente.connect();
  const pokemonAleatorio = await selecionarPokemonAleatorio(); 
  iniciarJogo(pokemonAleatorio);
})();
