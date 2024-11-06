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

INSERT INTO pokemons (nome, identificacao, experiencia_base, altura, peso)
VALUES
    ('Pikachu', 25, 112, 4, 60), 
    ('Charmander', 4, 62, 6, 85),  
    ('Bulbasaur', 1, 64, 7, 69),  
    ('Squirtle', 7, 63, 5, 90);    


INSERT INTO tipos (pokemon_id, tipo)
VALUES
    (1, 'Elétrico'),  
    (2, 'Fogo'),      
    (3, 'Grama'),    
    (3, 'Veneno'),    
    (4, 'Água');      


INSERT INTO habilidades (pokemon_id, habilidade)
VALUES
    (1, 'Static'),    
    (1, 'Lightning Rod'),
    (2, 'Blaze'),    
    (3, 'Overgrow'),  
    (4, 'Torrent');   
