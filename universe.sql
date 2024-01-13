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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    class character varying(2) NOT NULL,
    dist_from_sun_au numeric(5,2),
    orbital_period_y numeric(5,2),
    rotational_period_h numeric(5,2),
    mean_density_gcm3 numeric(5,2)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(10),
    is_active boolean,
    diameter_kly numeric(5,2),
    distance_mly numeric(5,2),
    notes text
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
    planet_id integer NOT NULL,
    dist_from_planet_e3km numeric(7,2),
    mean_diameter_km integer,
    orbital_period_d double precision,
    mean_density double precision
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
    star_id integer NOT NULL,
    qty_moons integer,
    is_terrestrial boolean,
    has_water boolean
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
    galaxy_id integer NOT NULL,
    constellation character varying(30),
    qty_planets integer,
    temperature_k integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'G', 2.76, 4.60, 9.07, 2.16);
INSERT INTO public.asteroid VALUES (2, '4 Vesta', 'V', 2.36, 3.63, 5.34, 3.40);
INSERT INTO public.asteroid VALUES (3, '2 Pallas', 'B', 2.77, 4.62, 7.81, 3.40);
INSERT INTO public.asteroid VALUES (5, '3 Juno', 'S', 2.67, 4.36, 7.21, 3.20);
INSERT INTO public.asteroid VALUES (6, '433 Eros', 'S', 1.50, 1.76, 5.27, 2.67);
INSERT INTO public.asteroid VALUES (7, '21 Lutetia', 'M', 2.43, 3.80, 8.16, 3.40);
INSERT INTO public.asteroid VALUES (8, 'Gaspra', 'S', 2.21, 3.28, 7.00, 2.70);
INSERT INTO public.asteroid VALUES (9, '253 Mathilde', 'Cb', 2.64, 4.30, 17.40, 1.30);
INSERT INTO public.asteroid VALUES (4, '243 Ida', 'S', 2.86, 4.84, 4.63, 2.60);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', false, 100.00, 0.00, 'This is the galaxy where we live');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Irregular', false, 14.00, 0.16, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral', false, 220.00, 2.50, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Spiral', false, 37.00, 11.50, 'AKA Messier 82');
INSERT INTO public.galaxy VALUES (5, 'Pinweheel', 'Spiral', false, 170.00, 20.87, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', false, 50.00, 29.35, NULL);
INSERT INTO public.galaxy VALUES (7, 'Whrilpool', 'Spiral', false, 60.00, 30.00, NULL);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 'Spiral', false, 110.00, 61.00, NULL);
INSERT INTO public.galaxy VALUES (9, 'Tadpole', 'Spiral', false, 280.00, 420.00, NULL);
INSERT INTO public.galaxy VALUES (10, 'Hoag''s Object', 'Ring', false, 100.00, 600.00, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384.40, 3476, 27, 3.34);
INSERT INTO public.moon VALUES (2, 'Europa', 5, 670.90, 3121, 3.55, 3.01);
INSERT INTO public.moon VALUES (3, 'Io', 5, 421.70, 3642, 1.76, 3.53);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1070.40, 5268, 7.15, 1.93);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1882.70, 4820, 16.68, 1.83);
INSERT INTO public.moon VALUES (6, 'Ariel', 7, 190.90, 1158, 2.52, 1.67);
INSERT INTO public.moon VALUES (7, 'Miranda', 7, 129.87, 472, 1.41, 1.2);
INSERT INTO public.moon VALUES (8, 'Umbriel', 7, 266.60, 1169, 4.14, 1.4);
INSERT INTO public.moon VALUES (9, 'Titania', 7, 435.91, 1578, 8.7, 1.72);
INSERT INTO public.moon VALUES (10, 'Oberon', 7, 583.52, 1523, 13.46, 1.63);
INSERT INTO public.moon VALUES (11, 'Puck', 7, 86.00, 162, 0.76, 1.3);
INSERT INTO public.moon VALUES (12, 'Cressida', 7, 61.77, NULL, 0.46, 1.3);
INSERT INTO public.moon VALUES (13, 'Belinda', 7, 75.30, NULL, 0.625, 1.3);
INSERT INTO public.moon VALUES (14, 'Juliet', 7, 64.40, NULL, 0.479, 1.3);
INSERT INTO public.moon VALUES (15, 'Portia', 7, 66.10, NULL, 0.508, 1.3);
INSERT INTO public.moon VALUES (16, 'Cordelia', 7, 49.75, NULL, 0.342, 1.3);
INSERT INTO public.moon VALUES (17, 'Ophelia', 7, 53.76, NULL, 0.37, 1.3);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 185.52, 397, 0.942, 1.14);
INSERT INTO public.moon VALUES (19, 'Pan', 6, 133.58, 23, 6.9, 0.42);
INSERT INTO public.moon VALUES (20, 'Daphnis', 6, 136.51, 7, 0.592, 0.34);
INSERT INTO public.moon VALUES (21, 'Enceladus', 6, 237.38, 498, 1.36, 1.3);
INSERT INTO public.moon VALUES (22, 'Atlas', 6, 137.67, NULL, 0.6, 0.46);
INSERT INTO public.moon VALUES (23, 'Dione', 6, 377.39, 1123, 2.73, 1.5);
INSERT INTO public.moon VALUES (24, 'Tethys', 6, 294.62, 1066, 1.88, 0.9);
INSERT INTO public.moon VALUES (25, 'Rhea', 6, 527.11, 1528, 4.51, 1.23);
INSERT INTO public.moon VALUES (26, 'Titan', 6, 1221.87, 5152, 15.94, 1.87);
INSERT INTO public.moon VALUES (27, 'Iapetus', 6, 3560.82, 1474, 79.32, 1.27);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, true, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, true, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, true, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 95, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 146, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 27, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 14, false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 5, false, false);
INSERT INTO public.planet VALUES (10, 'Poxima Centauri b', 2, 0, true, NULL);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 b', 3, 0, true, NULL);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 c', 3, 0, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 8, 5778);
INSERT INTO public.star VALUES (3, 'Lalande 21185', 1, 'Ursa Major', 2, 3601);
INSERT INTO public.star VALUES (4, 'Lacaille 9352', 1, 'Piscis Austrinus', 2, 3688);
INSERT INTO public.star VALUES (5, 'Kepler-90', 1, 'Draco', 8, 5930);
INSERT INTO public.star VALUES (6, 'Kepler-150', 1, 'Lyra', 5, 5560);
INSERT INTO public.star VALUES (7, 'kepler-11', 1, 'Cygnus', 6, 5681);
INSERT INTO public.star VALUES (8, 'HD 219134', 1, 'Cassiopeia', 6, 4699);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Centaurus', 1, 3042);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

