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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1740232261681', 2, 258);
INSERT INTO public.users VALUES (23, 'user_1740234664245', 2, 776);
INSERT INTO public.users VALUES (1, 'user_1740232261682', 5, 430);
INSERT INTO public.users VALUES (3, 'shun', 1, 10);
INSERT INTO public.users VALUES (22, 'user_1740234664246', 5, 273);
INSERT INTO public.users VALUES (5, 'user_1740232563733', 2, 139);
INSERT INTO public.users VALUES (4, 'user_1740232563734', 5, 114);
INSERT INTO public.users VALUES (7, 'user_1740232709508', 2, 552);
INSERT INTO public.users VALUES (6, 'user_1740232709509', 5, 125);
INSERT INTO public.users VALUES (9, 'user_1740232745233', 2, 401);
INSERT INTO public.users VALUES (8, 'user_1740232745234', 5, 163);
INSERT INTO public.users VALUES (10, 'user_1740232843621', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1740232843620', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1740232882210', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1740232882209', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1740232937994', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1740232937993', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1740232997724', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1740232997723', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1740233883703', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1740233883702', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1740234343116', 2, 428);
INSERT INTO public.users VALUES (20, 'user_1740234343117', 5, 91);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 23, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

