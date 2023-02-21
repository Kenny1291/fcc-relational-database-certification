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
    name character varying,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    description text DEFAULT 'desc'::text NOT NULL,
    active boolean DEFAULT false NOT NULL
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
    name character varying,
    planet_id integer,
    description text DEFAULT 'desc'::text NOT NULL,
    has_life boolean,
    active boolean DEFAULT false NOT NULL
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
    name character varying,
    star_id integer,
    has_life boolean,
    distance_from_earth integer,
    planet_type_id integer,
    description text DEFAULT 'desc'::text NOT NULL,
    active boolean DEFAULT false NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    name character varying,
    planet_type_id integer NOT NULL,
    description text DEFAULT 'desc'::text NOT NULL,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    galaxy_id integer,
    description text DEFAULT 'desc'::text NOT NULL,
    active boolean DEFAULT false NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 100, 3000, 'desc', false);
INSERT INTO public.galaxy VALUES (2, 'Virgo A', 200, 4000, 'desc', false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 300, 5000, 'desc', false);
INSERT INTO public.galaxy VALUES (4, 'A', 1, 100, 'desc', false);
INSERT INTO public.galaxy VALUES (6, 'B', 1, 100, 'desc', false);
INSERT INTO public.galaxy VALUES (7, 'C', 1, 100, 'desc', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moonA', 1, 'moon is A', true, false);
INSERT INTO public.moon VALUES (2, 'moonB', 2, 'moon is B', true, false);
INSERT INTO public.moon VALUES (3, 'moonC', 3, 'moon is C', true, false);
INSERT INTO public.moon VALUES (5, 'A', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (6, 'B', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (7, 'C', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (8, 'D', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (9, 'E', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (10, 'F', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (11, 'G', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (12, 'H', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (13, 'I', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (14, 'J', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (15, 'K', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (16, 'L', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (17, 'M', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (18, 'O', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (19, 'P', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (20, 'Q', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (21, 'R', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (22, 'S', NULL, 'desc', NULL, false);
INSERT INTO public.moon VALUES (23, 'T', NULL, 'desc', NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planetA', 1, true, 100, NULL, 'desc', false);
INSERT INTO public.planet VALUES (2, 'planetB', 2, true, 200, NULL, 'desc', false);
INSERT INTO public.planet VALUES (3, 'planetC', 3, false, 250, NULL, 'desc', false);
INSERT INTO public.planet VALUES (4, 'A', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (5, 'B', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (6, 'C', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (7, 'D', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (8, 'E', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (9, 'F', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (10, 'G', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (11, 'H', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (12, 'I', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (13, 'J', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (14, 'K', NULL, NULL, NULL, NULL, 'desc', false);
INSERT INTO public.planet VALUES (15, 'L', NULL, NULL, NULL, NULL, 'desc', false);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES ('A', 2, 'desc', false);
INSERT INTO public.planet_type VALUES ('B', 3, 'desc', false);
INSERT INTO public.planet_type VALUES ('C', 4, 'desc', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'starA', 1, 'desc', false);
INSERT INTO public.star VALUES (2, 'starB', 2, 'desc', false);
INSERT INTO public.star VALUES (3, 'starC', 3, 'desc', false);
INSERT INTO public.star VALUES (4, 'A', NULL, 'desc', false);
INSERT INTO public.star VALUES (5, 'B', NULL, 'desc', false);
INSERT INTO public.star VALUES (6, 'C', NULL, 'desc', false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 23, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_name UNIQUE (name);


--
-- Name: moon uq_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_name_moon UNIQUE (name);


--
-- Name: planet uq_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_name_planet UNIQUE (name);


--
-- Name: planet_type uq_name_planet_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT uq_name_planet_type UNIQUE (name);


--
-- Name: star uq_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_name_star UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

