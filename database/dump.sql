--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 13.6

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
-- Name: v2; Type: SCHEMA; Schema: -; Owner: kiteiru
--

CREATE SCHEMA v2;


ALTER SCHEMA v2 OWNER TO kiteiru;

--
-- Name: engineertechnicalstafftype; Type: TYPE; Schema: v2; Owner: kiteiru
--

CREATE TYPE v2.engineertechnicalstafftype AS ENUM (
    'head',
    'technician',
    'technologiest',
    'engineer'
);


ALTER TYPE v2.engineertechnicalstafftype OWNER TO kiteiru;

--
-- Name: labourtype; Type: TYPE; Schema: v2; Owner: kiteiru
--

CREATE TYPE v2.labourtype AS ENUM (
    'brigadier',
    'bricklayer',
    'concreter',
    'finisher',
    'welder',
    'electrician',
    'driver',
    'locksmith'
);


ALTER TYPE v2.labourtype OWNER TO kiteiru;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actualDeadline; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."actualDeadline" (
    id integer NOT NULL,
    "objectId" integer NOT NULL,
    "workTypeId" integer NOT NULL,
    "actualDate" date,
    CONSTRAINT "actualDeadline_actualDate_check" CHECK ((("actualDate" > '1992-04-13'::date) AND ("actualDate" < '2022-04-13'::date)))
);


ALTER TABLE v2."actualDeadline" OWNER TO kiteiru;

--
-- Name: actualDeadline_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."actualDeadline_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."actualDeadline_id_seq" OWNER TO kiteiru;

--
-- Name: actualDeadline_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."actualDeadline_id_seq" OWNED BY v2."actualDeadline".id;


--
-- Name: actualExpenses; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."actualExpenses" (
    id integer NOT NULL,
    "objectId" integer NOT NULL,
    "materialId" integer NOT NULL,
    expenses double precision,
    CONSTRAINT "actualExpenses_expenses_check" CHECK ((expenses > (0.0)::double precision))
);


ALTER TABLE v2."actualExpenses" OWNER TO kiteiru;

--
-- Name: actualExpenses_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."actualExpenses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."actualExpenses_id_seq" OWNER TO kiteiru;

--
-- Name: actualExpenses_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."actualExpenses_id_seq" OWNED BY v2."actualExpenses".id;


--
-- Name: bridge; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.bridge (
    id integer NOT NULL,
    "spanType" character varying NOT NULL
);


ALTER TABLE v2.bridge OWNER TO kiteiru;

--
-- Name: bridge_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.bridge_id_seq OWNER TO kiteiru;

--
-- Name: bridge_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.bridge_id_seq OWNED BY v2.bridge.id;


--
-- Name: brigade; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.brigade (
    id integer NOT NULL,
    "brigadierId" integer NOT NULL
);


ALTER TABLE v2.brigade OWNER TO kiteiru;

--
-- Name: brigade_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.brigade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.brigade_id_seq OWNER TO kiteiru;

--
-- Name: brigade_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.brigade_id_seq OWNED BY v2.brigade.id;


--
-- Name: buildingType; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."buildingType" (
    id integer NOT NULL,
    "floorNum" integer NOT NULL,
    area double precision NOT NULL,
    CONSTRAINT "buildingType_area_check" CHECK ((area > (0.0)::double precision)),
    CONSTRAINT "buildingType_floorNum_check" CHECK ((("floorNum" > 0) AND ("floorNum" < 200)))
);


ALTER TABLE v2."buildingType" OWNER TO kiteiru;

--
-- Name: buildingType_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."buildingType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."buildingType_id_seq" OWNER TO kiteiru;

--
-- Name: buildingType_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."buildingType_id_seq" OWNED BY v2."buildingType".id;


--
-- Name: contract; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.contract (
    id integer NOT NULL,
    "employerId" integer NOT NULL,
    "organisationId" integer NOT NULL
);


ALTER TABLE v2.contract OWNER TO kiteiru;

--
-- Name: contract_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.contract_id_seq OWNER TO kiteiru;

--
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.contract_id_seq OWNED BY v2.contract.id;


--
-- Name: employer; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.employer (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE v2.employer OWNER TO kiteiru;

--
-- Name: employer_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.employer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.employer_id_seq OWNER TO kiteiru;

--
-- Name: employer_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.employer_id_seq OWNED BY v2.employer.id;


--
-- Name: engineerTechnicalStaff; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."engineerTechnicalStaff" (
    id integer NOT NULL,
    "engineerTechnicalStaffType" v2.engineertechnicalstafftype NOT NULL,
    "headId" integer,
    attribute character varying
);


ALTER TABLE v2."engineerTechnicalStaff" OWNER TO kiteiru;

--
-- Name: engineerTechnicalStaff_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."engineerTechnicalStaff_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."engineerTechnicalStaff_id_seq" OWNER TO kiteiru;

--
-- Name: engineerTechnicalStaff_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."engineerTechnicalStaff_id_seq" OWNED BY v2."engineerTechnicalStaff".id;


--
-- Name: equipment; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.equipment (
    id integer NOT NULL,
    number integer NOT NULL,
    type character varying NOT NULL,
    "objectId" integer NOT NULL,
    "workTypeId" integer NOT NULL,
    CONSTRAINT equipment_number_check CHECK ((number > 0))
);


ALTER TABLE v2.equipment OWNER TO kiteiru;

--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.equipment_id_seq OWNER TO kiteiru;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.equipment_id_seq OWNED BY v2.equipment.id;


--
-- Name: estimate; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.estimate (
    id integer NOT NULL,
    "objectId" integer NOT NULL,
    "materialId" integer NOT NULL,
    "materialNum" double precision NOT NULL,
    CONSTRAINT "estimate_materialNum_check" CHECK (("materialNum" > (0)::double precision))
);


ALTER TABLE v2.estimate OWNER TO kiteiru;

--
-- Name: estimate_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.estimate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.estimate_id_seq OWNER TO kiteiru;

--
-- Name: estimate_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.estimate_id_seq OWNED BY v2.estimate.id;


--
-- Name: labour; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.labour (
    id integer NOT NULL,
    "labourType" v2.labourtype NOT NULL,
    "brigadierId" integer,
    attribute character varying
);


ALTER TABLE v2.labour OWNER TO kiteiru;

--
-- Name: labour_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.labour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.labour_id_seq OWNER TO kiteiru;

--
-- Name: labour_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.labour_id_seq OWNED BY v2.labour.id;


--
-- Name: management; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.management (
    id integer NOT NULL,
    name character varying NOT NULL,
    "organisationId" integer NOT NULL
);


ALTER TABLE v2.management OWNER TO kiteiru;

--
-- Name: management_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.management_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.management_id_seq OWNER TO kiteiru;

--
-- Name: management_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.management_id_seq OWNED BY v2.management.id;


--
-- Name: material; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.material (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL,
    CONSTRAINT material_price_check CHECK ((price > (0.0)::double precision))
);


ALTER TABLE v2.material OWNER TO kiteiru;

--
-- Name: material_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.material_id_seq OWNER TO kiteiru;

--
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.material_id_seq OWNED BY v2.material.id;


--
-- Name: nonresidential; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.nonresidential (
    id integer NOT NULL
);


ALTER TABLE v2.nonresidential OWNER TO kiteiru;

--
-- Name: nonresidential_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.nonresidential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.nonresidential_id_seq OWNER TO kiteiru;

--
-- Name: nonresidential_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.nonresidential_id_seq OWNED BY v2.nonresidential.id;


--
-- Name: object; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.object (
    id integer NOT NULL,
    name character varying NOT NULL,
    "siteId" integer NOT NULL
);


ALTER TABLE v2.object OWNER TO kiteiru;

--
-- Name: object_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.object_id_seq OWNER TO kiteiru;

--
-- Name: object_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.object_id_seq OWNED BY v2.object.id;


--
-- Name: organisation; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.organisation (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE v2.organisation OWNER TO kiteiru;

--
-- Name: organisation_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.organisation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.organisation_id_seq OWNER TO kiteiru;

--
-- Name: organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.organisation_id_seq OWNED BY v2.organisation.id;


--
-- Name: pathType; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."pathType" (
    id integer NOT NULL,
    "laneNum" integer NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL,
    CONSTRAINT "pathType_laneNum_check" CHECK ((("laneNum" > 0) AND ("laneNum" < 50))),
    CONSTRAINT "pathType_length_check" CHECK ((length > (0.0)::double precision)),
    CONSTRAINT "pathType_width_check" CHECK (((width > (0.0)::double precision) AND (width < (0.1)::double precision)))
);


ALTER TABLE v2."pathType" OWNER TO kiteiru;

--
-- Name: pathType_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."pathType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."pathType_id_seq" OWNER TO kiteiru;

--
-- Name: pathType_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."pathType_id_seq" OWNED BY v2."pathType".id;


--
-- Name: residential; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.residential (
    id integer NOT NULL,
    "flatNum" integer,
    CONSTRAINT "residential_flatNum_check" CHECK (("flatNum" > 0))
);


ALTER TABLE v2.residential OWNER TO kiteiru;

--
-- Name: residential_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.residential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.residential_id_seq OWNER TO kiteiru;

--
-- Name: residential_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.residential_id_seq OWNED BY v2.residential.id;


--
-- Name: road; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.road (
    id integer NOT NULL
);


ALTER TABLE v2.road OWNER TO kiteiru;

--
-- Name: road_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.road_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.road_id_seq OWNER TO kiteiru;

--
-- Name: road_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.road_id_seq OWNED BY v2.road.id;


--
-- Name: schedule; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.schedule (
    id integer NOT NULL,
    "objectId" integer NOT NULL,
    "workTypeId" integer NOT NULL,
    deadline date NOT NULL,
    CONSTRAINT schedule_deadline_check CHECK (((deadline > '1992-04-13'::date) AND (deadline < '2022-04-13'::date)))
);


ALTER TABLE v2.schedule OWNER TO kiteiru;

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.schedule_id_seq OWNER TO kiteiru;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.schedule_id_seq OWNED BY v2.schedule.id;


--
-- Name: site; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.site (
    id integer NOT NULL,
    name character varying NOT NULL,
    "managementId" integer NOT NULL,
    "headId" integer NOT NULL
);


ALTER TABLE v2.site OWNER TO kiteiru;

--
-- Name: site_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.site_id_seq OWNER TO kiteiru;

--
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.site_id_seq OWNED BY v2.site.id;


--
-- Name: workType; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."workType" (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE v2."workType" OWNER TO kiteiru;

--
-- Name: workTypeByBrigade; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2."workTypeByBrigade" (
    "workTypeId" integer NOT NULL,
    "brigadeId" integer NOT NULL,
    "objectId" integer NOT NULL
);


ALTER TABLE v2."workTypeByBrigade" OWNER TO kiteiru;

--
-- Name: workType_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2."workType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2."workType_id_seq" OWNER TO kiteiru;

--
-- Name: workType_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2."workType_id_seq" OWNED BY v2."workType".id;


--
-- Name: worker; Type: TABLE; Schema: v2; Owner: kiteiru
--

CREATE TABLE v2.worker (
    id integer NOT NULL,
    surname character varying NOT NULL,
    name character varying NOT NULL,
    patronymic character varying
);


ALTER TABLE v2.worker OWNER TO kiteiru;

--
-- Name: worker_id_seq; Type: SEQUENCE; Schema: v2; Owner: kiteiru
--

CREATE SEQUENCE v2.worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE v2.worker_id_seq OWNER TO kiteiru;

--
-- Name: worker_id_seq; Type: SEQUENCE OWNED BY; Schema: v2; Owner: kiteiru
--

ALTER SEQUENCE v2.worker_id_seq OWNED BY v2.worker.id;


--
-- Name: actualDeadline id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualDeadline" ALTER COLUMN id SET DEFAULT nextval('v2."actualDeadline_id_seq"'::regclass);


--
-- Name: actualExpenses id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualExpenses" ALTER COLUMN id SET DEFAULT nextval('v2."actualExpenses_id_seq"'::regclass);


--
-- Name: bridge id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.bridge ALTER COLUMN id SET DEFAULT nextval('v2.bridge_id_seq'::regclass);


--
-- Name: brigade id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.brigade ALTER COLUMN id SET DEFAULT nextval('v2.brigade_id_seq'::regclass);


--
-- Name: buildingType id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."buildingType" ALTER COLUMN id SET DEFAULT nextval('v2."buildingType_id_seq"'::regclass);


--
-- Name: contract id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.contract ALTER COLUMN id SET DEFAULT nextval('v2.contract_id_seq'::regclass);


--
-- Name: employer id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.employer ALTER COLUMN id SET DEFAULT nextval('v2.employer_id_seq'::regclass);


--
-- Name: engineerTechnicalStaff id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."engineerTechnicalStaff" ALTER COLUMN id SET DEFAULT nextval('v2."engineerTechnicalStaff_id_seq"'::regclass);


--
-- Name: equipment id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.equipment ALTER COLUMN id SET DEFAULT nextval('v2.equipment_id_seq'::regclass);


--
-- Name: estimate id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.estimate ALTER COLUMN id SET DEFAULT nextval('v2.estimate_id_seq'::regclass);


--
-- Name: labour id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.labour ALTER COLUMN id SET DEFAULT nextval('v2.labour_id_seq'::regclass);


--
-- Name: management id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.management ALTER COLUMN id SET DEFAULT nextval('v2.management_id_seq'::regclass);


--
-- Name: material id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.material ALTER COLUMN id SET DEFAULT nextval('v2.material_id_seq'::regclass);


--
-- Name: nonresidential id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.nonresidential ALTER COLUMN id SET DEFAULT nextval('v2.nonresidential_id_seq'::regclass);


--
-- Name: object id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.object ALTER COLUMN id SET DEFAULT nextval('v2.object_id_seq'::regclass);


--
-- Name: organisation id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.organisation ALTER COLUMN id SET DEFAULT nextval('v2.organisation_id_seq'::regclass);


--
-- Name: pathType id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."pathType" ALTER COLUMN id SET DEFAULT nextval('v2."pathType_id_seq"'::regclass);


--
-- Name: residential id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.residential ALTER COLUMN id SET DEFAULT nextval('v2.residential_id_seq'::regclass);


--
-- Name: road id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.road ALTER COLUMN id SET DEFAULT nextval('v2.road_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.schedule ALTER COLUMN id SET DEFAULT nextval('v2.schedule_id_seq'::regclass);


--
-- Name: site id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.site ALTER COLUMN id SET DEFAULT nextval('v2.site_id_seq'::regclass);


--
-- Name: workType id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workType" ALTER COLUMN id SET DEFAULT nextval('v2."workType_id_seq"'::regclass);


--
-- Name: worker id; Type: DEFAULT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.worker ALTER COLUMN id SET DEFAULT nextval('v2.worker_id_seq'::regclass);


--
-- Data for Name: actualDeadline; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (1, 1, 2, '2010-07-29');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (2, 1, 9, '2010-04-01');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (3, 1, 3, '2010-06-10');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (4, 2, 3, '2018-07-05');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (5, 2, 5, '2019-06-30');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (6, 3, 1, '2001-05-25');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (7, 3, 2, '2001-10-13');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (8, 3, 9, '2001-02-07');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (9, 4, 4, '2016-09-10');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (10, 4, 6, '2016-05-08');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (11, 4, 8, '2016-09-07');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (12, 5, 7, '2020-04-08');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (13, 6, 5, '2015-07-11');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (14, 6, 4, '2015-08-19');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (15, 7, 7, '2004-04-10');
INSERT INTO v2."actualDeadline" (id, "objectId", "workTypeId", "actualDate") VALUES (16, 7, 3, '2004-09-07');


--
-- Data for Name: actualExpenses; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (1, 1, 1, 18425000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (2, 1, 2, 7259000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (3, 1, 5, 42000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (4, 1, 7, 16052000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (5, 1, 9, 8170000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (6, 1, 10, 26700);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (7, 2, 1, 9163400);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (8, 2, 2, 4509000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (9, 2, 5, 21900);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (10, 2, 7, 4532000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (11, 2, 11, 21000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (12, 2, 12, 9110);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (13, 2, 14, 169500);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (14, 3, 1, 15644000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (15, 3, 2, 5980000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (16, 3, 5, 29500);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (17, 3, 7, 13597000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (18, 3, 9, 6449000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (19, 3, 11, 15100);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (20, 4, 6, 7150);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (21, 4, 13, 7436800);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (22, 5, 3, 12100);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (23, 5, 4, 1400);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (24, 5, 5, 19000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (25, 5, 6, 2390);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (26, 5, 7, 1135000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (27, 5, 15, 29100);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (28, 6, 1, 1167500);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (29, 6, 8, 3100000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (30, 6, 11, 15200);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (31, 6, 12, 5610);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (32, 7, 1, 14819000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (33, 7, 2, 2001000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (34, 7, 7, 3900000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (35, 7, 9, 2980000);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (36, 7, 10, 225150);
INSERT INTO v2."actualExpenses" (id, "objectId", "materialId", expenses) VALUES (37, 7, 12, 5700);


--
-- Data for Name: bridge; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.bridge (id, "spanType") VALUES (4, 'Box-section beam');


--
-- Data for Name: brigade; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.brigade (id, "brigadierId") VALUES (1, 16);
INSERT INTO v2.brigade (id, "brigadierId") VALUES (2, 20);
INSERT INTO v2.brigade (id, "brigadierId") VALUES (3, 23);


--
-- Data for Name: buildingType; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."buildingType" (id, "floorNum", area) VALUES (1, 11, 7500);
INSERT INTO v2."buildingType" (id, "floorNum", area) VALUES (2, 5, 2500);
INSERT INTO v2."buildingType" (id, "floorNum", area) VALUES (3, 9, 9000);
INSERT INTO v2."buildingType" (id, "floorNum", area) VALUES (6, 1, 100);
INSERT INTO v2."buildingType" (id, "floorNum", area) VALUES (7, 4, 4000);


--
-- Data for Name: contract; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.contract (id, "employerId", "organisationId") VALUES (1, 1, 2);
INSERT INTO v2.contract (id, "employerId", "organisationId") VALUES (2, 1, 4);
INSERT INTO v2.contract (id, "employerId", "organisationId") VALUES (3, 2, 3);
INSERT INTO v2.contract (id, "employerId", "organisationId") VALUES (4, 3, 1);


--
-- Data for Name: employer; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.employer (id, name, type) VALUES (1, 'Novosibirsk City Administration', 'City Administration');
INSERT INTO v2.employer (id, name, type) VALUES (2, 'Ministry Of Transport', 'Ministry');
INSERT INTO v2.employer (id, name, type) VALUES (3, 'United Coffee House', 'Private Firm');


--
-- Data for Name: engineerTechnicalStaff; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (4, 'technologiest', 2, 'I category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (5, 'head', NULL, 'Previous position: technologiest');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (2, 'head', NULL, 'Previous position: engineer');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (7, 'head', NULL, 'Previous position: engineer');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (17, 'engineer', 5, 'II category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (15, 'technician', 5, 'I category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (9, 'engineer', 7, 'I category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (12, 'head', NULL, 'Previous position: technician');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (13, 'technologiest', 7, 'II category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (1, 'technician', 2, 'I category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (22, 'engineer', 12, 'II category');
INSERT INTO v2."engineerTechnicalStaff" (id, "engineerTechnicalStaffType", "headId", attribute) VALUES (10, 'engineer', 2, 'I category');


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (1, 3, 'Bulldozer', 1, 2);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (2, 1, 'Lifting crane', 2, 3);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (3, 2, 'Lifting crane', 4, 6);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (4, 5, 'Truck', 7, 7);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (5, 2, 'Bulldozer', 3, 1);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (6, 1, 'Bulldozer', 3, 2);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (7, 1, 'Lifting crane', 7, 3);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (8, 1, 'Truck', 5, 7);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (9, 3, 'Excavator', 3, 9);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (10, 4, 'Excavator', 1, 9);
INSERT INTO v2.equipment (id, number, type, "objectId", "workTypeId") VALUES (11, 1, 'Lifting crane', 3, 3);


--
-- Data for Name: estimate; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (1, 1, 1, 2400);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (2, 1, 2, 1450);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (3, 1, 5, 800);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (4, 1, 7, 2500);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (5, 1, 9, 352);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (6, 1, 10, 4);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (7, 2, 1, 1200);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (8, 2, 2, 900);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (9, 2, 5, 500);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (10, 2, 7, 700);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (11, 2, 11, 3);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (12, 2, 12, 0.5);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (13, 2, 14, 450);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (14, 3, 1, 2000);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (15, 3, 2, 1200);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (16, 3, 5, 600);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (17, 3, 7, 2100);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (18, 3, 9, 258);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (19, 3, 11, 2);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (20, 4, 6, 5);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (21, 4, 13, 67);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (22, 5, 3, 3);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (23, 5, 4, 1);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (24, 5, 5, 300);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (25, 5, 6, 2);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (26, 5, 7, 180);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (27, 5, 15, 30);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (28, 6, 1, 150);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (29, 6, 8, 500);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (30, 6, 11, 2);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (31, 6, 12, 0.3);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (32, 7, 1, 1900);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (33, 7, 2, 400);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (34, 7, 7, 600);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (35, 7, 9, 120);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (36, 7, 10, 45);
INSERT INTO v2.estimate (id, "objectId", "materialId", "materialNum") VALUES (37, 7, 12, 0.3);


--
-- Data for Name: labour; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (21, 'locksmith', 23, '5 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (6, 'concreter', 16, '5 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (14, 'welder', 20, '5 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (23, 'brigadier', NULL, 'Previous position: concreter');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (20, 'brigadier', NULL, 'Previous position: locksmith');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (16, 'brigadier', NULL, 'Previous position: electrician');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (8, 'concreter', 16, '4 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (18, 'electrician', 23, '5 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (3, 'bricklayer', 16, '3 level');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (19, 'driver', 20, 'C, C1, BE, CE, C1E driving license categories');
INSERT INTO v2.labour (id, "labourType", "brigadierId", attribute) VALUES (11, 'finisher', 23, '4 level');


--
-- Data for Name: management; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.management (id, name, "organisationId") VALUES (1, 'Novosibirsk City Buildings Management', 2);
INSERT INTO v2.management (id, name, "organisationId") VALUES (2, 'Rail Tracks Management', 3);
INSERT INTO v2.management (id, name, "organisationId") VALUES (3, 'Blossom Management', 1);
INSERT INTO v2.management (id, name, "organisationId") VALUES (4, 'Eurika Management', 4);


--
-- Data for Name: material; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.material (id, name, price) VALUES (1, 'Cement Concrete (m^3)', 7800);
INSERT INTO v2.material (id, name, price) VALUES (2, 'Red Brick (tonne)', 5000);
INSERT INTO v2.material (id, name, price) VALUES (3, 'Soil (tonne)', 4000);
INSERT INTO v2.material (id, name, price) VALUES (4, 'Sand (tonne)', 1000);
INSERT INTO v2.material (id, name, price) VALUES (5, 'Geogrid (m^2)', 50);
INSERT INTO v2.material (id, name, price) VALUES (6, 'Crashed Stone (tonne)', 1400);
INSERT INTO v2.material (id, name, price) VALUES (7, 'Road Concrete (m^3)', 6500);
INSERT INTO v2.material (id, name, price) VALUES (8, 'Glass Showcase (kg)', 6200);
INSERT INTO v2.material (id, name, price) VALUES (9, 'Plastic Window (pcs.)', 25000);
INSERT INTO v2.material (id, name, price) VALUES (10, 'Wooden Door (pcs.)', 5000);
INSERT INTO v2.material (id, name, price) VALUES (11, 'Glass Door (pcs.)', 7600);
INSERT INTO v2.material (id, name, price) VALUES (12, 'Wooden Boards (tonne)', 19000);
INSERT INTO v2.material (id, name, price) VALUES (13, 'Iron Rails (tonne)', 111000);
INSERT INTO v2.material (id, name, price) VALUES (14, 'Shingles (m^2)', 350);
INSERT INTO v2.material (id, name, price) VALUES (15, 'Iron Fence (m^2)', 1000);


--
-- Data for Name: nonresidential; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.nonresidential (id) VALUES (2);
INSERT INTO v2.nonresidential (id) VALUES (6);
INSERT INTO v2.nonresidential (id) VALUES (7);


--
-- Data for Name: object; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.object (id, name, "siteId") VALUES (1, 'House №17', 3);
INSERT INTO v2.object (id, name, "siteId") VALUES (2, 'The Surikov Lyceum №3', 5);
INSERT INTO v2.object (id, name, "siteId") VALUES (3, 'House №4', 3);
INSERT INTO v2.object (id, name, "siteId") VALUES (4, 'Bridge R-255', 2);
INSERT INTO v2.object (id, name, "siteId") VALUES (5, 'Parking Area', 4);
INSERT INTO v2.object (id, name, "siteId") VALUES (6, 'Cafe Building', 4);
INSERT INTO v2.object (id, name, "siteId") VALUES (7, 'College Main Building', 5);


--
-- Data for Name: organisation; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.organisation (id, name) VALUES (1, 'New Industry');
INSERT INTO v2.organisation (id, name) VALUES (2, 'Novosibirsk Architecture');
INSERT INTO v2.organisation (id, name) VALUES (3, 'Ways And Paths');
INSERT INTO v2.organisation (id, name) VALUES (4, 'Syberian Buildings');


--
-- Data for Name: pathType; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."pathType" (id, "laneNum", width, length) VALUES (4, 2, 0.03, 0.5);
INSERT INTO v2."pathType" (id, "laneNum", width, length) VALUES (5, 1, 0.005, 0.06);


--
-- Data for Name: residential; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.residential (id, "flatNum") VALUES (1, 99);
INSERT INTO v2.residential (id, "flatNum") VALUES (3, 135);


--
-- Data for Name: road; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.road (id) VALUES (5);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (1, 1, 2, '2010-08-12');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (2, 1, 9, '2010-04-07');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (3, 1, 3, '2010-06-25');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (4, 2, 3, '2018-07-02');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (5, 2, 5, '2019-07-07');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (6, 3, 1, '2001-05-29');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (7, 3, 2, '2001-10-18');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (8, 3, 9, '2001-02-08');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (9, 4, 4, '2016-09-02');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (10, 4, 6, '2016-05-12');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (11, 4, 8, '2016-09-09');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (12, 5, 7, '2020-04-10');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (13, 6, 5, '2015-07-09');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (14, 6, 4, '2015-08-22');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (15, 7, 7, '2004-04-17');
INSERT INTO v2.schedule (id, "objectId", "workTypeId", deadline) VALUES (16, 7, 3, '2004-08-31');


--
-- Data for Name: site; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.site (id, name, "managementId", "headId") VALUES (2, 'Railway "Novosibirsk-Tomsk"', 2, 12);
INSERT INTO v2.site (id, name, "managementId", "headId") VALUES (3, 'Apartment Complex "Nature"', 4, 7);
INSERT INTO v2.site (id, name, "managementId", "headId") VALUES (4, 'Cafe "Coffee Academy"', 3, 5);
INSERT INTO v2.site (id, name, "managementId", "headId") VALUES (5, 'The Surikov Art College', 1, 2);


--
-- Data for Name: workType; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."workType" (id, name) VALUES (1, 'Foundation laying');
INSERT INTO v2."workType" (id, name) VALUES (2, 'Water supply laying');
INSERT INTO v2."workType" (id, name) VALUES (3, 'Bricks laying');
INSERT INTO v2."workType" (id, name) VALUES (4, 'Wiring laying');
INSERT INTO v2."workType" (id, name) VALUES (5, 'Window/door installation');
INSERT INTO v2."workType" (id, name) VALUES (6, 'Rails welding');
INSERT INTO v2."workType" (id, name) VALUES (7, 'Materials carrying');
INSERT INTO v2."workType" (id, name) VALUES (8, 'Equipment maintence');
INSERT INTO v2."workType" (id, name) VALUES (9, 'Digging');


--
-- Data for Name: workTypeByBrigade; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (2, 3, 1);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (3, 1, 2);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (4, 3, 4);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (5, 3, 6);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (6, 2, 4);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (7, 2, 7);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (8, 2, 4);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (1, 1, 3);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (2, 3, 3);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (3, 1, 7);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (4, 3, 6);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (5, 3, 2);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (7, 2, 5);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (9, 1, 3);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (9, 1, 1);
INSERT INTO v2."workTypeByBrigade" ("workTypeId", "brigadeId", "objectId") VALUES (3, 1, 1);


--
-- Data for Name: worker; Type: TABLE DATA; Schema: v2; Owner: kiteiru
--

INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (1, 'Nikulin', 'Fyodor', 'Yakovlevich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (2, 'Romashkovna', 'Marina', 'Romanovna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (3, 'Zolotov', 'Anton', 'Alexandrovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (4, 'Kim', 'Katerina', 'Igorevna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (5, 'Rubel', 'Vasilisa', 'Valeryevna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (6, 'Plankov', 'Stepan', 'Nikolaevich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (7, 'Kazakov', 'Artemiy', NULL);
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (8, 'Ponomaryov', 'Lev', 'Pavlovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (9, 'Vinogradov', 'Maxim', 'Dmitrievich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (10, 'Fomchenko', 'Michail', 'Daniilovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (11, 'Dolgov', 'Vladlen', 'Nikolaevich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (12, 'Yerin', 'Kirill', 'Grigoryevich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (13, 'Pchyolkina', 'Elizaveta', 'Nikolaevna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (14, 'Kravchenko', 'Darya', 'Artyomovna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (15, 'Polozov', 'Nikita', 'Kirillovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (16, 'Tomova', 'Tatyana', NULL);
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (17, 'Frendlich', 'Pyotr', 'Fyodorovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (18, 'Yudin', 'Alexandr', 'Vladimirovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (19, 'Kolenko', 'Evgeniya', 'Pavlovna');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (20, 'Azimov', 'Artyom', 'Vladislavovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (21, 'Bern', 'Ivan', NULL);
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (22, 'Micholenko', 'Stepan', 'Maximovich');
INSERT INTO v2.worker (id, surname, name, patronymic) VALUES (23, 'Dyomina', 'Alisa', 'Konstantinovna');


--
-- Name: actualDeadline_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."actualDeadline_id_seq"', 16, true);


--
-- Name: actualExpenses_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."actualExpenses_id_seq"', 37, true);


--
-- Name: bridge_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.bridge_id_seq', 1, false);


--
-- Name: brigade_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.brigade_id_seq', 3, true);


--
-- Name: buildingType_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."buildingType_id_seq"', 1, false);


--
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.contract_id_seq', 4, true);


--
-- Name: employer_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.employer_id_seq', 3, true);


--
-- Name: engineerTechnicalStaff_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."engineerTechnicalStaff_id_seq"', 1, false);


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.equipment_id_seq', 11, true);


--
-- Name: estimate_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.estimate_id_seq', 37, true);


--
-- Name: labour_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.labour_id_seq', 1, false);


--
-- Name: management_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.management_id_seq', 4, true);


--
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.material_id_seq', 15, true);


--
-- Name: nonresidential_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.nonresidential_id_seq', 1, false);


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.object_id_seq', 7, true);


--
-- Name: organisation_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.organisation_id_seq', 4, true);


--
-- Name: pathType_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."pathType_id_seq"', 1, false);


--
-- Name: residential_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.residential_id_seq', 1, false);


--
-- Name: road_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.road_id_seq', 1, false);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.schedule_id_seq', 16, true);


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.site_id_seq', 5, true);


--
-- Name: workType_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2."workType_id_seq"', 9, true);


--
-- Name: worker_id_seq; Type: SEQUENCE SET; Schema: v2; Owner: kiteiru
--

SELECT pg_catalog.setval('v2.worker_id_seq', 23, true);


--
-- Name: actualDeadline actualDeadline_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualDeadline"
    ADD CONSTRAINT "actualDeadline_pkey" PRIMARY KEY (id);


--
-- Name: actualExpenses actualExpenses_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualExpenses"
    ADD CONSTRAINT "actualExpenses_pkey" PRIMARY KEY (id);


--
-- Name: bridge bridge_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.bridge
    ADD CONSTRAINT bridge_pkey PRIMARY KEY (id);


--
-- Name: brigade brigade_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.brigade
    ADD CONSTRAINT brigade_pkey PRIMARY KEY (id);


--
-- Name: buildingType buildingType_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."buildingType"
    ADD CONSTRAINT "buildingType_pkey" PRIMARY KEY (id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: employer employer_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.employer
    ADD CONSTRAINT employer_name_key UNIQUE (name);


--
-- Name: employer employer_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.employer
    ADD CONSTRAINT employer_pkey PRIMARY KEY (id);


--
-- Name: engineerTechnicalStaff engineerTechnicalStaff_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."engineerTechnicalStaff"
    ADD CONSTRAINT "engineerTechnicalStaff_pkey" PRIMARY KEY (id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: estimate estimate_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.estimate
    ADD CONSTRAINT estimate_pkey PRIMARY KEY (id);


--
-- Name: labour labour_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.labour
    ADD CONSTRAINT labour_pkey PRIMARY KEY (id);


--
-- Name: management management_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.management
    ADD CONSTRAINT management_name_key UNIQUE (name);


--
-- Name: management management_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.management
    ADD CONSTRAINT management_pkey PRIMARY KEY (id);


--
-- Name: material material_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.material
    ADD CONSTRAINT material_name_key UNIQUE (name);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: nonresidential nonresidential_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.nonresidential
    ADD CONSTRAINT nonresidential_pkey PRIMARY KEY (id);


--
-- Name: object object_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: organisation organisation_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.organisation
    ADD CONSTRAINT organisation_name_key UNIQUE (name);


--
-- Name: organisation organisation_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.organisation
    ADD CONSTRAINT organisation_pkey PRIMARY KEY (id);


--
-- Name: pathType pathType_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."pathType"
    ADD CONSTRAINT "pathType_pkey" PRIMARY KEY (id);


--
-- Name: residential residential_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.residential
    ADD CONSTRAINT residential_pkey PRIMARY KEY (id);


--
-- Name: road road_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.road
    ADD CONSTRAINT road_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: site site_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.site
    ADD CONSTRAINT site_name_key UNIQUE (name);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: workType workType_name_key; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workType"
    ADD CONSTRAINT "workType_name_key" UNIQUE (name);


--
-- Name: workType workType_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workType"
    ADD CONSTRAINT "workType_pkey" PRIMARY KEY (id);


--
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- Name: actualDeadline actualDeadline_objectId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualDeadline"
    ADD CONSTRAINT "actualDeadline_objectId_fkey" FOREIGN KEY ("objectId") REFERENCES v2.object(id);


--
-- Name: actualDeadline actualDeadline_workTypeId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualDeadline"
    ADD CONSTRAINT "actualDeadline_workTypeId_fkey" FOREIGN KEY ("workTypeId") REFERENCES v2."workType"(id);


--
-- Name: actualExpenses actualExpenses_materialId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualExpenses"
    ADD CONSTRAINT "actualExpenses_materialId_fkey" FOREIGN KEY ("materialId") REFERENCES v2.material(id);


--
-- Name: actualExpenses actualExpenses_objectId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."actualExpenses"
    ADD CONSTRAINT "actualExpenses_objectId_fkey" FOREIGN KEY ("objectId") REFERENCES v2.object(id);


--
-- Name: bridge bridge_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.bridge
    ADD CONSTRAINT bridge_id_fkey FOREIGN KEY (id) REFERENCES v2."pathType"(id);


--
-- Name: brigade brigade_brigadierId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.brigade
    ADD CONSTRAINT "brigade_brigadierId_fkey" FOREIGN KEY ("brigadierId") REFERENCES v2.labour(id);


--
-- Name: buildingType buildingType_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."buildingType"
    ADD CONSTRAINT "buildingType_id_fkey" FOREIGN KEY (id) REFERENCES v2.object(id);


--
-- Name: contract contract_employerId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.contract
    ADD CONSTRAINT "contract_employerId_fkey" FOREIGN KEY ("employerId") REFERENCES v2.employer(id);


--
-- Name: contract contract_organisationId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.contract
    ADD CONSTRAINT "contract_organisationId_fkey" FOREIGN KEY ("organisationId") REFERENCES v2.organisation(id);


--
-- Name: engineerTechnicalStaff engineerTechnicalStaff_headId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."engineerTechnicalStaff"
    ADD CONSTRAINT "engineerTechnicalStaff_headId_fkey" FOREIGN KEY ("headId") REFERENCES v2."engineerTechnicalStaff"(id);


--
-- Name: engineerTechnicalStaff engineerTechnicalStaff_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."engineerTechnicalStaff"
    ADD CONSTRAINT "engineerTechnicalStaff_id_fkey" FOREIGN KEY (id) REFERENCES v2.worker(id);


--
-- Name: equipment equipment_objectId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.equipment
    ADD CONSTRAINT "equipment_objectId_fkey" FOREIGN KEY ("objectId") REFERENCES v2.object(id);


--
-- Name: equipment equipment_workTypeId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.equipment
    ADD CONSTRAINT "equipment_workTypeId_fkey" FOREIGN KEY ("workTypeId") REFERENCES v2."workType"(id);


--
-- Name: labour labour_brigadierId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.labour
    ADD CONSTRAINT "labour_brigadierId_fkey" FOREIGN KEY ("brigadierId") REFERENCES v2.labour(id);


--
-- Name: labour labour_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.labour
    ADD CONSTRAINT labour_id_fkey FOREIGN KEY (id) REFERENCES v2.worker(id);


--
-- Name: management management_organisationId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.management
    ADD CONSTRAINT "management_organisationId_fkey" FOREIGN KEY ("organisationId") REFERENCES v2.organisation(id);


--
-- Name: nonresidential nonresidential_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.nonresidential
    ADD CONSTRAINT nonresidential_id_fkey FOREIGN KEY (id) REFERENCES v2."buildingType"(id);


--
-- Name: object object_siteId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.object
    ADD CONSTRAINT "object_siteId_fkey" FOREIGN KEY ("siteId") REFERENCES v2.site(id);


--
-- Name: pathType pathType_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."pathType"
    ADD CONSTRAINT "pathType_id_fkey" FOREIGN KEY (id) REFERENCES v2.object(id);


--
-- Name: residential residential_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.residential
    ADD CONSTRAINT residential_id_fkey FOREIGN KEY (id) REFERENCES v2."buildingType"(id);


--
-- Name: road road_id_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.road
    ADD CONSTRAINT road_id_fkey FOREIGN KEY (id) REFERENCES v2."pathType"(id);


--
-- Name: schedule schedule_objectId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.schedule
    ADD CONSTRAINT "schedule_objectId_fkey" FOREIGN KEY ("objectId") REFERENCES v2.object(id);


--
-- Name: schedule schedule_workTypeId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.schedule
    ADD CONSTRAINT "schedule_workTypeId_fkey" FOREIGN KEY ("workTypeId") REFERENCES v2."workType"(id);


--
-- Name: site site_headId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.site
    ADD CONSTRAINT "site_headId_fkey" FOREIGN KEY ("headId") REFERENCES v2."engineerTechnicalStaff"(id);


--
-- Name: site site_managementId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2.site
    ADD CONSTRAINT "site_managementId_fkey" FOREIGN KEY ("managementId") REFERENCES v2.management(id);


--
-- Name: workTypeByBrigade workTypeByBrigade_brigadeId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workTypeByBrigade"
    ADD CONSTRAINT "workTypeByBrigade_brigadeId_fkey" FOREIGN KEY ("brigadeId") REFERENCES v2.brigade(id);


--
-- Name: workTypeByBrigade workTypeByBrigade_objectId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workTypeByBrigade"
    ADD CONSTRAINT "workTypeByBrigade_objectId_fkey" FOREIGN KEY ("objectId") REFERENCES v2.object(id);


--
-- Name: workTypeByBrigade workTypeByBrigade_workTypeId_fkey; Type: FK CONSTRAINT; Schema: v2; Owner: kiteiru
--

ALTER TABLE ONLY v2."workTypeByBrigade"
    ADD CONSTRAINT "workTypeByBrigade_workTypeId_fkey" FOREIGN KEY ("workTypeId") REFERENCES v2."workType"(id);


--
-- PostgreSQL database dump complete
--

