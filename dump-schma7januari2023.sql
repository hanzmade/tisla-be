PGDMP                          {            tisla    10.21    10.21 ?    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            F           1262    24612    tisla    DATABASE     ?   CREATE DATABASE tisla WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE tisla;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            G           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            H           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    2                        3079    24613 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false            I           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1            ?            1259    24622    a_course_work_questions    TABLE       CREATE TABLE public.a_course_work_questions (
    id integer NOT NULL,
    course_work_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_course_work_questions;
       public         postgres    false    4            ?            1259    24625    a_course_work_questions_id_seq    SEQUENCE     ?   ALTER TABLE public.a_course_work_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_course_work_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    197    4            ?            1259    24627    a_cpl_competencies    TABLE     '  CREATE TABLE public.a_cpl_competencies (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_mata_kuliah_competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_cpl_competencies;
       public         postgres    false    4            ?            1259    24630    a_cpl_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cpl_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpl_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    199    4            ?            1259    24632 
   a_cpmk_cpl    TABLE       CREATE TABLE public.a_cpmk_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.a_cpmk_cpl;
       public         postgres    false    4            ?            1259    24635    a_cpmk_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cpmk_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpmk_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    201    4            ?            1259    24637    a_cw_question_cpl    TABLE     7  CREATE TABLE public.a_cw_question_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_cpl;
       public         postgres    false    4            ?            1259    24643    a_cw_question_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    203            ?            1259    24645    a_cw_question_cpmk    TABLE     9  CREATE TABLE public.a_cw_question_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 &   DROP TABLE public.a_cw_question_cpmk;
       public         postgres    false    4            ?            1259    24651    a_cw_question_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    205            ?            1259    24653    a_cw_question_mhs    TABLE     =  CREATE TABLE public.a_cw_question_mhs (
    id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    a_mata_kuliah_mahasiswa_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_mhs;
       public         postgres    false    4            ?            1259    24659    a_cw_question_mhs_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_mhs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_mhs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    207    4            ?            1259    24661    a_dosen_program_studies    TABLE     '  CREATE TABLE public.a_dosen_program_studies (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_dosen_program_studies;
       public         postgres    false    4            ?            1259    24664    a_dosen_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_dosen_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_dosen_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    209            ?            1259    24666    a_mahasiswa_program_studies    TABLE     .  CREATE TABLE public.a_mahasiswa_program_studies (
    id integer NOT NULL,
    m_mahasiswa_nim character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 /   DROP TABLE public.a_mahasiswa_program_studies;
       public         postgres    false    4            ?            1259    24669 "   a_mahasiswa_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mahasiswa_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mahasiswa_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    211            ?            1259    24671    a_mata_kuliah    TABLE     ?  CREATE TABLE public.a_mata_kuliah (
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
 !   DROP TABLE public.a_mata_kuliah;
       public         postgres    false    4            J           0    0    COLUMN a_mata_kuliah.master_id    COMMENT     j   COMMENT ON COLUMN public.a_mata_kuliah.master_id IS 'master id adalah ID Prodi / Fakultas / Universitas';
            public       postgres    false    213            K           0    0    COLUMN a_mata_kuliah.type    COMMENT     [   COMMENT ON COLUMN public.a_mata_kuliah.type IS 'u = universitas\nf = fakultas\np = prodi';
            public       postgres    false    213            ?            1259    24674    a_mata_kuliah_competencies    TABLE       CREATE TABLE public.a_mata_kuliah_competencies (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 .   DROP TABLE public.a_mata_kuliah_competencies;
       public         postgres    false    4            ?            1259    24677 !   a_mata_kuliah_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    214    4            ?            1259    24679    a_mata_kuliah_cpl    TABLE       CREATE TABLE public.a_mata_kuliah_cpl (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.a_mata_kuliah_cpl;
       public         postgres    false    4            ?            1259    24682    a_mata_kuliah_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    216            ?            1259    24684    a_mata_kuliah_cpmk    TABLE       CREATE TABLE public.a_mata_kuliah_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpmk_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_mata_kuliah_cpmk;
       public         postgres    false    4            ?            1259    24687    a_mata_kuliah_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    218            ?            1259    24689    a_mata_kuliah_evaluations    TABLE       CREATE TABLE public.a_mata_kuliah_evaluations (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    question text,
    answer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 -   DROP TABLE public.a_mata_kuliah_evaluations;
       public         postgres    false    4            ?            1259    24695     a_mata_kuliah_evaluations_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_evaluations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    220            ?            1259    24697    a_mata_kuliah_mahasiswa    TABLE     G  CREATE TABLE public.a_mata_kuliah_mahasiswa (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    a_mahasiswa_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    presence character varying
);
 +   DROP TABLE public.a_mata_kuliah_mahasiswa;
       public         postgres    false    4            ?            1259    24703    a_mata_kuliah_mahasiswa_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    222    4            ?            1259    24705 "   a_program_study_mata_kuliah_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_program_study_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    213    4            ?            1259    24707    a_user_program_studies    TABLE       CREATE TABLE public.a_user_program_studies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 *   DROP TABLE public.a_user_program_studies;
       public         postgres    false    4            ?            1259    24710    a_user_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_user_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_user_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    225    4            ?            1259    24712    jobs    TABLE     ?   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         postgres    false    4            ?            1259    24718    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public       postgres    false    4    227            L           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
            public       postgres    false    228            ?            1259    24720    log_api    TABLE     ?   CREATE TABLE public.log_api (
    id integer NOT NULL,
    user_id integer,
    code integer,
    url text,
    message text,
    created_at timestamp(0) without time zone
);
    DROP TABLE public.log_api;
       public         postgres    false    4            ?            1259    24726    log_api_id_seq    SEQUENCE     ?   ALTER TABLE public.log_api ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.log_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    229    4            ?            1259    24728    m_class    TABLE     ?   CREATE TABLE public.m_class (
    id integer NOT NULL,
    code character varying(10),
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_class;
       public         postgres    false    4            ?            1259    24731    m_class_id_seq    SEQUENCE     ?   ALTER TABLE public.m_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    231            ?            1259    24733    m_competencies    TABLE     ?   CREATE TABLE public.m_competencies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_competencies;
       public         postgres    false    4            ?            1259    24736    m_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.m_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    233            ?            1259    24738    m_course_works    TABLE     ?   CREATE TABLE public.m_course_works (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_course_works;
       public         postgres    false    4            ?            1259    24741    m_course_works_id_seq    SEQUENCE     ?   ALTER TABLE public.m_course_works ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_course_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    235            ?            1259    24743    m_cpl    TABLE     ?   CREATE TABLE public.m_cpl (
    id integer NOT NULL,
    code character varying(15) NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpl;
       public         postgres    false    4            ?            1259    24749    m_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.m_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    237    4            ?            1259    24751    m_cpmk    TABLE     ?   CREATE TABLE public.m_cpmk (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpmk;
       public         postgres    false    4            ?            1259    24757    m_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.m_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    239            ?            1259    24759    m_curriculum    TABLE       CREATE TABLE public.m_curriculum (
    id integer NOT NULL,
    code character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100)
);
     DROP TABLE public.m_curriculum;
       public         postgres    false    4            ?            1259    24762    m_curriculum_id_seq    SEQUENCE     ?   ALTER TABLE public.m_curriculum ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    241            ?            1259    24764    m_dosen    TABLE     ?  CREATE TABLE public.m_dosen (
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
    DROP TABLE public.m_dosen;
       public         postgres    false    4            ?            1259    24770    m_dosen_education    TABLE       CREATE TABLE public.m_dosen_education (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    education character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.m_dosen_education;
       public         postgres    false    4            ?            1259    24773    m_dosen_education_id_seq    SEQUENCE     ?   ALTER TABLE public.m_dosen_education ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    244            ?            1259    24775    m_dosen_id_seq    SEQUENCE     ?   ALTER TABLE public.m_dosen ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    243            ?            1259    24777 
   m_fakultas    TABLE       CREATE TABLE public.m_fakultas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_fakultas;
       public         postgres    false    4            ?            1259    24780    m_fakultas_id_seq    SEQUENCE     ?   ALTER TABLE public.m_fakultas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_fakultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    247            ?            1259    24782    m_mahasiswa    TABLE     ?  CREATE TABLE public.m_mahasiswa (
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
    DROP TABLE public.m_mahasiswa;
       public         postgres    false    4            ?            1259    24785    m_mahasiswa_id_seq    SEQUENCE     ?   ALTER TABLE public.m_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    249            ?            1259    24787    m_mata_kuliah    TABLE     L  CREATE TABLE public.m_mata_kuliah (
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
 !   DROP TABLE public.m_mata_kuliah;
       public         postgres    false    4            ?            1259    24790    m_mata_kuliah_id_seq    SEQUENCE     ?   ALTER TABLE public.m_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    251    4            ?            1259    24792    m_program_studies    TABLE     9  CREATE TABLE public.m_program_studies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(10),
    pddikti_code character varying(10)
);
 %   DROP TABLE public.m_program_studies;
       public         postgres    false    4            ?            1259    24795    m_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.m_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    253    4            ?            1259    24797    m_questions    TABLE     ?   CREATE TABLE public.m_questions (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_questions;
       public         postgres    false    4                        1259    24800    m_questions_id_seq    SEQUENCE     ?   ALTER TABLE public.m_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    255                       1259    24802    m_score    TABLE     \  CREATE TABLE public.m_score (
    id integer NOT NULL,
    code character varying(3) NOT NULL,
    min_point character varying(4) NOT NULL,
    max_point character varying(4) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    score character varying
);
    DROP TABLE public.m_score;
       public         postgres    false    4                       1259    24805    m_score_id_seq    SEQUENCE     ?   ALTER TABLE public.m_score ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    257                       1259    24807    m_universitas    TABLE       CREATE TABLE public.m_universitas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.m_universitas;
       public         postgres    false    4                       1259    24810    m_universitas_id_seq    SEQUENCE     ?   ALTER TABLE public.m_universitas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_universitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    259    4                       1259    24812 
   migrations    TABLE     ?   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         postgres    false    4                       1259    24815    migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public       postgres    false    4    261            M           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
            public       postgres    false    262                       1259    24817    personal_access_tokens    TABLE     ?  CREATE TABLE public.personal_access_tokens (
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
 *   DROP TABLE public.personal_access_tokens;
       public         postgres    false    4                       1259    24823    personal_access_tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public       postgres    false    263    4            N           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
            public       postgres    false    264            	           1259    24825    roles    TABLE     ?   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         postgres    false    4            
           1259    24828    roles_id_seq    SEQUENCE     ?   ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    265    4                       1259    24830    syncronize_files    TABLE     r  CREATE TABLE public.syncronize_files (
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
 $   DROP TABLE public.syncronize_files;
       public         postgres    false    4                       1259    24833    syncronize_files_id_seq    SEQUENCE     ?   ALTER TABLE public.syncronize_files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.syncronize_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    4    267                       1259    24835 
   user_roles    TABLE     ?   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.user_roles;
       public         postgres    false    4                       1259    24838    user_roles_id_seq    SEQUENCE     ?   ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    269    4                       1259    24840    users    TABLE     ?  CREATE TABLE public.users (
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
    DROP TABLE public.users;
       public         postgres    false    4                       1259    24846    users_id_seq    SEQUENCE     ?   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    271    4            [           2604    24848    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    227            \           2604    24849    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    262    261            ]           2604    24850    personal_access_tokens id    DEFAULT     ?   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    264    263            ?           2606    24852    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public         postgres    false    227            ?           2606    24854    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public         postgres    false    261            ?           2606    24856 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public         postgres    false    263            ?           2606    24858 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public         postgres    false    263            x           2606    24860    a_mata_kuliah_competencies pk_a 
   CONSTRAINT     ]   ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT pk_a PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.a_mata_kuliah_competencies DROP CONSTRAINT pk_a;
       public         postgres    false    214            _           2606    24862 2   a_course_work_questions pk_a_course_work_questions 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT pk_a_course_work_questions PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT pk_a_course_work_questions;
       public         postgres    false    197            c           2606    24864 (   a_cpl_competencies pk_a_cpl_competencies 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT pk_a_cpl_competencies PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT pk_a_cpl_competencies;
       public         postgres    false    199            g           2606    24866    a_cpmk_cpl pk_a_cpmk_cpl 
   CONSTRAINT     V   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT pk_a_cpmk_cpl PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT pk_a_cpmk_cpl;
       public         postgres    false    201            j           2606    24868 &   a_cw_question_cpl pk_a_cw_question_cpl 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT pk_a_cw_question_cpl PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT pk_a_cw_question_cpl;
       public         postgres    false    203            m           2606    24870 (   a_cw_question_cpmk pk_a_cw_question_cpmk 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_cw_question_cpmk
    ADD CONSTRAINT pk_a_cw_question_cpmk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_cw_question_cpmk DROP CONSTRAINT pk_a_cw_question_cpmk;
       public         postgres    false    205            p           2606    24872 &   a_cw_question_mhs pk_a_cw_question_mhs 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_cw_question_mhs
    ADD CONSTRAINT pk_a_cw_question_mhs PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_cw_question_mhs DROP CONSTRAINT pk_a_cw_question_mhs;
       public         postgres    false    207            r           2606    24874 2   a_dosen_program_studies pk_a_dosen_program_studies 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_dosen_program_studies
    ADD CONSTRAINT pk_a_dosen_program_studies PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_dosen_program_studies DROP CONSTRAINT pk_a_dosen_program_studies;
       public         postgres    false    209            t           2606    24876 :   a_mahasiswa_program_studies pk_a_mahasiswa_program_studies 
   CONSTRAINT     x   ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT pk_a_mahasiswa_program_studies PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.a_mahasiswa_program_studies DROP CONSTRAINT pk_a_mahasiswa_program_studies;
       public         postgres    false    211            z           2606    24878 &   a_mata_kuliah_cpl pk_a_mata_kuliah_cpl 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT pk_a_mata_kuliah_cpl PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT pk_a_mata_kuliah_cpl;
       public         postgres    false    216            |           2606    24880 (   a_mata_kuliah_cpmk pk_a_mata_kuliah_cpmk 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT pk_a_mata_kuliah_cpmk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT pk_a_mata_kuliah_cpmk;
       public         postgres    false    218            ~           2606    24882 6   a_mata_kuliah_evaluations pk_a_mata_kuliah_evaluations 
   CONSTRAINT     t   ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT pk_a_mata_kuliah_evaluations PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.a_mata_kuliah_evaluations DROP CONSTRAINT pk_a_mata_kuliah_evaluations;
       public         postgres    false    220            ?           2606    24884 2   a_mata_kuliah_mahasiswa pk_a_mata_kuliah_mahasiswa 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT pk_a_mata_kuliah_mahasiswa PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT pk_a_mata_kuliah_mahasiswa;
       public         postgres    false    222            ?           2606    24886 0   a_user_program_studies pk_a_user_program_studies 
   CONSTRAINT     n   ALTER TABLE ONLY public.a_user_program_studies
    ADD CONSTRAINT pk_a_user_program_studies PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.a_user_program_studies DROP CONSTRAINT pk_a_user_program_studies;
       public         postgres    false    225            ?           2606    24888    log_api pk_log_api 
   CONSTRAINT     P   ALTER TABLE ONLY public.log_api
    ADD CONSTRAINT pk_log_api PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.log_api DROP CONSTRAINT pk_log_api;
       public         postgres    false    229            ?           2606    24890    m_class pk_m_class 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_class
    ADD CONSTRAINT pk_m_class PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_class DROP CONSTRAINT pk_m_class;
       public         postgres    false    231            ?           2606    24892     m_competencies pk_m_competencies 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_competencies
    ADD CONSTRAINT pk_m_competencies PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.m_competencies DROP CONSTRAINT pk_m_competencies;
       public         postgres    false    233            ?           2606    24894     m_course_works pk_m_course_works 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_course_works
    ADD CONSTRAINT pk_m_course_works PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.m_course_works DROP CONSTRAINT pk_m_course_works;
       public         postgres    false    235            ?           2606    24896    m_cpl pk_m_cpl 
   CONSTRAINT     L   ALTER TABLE ONLY public.m_cpl
    ADD CONSTRAINT pk_m_cpl PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.m_cpl DROP CONSTRAINT pk_m_cpl;
       public         postgres    false    237            ?           2606    24898    m_cpmk pk_m_cpmk 
   CONSTRAINT     N   ALTER TABLE ONLY public.m_cpmk
    ADD CONSTRAINT pk_m_cpmk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.m_cpmk DROP CONSTRAINT pk_m_cpmk;
       public         postgres    false    239            ?           2606    24900    m_curriculum pk_m_curriculum 
   CONSTRAINT     Z   ALTER TABLE ONLY public.m_curriculum
    ADD CONSTRAINT pk_m_curriculum PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.m_curriculum DROP CONSTRAINT pk_m_curriculum;
       public         postgres    false    241            ?           2606    24902    m_dosen pk_m_dosen 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_dosen
    ADD CONSTRAINT pk_m_dosen PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_dosen DROP CONSTRAINT pk_m_dosen;
       public         postgres    false    243            ?           2606    24904 &   m_dosen_education pk_m_dosen_education 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_dosen_education
    ADD CONSTRAINT pk_m_dosen_education PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.m_dosen_education DROP CONSTRAINT pk_m_dosen_education;
       public         postgres    false    244            ?           2606    24906    m_fakultas pk_m_fakultas 
   CONSTRAINT     V   ALTER TABLE ONLY public.m_fakultas
    ADD CONSTRAINT pk_m_fakultas PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.m_fakultas DROP CONSTRAINT pk_m_fakultas;
       public         postgres    false    247            ?           2606    24908    m_mata_kuliah pk_m_mata_kuliah 
   CONSTRAINT     \   ALTER TABLE ONLY public.m_mata_kuliah
    ADD CONSTRAINT pk_m_mata_kuliah PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.m_mata_kuliah DROP CONSTRAINT pk_m_mata_kuliah;
       public         postgres    false    251            ?           2606    24910 &   m_program_studies pk_m_program_studies 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_program_studies
    ADD CONSTRAINT pk_m_program_studies PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.m_program_studies DROP CONSTRAINT pk_m_program_studies;
       public         postgres    false    253            ?           2606    24912    m_questions pk_m_questions 
   CONSTRAINT     X   ALTER TABLE ONLY public.m_questions
    ADD CONSTRAINT pk_m_questions PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.m_questions DROP CONSTRAINT pk_m_questions;
       public         postgres    false    255            ?           2606    24914    m_score pk_m_score 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_score
    ADD CONSTRAINT pk_m_score PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_score DROP CONSTRAINT pk_m_score;
       public         postgres    false    257            ?           2606    24916    m_universitas pk_m_universitas 
   CONSTRAINT     \   ALTER TABLE ONLY public.m_universitas
    ADD CONSTRAINT pk_m_universitas PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.m_universitas DROP CONSTRAINT pk_m_universitas;
       public         postgres    false    259            ?           2606    24918    roles pk_roles 
   CONSTRAINT     L   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT pk_roles;
       public         postgres    false    265            ?           2606    24920 $   syncronize_files pk_syncronize_files 
   CONSTRAINT     b   ALTER TABLE ONLY public.syncronize_files
    ADD CONSTRAINT pk_syncronize_files PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.syncronize_files DROP CONSTRAINT pk_syncronize_files;
       public         postgres    false    267            ?           2606    24922    m_mahasiswa pk_tbl 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_mahasiswa
    ADD CONSTRAINT pk_tbl PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_mahasiswa DROP CONSTRAINT pk_tbl;
       public         postgres    false    249            ?           2606    24924    user_roles pk_user_roles 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT pk_user_roles;
       public         postgres    false    269            ?           2606    24926    users pk_users 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT pk_users;
       public         postgres    false    271            v           2606    24928 "   a_mata_kuliah unq_a_mata_kuliah_id 
   CONSTRAINT     [   ALTER TABLE ONLY public.a_mata_kuliah
    ADD CONSTRAINT unq_a_mata_kuliah_id UNIQUE (id);
 L   ALTER TABLE ONLY public.a_mata_kuliah DROP CONSTRAINT unq_a_mata_kuliah_id;
       public         postgres    false    213            `           1259    24929    a_cpl_competencies_index    INDEX     g   CREATE INDEX a_cpl_competencies_index ON public.a_cpl_competencies USING btree (a_mata_kuliah_cpl_id);
 ,   DROP INDEX public.a_cpl_competencies_index;
       public         postgres    false    199            a           1259    24930    a_cpl_competencies_index2    INDEX     q   CREATE INDEX a_cpl_competencies_index2 ON public.a_cpl_competencies USING btree (a_mata_kuliah_competencies_id);
 -   DROP INDEX public.a_cpl_competencies_index2;
       public         postgres    false    199            d           1259    24931    a_cpmk_cpl_index    INDEX     X   CREATE INDEX a_cpmk_cpl_index ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpmk_id);
 $   DROP INDEX public.a_cpmk_cpl_index;
       public         postgres    false    201            e           1259    24932    a_cpmk_cpl_index2    INDEX     X   CREATE INDEX a_cpmk_cpl_index2 ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpl_id);
 %   DROP INDEX public.a_cpmk_cpl_index2;
       public         postgres    false    201            h           1259    24933    a_cw_question_cpl_index    INDEX     e   CREATE INDEX a_cw_question_cpl_index ON public.a_cw_question_cpl USING btree (a_mata_kuliah_cpl_id);
 +   DROP INDEX public.a_cw_question_cpl_index;
       public         postgres    false    203            k           1259    24934    a_cw_question_cpmk_index    INDEX     h   CREATE INDEX a_cw_question_cpmk_index ON public.a_cw_question_cpmk USING btree (a_mata_kuliah_cpmk_id);
 ,   DROP INDEX public.a_cw_question_cpmk_index;
       public         postgres    false    205            n           1259    24935    a_cw_question_mhs_index    INDEX     k   CREATE INDEX a_cw_question_mhs_index ON public.a_cw_question_mhs USING btree (a_mata_kuliah_mahasiswa_id);
 +   DROP INDEX public.a_cw_question_mhs_index;
       public         postgres    false    207            ?           1259    24936    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public         postgres    false    227            ?           1259    24937 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     ?   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public         postgres    false    263    263            ?           2606    24938 A   a_course_work_questions fk_a_course_work_questions_m_course_works    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_course_works FOREIGN KEY (course_work_id) REFERENCES public.m_course_works(id);
 k   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_course_works;
       public       postgres    false    235    2957    197            ?           2606    24943 >   a_course_work_questions fk_a_course_work_questions_m_questions    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_questions FOREIGN KEY (question_id) REFERENCES public.m_questions(id);
 h   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_questions;
       public       postgres    false    255    197    2977            ?           2606    24948 C   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 m   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies;
       public       postgres    false    199    214    2936            ?           2606    24953 E   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies_0    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0 FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 o   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0;
       public       postgres    false    2936    214    199            ?           2606    24958 :   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 d   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl;
       public       postgres    false    2938    216    199            ?           2606    24963 <   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl_0    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0 FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 f   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0;
       public       postgres    false    216    2938    199            ?           2606    24968 *   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 T   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl;
       public       postgres    false    216    2938    201            ?           2606    24973 +   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpmk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk FOREIGN KEY (a_mata_kuliah_cpmk_id) REFERENCES public.a_mata_kuliah_cpmk(id);
 U   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk;
       public       postgres    false    218    2940    201            ?           2606    24978 >   a_cw_question_cpl fk_a_cw_question_cpl_a_course_work_questions    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions FOREIGN KEY (a_cw_question_id) REFERENCES public.a_course_work_questions(id);
 h   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions;
       public       postgres    false    197    2911    203            ?           2606    24983 8   a_cw_question_cpl fk_a_cw_question_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 b   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl;
       public       postgres    false    203    216    2938            ?           2606    24988 L   a_mahasiswa_program_studies fk_a_mahasiswa_program_studies_m_program_studies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies FOREIGN KEY (m_program_study_id) REFERENCES public.m_program_studies(id);
 v   ALTER TABLE ONLY public.a_mahasiswa_program_studies DROP CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies;
       public       postgres    false    2975    253    211            ?           2606    24993 F   a_mata_kuliah_competencies fk_a_mata_kuliah_competencies_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 p   ALTER TABLE ONLY public.a_mata_kuliah_competencies DROP CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah;
       public       postgres    false    2934    214    213            ?           2606    24998 4   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 ^   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah;
       public       postgres    false    2934    213    216            ?           2606    25003 ,   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_m_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl FOREIGN KEY (cpl_id) REFERENCES public.m_cpl(id);
 V   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl;
       public       postgres    false    2959    237    216            ?           2606    25008 6   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 `   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah;
       public       postgres    false    2934    218    213            ?           2606    25013 /   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_m_cpmk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk FOREIGN KEY (cpmk_id) REFERENCES public.m_cpmk(id);
 Y   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk;
       public       postgres    false    218    239    2961            ?           2606    25018 D   a_mata_kuliah_evaluations fk_a_mata_kuliah_evaluations_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 n   ALTER TABLE ONLY public.a_mata_kuliah_evaluations DROP CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah;
       public       postgres    false    2934    220    213            ?           2606    25023 N   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies FOREIGN KEY (a_mahasiswa_program_study_id) REFERENCES public.a_mahasiswa_program_studies(id);
 x   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies;
       public       postgres    false    222    2932    211            ?           2606    25028 @   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 j   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah;
       public       postgres    false    222    2934    213           