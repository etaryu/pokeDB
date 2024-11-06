CREATE TABLE pokemons (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    identificacao INTEGER,
    experiencia_base INTEGER,
    altura INTEGER,
    peso INTEGER
);

CREATE TABLE tipos (
    id SERIAL PRIMARY KEY,
    pokemon_id INTEGER REFERENCES pokemons(id),
    tipo VARCHAR(50)
);

CREATE TABLE habilidades (
    id SERIAL PRIMARY KEY,
    pokemon_id INTEGER REFERENCES pokemons(id),
    habilidade VARCHAR(100)
);
