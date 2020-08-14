--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12rc1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: akademisyenLogKaydet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."akademisyenLogKaydet"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO loglar("metin", "tarih")
    VALUES('yeni akademisyen eklendi',now());   
	RETURN NULL;
END;
$$;


ALTER FUNCTION public."akademisyenLogKaydet"() OWNER TO postgres;

--
-- Name: akademisyenekle(text, text, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.akademisyenekle(p_adisoyadi text, p_sifre text, p_fakulte_no integer, p_ulke_no integer, p_il_no integer, p_ilce_no integer, p_lisans_no integer, p_master_no integer, p_doktora_no integer)
    LANGUAGE sql
    AS $$
	INSERT INTO kisiler("adiSoyadi", "ulkeNo","ilNo","ilceNo","lisansNo","masterNo","doktoraNo")
    VALUES(p_adiSoyadi,p_ulke_no,p_il_no,p_ilce_no,p_lisans_no,p_master_no,p_doktora_no);  
	
	INSERT INTO akademisyenler("sifre","fakulteNo","aktif", "kisiNo")
    VALUES(p_sifre, p_fakulte_no,true, currval('kisiler_id_seq'::regclass)); 
$$;


ALTER PROCEDURE public.akademisyenekle(p_adisoyadi text, p_sifre text, p_fakulte_no integer, p_ulke_no integer, p_il_no integer, p_ilce_no integer, p_lisans_no integer, p_master_no integer, p_doktora_no integer) OWNER TO postgres;

--
-- Name: akademisyensil(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.akademisyensil(p_akademisyenno integer)
    LANGUAGE sql
    AS $$
    UPDATE akademisyenler
		SET aktif = false
	WHERE "akademisyenNo" = p_akademisyenNo;
$$;


ALTER PROCEDURE public.akademisyensil(p_akademisyenno integer) OWNER TO postgres;

--
-- Name: dersLogKaydet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."dersLogKaydet"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO loglar("metin", "tarih")
    VALUES('yeni ders eklendi',now());   
	RETURN NULL;
END;
$$;


ALTER FUNCTION public."dersLogKaydet"() OWNER TO postgres;

--
-- Name: dersal(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.dersal(p_ogrenci_no integer, p_ders_no integer)
    LANGUAGE sql
    AS $$
    INSERT INTO "ogrenciAlinanDers"("ogrenciNo","dersNo","ogrenciNotu","aktif")
    VALUES(p_ogrenci_no,p_ders_no,0,true); 
$$;


ALTER PROCEDURE public.dersal(p_ogrenci_no integer, p_ders_no integer) OWNER TO postgres;

--
-- Name: dersbirak(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.dersbirak(p_ogrenci_no integer, p_ders_no integer)
    LANGUAGE sql
    AS $$
    UPDATE "ogrenciAlinanDers"
		SET aktif = false
	WHERE "ogrenciNo" = p_ogrenci_no and "dersNo" = p_ders_no
$$;


ALTER PROCEDURE public.dersbirak(p_ogrenci_no integer, p_ders_no integer) OWNER TO postgres;

--
-- Name: dersekle(text, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.dersekle(p_ders_adi text, p_sinif_no integer, p_hoca_no integer)
    LANGUAGE sql
    AS $$
    INSERT INTO dersler("adi", "sinifNo","akademisyenNo","aktif")
    VALUES(p_ders_adi,p_sinif_no,p_hoca_no,true); 
$$;


ALTER PROCEDURE public.dersekle(p_ders_adi text, p_sinif_no integer, p_hoca_no integer) OWNER TO postgres;

--
-- Name: derssil(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.derssil(p_ders_no integer)
    LANGUAGE sql
    AS $$
    UPDATE dersler
		SET aktif = false
	WHERE "id" = p_ders_no;
$$;


ALTER PROCEDURE public.derssil(p_ders_no integer) OWNER TO postgres;

--
-- Name: notgir(integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.notgir(p_ogrenci_no integer, p_not integer)
    LANGUAGE sql
    AS $$
	UPDATE "ogrenciAlinanDers"
    	SET "ogrenciNotu" = p_not
	WHERE "ogrenciNo" = p_ogrenci_no
$$;


ALTER PROCEDURE public.notgir(p_ogrenci_no integer, p_not integer) OWNER TO postgres;

--
-- Name: ogrenciLogKaydet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ogrenciLogKaydet"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO loglar("metin", "tarih")
    VALUES('yeni öğrenci eklendi',now());   
	RETURN NULL;
END;
$$;


ALTER FUNCTION public."ogrenciLogKaydet"() OWNER TO postgres;

--
-- Name: ogrenciekle(text, text, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ogrenciekle(p_adisoyadi text, p_sifre text, p_ulke_no integer, p_il_no integer, p_ilce_no integer, p_lisans_no integer)
    LANGUAGE sql
    AS $$
	INSERT INTO kisiler("adiSoyadi", "ulkeNo","ilNo","ilceNo","lisansNo","masterNo","doktoraNo")
    VALUES(p_adiSoyadi,p_ulke_no,p_il_no,p_ilce_no,p_lisans_no,null,null);  
	
    INSERT INTO ogrenciler("sifre","aktif","kisiNo")
    VALUES(p_sifre,true,currval('kisiler_id_seq'::regclass));  
	

$$;


ALTER PROCEDURE public.ogrenciekle(p_adisoyadi text, p_sifre text, p_ulke_no integer, p_il_no integer, p_ilce_no integer, p_lisans_no integer) OWNER TO postgres;

--
-- Name: ogrencisil(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ogrencisil(p_ogrencino integer)
    LANGUAGE sql
    AS $$
    UPDATE ogrenciler
		SET aktif = false
	WHERE "ogrenciNo" = p_ogrenciNo;
$$;


ALTER PROCEDURE public.ogrencisil(p_ogrencino integer) OWNER TO postgres;

--
-- Name: yeniDersLogKaydet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."yeniDersLogKaydet"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO loglar("metin", "tarih")
    VALUES('yeni ders kaydı eklendi',now());   
	RETURN NULL;
END;
$$;


ALTER FUNCTION public."yeniDersLogKaydet"() OWNER TO postgres;

--
-- Name: akademisyenler_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.akademisyenler_no_seq
    START WITH 100000
    INCREMENT BY 1
    MINVALUE 100000
    MAXVALUE 199999
    CACHE 1;


ALTER TABLE public.akademisyenler_no_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: akademisyenler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.akademisyenler (
    id integer NOT NULL,
    "akademisyenNo" integer DEFAULT nextval('public.akademisyenler_no_seq'::regclass) NOT NULL,
    sifre text NOT NULL,
    "fakulteNo" integer NOT NULL,
    aktif boolean NOT NULL,
    "kisiNo" integer NOT NULL
);


ALTER TABLE public.akademisyenler OWNER TO postgres;

--
-- Name: akademisyenler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.akademisyenler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.akademisyenler_id_seq OWNER TO postgres;

--
-- Name: akademisyenler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.akademisyenler_id_seq OWNED BY public.akademisyenler.id;


--
-- Name: dersler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dersler (
    id integer NOT NULL,
    adi text NOT NULL,
    "sinifNo" integer NOT NULL,
    "akademisyenNo" integer NOT NULL,
    aktif boolean NOT NULL
);


ALTER TABLE public.dersler OWNER TO postgres;

--
-- Name: dersler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dersler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dersler_id_seq OWNER TO postgres;

--
-- Name: dersler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dersler_id_seq OWNED BY public.dersler.id;


--
-- Name: doktoraBolumleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."doktoraBolumleri" (
    id integer NOT NULL,
    "Adi" text NOT NULL
);


ALTER TABLE public."doktoraBolumleri" OWNER TO postgres;

--
-- Name: doktoraBolumleri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."doktoraBolumleri_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."doktoraBolumleri_id_seq" OWNER TO postgres;

--
-- Name: doktoraBolumleri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."doktoraBolumleri_id_seq" OWNED BY public."doktoraBolumleri".id;


--
-- Name: fakulteler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fakulteler (
    "fakulteNo" integer NOT NULL,
    "fakulteAdi" text NOT NULL,
    "fakulteKod" text NOT NULL
);


ALTER TABLE public.fakulteler OWNER TO postgres;

--
-- Name: fakulteler_fakulteNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."fakulteler_fakulteNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."fakulteler_fakulteNo_seq" OWNER TO postgres;

--
-- Name: fakulteler_fakulteNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."fakulteler_fakulteNo_seq" OWNED BY public.fakulteler."fakulteNo";


--
-- Name: ilceler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilceler (
    id integer NOT NULL,
    "ilceAdi" text NOT NULL
);


ALTER TABLE public.ilceler OWNER TO postgres;

--
-- Name: ilceler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilceler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilceler_id_seq OWNER TO postgres;

--
-- Name: ilceler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilceler_id_seq OWNED BY public.ilceler.id;


--
-- Name: iller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iller (
    id integer NOT NULL,
    "plakaNo" integer NOT NULL,
    "Adi" text NOT NULL
);


ALTER TABLE public.iller OWNER TO postgres;

--
-- Name: iller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iller_id_seq OWNER TO postgres;

--
-- Name: iller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iller_id_seq OWNED BY public.iller.id;


--
-- Name: kisiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisiler (
    id integer NOT NULL,
    "adiSoyadi" text NOT NULL,
    "ulkeNo" integer NOT NULL,
    "ilNo" integer NOT NULL,
    "ilceNo" integer NOT NULL,
    "lisansNo" integer NOT NULL,
    "masterNo" integer,
    "doktoraNo" integer
);


ALTER TABLE public.kisiler OWNER TO postgres;

--
-- Name: kisiler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kisiler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kisiler_id_seq OWNER TO postgres;

--
-- Name: kisiler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kisiler_id_seq OWNED BY public.kisiler.id;


--
-- Name: lisansBolumleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."lisansBolumleri" (
    id integer NOT NULL,
    "Adi" text NOT NULL
);


ALTER TABLE public."lisansBolumleri" OWNER TO postgres;

--
-- Name: lisansBolumleri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."lisansBolumleri_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."lisansBolumleri_id_seq" OWNER TO postgres;

--
-- Name: lisansBolumleri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."lisansBolumleri_id_seq" OWNED BY public."lisansBolumleri".id;


--
-- Name: loglar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loglar (
    id integer NOT NULL,
    metin text NOT NULL,
    tarih date NOT NULL
);


ALTER TABLE public.loglar OWNER TO postgres;

--
-- Name: loglar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loglar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loglar_id_seq OWNER TO postgres;

--
-- Name: loglar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loglar_id_seq OWNED BY public.loglar.id;


--
-- Name: masterBolumleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."masterBolumleri" (
    id integer NOT NULL,
    "Adi" text NOT NULL
);


ALTER TABLE public."masterBolumleri" OWNER TO postgres;

--
-- Name: masterBolumleri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."masterBolumleri_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."masterBolumleri_id_seq" OWNER TO postgres;

--
-- Name: masterBolumleri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."masterBolumleri_id_seq" OWNED BY public."masterBolumleri".id;


--
-- Name: ogrenciAlinanDers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ogrenciAlinanDers" (
    id integer NOT NULL,
    "ogrenciNo" integer NOT NULL,
    "dersNo" integer NOT NULL,
    "ogrenciNotu" integer NOT NULL,
    aktif boolean NOT NULL
);


ALTER TABLE public."ogrenciAlinanDers" OWNER TO postgres;

--
-- Name: ogrenciAlinanDers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ogrenciAlinanDers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ogrenciAlinanDers_id_seq" OWNER TO postgres;

--
-- Name: ogrenciAlinanDers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ogrenciAlinanDers_id_seq" OWNED BY public."ogrenciAlinanDers".id;


--
-- Name: ogrenciler_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ogrenciler_no_seq
    START WITH 200000
    INCREMENT BY 1
    MINVALUE 200000
    MAXVALUE 299999
    CACHE 1;


ALTER TABLE public.ogrenciler_no_seq OWNER TO postgres;

--
-- Name: ogrenciler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenciler (
    id integer NOT NULL,
    "ogrenciNo" integer DEFAULT nextval('public.ogrenciler_no_seq'::regclass) NOT NULL,
    sifre text NOT NULL,
    aktif boolean NOT NULL,
    "kisiNo" integer NOT NULL
);


ALTER TABLE public.ogrenciler OWNER TO postgres;

--
-- Name: ogrenciler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ogrenciler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ogrenciler_id_seq OWNER TO postgres;

--
-- Name: ogrenciler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ogrenciler_id_seq OWNED BY public.ogrenciler.id;


--
-- Name: personeller_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personeller_no_seq
    START WITH 300000
    INCREMENT BY 1
    MINVALUE 300000
    MAXVALUE 399999
    CACHE 1;


ALTER TABLE public.personeller_no_seq OWNER TO postgres;

--
-- Name: personeller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personeller (
    id integer NOT NULL,
    "personelNo" integer DEFAULT nextval('public.personeller_no_seq'::regclass) NOT NULL,
    sifre text NOT NULL
);


ALTER TABLE public.personeller OWNER TO postgres;

--
-- Name: personeller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personeller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personeller_id_seq OWNER TO postgres;

--
-- Name: personeller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personeller_id_seq OWNED BY public.personeller.id;


--
-- Name: siniflar_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siniflar_no_seq
    START WITH 400000
    INCREMENT BY 1
    MINVALUE 400000
    MAXVALUE 499999
    CACHE 1;


ALTER TABLE public.siniflar_no_seq OWNER TO postgres;

--
-- Name: siniflar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siniflar (
    id integer NOT NULL,
    adi text NOT NULL,
    "bulunduguKat" integer NOT NULL,
    "sinifNo" integer DEFAULT nextval('public.siniflar_no_seq'::regclass) NOT NULL
);


ALTER TABLE public.siniflar OWNER TO postgres;

--
-- Name: siniflar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siniflar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siniflar_id_seq OWNER TO postgres;

--
-- Name: siniflar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siniflar_id_seq OWNED BY public.siniflar.id;


--
-- Name: ulkeler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulkeler (
    id integer NOT NULL,
    "ulkeAdi" text NOT NULL
);


ALTER TABLE public.ulkeler OWNER TO postgres;

--
-- Name: ulkeler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ulkeler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ulkeler_id_seq OWNER TO postgres;

--
-- Name: ulkeler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ulkeler_id_seq OWNED BY public.ulkeler.id;


--
-- Name: akademisyenler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akademisyenler ALTER COLUMN id SET DEFAULT nextval('public.akademisyenler_id_seq'::regclass);


--
-- Name: dersler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dersler ALTER COLUMN id SET DEFAULT nextval('public.dersler_id_seq'::regclass);


--
-- Name: doktoraBolumleri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doktoraBolumleri" ALTER COLUMN id SET DEFAULT nextval('public."doktoraBolumleri_id_seq"'::regclass);


--
-- Name: fakulteler fakulteNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fakulteler ALTER COLUMN "fakulteNo" SET DEFAULT nextval('public."fakulteler_fakulteNo_seq"'::regclass);


--
-- Name: ilceler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilceler ALTER COLUMN id SET DEFAULT nextval('public.ilceler_id_seq'::regclass);


--
-- Name: iller id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller ALTER COLUMN id SET DEFAULT nextval('public.iller_id_seq'::regclass);


--
-- Name: kisiler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler ALTER COLUMN id SET DEFAULT nextval('public.kisiler_id_seq'::regclass);


--
-- Name: lisansBolumleri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."lisansBolumleri" ALTER COLUMN id SET DEFAULT nextval('public."lisansBolumleri_id_seq"'::regclass);


--
-- Name: loglar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loglar ALTER COLUMN id SET DEFAULT nextval('public.loglar_id_seq'::regclass);


--
-- Name: masterBolumleri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."masterBolumleri" ALTER COLUMN id SET DEFAULT nextval('public."masterBolumleri_id_seq"'::regclass);


--
-- Name: ogrenciAlinanDers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ogrenciAlinanDers" ALTER COLUMN id SET DEFAULT nextval('public."ogrenciAlinanDers_id_seq"'::regclass);


--
-- Name: ogrenciler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenciler ALTER COLUMN id SET DEFAULT nextval('public.ogrenciler_id_seq'::regclass);


--
-- Name: personeller id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller ALTER COLUMN id SET DEFAULT nextval('public.personeller_id_seq'::regclass);


--
-- Name: siniflar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siniflar ALTER COLUMN id SET DEFAULT nextval('public.siniflar_id_seq'::regclass);


--
-- Name: ulkeler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulkeler ALTER COLUMN id SET DEFAULT nextval('public.ulkeler_id_seq'::regclass);


--
-- Data for Name: akademisyenler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.akademisyenler VALUES (4, 100003, '12345', 2, true, 13);
INSERT INTO public.akademisyenler VALUES (3, 100002, '12345', 1, true, 12);


--
-- Data for Name: dersler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dersler VALUES (3, 'Veritabanı Yönetim Sistemleri', 400002, 100002, true);


--
-- Data for Name: doktoraBolumleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."doktoraBolumleri" VALUES (1, 'Büyük Veri');
INSERT INTO public."doktoraBolumleri" VALUES (2, 'Veri Analizi');
INSERT INTO public."doktoraBolumleri" VALUES (3, 'Veri İletişimi');


--
-- Data for Name: fakulteler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fakulteler VALUES (1, 'Bilgisayar ve Bilişim Bilimleri Fakültesi', 'BBBF');
INSERT INTO public.fakulteler VALUES (2, 'Tıp Fakültesi', 'TF');


--
-- Data for Name: ilceler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilceler VALUES (1, 'Bagcilar');
INSERT INTO public.ilceler VALUES (2, 'Pendik');


--
-- Data for Name: iller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.iller VALUES (1, 34, 'İstanbul');
INSERT INTO public.iller VALUES (2, 6, 'Ankara');


--
-- Data for Name: kisiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kisiler VALUES (10, 'GÖKMEN SEZİKLİ', 1, 34, 1, 1, NULL, NULL);
INSERT INTO public.kisiler VALUES (11, 'BİROL TEKELİ', 1, 34, 1, 1, NULL, NULL);
INSERT INTO public.kisiler VALUES (12, 'SİNEM YAMAK', 1, 34, 1, 1, 1, 1);
INSERT INTO public.kisiler VALUES (13, 'MUSTAFA ABDULLAH DEVECİ', 1, 34, 1, 1, 2, 2);


--
-- Data for Name: lisansBolumleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."lisansBolumleri" VALUES (1, 'Bilgisayar Mühendisliği');
INSERT INTO public."lisansBolumleri" VALUES (2, 'Makine Mühendisliği');


--
-- Data for Name: loglar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.loglar VALUES (9, 'yeni öğrenci eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (10, 'yeni öğrenci eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (11, 'yeni akademisyen eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (12, 'yeni akademisyen eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (13, 'yeni ders eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (14, 'yeni ders kaydı eklendi', '2020-08-13');
INSERT INTO public.loglar VALUES (15, 'yeni ders kaydı eklendi', '2020-08-13');


--
-- Data for Name: masterBolumleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."masterBolumleri" VALUES (1, 'Bilgisayar Bilimi');
INSERT INTO public."masterBolumleri" VALUES (2, 'Bilgisayar Mühendisliği');
INSERT INTO public."masterBolumleri" VALUES (3, 'Veri Bilimi');


--
-- Data for Name: ogrenciAlinanDers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ogrenciAlinanDers" VALUES (2, 200005, 3, 0, false);
INSERT INTO public."ogrenciAlinanDers" VALUES (3, 200005, 3, 0, true);


--
-- Data for Name: ogrenciler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ogrenciler VALUES (7, 200006, '12345', true, 11);
INSERT INTO public.ogrenciler VALUES (6, 200005, '12345', true, 10);


--
-- Data for Name: personeller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personeller VALUES (1, 300001, '12345');


--
-- Data for Name: siniflar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.siniflar VALUES (1, 'Lab1', 0, 400002);


--
-- Data for Name: ulkeler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ulkeler VALUES (1, 'Türkiye');
INSERT INTO public.ulkeler VALUES (2, 'Almanya');


--
-- Name: akademisyenler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.akademisyenler_id_seq', 4, true);


--
-- Name: akademisyenler_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.akademisyenler_no_seq', 100003, true);


--
-- Name: dersler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dersler_id_seq', 3, true);


--
-- Name: doktoraBolumleri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."doktoraBolumleri_id_seq"', 3, false);


--
-- Name: fakulteler_fakulteNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."fakulteler_fakulteNo_seq"', 2, true);


--
-- Name: ilceler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilceler_id_seq', 2, true);


--
-- Name: iller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iller_id_seq', 2, true);


--
-- Name: kisiler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kisiler_id_seq', 13, true);


--
-- Name: lisansBolumleri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."lisansBolumleri_id_seq"', 2, true);


--
-- Name: loglar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loglar_id_seq', 15, true);


--
-- Name: masterBolumleri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."masterBolumleri_id_seq"', 3, true);


--
-- Name: ogrenciAlinanDers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ogrenciAlinanDers_id_seq"', 3, true);


--
-- Name: ogrenciler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ogrenciler_id_seq', 7, true);


--
-- Name: ogrenciler_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ogrenciler_no_seq', 200006, true);


--
-- Name: personeller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personeller_id_seq', 1, true);


--
-- Name: personeller_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personeller_no_seq', 300001, true);


--
-- Name: siniflar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siniflar_id_seq', 1, true);


--
-- Name: siniflar_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siniflar_no_seq', 400002, true);


--
-- Name: ulkeler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ulkeler_id_seq', 2, true);


--
-- Name: akademisyenler akademisyenler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akademisyenler
    ADD CONSTRAINT akademisyenler_pkey PRIMARY KEY (id);


--
-- Name: dersler dersler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dersler
    ADD CONSTRAINT dersler_pkey PRIMARY KEY (id);


--
-- Name: doktoraBolumleri doktoraBolumleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doktoraBolumleri"
    ADD CONSTRAINT "doktoraBolumleri_pkey" PRIMARY KEY (id);


--
-- Name: fakulteler fakulteler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fakulteler
    ADD CONSTRAINT fakulteler_pkey PRIMARY KEY ("fakulteNo");


--
-- Name: ilceler ilceler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilceler
    ADD CONSTRAINT ilceler_pkey PRIMARY KEY (id);


--
-- Name: iller iller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller
    ADD CONSTRAINT iller_pkey PRIMARY KEY (id);


--
-- Name: kisiler kisiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT kisiler_pkey PRIMARY KEY (id);


--
-- Name: lisansBolumleri lisansBolumleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."lisansBolumleri"
    ADD CONSTRAINT "lisansBolumleri_pkey" PRIMARY KEY (id);


--
-- Name: loglar loglar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loglar
    ADD CONSTRAINT loglar_pkey PRIMARY KEY (id);


--
-- Name: masterBolumleri masterBolumleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."masterBolumleri"
    ADD CONSTRAINT "masterBolumleri_pkey" PRIMARY KEY (id);


--
-- Name: ogrenciAlinanDers ogrenciAlinanDers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ogrenciAlinanDers"
    ADD CONSTRAINT "ogrenciAlinanDers_pkey" PRIMARY KEY (id);


--
-- Name: ogrenciler ogrenciler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenciler
    ADD CONSTRAINT ogrenciler_pkey PRIMARY KEY (id);


--
-- Name: personeller personeller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personeller_pkey PRIMARY KEY (id);


--
-- Name: siniflar siniflar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siniflar
    ADD CONSTRAINT siniflar_pkey PRIMARY KEY (id);


--
-- Name: ulkeler ulkeler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulkeler
    ADD CONSTRAINT ulkeler_pkey PRIMARY KEY (id);


--
-- Name: fki_lnk_akademisyenler_fakulteler_fakulteno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_lnk_akademisyenler_fakulteler_fakulteno ON public.akademisyenler USING btree ("fakulteNo");


--
-- Name: akademisyenler trg_akademisyen_log; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_akademisyen_log AFTER INSERT ON public.akademisyenler FOR EACH ROW EXECUTE PROCEDURE public."akademisyenLogKaydet"();


--
-- Name: dersler trg_ders_log; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ders_log AFTER INSERT ON public.dersler FOR EACH ROW EXECUTE PROCEDURE public."dersLogKaydet"();


--
-- Name: ogrenciler trg_ogrenci_log; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ogrenci_log AFTER INSERT ON public.ogrenciler FOR EACH ROW EXECUTE PROCEDURE public."ogrenciLogKaydet"();


--
-- Name: ogrenciAlinanDers trg_yeni_ders_log; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_yeni_ders_log AFTER INSERT ON public."ogrenciAlinanDers" FOR EACH ROW EXECUTE PROCEDURE public."yeniDersLogKaydet"();


--
-- PostgreSQL database dump complete
--

