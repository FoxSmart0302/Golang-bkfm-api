--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-03 07:19:09

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

--
-- TOC entry 5 (class 2615 OID 17044)
-- Name: atlas_schema_revisions; Type: SCHEMA; Schema: -; Owner: tradefoox
--

CREATE SCHEMA atlas_schema_revisions;


ALTER SCHEMA atlas_schema_revisions OWNER TO tradefoox;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: tradefoox
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO tradefoox;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: tradefoox
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 17045)
-- Name: atlas_schema_revisions; Type: TABLE; Schema: atlas_schema_revisions; Owner: tradefoox
--

CREATE TABLE atlas_schema_revisions.atlas_schema_revisions (
    version character varying NOT NULL,
    description character varying NOT NULL,
    type bigint DEFAULT 2 NOT NULL,
    applied bigint DEFAULT 0 NOT NULL,
    total bigint DEFAULT 0 NOT NULL,
    executed_at timestamp with time zone NOT NULL,
    execution_time bigint NOT NULL,
    error text,
    error_stmt text,
    hash character varying NOT NULL,
    partial_hashes jsonb,
    operator_version character varying NOT NULL
);


ALTER TABLE atlas_schema_revisions.atlas_schema_revisions OWNER TO tradefoox;

--
-- TOC entry 217 (class 1259 OID 17053)
-- Name: course_participants; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.course_participants (
    course_id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_user_id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.course_participants OWNER TO tradefoox;

--
-- TOC entry 218 (class 1259 OID 17058)
-- Name: courses; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.courses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_id uuid NOT NULL,
    name text NOT NULL,
    max_participants bigint,
    module_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    extern boolean,
    location_id uuid NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    instructor_id uuid NOT NULL
);


ALTER TABLE public.courses OWNER TO tradefoox;

--
-- TOC entry 219 (class 1259 OID 17064)
-- Name: instructors; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.instructors (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.instructors OWNER TO tradefoox;

--
-- TOC entry 220 (class 1259 OID 17070)
-- Name: locations; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.locations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_id uuid NOT NULL,
    name text NOT NULL,
    street text,
    zip_code text,
    city text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.locations OWNER TO tradefoox;

--
-- TOC entry 221 (class 1259 OID 17076)
-- Name: managers; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.managers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    active boolean DEFAULT false,
    avatar text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.managers OWNER TO tradefoox;

--
-- TOC entry 222 (class 1259 OID 17083)
-- Name: modules; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.modules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.modules OWNER TO tradefoox;

--
-- TOC entry 223 (class 1259 OID 17089)
-- Name: organisations; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.organisations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    school_id uuid NOT NULL,
    active boolean DEFAULT false,
    logo text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.organisations OWNER TO tradefoox;

--
-- TOC entry 224 (class 1259 OID 17096)
-- Name: school_companies; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.school_companies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_id uuid,
    name text NOT NULL,
    contact_person text,
    customer_number text,
    self_employed boolean DEFAULT false NOT NULL,
    email text,
    phone_number text,
    street text,
    zip text,
    city text,
    note text,
    logo text,
    zip_code text
);


ALTER TABLE public.school_companies OWNER TO tradefoox;

--
-- TOC entry 225 (class 1259 OID 17103)
-- Name: school_users; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.school_users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    school_id uuid NOT NULL,
    school_company_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text NOT NULL,
    doctor_type text,
    gender text,
    email text,
    driving_license text,
    birth_place text,
    birth_name text,
    birthname text,
    birth_date text,
    module95 text,
    school_company_name text
);


ALTER TABLE public.school_users OWNER TO tradefoox;

--
-- TOC entry 226 (class 1259 OID 17109)
-- Name: schools; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.schools (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text,
    domain text,
    email text,
    active boolean DEFAULT false,
    logo text,
    color text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.schools OWNER TO tradefoox;

--
-- TOC entry 227 (class 1259 OID 17116)
-- Name: users; Type: TABLE; Schema: public; Owner: tradefoox
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text,
    password text NOT NULL,
    active boolean DEFAULT false,
    avatar text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    manager boolean
);


ALTER TABLE public.users OWNER TO tradefoox;

--
-- TOC entry 4875 (class 0 OID 17045)
-- Dependencies: 216
-- Data for Name: atlas_schema_revisions; Type: TABLE DATA; Schema: atlas_schema_revisions; Owner: tradefoox
--

COPY atlas_schema_revisions.atlas_schema_revisions (version, description, type, applied, total, executed_at, execution_time, error, error_stmt, hash, partial_hashes, operator_version) FROM stdin;
\.


--
-- TOC entry 4876 (class 0 OID 17053)
-- Dependencies: 217
-- Data for Name: course_participants; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.course_participants (course_id, school_user_id) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 17058)
-- Dependencies: 218
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.courses (id, school_id, name, max_participants, module_id, created_at, updated_at, deleted_at, extern, location_id, start_date, end_date, instructor_id) FROM stdin;
1ee10f45-e3d1-4ec0-9eb1-9b080180941b	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test1	1	2430c56f-8fd7-4bba-bf2a-be4e1828b192	2023-10-26 06:51:33.11044-07	2023-10-26 06:51:33.11044-07	\N	f	2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	2023-10-26 06:47:06.774-07	2023-10-26 06:47:06.774-07	1e6f70c6-b9f9-4e00-8b6c-1738ba5d4ee2
2573a07b-b06e-442d-84dc-f862e03a4f70	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test2\n	1	2430c56f-8fd7-4bba-bf2a-be4e1828b192	2023-07-20 05:50:55.6902-07	2023-07-20 05:50:55.6902-07	\N	f	2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	2023-08-21 15:00:00-07	2023-08-25 15:00:00-07	e0a353b2-bfb0-4aad-be6f-94c9311a2851
49926485-b25e-4314-bd9a-ef9a3708a1b1	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test3	1	9a7ad70b-35b0-4437-8c77-c3eb95d816d8	2023-07-20 05:43:07.2938-07	2023-09-20 04:10:49.064201-07	\N	f	2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	2023-07-17 15:00:00-07	2023-07-20 15:00:00-07	34510fe4-fbe9-4463-a2dc-84df12064de0
554e9620-0562-4484-a5a7-81b61dd21b80	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test_participaints	1	2430c56f-8fd7-4bba-bf2a-be4e1828b192	2023-07-20 05:32:46.140699-07	2023-09-04 11:08:29.1628-07	\N	f	2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	2023-07-17 15:00:00-07	2023-07-20 15:00:00-07	e0a353b2-bfb0-4aad-be6f-94c9311a2851
9b25776d-a931-4063-9aad-15f61e6d4316	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test4	1	2430c56f-8fd7-4bba-bf2a-be4e1828b192	2023-10-26 17:45:10.132775-07	2023-10-26 17:45:10.132775-07	\N	f	05e5d3ba-425d-44ba-b261-a4715e0e4af4	2023-10-26 17:24:45.732-07	2023-10-26 17:24:45.732-07	1e6f70c6-b9f9-4e00-8b6c-1738ba5d4ee2
41c2704a-6a9a-4eb3-ac5f-dc02eb1170a6	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test	3	9a7ad70b-35b0-4437-8c77-c3eb95d816d8	2023-10-31 03:10:53.711925-07	2023-10-31 03:10:53.711925-07	\N	t	2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	2023-10-13 00:00:00-07	2023-11-09 00:00:00-08	79783e4c-488a-4604-9e82-d38c43c4a896
\.


--
-- TOC entry 4878 (class 0 OID 17064)
-- Dependencies: 219
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.instructors (id, school_id, name, created_at, updated_at, deleted_at) FROM stdin;
1e6f70c6-b9f9-4e00-8b6c-1738ba5d4ee2	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	smile1	2023-10-25 19:22:03.704551-07	2023-10-25 19:22:03.704551-07	\N
34510fe4-fbe9-4463-a2dc-84df12064de0	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	smile2\n	2023-07-20 03:54:20.034904-07	2023-07-20 03:54:20.034904-07	\N
79783e4c-488a-4604-9e82-d38c43c4a896	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	smile3	2023-09-20 02:53:15.796581-07	2023-09-20 02:53:15.796581-07	\N
c187feba-b880-4c85-b756-ec15eb562252	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	smile4	2023-10-26 02:23:28.117905-07	2023-10-26 02:23:28.117905-07	\N
e0a353b2-bfb0-4aad-be6f-94c9311a2851	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	smile5	2023-07-20 03:44:09.024461-07	2023-07-20 03:44:09.024461-07	\N
\.


--
-- TOC entry 4879 (class 0 OID 17070)
-- Dependencies: 220
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.locations (id, school_id, name, street, zip_code, city, created_at, updated_at, deleted_at) FROM stdin;
05e5d3ba-425d-44ba-b261-a4715e0e4af4	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	23423465	street321	12323	city234	2023-10-26 04:41:43.336505-07	2023-10-26 04:41:43.336505-07	\N
2e5ebc01-8b5a-4997-a66d-5e2bafc187a2	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	23423443	street245	35646	city564	2023-07-20 04:28:16.332022-07	2023-07-20 04:28:16.332022-07	\N
30d801a3-96d1-4309-aa22-94f21e0dbdf2	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	78543423	street123	24234	city123	2023-10-25 22:34:02.032999-07	2023-10-25 22:34:02.032999-07	\N
\.


--
-- TOC entry 4880 (class 0 OID 17076)
-- Dependencies: 221
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.managers (id, email, password, active, avatar, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4881 (class 0 OID 17083)
-- Dependencies: 222
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.modules (id, name) FROM stdin;
2430c56f-8fd7-4bba-bf2a-be4e1828b192	Module 1
d354428a-493e-4ebd-b70f-17dd6653f54e	Module 2 Truck
da85f494-41a3-4fc5-93de-2f4627c6e36a	Module 2 Bus
9a7ad70b-35b0-4437-8c77-c3eb95d816d8	Module 2 Truck & Bus
16a1dc69-88ba-4426-82f4-b5fc0befd047	Module 4 Truck
1b242a5c-e3de-463c-95df-1c4ff3b26df2	Module 4 Bus
52e61676-ed96-4cf5-8c33-02ac25d9277b	Module 4 Truck & Bus
6f061d14-76ed-4cc9-bee8-fa8d74b88aae	Module 5 Truck
e8633ead-91af-4cdb-bcd7-fabd0742f04a	Module 5 Bus
14e1d161-eb0d-4d31-8c77-c6832cac0881	Module 5 Truck & Bus
557fe1cc-65e3-4d8c-9ce9-f5ce1d0bd1f7	Module 3
\.


--
-- TOC entry 4882 (class 0 OID 17089)
-- Dependencies: 223
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.organisations (id, name, email, school_id, active, logo, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 17096)
-- Dependencies: 224
-- Data for Name: school_companies; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.school_companies (id, school_id, name, contact_person, customer_number, self_employed, email, phone_number, street, zip, city, note, logo, zip_code) FROM stdin;
6efd00d0-a4ef-4fd2-bbf3-3447a2365c1e	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	Jein4	allen	123465	f	jein@iacaam	1234656798	address78	\N	city56			12352
5b9db3f3-95ff-4548-ad35-8ca205689301	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	Jein2	allen	123465	f	jein@iacaam.com	1234656798	address78	\N	city56			12352
2ecc70e8-591b-46e9-92c7-8a1fea319139	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	Jein1	allen	123465	f	jein@iacaam.com	1234656798	address78	\N	city56			12352
5d647615-5cc0-4688-b417-5d1e14bd114c	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	Jein312	1234	1234	f	1234@iccam.com	1234	1234	\N	1234	1234		1234
eef95dd2-e4f8-4ede-97e2-e6e12d06e0b1	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	test	test	test	f	test@iccam.com	test	test	\N	test			234
\.


--
-- TOC entry 4884 (class 0 OID 17103)
-- Dependencies: 225
-- Data for Name: school_users; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.school_users (id, school_id, school_company_id, user_id, created_at, updated_at, deleted_at, name, doctor_type, gender, email, driving_license, birth_place, birth_name, birthname, birth_date, module95, school_company_name) FROM stdin;
b40b4bf8-63ee-46d3-a6a1-37d486c0619e	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	5d647615-5cc0-4688-b417-5d1e14bd114c	dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	2023-10-29 15:07:38.139584-07	2023-10-30 23:36:12.328639-07	\N	Oliver Kalaczyaski	test	test	test@gmail.com	CE	Michix	\N	test	2023-10-24T15:07	2023-01-11T15:06	Jein3
60babbf1-84a7-4206-bdd2-b802f0c105d5	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	5b9db3f3-95ff-4548-ad35-8ca205689301	dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	2023-10-28 19:14:14.099-07	2023-10-30 23:36:26.200482-07	\N	Oliver Kalaczyaski	test	test	maximstehr@web.de	CE	Michix	\N	Alex	2023-10-18T13:34	2023-10-19T13:39	Jein2
b7934456-0d7b-4421-ad72-0cb69741e8c9	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	5b9db3f3-95ff-4548-ad35-8ca205689301	dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	2023-10-31 03:08:09.811463-07	2023-10-31 03:08:09.811463-07	\N	test	test	teset	test@iccam.com	CE	test	\N	test	2023-10-12T03:07	2023-10-12T03:08	Jein2
98e625e7-920e-45e8-b6c0-4fbc18ec36cf	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	5d647615-5cc0-4688-b417-5d1e14bd114c	dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	2023-10-29 15:41:45.136946-07	2023-10-30 01:47:44.880736-07	\N	Oliver Kalaczyaski	test	test	maximstehr@web.de	CE	Michix	\N	Alex	2023-10-18T13:34	2023-10-19T13:39	Jein3
23ac8b78-98f3-4351-bf93-6e6102c338e6	d412d80d-6b59-45a4-ab2d-d75ad48c06d4	5d647615-5cc0-4688-b417-5d1e14bd114c	dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	2023-10-29 15:41:51.754586-07	2023-10-30 02:49:57.699913-07	\N	Oliver Kalaczyaski	test	test	maximstehr@web.de	CE	Michix	\N	Alex	2023-10-18T13:34	2023-10-19T13:39	Jein3
\.


--
-- TOC entry 4885 (class 0 OID 17109)
-- Dependencies: 226
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.schools (id, name, domain, email, active, logo, color, created_at, updated_at, deleted_at) FROM stdin;
2b988b6b-01e7-4ab2-ac60-71a5d95f8c76	Akademie 2	akademie2.bkfm.local	akademie2.test@iaccam.com	t	https://placehold.co/512x256	#0eeca1	2023-07-16 19:21:17.549115-07	2023-07-16 19:21:17.549115-07	\N
3cd03c8f-33aa-4f2a-bf40-ce03e121fefa	Akademie 3	akademie3.bkfm.local	akademie3.test@iaccam.com	t	https://placehold.co/512x256	#d91da6	2023-07-16 19:21:17.791221-07	2023-07-16 19:21:17.791221-07	\N
d412d80d-6b59-45a4-ab2d-d75ad48c06d4	Akademie 1	akademie1.bkfm.local	akademie1.test@iaccam.com	t	https://placehold.co/512x256	#c006a4	2023-07-16 19:21:17.27613-07	2023-07-16 19:21:17.27613-07	\N
\.


--
-- TOC entry 4886 (class 0 OID 17116)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tradefoox
--

COPY public.users (id, name, email, password, active, avatar, created_at, updated_at, deleted_at, manager) FROM stdin;
0189c0df-604c-40a8-9d8a-1e9ccbcec1ea	Fahrer6 Akademie3	fahrer6.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.943135-07	2023-07-16 19:21:17.943135-07	\N	f
0bcac20e-fa7b-43bf-825e-15074085f0a0	Fahrer9 Akademie1	fahrer9.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.507339-07	2023-07-16 19:21:17.507339-07	\N	f
169c0f44-6299-430d-8183-8d281d8897bd	Fahrer2 Akademie2	fahrer2.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.620203-07	2023-07-16 19:21:17.620203-07	\N	f
17e1ed8c-d406-49d3-8a03-f42e0168bc2c	Fahrer2 Akademie1	fahrer2.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.355539-07	2023-07-16 19:21:17.355539-07	\N	f
1a9edf60-d537-4929-82ee-2f5e6f72ac31	Fahrer4 Akademie2	fahrer4.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.661033-07	2023-07-16 19:21:17.661033-07	\N	f
1e75a719-a47f-49e2-9638-3410c720fd4d	Fahrer3 Akademie2	fahrer3.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.643416-07	2023-07-16 19:21:17.643416-07	\N	f
23f0b922-b044-4967-9689-0f18cb80fb49	Fahrer8 Akademie3	fahrer8.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.984042-07	2023-07-16 19:21:17.984042-07	\N	f
2ac7be85-766d-479f-9720-cf9caaded00f	Fahrer3 Akademie1	fahrer3.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.374491-07	2023-07-16 19:21:17.374491-07	\N	f
430ebf02-4073-4866-860b-e5b4d93490e9	Fahrer7 Akademie2	fahrer7.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.71749-07	2023-07-16 19:21:17.71749-07	\N	f
49930bf3-61e9-4e66-bdf2-98a8943b1c76	Fahrer8 Akademie2	fahrer8.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.735635-07	2023-07-16 19:21:17.735635-07	\N	f
488313e4-3e72-4576-8c1f-8712fc2d78d9	Manager1 Akademie1	manager1.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.287265-07	2023-07-16 19:21:17.287265-07	\N	t
4ac1c584-48ee-4d09-b35f-3bff0e682952	Fahrer1 Akademie2	fahrer1.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.599526-07	2023-07-16 19:21:17.599526-07	\N	f
5658dc9b-811a-4fab-84f9-65c0329705f3	Fahrer10 Akademie3	fahrer10.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:18.020114-07	2023-07-16 19:21:18.020114-07	\N	f
6055307f-ba8b-445d-aada-5b0929281692	Fahrer9 Akademie2	fahrer9.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.75464-07	2023-07-16 19:21:17.75464-07	\N	f
61192f5a-e031-40c1-9e98-8eb1f9c8a7b6	Fahrer2 Akademie3	fahrer2.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.8555-07	2023-07-16 19:21:17.8555-07	\N	f
80932c29-cf7d-4671-93ec-a905d7cfecf6	Fahrer4 Akademie3	fahrer4.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.900894-07	2023-07-16 19:21:17.900894-07	\N	f
856a5550-4756-4378-bc89-ed7deb624fc2	Fahrer10 Akademie2	fahrer10.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.77358-07	2023-07-16 19:21:17.77358-07	\N	f
97742387-7cc6-4e40-9562-a269d3c252e7	Fahrer7 Akademie3	fahrer7.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.965594-07	2023-07-16 19:21:17.965594-07	\N	f
a22be600-f689-4e21-a253-2eda92f9d33e	Fahrer1 Akademie3	fahrer1.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.835648-07	2023-07-16 19:21:17.835648-07	\N	f
a3c4f112-0aae-40ee-8b53-8814c3c28fc5	Fahrer10 Akademie1	fahrer10.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.527352-07	2023-07-16 19:21:17.527352-07	\N	f
a4c7f5ee-7ed5-42bb-8361-eb3067f467f8	Fahrer1 Akademie1	fahrer1.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.333479-07	2023-07-16 19:21:17.333479-07	\N	f
a8180720-af0f-4a31-9abd-cea73e9a3077	Fahrer5 Akademie1	fahrer5.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.420255-07	2023-07-16 19:21:17.420255-07	\N	f
a9b7f4a8-7c4d-4c8d-a7de-174d08dacacf	Fahrer7 Akademie1	fahrer7.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.471241-07	2023-07-16 19:21:17.471241-07	\N	f
b8d6b167-1253-4ebc-924b-adaea27ec7e7	Fahrer3 Akademie3	fahrer3.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.880366-07	2023-07-16 19:21:17.880366-07	\N	f
c8a7b81a-7ed7-4411-b1ff-c864217df089	Fahrer9 Akademie3	fahrer9.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:18.000884-07	2023-07-16 19:21:18.000884-07	\N	f
dbd04bb5-fbc9-43d1-9787-59cc4ebf9921	Fahrer6 Akademie1	fahrer6.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.445105-07	2023-07-16 19:21:17.445105-07	\N	f
dbdb48cf-448f-48d1-86ac-84bf266d410d	Fahrer5 Akademie3	fahrer5.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.923815-07	2023-07-16 19:21:17.923815-07	\N	f
df103fd7-d16b-4458-8efd-ae98af85ef67	Fahrer8 Akademie1	fahrer8.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.490426-07	2023-07-16 19:21:17.490426-07	\N	f
f61e1232-c589-4e95-b46a-f587b0b06f50	Fahrer5 Akademie2	fahrer5.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.678115-07	2023-07-16 19:21:17.678115-07	\N	f
fa004175-3362-4adb-9a1d-c68481783014	Fahrer6 Akademie2	fahrer6.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.695333-07	2023-07-16 19:21:17.695333-07	\N	f
fd54b9a2-b83f-4c91-99b4-fde94bbf3336	Fahrer4 Akademie1	fahrer4.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.398567-07	2023-07-16 19:21:17.398567-07	\N	f
88b2a0b2-8c51-4912-b0c4-f785387f454a	Manager1 Akademie3	manager1.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.800388-07	2023-07-16 19:21:17.800388-07	\N	t
b52fe98e-4ac2-4e94-9e42-b82bbd301674	Manager2 Akademie3	manager2.akademie3.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.817735-07	2023-07-16 19:21:17.817735-07	\N	t
cbfed85a-ffbb-4c1a-82ea-8368e1122851	Manager2 Akademie2	manager2.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.580711-07	2023-07-16 19:21:17.580711-07	\N	t
dd91e29f-a91d-411a-a5f5-f3d8eac22f8f	Manager1 Akademie2	manager1.akademie2.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.559062-07	2023-07-16 19:21:17.559062-07	\N	t
ed34089d-aa47-4c2e-934c-4290645a77e8	Manager2 Akademie1	manager2.akademie1.test@iaccam.com	test1234	t	https://placehold.co/256x256	2023-07-16 19:21:17.310151-07	2023-07-16 19:21:17.310151-07	\N	t
\.


--
-- TOC entry 4683 (class 2606 OID 17125)
-- Name: atlas_schema_revisions atlas_schema_revisions_pkey; Type: CONSTRAINT; Schema: atlas_schema_revisions; Owner: tradefoox
--

ALTER TABLE ONLY atlas_schema_revisions.atlas_schema_revisions
    ADD CONSTRAINT atlas_schema_revisions_pkey PRIMARY KEY (version);


--
-- TOC entry 4685 (class 2606 OID 17127)
-- Name: course_participants course_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.course_participants
    ADD CONSTRAINT course_participants_pkey PRIMARY KEY (course_id, school_user_id);


--
-- TOC entry 4687 (class 2606 OID 17129)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 17131)
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- TOC entry 4694 (class 2606 OID 17133)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 17135)
-- Name: managers managers_email_key; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_email_key UNIQUE (email);


--
-- TOC entry 4700 (class 2606 OID 17137)
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 17139)
-- Name: modules modules_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 17141)
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 17143)
-- Name: school_companies school_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_companies
    ADD CONSTRAINT school_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 17145)
-- Name: school_users school_users_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_users
    ADD CONSTRAINT school_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 17147)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 17149)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4688 (class 1259 OID 17150)
-- Name: idx_courses_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_courses_deleted_at ON public.courses USING btree (deleted_at);


--
-- TOC entry 4689 (class 1259 OID 17151)
-- Name: idx_instructors_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_instructors_deleted_at ON public.instructors USING btree (deleted_at);


--
-- TOC entry 4692 (class 1259 OID 17152)
-- Name: idx_locations_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_locations_deleted_at ON public.locations USING btree (deleted_at);


--
-- TOC entry 4695 (class 1259 OID 17153)
-- Name: idx_managers_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_managers_deleted_at ON public.managers USING btree (deleted_at);


--
-- TOC entry 4696 (class 1259 OID 17154)
-- Name: idx_managers_email; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_managers_email ON public.managers USING btree (email);


--
-- TOC entry 4703 (class 1259 OID 17155)
-- Name: idx_organisations_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_organisations_deleted_at ON public.organisations USING btree (deleted_at);


--
-- TOC entry 4704 (class 1259 OID 17156)
-- Name: idx_organisations_email; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_organisations_email ON public.organisations USING btree (email);


--
-- TOC entry 4705 (class 1259 OID 17157)
-- Name: idx_organisations_name; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_organisations_name ON public.organisations USING btree (name);


--
-- TOC entry 4710 (class 1259 OID 17158)
-- Name: idx_school_users_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_school_users_deleted_at ON public.school_users USING btree (deleted_at);


--
-- TOC entry 4713 (class 1259 OID 17159)
-- Name: idx_schools_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_schools_deleted_at ON public.schools USING btree (deleted_at);


--
-- TOC entry 4716 (class 1259 OID 17160)
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: tradefoox
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- TOC entry 4719 (class 2606 OID 17161)
-- Name: course_participants fk_course_participants_course; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.course_participants
    ADD CONSTRAINT fk_course_participants_course FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4720 (class 2606 OID 17166)
-- Name: course_participants fk_course_participants_school_user; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.course_participants
    ADD CONSTRAINT fk_course_participants_school_user FOREIGN KEY (school_user_id) REFERENCES public.school_users(id);


--
-- TOC entry 4721 (class 2606 OID 17171)
-- Name: courses fk_courses_instructor; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- TOC entry 4722 (class 2606 OID 17176)
-- Name: courses fk_courses_location; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_location FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- TOC entry 4723 (class 2606 OID 17181)
-- Name: courses fk_courses_module; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_module FOREIGN KEY (module_id) REFERENCES public.modules(id);


--
-- TOC entry 4724 (class 2606 OID 17186)
-- Name: courses fk_courses_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4725 (class 2606 OID 17191)
-- Name: instructors fk_instructors_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT fk_instructors_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4726 (class 2606 OID 17196)
-- Name: locations fk_locations_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_locations_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4727 (class 2606 OID 17201)
-- Name: organisations fk_organisations_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT fk_organisations_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4728 (class 2606 OID 17206)
-- Name: school_companies fk_school_companies_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_companies
    ADD CONSTRAINT fk_school_companies_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4729 (class 2606 OID 17211)
-- Name: school_users fk_school_users_school; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_users
    ADD CONSTRAINT fk_school_users_school FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 4730 (class 2606 OID 17255)
-- Name: school_users fk_school_users_school_company; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_users
    ADD CONSTRAINT fk_school_users_school_company FOREIGN KEY (school_company_id) REFERENCES public.school_companies(id) NOT VALID;


--
-- TOC entry 4731 (class 2606 OID 17221)
-- Name: school_users fk_school_users_user; Type: FK CONSTRAINT; Schema: public; Owner: tradefoox
--

ALTER TABLE ONLY public.school_users
    ADD CONSTRAINT fk_school_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: tradefoox
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2023-11-03 07:19:09

--
-- PostgreSQL database dump complete
--

