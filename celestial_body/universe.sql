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
-- Name: discoverer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoverer (
    discoverer_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.discoverer OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years integer,
    distance_from_earth integer,
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
    name character varying(30) NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text
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
    name character varying(30) NOT NULL,
    star_id integer,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text,
    has_water boolean,
    is_terrestrial boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text,
    mass_in_solar_mass numeric
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
-- Data for Name: discoverer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoverer VALUES (1, 'Galileo Galilei', NULL, NULL, 8, NULL);
INSERT INTO public.discoverer VALUES (2, 'Abd al-Rahman al-Sufi', 2, NULL, NULL, NULL);
INSERT INTO public.discoverer VALUES (3, 'Robert Innes', NULL, 2, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 14, 27140, 'The Milky Way is the galaxy that includes our Solar System,');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 2500000, 'The closest galaxy to our solar system');
INSERT INTO public.galaxy VALUES (3, 'Needle Galaxy', NULL, 30000000, ' It is known as the Needle Galaxy for its narrow profile');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', NULL, 21000000, 'This galaxy is located in the constellation Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', NULL, 12000000, 'This is a starburst galaxy');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', NULL, 163000, 'Satellite galaxy of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 4500, 0, 'Our Moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, 0, 'Mars''s moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 4500, 0, 'Mars''s moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (8, 'Tethys', 6, 4560, 0, 'Saturn''s moon');
INSERT INTO public.moon VALUES (9, 'Dione', 6, 4000, 0, 'Saturn''s moon');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 4500, 0, 'Saturn''s moon');
INSERT INTO public.moon VALUES (11, 'Titan', 6, 4000, 0, 'Saturn''s moon');
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 4567, 0, 'Saturn''s moon');
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 4500, 0, 'Uranus''s moon');
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 4500, 0, 'Uranus''s moon');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 4500, 0, 'Uranus''s moon');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 4500, 0, 'Uranus''s moon');
INSERT INTO public.moon VALUES (17, 'Triton', 8, 4500, 0, 'Neptune''s moon');
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (19, 'Enceladus', 6, 4500, 0, 'Jupiter''s moon');
INSERT INTO public.moon VALUES (20, 'Miranda', 6, 4500, 0, 'Jupiter''s moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4500, 0, 'First planet of the solar system', false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4500, 0, 'Earth evil twin', false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4500, 0, 'Our planet', true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4600, 0, 'Will it be habitable?', true, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4600, 0, 'Biggest planet on solar system', false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4500, 0, 'Has a cool ring', false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4500, 0, 'hehe', false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4500, 0, 'Farthest planet from the sun', false, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, NULL, 4, 'Habitable planet on proxima centauri system', true, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, NULL, 4, 'Super-Earth on Proxima Centauri system', false, true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 2, NULL, 4, 'Unconfirmed', false, true);
INSERT INTO public.planet VALUES (12, 'Gliese 784 b', 4, NULL, 20, 'Unconfirmed', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1, 'it''s our sun', 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 4, 'One of the closest star to solar system', 0.12);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 230, 9, 'brightest star in the night sky, located on constellation Canis Major', 2.06);
INSERT INTO public.star VALUES (4, 'Gliese 784', 1, NULL, 20, 'A red dwarf star located in the constellation of telescopium', 0.58);
INSERT INTO public.star VALUES (5, 'Barnard star', 1, 10000, 6, 'Fourth nearest known star to sun', 0.144);
INSERT INTO public.star VALUES (6, 'Ran', 1, 300, 10, 'A star in the constellation of Eridanus', 0.8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: discoverer discoverer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_pkey PRIMARY KEY (discoverer_id);


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
-- Name: discoverer unik; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT unik UNIQUE (discoverer_id);


--
-- Name: discoverer discoverer_galaxy_discovered_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_galaxy_discovered_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: discoverer discoverer_moon_discovered_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_moon_discovered_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: discoverer discoverer_planet_discovered_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_planet_discovered_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: discoverer discoverer_star_discovered_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoverer
    ADD CONSTRAINT discoverer_star_discovered_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

