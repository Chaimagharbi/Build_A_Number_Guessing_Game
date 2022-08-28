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

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

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
-- Name: users_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users_info (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    best_game integer,
    games_played integer
);


ALTER TABLE public.users_info OWNER TO freecodecamp;

--
-- Name: users_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_info_user_id_seq OWNED BY public.users_info.user_id;


--
-- Name: users_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_info ALTER COLUMN user_id SET DEFAULT nextval('public.users_info_user_id_seq'::regclass);


--
-- Data for Name: users_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users_info VALUES (6, 'Chaima', 8, 2);
INSERT INTO public.users_info VALUES (7, 'Lamia', 16, 1);
INSERT INTO public.users_info VALUES (9, 'user_1661708870151', 58, 2);
INSERT INTO public.users_info VALUES (8, 'user_1661708870152', 49, 5);
INSERT INTO public.users_info VALUES (11, 'user_1661708954567', 232, 2);
INSERT INTO public.users_info VALUES (10, 'user_1661708954568', 48, 5);


--
-- Name: users_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_info_user_id_seq', 11, true);


--
-- Name: users_info users_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_pkey PRIMARY KEY (user_id);


--
-- Name: users_info users_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

