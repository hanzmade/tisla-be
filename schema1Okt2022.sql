--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-10-01 20:49:16

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 25122)
-- Name: a_course_work_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_course_work_questions (
    id integer NOT NULL,
    course_work_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_course_work_questions OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25125)
-- Name: a_course_work_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_course_work_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_course_work_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 25126)
-- Name: a_cpl_competencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_cpl_competencies (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_mata_kuliah_competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_cpl_competencies OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25129)
-- Name: a_cpl_competencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_cpl_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpl_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 25130)
-- Name: a_cpmk_cpl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_cpmk_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_cpmk_cpl OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25133)
-- Name: a_cpmk_cpl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_cpmk_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpmk_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 25134)
-- Name: a_cw_question_cpl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_cw_question_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);


ALTER TABLE public.a_cw_question_cpl OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25139)
-- Name: a_cw_question_cpl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_cw_question_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 25140)
-- Name: a_cw_question_cpmk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_cw_question_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);


ALTER TABLE public.a_cw_question_cpmk OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25145)
-- Name: a_cw_question_cpmk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_cw_question_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 25146)
-- Name: a_cw_question_mhs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_cw_question_mhs (
    id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    a_mata_kuliah_mahasiswa_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);


ALTER TABLE public.a_cw_question_mhs OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25151)
-- Name: a_cw_question_mhs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_cw_question_mhs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_mhs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 25152)
-- Name: a_dosen_program_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_dosen_program_studies (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_dosen_program_studies OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25155)
-- Name: a_dosen_program_studies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_dosen_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_dosen_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 25156)
-- Name: a_mahasiswa_program_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mahasiswa_program_studies (
    id integer NOT NULL,
    m_mahasiswa_nim character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_mahasiswa_program_studies OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25159)
-- Name: a_mahasiswa_program_studies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mahasiswa_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mahasiswa_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 25160)
-- Name: a_mata_kuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah (
    id integer NOT NULL,
    master_id integer NOT NULL,
    mata_kuliah_code character varying(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    type character(1),
    m_class_code character varying(10),
    semester integer,
    sks integer,
    m_curriculum_code integer,
    unique_code character varying(100),
    dosen_nidn character varying(20),
    level character varying(100),
    year character varying(40),
    scale_task integer,
    scale_exam integer,
    total_task integer,
    total_exam integer,
    scale_task_detail character varying
);


ALTER TABLE public.a_mata_kuliah OWNER TO postgres;

--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN a_mata_kuliah.master_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.a_mata_kuliah.master_id IS 'master id adalah ID Prodi / Fakultas / Universitas';


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN a_mata_kuliah.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.a_mata_kuliah.type IS 'u = universitas\nf = fakultas\np = prodi';


--
-- TOC entry 227 (class 1259 OID 25163)
-- Name: a_mata_kuliah_competencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah_competencies (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_mata_kuliah_competencies OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25166)
-- Name: a_mata_kuliah_competencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 25167)
-- Name: a_mata_kuliah_cpl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah_cpl (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_mata_kuliah_cpl OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25170)
-- Name: a_mata_kuliah_cpl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 25171)
-- Name: a_mata_kuliah_cpmk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpmk_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_mata_kuliah_cpmk OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25174)
-- Name: a_mata_kuliah_cpmk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 277 (class 1259 OID 33541)
-- Name: a_mata_kuliah_evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah_evaluations (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    question text,
    answer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_mata_kuliah_evaluations OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 33540)
-- Name: a_mata_kuliah_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah_evaluations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 25175)
-- Name: a_mata_kuliah_mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_mata_kuliah_mahasiswa (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    a_mahasiswa_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    presence character varying
);


ALTER TABLE public.a_mata_kuliah_mahasiswa OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25178)
-- Name: a_mata_kuliah_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 25179)
-- Name: a_program_study_mata_kuliah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_program_study_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 25180)
-- Name: a_user_program_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_user_program_studies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.a_user_program_studies OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25183)
-- Name: a_user_program_studies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.a_user_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_user_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 33734)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 33733)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 282
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 285 (class 1259 OID 36864)
-- Name: log_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_api (
    id integer NOT NULL,
    user_id integer,
    code integer,
    url text,
    message text,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.log_api OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 36863)
-- Name: log_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.log_api ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.log_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 25184)
-- Name: m_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_class (
    id integer NOT NULL,
    code character varying(10),
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_class OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25187)
-- Name: m_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 25188)
-- Name: m_competencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_competencies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_competencies OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25191)
-- Name: m_competencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 25192)
-- Name: m_course_works; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_course_works (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_course_works OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25195)
-- Name: m_course_works_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_course_works ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_course_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 25196)
-- Name: m_cpl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_cpl (
    id integer NOT NULL,
    code character varying(15) NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_cpl OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 25201)
-- Name: m_cpl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 25202)
-- Name: m_cpmk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_cpmk (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_cpmk OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 25207)
-- Name: m_cpmk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 25208)
-- Name: m_curriculum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_curriculum (
    id integer NOT NULL,
    code character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100)
);


ALTER TABLE public.m_curriculum OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 25211)
-- Name: m_curriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_curriculum ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 25212)
-- Name: m_dosen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_dosen (
    id integer NOT NULL,
    name character varying(150),
    nidn character varying(20),
    jfa character varying(100),
    science character varying(150),
    taught_courses character varying(150),
    image_url text,
    gs_url character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_dosen OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 25217)
-- Name: m_dosen_education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_dosen_education (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    education character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_dosen_education OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 25220)
-- Name: m_dosen_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_dosen_education ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 25221)
-- Name: m_dosen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_dosen ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 25222)
-- Name: m_fakultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_fakultas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_fakultas OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 25225)
-- Name: m_fakultas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_fakultas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_fakultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 25226)
-- Name: m_mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_mahasiswa (
    id integer NOT NULL,
    nim character varying(30) NOT NULL,
    name character varying(100),
    curriculum character varying(50),
    graduate_of character varying(20),
    class character varying(20),
    college_status character(1),
    year_of_entry character varying(5),
    tk character varying(50),
    hk character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_mahasiswa OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 25229)
-- Name: m_mahasiswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 258 (class 1259 OID 25230)
-- Name: m_mata_kuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_mata_kuliah (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(20),
    status character(1),
    paket integer,
    rapem integer
);


ALTER TABLE public.m_mata_kuliah OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25233)
-- Name: m_mata_kuliah_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 25234)
-- Name: m_program_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_program_studies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(10),
    pddikti_code character varying(10)
);


ALTER TABLE public.m_program_studies OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25237)
-- Name: m_program_studies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 262 (class 1259 OID 25238)
-- Name: m_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_questions (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_questions OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 25241)
-- Name: m_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 264 (class 1259 OID 25242)
-- Name: m_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_score (
    id integer NOT NULL,
    code character varying(3) NOT NULL,
    min_point character varying(4) NOT NULL,
    max_point character varying(4) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_score OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 25245)
-- Name: m_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_score ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 266 (class 1259 OID 25246)
-- Name: m_universitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.m_universitas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.m_universitas OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 25249)
-- Name: m_universitas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.m_universitas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_universitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 33715)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 33714)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 278
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 281 (class 1259 OID 33722)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 33721)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 280
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 268 (class 1259 OID 25250)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 25253)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 270 (class 1259 OID 25254)
-- Name: syncronize_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.syncronize_files (
    id integer NOT NULL,
    user_id integer NOT NULL,
    path character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    filename character varying(100),
    type character varying(20),
    unique_code character varying(100)
);


ALTER TABLE public.syncronize_files OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 25257)
-- Name: syncronize_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.syncronize_files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.syncronize_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 272 (class 1259 OID 25258)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 25261)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 274 (class 1259 OID 25262)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    avatar character varying(255),
    password character varying(255) NOT NULL,
    remember_token character varying(255),
    verification_token character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    expired_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 25267)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3352 (class 2604 OID 33737)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 33718)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 33725)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3436 (class 2606 OID 33741)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 33720)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 33729)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3433 (class 2606 OID 33732)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3379 (class 2606 OID 25269)
-- Name: a_mata_kuliah_competencies pk_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT pk_a PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 25271)
-- Name: a_course_work_questions pk_a_course_work_questions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT pk_a_course_work_questions PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 25273)
-- Name: a_cpl_competencies pk_a_cpl_competencies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT pk_a_cpl_competencies PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 25275)
-- Name: a_cpmk_cpl pk_a_cpmk_cpl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT pk_a_cpmk_cpl PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 25277)
-- Name: a_cw_question_cpl pk_a_cw_question_cpl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT pk_a_cw_question_cpl PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 25279)
-- Name: a_cw_question_cpmk pk_a_cw_question_cpmk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cw_question_cpmk
    ADD CONSTRAINT pk_a_cw_question_cpmk PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 25281)
-- Name: a_cw_question_mhs pk_a_cw_question_mhs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cw_question_mhs
    ADD CONSTRAINT pk_a_cw_question_mhs PRIMARY KEY (id);


--
-- TOC entry 3373 (class 2606 OID 25283)
-- Name: a_dosen_program_studies pk_a_dosen_program_studies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_dosen_program_studies
    ADD CONSTRAINT pk_a_dosen_program_studies PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 25285)
-- Name: a_mahasiswa_program_studies pk_a_mahasiswa_program_studies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT pk_a_mahasiswa_program_studies PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 25287)
-- Name: a_mata_kuliah_cpl pk_a_mata_kuliah_cpl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT pk_a_mata_kuliah_cpl PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 25289)
-- Name: a_mata_kuliah_cpmk pk_a_mata_kuliah_cpmk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT pk_a_mata_kuliah_cpmk PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 33545)
-- Name: a_mata_kuliah_evaluations pk_a_mata_kuliah_evaluations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT pk_a_mata_kuliah_evaluations PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 25291)
-- Name: a_mata_kuliah_mahasiswa pk_a_mata_kuliah_mahasiswa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT pk_a_mata_kuliah_mahasiswa PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 25293)
-- Name: a_user_program_studies pk_a_user_program_studies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_user_program_studies
    ADD CONSTRAINT pk_a_user_program_studies PRIMARY KEY (id);


--
-- TOC entry 3439 (class 2606 OID 36870)
-- Name: log_api pk_log_api; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_api
    ADD CONSTRAINT pk_log_api PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 25295)
-- Name: m_class pk_m_class; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_class
    ADD CONSTRAINT pk_m_class PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 25297)
-- Name: m_competencies pk_m_competencies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_competencies
    ADD CONSTRAINT pk_m_competencies PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 25299)
-- Name: m_course_works pk_m_course_works; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_course_works
    ADD CONSTRAINT pk_m_course_works PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 25301)
-- Name: m_cpl pk_m_cpl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_cpl
    ADD CONSTRAINT pk_m_cpl PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 25303)
-- Name: m_cpmk pk_m_cpmk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_cpmk
    ADD CONSTRAINT pk_m_cpmk PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 25305)
-- Name: m_curriculum pk_m_curriculum; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_curriculum
    ADD CONSTRAINT pk_m_curriculum PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 25307)
-- Name: m_dosen pk_m_dosen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_dosen
    ADD CONSTRAINT pk_m_dosen PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 25309)
-- Name: m_dosen_education pk_m_dosen_education; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_dosen_education
    ADD CONSTRAINT pk_m_dosen_education PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 25311)
-- Name: m_fakultas pk_m_fakultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_fakultas
    ADD CONSTRAINT pk_m_fakultas PRIMARY KEY (id);


--
-- TOC entry 3409 (class 2606 OID 25313)
-- Name: m_mata_kuliah pk_m_mata_kuliah; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_mata_kuliah
    ADD CONSTRAINT pk_m_mata_kuliah PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 25315)
-- Name: m_program_studies pk_m_program_studies; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_program_studies
    ADD CONSTRAINT pk_m_program_studies PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 25317)
-- Name: m_questions pk_m_questions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_questions
    ADD CONSTRAINT pk_m_questions PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 25319)
-- Name: m_score pk_m_score; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_score
    ADD CONSTRAINT pk_m_score PRIMARY KEY (id);


--
-- TOC entry 3417 (class 2606 OID 25321)
-- Name: m_universitas pk_m_universitas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_universitas
    ADD CONSTRAINT pk_m_universitas PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 25323)
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 25325)
-- Name: syncronize_files pk_syncronize_files; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.syncronize_files
    ADD CONSTRAINT pk_syncronize_files PRIMARY KEY (id);


--
-- TOC entry 3407 (class 2606 OID 25327)
-- Name: m_mahasiswa pk_tbl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.m_mahasiswa
    ADD CONSTRAINT pk_tbl PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 25329)
-- Name: user_roles pk_user_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 25331)
-- Name: users pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 25343)
-- Name: a_mata_kuliah unq_a_mata_kuliah_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah
    ADD CONSTRAINT unq_a_mata_kuliah_id UNIQUE (id);


--
-- TOC entry 3355 (class 1259 OID 25440)
-- Name: a_cpl_competencies_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cpl_competencies_index ON public.a_cpl_competencies USING btree (a_mata_kuliah_cpl_id);


--
-- TOC entry 3356 (class 1259 OID 25441)
-- Name: a_cpl_competencies_index2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cpl_competencies_index2 ON public.a_cpl_competencies USING btree (a_mata_kuliah_competencies_id);


--
-- TOC entry 3359 (class 1259 OID 25442)
-- Name: a_cpmk_cpl_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cpmk_cpl_index ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpmk_id);


--
-- TOC entry 3360 (class 1259 OID 25443)
-- Name: a_cpmk_cpl_index2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cpmk_cpl_index2 ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpl_id);


--
-- TOC entry 3363 (class 1259 OID 25341)
-- Name: a_cw_question_cpl_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cw_question_cpl_index ON public.a_cw_question_cpl USING btree (a_mata_kuliah_cpl_id);


--
-- TOC entry 3366 (class 1259 OID 25438)
-- Name: a_cw_question_cpmk_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cw_question_cpmk_index ON public.a_cw_question_cpmk USING btree (a_mata_kuliah_cpmk_id);


--
-- TOC entry 3369 (class 1259 OID 25439)
-- Name: a_cw_question_mhs_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX a_cw_question_mhs_index ON public.a_cw_question_mhs USING btree (a_mata_kuliah_mahasiswa_id);


--
-- TOC entry 3437 (class 1259 OID 33742)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3434 (class 1259 OID 33730)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3440 (class 2606 OID 25374)
-- Name: a_course_work_questions fk_a_course_work_questions_m_course_works; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_course_works FOREIGN KEY (course_work_id) REFERENCES public.m_course_works(id);


--
-- TOC entry 3441 (class 2606 OID 25379)
-- Name: a_course_work_questions fk_a_course_work_questions_m_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_questions FOREIGN KEY (question_id) REFERENCES public.m_questions(id);


--
-- TOC entry 3443 (class 2606 OID 25394)
-- Name: a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);


--
-- TOC entry 3445 (class 2606 OID 25428)
-- Name: a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0 FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);


--
-- TOC entry 3442 (class 2606 OID 25389)
-- Name: a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);


--
-- TOC entry 3444 (class 2606 OID 25423)
-- Name: a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0 FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);


--
-- TOC entry 3446 (class 2606 OID 25401)
-- Name: a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);


--
-- TOC entry 3447 (class 2606 OID 25406)
-- Name: a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpmk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk FOREIGN KEY (a_mata_kuliah_cpmk_id) REFERENCES public.a_mata_kuliah_cpmk(id);


--
-- TOC entry 3449 (class 2606 OID 25369)
-- Name: a_cw_question_cpl fk_a_cw_question_cpl_a_course_work_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions FOREIGN KEY (a_cw_question_id) REFERENCES public.a_course_work_questions(id);


--
-- TOC entry 3448 (class 2606 OID 25336)
-- Name: a_cw_question_cpl fk_a_cw_question_cpl_a_mata_kuliah_cpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);


--
-- TOC entry 3450 (class 2606 OID 25433)
-- Name: a_mahasiswa_program_studies fk_a_mahasiswa_program_studies_m_program_studies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies FOREIGN KEY (m_program_study_id) REFERENCES public.m_program_studies(id);


--
-- TOC entry 3451 (class 2606 OID 25354)
-- Name: a_mata_kuliah_competencies fk_a_mata_kuliah_competencies_a_mata_kuliah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);


--
-- TOC entry 3452 (class 2606 OID 25344)
-- Name: a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_a_mata_kuliah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);


--
-- TOC entry 3453 (class 2606 OID 25416)
-- Name: a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_m_cpl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl FOREIGN KEY (cpl_id) REFERENCES public.m_cpl(id);


--
-- TOC entry 3454 (class 2606 OID 25349)
-- Name: a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_a_mata_kuliah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);


--
-- TOC entry 3455 (class 2606 OID 25411)
-- Name: a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_m_cpmk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk FOREIGN KEY (cpmk_id) REFERENCES public.m_cpmk(id);


--
-- TOC entry 3458 (class 2606 OID 33546)
-- Name: a_mata_kuliah_evaluations fk_a_mata_kuliah_evaluations_a_mata_kuliah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);


--
-- TOC entry 3457 (class 2606 OID 25384)
-- Name: a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies FOREIGN KEY (a_mahasiswa_program_study_id) REFERENCES public.a_mahasiswa_program_studies(id);


--
-- TOC entry 3456 (class 2606 OID 25359)
-- Name: a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mata_kuliah; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);


-- Completed on 2022-10-01 20:49:16

--
-- PostgreSQL database dump complete
--

