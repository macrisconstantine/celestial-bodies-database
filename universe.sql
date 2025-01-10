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
    name character varying(50) NOT NULL,
    description text,
    size_in_light_years integer,
    older_than_milky_way boolean
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
    name character varying(50) NOT NULL,
    description text,
    planet_id integer,
    orbit_duration_in_days numeric(5,1)
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
    name character varying(50) NOT NULL,
    description text,
    star_id integer,
    colder_than_earth boolean,
    number_of_moons integer,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    description text,
    size_in_solar_radii numeric(5,1),
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Nearest large galaxy to the Milky Way', 152000, false);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'Two collided galaxies that resemble insect antennae', 500000, false);
INSERT INTO public.galaxy VALUES (3, 'Bear Claw', 'Resembles bear claw', 50, false);
INSERT INTO public.galaxy VALUES (4, 'Glass Z13', 'Considered oldest galaxy observed', 1600, true);
INSERT INTO public.galaxy VALUES (5, 'Eye of God', 'Bright, counterclockwise spiral arms', 200000, false);
INSERT INTO public.galaxy VALUES (6, 'Skyrocket', 'Looks like a July 4th firework', 2700, false);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Named from Greek/Roman myths of milk rivers', 100000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'The OG moon. What more needs to be said', 3, 27.3);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Discovered by Hall in 1877', 4, 1.3);
INSERT INTO public.moon VALUES (4, 'Phobos', 'Discovered by Hall in 1877', 4, 0.3);
INSERT INTO public.moon VALUES (5, 'Io', 'Discovered by Galileo in 1610', 5, 1.8);
INSERT INTO public.moon VALUES (6, 'Europa', 'Discovered by Galileo in 1610', 5, 3.6);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Discovered by Galileo in 1610', 5, 7.2);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Discovered by Galileo in 1610', 5, 16.7);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'Discovered by Barnard in 1892', 5, 0.5);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Discovered by Herschel in 1789', 6, 0.9);
INSERT INTO public.moon VALUES (11, 'Titan', 'Discovered by Huygens in 1656', 6, 16.0);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Discovered by Pickering in 1899', 6, 550.3);
INSERT INTO public.moon VALUES (14, 'Telesto', 'Discovered by Smith, et al. (Voyager 1) in 1980', 6, 1.9);
INSERT INTO public.moon VALUES (15, 'Atlas', 'Discovered by Terrile (Voyager 1)', 6, 0.6);
INSERT INTO public.moon VALUES (16, 'Prometheus', 'Discovered by Collins (Voyager 1)', 6, 0.6);
INSERT INTO public.moon VALUES (17, 'Pandora', 'Discovered by Collins (Voyager 1)', 6, 0.6);
INSERT INTO public.moon VALUES (18, 'Pan', 'Discovered by Showalter (Voyager 2)', 6, 0.6);
INSERT INTO public.moon VALUES (19, 'Ymir', 'Discovered by Gladman in 2000', 6, 1315.6);
INSERT INTO public.moon VALUES (20, 'Neso', 'Discovered by Holman, et al. in 2002', 8, 9740.7);
INSERT INTO public.moon VALUES (21, 'Kerberos', 'Discovered by Showalter (Hubble) in 2011', 10, 32.2);
INSERT INTO public.moon VALUES (22, 'Styx', 'Discovered by Showalter (Hubble) in 2012', 10, 20.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First planet from the sun', 5, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Closest in size to Earth', 5, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'We live here', 5, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Iron oxide makes it the Red Planet', 5, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'First of the solar system planets to form', 5, true, 95, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant made up of mostly hydrogen and helium', 5, true, 146, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Lowest temperature of the solar system planets', 5, true, 28, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Densest of the ice giants', 5, true, 16, 3);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Surface covered in water ice and carbonates like clay', 5, true, 0, 4);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Largest of the dwarf planets', 5, true, 5, 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 'First ring system found in a dwarf planet', 5, true, 2, 4);
INSERT INTO public.planet VALUES (12, 'Eris', 'Most massive, and second largest dwarf planet', 5, true, 1, 4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planet', 'Planet composed primarily of silicate, rocks, or metals');
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Giant planet composed mainly of hydrogen and helium');
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Giant planet composed mainly of oxygen, carbon, nitrogen, and sulfur');
INSERT INTO public.planet_type VALUES (4, 'Dwarf planet', 'Bodies orbiting the Sun with hydrostatic equilibrium but fail planet classification');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 'Brightest star in the Andromeda Galaxy', 3.0, 1);
INSERT INTO public.star VALUES (2, 'UY Scuti', 'Largest observed star', 909.0, 7);
INSERT INTO public.star VALUES (4, 'Antares', 'Supergiant 70000 times brighter than the sun', 832.0, 7);
INSERT INTO public.star VALUES (3, 'EBLM J0555-57Ab', 'Smallest observed star in Milky Way', 0.1, 7);
INSERT INTO public.star VALUES (5, 'The Sun', 'The center of our solar system', 1.0, 7);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'One of the only stars astronomers have photographed', 887.0, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

