--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size_in_lightyear integer,
    mass_in_trillion_of_solar_masses numeric(8,2),
    is_spiral boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_in_km integer,
    mass_in_earth_masses numeric(8,2),
    is_spherical boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_in_km integer,
    mass_in_earth_masses numeric(8,2),
    has_satellite boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_in_solar_radius integer,
    mass_in_solar_masses numeric(8,2),
    has_known_system boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    in_group boolean
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_types_id_seq OWNER TO freecodecamp;

--
-- Name: types_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_types_id_seq OWNED BY public.types.types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: types types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN types_id SET DEFAULT nextval('public.types_types_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 87400, 1.15, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 32200, 0.14, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 132000, NULL, false, NULL);
INSERT INTO public.galaxy VALUES (6, '3C 244.1', NULL, NULL, false, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 3953', NULL, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 152000, 1.50, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 0.01, true, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, NULL, false, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, NULL, false, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821, 0.01, true, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560, NULL, true, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 0.02, true, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 0.01, true, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Iapetus', 734, NULL, true, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 2574, 0.02, true, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 763, NULL, true, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, NULL, true, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 788, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 761, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 578, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 584, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 235, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 1353, NULL, true, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 180, NULL, false, NULL, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 209, NULL, false, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Thalassa', 41, NULL, false, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439, 0.05, false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051, 0.85, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 1.00, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389, 0.10, true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 317.80, true, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 95.15, true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 14.53, true, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24341, 17.14, true, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 2439, 0.26, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 5376, 1.07, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 411 b', NULL, 2.69, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 411 c', NULL, 13.60, NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, true, NULL, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, 0.15, true, NULL, 2);
INSERT INTO public.star VALUES (3, 'Lalande 21185', NULL, 0.39, true, NULL, 2);
INSERT INTO public.star VALUES (4, 'Lacaille 9352', NULL, 0.47, true, NULL, 2);
INSERT INTO public.star VALUES (5, 'GJ 273', NULL, 0.29, true, NULL, 2);
INSERT INTO public.star VALUES (6, 'YZ Ceti', NULL, 0.13, true, NULL, 2);
INSERT INTO public.star VALUES (7, 'GJ 1061', NULL, 0.12, true, NULL, 2);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'spiral', false);
INSERT INTO public.types VALUES (2, 'elliptic', true);
INSERT INTO public.types VALUES (3, 'bare spiral', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: types_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_types_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (types_id);


--
-- Name: types types_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_types_id_key UNIQUE (types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

