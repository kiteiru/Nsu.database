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
-- Name: v3; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA v3;


--
-- Name: engineer_tech_staff_type; Type: TYPE; Schema: v3; Owner: -
--

CREATE TYPE v3.engineer_tech_staff_type AS ENUM (
    'head',
    'technician',
    'technologiest',
    'engineer'
);


--
-- Name: labour_type; Type: TYPE; Schema: v3; Owner: -
--

CREATE TYPE v3.labour_type AS ENUM (
    'brigadier',
    'bricklayer',
    'concreter',
    'finisher',
    'welder',
    'electrician',
    'driver',
    'locksmith'
);


--
-- Name: get_brigade_worker_list(character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_brigade_worker_list(objectlist character varying[]) RETURNS TABLE(objectname character varying, brigadeid integer, surname character varying, name character varying, patronymic character varying, labourtype v3.labour_type)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT o.name,
               b.id,
               w.surname,
               w.name,
               w.patronymic,
               l.labour_type
        FROM object AS o
                 INNER JOIN work_type_by_brigade AS wTbB ON o.id = wTbB.object_id
                 INNER JOIN brigade AS b on wTbB.brigade_id = b.id
                 INNER JOIN labour l on b.id = l.brigade_id
                 INNER JOIN worker w on l.id = w.id
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0);
END;
$$;


--
-- Name: get_end_date(anyarray); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_end_date(anyarray) RETURNS anyelement
    LANGUAGE sql
    AS $_$
SELECT max(elements)
FROM unnest($1) elements
$_$;


--
-- Name: get_engineer_tech_workers(integer); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_engineer_tech_workers(site_id_param integer) RETURNS TABLE(management_name character varying, site_name character varying, worker_surname character varying, worker_name character varying, worker_patronymic character varying, engineer_tech_staff_type v3.engineer_tech_staff_type)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT m.name,
               s.name,
               w.surname,
               w.name,
               w.patronymic,
               e.engineer_tech_staff_type
        FROM management AS m
                 INNER JOIN site AS s ON m.id = s.management_id
                 INNER JOIN engineer_tech_staff AS e ON s.head_id = e.head_id OR s.head_id = e.id
                 INNER JOIN worker AS w ON e.id = w.id
        WHERE (site_id_param IS NOT NULL AND s.id = site_id_param OR site_id_param IS NULL);
END;
$$;


--
-- Name: get_equipment_per_management_list(character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_equipment_per_management_list(managementlist character varying[]) RETURNS TABLE(equipmenttype character varying, equipmentnum integer, objectname character varying, managementname character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT e.type,
               e.num,
               o.name,
               m.name
        FROM management AS m
                 INNER JOIN site AS s ON s.management_id = m.id
                 INNER JOIN object AS o ON o.site_id = s.id
                 INNER JOIN equipment AS e ON e.object_id = o.id
        WHERE ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0);
END;
$$;


--
-- Name: get_equipment_per_object_list(integer, date, date); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_equipment_per_object_list(object_id_param integer, start_date date, end_date date) RETURNS TABLE(equipmenttype character varying, equipmentnum integer, objectname character varying, actualdate date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT e.type,
               e.num,
               o.name,
               sch.actual_date
        FROM management AS m
                 INNER JOIN site AS s ON s.management_id = m.id
                 INNER JOIN object AS o ON o.site_id = s.id
                 INNER JOIN equipment AS e ON e.object_id = o.id
                 INNER JOIN schedule AS sch ON o.id = sch.object_id
        WHERE (object_id_param IS NOT NULL AND o.id = object_id_param OR object_id_param IS NULL)
        AND ((start_date IS NOT NULL AND end_date IS NOT NULL AND sch.actual_date BETWEEN start_date AND end_date)
            OR (start_date IS NOT NULL AND end_date IS NULL AND sch.actual_date >= start_date)
            OR (start_date IS NULL AND end_date IS NOT NULL AND sch.actual_date <= end_date)
            OR (start_date IS NULL AND end_date IS NULL));
END;
$$;


--
-- Name: get_management_list(); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_management_list() RETURNS TABLE(management_name character varying, site_name character varying, head_surname character varying, head_name character varying, head_patronymic character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT m.name,
               s.name,
               w.surname,
               w.name,
               w.patronymic
        FROM management AS m
                 INNER JOIN site AS s ON m.id = s.management_id
                 INNER JOIN worker AS w ON s.head_id = w.id;
END;
$$;


--
-- Name: get_objects_work_type_in_period(character varying[], character varying[], date[], character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_objects_work_type_in_period(managementlist character varying[], organisationlist character varying[], datelist date[], worktypelist character varying[]) RETURNS TABLE(organisationname character varying, managementname character varying, objectname character varying, worktype character varying, actualdate date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT org.name,
               m.name,
               o.name,
               wT.name,
               sch.actual_date
        FROM organisation AS org
                 INNER JOIN management AS m ON m.organisation_id = org.id
                 INNER JOIN site AS s ON s.management_id = m.id
                 INNER JOIN object AS o ON o.site_id = s.id
                 INNER JOIN schedule AS sch ON o.id = sch.object_id
                 INNER JOIN work_type AS wT ON sch.work_type_id = wT.id
        WHERE ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0)
          AND ((cardinality(organisationList) != 0 AND org.name = ANY (organisationList)) OR
               cardinality(organisationList) = 0)
          AND ((cardinality(dateList) != 0 AND
                sch.actual_date BETWEEN get_start_date(dateList) AND get_end_date(dateList)) OR cardinality(dateList) = 0)
          AND ((cardinality(workTypeList) != 0 AND wT.name = ANY (workTypeList)) OR cardinality(workTypeList) = 0);
END;
$$;


--
-- Name: get_report_per_object(character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_report_per_object(objectlist character varying[]) RETURNS TABLE(objectname character varying, worktypename character varying, actualdate date, materialandactualexpenses text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT o.name,
               wT.name,
               sch.actual_date,
               string_agg(concat_ws(': ', m.name, e.expenses), ', ')
        FROM object AS o
                 INNER JOIN schedule AS sch ON sch.object_id = o.id
                 INNER JOIN work_type AS wT ON sch.work_type_id = wT.id
                 INNER JOIN estimate AS e ON e.object_id = o.id
                 INNER JOIN material AS m ON m.id = e.material_id
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        GROUP BY o.name, wT.name, sch.actual_date
        ORDER BY o.name;
END;
$$;


--
-- Name: get_schedule_and_estimate_per_object(character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_schedule_and_estimate_per_object(objectlist character varying[]) RETURNS TABLE(objectname character varying, deadline date, worktype character varying, materialnameandnum text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT o.name,
               sch.deadline,
               wT.name,
               string_agg(concat_ws(': ', m.name, e.material_num), ', ')
        FROM object AS o
                 INNER JOIN schedule AS sch ON sch.object_id = o.id
                 INNER JOIN work_type AS wT ON sch.work_type_id = wT.id
                 INNER JOIN estimate AS e ON o.id = e.object_id
                 INNER JOIN material AS m ON e.material_id = m.id
        WHERE ((cardinality(objectList) != 0 AND o.name = ANY (objectList)) OR cardinality(objectList) = 0)
        GROUP BY o.name, sch.deadline, wT.name
        ORDER BY o.name;
END;
$$;


--
-- Name: get_start_date(anyarray); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_start_date(anyarray) RETURNS anyelement
    LANGUAGE sql
    AS $_$
SELECT min(elements)
FROM unnest($1) elements
$_$;


--
-- Name: get_work_type_over_deadline(character varying[], character varying[], character varying[]); Type: FUNCTION; Schema: v3; Owner: -
--

CREATE FUNCTION v3.get_work_type_over_deadline(sitelist character varying[], managementlist character varying[], organisationlist character varying[]) RETURNS TABLE(organisationname character varying, managementname character varying, sitename character varying, objectname character varying, worktypename character varying, deadline date, actualdate date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
        SELECT org.name,
               m.name,
               s.name,
               o.name,
               wT.name,
               sch.deadline,
               sch.actual_date
        FROM organisation AS org
                 INNER JOIN management AS m ON m.organisation_id = org.id
                 INNER JOIN site AS s ON s.management_id = m.id
                 INNER JOIN object AS o ON o.site_id = s.id
                 INNER JOIN schedule AS sch ON sch.object_id = o.id
                 INNER JOIN work_type AS wT ON sch.work_type_id = wT.id
        WHERE ((cardinality(siteList) != 0 AND s.name = ANY (siteList)) OR cardinality(siteList) = 0)
          AND ((cardinality(managementList) != 0 AND m.name = ANY (managementList)) OR cardinality(managementList) = 0)
          AND ((cardinality(organisationList) != 0 AND org.name = ANY (organisationList)) OR
               cardinality(organisationList) = 0)
          AND sch.deadline < sch.actual_date;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bridge; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.bridge (
    id integer NOT NULL,
    span_type character varying NOT NULL
);


--
-- Name: bridge_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.bridge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bridge_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.bridge_id_seq OWNED BY v3.bridge.id;


--
-- Name: brigade; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.brigade (
    id integer NOT NULL,
    brigadier_id integer
);


--
-- Name: brigade_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.brigade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brigade_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.brigade_id_seq OWNED BY v3.brigade.id;


--
-- Name: building_type; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.building_type (
    id integer NOT NULL,
    floor_num integer NOT NULL,
    area double precision NOT NULL
);


--
-- Name: building_type_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.building_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_type_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.building_type_id_seq OWNED BY v3.building_type.id;


--
-- Name: contract; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.contract (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: contract_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contract_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.contract_id_seq OWNED BY v3.contract.id;


--
-- Name: employer; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.employer (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);


--
-- Name: employer_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.employer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employer_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.employer_id_seq OWNED BY v3.employer.id;


--
-- Name: engineer_tech_staff; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.engineer_tech_staff (
    id integer NOT NULL,
    engineer_tech_staff_type v3.engineer_tech_staff_type NOT NULL,
    head_id integer,
    attribute character varying
);


--
-- Name: engineer_tech_staff_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.engineer_tech_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: engineer_tech_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.engineer_tech_staff_id_seq OWNED BY v3.engineer_tech_staff.id;


--
-- Name: equipment; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.equipment (
    id integer NOT NULL,
    num integer NOT NULL,
    type character varying NOT NULL,
    object_id integer NOT NULL,
    work_type_id integer NOT NULL
);


--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.equipment_id_seq OWNED BY v3.equipment.id;


--
-- Name: estimate; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.estimate (
    id integer NOT NULL,
    object_id integer NOT NULL,
    material_id integer NOT NULL,
    material_num double precision NOT NULL,
    expenses double precision
);


--
-- Name: estimate_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.estimate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estimate_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.estimate_id_seq OWNED BY v3.estimate.id;


--
-- Name: labour; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.labour (
    id integer NOT NULL,
    labour_type v3.labour_type NOT NULL,
    brigade_id integer,
    attribute character varying
);


--
-- Name: labour_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.labour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: labour_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.labour_id_seq OWNED BY v3.labour.id;


--
-- Name: management; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.management (
    id integer NOT NULL,
    name character varying NOT NULL,
    organisation_id integer NOT NULL
);


--
-- Name: management_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.management_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: management_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.management_id_seq OWNED BY v3.management.id;


--
-- Name: material; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.material (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL
);


--
-- Name: material_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.material_id_seq OWNED BY v3.material.id;


--
-- Name: nonresidential; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.nonresidential (
    id integer NOT NULL
);


--
-- Name: nonresidential_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.nonresidential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nonresidential_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.nonresidential_id_seq OWNED BY v3.nonresidential.id;


--
-- Name: object; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.object (
    id integer NOT NULL,
    name character varying NOT NULL,
    site_id integer NOT NULL
);


--
-- Name: object_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: object_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.object_id_seq OWNED BY v3.object.id;


--
-- Name: organisation; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.organisation (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: organisation_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.organisation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.organisation_id_seq OWNED BY v3.organisation.id;


--
-- Name: path_type; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.path_type (
    id integer NOT NULL,
    lane_num integer NOT NULL,
    width double precision NOT NULL,
    length double precision NOT NULL
);


--
-- Name: path_type_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.path_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: path_type_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.path_type_id_seq OWNED BY v3.path_type.id;


--
-- Name: residential; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.residential (
    id integer NOT NULL,
    flat_num integer
);


--
-- Name: residential_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.residential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: residential_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.residential_id_seq OWNED BY v3.residential.id;


--
-- Name: road; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.road (
    id integer NOT NULL
);


--
-- Name: road_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.road_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: road_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.road_id_seq OWNED BY v3.road.id;


--
-- Name: schedule; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.schedule (
    id integer NOT NULL,
    object_id integer NOT NULL,
    work_type_id integer NOT NULL,
    deadline date NOT NULL,
    actual_date date
);


--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.schedule_id_seq OWNED BY v3.schedule.id;


--
-- Name: site; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.site (
    id integer NOT NULL,
    name character varying NOT NULL,
    management_id integer NOT NULL,
    head_id integer NOT NULL
);


--
-- Name: site_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.site_id_seq OWNED BY v3.site.id;


--
-- Name: work_type; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.work_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: work_type_by_brigade; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.work_type_by_brigade (
    id integer NOT NULL,
    work_type_id integer NOT NULL,
    brigade_id integer NOT NULL,
    object_id integer NOT NULL
);


--
-- Name: work_type_by_brigade_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.work_type_by_brigade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_type_by_brigade_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.work_type_by_brigade_id_seq OWNED BY v3.work_type_by_brigade.id;


--
-- Name: work_type_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.work_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_type_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.work_type_id_seq OWNED BY v3.work_type.id;


--
-- Name: worker; Type: TABLE; Schema: v3; Owner: -
--

CREATE TABLE v3.worker (
    id integer NOT NULL,
    surname character varying NOT NULL,
    name character varying NOT NULL,
    patronymic character varying
);


--
-- Name: worker_id_seq; Type: SEQUENCE; Schema: v3; Owner: -
--

CREATE SEQUENCE v3.worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: worker_id_seq; Type: SEQUENCE OWNED BY; Schema: v3; Owner: -
--

ALTER SEQUENCE v3.worker_id_seq OWNED BY v3.worker.id;


--
-- Name: bridge id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.bridge ALTER COLUMN id SET DEFAULT nextval('v3.bridge_id_seq'::regclass);


--
-- Name: brigade id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.brigade ALTER COLUMN id SET DEFAULT nextval('v3.brigade_id_seq'::regclass);


--
-- Name: building_type id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.building_type ALTER COLUMN id SET DEFAULT nextval('v3.building_type_id_seq'::regclass);


--
-- Name: contract id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.contract ALTER COLUMN id SET DEFAULT nextval('v3.contract_id_seq'::regclass);


--
-- Name: employer id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.employer ALTER COLUMN id SET DEFAULT nextval('v3.employer_id_seq'::regclass);


--
-- Name: engineer_tech_staff id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.engineer_tech_staff ALTER COLUMN id SET DEFAULT nextval('v3.engineer_tech_staff_id_seq'::regclass);


--
-- Name: equipment id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.equipment ALTER COLUMN id SET DEFAULT nextval('v3.equipment_id_seq'::regclass);


--
-- Name: estimate id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.estimate ALTER COLUMN id SET DEFAULT nextval('v3.estimate_id_seq'::regclass);


--
-- Name: labour id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.labour ALTER COLUMN id SET DEFAULT nextval('v3.labour_id_seq'::regclass);


--
-- Name: management id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.management ALTER COLUMN id SET DEFAULT nextval('v3.management_id_seq'::regclass);


--
-- Name: material id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.material ALTER COLUMN id SET DEFAULT nextval('v3.material_id_seq'::regclass);


--
-- Name: nonresidential id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.nonresidential ALTER COLUMN id SET DEFAULT nextval('v3.nonresidential_id_seq'::regclass);


--
-- Name: object id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.object ALTER COLUMN id SET DEFAULT nextval('v3.object_id_seq'::regclass);


--
-- Name: organisation id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.organisation ALTER COLUMN id SET DEFAULT nextval('v3.organisation_id_seq'::regclass);


--
-- Name: path_type id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.path_type ALTER COLUMN id SET DEFAULT nextval('v3.path_type_id_seq'::regclass);


--
-- Name: residential id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.residential ALTER COLUMN id SET DEFAULT nextval('v3.residential_id_seq'::regclass);


--
-- Name: road id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.road ALTER COLUMN id SET DEFAULT nextval('v3.road_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.schedule ALTER COLUMN id SET DEFAULT nextval('v3.schedule_id_seq'::regclass);


--
-- Name: site id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.site ALTER COLUMN id SET DEFAULT nextval('v3.site_id_seq'::regclass);


--
-- Name: work_type id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.work_type ALTER COLUMN id SET DEFAULT nextval('v3.work_type_id_seq'::regclass);


--
-- Name: work_type_by_brigade id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.work_type_by_brigade ALTER COLUMN id SET DEFAULT nextval('v3.work_type_by_brigade_id_seq'::regclass);


--
-- Name: worker id; Type: DEFAULT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.worker ALTER COLUMN id SET DEFAULT nextval('v3.worker_id_seq'::regclass);


--
-- Data for Name: bridge; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.bridge (id, span_type) VALUES (4, 'Box-section beam');


--
-- Data for Name: brigade; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.brigade (id, brigadier_id) VALUES (1, 16);
INSERT INTO v3.brigade (id, brigadier_id) VALUES (2, 20);
INSERT INTO v3.brigade (id, brigadier_id) VALUES (3, 23);


--
-- Data for Name: building_type; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.building_type (id, floor_num, area) VALUES (1, 11, 7500);
INSERT INTO v3.building_type (id, floor_num, area) VALUES (2, 5, 2500);
INSERT INTO v3.building_type (id, floor_num, area) VALUES (3, 9, 9000);
INSERT INTO v3.building_type (id, floor_num, area) VALUES (6, 1, 100);
INSERT INTO v3.building_type (id, floor_num, area) VALUES (7, 4, 4000);


--
-- Data for Name: contract; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.contract (id, employer_id, organisation_id) VALUES (1, 1, 2);
INSERT INTO v3.contract (id, employer_id, organisation_id) VALUES (2, 1, 4);
INSERT INTO v3.contract (id, employer_id, organisation_id) VALUES (3, 2, 3);
INSERT INTO v3.contract (id, employer_id, organisation_id) VALUES (4, 3, 1);


--
-- Data for Name: employer; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.employer (id, name, type) VALUES (1, 'Novosibirsk City Administration', 'City Administration');
INSERT INTO v3.employer (id, name, type) VALUES (2, 'Ministry Of Transport', 'Ministry');
INSERT INTO v3.employer (id, name, type) VALUES (3, 'United Coffee House', 'Private Firm');


--
-- Data for Name: engineer_tech_staff; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (5, 'head', NULL, 'Previous position: technologiest');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (2, 'head', NULL, 'Previous position: engineer');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (7, 'head', NULL, 'Previous position: engineer');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (12, 'head', NULL, 'Previous position: technician');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (4, 'technologiest', 2, 'I category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (17, 'engineer', 5, 'II category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (15, 'technician', 5, 'I category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (9, 'engineer', 7, 'I category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (13, 'technologiest', 7, 'II category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (1, 'technician', 2, 'I category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (22, 'engineer', 12, 'II category');
INSERT INTO v3.engineer_tech_staff (id, engineer_tech_staff_type, head_id, attribute) VALUES (10, 'engineer', 2, 'I category');


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (1, 3, 'Bulldozer', 1, 2);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (2, 1, 'Lifting crane', 2, 3);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (3, 2, 'Lifting crane', 4, 6);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (4, 5, 'Truck', 7, 7);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (5, 2, 'Bulldozer', 3, 1);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (6, 1, 'Bulldozer', 3, 2);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (7, 1, 'Lifting crane', 7, 3);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (8, 1, 'Truck', 5, 7);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (9, 3, 'Excavator', 3, 9);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (10, 4, 'Excavator', 1, 9);
INSERT INTO v3.equipment (id, num, type, object_id, work_type_id) VALUES (11, 1, 'Lifting crane', 3, 3);


--
-- Data for Name: estimate; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (1, 1, 1, 2400, 18425000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (2, 1, 2, 1450, 7259000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (3, 1, 5, 800, 42000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (4, 1, 7, 2500, 16052000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (5, 1, 9, 352, 8170000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (6, 1, 10, 4, 26700);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (7, 2, 1, 1200, 9163400);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (8, 2, 2, 900, 4509000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (9, 2, 5, 500, 21900);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (10, 2, 7, 700, 4532000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (11, 2, 11, 3, 21000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (12, 2, 12, 0.5, 9110);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (13, 2, 14, 450, 169500);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (14, 3, 1, 2000, 15644000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (15, 3, 2, 1200, 5980000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (16, 3, 5, 600, 29500);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (17, 3, 7, 2100, 13597000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (18, 3, 9, 258, 6449000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (19, 3, 11, 2, 15100);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (20, 4, 6, 5, 7150);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (21, 4, 13, 67, 7436800);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (22, 5, 3, 3, 12100);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (23, 5, 4, 1, 1400);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (24, 5, 5, 300, 19000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (25, 5, 6, 2, 2390);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (26, 5, 7, 180, 1135000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (27, 5, 15, 30, 29100);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (28, 6, 1, 150, 1167500);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (29, 6, 8, 500, 3100000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (30, 6, 11, 2, 15200);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (31, 6, 12, 0.3, 5610);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (32, 7, 1, 1900, 14819000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (33, 7, 2, 400, 2001000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (34, 7, 7, 600, 3900000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (35, 7, 9, 120, 2980000);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (36, 7, 10, 45, 225150);
INSERT INTO v3.estimate (id, object_id, material_id, material_num, expenses) VALUES (37, 7, 12, 0.3, 5700);


--
-- Data for Name: labour; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (21, 'locksmith', 3, '5 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (6, 'concreter', 1, '5 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (14, 'welder', 2, '5 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (23, 'brigadier', 3, 'Previous position: concreter');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (20, 'brigadier', 2, 'Previous position: locksmith');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (16, 'brigadier', 1, 'Previous position: electrician');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (8, 'concreter', 1, '4 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (18, 'electrician', 3, '5 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (3, 'bricklayer', 1, '3 level');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (19, 'driver', 2, 'C, C1, BE, CE, C1E driving license categories');
INSERT INTO v3.labour (id, labour_type, brigade_id, attribute) VALUES (11, 'finisher', 3, '4 level');


--
-- Data for Name: management; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.management (id, name, organisation_id) VALUES (1, 'Novosibirsk City Buildings Management', 2);
INSERT INTO v3.management (id, name, organisation_id) VALUES (2, 'Rail Tracks Management', 3);
INSERT INTO v3.management (id, name, organisation_id) VALUES (3, 'Blossom Management', 1);
INSERT INTO v3.management (id, name, organisation_id) VALUES (4, 'Eurika Management', 4);


--
-- Data for Name: material; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.material (id, name, price) VALUES (1, 'Cement Concrete (m^3)', 7800);
INSERT INTO v3.material (id, name, price) VALUES (2, 'Red Brick (tonne)', 5000);
INSERT INTO v3.material (id, name, price) VALUES (3, 'Soil (tonne)', 4000);
INSERT INTO v3.material (id, name, price) VALUES (4, 'Sand (tonne)', 1000);
INSERT INTO v3.material (id, name, price) VALUES (5, 'Geogrid (m^2)', 50);
INSERT INTO v3.material (id, name, price) VALUES (6, 'Crashed Stone (tonne)', 1400);
INSERT INTO v3.material (id, name, price) VALUES (7, 'Road Concrete (m^3)', 6500);
INSERT INTO v3.material (id, name, price) VALUES (8, 'Glass Showcase (kg)', 6200);
INSERT INTO v3.material (id, name, price) VALUES (9, 'Plastic Window (pcs.)', 25000);
INSERT INTO v3.material (id, name, price) VALUES (10, 'Wooden Door (pcs.)', 5000);
INSERT INTO v3.material (id, name, price) VALUES (11, 'Glass Door (pcs.)', 7600);
INSERT INTO v3.material (id, name, price) VALUES (12, 'Wooden Boards (tonne)', 19000);
INSERT INTO v3.material (id, name, price) VALUES (13, 'Iron Rails (tonne)', 111000);
INSERT INTO v3.material (id, name, price) VALUES (14, 'Shingles (m^2)', 350);
INSERT INTO v3.material (id, name, price) VALUES (15, 'Iron Fence (m^2)', 1000);


--
-- Data for Name: nonresidential; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.nonresidential (id) VALUES (2);
INSERT INTO v3.nonresidential (id) VALUES (6);
INSERT INTO v3.nonresidential (id) VALUES (7);


--
-- Data for Name: object; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.object (id, name, site_id) VALUES (1, 'House №17', 3);
INSERT INTO v3.object (id, name, site_id) VALUES (2, 'The Surikov Lyceum №3', 5);
INSERT INTO v3.object (id, name, site_id) VALUES (3, 'House №4', 3);
INSERT INTO v3.object (id, name, site_id) VALUES (4, 'Bridge R-255', 2);
INSERT INTO v3.object (id, name, site_id) VALUES (5, 'Parking Area', 4);
INSERT INTO v3.object (id, name, site_id) VALUES (6, 'Cafe Building', 4);
INSERT INTO v3.object (id, name, site_id) VALUES (7, 'College Main Building', 5);


--
-- Data for Name: organisation; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.organisation (id, name) VALUES (1, 'New Industry');
INSERT INTO v3.organisation (id, name) VALUES (2, 'Novosibirsk Architecture');
INSERT INTO v3.organisation (id, name) VALUES (3, 'Ways And Paths');
INSERT INTO v3.organisation (id, name) VALUES (4, 'Syberian Buildings');


--
-- Data for Name: path_type; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.path_type (id, lane_num, width, length) VALUES (4, 2, 0.03, 0.5);
INSERT INTO v3.path_type (id, lane_num, width, length) VALUES (5, 1, 0.005, 0.06);


--
-- Data for Name: residential; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.residential (id, flat_num) VALUES (1, 99);
INSERT INTO v3.residential (id, flat_num) VALUES (3, 135);


--
-- Data for Name: road; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.road (id) VALUES (5);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (1, 1, 2, '2010-08-12', '2010-07-29');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (2, 1, 9, '2010-04-07', '2010-04-01');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (3, 1, 3, '2010-06-25', '2010-06-10');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (4, 2, 3, '2018-07-02', '2018-07-05');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (5, 2, 5, '2019-07-07', '2019-06-30');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (6, 3, 1, '2001-05-29', '2001-05-25');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (7, 3, 2, '2001-10-18', '2001-10-13');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (8, 3, 9, '2001-02-08', '2001-02-07');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (9, 4, 4, '2016-09-02', '2016-09-10');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (10, 4, 6, '2016-05-12', '2016-05-08');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (11, 4, 8, '2016-09-09', '2016-09-07');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (12, 5, 7, '2020-04-10', '2020-04-08');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (13, 6, 5, '2015-07-09', '2015-07-11');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (14, 6, 4, '2015-08-22', '2015-08-19');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (15, 7, 7, '2004-04-17', '2004-04-10');
INSERT INTO v3.schedule (id, object_id, work_type_id, deadline, actual_date) VALUES (16, 7, 3, '2004-08-31', '2004-09-07');


--
-- Data for Name: site; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.site (id, name, management_id, head_id) VALUES (2, 'Railway "Novosibirsk-Tomsk"', 2, 12);
INSERT INTO v3.site (id, name, management_id, head_id) VALUES (3, 'Apartment Complex "Nature"', 4, 7);
INSERT INTO v3.site (id, name, management_id, head_id) VALUES (4, 'Cafe "Coffee Academy"', 3, 5);
INSERT INTO v3.site (id, name, management_id, head_id) VALUES (5, 'The Surikov Art College', 1, 2);


--
-- Data for Name: work_type; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.work_type (id, name) VALUES (1, 'Foundation laying');
INSERT INTO v3.work_type (id, name) VALUES (2, 'Water supply laying');
INSERT INTO v3.work_type (id, name) VALUES (3, 'Bricks laying');
INSERT INTO v3.work_type (id, name) VALUES (4, 'Wiring laying');
INSERT INTO v3.work_type (id, name) VALUES (5, 'Window/door installation');
INSERT INTO v3.work_type (id, name) VALUES (6, 'Rails welding');
INSERT INTO v3.work_type (id, name) VALUES (7, 'Materials carrying');
INSERT INTO v3.work_type (id, name) VALUES (8, 'Equipment maintence');
INSERT INTO v3.work_type (id, name) VALUES (9, 'Digging');


--
-- Data for Name: work_type_by_brigade; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (1, 2, 3, 1);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (2, 3, 1, 2);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (3, 4, 3, 4);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (4, 5, 3, 6);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (5, 6, 2, 4);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (6, 7, 2, 7);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (7, 8, 2, 4);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (8, 1, 1, 3);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (9, 2, 3, 3);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (10, 3, 1, 7);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (11, 4, 3, 6);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (12, 5, 3, 2);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (13, 7, 2, 5);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (14, 9, 1, 3);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (15, 9, 1, 1);
INSERT INTO v3.work_type_by_brigade (id, work_type_id, brigade_id, object_id) VALUES (16, 3, 1, 1);


--
-- Data for Name: worker; Type: TABLE DATA; Schema: v3; Owner: -
--

INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (1, 'Nikulin', 'Fyodor', 'Yakovlevich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (2, 'Romashkovna', 'Marina', 'Romanovna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (3, 'Zolotov', 'Anton', 'Alexandrovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (4, 'Kim', 'Katerina', 'Igorevna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (5, 'Rubel', 'Vasilisa', 'Valeryevna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (6, 'Plankov', 'Stepan', 'Nikolaevich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (7, 'Kazakov', 'Artemiy', NULL);
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (8, 'Ponomaryov', 'Lev', 'Pavlovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (9, 'Vinogradov', 'Maxim', 'Dmitrievich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (10, 'Fomchenko', 'Michail', 'Daniilovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (11, 'Dolgov', 'Vladlen', 'Nikolaevich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (12, 'Yerin', 'Kirill', 'Grigoryevich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (13, 'Pchyolkina', 'Elizaveta', 'Nikolaevna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (14, 'Kravchenko', 'Darya', 'Artyomovna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (15, 'Polozov', 'Nikita', 'Kirillovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (16, 'Tomova', 'Tatyana', NULL);
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (17, 'Frendlich', 'Pyotr', 'Fyodorovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (18, 'Yudin', 'Alexandr', 'Vladimirovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (19, 'Kolenko', 'Evgeniya', 'Pavlovna');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (20, 'Azimov', 'Artyom', 'Vladislavovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (21, 'Bern', 'Ivan', NULL);
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (22, 'Micholenko', 'Stepan', 'Maximovich');
INSERT INTO v3.worker (id, surname, name, patronymic) VALUES (23, 'Dyomina', 'Alisa', 'Konstantinovna');


--
-- Name: bridge_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.bridge_id_seq', 1, false);


--
-- Name: brigade_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.brigade_id_seq', 1, false);


--
-- Name: building_type_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.building_type_id_seq', 1, false);


--
-- Name: contract_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.contract_id_seq', 1, false);


--
-- Name: employer_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.employer_id_seq', 1, false);


--
-- Name: engineer_tech_staff_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.engineer_tech_staff_id_seq', 1, false);


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.equipment_id_seq', 1, false);


--
-- Name: estimate_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.estimate_id_seq', 1, false);


--
-- Name: labour_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.labour_id_seq', 1, false);


--
-- Name: management_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.management_id_seq', 1, false);


--
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.material_id_seq', 1, false);


--
-- Name: nonresidential_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.nonresidential_id_seq', 1, false);


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.object_id_seq', 1, false);


--
-- Name: organisation_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.organisation_id_seq', 1, false);


--
-- Name: path_type_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.path_type_id_seq', 1, false);


--
-- Name: residential_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.residential_id_seq', 1, false);


--
-- Name: road_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.road_id_seq', 1, false);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.schedule_id_seq', 1, false);


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.site_id_seq', 1, false);


--
-- Name: work_type_by_brigade_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.work_type_by_brigade_id_seq', 16, true);


--
-- Name: work_type_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.work_type_id_seq', 1, false);


--
-- Name: worker_id_seq; Type: SEQUENCE SET; Schema: v3; Owner: -
--

SELECT pg_catalog.setval('v3.worker_id_seq', 1, false);


--
-- Name: bridge bridge_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.bridge
    ADD CONSTRAINT bridge_pkey PRIMARY KEY (id);


--
-- Name: brigade brigade_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.brigade
    ADD CONSTRAINT brigade_pkey PRIMARY KEY (id);


--
-- Name: building_type building_type_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.building_type
    ADD CONSTRAINT building_type_pkey PRIMARY KEY (id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: employer employer_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.employer
    ADD CONSTRAINT employer_name_key UNIQUE (name);


--
-- Name: employer employer_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.employer
    ADD CONSTRAINT employer_pkey PRIMARY KEY (id);


--
-- Name: engineer_tech_staff engineer_tech_staff_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.engineer_tech_staff
    ADD CONSTRAINT engineer_tech_staff_pkey PRIMARY KEY (id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: estimate estimate_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.estimate
    ADD CONSTRAINT estimate_pkey PRIMARY KEY (id);


--
-- Name: labour labour_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.labour
    ADD CONSTRAINT labour_pkey PRIMARY KEY (id);


--
-- Name: management management_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.management
    ADD CONSTRAINT management_name_key UNIQUE (name);


--
-- Name: management management_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.management
    ADD CONSTRAINT management_pkey PRIMARY KEY (id);


--
-- Name: material material_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.material
    ADD CONSTRAINT material_name_key UNIQUE (name);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: nonresidential nonresidential_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.nonresidential
    ADD CONSTRAINT nonresidential_pkey PRIMARY KEY (id);


--
-- Name: object object_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: organisation organisation_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.organisation
    ADD CONSTRAINT organisation_name_key UNIQUE (name);


--
-- Name: organisation organisation_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.organisation
    ADD CONSTRAINT organisation_pkey PRIMARY KEY (id);


--
-- Name: path_type path_type_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.path_type
    ADD CONSTRAINT path_type_pkey PRIMARY KEY (id);


--
-- Name: residential residential_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.residential
    ADD CONSTRAINT residential_pkey PRIMARY KEY (id);


--
-- Name: road road_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.road
    ADD CONSTRAINT road_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: site site_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.site
    ADD CONSTRAINT site_name_key UNIQUE (name);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: work_type_by_brigade work_type_by_brigade_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.work_type_by_brigade
    ADD CONSTRAINT work_type_by_brigade_pkey PRIMARY KEY (id);


--
-- Name: work_type work_type_name_key; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.work_type
    ADD CONSTRAINT work_type_name_key UNIQUE (name);


--
-- Name: work_type work_type_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.work_type
    ADD CONSTRAINT work_type_pkey PRIMARY KEY (id);


--
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- Name: bridge bridge_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.bridge
    ADD CONSTRAINT bridge_id_fkey FOREIGN KEY (id) REFERENCES v3.path_type(id);


--
-- Name: building_type building_type_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.building_type
    ADD CONSTRAINT building_type_id_fkey FOREIGN KEY (id) REFERENCES v3.object(id);


--
-- Name: contract contract_employer_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.contract
    ADD CONSTRAINT contract_employer_id_fkey FOREIGN KEY (employer_id) REFERENCES v3.employer(id);


--
-- Name: contract contract_organisation_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.contract
    ADD CONSTRAINT contract_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES v3.organisation(id);


--
-- Name: equipment equipment_object_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.equipment
    ADD CONSTRAINT equipment_object_id_fkey FOREIGN KEY (object_id) REFERENCES v3.object(id);


--
-- Name: equipment equipment_work_type_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.equipment
    ADD CONSTRAINT equipment_work_type_id_fkey FOREIGN KEY (work_type_id) REFERENCES v3.work_type(id);


--
-- Name: estimate estimate_material_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.estimate
    ADD CONSTRAINT estimate_material_id_fkey FOREIGN KEY (material_id) REFERENCES v3.material(id);


--
-- Name: estimate estimate_object_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.estimate
    ADD CONSTRAINT estimate_object_id_fkey FOREIGN KEY (object_id) REFERENCES v3.object(id);


--
-- Name: labour labour_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.labour
    ADD CONSTRAINT labour_id_fkey FOREIGN KEY (id) REFERENCES v3.worker(id);


--
-- Name: management management_organisation_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.management
    ADD CONSTRAINT management_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES v3.organisation(id);


--
-- Name: nonresidential nonresidential_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.nonresidential
    ADD CONSTRAINT nonresidential_id_fkey FOREIGN KEY (id) REFERENCES v3.building_type(id);


--
-- Name: object object_site_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.object
    ADD CONSTRAINT object_site_id_fkey FOREIGN KEY (site_id) REFERENCES v3.site(id);


--
-- Name: path_type path_type_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.path_type
    ADD CONSTRAINT path_type_id_fkey FOREIGN KEY (id) REFERENCES v3.object(id);


--
-- Name: residential residential_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.residential
    ADD CONSTRAINT residential_id_fkey FOREIGN KEY (id) REFERENCES v3.building_type(id);


--
-- Name: road road_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.road
    ADD CONSTRAINT road_id_fkey FOREIGN KEY (id) REFERENCES v3.path_type(id);


--
-- Name: schedule schedule_object_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.schedule
    ADD CONSTRAINT schedule_object_id_fkey FOREIGN KEY (object_id) REFERENCES v3.object(id);


--
-- Name: schedule schedule_work_type_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.schedule
    ADD CONSTRAINT schedule_work_type_id_fkey FOREIGN KEY (work_type_id) REFERENCES v3.work_type(id);


--
-- Name: site site_management_id_fkey; Type: FK CONSTRAINT; Schema: v3; Owner: -
--

ALTER TABLE ONLY v3.site
    ADD CONSTRAINT site_management_id_fkey FOREIGN KEY (management_id) REFERENCES v3.management(id);


--
-- PostgreSQL database dump complete
--

