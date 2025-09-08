--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-08 14:31:57

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 24599)
-- Name: equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment (
    playerid bigint NOT NULL,
    helmetid bigint,
    armorid bigint,
    pantsid bigint,
    bootsid bigint,
    glovesid bigint,
    weaponid bigint,
    shieldid bigint
);


ALTER TABLE public.equipment OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32785)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventoryid integer NOT NULL,
    playerid integer,
    itemid integer,
    equipped boolean DEFAULT false,
    slot text
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32784)
-- Name: inventory_inventoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_inventoryid_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 222
-- Name: inventory_inventoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventoryid_seq OWNED BY public.inventory.inventoryid;


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
-- TOC entry 221 (class 1259 OID 24606)
-- Name: player_playerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_playerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_playerid_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24580)
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    playerid bigint DEFAULT nextval('public.player_playerid_seq'::regclass) NOT NULL,
    playername text,
    playerlevel bigint DEFAULT 1,
    playerxp bigint DEFAULT 1
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 4658 (class 2604 OID 32788)
-- Name: inventory inventoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventoryid SET DEFAULT nextval('public.inventory_inventoryid_seq'::regclass);


--
-- TOC entry 4817 (class 0 OID 24599)
-- Dependencies: 220
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.equipment (playerid, helmetid, armorid, pantsid, bootsid, glovesid, weaponid, shieldid) VALUES (1, 15, 9, 17, 4, 5, 20, 14);


--
-- TOC entry 4820 (class 0 OID 32785)
-- Dependencies: 223
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory (inventoryid, playerid, itemid, equipped, slot) VALUES (2, 1, 2, true, 'armor');
INSERT INTO public.inventory (inventoryid, playerid, itemid, equipped, slot) VALUES (1, 1, 1, true, 'helmet');


--
-- TOC entry 4816 (class 0 OID 24592)
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
-- TOC entry 4815 (class 0 OID 24580)
-- Dependencies: 218
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.player (playerid, playername, playerlevel, playerxp) VALUES (1, 'Loco', 1, 1);
INSERT INTO public.player (playerid, playername, playerlevel, playerxp) VALUES (2, 'Mosiek', 1, 1);
INSERT INTO public.player (playerid, playername, playerlevel, playerxp) VALUES (3, '', 1, 1);
INSERT INTO public.player (playerid, playername, playerlevel, playerxp) VALUES (4, 'Gosiek', 1, 1);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 222
-- Name: inventory_inventoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventoryid_seq', 1, false);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 221
-- Name: player_playerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_playerid_seq', 4, true);


--
-- TOC entry 4665 (class 2606 OID 24603)
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (playerid);


--
-- TOC entry 4667 (class 2606 OID 32790)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);


--
-- TOC entry 4663 (class 2606 OID 24598)
-- Name: item items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


--
-- TOC entry 4661 (class 2606 OID 24586)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (playerid);


--
-- TOC entry 4668 (class 2606 OID 32798)
-- Name: inventory inventory_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.item(itemid) ON DELETE SET NULL;


--
-- TOC entry 4669 (class 2606 OID 32793)
-- Name: inventory inventory_playerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_playerid_fkey FOREIGN KEY (playerid) REFERENCES public.player(playerid) ON DELETE CASCADE;


-- Completed on 2025-09-08 14:31:57

--
-- PostgreSQL database dump complete
--

