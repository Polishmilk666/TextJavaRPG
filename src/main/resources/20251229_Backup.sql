--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-12-29 14:16:03

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
-- TOC entry 220 (class 1259 OID 24606)
-- Name: player_playerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_playerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.player_playerid_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 40965)
-- Name: enemy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enemy (
    enemyid bigint DEFAULT nextval('public.player_playerid_seq'::regclass) NOT NULL,
    enemyname text,
    enemyhp bigint,
    enemyattack bigint,
    enemylevel bigint
);


ALTER TABLE public.enemy OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32785)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventoryid integer NOT NULL,
    playerid integer,
    itemid integer,
    slot text,
    equipped boolean DEFAULT false
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32784)
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
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 221
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
-- TOC entry 218 (class 1259 OID 24580)
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    playerid bigint DEFAULT nextval('public.player_playerid_seq'::regclass) NOT NULL,
    playername text,
    playerhp bigint DEFAULT 100,
    playerxp bigint DEFAULT 1
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 4654 (class 2604 OID 32788)
-- Name: inventory inventoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventoryid SET DEFAULT nextval('public.inventory_inventoryid_seq'::regclass);


--
-- TOC entry 4817 (class 0 OID 40965)
-- Dependencies: 223
-- Data for Name: enemy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (6, 'Goblin', 35, 7, 1);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (7, 'Wilk', 40, 9, 2);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (8, 'Bandzior', 55, 12, 3);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (9, 'Szkielet', 60, 14, 4);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (10, 'Goblin', 35, 7, 1);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (11, 'Dziki Pies', 30, 6, 1);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (12, 'Wilk', 40, 9, 2);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (13, 'Ork Zwiadowca', 45, 10, 2);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (14, 'Bandzior', 55, 12, 3);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (15, 'Nietoperz Olbrzymi', 50, 11, 3);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (16, 'Szkielet', 60, 14, 4);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (17, 'Zombie', 65, 13, 4);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (18, 'Ork Wojownik', 75, 16, 5);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (19, 'Pająk Jaskiniowy', 70, 15, 5);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (20, 'Rycerz Upadły', 85, 18, 6);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (21, 'Wilkołak', 90, 19, 6);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (22, 'Ogr', 100, 22, 7);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (23, 'Widmo', 95, 20, 7);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (24, 'Troll', 120, 25, 8);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (25, 'Mag Cienia', 110, 23, 8);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (26, 'Smok Młody', 150, 30, 9);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (27, 'Demon Płomieni', 140, 28, 9);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (28, 'Czarny Rycerz', 170, 34, 10);
INSERT INTO public.enemy (enemyid, enemyname, enemyhp, enemyattack, enemylevel) VALUES (29, 'Lich', 160, 32, 10);


--
-- TOC entry 4816 (class 0 OID 32785)
-- Dependencies: 222
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory (inventoryid, playerid, itemid, slot, equipped) VALUES (1, 1, 1, 'helmet', true);
INSERT INTO public.inventory (inventoryid, playerid, itemid, slot, equipped) VALUES (2, 1, 2, 'armor', true);
INSERT INTO public.inventory (inventoryid, playerid, itemid, slot, equipped) VALUES (3, 1, 20, 'weapon', true);


--
-- TOC entry 4813 (class 0 OID 24592)
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
-- TOC entry 4812 (class 0 OID 24580)
-- Dependencies: 218
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.player (playerid, playername, playerhp, playerxp) VALUES (5, 'Gosiek', 100, 1);
INSERT INTO public.player (playerid, playername, playerhp, playerxp) VALUES (2, 'Mosiek', 100, 1);
INSERT INTO public.player (playerid, playername, playerhp, playerxp) VALUES (1, 'Loco', 100, 500);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 221
-- Name: inventory_inventoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventoryid_seq', 1, true);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 220
-- Name: player_playerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_playerid_seq', 29, true);


--
-- TOC entry 4664 (class 2606 OID 40972)
-- Name: enemy enemy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enemy
    ADD CONSTRAINT enemy_pkey PRIMARY KEY (enemyid);


--
-- TOC entry 4662 (class 2606 OID 32790)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);


--
-- TOC entry 4660 (class 2606 OID 24598)
-- Name: item items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


--
-- TOC entry 4658 (class 2606 OID 24586)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (playerid);


--
-- TOC entry 4665 (class 2606 OID 32798)
-- Name: inventory inventory_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.item(itemid) ON DELETE SET NULL;


--
-- TOC entry 4666 (class 2606 OID 32793)
-- Name: inventory inventory_playerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_playerid_fkey FOREIGN KEY (playerid) REFERENCES public.player(playerid) ON DELETE CASCADE;


-- Completed on 2025-12-29 14:16:03

--
-- PostgreSQL database dump complete
--

