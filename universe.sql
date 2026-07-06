--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    area_sq_deg integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    distance_from_earth numeric NOT NULL,
    has_black_hole boolean NOT NULL,
    is_spherical boolean
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
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_tidally_locked boolean,
    composition text
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    mass_relative_to_earth numeric,
    orbital_period_days integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_years integer NOT NULL,
    temperature_kelvin integer,
    is_main_sequence boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'And', 722);
INSERT INTO public.constellation VALUES (2, 'Aquarius', 'Aqr', 980);
INSERT INTO public.constellation VALUES (3, 'Aquila', 'Aql', 652);
INSERT INTO public.constellation VALUES (4, 'Aries', 'Ari', 441);
INSERT INTO public.constellation VALUES (5, 'Auriga', 'Aur', 657);
INSERT INTO public.constellation VALUES (6, 'Cancer', 'Cnc', 506);
INSERT INTO public.constellation VALUES (7, 'Capricornus', 'Cap', 414);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy containing the Sun and its Solar System.', 0, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest large galaxy to the Milky Way, expected to collide in about 4.5 billion years.', 2.5, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in our Local Group, known for its diffuse nature and lack of a prominent central bulge.', 2.9, false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A unique galaxy with features of both spiral and elliptical galaxies, famous for its bright nucleus and prominent dust lane.', 30, true, false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 'A prominent lenticular galaxy and one of the closest radio galaxies to Earth, known for its active galactic nucleus.', 13.7, true, false);
INSERT INTO public.galaxy VALUES (6, 'Messier', 'A grand design spiral galaxy in the constellation Ursa Major, one of the brightest galaxies visible from Earth.', 12, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', 1, 1737, true, 'Rocky / Silicate');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, true, 'Carbonaceous / Rubble pile');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, true, 'Carbonaceous / Rubble pile');
INSERT INTO public.moon VALUES (4, 'Andromeda-1b-1', 3, 720, true, 'Rocky');
INSERT INTO public.moon VALUES (5, 'Andromeda-1b-2', 3, 530, false, 'Icy');
INSERT INTO public.moon VALUES (6, 'Andromeda-1c-1', 4, 1450, true, 'Icy / Rocky');
INSERT INTO public.moon VALUES (7, 'Andromeda-1c-2', 4, 980, false, 'Icy');
INSERT INTO public.moon VALUES (8, 'M33-1b-1', 5, 880, true, 'Rocky');
INSERT INTO public.moon VALUES (9, 'M33-1b-2', 5, 670, false, 'Icy / Rocky');
INSERT INTO public.moon VALUES (10, 'M33-1c-1', 6, 1050, false, 'Icy');
INSERT INTO public.moon VALUES (11, 'M33-1c-2', 6, 780, true, 'Rocky');
INSERT INTO public.moon VALUES (12, 'M104-1b-1', 7, 600, true, 'Rocky');
INSERT INTO public.moon VALUES (13, 'M104-1b-2', 7, 450, false, 'Icy / Rocky');
INSERT INTO public.moon VALUES (14, 'M104-1c-1', 8, 1300, true, 'Icy / Rocky');
INSERT INTO public.moon VALUES (15, 'M104-1c-2', 8, 1100, false, 'Icy');
INSERT INTO public.moon VALUES (16, 'Centauri-1b-1', 9, 850, true, 'Rocky');
INSERT INTO public.moon VALUES (17, 'Centauri-1c-1', 10, 1200, true, 'Icy / Rocky');
INSERT INTO public.moon VALUES (18, 'Centauri-1e-1', 11, 2100, true, 'Icy / Gas-rich');
INSERT INTO public.moon VALUES (19, 'M81-1b-1', 12, 500, true, 'Rocky');
INSERT INTO public.moon VALUES (20, 'M81-1b-2', 12, 920, false, 'Icy / Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.00, 365);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 0.11, 687);
INSERT INTO public.planet VALUES (3, 'Andromeda-1b', 2, false, 3.50, 45);
INSERT INTO public.planet VALUES (4, 'Andromeda-1c', 2, false, 8.20, 120);
INSERT INTO public.planet VALUES (5, 'M33-1b', 3, false, 4.80, 60);
INSERT INTO public.planet VALUES (6, 'M33-1c', 3, false, 6.10, 90);
INSERT INTO public.planet VALUES (7, 'M104-1b', 4, false, 2.90, 30);
INSERT INTO public.planet VALUES (8, 'M104-1c', 4, false, 5.40, 80);
INSERT INTO public.planet VALUES (9, 'Centauri-1b', 5, false, 2.40, 19);
INSERT INTO public.planet VALUES (10, 'Centauri-1c', 5, false, 5.10, 52);
INSERT INTO public.planet VALUES (11, 'Centauri-1e', 5, false, 8.70, 120);
INSERT INTO public.planet VALUES (12, 'M81-1b', 6, false, 1.80, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true);
INSERT INTO public.star VALUES (2, 'M31-V1', 2, 8000, 4500, false);
INSERT INTO public.star VALUES (3, 'M33-X7', 3, 3000, 35000, true);
INSERT INTO public.star VALUES (4, 'M104-HR', 4, 9000, 4800, false);
INSERT INTO public.star VALUES (5, 'NGC 5128-V1', 5, 7000, 5200, true);
INSERT INTO public.star VALUES (6, 'M81-SN1993J', 6, 10000, 25000, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

