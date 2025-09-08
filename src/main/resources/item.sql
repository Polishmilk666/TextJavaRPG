--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-08 14:31:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 24592)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    itemid bigint NOT NULL,
    itemname text,
    itemtype text,
    itemattack bigint,
    itemdefence bigint
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 4798 (class 0 OID 24592)
-- Dependencies: 219
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (1, 'Żelazny Hełm', 'helmet', 0, 5);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (2, 'Skórzana Zbroja', 'armor', 0, 10);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (3, 'Spodnie Wojownika', 'pants', 0, 7);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (4, 'Buty Szybkości', 'boots', 0, 3);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (5, 'Rękawice Siły', 'gloves', 1, 2);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (6, 'Miecz Stalowy', 'weapon', 12, 0);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (7, 'Drewniana Tarcza', 'shield', 0, 8);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (8, 'Brązowy Hełm', 'helmet', 0, 3);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (9, 'Brązowa Zbroja', 'armor', 0, 6);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (10, 'Brązowe Spodnie', 'pants', 0, 4);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (11, 'Brązowe Buty', 'boots', 0, 2);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (12, 'Brązowe Rękawice', 'gloves', 1, 1);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (13, 'Brązowy Miecz', 'weapon', 8, 0);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (14, 'Brązowa Tarcza', 'shield', 0, 5);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (15, 'Złoty Hełm', 'helmet', 0, 10);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (16, 'Złota Zbroja', 'armor', 0, 18);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (17, 'Złote Spodnie', 'pants', 0, 12);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (18, 'Złote Buty', 'boots', 0, 7);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (19, 'Złote Rękawice', 'gloves', 2, 5);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (20, 'Złoty Miecz', 'weapon', 20, 0);
INSERT INTO public.item (itemid, itemname, itemtype, itemattack, itemdefence) VALUES (21, 'Złota Tarcza', 'shield', 0, 15);


--
-- TOC entry 4652 (class 2606 OID 24598)
-- Name: item items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


-- Completed on 2025-09-08 14:31:12

--
-- PostgreSQL database dump complete
--

