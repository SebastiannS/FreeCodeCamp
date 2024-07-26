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
    name character varying(30) NOT NULL,
    star_count integer NOT NULL,
    size numeric(10,2) NOT NULL,
    age integer,
    description text,
    is_active boolean
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
    orbit_time integer NOT NULL,
    size numeric(10,2),
    crater_count integer,
    description text,
    is_active boolean,
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
    name character varying(30) NOT NULL,
    moon_count integer NOT NULL,
    distance_from_star numeric(10,2),
    radius integer,
    description text,
    is_active boolean,
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_date date NOT NULL,
    mission_type character varying(30),
    status character varying(20),
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    temperature integer,
    brightness numeric(10,2),
    description text,
    is_active boolean,
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200, 1.00, 13000, 'Our galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 150, 0.90, 10000, 'Neighbor galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 80, 0.70, 8000, 'Small galaxy', true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 60, 1.10, 6000, 'Elliptical galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 70, 0.80, 9000, 'Spiral galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 90, 0.60, 11000, 'Beautiful spiral', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 3474.00, 300000, 'Earths only natural satellite', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 22.40, 0, 'One of Mars moons', true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 12.40, 0, 'The smaller moon of Mars', true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 2, 3630.00, 0, 'One of Jupiters largest moons', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3121.00, 0, 'Jupiters moon with a possible ocean beneath its ice', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7, 5268.00, 0, 'The largest moon in the Solar System', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 17, 4821.00, 0, 'Jupiters heavily cratered moon', true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 5150.00, 0, 'Saturns largest moon', true, 6);
INSERT INTO public.moon VALUES (9, 'Triton', 6, 2706.80, 0, 'Neptunes largest moon', true, 8);
INSERT INTO public.moon VALUES (10, 'Charon', 153, 1212.00, 0, 'Plutos largest moon', true, 9);
INSERT INTO public.moon VALUES (11, 'Oberon', 13, 1523.00, 0, 'One of Uranus largest moons', true, 7);
INSERT INTO public.moon VALUES (12, 'Titania', 9, 1578.00, 0, 'The largest moon of Uranus', true, 7);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, 1528.00, 0, 'One of Saturns largest moons', true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 79, 1469.00, 0, 'Saturns moon with a unique two-tone coloration', true, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 3, 1123.00, 0, 'Another large moon of Saturn', true, 6);
INSERT INTO public.moon VALUES (16, 'Tethys', 2, 1066.00, 0, 'Saturns heavily cratered moon', true, 6);
INSERT INTO public.moon VALUES (17, 'Mimas', 1, 396.00, 0, 'A small moon of Saturn, known for the large Herschel crater', true, 6);
INSERT INTO public.moon VALUES (18, 'Enceladus', 1, 504.20, 0, 'Saturns moon with geysers of water ice', true, 6);
INSERT INTO public.moon VALUES (19, 'Miranda', 1, 471.60, 0, 'Uranus moon with a heavily varied surface', true, 7);
INSERT INTO public.moon VALUES (20, 'Ariel', 3, 1157.00, 0, 'One of Uranus five largest moons', true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 57.91, 2439, 'The closest planet to the Sun', true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 108.21, 6052, 'The second planet from the Sun', true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 149.60, 6371, 'The third planet from the Sun', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 227.92, 3389, 'The fourth planet from the Sun', true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 778.57, 69911, 'The largest planet in the Solar System', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 1427.00, 58232, 'Known for its ring system', true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 2871.00, 25362, 'The ice giant with a unique tilt', true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 4497.00, 24622, 'The farthest planet from the Sun', true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 5906.38, 1188, 'A dwarf planet in the Kuiper belt', true, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 10124.00, 1163, 'A dwarf planet and one of the largest known in the Solar System', true, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, 6493.00, 816, 'A dwarf planet known for its elongated shape', true, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 6860.00, 715, 'A dwarf planet discovered in 2005', true, 1);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', '1969-07-16', 'Lunar Exploration', 'Completed', NULL, NULL, 3, NULL);
INSERT INTO public.space_mission VALUES (2, 'Voyager 1', '1977-09-05', 'Interstellar Probe', 'Ongoing', NULL, NULL, NULL, NULL);
INSERT INTO public.space_mission VALUES (3, 'Mars Rover Curiosity', '2011-11-26', 'Mars Exploration', 'Ongoing', NULL, NULL, 7, NULL);
INSERT INTO public.space_mission VALUES (4, 'Hubble Space Telescope', '1990-04-24', 'Space Observation', 'Ongoing', NULL, NULL, NULL, NULL);
INSERT INTO public.space_mission VALUES (5, 'Juno', '2011-08-05', 'Jupiter Exploration', 'Ongoing', NULL, 5, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 460000000, 5778, 1000.00, 'The star at the center of our solar system', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 200000000, 10000, 2000.00, 'The brightest star in the night sky', true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000000, 3500, 500.00, 'A prominent red supergiant star in Orion', true, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 8000000, 12000, 800.00, 'A blue supergiant star in Orion', true, 4);
INSERT INTO public.star VALUES (5, 'Vega', 100000000, 9600, 1500.00, 'A bright star in the constellation Lyra', true, 5);
INSERT INTO public.star VALUES (6, 'Altair', 50000000, 7500, 1200.00, 'A bright star in the constellation Aquila', true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 8, true);


--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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
-- Name: space_mission space_mission_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE SET NULL;


--
-- Name: space_mission space_mission_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id) ON DELETE SET NULL;


--
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE SET NULL;


--
-- Name: space_mission space_mission_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

