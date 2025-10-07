--
-- PostgreSQL database dump
--

\restrict S8psekAHNgp1PLDM1e5hngFuJTGCY1h6BVP2x9CGlJcCHq1zT9TdfZoYfzG0vWI

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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
-- Name: Food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Food" (
    id text NOT NULL,
    name text NOT NULL,
    kcal integer NOT NULL,
    protein double precision NOT NULL,
    fat double precision NOT NULL,
    carbs double precision NOT NULL
);


ALTER TABLE public."Food" OWNER TO postgres;

--
-- Name: Meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Meal" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "takenAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Meal" OWNER TO postgres;

--
-- Name: MealItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MealItem" (
    id text NOT NULL,
    "mealId" text NOT NULL,
    "foodId" text NOT NULL,
    grams double precision NOT NULL
);


ALTER TABLE public."MealItem" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    phone text NOT NULL,
    password text NOT NULL,
    nickname text,
    "heightCm" integer,
    "weightKg" double precision,
    goal text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: WorkoutSession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WorkoutSession" (
    id text NOT NULL,
    "userId" text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    type text NOT NULL,
    "durationM" integer NOT NULL,
    reps integer
);


ALTER TABLE public."WorkoutSession" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: Food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Food" (id, name, kcal, protein, fat, carbs) FROM stdin;
cmggk30r50000vccgrw34ibtk	米饭	116	2.6	0.3	25.9
cmggk30r90001vccgh5m4yga8	鸡胸肉	133	24	3.1	0
cmggk30ra0002vccgdbc5v5ds	鸡蛋	144	12.7	10	1.3
cmggk30rb0003vccgjdzrjobx	燕麦片	371	13.7	7	62
cmggk30rc0004vccgi02ky13j	苹果	53	0.2	0.2	13.5
\.


--
-- Data for Name: Meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Meal" (id, "userId", "takenAt") FROM stdin;
cmggnukxd0001vclcsewrn011	cmggmknyu0000vcys98hz9f3r	2025-10-07 14:34:04.202
cmggnvodj0005vclc0tuhfocu	cmggmknyu0000vcys98hz9f3r	2025-10-07 14:34:55.394
cmggnx3oq0009vclcpzliph3x	cmggmknyu0000vcys98hz9f3r	2025-10-07 14:36:01.894
cmggny3rz000dvclczrvncxi2	cmggmknyu0000vcys98hz9f3r	2025-10-07 14:36:48.667
\.


--
-- Data for Name: MealItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MealItem" (id, "mealId", "foodId", grams) FROM stdin;
cmggnukxd0003vclcixdc0frp	cmggnukxd0001vclcsewrn011	cmggk30rb0003vccgjdzrjobx	110
cmggnvodj0007vclc85b0dvwc	cmggnvodj0005vclc0tuhfocu	cmggk30rb0003vccgjdzrjobx	154
cmggnx3oq000bvclc7zo7sfdm	cmggnx3oq0009vclcpzliph3x	cmggk30rc0004vccgi02ky13j	1000
cmggny3rz000fvclc9g347xdi	cmggny3rz000dvclczrvncxi2	cmggk30r50000vccgrw34ibtk	15000
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, phone, password, nickname, "heightCm", "weightKg", goal, "createdAt") FROM stdin;
cmggmknyu0000vcys98hz9f3r	13800000000	$2b$10$Fa1AG1vmNR04bWMVCvGkluA1lO3e6qNelQvY7ygMuQxq1repHSBdy	\N	\N	\N	\N	2025-10-07 13:58:22.039
\.


--
-- Data for Name: WorkoutSession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WorkoutSession" (id, "userId", date, type, "durationM", reps) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
fd3faa73-7e77-4b86-89fa-8c2f84a31735	1d2de38d4d058eed847493030e5796e9817de3eb1589da56b5e03cb8ddc5cc88	2025-10-07 18:33:11.637035+08	20251007103311_init	\N	\N	2025-10-07 18:33:11.618585+08	1
e85bb3f6-ade9-4770-888c-7eac252113b6	bbe39af43e210697dad8d04d80f3a3a0735c93d1ec572140621e2da86b6c60d5	2025-10-07 20:48:20.758531+08	20251007124820_food_name_unique	\N	\N	2025-10-07 20:48:20.754677+08	1
\.


--
-- Name: Food Food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Food"
    ADD CONSTRAINT "Food_pkey" PRIMARY KEY (id);


--
-- Name: MealItem MealItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealItem"
    ADD CONSTRAINT "MealItem_pkey" PRIMARY KEY (id);


--
-- Name: Meal Meal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Meal"
    ADD CONSTRAINT "Meal_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: WorkoutSession WorkoutSession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WorkoutSession"
    ADD CONSTRAINT "WorkoutSession_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Food_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Food_name_key" ON public."Food" USING btree (name);


--
-- Name: User_phone_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_phone_key" ON public."User" USING btree (phone);


--
-- Name: MealItem MealItem_foodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealItem"
    ADD CONSTRAINT "MealItem_foodId_fkey" FOREIGN KEY ("foodId") REFERENCES public."Food"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: MealItem MealItem_mealId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MealItem"
    ADD CONSTRAINT "MealItem_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES public."Meal"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Meal Meal_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Meal"
    ADD CONSTRAINT "Meal_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: WorkoutSession WorkoutSession_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WorkoutSession"
    ADD CONSTRAINT "WorkoutSession_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict S8psekAHNgp1PLDM1e5hngFuJTGCY1h6BVP2x9CGlJcCHq1zT9TdfZoYfzG0vWI

