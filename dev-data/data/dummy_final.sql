--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:xiF/kSQ1r/Q5EqvyUnjK2A==$4X2DjZVHzPp415kQJpvc2N9YYrLw2g8GGH661AWPlAw=:3CzSdKDyQXmhXrVRPL076/SHezhu36C+i8jtrACNAuw=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    name text
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_author_id_seq OWNER TO postgres;

--
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- Name: author_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author_books (
    id bigint NOT NULL,
    author_id integer NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.author_books OWNER TO postgres;

--
-- Name: author_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_books_id_seq OWNER TO postgres;

--
-- Name: author_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_books_id_seq OWNED BY public.author_books.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id bigint NOT NULL,
    isbn13 character varying(255),
    isbn10 character varying(255),
    title character varying(255),
    subtitle character varying(255),
    thumbnail character varying(1000),
    description text,
    published_year integer,
    average_rating double precision,
    num_pages integer,
    ratings_count integer,
    price double precision NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_books (
    id bigint NOT NULL,
    category_id integer NOT NULL,
    book_id bigint NOT NULL
);


ALTER TABLE public.category_books OWNER TO postgres;

--
-- Name: category_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_books_id_seq OWNER TO postgres;

--
-- Name: category_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_books_id_seq OWNED BY public.category_books.id;


--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: library; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library (
    library_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.library OWNER TO postgres;

--
-- Name: library_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library_books (
    id bigint NOT NULL,
    num_copies integer NOT NULL,
    book_id bigint NOT NULL,
    library_id integer NOT NULL
);


ALTER TABLE public.library_books OWNER TO postgres;

--
-- Name: library_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_books_id_seq OWNER TO postgres;

--
-- Name: library_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_books_id_seq OWNED BY public.library_books.id;


--
-- Name: library_library_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_library_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_library_id_seq OWNER TO postgres;

--
-- Name: library_library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_library_id_seq OWNED BY public.library.library_id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    reservation_id integer NOT NULL,
    created_at date NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- Name: reservations_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations_books (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    book_id bigint NOT NULL,
    reservation_id integer NOT NULL
);


ALTER TABLE public.reservations_books OWNER TO postgres;

--
-- Name: reservations_books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservations_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservations_books_id_seq OWNER TO postgres;

--
-- Name: reservations_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservations_books_id_seq OWNED BY public.reservations_books.id;


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservations_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservations_reservation_id_seq OWNER TO postgres;

--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservations_reservation_id_seq OWNED BY public.reservations.reservation_id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


--
-- Name: author_books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_books ALTER COLUMN id SET DEFAULT nextval('public.author_books_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: category_books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_books ALTER COLUMN id SET DEFAULT nextval('public.category_books_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: library library_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library ALTER COLUMN library_id SET DEFAULT nextval('public.library_library_id_seq'::regclass);


--
-- Name: library_books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_books ALTER COLUMN id SET DEFAULT nextval('public.library_books_id_seq'::regclass);


--
-- Name: reservations reservation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations ALTER COLUMN reservation_id SET DEFAULT nextval('public.reservations_reservation_id_seq'::regclass);


--
-- Name: reservations_books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations_books ALTER COLUMN id SET DEFAULT nextval('public.reservations_books_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add book	7	add_book
26	Can change book	7	change_book
27	Can delete book	7	delete_book
28	Can view book	7	view_book
29	Can add library	8	add_library
30	Can change library	8	change_library
31	Can delete library	8	delete_library
32	Can view library	8	view_library
33	Can add reservations	9	add_reservations
34	Can change reservations	9	change_reservations
35	Can delete reservations	9	delete_reservations
36	Can view reservations	9	view_reservations
37	Can add reservations_books	10	add_reservations_books
38	Can change reservations_books	10	change_reservations_books
39	Can delete reservations_books	10	delete_reservations_books
40	Can view reservations_books	10	view_reservations_books
41	Can add library_books	11	add_library_books
42	Can change library_books	11	change_library_books
43	Can delete library_books	11	delete_library_books
44	Can view library_books	11	view_library_books
45	Can add category	12	add_category
46	Can change category	12	change_category
47	Can delete category	12	delete_category
48	Can view category	12	view_category
49	Can add author	13	add_author
50	Can change author	13	change_author
51	Can delete author	13	delete_author
52	Can view author	13	view_author
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$k5hHRTHL1K9alzcRQh7liU$LLcJi9BgUUr6/t81WXQplRs8lZA+PG8G/e948FckSJ0=	\N	t	dev-admin			dev-admin@hyper.com	t	t	2022-03-27 12:44:41.280902+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (author_id, name) FROM stdin;
1	Marilynne Robinson
2	Charles Osborne
3	Stephen R. Donaldson
4	Sidney Sheldon
5	Clive Staples Lewis
6	Agatha Christie
7	Richard Hall
8	Robin Hobb
9	Janny Wurts
10	Terence Hanbury White
11	Raymond E. Feist
12	Margaret Weis
13	Philippa Gregory
14	Susan Howatch
15	Patrick O'Brian
16	Kim Stanley Robinson
17	Michael Marshall Smith
18	Tess Gerritsen
19	Jessica Adams
20	Joan Didion
21	Amy Tan
22	Thomas L. Friedman
23	Frank McCourt
24	Mark Haddon
25	Joan Aiken
26	Elinor Mary Brent-Dyer
27	Peter Straub
28	John Ronald Reuel Tolkien
29	Jude Fisher
30	Douglas Coupland
31	Louis Menand
32	Ray Bradbury
33	Diana Wynne Jones
34	Patricia McCormick
35	Gary Russell
36	Garth Nix
37	Daniel Pinchbeck
38	Michael Chabon
39	Carolyn Meyer
40	Tony Parsons
41	Jonathan Franzen
42	Merlin Holland
43	Dr. Seuss
44	Tim O'Brien
45	J. R. R. Tolkien
46	Dr. Seuss;Barney Tobey
47	Louis Sachar
48	Cecelia Ahern
49	Edward P. Jones
50	Robin Sharma
51	William S. Burroughs
52	Henry Miller
53	Annie Proulx
54	F. Scott Fitzgerald
55	Joel Rosenberg
56	S. M. Stirling
57	Tracy Hickman
58	Chris Manby
59	Fiona Walker
60	Peter Sutton
61	Alan Lee
62	Ted Nasmith
\.


--
-- Data for Name: author_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author_books (id, author_id, book_id) FROM stdin;
1	1	1
2	2	2
3	6	2
4	3	3
5	4	4
6	5	5
7	5	6
8	6	7
9	7	8
10	3	9
11	4	10
12	4	11
13	8	12
14	9	13
15	10	14
16	11	15
17	55	15
18	11	16
19	56	16
20	12	17
21	57	17
22	6	18
23	13	19
24	14	20
25	14	21
26	14	22
27	8	23
28	15	24
29	15	25
30	6	26
31	16	27
32	17	28
33	18	29
34	13	30
35	19	31
36	58	31
37	59	31
38	20	32
39	21	33
40	22	34
41	23	35
42	24	36
43	60	36
44	25	37
45	26	38
46	27	39
47	28	40
48	6	41
49	6	42
50	29	43
51	30	44
52	6	45
53	6	46
54	6	47
55	6	48
56	6	49
57	6	50
58	6	51
59	6	52
60	6	53
61	6	54
62	6	55
63	6	56
64	6	57
65	6	58
66	31	59
67	32	60
68	33	61
69	34	62
70	35	63
71	28	64
72	28	65
73	61	65
74	36	66
75	28	67
76	37	68
77	38	69
78	39	70
79	40	71
80	6	72
81	41	73
82	6	74
83	6	75
84	42	76
85	43	77
86	43	78
87	44	79
88	45	80
89	28	81
90	62	81
91	46	82
92	43	83
93	47	84
94	30	85
95	30	86
96	48	87
97	6	88
98	35	89
99	49	90
100	50	91
101	51	92
102	52	93
103	53	94
104	54	95
105	53	96
106	5	97
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, isbn13, isbn10, title, subtitle, thumbnail, description, published_year, average_rating, num_pages, ratings_count, price) FROM stdin;
1	9780002005883	0002005883	Gilead	\N	http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	A NOVEL THAT READERS and critics have been eagerly anticipating for over a decade, Gilead is an astonishingly imagined story of remarkable lives. John Ames is a preacher, the son of a preacher and the grandson (both maternal and paternal) of preachers. It’s 1956 in Gilead, Iowa, towards the end of the Reverend Ames’s life, and he is absorbed in recording his family’s story, a legacy for the young son he will never see grow up. Haunted by his grandfather’s presence, John tells of the rift between his grandfather and his father: the elder, an angry visionary who fought for the abolitionist cause, and his son, an ardent pacifist. He is troubled, too, by his prodigal namesake, Jack (John Ames) Boughton, his best friend’s lost son who returns to Gilead searching for forgiveness and redemption. Told in John Ames’s joyous, rambling voice that finds beauty, humour and truth in the smallest of life’s details, Gilead is a song of celebration and acceptance of the best and the worst the world has to offer. At its heart is a tale of the sacred bonds between fathers and sons, pitch-perfect in style and story, set to dazzle critics and readers alike.	2004	3.85	247	361	9.06
2	9780002261982	0002261987	Spider's Web	A Novel	http://books.google.com/books/content?id=gA5GPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	A new 'Christie for Christmas' -- a full-length novel adapted from her acclaimed play by Charles Osborne Following BLACK COFFEE and THE UNEXPECTED GUEST comes the final Agatha Christie play novelisation, bringing her superb storytelling to a new legion of fans. Clarissa, the wife of a Foreign Office diplomat, is given to daydreaming. 'Supposing I were to come down one morning and find a dead body in the library, what should I do?' she muses. Clarissa has her chance to find out when she discovers a body in the drawing-room of her house in Kent. Desperate to dispose of the body before her husband comes home with an important foreign politician, Clarissa persuades her three house guests to become accessories and accomplices. It seems that the murdered man was not unknown to certain members of the house party (but which ones?), and the search begins for the murderer and the motive, while at the same time trying to persuade a police inspector that there has been no murder at all... SPIDER'S WEB was written in 1954 specifically for Margaret Lockwood and opened first at the Theatre Royal Nottingham before moving to the Savoy Theatre in London on 14 December 1954. With THE MOUSETRAP and WI	2000	3.83	241	5164	10.38
3	9780006163831	0006163831	The One Tree	\N	http://books.google.com/books/content?id=OmQawwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Volume Two of Stephen Donaldson's acclaimed second trilogy featuing the compelling anti-hero Thomas Covenant.	1982	3.97	479	172	11.78
4	9780006178736	0006178731	Rage of angels	\N	http://books.google.com/books/content?id=FKo2TgANz74C&printsec=frontcover&img=1&zoom=1&source=gbs_api	A memorable, mesmerizing heroine Jennifer -- brilliant, beautiful, an attorney on the way up until the Mafia's schemes win her the hatred of an implacable enemy -- and a love more destructive than hate. A dangerous, dramatic world The Dark Arena of organized crime and flashbulb lit courtrooms where ambitious prosecutors begin their climb to political power.	1993	3.93	512	29532	11.52
5	9780006280897	0006280897	The Four Loves	\N	http://books.google.com/books/content?id=XhQ5XsFcpGIC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Lewis' work on the nature of love divides love into four categories; Affection, Friendship, Eros and Charity. The first three come naturally to humanity. Charity, however, the Gift-love of God, is divine, and without this supernatural love, the natural loves become distorted and even dangerous.	2002	4.15	170	33684	10.72
6	9780006280934	0006280935	The Problem of Pain	\N	http://books.google.com/books/content?id=Kk-uVe5QK-gC&printsec=frontcover&img=1&zoom=1&source=gbs_api	In The Problem of Pain, C.S. Lewis, one of the most renowned Christian authors and thinkers, examines a universally applicable question within the human condition: If God is good and all-powerful, why does he allow his creatures to suffer pain? With his signature wealth of compassion and insight, C.S. Lewis offers answers to these crucial questions and shares his hope and wisdom to help heal a world hungering for a true understanding of human nature.--Amazon.	2002	4.09	176	37569	11.96
7	9780006353287	0006353282	An Autobiography	\N	http://books.google.com/books/content?id=c49GQwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Donation.	1977	4.27	560	3975	9.15
8	9780006380832	0006380832	Empires of the Monsoon	A History of the Indian Ocean and Its Invaders	http://books.google.com/books/content?id=MuPEQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Until Vasco da Gama discovered the sea-route to the East in 1497-9 almost nothing was known in the West of the exotic cultures and wealth of the Indian Ocean and its peoples. It is this civilization and its destruction at the hands of the West that Richard Hall recreates in this book. Hall's history of the exploration and exploitation by Chinese and Arab travellers, and by the Portuguese, Dutch and British alike is one of brutality, betrayal and colonial ambition.	1998	4.41	608	65	12.05
9	9780006470229	000647022X	The Gap Into Madness	Chaos and Order	http://books.google.com/books/content?id=4oXavLNDWocC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A new-cover reissue of the fourth book in the bestselling five-volume sf series created by the world-famous author of the Thomas Covenant chronicles -- and acclaimed as the 'best work of his career'. Events were not moving as the Amnion had intended. Once again humans had been false in their dealings with the aliens. As the planetoid Thanatos Minor exploded into atoms, the Trumpet hurtled into space only one step ahead of hostile pursuers. On board were Morn Hyland and her force-grown son Davies, cyborg Angus Thermopyle and Captain Nick Succorso -- old enemies thrown together in a desperate bid for survival. For both the Amnion and the UMCP, the immediate capture of the fleeing ship and the secrets it contained was imperative. But for Trumpet's exhausted crew the only hope lay in an illegal lab in the distant binary solar system of Valdor Industrial. It would be a journey of unpredictable danger -- from which not all would return...	1994	4.15	743	103	10.46
10	9780006472612	0006472613	Master of the Game	\N	http://books.google.com/books/content?id=TkTYp-Tp6_IC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Kate Blackwell is an enigma and one of the most powerful women in the world. But at her ninetieth birthday celebrations there are ghosts of absent friends and absent enemies.	1982	4.11	489	43540	9.5
11	9780006479673	0006479677	If Tomorrow Comes	\N	http://books.google.com/books/content?id=l2tBi_jLuk8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	One of Sidney Sheldon's most popular and bestselling titles, repackaged and reissued for a new generation of fans.	1994	4.04	501	49170	11.76
12	9780006480099	0006480098	Assassin's Apprentice	\N	http://books.google.com/books/content?id=qTaGQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Fantasy-roman.	1996	4.15	460	133972	9.16
13	9780006482079	0006482074	Warhost of Vastmark	\N	http://books.google.com/books/content?id=uOL0fpS9WZkC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Tricked once more by his wily half-brother, Lysaer, Lord of Light, arrives at the tiny harbor town of Merior to find that Arithon's ship yards have been abandoned and meticulously destroyed, and that the Master of Shadow has disappeared as if into thin air. Meanwhile Arithon and the Mad Prophet Dakar are traveling on foot through the treacherous Kelhorn Mountains towards the Vastmark clans, there to raise further support for his cause. But raising a warhost is a costly business. Is it mere coincidence that Princess Talith—Lysaer's beautiful, headstrong wife—is taken captive and held for a vast ransom by a master brigand? The forces of light and shadow circle and feint, drawing ever closer to a huge conflict. And in the background the Fellowship of Seven Sorcerers and the Koriani Enchantresses watch and plan, and wait.	1995	4.03	522	2966	10.59
14	9780006483014	0006483011	The Once and Future King	\N	http://books.google.com/books/content?id=Jx6BvgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	An omnibus volume of the author's complete story of the Arthurian epic which includes: The sword in the stone (1939), The witch in the wood (1939), The ill-made knight (1940), The candle in the wind (published for the first time), and The book of Merlyn. 1996.	1996	4.04	823	2805	9.07
15	9780006483892	0006483895	Murder in LaMut	\N	http://books.google.com/books/content?id=I2jbBlMHlAMC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Available in the U.S. for the first time, this is the second volume in the exceptional Legends of the Riftwar series from New York Times-bestselling authors Feist and Rosenberg.	2003	3.7	337	5083	11.53
16	9780006483908	0006483909	Jimmy the Hand	\N	http://books.google.com/books/content?id=hV4-oITYFN8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	Jimmy the Hand, boy thief of Krondor, lived in the shadows of the city. Though gifted beyond his peers, Jimmy is merely a pickpocket with potential--until he aids Prince Arutha in the rescue of Princess Anita from Duke Guy du Bas-Tyra, and runs afoul of Black Guy's secret police. Facing a choice between disappearing on his own or in a weighted barrel at the bottom of Krondor's harbor, Jimmy chooses the former. Forced to flee the only home he's ever known, Jimmy finds himself among the unsuspecting rural villagers of Land's End, where he hopes to prosper with his talents for con and thievery. But Land's End is home to many who tread the crooked path--and to a dark, dangerous presence even the local smugglers don't recognize. And suddenly Jimmy's youthful bravado and courage are leading him into the maw of chaos . . . and, quite possibly, to his doom.	2003	3.95	368	5579	9.49
17	9780006486145	0006486142	Well of Darkness	\N	http://books.google.com/books/content?id=XrwaAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Gareth is just a frightened young lad when he is drafted in to be the whipping-boy for the unruly Prince Dagnarus. Yet as they grow to be men, an unshakable bond is formed. And it is their destiny for them to become the two most powerful - and feared - men in the kingdom. But when Dagnarus decides to become a knight himself, he begins a chain of evil events that threaten to destroy the entire kingdom. Only by uniting the Sovereign Stone can peace be restored, and it is up to Dagnarus' brother Helmos to try to achieve this impossible task, using his father's soldiers against his brother's army. All the while, Gareth is gaining mastery over the sinister Void magic, and he is devoted to helping his childhood companion.. This gripping story of magical power and corruption takes the unique viewpoint of focusing on the evil characters, as we follow them from boys to men. Filled with action, suspense and wonderfully imaginative characters, Water From the Well of Darkness is set to elevate the careers of bestselling authors Weis & Hickman to spectacular new heights.	2001	3.66	599	68	12.62
18	9780006490456	000649045X	Witness for the Prosecution & Selected Plays	\N	http://books.google.com/books/content?id=_9u7AAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Newly-Jacketed Edition Designed To Celebrate The 50Th Anniversary Of Christie S Faultlessly Plotted Witness For The Prosecution And Other Outstanding Plays. The Perfect Complement To The Latest Edition Of The Mousetrap And Selected Plays (50Th Aniversary Edition). Headlining This Book Is Witness For The Prosecution Christie S Highly Successful Stage Play Which Won The New York Drama Critics Circle Award For Best Foreign Play. A Stunning Courtroom Drama, It Tells The Story Of A Scheming Wife Testifying Against Her Husband In A Shocking Murder Trial. The Wild Beauty Of A Seaside House Perched High On The Devonshire River Tern Provides A Stunning Back-Drop In Towards Zero As A Psychopathic Murderer Homes In On The Unsuspecting Victims. Passion, Murder And Love Are The Deadly Ingredients In Verdict, Making It One Of Christie S More Unusual Thrillers And Prompting Her To Label It The Best Play I Have Written With The Exception Of Witness For The Prosecution . Go Back For Murder Tells The Story Of The Young And Feisty Carla Who, Orphaned At The Tender Age Of Five, Discovers Her Mother Was Imprisioned For Murdering Her Father And Determines To Prove Her Innocence.	1995	4.05	352	3908	9.87
19	9780006496434	0006496431	The Little House	\N	http://books.google.com/books/content?id=rbvUPps9vKsC&printsec=frontcover&img=1&zoom=1&source=gbs_api	It was easy for Elizabeth. She married the man she loved. It was harder for Ruth. She married Elizabeth's son and then found that, somehow, she could never quite measure up. This thriller examines what women want and what they fear, as Ruth confronts the shifting borders of her own sanity.	1998	3.66	368	1832	11.14
20	9780006496878	0006496873	Mystical Paths	\N	http://books.google.com/books/content?id=by4ytBy63o0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	1968 finds Nicholas Darrow wrestling with personal problems. How can he marry Rosalind when he is unable to avoid promiscuity? How can he become a priest when he finds it so difficult to live as one? And can he break his dangerous dependence on his father?	1996	4.23	576	1023	9.72
21	9780006496892	000649689X	Glittering Images	\N	http://books.google.com/books/content?id=rDHbn0ORKhQC&printsec=frontcover&img=1&zoom=1&source=gbs_api	It is 1937, and Charles Ashworth, a Canon to the Archbishop of Canterbury, is sent to untangle a web of self-delusion and corruption at the episcopal palace of the charismatic Bishop of Starbridge.	1996	4.07	512	2045	9.72
22	9780006496922	000649692X	Glamorous Powers	\N	http://books.google.com/books/content?id=_bhPYWs6RrYC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Reissue of the author's most famous and well-loved work, the Starbridge series, six self-contained yet interconnected novels that explore the history of the Church of England through the 20th century.	1996	4.2	512	1441	11.24
58	9780007122585	0007122586	The Secret of Chimneys	\N	http://books.google.com/books/content?id=1OluX5g96OcC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A young drifter finds more than he bargained for when he agrees to deliver a parcel to an English country house...	2001	3.86	400	11110	12.15
23	9780006498865	0006498868	The Mad Ship	\N	http://books.google.com/books/content?id=2iWezkfdBE8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	Fantasy master Robin Hobb delivers the stunning second volume of her Liveship Traders trilogy, returning to the timeless city of Bingtown, where pirates now plague the coasts and the dreaded slave trade flourishes. Althea Vestrit doesnt have time to be afraid, for her familys newly awakened Liveship, Vivacia, has been seized by the ruthless pirate Kennit. So Althea hatches a bold plan. But to carry it out, she must recruit a Liveship that has already slain two crews -- and is said to be insane.	2000	4.24	906	36101	10.51
24	9780006499169	0006499163	Post Captain	\N	http://books.google.com/books/content?id=S761k-z51Q4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	This tale begins with Jack Aubrey arriving home from his exploits in the Mediterranean to find England at peace following the Treaty of Amiens. He and his friend Stephen Maturin, surgeon and secret agent, begin to live the lives of country gentlemen, hunting, entertaining and enjoying more amorous adventures. Their comfortable existence, however, is cut short when Jack is overnight reduced to a pauper with enough debts to keep him in prison for life. He flees to the continent to seek refuge: instead he finds himself a hunted fugitive as Napoleon has ordered the internment of all Englishmen in France. Aubrey's adventures in escaping from France and the debtors' prison will grip the reader as fast as his unequalled actions at sea.	1996	4.29	474	7815	9.69
25	9780006499268	0006499260	The Reverse of the Medal	\N	http://books.google.com/books/content?id=YtjxFRb39Z4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	In this book, Jack Aubrey returns from his duties protecting whalers off the South American coast and is persuaded by a casual acquaintance to make investments in the City on the strength of supposedly certain information. From there he is led into the half-worlds of the London criminal underground and of government espionage - the province of his friend, Stephen Maturin.	1997	4.41	261	177	12.91
26	9780006499626	0006499627	Miss Marple	The Complete Short Stories	http://books.google.com/books/content?id=a96qPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Miss Marple featured in 20 short stories, published in a number of different collections in Britain and America. Presented here in their order of publication, Miss Marple uses her unique insight to deduce the truth about a series of unsolved crimes.	1997	4.2	359	6235	11.77
27	9780006511489	0006511481	The Years of Rice and Salt	\N	http://books.google.com/books/content?id=I38CFD1RnmsC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Hailed by The New York Times Book Review as eye-opening,  this alternative history of the last 600 years begins as the Black Death kills nearly everyone in Europe, and China, India, and the nations of Islam now control the world.	2003	3.73	772	194	11.82
28	9780006512677	0006512674	Spares	\N	http://books.google.com/books/content?id=83RrAdP9y5UC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Spares - human clones, the ultimate health insurance. An eye for an eye - but some people are doing all the taking. The story of Jack Randall: burnt-out, dropped out, and way overdrawn at the luck bank. But as caretaker on a Spares Farm, he still has a choice, and it might make a difference.	1998	4.13	317	2481	12.68
29	9780006513087	0006513085	Gravity	\N	http://books.google.com/books/content?id=KI66cH39n6sC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Emma Watson a research physician has been training for the mission of a lifetime: to study living organisms in the microgravity of space. But the true and lethal nature of the experiment has not been revealed to NASA and once aboard the space station things start to go wrong. A culture of single-celled Archaeons, gathered from the deep sea, begin to rapidly multiply and infect the crew - with deadly and agonising results. As her estranged husband and ground crew at NASA work against the clock to launch a rescue Emma stuggles to contain the lethal microbe. But with the contagion threatening Earth's population, there are those who would leave the astronauts stranded in orbit, quarantined aboard the station.	2004	4.04	342	8024	11.01
30	9780006514640	0006514642	The Wise Woman	\N	http://books.google.com/books/content?id=BEr9wAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Alone and vulnerable, Alys joins a nunnery in an attempt to escape poverty but finds herself thrown back into the outside world when Henry VIII's wreckers destroy her sanctuary. With nothing but her looks, her magic and her own instinctive cunning, Alys has to tread a perilous path between the faith of her childhood and her own female power. When she falls in love with Hugo, the feudal lord and another woman's husband, she dips into witchcraft to defeat her rival and to win her lover, only to find that magic makes a poor servant but a dominant master. Since heresy against the new church means the stake, and witchcraft the rope, Alys's danger is mortal. A woman's powers are not longer safe to use...	2002	3.31	640	6583	9.15
31	9780006514855	0006514855	Girls' Night in	\N	http://books.google.com/books/content?id=xLwHHQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	'Girls' Night In' features stories about growing up, growing out of, moving out, moving on, falling apart and getting it all together. So turn off your cell phone and curl up on the couch: this is one 'Girls' Night In' you won't want to miss.	2000	3.26	586	140	10.87
32	9780006545866	0006545866	The White Album	\N	http://books.google.com/books/content?id=qauOPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	This collection of essays recounts what took place on the long morning after the 1960s, when everyone was coming down from their particular bad trip. Didion observes the dramas that explode as America goes into collective detox: the mother abandoning her five-year-old daughter on the central reservation of Interstate 5; Huey Newton and the Black Panthers preaching from their cells; students, in unconscious parody, simulating the disaffection of the 1960s.	1993	4.17	224	91	12.15
33	9780006550433	0006550436	The Bonesetter's Daughter	\N	http://books.google.com/books/content?id=4KHT6mIMDt4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	Tells the story of three generations of Chinese women, beginning at the turn of the century.	2001	3.98	352	414	9.85
34	9780006551393	0006551394	The Lexus and the Olive Tree	\N	http://books.google.com/books/content?id=u8zxpq6o7HYC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Half of this new, post-Cold War world is intent on building a better Lexus, on streamlining their societies and economies for the global marketplace, while the other half is locked in elemental struggles over who owns which olive tree, which strip of land.	2000	3.59	352	87	9.76
59	9780007124015	0007124015	The Metaphysical Club	\N	http://books.google.com/books/content?id=C3Gkwi3SfmMC&printsec=frontcover&img=1&zoom=1&source=gbs_api	In an absorbing narrative about personalities and social history, Menand discusses the Metaphysical Club, an informal group that met in Cambridge, Massachusetts, in 1872, to talk about ideas. Members included Oliver Wendell Holmes, Jr., William James, and Charles Sanders Peirce. 21 photos.	2002	4.07	560	3311	11.74
35	9780006551812	0006551815	'Tis	A Memoir	http://books.google.com/books/content?id=Q3BhQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	FROM THE PULIZER PRIZE-WINNING AUTHOR OF THE #1 NEW YORK TIMES BESTSELLER ANGELA'S ASHES Frank McCourt's glorious childhood memoir, Angela's Ashes,  has been loved and celebrated by readers everywhere. It won the National Book Critics Circle Award, the Los Angeles Times Book Award and the Pulitzer Prize. Rarely has a book so swiftly found its place on the literary landscape. And now we have 'Tis,  the story of Frank's American journey from impoverished immigrant to brilliant teacher and raconteur. Frank lands in New York at age nineteen and gets a job at the Biltmore Hotel, where he immediately encounters the vivid hierarchies of this classless country, and then is drafted into the army and is sent to Germany to train dogs and type reports. It is Frank's incomparable voice that renders these experiences spellbinding. When Frank returns to America in 1953, he works on the docks, always resisting what everyone tells him. He knows that he should be getting an education, and though he left school at fourteen, he talks his way into New York University. There, he falls in love with the quintessential Yankee and tries to live his dream. But it is not until he starts to teach that Frank finds his place in the world.	2000	3.68	495	44179	12.7
36	9780006646006	000664600X	Ocean Star Express	\N	http://books.google.com/books/content?id=I2QZAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Joe and his parents are enjoying a summer holiday by the sea at the Ocean Star Hotel. The sky is bright blue, the sun shines and Joe loves all that the seaside has to offer. But when the fog rolls in and rain falls Joe begins to wish that he was back at home again. Things change, however, when the owner of the hotel invites Joe to share in a magical world, only a few steps away. The loft is black as night but then above Joe's head a thousand tiny stars begin to sparkle and in the distance he hears the chug-chug-chug of a model train. A whole world is soon to open up before Joe's eyes, a world of snow-capped mountains, great deserts, and rocking fishing boats.	2002	3.5	32	1	11.24
37	9780006754893	0006754899	A Small Pinch of Weather	And Other Stories	http://books.google.com/books/content?id=QiFhOBpYZoYC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A magical and fantastic collection of early stories by one of the most original children's authors of the 20th century. For 8-11 year olds.	2000	4.27	239	116	9.17
38	9780006906018	000690601X	The Princess of the Chalet School	\N	http://books.google.com/books/content?id=EJcQPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	\N	2000	4.1	159	446	10.29
39	9780007103676	0007103670	Koko	\N	http://books.google.com/books/content?id=QV_XQKj4OMkC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Koko is Peter Straub's foray into the psychological horror of the Vietnam War.	2001	3.56	634	7586	10.51
40	9780007105045	0007105045	Tree and Leaf	The Homecoming of Beorhtnoth : Beorhthelm's Son	http://books.google.com/books/content?id=aPb_AAIcwZ0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	The two works 'On fairy-stories' and 'Leaf by Niggle' were first brought together to form the book 'Tree and leaf' in 1964. In this new edition a third element is added: the poem Mythopoeia, the making of myths...--Preface.	2001	4.09	176	2245	9.01
41	9780007111503	0007111509	Partners in Crime	\N	http://books.google.com/books/content?id=L0bfy0zgkegC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The Famous Volume Of Tommy & Tuppence Linked Short Stories, Reissued In A New Look To Coincide With The Brand New Series Of Tommy & Tuppence Bbc Movies. Tommy And Tuppence Beresford Were Restless For Adventure, So When They Were Asked To Take Over Blunt S International Detective Agency, They Leapt At The Chance. After Their Triumphant Recovery Of A Pink Pearl, Intriguing Cases Kept On Coming Their Way: A Stabbing On Sunningdale Golf Course; Cryptic Messages In The Personal Columns Of Newspapers; And Even A Box Of Poisoned Chocolates.	2001	3.77	347	9506	11.98
42	9780007113804	0007113803	Murder in Mesopotamia	\N	http://books.google.com/books/content?id=oFkbc7BbYN0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	An archaeologist's wife is murdered on the shores of the River Tigris in Iraq... It was clear to Amy Leatheran that something sinister was going on at the Hassanieh dig in Iraq; something associated with the presence of 'Lovely Louise', wife of celebrated archaeologist Dr Leidner. In a few days' time Hercule Poirot was due to drop in at the excavation site. But with Louise suffering from terrifying hallucinations, and tension within the group becoming almost unbearable, Poirot might just be too late...	2001	3.89	264	25692	11.86
43	9780007116263	0007116268	The Lord of the Rings, the Return of the King	Visual Companion	http://books.google.com/books/content?id=kNBnQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	A visual guide to the third in the Lord of the Rings movie trilogy. A large-format, full-colour guide to the characters, places, landscapes, artefacts, battles, and costumes as seen in the film, it features images, informative text and specially commissioned extras.	2003	4.59	72	22	11.4
44	9780007117536	0007117531	All Families are Psychotic	\N	http://books.google.com/books/content?id=jYBsNp6NPVoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	On the eve of the next Space Shuttle mission, a divided family comes together... Warm, witty and wise, All Families Are Psychotic is Coupland at the very top of his form: 'Irresistibly hilarious, unique and wonderful' Independent on Sunday In a cheap motel an hour from Cape Canaveral, Janet Drummond takes her medication, and does a rapid tally of the whereabouts of her children. Wade has spent the night in jail; suicidal Bryan is due to arrive at any moment with his vowel-free girlfriend, Shw; and then there is Sarah, 'a bolt of lightning frozen in midflash' -- here in Orlando to be the star of Friday's shuttle mission. With Janet's ex-husband and his trophy wife also in town, Janet spends a moment contemplating her family, and where it all went wrong. Or did it?	2002	3.69	279	350	9.21
45	9780007119332	000711933X	Death in the Clouds	\N	http://books.google.com/books/content?id=M8iyckq4GQ0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	A woman is killed by a poisoned dart in the enclosed confines of a commercial passenger plane... From seat No.9, Hercule Poirot was ideally placed to observe his fellow air passengers. Over to his right sat a pretty young woman, clearly infatuated with the man opposite; ahead, in seat No.13, sat a Countess with a poorly-concealed cocaine habit; across the gangway in seat No.8, a detective writer was being troubled by an aggressive wasp. What Poirot did not yet realize was that behind him, in seat No.2, sat the slumped, lifeless body of a woman.	2001	3.8	333	21123	12.48
60	9780007126903	0007126905	The illustrated man	\N	http://books.google.com/books/content?id=kePqlVft1bQC&printsec=frontcover&img=1&zoom=1&source=gbs_api	\N	2002	4.14	186	56781	12.18
46	9780007119356	0007119356	Appointment with Death	\N	http://books.google.com/books/content?id=lSYwsRkcw4YC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A repugnant Amercian widow is killed during a trip to Petra... Among the towering red cliffs of Petra, like some monstrous swollen Buddha, sat the corpse of Mrs Boynton. A tiny puncture mark on her wrist was the only sign of the fatal injection that had killed her. With only 24 hours available to solve the mystery, Hercule Poirot recalled a chance remark he'd overheard back in Jerusalem: 'You see, don't you, that she's got to be killed?' Mrs Boynton was, indeed, the most detestable woman he'd ever met...	2001	3.86	303	24859	11.57
47	9780007120680	0007120680	Hallowe'en Party	\N	http://books.google.com/books/content?id=Qlx98EGK_jMC&printsec=frontcover&img=1&zoom=1&source=gbs_api	No one believes a little girl when she insists that she has witnessed a murder until she herself turns up drowned, and Hercule Poirot sets out to catch the killer.	2001	3.66	336	18820	9.53
48	9780007120697	0007120699	Hercule Poirot's Christmas	\N	http://books.google.com/books/content?id=EA0j4Jzn4vAC&printsec=frontcover&img=1&zoom=1&source=gbs_api	On the night before Christmas, cruel, tyrannical, filthy-rich Simeon Lee is found in his locked bedroom with his throat cut. Now Hercule Poirot must put his deductive powers to the test to solve one of his most chilling cases--and to prevent a clever killer from spilling more blood.	2001	3.93	335	23113	9.29
49	9780007120819	0007120818	The Big Four	\N	http://books.google.com/books/content?id=wcOQUSWQEdUC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A ruthless international cartel seeks world domination... Framed in the doorway of Poirot's bedroom stood an uninvited guest, coated from head to foot in dust. The man's gaunt face stared for a moment, then he swayed and fell. Who was he? Was he suffering from shock or just exhaustion? Above all, what was the significance of the figure 4, scribbled over and over again on a sheet of paper? Poirot finds himself plunged into a world of international intrigue, risking his life to uncover the truth about 'Number Four'.	2002	3.59	272	22155	11.14
50	9780007120864	0007120869	The Thirteen Problems	\N	http://books.google.com/books/content?id=MK9JNwoZAncC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The Tuesday Night Club is a venue where locals challenge Miss Marple to solve recent crimes... One Tuesday evening a group gathers at Miss Marple's house and the conversation turns to unsolved crimes... The case of the disappearing bloodstains; the thief who committed his crime twice over; the message on the death-bed of a poisoned man which read 'heap of fish'; the strange case of the invisible will; a spiritualist who warned that 'Blue Geranium' meant death... Now pit your wits against the powers of deduction of the 'Tuesday Night Club'.	2002	3.89	315	12840	11.1
51	9780007120871	0007120877	They Do it with Mirrors	\N	http://books.google.com/books/content?id=HUuQYGppZi8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	A man is shot at in a juvenile reform home - but someone else dies... Miss Marple senses danger when she visits a friend living in a Victorian mansion which doubles as a rehabilitiation centre for delinquents. Her fears are confirmed when a youth fires a revolver at the administrator, Lewis Serrocold. Neither is injured. But a mysterious visitor, Mr Gilbrandsen, is less fortunate - shot dead simultaneously in another part of the building. Pure coincidence? Miss Marple thinks not, and vows to discover the real reason for Mr Gilbrandsen's visit.	2002	3.75	284	415	10.66
52	9780007120963	0007120966	A Murder is Announced	\N	http://books.google.com/books/content?id=QEEvzeAkdzoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The villagers of Chipping Cleghorn are amazed by an advertisement in the local paper which reads A murder is announced and will take place on Friday October 29th, at Little Paddocks at 6.30pm. Unable to resist, a crowd begins to gather at the house at the appointed time. But when a man is killed in what looks like an attempted robbery, Miss Marple becomes involved.	2002	3.98	382	680	9.64
53	9780007120987	0007120982	The Mirror Crack'd from Side to Side	\N	http://books.google.com/books/content?id=lTYId7FIJEsC&printsec=frontcover&img=1&zoom=1&source=gbs_api	One Minute, Silly Heather Badcock Had Been Gabbling On At Her Movie Idol, The Glamorous Marina Gregg. The Next, Heather Suffered A Massive Seizure. But For Whom Was The Deadly Poison Really Intended? Marina S Frozen Expression Suggested She Had Witnessed Something Horrific. But, While Others Searched For Material Evidence, Jane Marple Conducted A Very Different Investigation Into Human Nature.	2002	3.91	351	23249	12.49
54	9780007121007	0007121008	Mrs McGinty's Dead	\N	http://books.google.com/books/content?id=gcS0d5HhGEEC&printsec=frontcover&img=1&zoom=1&source=gbs_api	An old widow is brutally killed in the parlour of her cottage... Mrs McGinty died from a brutal blow to the back of her head. Suspicion fell immediately on her shifty lodger, James Bentley, whose clothes revealed traces of the victim's blood and hair. Yet something was amiss: Bentley just didn't look like a murderer. Poirot believed he could save the man from the gallows - what he didn't realise was that his own life was now in great danger...	2002	3.83	328	525	11.05
55	9780007121014	0007121016	Taken at the Flood	\N	http://books.google.com/books/content?id=3gWlxIFlMEwC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A Few Weeks After Marrying An Attractive Young Widow, Gordon Cloade Is Tragically Killed By A Bomb Blast In The London Blitz. Overnight, The Former Mrs Underhay Finds Herself In Sole Possession Of The Cloade Family Fortune. Shortly Afterwards, Hercule Poirot Receives A Visit From The Dead Man S Sister-In-Law Who Claims She Has Been Warned By Spirits That Mrs Underhay S First Husband Is Still Alive. Poirot Has His Suspicions When He Is Asked To Find A Missing Person Guided Only By The Spirit World. Yet What Mystifies Poirot Most Is The Woman S True Motive For Approaching Him&	2002	3.71	352	8852	12.65
56	9780007121021	0007121024	The Hollow	\N	http://books.google.com/books/content?id=-f1h4e0hl0oC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Lucy Angkatell Invited Hercule Poirot To Lunch. To Tease The Great Detective, Her Guests Stage A Mock Murder Beside The Swimming Pool. Unfortunately, The Victim Plays The Scene For Real. As His Blood Drips Into The Water, John Christow Gasps One Final Word: Henrietta . In The Confusion, A Gun Sinks To The Bottom Of The Pool. Poirot S Enquiries Reveal A Complex Web Of Romantic Attachments. It Seems Everyone In The Drama Is A Suspect And Each A Victim Of Love.	2002	3.79	384	13022	10.4
57	9780007121106	0007121105	Third Girl	\N	http://books.google.com/books/content?id=Dbh7nUkG_6cC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A perplexed girl thinks she might have killed someone... Three single girls shared the same London flat. The first worked as a secretary; the second was an artist; the third who came to Poirot for help, disappeared convinced she was a murderer. Now there were rumours of revolvers, flick-knives and blood stains. But, without hard evidence, it would take all Poirot's tenacity to establish whether the third girl was guilty innocent or insane...	2002	3.62	365	13705	12.85
61	9780007127740	000712774X	Wilkins' Tooth	\N	http://books.google.com/books/content?id=lXUSHqQfOD8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	OWN BACK LIMITEDREVENGE ARRANGED, PRICE ACCORDING TO TASK, ALL DIFFICULT TASKS UNDERTAKEN, TREASURE HUNTED, ETC. It seemed like a marvellous scheme at the time! Frank and Jess had set up the business because they needed money - their pocket-money had been stopped just when Frank owed Buster Knell ten pence. Their father had put a quick stop to ERRANDS RUN, so why not try something that was bad instead? Offering to do dreadful things that other people didn't dare to do? So they pinned up the notice on the potting-shed and waited for customers. But of course, nothing's ever THAT straightforward.	2002	3.59	207	69	10.55
62	9780007129652	0007129653	Cut	\N	http://books.google.com/books/content?id=Q140Mlie138C&printsec=frontcover&img=1&zoom=1&source=gbs_api	Fifteen-year old Callie is so withdrawn that she's not speaking to anyone - including her therapist at Sea Pines, known to its guests as 'Sick Minds' - the residential treatment facility where her parents and doctor send her after discovering that she cuts herself. Her story unfolds primarily through dramatic monologues, gradually revealing the family turmoil that led to her self-destructive behaviour.	2002	3.76	173	107	10.16
63	9780007130313	0007130317	The Lord of the Rings	The Art of The Return of the King	http://books.google.com/books/content?id=oEZ6AAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	With complete access to artwork created over a five-year period, this guide illustrates the creative development of The Return of the King. It contains over 600 images, from the earliest pencil sketches and conceptual drawings to magnificent paintings, sculptures and digital imagery that shaped the look of the film. Contributing artists include John Howe and Alan Lee, artists who have inspired Peter Jackson's vision of Middle-earth and worked with him to bring the trilogy to the big screen. Peter Jackson himself provides the afterword in which he discusses the importance of the conceptual art to the film. It covers most aspects of the eagerly awaited finale to the enormously successful trilogy, from locations and costumes to weaponry and creatures. The artists who created all of these diverse elements explain how they contributed to the development of the film.	2004	4.54	224	28	11.35
64	9780007135653	0007135653	The Lord of the Rings	\N	http://books.google.com/books/content?id=LwO-vgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Since it was first published in 1954, 'The Lord of the Rings' has been a book people have treasured. Steeped in unrivalled magic and otherworldliness, its sweeping fantasy has touched the hearts of young and old alike. Well over 100 million copies of its many editions have been sold around the world, and occasional collectors’ editions become prized and valuable items of publishing. With the epic trilogy now being released on film, images of the characters and landscapes have become eagerly sought after. Much of the look of the movies is based on Alan Lee’s paintings, giving this Centenary edition of Tolkien’s great work new relevance for the ever-growing number of fans.	2002	4.49	1200	680	10.11
65	9780007136582	0007136587	The Fellowship of the Ring	\N	http://books.google.com/books/content?id=K7xSPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Tolkien's classic fantasy about the quest to save Middle-Earth--and the basis for Peter Jackson's Academy Award(-winning film trilogy--is now available in these Young Reader's Editions. Each book of the trilogy is available individually, or together in a three-volume paperback boxed set.	2002	4.35	410	56	12.62
66	9780007136599	0007136595	Lirael	Daughter of the Clayr	http://books.google.com/books/content?id=sDzU8TpKvQAC&printsec=frontcover&img=1&zoom=1&source=gbs_api	When a dangerous necromancer threatens to unleash a long-buried evil, Lirael and Prince Sameth are drawn into a battle to save the Old Kingdom and reveal their true destinies. Suggested level: secondary.	2004	4.3	527	1339	10.61
67	9780007137336	0007137338	Tales from the Perilous Realm	\N	http://books.google.com/books/content?id=Wla7NwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Never before published in a single volume, Tolkien's four novellas (Farmer Giles of Ham, Leaf by Niggle, Smith of Wootton Major, and Roverandom) and one book of poems (The Adventures of Tom Bombadil) are gathered together in a fully illustrated set.	2002	4.08	178	2964	12.83
68	9780007149124	0007149123	Breaking Open the Head	A Visionary Journey from Cynicism to Shamanism	http://books.google.com/books/content?id=QIMaviqqoQoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A new 'The Doors of Perception' for the 21st century? A visionary journey from cynicism to shamanism by a brilliant young US writer.	2004	4.06	336	46	9.25
69	9780007149612	0007149611	The Yiddish Policemen's Union	A Novel	http://books.google.com/books/content?id=-reD1g77BfsC&printsec=frontcover&img=1&zoom=1&source=gbs_api	For sixty years, Jewish refugees and their descendants have prospered in the Federal District of Sitka, a temporary safe haven created in the wake of revelations of the Holocaust and the shocking 1948 collapse of the fledgling state of Israel. Proud, grateful, and longing to be American, the Jews of the Sitka District have created their own little world in the Alaskan panhandle, a vibrant, gritty, soulful, and complex frontier city that moves to the music of Yiddish. For sixty years they have been left alone, neglected and half-forgotten in a backwater of history. Now the District is set to revert to Alaskan control, and their dream is coming to an end: once again the tides of history threaten to sweep them up and carry them off into the unknown. But homicide detective Meyer Landsman of the District Police has enough problems without worrying about the upcoming Reversion. His life is a shambles, his marriage a wreck, his career a disaster. He and his half-Tlingit partner, Berko Shemets, can't catch a break in any of their outstanding cases. Landsman's new supervisor is the love of his life—and also his worst nightmare. And in the cheap hotel where he has washed up, someone has just committed a murder—right under Landsman's nose. Out of habit, obligation, and a mysterious sense that it somehow offers him a shot at redeeming himself, Landsman begins to investigate the killing of his neighbor, a former chess prodigy. But when word comes down from on high that the case is to be dropped immediately, Landsman soon finds himself contending with all the powerful forces of faith, obsession, hopefulness, evil, and salvation that are his heritage—and with the unfinished business of his marriage to Bina Gelbfish, the one person who understands his darkest fears. At once a gripping whodunit, a love story, an homage to 1940s noir, and an exploration of the mysteries of exile and redemption, The Yiddish Policemen's Union is a novel only Michael Chabon could have written.	2007	3.7	414	51219	10.08
70	9780007149827	0007149824	Beware, Princess Elizabeth	\N	http://books.google.com/books/content?id=wPBpR4AFNJ0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	A matter of life and death - and the Throne of England	2003	3.88	242	78	11.37
71	9780007150304	000715030X	The Family Way	\N	http://books.google.com/books/content?id=dJEIxdYmnU8C&printsec=frontcover&img=1&zoom=1&source=gbs_api	It should be the most natural thing in the world. But in Tony Parsons' latest bestseller, three couples discover that Mother Nature can be one hell of a bitch.	2005	3.51	400	2095	10.18
72	9780007151240	0007151241	Endless Night	\N	http://books.google.com/books/content?id=kY1wuNfgmFQC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Gipsy S Acre Was A Truly Beautiful Upland Site With Views Out To Sea And In Michael Rogers It Stirred A Child-Like Fantasy. There, Among The Dark Fir Trees, He Planned To Build A House, Find A Wonderful Girl And Live Happily Ever After, Yet, As He Left The Village, A Shadow Of Menace Hung Over The Land. For This Was The Place Where Accidents Happened. Perhaps Michael Should Have Heeded The Locals Warnings: There S No Luck For Them As Meddles With Gipsy S Acre .	2002	3.77	303	12740	11.09
73	9780007151677	0007151675	How to be Alone	\N	http://books.google.com/books/content?id=ozVWaXd9xvwC&printsec=frontcover&img=1&zoom=1&source=gbs_api	'The Harper's Essay' is reprinted in this volume alongside personal essays and painstaking, often funny reportage. Although his subjects range widely, each piece wrestles with the erosion of civic life and private dignity, and the hidden persistence of loneliness in postmodern America.	2004	3.6	306	327	12.6
74	9780007153589	0007153589	The Mysterious Mr. Quin	\N	http://books.google.com/books/content?id=n0aMDV7Lm4sC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A mysterious stranger appears at a New Year's Eve party, becoming the enigmatic sleuthing sidekick to the snobbish Mr Satterthwaite... So far, it had been a typical New Year's Eve house party. But Mr Satterthwaite - a keen observer of human nature - sensed that the real drama of the evening was yet to unfold. So it proved when a mysterious stranger arrived after midnight. Who was this Mr Quin? And why did his presence have such a pronounced effect on Eleanor Portal, the woman with the dyed-black hair?	2003	3.72	396	7514	11.02
75	9780007154845	0007154844	The Listerdale Mystery	\N	http://books.google.com/books/content?id=J1tLGz5G84EC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A selection of mysteries, some light-hearted, some romantic, some very deadly... Twelve tantalizing cases... the curious disappearance of Lord Listerdale; a newlywed's fear of her ex-fiance; a strange encounter on a train; a domestic murder investigation; a wild man's sudden personality change; a retired inspector's hunt for a murderess; a young woman's impersonation of a duchess; a necklace hidden in a basket of cherries; a mystery writer's arrest for murder; an astonishing marriage proposal; a soprano's hatred for a baritone; the case of the rajah's emerald. All have one thing in common: the skilful hand of Agatha Christie.	2003	3.55	317	178	11.52
76	9780007154883	0007154887	The Real Trial of Oscar Wilde	\N	http://books.google.com/books/content?id=QfNgQfTKcg0C&printsec=frontcover&img=1&zoom=1&source=gbs_api	Oscar Wilde had one of literary history's most explosive love affairs with Lord Alfred Bosie Douglas. In 1895, Bosie's father, the Marquess of Queensberry, delivered a note to the Albemarle Club addressed to Oscar Wilde posing as sodomite. With Bosie's encouragement, Wilde sued the Marquess for libel. He not only lost but he was tried twice for gross indecency and sent to prison with two years' hard labor. With this publication of the uncensored trial transcripts, readers can for the first time in more than a century hear Wilde at his most articulate and brilliant. The Real Trial of Oscar Wilde documents an alarmingly swift fall from grace; it is also a supremely moving testament to the right to live, work, and love as one's heart dictates.	2004	4.04	384	183	9.42
77	9780007158058	000715805X	I Can Read with Me Eyes Shut!	\N	http://books.google.com/books/content?id=oyF8U9BRTQwC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Nonsense rhyming story. 4 yrs+	2003	4.2	48	16561	9.41
78	9780007158515	0007158513	Oh, the Places You'll Go!	\N	http://books.google.com/books/content?id=Ev4Llq5fv4IC&printsec=frontcover&img=1&zoom=1&source=gbs_api	From bang-ups and hang-ups to lurches and slumps. Dr. Seuss takes a hilarious look at the mishaps and misadventures that life may have in store for us.	2003	4.35	48	926	10.22
79	9780007158522	0007158521	If I Die in a Combat Zone	\N	http://books.google.com/books/content?id=0qUtSvo_MiEC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Perhaps the best book to emerge from the Vietnam War -- reissued alongside five other jewels of the Flamingo backlist from the 1970s. First published in1973, this intensely personal novel about one foot soldier's tour of duty in Vietnam established Tim O'Brien's reputation as the outstanding chronicler of the Vietnam experience for a generation of Americans. From basic training to the front line and back again, he takes the reader on an unforgettable journey -- walking the minefields of My Lai, fighting the heat and the snipers in an alien land, crawling into the ghostly tunnels -- as he explores the ambiguities of manhood and morality in a war no one believes in.	2003	3.95	208	11	9.93
80	9780007162994	0007162995	The Return of the King	Being the Third Part of The Lord of the Rings	http://books.google.com/books/content?id=PI9zPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	THE GREATEST FANTASY EPIC OF OUR TIME While the evil might of the Dark Lord Sauron swarmed out to conquer all Middle-earth, Frodo and Sam struggled deep into Mordor, seat of Sauron's power. To defeat the Dark Lord, the accursed Ring of Power had to be destroyed in the fires of Mount Doom. But the way was impossibly hard, and Frodo was weakening. Weighed down by the compulsion of the Ring he began finally to despair. The awesome conclusion of J.R.R. Tolkien's The Lord of the Rings, beloved by millions of readers around the world.	2003	4.52	554	253	10.67
81	9780007171996	0007171994	The Silmarillion	\N	http://books.google.com/books/content?id=hLH0dtl5NVwC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Designed to take fans of The Hobbit and The Lord of the Rings deeper into the myths and legends of Middle-earth The Silmarillion is an account of the Elder Days, of the First Age of Tolkien s world. It is the ancient drama to which the characters in The Lord of the Rings look back, and in whose events some of them such as Elrond and Galadriel took part. The tales of The Silmarillion are set in an age when Morgoth, the first Dark Lord, dwelt in Middle-Earth, and the High Elves made war upon him for the recovery of the Silmarils, the jewels containing the pure light of Valinor. Included in the book are several shorter works. The Ainulindale is a myth of the Creation and in the Valaquenta the nature and powers of each of the gods is described. The Akallabeth recounts the downfall of the great island kingdom of Numenor at the end of the Second Age and Of the Rings of Power tells of the great events at the end of the Third Age, as narrated in The Lord of the Rings. This pivotal work features the revised, corrected text and includes, by way of an introduction, a fascinating letter written by Tolkien in 1951 in which he gives a full explanation of how he conceived the early Ages of Middle-earth.	2004	3.91	386	49	12.53
82	9780007173020	0007173024	I Wish that I Had Duck Feet	\N	http://books.google.com/books/content?id=m9cZAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	A boy imagines what it would be like if he had such things as duck feet, a whale spout, and an elephant's trunk.	2004	4.16	64	8903	10.55
83	9780007173136	000717313X	Oh Say Can You Say?	\N	http://books.google.com/books/content?id=r4l8AAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Tie your tongue in terrible knots as you try to read aloud. Nonsense rhyming story.	2004	4.01	36	5726	11.23
84	9780007175222	0007175221	There's a Boy in the Girls' Bathroom	\N	http://books.google.com/books/content?id=jHE-PgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	A study guide for the novel There's a Boy in the Girl's bathroom.	2004	3.98	208	174	10.17
85	9780007178636	0007178638	Microserfs	\N	http://books.google.com/books/content?id=N3AmmJIsK6wC&printsec=frontcover&img=1&zoom=1&source=gbs_api	At computer giant Microsoft, Dan, Susan, Abe, Todd and Bug are struggling to get a life. The job may be super cool, the pay may be astronomical, but they're heading nowhere, and however hard they work, however many shares they earn, they're never going to be as rich as Bill. And besides, with all the hours they're putting in, their best relationships are on e-mail. Something's got to give.	2004	3.88	371	436	12.67
86	9780007179817	0007179812	Miss Wyoming	\N	http://books.google.com/books/content?id=2zoTKFNdxpIC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The brilliant new novel from the bestselling cult author of them all. Susan and John need to disappear -- Susan and John need to find each other. Meet Susan Colgate -- Miss Wyoming. Winner of a hundred teen pageants, child TV soap star, owner of a hideously pushy mother... and now reduced to small, brainless parts in small, brainless movies. Oh, and sole survivor of Flight 802. If she were to walk away from the wreckage now, before the emergency crews get here, she could disappear and nobody would ever know... Meet John Johnson -- action film producer (Bel Air P. I... um, Bel Air P. I. 2), occasional sado-masochist, junkie. He just died -- but only for 5 minutes. But while he was gone, he saw a vision of a woman's face and realized that it was time to escape, to ditch the baggage of being horny, rich, lonely John Johnson and to lose himself. To disappear. Wouldn't it be nice if they were to find themselves and get together?In many ways a reprise of Girlfriend in a Coma, Miss Wyoming represents a further leap forwards into the World According to Coupland -- a witty, genuinely funny look at who we are, how we can change, and how we can make a difference.	2004	3.48	320	110	11.31
87	9780007179824	0007179820	Where Rainbows End	\N	http://books.google.com/books/content?id=PA7t62vA7SAC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The new warm and absorbing story from the author of PS, I LOVE YOU is a bittersweet tale of childhood friends Rosie and Alex whose relationship must survive many trials and tribulations, not least the discovery of their true feelings for one another.From naughty children to rebellious teenagers and mixed-up twenty- and thirty-somethings, Rosie and Alex have stuck by each other through thick and thin, even when Alex moved across the Atlantic to Boston and Rosie fell pregnant as a teenager. Alex supportsRosie through one of the most difficult times of her life -- a time when she should be out partying and going to university but is instead changing nappies and coping with a screaming baby. In return, Rosie is there for Alex when he strugglesthrough his medical internship and copes with a messy divorce. Throughout the ups and downs of each other's lives, they have remained a constant, a shoulder to cry on, someone to laugh and share their innermost feelings with.But can their friendship survive the years and the miles and, more critically, when they each marry someone else? Were they meant to be more than just good friends all along? Misunderstandings, circumstances and sheer bad luck	2004	3.94	454	642	10.33
88	9780007189953	0007189958	Poirot	The Complete Ariadne Oliver	http://books.google.com/books/content?id=lbOOJGLxM9MC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The final POIROT omnibus, featuring the last four appearances of the detective's side-kick, the sleuthing crime novelist Ariadne Oliver: Third Girl, Hallowe'en Party, Elephants Can Remember and The Pale Horse. Poirot and Mrs Oliver continue their sleuthing in the 1960s in four uncharacteristically 'modern' novels with an added twist of danger...Third Girl Poirot finally admits he is growing old as a perplexed girl thinks she may have killed someone. Here Christie dragged Poirot into the swinging 60s and effectively squared him up against a world featuring sex, drugs and hippies. Hallowe'en Party A teenage murder witness is drowned in a tub of apples. This was only the second time Christie wrote about the death of a child, and is all the more engrossing for it. Elephants Can Remember An old husband and wife double murder has never been solved -- until now. This was the very last Poirot story that Agatha Christie wrote, and garnered good reviews. The Pale Horse A priest's death leads to sinister goings-on in an old country inn. This bonus novel featured Mrs Oliver for once without Poirot and was one of Christie's darkest stories, blending witchcraft and murder.	2005	4.2	727	83	10.74
89	9780007190683	0007190689	The Art of The Lord of the Rings	\N	http://books.google.com/books/content?id=zl-PPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	The definitive guide to the design of the movie, incorporating the best artwork from the trilogy plus many never-before-published paintings, sketches, digital shots and photos.With complete access to artwork created over a five-year period, this authoritative and insightful book illustrates the creative development of the entire Lord of the Rings movie trilogy.This official book contains over 400 exclusive images; the very best artworks from the first three Art books are collected together, many much larger than they have been seen before, with all-new text and information and new interviews with many of the artists. In addition, the book includes 100 unpublished artworks from the extended Director's cuts of the three films, and digital imagery and designs not available when the first books were published.Printed on high-quality art paper, this lavish book is ideal for Tolkien collectors, film enthusiasts and art students and finally allows the massive undertaking of making The Lord of the Rings trilogy to be fully appreciated.	2004	4.52	224	12	12.31
90	9780007191925	0007191928	The Known World	\N	http://books.google.com/books/content?id=CVS9a6lC5CwC&printsec=frontcover&img=1&zoom=1&source=gbs_api	An epic narrative that takes a look at slavery in all of its moral complexities.	2004	3.83	388	437	10.86
91	9780007195305	0007195303	Discover Your Destiny with the Monk Who Sold His Ferrari	The 7 Stages of Self-Awakening	http://books.google.com/books/content?id=4hVbNc8rRfEC&printsec=frontcover&img=1&zoom=1&source=gbs_api	A potent pathway to self-awakening that will help you to live your greatest life and claim the happiness, prosperity and inner peace that you deserve. From the author of the international bestseller, The Monk Who Sold His Ferrari.	2004	3.9	240	1956	11.2
92	9780007195718	0007195710	Naked Lunch	The Restored Text	http://books.google.com/books/content?id=1B36S7t4k5AC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The anarchic, phenomenally strong-selling classic from the godfather of the Beats: revitalised with a cool new jacket. WELCOME TO INTERZONE...Say hello to Bradley the Buyer, the best narcotics agent in the business. Attend international playboy A.J.'s annual party, where the punch is to be treated with extreme caution. Meet Dr 'Fingers' Schafer, the Lobotomy Kid and his giant centipede, 'The Complete American De-anxietized Man.' And enter the dark and infernal mind of Bill Lee as he pursues his daily quest for the ultimate merchandise...Provocative, influential, morbidly fascinating, Naked Lunch is an apocalyptic ride through the darker recesses of the human psyche.	2005	3.44	289	478	9.67
93	9780007204441	0007204442	Tropic of Cancer	\N	http://books.google.com/books/content?id=ProgRjTL8FIC&printsec=frontcover&img=1&zoom=1&source=gbs_api	Miller's groundbreaking first novel, banned in Britain for almost thirty years, now reinvigorated in a new Harper Perennial Modern Classics edition. A penniless and as yet unpublished writer, Henry Miller arrived in Paris in 1930. Leaving behind a disintegrating marriage and an unhappy career in America, he threw himself into the low-life of bohemian Paris with unwavering gusto. A fictional account of Miller's adventures amongst the prostitutes and pimps, the penniless painters and writers of Montparnasse, Tropic of Cancer is an extravagant and rhapsodic hymn to a world of unrivalled eroticism and freedom. Tropic of Cancer's 1934 publication in France was hailed by Samuel Beckett as 'a momentous event in the history of modern writing'. The novel was subsequently banned in the UK and the USA and not released for publication for a further thirty years.	2005	3.69	336	709	11.35
94	9780007204465	0007204469	Close Range	Brokeback Mountain and Other Stories	http://books.google.com/books/content?id=f-zI3bgDiCAC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The title story in this collection of shorts now a film from Ang Lee.	2006	3.99	318	466	9.63
95	9780007205585	0007205589	The Love of the Last Tycoon	The Authorized Text	http://books.google.com/books/content?id=3EDbEHca_k8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	Depicts the inner-workings of the Hollywood movie industry and its impact on the fabric of American life.	1994	3.65	169	6836	9.19
96	9780020199854	0020199856	Heart Songs and Other Stories	\N	http://books.google.com/books/content?id=_K2fswEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	Before she wrote her Pulitzer Prize-winning bestseller The Shipping News, E. Annie Proulx was already producing some of the finest short fiction in the country. Here are her collected stories, including two new works never before anthologized. These stories reverberate with rural tradition, the rites of nature, and the rituals of small-town life. The country is blue-collar New England; the characters are native families and the dispossessed working class, whose heritage is challenged by the neorural bourgeoisie from the city; and the themes are as elemental as the landscape: revenge, malice, greed, passion. Told with skill and profundity and crafted by a master storyteller, these are lean, tough tales of an extraordinary place and its people.	1995	3.93	203	1822	10.27
97	9780020264736	0020264739	The voyage of the Dawn Treader	\N	http://books.google.com/books/content?id=fDD3CfYb70cC&printsec=frontcover&img=1&zoom=1&source=gbs_api	The Dawn Treader is the first ship Narnia has seen in centuries. King Caspian has built it for his voyage to find the seven lords, good men whom his evil uncle Mizaz banished when he usurped the throne. The journey takes Edmund, Lucy, and their cousin Eustace to the Eastern Islands, beyond the Silver Sea, toward Aslan's country at the End of the World. Illustrations.	1970	4.09	216	2869	10.85
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name) FROM stdin;
1	Fiction
2	Detective and mystery stories
3	American fiction
4	Christian life
5	Authors, English
6	Africa, East
7	Hyland, Morn (Fictitious character)
8	Adventure stories
9	Arthurian romances
10	Fantasy fiction
11	English drama
12	Country life
13	English fiction
14	Clergy
15	Aubrey, Jack (Fictitious character)
16	Detective and mystery stories, English
17	Black Death
18	Human cloning
19	Science fiction
20	Great Britain
21	American essays
22	China
23	Capitalism
24	Ireland
25	Juvenile Fiction
26	Children's stories, English
27	Male friendship
28	Literary Collections
29	Beresford, Tommy (Fictitious character)
30	Imaginary wars and battles
31	Dysfunctional families
32	Poirot, Hercule (Fictitious character)
33	Christmas stories
34	Marple, Jane (Fictitious character)
35	Belgians
36	Battle, Superintendent (Fictitious character)
37	Cambridge (Mass.)
38	Business enterprises
39	Emotional problems
40	Characters and characteristics in motion pictures
41	Fantasy fiction, English
42	Baggins, Frodo (Fictitious character)
43	Fairy tales, English
44	Hallucinogenic drugs
45	Children's stories
46	Parenthood
47	Biography & Autobiography
48	Authors, American
49	Vietnam War, 1961-1975
50	Boys
51	Computer programmers
52	Actors
53	Friendship
54	Authors
55	Costume
56	African American plantation owners
57	Conduct of life
58	Alienation (Social psychology)
59	Cowboys
\.


--
-- Data for Name: category_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_books (id, category_id, book_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	1	4
5	4	5
6	4	6
7	5	7
8	6	8
9	7	9
10	8	10
11	8	11
12	3	12
13	1	13
14	9	14
15	8	15
16	10	16
17	10	17
18	11	18
19	12	19
20	13	20
21	13	21
22	14	22
23	10	23
24	15	24
25	8	25
26	16	26
27	17	27
28	18	28
29	19	29
30	20	30
31	3	31
32	21	32
33	22	33
34	23	34
35	24	35
36	25	36
37	26	37
38	25	38
39	27	39
40	28	40
41	29	41
42	2	42
43	30	43
44	31	44
45	2	45
46	2	46
47	32	47
48	33	48
49	2	49
50	16	50
51	3	51
52	16	52
53	34	53
54	35	54
55	1	55
56	2	56
57	35	57
58	36	58
59	37	59
60	1	60
61	38	61
62	39	62
63	40	63
64	41	64
65	42	65
66	10	66
67	43	67
68	44	68
69	1	69
70	45	70
71	46	71
72	1	72
73	28	73
74	2	74
75	2	75
76	47	76
77	48	77
78	8	78
79	49	79
80	42	80
81	1	81
82	45	82
83	45	83
84	50	84
85	51	85
86	52	86
87	53	87
88	54	88
89	55	89
90	56	90
91	57	91
92	58	92
93	1	93
94	59	94
95	1	95
96	1	96
97	25	97
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	books	book
8	books	library
9	books	reservations
10	books	reservations_books
11	books	library_books
12	books	category
13	books	author
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-27 12:44:39.069232+00
2	auth	0001_initial	2022-03-27 12:44:39.364374+00
3	admin	0001_initial	2022-03-27 12:44:39.49327+00
4	admin	0002_logentry_remove_auto_add	2022-03-27 12:44:39.515439+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-27 12:44:39.535143+00
6	contenttypes	0002_remove_content_type_name	2022-03-27 12:44:39.56219+00
7	auth	0002_alter_permission_name_max_length	2022-03-27 12:44:39.572876+00
8	auth	0003_alter_user_email_max_length	2022-03-27 12:44:39.582659+00
9	auth	0004_alter_user_username_opts	2022-03-27 12:44:39.597602+00
10	auth	0005_alter_user_last_login_null	2022-03-27 12:44:39.607643+00
11	auth	0006_require_contenttypes_0002	2022-03-27 12:44:39.611718+00
12	auth	0007_alter_validators_add_error_messages	2022-03-27 12:44:39.621736+00
13	auth	0008_alter_user_username_max_length	2022-03-27 12:44:39.645988+00
14	auth	0009_alter_user_last_name_max_length	2022-03-27 12:44:39.657713+00
15	auth	0010_alter_group_name_max_length	2022-03-27 12:44:39.670985+00
16	auth	0011_update_proxy_permissions	2022-03-27 12:44:39.681098+00
17	auth	0012_alter_user_first_name_max_length	2022-03-27 12:44:39.691647+00
18	books	0001_initial	2022-03-27 12:44:40.128588+00
19	sessions	0001_initial	2022-03-27 12:44:40.177874+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library (library_id, name) FROM stdin;
1	Library1
2	Library2
3	Library3
4	Library4
5	Library5
6	Library6
7	Library7
8	Library8
9	Library9
10	Library10
\.


--
-- Data for Name: library_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library_books (id, num_copies, book_id, library_id) FROM stdin;
1	1	1	8
2	5	2	5
3	4	3	5
4	1	4	5
5	4	5	6
6	4	6	1
7	2	7	2
8	2	8	1
9	2	9	3
10	2	10	3
11	2	11	3
12	3	12	10
13	2	13	7
14	4	14	7
15	4	15	3
16	5	16	9
17	1	17	2
18	3	18	3
19	5	19	9
20	1	20	9
21	4	21	7
22	2	22	6
23	4	23	5
24	3	24	8
25	1	25	4
26	1	26	1
27	5	27	4
28	3	28	8
29	2	29	5
30	3	30	4
31	3	31	10
32	5	32	9
33	3	33	9
34	1	34	7
35	4	35	7
36	4	36	4
37	5	37	8
38	4	38	3
39	4	39	1
40	3	40	8
41	4	41	1
42	1	42	9
43	3	43	6
44	1	44	1
45	5	45	7
46	4	46	7
47	5	47	3
48	3	48	4
49	3	49	10
50	4	50	7
51	4	51	10
52	3	52	7
53	4	53	1
54	5	54	4
55	4	55	6
56	1	56	8
57	3	57	8
58	1	58	10
59	3	59	7
60	3	60	6
61	5	61	9
62	5	62	9
63	4	63	3
64	2	64	6
65	4	65	1
66	1	66	1
67	4	67	4
68	4	68	7
69	2	69	8
70	5	70	9
71	4	71	1
72	1	72	1
73	1	73	7
74	2	74	10
75	1	75	5
76	2	76	10
77	5	77	4
78	5	78	7
79	2	79	6
80	1	80	4
81	5	81	6
82	1	82	5
83	3	83	10
84	1	84	5
85	2	85	2
86	3	86	3
87	2	87	3
88	3	88	1
89	1	89	10
90	5	90	2
91	2	91	10
92	2	92	7
93	3	93	9
94	2	94	3
95	5	95	2
96	2	96	6
97	1	97	2
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (reservation_id, created_at, customer_id) FROM stdin;
\.


--
-- Data for Name: reservations_books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations_books (id, quantity, book_id, reservation_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_author_id_seq', 1, false);


--
-- Name: author_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_books_id_seq', 1, false);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 1, false);


--
-- Name: category_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_books_id_seq', 1, false);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: library_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_books_id_seq', 1, false);


--
-- Name: library_library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_library_id_seq', 1, false);


--
-- Name: reservations_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_books_id_seq', 1, false);


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_reservation_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: author_books author_books_author_id_book_id_41454530_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_books
    ADD CONSTRAINT author_books_author_id_book_id_41454530_uniq UNIQUE (author_id, book_id);


--
-- Name: author_books author_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_books
    ADD CONSTRAINT author_books_pkey PRIMARY KEY (id);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: category_books category_books_category_id_book_id_7687defc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_books
    ADD CONSTRAINT category_books_category_id_book_id_7687defc_uniq UNIQUE (category_id, book_id);


--
-- Name: category_books category_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_books
    ADD CONSTRAINT category_books_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: library_books library_books_library_id_book_id_1b9fca11_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_library_id_book_id_1b9fca11_uniq UNIQUE (library_id, book_id);


--
-- Name: library_books library_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_pkey PRIMARY KEY (id);


--
-- Name: library library_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library
    ADD CONSTRAINT library_pkey PRIMARY KEY (library_id);


--
-- Name: reservations_books reservations_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations_books
    ADD CONSTRAINT reservations_books_pkey PRIMARY KEY (id);


--
-- Name: reservations_books reservations_books_reservation_id_book_id_4acc6d33_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations_books
    ADD CONSTRAINT reservations_books_reservation_id_book_id_4acc6d33_uniq UNIQUE (reservation_id, book_id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (reservation_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: author_books_author_id_e3596131; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX author_books_author_id_e3596131 ON public.author_books USING btree (author_id);


--
-- Name: author_books_book_id_430b66a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX author_books_book_id_430b66a6 ON public.author_books USING btree (book_id);


--
-- Name: category_books_book_id_6c8cb1d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_books_book_id_6c8cb1d4 ON public.category_books USING btree (book_id);


--
-- Name: category_books_category_id_186e70f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_books_category_id_186e70f5 ON public.category_books USING btree (category_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: library_books_book_id_0d02c758; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX library_books_book_id_0d02c758 ON public.library_books USING btree (book_id);


--
-- Name: library_books_library_id_85fa1d2f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX library_books_library_id_85fa1d2f ON public.library_books USING btree (library_id);


--
-- Name: reservations_books_book_id_937b1d44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reservations_books_book_id_937b1d44 ON public.reservations_books USING btree (book_id);


--
-- Name: reservations_books_reservation_id_0c590a19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reservations_books_reservation_id_0c590a19 ON public.reservations_books USING btree (reservation_id);


--
-- Name: reservations_customer_id_961ae5d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reservations_customer_id_961ae5d5 ON public.reservations USING btree (customer_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_books author_books_author_id_e3596131_fk_author_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_books
    ADD CONSTRAINT author_books_author_id_e3596131_fk_author_author_id FOREIGN KEY (author_id) REFERENCES public.author(author_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_books author_books_book_id_430b66a6_fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_books
    ADD CONSTRAINT author_books_book_id_430b66a6_fk_book_id FOREIGN KEY (book_id) REFERENCES public.book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_books category_books_book_id_6c8cb1d4_fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_books
    ADD CONSTRAINT category_books_book_id_6c8cb1d4_fk_book_id FOREIGN KEY (book_id) REFERENCES public.book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_books category_books_category_id_186e70f5_fk_category_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_books
    ADD CONSTRAINT category_books_category_id_186e70f5_fk_category_category_id FOREIGN KEY (category_id) REFERENCES public.category(category_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: library_books library_books_book_id_0d02c758_fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_book_id_0d02c758_fk_book_id FOREIGN KEY (book_id) REFERENCES public.book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: library_books library_books_library_id_85fa1d2f_fk_library_library_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_library_id_85fa1d2f_fk_library_library_id FOREIGN KEY (library_id) REFERENCES public.library(library_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reservations_books reservations_books_book_id_937b1d44_fk_book_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations_books
    ADD CONSTRAINT reservations_books_book_id_937b1d44_fk_book_id FOREIGN KEY (book_id) REFERENCES public.book(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reservations_books reservations_books_reservation_id_0c590a19_fk_reservati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations_books
    ADD CONSTRAINT reservations_books_reservation_id_0c590a19_fk_reservati FOREIGN KEY (reservation_id) REFERENCES public.reservations(reservation_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reservations reservations_customer_id_961ae5d5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_customer_id_961ae5d5_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

