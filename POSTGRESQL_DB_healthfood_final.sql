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
    password character varying(128) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL
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
    quantity integer,
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
    name character varying(255) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(5,2) NOT NULL,
    slug character varying(255)
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
    user_id bigint NOT NULL,
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

COPY public.app_customer (id, first_name, last_name, email, phone, address, password, date_joined, last_login, is_admin, is_active, is_staff, is_superuser) FROM stdin;
6	Sultan	Altynbayev	23456@iitu.edu.kz	7-707-530-4634	Abai st., 15, 7	pbkdf2_sha256$260000$a6P7tDXyvOAfmkng3Uf46a$lR6shkWtF6VAJkuXmzZf4GmJp/7n+8hcUMNpKYMvgu0=	2021-12-04 19:44:39.971559+06	2021-12-04 19:48:43.294008+06	f	t	f	f
8	Aldiyar	Issenbayev	splitter4774@gmail.com	7-707-234-5678	Manasov st., 18, 8	pbkdf2_sha256$320000$UNtFDoPLf9UPMRxPQWRCLI$j9wJzeDiL96NCY/ANCQFhlDgbTaWWWW2raOmDd+REBA=	2021-12-04 21:02:24.0818+06	2021-12-19 09:24:47.467765+06	t	t	t	t
5	Amir	Zeinoldin	25333@iitu.edu.kz	7-705-345-5634	Pushkin st., 18, 4	pbkdf2_sha256$260000$4svJgnWppFInQtXNAs0MJH$IA+KdnNwyZZRzVeJsyzIZjRENpUHz4np20T5Sh9emok=	2021-12-04 19:42:31.915065+06	2021-12-04 19:42:31.922847+06	f	t	f	f
\.


--
-- Data for Name: app_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_order (id, date, status, customer_id) FROM stdin;
8	2021-12-18	Pending	8
\.


--
-- Data for Name: app_orderproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_orderproduct (id, quantity, order_id, product_id) FROM stdin;
13	3	8	1
\.


--
-- Data for Name: app_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_product (id, name, image, description, price, slug) FROM stdin;
1	Healthy Milk	products/product1.png	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	4.99	healthy-milk
2	Green Beans	products/product2.png	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	12.99	green-beans
3	Energy Food	products/product3.png	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99	energy-food
4	Refill Pack	products/product4.png	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	7.99	refill-pack
5	Creamy Oak Spread	products/product5.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	8.99	creamy-oak-spread
6	Vegan Cheese	products/product6.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	11.99	vegan-cheese
7	Original Flavour	products/product7.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	6.99	original-flavour
8	Coconut Oil	products/product8.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	9.99	coconut-oil
9	Cocospread	products/product9.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99	cocospread
10	Mozarella Alternative	products/product10.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	6.99	mozarella-alternative
11	Cheddar Flavour	products/product11.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99	cheddar-flavour
12	Light Spread	products/product12.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	5.99	light-spread
13	Flora Battery Spread	products/product13.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	4.99	flora-battery-spread
14	Alpro Almond Drink	products/product14.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	10.99	alpro-almond-drink
15	Hellman's Vegan Mayo	products/product15.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	12.99	hellmans-vegan-mayo
16	Smooth Vanilla Grace	products/product16.jpeg	Almond drink with added calcium and vitamins.\r\n\r\nAlpro were born plant-based, way back in 1980, and we've been banging that big, plant-based drum ever since. Our mission is the same now as it was then. To make delicious food that's healthy for you and healthy for the planet. And we go the extra mile to do it. Using less water and energy. Sourcing ingredients grown in a way that puts goodness back into the earth. And developing more and more sustainable, plant-based packaging.\r\n\r\nYou're a sensible person, and that's cool. But every now and then, it's OK to go nuts. Even as nutty as our crazily awesome Almond drink. You can mix it in your coffee and hot drinks, cold shakes and smoothies, splash it on your cereal and stir it into porridge. Or just enjoy it as it comes, refreshingly chilled and sipped from a glass. Because lovely as milk might be, isn't it great to have more choice? Totally plant based and dairy free, this is naturally perfect for a vegan diet. But why should vegans have all the fun? Vegetarian, flexitarian, or just want to give it a go? Anyone can pour a little extra plant-based delicious into their everyday, vegan or not, we say! At Alpro we call our products almond drinks and not almond milks - why, you ask? By definition - milk is a nutrient-rich food produced by mammals - and our tasty almond drinks are completely plant-based!\r\n\r\nGood for you*, good for the planet. We're proud to have been a certified B Corp company since 2018. Making us part of a global movement that believes businesses can be a force for good in society, and should do things in a caring, sustainable way that has a positive impact on people and planet. Like the way our almonds are grown. On small farms around the Mediterranean, where nature is nurtured, pollinating insects are protected, and the trees mostly watered by rain. And good inside, good outside! By 2025, all of our packs will be, not just recyclable, but made from 100% already recycled or plant-based materials. Bye bye, polystyrene. Hello, more recycled, recyclable PET and sustainably grown sugarcane cartons!\r\n\r\n*A source of calcium. Calcium is needed for the maintenance of normal bones. A varied and balanced diet and a healthy lifestyle are recommended for good health.	6.99	smooth-vanilla-grace
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
1	Can add customer	1	add_customer
2	Can change customer	1	change_customer
3	Can delete customer	1	delete_customer
4	Can view customer	1	view_customer
5	Can add order	2	add_order
6	Can change order	2	change_order
7	Can delete order	2	delete_order
8	Can view order	2	view_order
9	Can add product	3	add_product
10	Can change product	3	change_product
11	Can delete product	3	delete_product
12	Can view product	3	view_product
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
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-12-04 21:11:02.295576+06	1	Product object (1)	1	[{"added": {}}]	3	8
2	2021-12-04 21:11:43.98024+06	2	Product object (2)	1	[{"added": {}}]	3	8
3	2021-12-04 22:21:43.32032+06	3	Product object (3)	1	[{"added": {}}]	3	8
4	2021-12-04 22:21:59.859767+06	4	Product object (4)	1	[{"added": {}}]	3	8
5	2021-12-04 22:22:21.536634+06	5	Product object (5)	1	[{"added": {}}]	3	8
6	2021-12-04 22:22:47.415134+06	6	Product object (6)	1	[{"added": {}}]	3	8
7	2021-12-04 22:23:05.016888+06	7	Product object (7)	1	[{"added": {}}]	3	8
8	2021-12-04 22:23:35.14768+06	8	Product object (8)	1	[{"added": {}}]	3	8
9	2021-12-04 22:24:07.295998+06	9	Product object (9)	1	[{"added": {}}]	3	8
10	2021-12-04 22:24:39.372564+06	10	Product object (10)	1	[{"added": {}}]	3	8
11	2021-12-04 22:25:00.06746+06	11	Product object (11)	1	[{"added": {}}]	3	8
12	2021-12-04 22:25:28.139733+06	12	Product object (12)	1	[{"added": {}}]	3	8
13	2021-12-04 22:26:45.632794+06	13	Product object (13)	1	[{"added": {}}]	3	8
14	2021-12-04 22:27:02.309954+06	14	Product object (14)	1	[{"added": {}}]	3	8
15	2021-12-04 22:27:25.669841+06	15	Product object (15)	1	[{"added": {}}]	3	8
16	2021-12-04 22:28:04.669796+06	16	Product object (16)	1	[{"added": {}}]	3	8
17	2021-12-18 21:59:01.75086+06	8	OrderProduct object (8)	3		4	8
18	2021-12-18 21:59:01.754703+06	7	OrderProduct object (7)	3		4	8
19	2021-12-18 21:59:01.754703+06	6	OrderProduct object (6)	3		4	8
20	2021-12-18 21:59:01.755703+06	5	OrderProduct object (5)	3		4	8
21	2021-12-18 21:59:13.991875+06	3	Order object (3)	3		2	8
22	2021-12-18 21:59:13.993722+06	2	Order object (2)	3		2	8
23	2021-12-18 22:12:39.985256+06	12	OrderProduct object (12)	3		4	8
24	2021-12-18 22:12:39.997259+06	11	OrderProduct object (11)	3		4	8
25	2021-12-18 22:12:39.99826+06	10	OrderProduct object (10)	3		4	8
26	2021-12-18 22:12:39.99826+06	9	OrderProduct object (9)	3		4	8
27	2021-12-18 22:12:48.224347+06	7	Order object (7)	3		2	8
28	2021-12-18 22:12:48.225934+06	6	Order object (6)	3		2	8
29	2021-12-18 22:12:48.226422+06	5	Order object (5)	3		2	8
30	2021-12-18 22:12:48.226857+06	4	Order object (4)	3		2	8
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	app	customer
2	app	order
3	app	product
4	app	orderproduct
5	admin	logentry
6	auth	permission
7	auth	group
8	contenttypes	contenttype
9	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	app	0001_initial	2021-12-04 13:45:55.53196+06
2	contenttypes	0001_initial	2021-12-04 13:55:01.077286+06
3	admin	0001_initial	2021-12-04 13:55:01.096289+06
4	admin	0002_logentry_remove_auto_add	2021-12-04 13:55:01.100291+06
5	admin	0003_logentry_add_action_flag_choices	2021-12-04 13:55:01.103292+06
6	contenttypes	0002_remove_content_type_name	2021-12-04 13:55:01.115294+06
7	auth	0001_initial	2021-12-04 13:55:01.152303+06
8	auth	0002_alter_permission_name_max_length	2021-12-04 13:55:01.157304+06
9	auth	0003_alter_user_email_max_length	2021-12-04 13:55:01.161305+06
10	auth	0004_alter_user_username_opts	2021-12-04 13:55:01.165306+06
11	auth	0005_alter_user_last_login_null	2021-12-04 13:55:01.169307+06
12	auth	0006_require_contenttypes_0002	2021-12-04 13:55:01.170306+06
13	auth	0007_alter_validators_add_error_messages	2021-12-04 13:55:01.174308+06
14	auth	0008_alter_user_username_max_length	2021-12-04 13:55:01.179308+06
15	auth	0009_alter_user_last_name_max_length	2021-12-04 13:55:01.18331+06
16	auth	0010_alter_group_name_max_length	2021-12-04 13:55:01.191311+06
17	auth	0011_update_proxy_permissions	2021-12-04 13:55:01.197313+06
18	auth	0012_alter_user_first_name_max_length	2021-12-04 13:55:01.201313+06
19	sessions	0001_initial	2021-12-04 13:55:01.210939+06
20	app	0002_alter_product_name	2021-12-04 20:53:03.475746+06
21	app	0003_auto_20211204_2101	2021-12-04 21:01:02.876553+06
22	app	0004_alter_order_status_alter_orderproduct_quantity_and_more	2021-12-17 19:15:27.175753+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0m8gb3n16tc7v3uk7wbmrw54mvfdrnxi	.eJxVjDsOgzAQBe_iOrLYBWyWMj1nQPvBgSQCiU-FuHuCRJG0b-bN7lre1r7dlm5uB3O1q9ztdxPWVzeewJ48Piav07jOg_hT8RddfDNZ975f7l-g56X_viFUMRUhgmBCynIDokhiSmSYQZGsRA6iUlJCFQQliDFwHgWjhTOqPK-u3h24Go7jAyx3O7U:1myE39:Zl7nQayQY-k-gSSgwr5HEhPLQvaqUYZI8KnbdhJHTHc	2021-12-31 20:17:31.896456+06
xitv8pajf91qr4lqvc8panm5pdtfwa4v	.eJxVjMsOwiAQRf-FtSHlJYNL934DGZhBqgaS0q6M_26adKHbe865bxFxW2vcBi9xJnERIE6_W8L85LYDemC7d5l7W5c5yV2RBx3y1olf18P9O6g46l6zIzBWB0IVpgKOU_Gg81kZ5xg1B6JkEQxMgFMJ3lBhlRNa57ViLT5f9V84QQ:1mtXvo:SCLJY5_Cq3HVhsCb7HQMXr9U2jxwMHa171tNXDHLrCY	2021-12-18 22:30:36.141181+06
\.


--
-- Name: app_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_customer_id_seq', 8, true);


--
-- Name: app_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_order_id_seq', 8, true);


--
-- Name: app_orderproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_orderproduct_id_seq', 13, true);


--
-- Name: app_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_product_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 30, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: app_customer app_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_customer
    ADD CONSTRAINT app_customer_email_key UNIQUE (email);


--
-- Name: app_customer app_customer_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_customer
    ADD CONSTRAINT app_customer_phone_key UNIQUE (phone);


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
-- Name: app_product app_product_name_26582e92_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_name_26582e92_uniq UNIQUE (name);


--
-- Name: app_product app_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_pkey PRIMARY KEY (id);


--
-- Name: app_product app_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_slug_key UNIQUE (slug);


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
-- Name: app_customer_email_1e706f0d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_customer_email_1e706f0d_like ON public.app_customer USING btree (email varchar_pattern_ops);


--
-- Name: app_customer_phone_93619d3a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_customer_phone_93619d3a_like ON public.app_customer USING btree (phone varchar_pattern_ops);


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
-- Name: app_product_name_26582e92_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_product_name_26582e92_like ON public.app_product USING btree (name varchar_pattern_ops);


--
-- Name: app_product_slug_53348030_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_product_slug_53348030_like ON public.app_product USING btree (slug varchar_pattern_ops);


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_customer_id FOREIGN KEY (user_id) REFERENCES public.app_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

