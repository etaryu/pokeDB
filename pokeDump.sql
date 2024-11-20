--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1 (Debian 17.1-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-20 11:48:59 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: pokemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemons (
    id integer NOT NULL,
    nome character varying(50),
    identificacao integer,
    altura integer,
    peso integer
);


ALTER TABLE public.pokemons OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pokemons_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 217
-- Name: pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemons_id_seq OWNED BY public.pokemons.id;


--
-- TOC entry 220 (class 1259 OID 16397)
-- Name: tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos (
    id integer NOT NULL,
    pokemon_id integer,
    tipo character varying(50)
);


ALTER TABLE public.tipos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16396)
-- Name: tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_id_seq OWNED BY public.tipos.id;


--
-- TOC entry 3215 (class 2604 OID 16393)
-- Name: pokemons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons ALTER COLUMN id SET DEFAULT nextval('public.pokemons_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16400)
-- Name: tipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos ALTER COLUMN id SET DEFAULT nextval('public.tipos_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemons (id, nome, identificacao, altura, peso) FROM stdin;
1	bulbasaur	1	7	69
2	ivysaur	2	10	130
3	venusaur	3	20	1000
4	charmander	4	6	85
5	charmeleon	5	11	190
6	charizard	6	17	905
7	squirtle	7	5	90
8	wartortle	8	10	225
9	blastoise	9	16	855
10	caterpie	10	3	29
11	metapod	11	7	99
12	butterfree	12	11	320
13	weedle	13	3	32
14	kakuna	14	6	100
15	beedrill	15	10	295
16	pidgey	16	3	18
17	pidgeotto	17	11	300
18	pidgeot	18	15	395
19	rattata	19	3	35
20	raticate	20	7	185
21	spearow	21	3	20
22	fearow	22	12	380
23	ekans	23	20	69
24	arbok	24	35	650
25	pikachu	25	4	60
26	raichu	26	8	300
27	sandshrew	27	6	120
28	sandslash	28	10	295
29	nidoran-f	29	4	70
30	nidorina	30	8	200
31	nidoqueen	31	13	600
32	nidoran-m	32	5	90
33	nidorino	33	9	195
34	nidoking	34	14	620
35	clefairy	35	6	75
36	clefable	36	13	400
37	vulpix	37	6	99
38	ninetales	38	11	199
39	jigglypuff	39	5	55
40	wigglytuff	40	10	120
41	zubat	41	8	75
42	golbat	42	16	550
43	oddish	43	5	54
44	gloom	44	8	86
45	vileplume	45	12	186
46	paras	46	3	54
47	parasect	47	10	295
48	venonat	48	10	300
49	venomoth	49	15	125
50	diglett	50	2	8
51	dugtrio	51	7	333
52	meowth	52	4	42
53	persian	53	10	320
54	psyduck	54	8	196
55	golduck	55	17	766
56	mankey	56	5	280
57	primeape	57	10	320
58	growlithe	58	7	190
59	arcanine	59	19	1550
60	poliwag	60	6	124
61	poliwhirl	61	10	200
62	poliwrath	62	13	540
63	abra	63	9	195
64	kadabra	64	13	565
65	alakazam	65	15	480
66	machop	66	8	195
67	machoke	67	15	705
68	machamp	68	16	1300
69	bellsprout	69	7	40
70	weepinbell	70	10	64
71	victreebel	71	17	155
72	tentacool	72	9	455
73	tentacruel	73	16	550
74	geodude	74	4	200
75	graveler	75	10	1050
76	golem	76	14	3000
77	ponyta	77	10	300
78	rapidash	78	17	950
79	slowpoke	79	12	360
80	slowbro	80	16	785
81	magnemite	81	3	60
82	magneton	82	10	600
83	farfetchd	83	8	150
84	doduo	84	14	392
85	dodrio	85	18	852
86	seel	86	11	900
87	dewgong	87	17	1200
88	grimer	88	9	300
89	muk	89	12	300
90	shellder	90	3	40
91	cloyster	91	15	1325
92	gastly	92	13	1
93	haunter	93	16	1
94	gengar	94	15	405
95	onix	95	88	2100
96	drowzee	96	10	324
97	hypno	97	16	756
98	krabby	98	4	65
99	kingler	99	13	600
100	voltorb	100	5	104
101	electrode	101	12	666
102	exeggcute	102	4	25
103	exeggutor	103	20	1200
104	cubone	104	4	65
105	marowak	105	10	450
106	hitmonlee	106	15	498
107	hitmonchan	107	14	502
108	lickitung	108	12	655
109	koffing	109	6	10
110	weezing	110	12	95
111	rhyhorn	111	10	1150
112	rhydon	112	19	1200
113	chansey	113	11	346
114	tangela	114	10	350
115	kangaskhan	115	22	800
116	horsea	116	4	80
117	seadra	117	12	250
118	goldeen	118	6	150
119	seaking	119	13	390
120	staryu	120	8	345
121	starmie	121	11	800
122	mr-mime	122	13	545
123	scyther	123	15	560
124	jynx	124	14	406
125	electabuzz	125	11	300
126	magmar	126	13	445
127	pinsir	127	15	550
128	tauros	128	14	884
129	magikarp	129	9	100
130	gyarados	130	65	2350
131	lapras	131	25	2200
132	ditto	132	3	40
133	eevee	133	3	65
134	vaporeon	134	10	290
135	jolteon	135	8	245
136	flareon	136	9	250
137	porygon	137	8	365
138	omanyte	138	4	75
139	omastar	139	10	350
140	kabuto	140	5	115
141	kabutops	141	13	405
142	aerodactyl	142	18	590
143	snorlax	143	21	4600
144	articuno	144	17	554
145	zapdos	145	16	526
146	moltres	146	20	600
147	dratini	147	18	33
148	dragonair	148	40	165
149	dragonite	149	22	2100
150	mewtwo	150	20	1220
151	mew	151	4	40
\.


--
-- TOC entry 3370 (class 0 OID 16397)
-- Dependencies: 220
-- Data for Name: tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos (id, pokemon_id, tipo) FROM stdin;
1	1	grass
2	1	poison
3	2	grass
4	2	poison
5	3	grass
6	3	poison
7	4	fire
8	5	fire
9	6	fire
10	6	flying
11	7	water
12	8	water
13	9	water
14	10	bug
15	11	bug
16	12	bug
17	12	flying
18	13	bug
19	13	poison
20	14	bug
21	14	poison
22	15	bug
23	15	poison
24	16	normal
25	16	flying
26	17	normal
27	17	flying
28	18	normal
29	18	flying
30	19	normal
31	20	normal
32	21	normal
33	21	flying
34	22	normal
35	22	flying
36	23	poison
37	24	poison
38	25	electric
39	26	electric
40	27	ground
41	28	ground
42	29	poison
43	30	poison
44	31	poison
45	31	ground
46	32	poison
47	33	poison
48	34	poison
49	34	ground
50	35	fairy
51	36	fairy
52	37	fire
53	38	fire
54	39	normal
55	39	fairy
56	40	normal
57	40	fairy
58	41	poison
59	41	flying
60	42	poison
61	42	flying
62	43	grass
63	43	poison
64	44	grass
65	44	poison
66	45	grass
67	45	poison
68	46	bug
69	46	grass
70	47	bug
71	47	grass
72	48	bug
73	48	poison
74	49	bug
75	49	poison
76	50	ground
77	51	ground
78	52	normal
79	53	normal
80	54	water
81	55	water
82	56	fighting
83	57	fighting
84	58	fire
85	59	fire
86	60	water
87	61	water
88	62	water
89	62	fighting
90	63	psychic
91	64	psychic
92	65	psychic
93	66	fighting
94	67	fighting
95	68	fighting
96	69	grass
97	69	poison
98	70	grass
99	70	poison
100	71	grass
101	71	poison
102	72	water
103	72	poison
104	73	water
105	73	poison
106	74	rock
107	74	ground
108	75	rock
109	75	ground
110	76	rock
111	76	ground
112	77	fire
113	78	fire
114	79	water
115	79	psychic
116	80	water
117	80	psychic
118	81	electric
119	81	steel
120	82	electric
121	82	steel
122	83	normal
123	83	flying
124	84	normal
125	84	flying
126	85	normal
127	85	flying
128	86	water
129	87	water
130	87	ice
131	88	poison
132	89	poison
133	90	water
134	91	water
135	91	ice
136	92	ghost
137	92	poison
138	93	ghost
139	93	poison
140	94	ghost
141	94	poison
142	95	rock
143	95	ground
144	96	psychic
145	97	psychic
146	98	water
147	99	water
148	100	electric
149	101	electric
150	102	grass
151	102	psychic
152	103	grass
153	103	psychic
154	104	ground
155	105	ground
156	106	fighting
157	107	fighting
158	108	normal
159	109	poison
160	110	poison
161	111	ground
162	111	rock
163	112	ground
164	112	rock
165	113	normal
166	114	grass
167	115	normal
168	116	water
169	117	water
170	118	water
171	119	water
172	120	water
173	121	water
174	121	psychic
175	122	psychic
176	122	fairy
177	123	bug
178	123	flying
179	124	ice
180	124	psychic
181	125	electric
182	126	fire
183	127	bug
184	128	normal
185	129	water
186	130	water
187	130	flying
188	131	water
189	131	ice
190	132	normal
191	133	normal
192	134	water
193	135	electric
194	136	fire
195	137	normal
196	138	rock
197	138	water
198	139	rock
199	139	water
200	140	rock
201	140	water
202	141	rock
203	141	water
204	142	rock
205	142	flying
206	143	normal
207	144	ice
208	144	flying
209	145	electric
210	145	flying
211	146	fire
212	146	flying
213	147	dragon
214	148	dragon
215	149	dragon
216	149	flying
217	150	psychic
218	151	psychic
\.


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 217
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemons_id_seq', 151, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_id_seq', 218, true);


--
-- TOC entry 3218 (class 2606 OID 16395)
-- Name: pokemons pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16402)
-- Name: tipos tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos
    ADD CONSTRAINT tipos_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16403)
-- Name: tipos tipos_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos
    ADD CONSTRAINT tipos_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemons(id);


-- Completed on 2024-11-20 11:48:59 UTC

--
-- PostgreSQL database dump complete
--

