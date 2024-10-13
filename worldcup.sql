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

-- ตรวจสอบว่ามีฐานข้อมูลอยู่หรือไม่ หากไม่มี ให้สร้างฐานข้อมูลใหม่
DO $$ 
BEGIN
   IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'worldcup') THEN
      RAISE NOTICE 'Database worldcup already exists';
   ELSE
      CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
      RAISE NOTICE 'Database worldcup created';
   END IF;
END $$;

\connect worldcup

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
-- สร้างตาราง games และ teams ตามคำสั่ง
-- 
CREATE TABLE public.teams (
    team_id serial PRIMARY KEY,
    name character varying(50) NOT NULL UNIQUE
);

CREATE TABLE public.games (
    game_id serial PRIMARY KEY,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL REFERENCES public.teams(team_id),
    opponent_id integer NOT NULL REFERENCES public.teams(team_id),
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);

ALTER TABLE public.games OWNER TO freecodecamp;
ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- เพิ่มการแทรกข้อมูลแบบปลอดภัยต่อการซ้ำซ้อนของข้อมูล
--
INSERT INTO public.teams (name) 
VALUES 
    ('France'),
    ('Croatia'),
    ('Belgium'),
    ('England'),
    ('Russia'),
    ('Sweden'),
    ('Brazil'),
    ('Uruguay'),
    ('Colombia'),
    ('Switzerland'),
    ('Japan'),
    ('Mexico'),
    ('Denmark'),
    ('Spain'),
    ('Portugal'),
    ('Argentina'),
    ('Germany'),
    ('Netherlands'),
    ('Costa Rica'),
    ('Chile'),
    ('Nigeria'),
    ('Algeria'),
    ('Greece'),
    ('United States')
ON CONFLICT (name) DO NOTHING;  -- ป้องกันการซ้ำซ้อนของข้อมูล

-- 
-- เพิ่มข้อมูลในตาราง games
-- 
INSERT INTO public.games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
VALUES 
    (2018, 'Final', 1, 2, 4, 2),
    (2018, 'Third Place', 3, 4, 2, 0),
    (2018, 'Semi-Final', 2, 4, 2, 1),
    (2018, 'Semi-Final', 1, 3, 1, 0),
    (2018, 'Quarter-Final', 2, 5, 3, 2),
    (2018, 'Quarter-Final', 4, 6, 2, 0),
    (2018, 'Quarter-Final', 3, 7, 2, 1),
    (2018, 'Quarter-Final', 1, 8, 2, 0),
    (2018, 'Eighth-Final', 4, 9, 2, 1),
    (2018, 'Eighth-Final', 6, 10, 1, 0),
    (2018, 'Eighth-Final', 3, 11, 3, 2),
    (2018, 'Eighth-Final', 7, 12, 2, 0),
    (2018, 'Eighth-Final', 2, 13, 2, 1),
    (2018, 'Eighth-Final', 5, 14, 2, 1),
    (2018, 'Eighth-Final', 8, 15, 2, 1),
    (2018, 'Eighth-Final', 1, 16, 4, 3),
    (2014, 'Final', 17, 16, 1, 0),
    (2014, 'Third Place', 18, 7, 3, 0),
    (2014, 'Semi-Final', 16, 18, 1, 0),
    (2014, 'Semi-Final', 17, 7, 7, 1),
    (2014, 'Quarter-Final', 18, 19, 1, 0),
    (2014, 'Quarter-Final', 16, 3, 1, 0),
    (2014, 'Quarter-Final', 7, 9, 2, 1),
    (2014, 'Quarter-Final', 17, 1, 1, 0),
    (2014, 'Eighth-Final', 7, 20, 2, 1),
    (2014, 'Eighth-Final', 9, 8, 2, 0),
    (2014, 'Eighth-Final', 1, 21, 2, 0),
    (2014, 'Eighth-Final', 17, 22, 2, 1),
    (2014, 'Eighth-Final', 18, 12, 2, 1),
    (2014, 'Eighth-Final', 19, 23, 2, 1),
    (2014, 'Eighth-Final', 16, 10, 1, 0),
    (2014, 'Eighth-Final', 3, 24, 2, 1);

--
-- อัปเดต sequence ของตาราง games และ teams
--
SELECT pg_catalog.setval('public.games_game_id_seq', (SELECT MAX(game_id) FROM public.games), true);
SELECT pg_catalog.setval('public.teams_team_id_seq', (SELECT MAX(team_id) FROM public.teams), true);
