--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-08 14:30:53

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
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 222
-- Name: inventory_inventoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventoryid_seq OWNED BY public.inventory.inventoryid;


--
-- TOC entry 4651 (class 2604 OID 32788)
-- Name: inventory inventoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN inventoryid SET DEFAULT nextval('public.inventory_inventoryid_seq'::regclass);


--
-- TOC entry 4803 (class 0 OID 32785)
-- Dependencies: 223
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory (inventoryid, playerid, itemid, equipped, slot) VALUES (2, 1, 2, true, 'armor');
INSERT INTO public.inventory (inventoryid, playerid, itemid, equipped, slot) VALUES (1, 1, 1, true, 'helmet');


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 222
-- Name: inventory_inventoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventoryid_seq', 1, false);


--
-- TOC entry 4654 (class 2606 OID 32790)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);


--
-- TOC entry 4655 (class 2606 OID 32798)
-- Name: inventory inventory_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.item(itemid) ON DELETE SET NULL;


--
-- TOC entry 4656 (class 2606 OID 32793)
-- Name: inventory inventory_playerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_playerid_fkey FOREIGN KEY (playerid) REFERENCES public.player(playerid) ON DELETE CASCADE;


-- Completed on 2025-09-08 14:30:53

--
-- PostgreSQL database dump complete
--

