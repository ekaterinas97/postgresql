--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    creator_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at character varying(255)
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer,
    requested_to_user_id integer,
    status_id integer,
    requested_at character varying(255),
    confirmed_at character varying(255)
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    body text,
    is_important character varying(255) DEFAULT NULL::character varying,
    is_delivered character varying(255) DEFAULT NULL::character varying,
    created_at character varying(255)
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(20),
    main_photo_id integer,
    created_at character varying(255)
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Community1	60	2022-03-27 01:19:59
2	GBCommunity	72	2023-08-17 18:14:45
3	BooksGroup	46	2022-06-15 06:36:11
4	MusicCommunity	1	2024-02-11 10:54:35
5	SQL	3	2022-09-03 14:06:40
6	Community9	69	2023-08-29 22:03:07
7	RockMusic	30	2022-08-16 10:31:11
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
1	30	2022-07-27 01:19:59
1	42	2022-08-27 01:19:59
1	70	2022-06-27 01:19:59
3	30	2022-07-27 01:19:59
2	24	2022-09-27 01:19:59
1	50	2022-10-27 01:19:59
4	80	2022-07-27 01:19:59
7	30	2022-07-27 01:19:59
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	28	90	3	2022-10-29 03:23:07	2022-08-17 18:55:39
2	100	4	1	2023-04-12 20:00:14	2023-08-29 20:16:21
3	3	15	2	2022-12-30 14:47:53	2023-07-22 23:10:46
4	63	93	1	2022-04-20 21:57:46	2022-03-22 06:51:07
5	62	35	3	2022-06-08 16:04:27	2022-04-07 05:21:43
6	97	57	1	2023-06-23 00:12:31	2022-08-15 10:37:29
7	25	46	3	2022-11-07 00:11:15	2023-10-17 09:12:21
8	76	57	2	2022-03-25 16:45:07	2022-09-23 00:25:08
9	96	31	2	2023-06-03 14:01:45	2024-02-22 12:06:49
10	1	46	3	2023-10-03 11:29:52	2022-11-14 05:50:20
11	28	96	2	2023-04-21 11:40:06	2023-03-04 22:50:16
12	4	73	2	2023-12-10 01:59:25	2022-11-04 04:56:14
13	22	72	3	2022-05-16 19:10:09	2022-10-28 20:08:35
14	75	7	1	2023-05-30 22:10:21	2022-08-05 00:50:58
15	14	76	1	2023-08-31 10:57:08	2023-04-03 06:30:26
16	93	96	3	2023-06-15 01:35:54	2023-05-12 19:21:26
17	70	15	2	2023-04-12 22:43:36	2022-06-17 03:38:18
18	2	8	3	2024-01-27 21:40:56	2023-04-28 23:36:35
19	65	60	2	2023-01-12 16:07:02	2022-12-16 10:52:08
20	91	25	3	2022-12-07 12:53:42	2023-05-17 20:06:01
21	73	37	2	2023-03-17 22:40:52	2023-12-02 01:49:38
22	56	65	3	2023-04-16 15:24:18	2023-07-15 21:40:28
23	98	16	2	2023-06-27 16:43:45	2022-11-26 01:24:19
24	27	69	2	2022-03-28 19:29:43	2022-07-06 16:19:45
25	95	79	1	2022-08-13 06:35:07	2022-09-12 12:32:15
26	50	36	3	2022-12-24 16:02:36	2023-12-25 10:05:39
27	81	57	3	2023-04-18 17:27:34	2024-02-02 11:12:43
28	16	15	2	2023-11-01 13:32:56	2023-02-24 08:38:16
29	62	51	3	2022-05-28 08:59:45	2022-07-12 06:37:39
30	73	85	2	2024-01-28 13:23:45	2023-11-28 22:12:27
31	75	93	1	2022-03-14 02:18:06	2022-07-18 21:29:59
32	95	50	1	2022-04-10 16:24:17	2023-06-09 14:59:40
33	29	28	2	2024-01-29 08:14:56	2022-05-17 23:06:54
34	24	22	2	2023-01-01 10:12:55	2022-07-17 21:58:01
35	20	26	1	2023-04-28 20:57:07	2022-04-16 10:15:37
36	30	97	3	2022-10-27 03:57:02	2022-08-31 07:05:01
37	33	72	3	2023-09-18 16:46:01	2022-02-25 08:12:12
38	92	4	2	2022-02-28 02:17:37	2023-04-13 05:05:03
39	12	34	2	2024-01-03 22:12:09	2022-04-14 22:57:03
40	42	24	1	2023-09-26 13:50:23	2022-12-07 03:08:39
41	15	4	1	2023-03-16 08:32:14	2023-04-03 03:42:38
42	48	23	1	2023-08-19 16:25:22	2022-06-16 17:08:58
43	81	79	1	2023-06-20 21:28:38	2022-02-27 14:54:53
44	45	29	3	2022-04-21 08:23:34	2022-11-16 06:36:23
45	58	72	1	2022-12-18 07:31:31	2022-03-21 02:32:19
46	33	39	3	2023-10-18 03:40:22	2022-12-10 11:41:13
47	59	12	2	2023-04-03 18:11:16	2024-01-15 16:55:27
48	88	23	2	2022-03-23 06:14:36	2023-06-03 07:03:23
49	29	90	1	2023-03-11 03:35:09	2022-03-25 15:52:34
50	82	32	3	2023-10-16 21:07:30	2022-10-16 15:28:18
51	17	81	3	2022-03-21 18:51:03	2023-05-21 15:26:20
52	2	59	2	2023-08-22 00:04:38	2023-05-27 14:53:10
53	96	50	3	2022-04-02 22:02:29	2023-04-20 15:57:25
54	95	61	3	2023-04-30 22:17:17	2023-05-14 11:50:45
55	99	15	2	2022-04-08 10:36:57	2023-04-13 11:39:05
56	58	29	1	2023-09-26 18:34:44	2023-10-01 15:22:00
57	5	4	2	2023-11-02 11:05:33	2023-04-22 14:54:37
58	58	94	2	2023-12-05 18:47:48	2022-04-30 10:25:26
59	51	59	1	2023-04-30 16:47:53	2022-06-30 01:14:14
60	6	51	2	2023-07-17 15:18:07	2024-01-24 08:23:26
61	40	6	1	2023-06-25 09:40:03	2023-06-06 17:21:10
62	80	30	2	2023-06-05 19:35:29	2023-04-27 23:55:49
63	44	49	1	2023-04-08 04:39:17	2023-09-22 00:03:23
64	100	37	1	2022-03-14 07:15:15	2024-02-08 16:25:24
65	21	79	1	2022-02-28 16:25:36	2023-02-24 05:19:19
66	37	50	1	2022-04-14 00:58:23	2023-04-24 20:33:50
67	71	98	3	2024-01-17 22:36:17	2023-12-26 11:34:26
68	16	78	2	2022-11-14 11:47:05	2022-12-24 19:33:36
69	22	47	2	2022-07-15 01:29:29	2023-04-29 12:29:34
70	16	38	1	2023-03-29 05:44:03	2023-03-29 19:49:20
71	34	57	3	2023-09-26 14:45:05	2022-12-27 19:08:14
72	85	75	2	2024-02-16 01:53:30	2022-03-17 15:16:31
73	75	76	2	2022-11-07 03:28:06	2022-05-04 02:30:29
74	80	34	2	2022-07-31 12:28:27	2023-03-22 20:25:24
75	5	18	2	2023-01-31 11:41:30	2023-06-25 09:42:44
76	68	88	2	2022-04-30 05:16:28	2022-05-25 20:16:33
77	17	75	3	2023-01-04 04:57:16	2022-08-13 14:58:31
78	13	87	3	2022-06-28 21:35:49	2023-05-11 22:54:22
79	40	95	3	2022-04-30 07:24:01	2023-07-14 17:47:59
80	50	75	3	2023-01-26 18:06:30	2022-09-19 22:45:21
81	15	21	2	2022-10-24 18:47:55	2023-02-05 19:06:33
82	44	95	2	2022-10-21 01:27:40	2023-11-22 12:08:21
83	16	67	1	2023-01-20 05:37:28	2022-07-11 05:26:08
84	60	2	1	2022-11-11 02:11:05	2023-11-14 09:25:54
85	45	2	2	2023-10-15 07:28:44	2022-06-01 10:12:39
86	54	44	3	2022-02-25 02:08:43	2022-10-21 06:05:44
87	18	74	2	2023-10-14 16:41:18	2023-02-26 00:49:37
88	96	54	1	2023-02-14 06:43:23	2022-05-24 22:41:36
89	33	16	2	2024-01-03 15:00:20	2022-06-10 05:59:49
90	52	90	1	2023-07-28 14:22:34	2022-11-08 13:32:36
91	64	63	2	2023-01-06 10:15:54	2023-09-09 16:44:18
92	93	87	2	2022-12-24 23:35:42	2022-05-16 20:25:59
93	80	79	3	2023-10-14 14:05:55	2022-11-02 15:57:29
94	21	93	3	2023-05-29 01:47:51	2023-09-06 11:04:35
95	94	26	2	2023-09-10 16:40:06	2022-09-06 17:14:15
96	20	31	1	2023-11-19 08:22:41	2024-01-04 08:20:55
97	65	98	1	2023-08-06 12:10:12	2024-02-10 16:33:50
98	60	62	2	2022-05-01 14:20:36	2023-06-22 19:57:59
99	87	97	2	2023-08-14 03:03:03	2023-07-09 23:48:43
100	45	9	3	2023-04-25 04:53:16	2023-06-07 14:49:20
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	accepted
2	rejected
3	awaited
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	9	66	leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh	0	1	2024-01-22 02:39:29
2	48	3	dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat,	0	0	2023-07-01 12:10:04
3	34	87	elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat	1	0	2022-05-14 01:28:39
4	70	9	sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam	1	0	2022-10-09 14:28:10
5	66	55	Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt	1	1	2022-11-06 19:21:41
6	21	69	lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac	1	1	2023-04-17 15:44:01
7	4	42	non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae	0	0	2022-10-11 19:18:47
8	99	78	mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	0	1	2022-10-14 16:44:56
9	74	4	amet massa. Quisque porttitor eros nec tellus. Nunc	0	1	2023-02-04 05:49:58
10	84	68	a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus.	0	0	2023-09-06 08:04:50
11	79	89	ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed	1	0	2022-08-26 01:02:38
12	7	27	diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,	0	1	2022-11-17 05:59:49
13	35	17	ultrices. Vivamus rhoncus. Donec est.	0	1	2023-01-18 18:47:33
14	99	75	Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in	0	0	2023-09-05 02:50:50
15	7	3	eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis.	0	0	2023-07-12 02:47:08
16	13	40	nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget	1	0	2022-08-04 21:52:20
17	3	45	scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus	1	0	2023-06-04 11:54:49
18	89	61	posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.	0	1	2023-03-19 09:53:28
19	94	18	et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor	1	1	2023-09-10 15:34:05
20	99	66	urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non,	1	1	2023-10-26 17:39:13
21	70	49	vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis	0	1	2023-08-26 07:13:55
22	7	22	mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere	1	1	2023-03-19 12:26:40
23	99	44	amet, consectetuer adipiscing elit. Curabitur sed tortor.	0	1	2023-02-17 04:24:42
24	94	9	velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui	1	0	2023-08-01 18:57:14
25	75	49	ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet	0	0	2024-02-22 13:31:17
26	9	56	Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec	1	0	2022-07-26 03:23:59
27	57	3	viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae	1	0	2023-01-02 22:12:27
56	64	73	quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean	1	0	2023-10-19 23:07:20
28	96	4	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit,	1	1	2023-05-27 08:21:52
29	84	95	mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus	0	0	2023-07-30 11:03:46
30	96	21	hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante	0	1	2022-11-30 22:48:31
31	41	91	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac	1	0	2023-11-08 22:10:10
32	67	39	molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed	0	0	2022-09-25 21:09:43
33	45	64	porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,	0	1	2022-04-26 05:36:43
34	26	41	Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci	0	1	2023-07-14 05:12:56
35	89	90	Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean	1	1	2024-01-29 07:44:55
36	61	37	parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus	1	1	2022-07-20 17:34:25
37	32	64	risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci	1	1	2023-02-25 00:13:35
38	82	7	malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque	0	1	2023-11-26 02:49:08
39	15	14	vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit	1	0	2023-04-24 08:52:27
40	53	81	adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus.	1	0	2023-09-25 13:32:03
41	39	18	euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum	0	0	2022-09-09 22:20:39
42	50	11	enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,	0	0	2023-12-07 04:43:21
43	35	69	lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut	1	0	2023-10-24 16:58:09
44	43	7	magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo	0	0	2022-05-21 10:04:28
45	1	44	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate,	1	1	2024-02-22 23:49:50
46	38	17	tellus sem mollis dui, in sodales elit	0	1	2023-12-27 13:06:04
47	57	96	mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit.	0	1	2022-03-09 09:30:13
48	46	95	fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum	1	1	2022-04-19 10:44:23
49	80	28	Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis	0	1	2022-11-13 14:22:38
50	25	80	Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa.	1	0	2023-01-13 07:48:17
51	86	11	Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id	0	1	2024-01-15 16:30:51
52	38	89	justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	0	1	2023-10-12 15:30:17
53	80	89	lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo	0	0	2022-03-25 10:18:51
54	77	35	ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra.	0	0	2022-06-03 07:17:45
55	72	77	mollis. Phasellus libero mauris, aliquam	0	0	2023-08-15 12:12:43
57	99	14	purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis	0	0	2023-07-10 13:13:51
58	61	28	dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non,	1	1	2022-04-12 07:23:02
59	99	99	Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu.	1	1	2022-04-10 14:59:23
60	76	41	Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu	0	1	2023-07-14 17:42:16
61	31	6	ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor	1	1	2024-02-21 15:49:03
62	82	34	at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis	0	0	2023-03-22 15:22:17
63	41	26	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed	0	1	2022-02-26 12:52:51
64	81	91	euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim	1	0	2023-08-29 23:18:25
65	1	50	diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse	1	0	2023-02-28 09:40:27
66	39	53	tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin	0	1	2024-01-06 11:11:50
67	9	8	auctor	1	1	2023-02-21 18:42:57
68	62	62	suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo	1	1	2023-03-25 05:09:57
69	8	76	metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse	1	1	2023-01-25 07:29:09
70	11	67	non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis	1	1	2023-06-29 18:20:32
71	82	52	suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet	1	1	2023-01-17 10:59:19
72	84	89	malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio	1	1	2023-07-18 17:36:29
73	38	6	placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est	0	1	2022-11-03 23:53:31
74	66	34	egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla	0	0	2022-12-02 12:28:33
75	48	25	blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante	1	1	2023-01-05 05:40:36
76	52	70	quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.	1	0	2022-10-04 14:19:50
77	70	22	elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan	0	0	2023-07-26 18:13:51
78	96	36	non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor	0	0	2023-10-12 14:16:04
79	27	17	eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.	1	0	2023-04-08 17:09:03
80	20	1	mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut	1	1	2023-02-09 02:46:04
81	16	9	Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus	1	1	2022-10-10 00:11:21
95	33	87	ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus.	0	1	2022-07-05 04:02:36
82	55	83	odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.	1	1	2022-09-04 16:31:14
83	61	66	Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor	0	0	2023-10-11 03:56:31
84	71	89	Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,	0	0	2022-10-07 20:43:47
85	42	13	metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a	0	1	2023-02-25 14:39:21
86	97	52	Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus	1	1	2024-01-06 17:55:00
87	24	54	Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel	1	0	2022-06-14 22:43:38
88	85	23	in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet	0	1	2023-08-29 06:02:48
89	69	20	placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus.	0	1	2022-06-21 20:44:49
90	11	94	in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc	0	1	2023-03-23 12:37:02
91	38	87	tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus	0	0	2023-03-31 02:21:37
92	37	64	vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing	0	0	2023-06-26 04:16:49
93	92	20	In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem	0	1	2022-08-20 19:19:19
94	38	17	ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam	0	0	2022-12-22 20:54:23
96	73	38	Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris	1	0	2023-12-31 10:33:08
97	59	31	quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	1	1	2022-09-01 17:17:12
98	34	88	sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula.	0	0	2023-12-16 11:27:41
99	83	67	non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	0	1	2023-11-11 02:28:41
100	99	47	lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor	0	1	2023-12-18 20:04:37
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Linus	Cardenas	nec.tempus@aol.com	1-192-588-8245	20	2023-03-27 12:39:58
2	Jeremy	Branch	pede.cras@icloud.com	1-582-560-9786	68	2022-03-01 15:36:39
3	Beau	Hale	nibh.lacinia.orci@icloud.org	(471) 666-4551	89	2024-02-17 18:35:29
4	Nevada	Whitehead	ut.nisi.a@google.couk	(417) 154-5836	45	2023-10-12 16:42:04
5	Cullen	Lambert	vel@yahoo.org	(964) 454-2504	61	2022-03-06 13:44:27
6	Jada	Farmer	sapien.cras@google.ca	1-442-663-4353	72	2023-07-25 15:27:56
7	Ignatius	Price	blandit.congue@protonmail.org	(458) 668-6524	58	2023-01-31 14:26:17
8	Rahim	Palmer	euismod@yahoo.ca	1-676-894-5897	50	2022-05-14 02:48:48
9	Whitney	Branch	lorem@hotmail.ca	(269) 554-4330	53	2022-12-24 12:06:53
10	Fredericka	Knowles	auctor.ullamcorper@yahoo.com	1-555-851-6664	54	2022-07-30 17:59:17
11	Riley	Bowen	nascetur.ridiculus@yahoo.org	(330) 132-2266	82	2022-11-24 07:15:04
12	Lamar	Romero	aptent.taciti@protonmail.ca	1-991-647-8527	55	2022-11-26 01:09:51
13	Baxter	O'Neill	in.faucibus.orci@aol.edu	1-595-992-8223	97	2023-04-03 06:10:54
14	Leigh	Dudley	massa.quisque@google.net	(272) 213-7079	13	2023-06-23 00:26:24
15	Gregory	Gordon	nascetur.ridiculus.mus@google.couk	(252) 300-1311	37	2023-01-26 13:52:26
16	Larissa	Osborn	iaculis@outlook.couk	1-843-584-3747	21	2023-07-11 11:03:28
17	Vivien	Hurley	magna.sed@google.org	(738) 753-9135	6	2023-12-11 01:36:28
18	Kimberly	Lewis	ut.aliquam.iaculis@yahoo.org	1-542-782-2994	62	2023-05-26 08:31:24
19	Ariel	Sheppard	ac.tellus.suspendisse@icloud.net	(213) 282-5487	69	2023-01-06 20:37:46
20	Sopoline	Johnson	ipsum.sodales@outlook.couk	(220) 453-9368	12	2022-12-27 16:30:01
21	Adrian	Cross	montes.nascetur@hotmail.com	(645) 492-5690	43	2022-05-20 08:21:06
22	Ulla	Olsen	luctus.ipsum@aol.com	(454) 861-4462	81	2024-02-13 02:21:11
23	Britanney	Johnston	auctor.mauris.vel@hotmail.net	1-542-549-4599	7	2022-08-04 03:28:39
24	Galena	Pratt	odio.tristique@protonmail.ca	(338) 848-2854	84	2023-01-30 12:00:04
25	Hermione	Roach	aenean.egestas@protonmail.net	(554) 864-8712	70	2022-11-14 13:45:44
26	Regina	Sandoval	sit@outlook.couk	(672) 740-6227	73	2022-04-17 20:57:00
27	Lester	Parks	ipsum.primis@google.com	(281) 142-3145	22	2023-01-12 16:37:08
28	Allen	Humphrey	ipsum.primis@aol.net	1-655-883-8913	100	2023-04-12 10:21:02
29	Basil	Mosley	massa.lobortis@outlook.com	(596) 719-5464	20	2023-12-04 08:12:54
30	Nina	Ashley	pharetra@hotmail.ca	1-882-987-3868	13	2024-01-19 15:31:32
31	Barclay	Adams	justo.proin.non@icloud.ca	(681) 556-1331	39	2022-03-14 14:07:08
32	Carl	Benson	ac.arcu@google.ca	1-363-825-8141	17	2023-09-20 02:17:58
33	Lamar	Marshall	eu.neque.pellentesque@aol.edu	(132) 991-7561	35	2022-09-11 00:11:12
34	Scott	Vargas	in.lobortis@hotmail.com	1-396-831-5884	90	2023-05-15 03:39:25
35	Sheila	Wiggins	id@google.org	1-211-695-9134	93	2023-01-29 07:22:24
36	Hall	Tran	torquent.per@hotmail.ca	1-931-203-2807	67	2022-07-13 07:58:52
37	Barrett	Wagner	magna.a@hotmail.net	1-890-242-9267	55	2023-01-31 23:16:03
38	Barclay	Conrad	tellus.non@hotmail.edu	(332) 260-9143	81	2023-07-25 22:29:34
39	Wynter	Hunt	eu.odio@aol.ca	(251) 176-2472	11	2022-06-28 06:40:23
40	Axel	Winters	proin.dolor.nulla@icloud.com	1-673-471-3123	7	2024-02-15 00:22:41
41	Inga	Gonzales	auctor.velit@protonmail.ca	1-771-491-3753	63	2022-07-14 09:04:30
42	Phyllis	Robles	molestie.arcu.sed@aol.edu	(661) 786-8587	21	2022-08-28 12:18:42
43	Yuri	Cobb	nisi@protonmail.org	(316) 819-2104	62	2022-08-09 21:36:23
44	Oleg	Mueller	non@yahoo.edu	1-299-712-7203	62	2023-04-23 13:06:14
45	Damon	Chase	ut.semper@icloud.org	(276) 280-2388	4	2023-09-30 03:53:55
46	Fulton	Cooper	suspendisse.commodo@yahoo.com	(630) 422-8372	22	2023-04-27 06:01:55
47	Simon	Shaw	ultrices@yahoo.ca	1-748-366-3259	15	2024-01-09 05:39:23
48	Hilel	Rojas	velit.justo@google.com	1-348-531-2333	36	2023-07-17 03:46:44
49	Wyatt	Brooks	imperdiet.ornare@aol.couk	1-624-454-5251	38	2023-10-20 15:23:40
50	Neve	Whitehead	mauris.molestie@protonmail.net	(741) 556-2088	15	2023-08-18 04:11:27
51	Kane	Rice	egestas.lacinia.sed@icloud.couk	(296) 413-8344	64	2023-06-05 14:55:49
52	Rhea	Weber	enim.sed.nulla@protonmail.ca	1-356-780-0772	11	2023-02-15 11:04:24
53	Murphy	Levine	imperdiet.dictum@outlook.net	1-983-533-1712	51	2023-05-28 16:36:46
54	Angela	Keith	sit.amet@aol.org	(822) 726-6041	25	2022-11-20 17:12:52
55	Candice	Odom	vivamus.nibh@google.org	(420) 707-4366	14	2023-12-31 05:59:31
56	Michelle	Olson	egestas@hotmail.edu	1-536-549-9516	57	2023-04-10 20:22:31
57	Ginger	Huber	sed.nec@yahoo.net	(358) 265-7521	51	2023-03-24 10:17:36
58	Britanni	Rosales	eget@aol.ca	(995) 673-7217	67	2023-07-28 07:35:27
59	Idola	Boyd	vehicula.risus@google.ca	(632) 848-7243	77	2023-12-05 08:04:28
60	Demetria	Armstrong	libero.dui.nec@protonmail.edu	(174) 364-1672	85	2022-10-12 20:56:11
61	Maisie	Mitchell	consequat.purus@icloud.ca	(306) 878-4136	55	2022-02-28 15:09:25
62	Magee	Pittman	a.tortor@icloud.com	1-866-888-4852	31	2023-02-23 23:02:56
63	Samson	Allison	porttitor.vulputate@yahoo.couk	1-362-588-8468	45	2023-02-03 10:00:42
64	Karen	Hudson	urna.et.arcu@yahoo.edu	(523) 439-1351	62	2022-10-27 17:24:29
65	Cruz	Neal	eu.eleifend@google.couk	(587) 983-5221	16	2024-02-05 03:00:26
66	Catherine	Shaffer	consectetuer.ipsum.nunc@icloud.org	1-768-677-7423	75	2022-10-06 14:01:29
67	Walter	Vargas	sapien.imperdiet@hotmail.couk	(795) 693-7442	33	2022-10-06 22:10:33
68	Jescie	Mccormick	nec.luctus.felis@protonmail.com	1-599-288-2666	1	2023-09-03 17:30:57
69	Dolan	Holder	phasellus.nulla.integer@hotmail.com	(355) 561-2521	97	2023-03-07 15:46:28
70	Garrett	Harper	ligula.nullam@hotmail.org	1-956-113-4359	25	2022-09-06 20:29:20
71	Geoffrey	Dillon	maecenas.libero.est@aol.edu	(245) 612-2306	52	2023-05-25 23:11:35
72	Wade	Mccarthy	montes@outlook.com	1-310-378-9511	35	2023-03-31 01:14:05
73	Natalie	Powell	ornare.sagittis@icloud.com	(413) 782-8297	4	2023-05-31 04:16:36
74	Caesar	Castaneda	pellentesque.habitant@yahoo.org	1-415-994-9467	21	2024-01-21 17:14:17
75	Blaze	Hester	auctor.quis@hotmail.org	1-414-798-0405	11	2023-11-30 18:43:57
76	Regan	Blanchard	pellentesque.tellus@outlook.edu	1-453-283-8081	96	2023-11-03 21:43:36
77	Noah	Mcleod	ante.ipsum@aol.edu	(443) 531-2665	56	2023-07-08 23:48:29
78	Vincent	Greene	luctus.ut.pellentesque@outlook.couk	(735) 891-0368	55	2022-04-27 01:21:40
79	Herrod	Hopkins	orci.phasellus@outlook.couk	(364) 574-7132	67	2023-07-26 03:28:04
80	Risa	Stewart	at.arcu@hotmail.ca	(224) 242-1865	48	2023-09-22 19:50:33
81	Oprah	Rocha	dictum.cursus@outlook.ca	1-659-533-4185	99	2022-03-08 01:57:02
82	Indigo	Cooley	sed@google.net	(542) 889-1457	10	2023-04-08 08:16:08
83	Bruno	Stark	semper.pretium@google.net	(557) 267-5681	24	2023-12-26 19:31:29
84	Mufutau	Guy	purus.duis@yahoo.couk	(719) 636-2602	96	2023-08-07 23:41:20
85	Patricia	Parks	nulla.dignissim@google.edu	1-286-617-7612	93	2022-10-13 09:32:34
86	Uriah	Whitley	varius.ultrices.mauris@google.com	1-234-361-4872	87	2023-11-07 23:13:08
87	Joelle	Lowe	est.mauris@google.edu	1-571-589-3587	11	2023-03-17 16:19:29
88	Cairo	Eaton	molestie.dapibus.ligula@yahoo.com	(234) 485-0239	15	2022-05-13 03:19:27
89	Charissa	O'brien	vivamus.nisi@aol.com	1-932-846-2673	39	2022-09-17 16:13:13
90	Mason	Soto	tellus.suspendisse.sed@outlook.net	(822) 475-2145	34	2023-02-04 03:40:44
91	Leonard	Hooper	id.ante.dictum@protonmail.com	(840) 517-1346	75	2022-11-01 17:53:55
92	Drew	Flynn	in.faucibus@hotmail.org	1-737-558-5037	27	2022-12-18 04:32:58
93	Griffith	Cline	eu.eleifend.nec@icloud.ca	1-632-536-9427	94	2022-10-26 20:55:26
94	Driscoll	Combs	semper.cursus.integer@icloud.com	1-350-875-0802	81	2023-05-16 00:47:09
95	Jescie	Peterson	aliquam.ultrices.iaculis@hotmail.org	(316) 429-4796	21	2022-05-04 21:19:37
96	Candice	Carpenter	orci.ut.semper@icloud.org	1-968-865-1634	83	2022-08-18 20:05:34
97	Jamal	Conrad	iaculis.quis@aol.net	1-398-156-1618	33	2023-10-22 10:22:02
98	Vaughan	Jensen	at@protonmail.net	1-486-740-2141	68	2023-03-18 06:55:36
99	Nita	Castillo	nisi.a@google.org	1-247-231-9187	81	2023-01-05 10:22:47
100	Gillian	Yates	dui@outlook.com	1-800-244-5804	4	2023-05-13 03:14:51
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 7, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 1, false);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

