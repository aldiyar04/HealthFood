--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: app_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_customer (
    id bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    email character varying(64) NOT NULL,
    phone character varying(16) NOT NULL,
    address character varying(255) NOT NULL,
    password character varying(128) NOT NULL
);


ALTER TABLE public.app_customer OWNER TO postgres;

--
-- Name: app_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_customer_id_seq OWNER TO postgres;

--
-- Name: app_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_customer_id_seq OWNED BY public.app_customer.id;


--
-- Name: app_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_order (
    id bigint NOT NULL,
    date date,
    status character varying(128),
    customer_id bigint
);


ALTER TABLE public.app_order OWNER TO postgres;

--
-- Name: app_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_order_id_seq OWNER TO postgres;

--
-- Name: app_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_order_id_seq OWNED BY public.app_order.id;


--
-- Name: app_orderproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_orderproduct (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.app_orderproduct OWNER TO postgres;

--
-- Name: app_orderproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_orderproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_orderproduct_id_seq OWNER TO postgres;

--
-- Name: app_orderproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_orderproduct_id_seq OWNED BY public.app_orderproduct.id;


--
-- Name: app_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_product (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(5,2) NOT NULL
);


ALTER TABLE public.app_product OWNER TO postgres;

--
-- Name: app_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_product_id_seq OWNER TO postgres;

--
-- Name: app_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_product_id_seq OWNED BY public.app_product.id;


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
-- Name: app_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_customer ALTER COLUMN id SET DEFAULT nextval('public.app_customer_id_seq'::regclass);


--
-- Name: app_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_order ALTER COLUMN id SET DEFAULT nextval('public.app_order_id_seq'::regclass);


--
-- Name: app_orderproduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderproduct ALTER COLUMN id SET DEFAULT nextval('public.app_orderproduct_id_seq'::regclass);


--
-- Name: app_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product ALTER COLUMN id SET DEFAULT nextval('public.app_product_id_seq'::regclass);


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
-- Data for Name: app_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_customer (id, first_name, last_name, email, phone, address, password) FROM stdin;
\.


--
-- Data for Name: app_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_order (id, date, status, customer_id) FROM stdin;
\.


--
-- Data for Name: app_orderproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_orderproduct (id, quantity, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: app_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_product (id, name, image, description, price) FROM stdin;
1	Flora Battery Spread	products/product13.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	4.99
2	Alpro Almond Drink	products/product14.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99
3	Hellman's Vegan Mayo	products/product15.jpeg	Hellman\\'s Vegan Mayo	5.99
4	Smooth Vanilla Glace	products/product16.jpeg	Smooth Vanilla Glace	3.99
5	Tesco Dairy Drink	products/product17.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	7.99
6	Tesco Soya Drink	products/product18.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	6.99
7	Stork Pastry	products/product19.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	2.99
8	Tesco Unsweetened Soya	products/product20.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	11.99
9	Koko Long Life Coconut	products/product21.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99
10	Alpro Chocolate Soya	products/product22.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	6.99
11	Cathedral City Spread	products/product23.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	4.99
12	Oatly Chocolate Fudge	products/product24.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	10.99
14	Creamy Oat Spread	products/product5.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.\r\nAlmond drink with added calcium and vitamins.	8.99
15	Applewood Vegan Grated	products/product6.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.\r\nAlmond drink with added calcium and vitamins.	7.99
16	Violife Original Flavour	products/product7.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.\r\nAlmond drink with added calcium and vitamins.	9.99
17	Tesco Coconut Oil	products/product8.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.\r\nAlmond drink with added calcium and vitamins.	5.99
\.


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
1	Can add product	1	add_product
2	Can change product	1	change_product
3	Can delete product	1	delete_product
4	Can view product	1	view_product
5	Can add customer	2	add_customer
6	Can change customer	2	change_customer
7	Can delete customer	2	delete_customer
8	Can view customer	2	view_customer
9	Can add order	3	add_order
10	Can change order	3	change_order
11	Can delete order	3	delete_order
12	Can view order	3	view_order
13	Can add order product	4	add_orderproduct
14	Can change order product	4	change_orderproduct
15	Can delete order product	4	delete_orderproduct
16	Can view order product	4	view_orderproduct
17	Can add log entry	5	add_logentry
18	Can change log entry	5	change_logentry
19	Can delete log entry	5	delete_logentry
20	Can view log entry	5	view_logentry
21	Can add permission	6	add_permission
22	Can change permission	6	change_permission
23	Can delete permission	6	delete_permission
24	Can view permission	6	view_permission
25	Can add group	7	add_group
26	Can change group	7	change_group
27	Can delete group	7	delete_group
28	Can view group	7	view_group
29	Can add user	8	add_user
30	Can change user	8	change_user
31	Can delete user	8	delete_user
32	Can view user	8	view_user
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
37	Can add session	10	add_session
38	Can change session	10	change_session
39	Can delete session	10	delete_session
40	Can view session	10	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$5fAqRhGLnPDguTPUL9wINM$dBQKTVkp4ZUCcV017Iz86yDEjho33MXVhY6VCylgIxE=	2021-11-27 20:01:59.513371+06	t	admin			splitter4774@gmail.com	t	t	2021-11-27 20:01:48.70602+06
2	pbkdf2_sha256$260000$SxZmTKTgneuXC12JLnsKCO$DSJw2SgHAd3eijT5me1Plt41VlRZ3JhT622QVNJPxHc=	2021-11-29 12:05:47.29086+06	t	aldiyar				t	t	2021-11-29 12:05:42.558387+06
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
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-11-27 20:30:09.5063+06	1	Product object (1)	1	[{"added": {}}]	1	1
2	2021-11-27 20:34:05.259019+06	2	Product object (2)	1	[{"added": {}}]	1	1
3	2021-11-27 20:34:45.029552+06	3	Product object (3)	1	[{"added": {}}]	1	1
4	2021-11-27 20:35:11.415106+06	4	Product object (4)	1	[{"added": {}}]	1	1
5	2021-11-27 20:35:41.240914+06	5	Product object (5)	1	[{"added": {}}]	1	1
6	2021-11-27 20:36:05.801108+06	6	Product object (6)	1	[{"added": {}}]	1	1
7	2021-11-27 20:36:26.921065+06	7	Product object (7)	1	[{"added": {}}]	1	1
8	2021-11-27 20:36:59.429549+06	8	Product object (8)	1	[{"added": {}}]	1	1
9	2021-11-27 20:44:26.600798+06	9	Product object (9)	1	[{"added": {}}]	1	1
10	2021-11-27 20:44:49.965764+06	10	Product object (10)	1	[{"added": {}}]	1	1
11	2021-11-27 20:45:13.195167+06	11	Product object (11)	1	[{"added": {}}]	1	1
12	2021-11-27 20:45:32.385189+06	12	Product object (12)	1	[{"added": {}}]	1	1
13	2021-11-29 12:07:08.662419+06	13	Product object (13)	1	[{"added": {}}]	1	2
14	2021-11-29 12:09:49.17446+06	13	Product object (13)	3		1	2
15	2021-11-29 12:10:40.450142+06	14	Product object (14)	1	[{"added": {}}]	1	2
16	2021-11-29 12:11:44.078837+06	15	Product object (15)	1	[{"added": {}}]	1	2
17	2021-11-29 12:12:27.465173+06	16	Product object (16)	1	[{"added": {}}]	1	2
18	2021-11-29 12:13:06.36318+06	17	Product object (17)	1	[{"added": {}}]	1	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	app	product
2	app	customer
3	app	order
4	app	orderproduct
5	admin	logentry
6	auth	permission
7	auth	group
8	auth	user
9	contenttypes	contenttype
10	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-27 19:47:34.205559+06
2	auth	0001_initial	2021-11-27 19:47:35.08114+06
3	admin	0001_initial	2021-11-27 19:47:35.276271+06
4	admin	0002_logentry_remove_auto_add	2021-11-27 19:47:35.287277+06
5	admin	0003_logentry_add_action_flag_choices	2021-11-27 19:47:35.302288+06
6	app	0001_initial	2021-11-27 19:47:35.406357+06
7	app	0002_auto_20211127_1946	2021-11-27 19:47:35.662526+06
8	contenttypes	0002_remove_content_type_name	2021-11-27 19:47:35.704555+06
9	auth	0002_alter_permission_name_max_length	2021-11-27 19:47:35.72557+06
10	auth	0003_alter_user_email_max_length	2021-11-27 19:47:35.762593+06
11	auth	0004_alter_user_username_opts	2021-11-27 19:47:35.78561+06
12	auth	0005_alter_user_last_login_null	2021-11-27 19:47:35.829638+06
13	auth	0006_require_contenttypes_0002	2021-11-27 19:47:35.835642+06
14	auth	0007_alter_validators_add_error_messages	2021-11-27 19:47:35.865662+06
15	auth	0008_alter_user_username_max_length	2021-11-27 19:47:35.98274+06
16	auth	0009_alter_user_last_name_max_length	2021-11-27 19:47:36.004754+06
17	auth	0010_alter_group_name_max_length	2021-11-27 19:47:36.025769+06
18	auth	0011_update_proxy_permissions	2021-11-27 19:47:36.045782+06
19	auth	0012_alter_user_first_name_max_length	2021-11-27 19:47:36.065795+06
20	sessions	0001_initial	2021-11-27 19:47:36.2249+06
21	app	0003_auto_20211127_1950	2021-11-27 19:50:22.070489+06
22	app	0004_auto_20211127_1950	2021-11-27 19:50:56.685266+06
23	app	0005_rename_date_created_order_date	2021-11-27 20:03:52.614476+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mh2pwcdtgrcbdm0xucfazys7nsfigyjc	.eJxVjDsOwjAQBe_iGllssrZlSnrOEO0PHEC2lE-FuDtESgHtm5n3cgOtSxnW2aZhVHdy4A6_G5M8rG5A71RvzUuryzSy3xS_09lfmtrzvLt_B4Xm8q1jMsNMcDSMnAOnICIJMXXAEEgtCwiAMvcd5mvWniJqMOxVkSy59wfqjjhf:1mqyH9:xIvUwpqN6eQm7wZ8lGL2Bvs7LOMt0nsav-lPTz4DHnQ	2021-12-11 20:01:59.568408+06
9rwttzx4fx7bfacd43c28ge87dbtkjgj	.eJxVjEEOwiAQRe_C2hCGAkWX7nsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERWpx-N8L44LqDdMd6azK2ui4zyV2RB-1yaomf18P9OyjYy7ceEXBQiSzpHA2icpnQknMOCOFM2vgBPMOoHUfrszV2UGwcmIygshXvD_A8N7M:1mrZnP:Ma8YCgKNjdH_tRuI2-Pv7PVlCyhu8wF3xbmGhS5KcEY	2021-12-13 12:05:47.29086+06
\.


--
-- Name: app_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_customer_id_seq', 1, false);


--
-- Name: app_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_order_id_seq', 1, false);


--
-- Name: app_orderproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_orderproduct_id_seq', 1, false);


--
-- Name: app_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_product_id_seq', 17, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 18, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: app_customer app_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_customer
    ADD CONSTRAINT app_customer_pkey PRIMARY KEY (id);


--
-- Name: app_order app_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_pkey PRIMARY KEY (id);


--
-- Name: app_orderproduct app_orderproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderproduct
    ADD CONSTRAINT app_orderproduct_pkey PRIMARY KEY (id);


--
-- Name: app_product app_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_pkey PRIMARY KEY (id);


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
-- Name: app_order_customer_id_7c27c407; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_order_customer_id_7c27c407 ON public.app_order USING btree (customer_id);


--
-- Name: app_orderproduct_order_id_69984434; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_orderproduct_order_id_69984434 ON public.app_orderproduct USING btree (order_id);


--
-- Name: app_orderproduct_product_id_95d1e4e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_orderproduct_product_id_95d1e4e6 ON public.app_orderproduct USING btree (product_id);


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
-- Name: app_order app_order_customer_id_7c27c407_fk_app_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_customer_id_7c27c407_fk_app_customer_id FOREIGN KEY (customer_id) REFERENCES public.app_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderproduct app_orderproduct_order_id_69984434_fk_app_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderproduct
    ADD CONSTRAINT app_orderproduct_order_id_69984434_fk_app_order_id FOREIGN KEY (order_id) REFERENCES public.app_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderproduct app_orderproduct_product_id_95d1e4e6_fk_app_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderproduct
    ADD CONSTRAINT app_orderproduct_product_id_95d1e4e6_fk_app_product_id FOREIGN KEY (product_id) REFERENCES public.app_product(id) DEFERRABLE INITIALLY DEFERRED;


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
-- PostgreSQL database dump complete
--

