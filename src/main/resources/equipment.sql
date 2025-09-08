--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-08 14:29:44

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
-- TOC entry 4798 (class 0 OID 24599)
-- Dependencies: 220
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.equipment (playerid, helmetid, armorid, pantsid, bootsid, glovesid, weaponid, shieldid) VALUES (1, 15, 9, 17, 4, 5, 20, 14);


--
-- TOC entry 4652 (class 2606 OID 24603)
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (playerid);


-- Completed on 2025-09-08 14:29:44

--
-- PostgreSQL database dump complete
--

