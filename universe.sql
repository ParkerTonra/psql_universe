--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    active boolean,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    mass integer,
    diameter integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric(20,5),
    moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: quadrant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.quadrant (
    quadrant_id integer NOT NULL,
    name character varying(30) NOT NULL,
    ours boolean
);


ALTER TABLE public.quadrant OWNER TO freecodecamp;

--
-- Name: quadrant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.quadrant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quadrant_id_seq OWNER TO freecodecamp;

--
-- Name: quadrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.quadrant_id_seq OWNED BY public.quadrant.quadrant_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    dead boolean,
    galaxy_id integer,
    mass integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: quadrant quadrant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant ALTER COLUMN quadrant_id SET DEFAULT nextval('public.quadrant_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2500000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, true, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 11000000, true, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 13000000, true, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Andromeda II', 3250000, true, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 7, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0, 27);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0, 15);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1, 5262);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1, 4800);
INSERT INTO public.moon VALUES (6, 'Io', 5, 1, 3642);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 0, 3121);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1, 5150);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 0, 1527);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 0, 2707);
INSERT INTO public.moon VALUES (11, 'Nereid', 7, 0, 340);
INSERT INTO public.moon VALUES (12, 'Oberon', 8, 0, 1522);
INSERT INTO public.moon VALUES (13, 'Titania', 8, 0, 1578);
INSERT INTO public.moon VALUES (14, 'Charon', 9, 0, 1207);
INSERT INTO public.moon VALUES (15, 'Hydra', 9, 0, 135);
INSERT INTO public.moon VALUES (16, 'Eris I Dysnomia', 10, 0, 150);
INSERT INTO public.moon VALUES (17, 'Phoebe', 11, 0, 213);
INSERT INTO public.moon VALUES (18, 'Dione', 6, 0, 1122);
INSERT INTO public.moon VALUES (19, 'Tethys', 6, 0, 1062);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 0, 471);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5.97237, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0.64171, 2, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4.86750, 0, 2);
INSERT INTO public.planet VALUES (4, 'Mercury', 0.33011, 0, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898.19000, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 568.34000, 82, 2);
INSERT INTO public.planet VALUES (7, 'Neptune', 102.41000, 14, 5);
INSERT INTO public.planet VALUES (8, 'Uranus', 86.81300, 27, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.01303, 5, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 17.21000, 0, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 0.71447, 0, 1);
INSERT INTO public.planet VALUES (12, 'GJ 1214 b', 0.01903, 0, 3);


--
-- Data for Name: quadrant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.quadrant VALUES (1, '1', NULL);
INSERT INTO public.quadrant VALUES (2, '2', NULL);
INSERT INTO public.quadrant VALUES (3, '3', NULL);
INSERT INTO public.quadrant VALUES (4, '4', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 2, 1989000);
INSERT INTO public.star VALUES (2, 'Sirius', false, 1, 2565000);
INSERT INTO public.star VALUES (3, 'Betelgeuse', false, 1, 17500000);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', false, 5, 12340);
INSERT INTO public.star VALUES (5, 'Vega', false, 2, 2600000);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', false, 2, 2345678);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: quadrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.quadrant_id_seq', 4, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: quadrant quadrant_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT quadrant_name_key UNIQUE (name);


--
-- Name: quadrant quadrant_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quadrant
    ADD CONSTRAINT quadrant_pkey PRIMARY KEY (quadrant_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

