PGDMP         (                 {            postgres    14.4    14.4 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13754    postgres    DATABASE     k   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3603                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    25122    a_course_work_questions    TABLE       CREATE TABLE public.a_course_work_questions (
    id integer NOT NULL,
    course_work_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_course_work_questions;
       public         heap    postgres    false            ?            1259    25125    a_course_work_questions_id_seq    SEQUENCE     ?   ALTER TABLE public.a_course_work_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_course_work_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            ?            1259    25126    a_cpl_competencies    TABLE     '  CREATE TABLE public.a_cpl_competencies (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_mata_kuliah_competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_cpl_competencies;
       public         heap    postgres    false            ?            1259    25129    a_cpl_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cpl_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpl_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            ?            1259    25130 
   a_cpmk_cpl    TABLE       CREATE TABLE public.a_cpmk_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.a_cpmk_cpl;
       public         heap    postgres    false            ?            1259    25133    a_cpmk_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cpmk_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpmk_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            ?            1259    25134    a_cw_question_cpl    TABLE     7  CREATE TABLE public.a_cw_question_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_cpl;
       public         heap    postgres    false            ?            1259    25139    a_cw_question_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            ?            1259    25140    a_cw_question_cpmk    TABLE     9  CREATE TABLE public.a_cw_question_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 &   DROP TABLE public.a_cw_question_cpmk;
       public         heap    postgres    false            ?            1259    25145    a_cw_question_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            ?            1259    25146    a_cw_question_mhs    TABLE     =  CREATE TABLE public.a_cw_question_mhs (
    id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    a_mata_kuliah_mahasiswa_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_mhs;
       public         heap    postgres    false            ?            1259    25151    a_cw_question_mhs_id_seq    SEQUENCE     ?   ALTER TABLE public.a_cw_question_mhs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_mhs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            ?            1259    25152    a_dosen_program_studies    TABLE     '  CREATE TABLE public.a_dosen_program_studies (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_dosen_program_studies;
       public         heap    postgres    false            ?            1259    25155    a_dosen_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_dosen_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_dosen_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            ?            1259    25156    a_mahasiswa_program_studies    TABLE     .  CREATE TABLE public.a_mahasiswa_program_studies (
    id integer NOT NULL,
    m_mahasiswa_nim character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 /   DROP TABLE public.a_mahasiswa_program_studies;
       public         heap    postgres    false            ?            1259    25159 "   a_mahasiswa_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mahasiswa_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mahasiswa_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            ?            1259    25160    a_mata_kuliah    TABLE     ?  CREATE TABLE public.a_mata_kuliah (
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
       public         heap    postgres    false                       0    0    COLUMN a_mata_kuliah.master_id    COMMENT     j   COMMENT ON COLUMN public.a_mata_kuliah.master_id IS 'master id adalah ID Prodi / Fakultas / Universitas';
          public          postgres    false    226                       0    0    COLUMN a_mata_kuliah.type    COMMENT     [   COMMENT ON COLUMN public.a_mata_kuliah.type IS 'u = universitas\nf = fakultas\np = prodi';
          public          postgres    false    226            ?            1259    25163    a_mata_kuliah_competencies    TABLE       CREATE TABLE public.a_mata_kuliah_competencies (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 .   DROP TABLE public.a_mata_kuliah_competencies;
       public         heap    postgres    false            ?            1259    25166 !   a_mata_kuliah_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            ?            1259    25167    a_mata_kuliah_cpl    TABLE       CREATE TABLE public.a_mata_kuliah_cpl (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.a_mata_kuliah_cpl;
       public         heap    postgres    false            ?            1259    25170    a_mata_kuliah_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            ?            1259    25171    a_mata_kuliah_cpmk    TABLE       CREATE TABLE public.a_mata_kuliah_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpmk_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_mata_kuliah_cpmk;
       public         heap    postgres    false            ?            1259    25174    a_mata_kuliah_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231                       1259    33541    a_mata_kuliah_evaluations    TABLE       CREATE TABLE public.a_mata_kuliah_evaluations (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    question text,
    answer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 -   DROP TABLE public.a_mata_kuliah_evaluations;
       public         heap    postgres    false                       1259    33540     a_mata_kuliah_evaluations_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_evaluations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    277            ?            1259    25175    a_mata_kuliah_mahasiswa    TABLE     G  CREATE TABLE public.a_mata_kuliah_mahasiswa (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    a_mahasiswa_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    presence character varying
);
 +   DROP TABLE public.a_mata_kuliah_mahasiswa;
       public         heap    postgres    false            ?            1259    25178    a_mata_kuliah_mahasiswa_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            ?            1259    25179 "   a_program_study_mata_kuliah_id_seq    SEQUENCE     ?   ALTER TABLE public.a_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_program_study_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            ?            1259    25180    a_user_program_studies    TABLE       CREATE TABLE public.a_user_program_studies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 *   DROP TABLE public.a_user_program_studies;
       public         heap    postgres    false            ?            1259    25183    a_user_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.a_user_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_user_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236                       1259    33734    jobs    TABLE     ?   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    postgres    false                       1259    33733    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    283                       0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    282                       1259    36864    log_api    TABLE     ?   CREATE TABLE public.log_api (
    id integer NOT NULL,
    user_id integer,
    code integer,
    url text,
    message text,
    created_at timestamp(0) without time zone
);
    DROP TABLE public.log_api;
       public         heap    postgres    false                       1259    36863    log_api_id_seq    SEQUENCE     ?   ALTER TABLE public.log_api ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.log_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285            ?            1259    25184    m_class    TABLE     ?   CREATE TABLE public.m_class (
    id integer NOT NULL,
    code character varying(10),
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_class;
       public         heap    postgres    false            ?            1259    25187    m_class_id_seq    SEQUENCE     ?   ALTER TABLE public.m_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            ?            1259    25188    m_competencies    TABLE     ?   CREATE TABLE public.m_competencies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_competencies;
       public         heap    postgres    false            ?            1259    25191    m_competencies_id_seq    SEQUENCE     ?   ALTER TABLE public.m_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            ?            1259    25192    m_course_works    TABLE     ?   CREATE TABLE public.m_course_works (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_course_works;
       public         heap    postgres    false            ?            1259    25195    m_course_works_id_seq    SEQUENCE     ?   ALTER TABLE public.m_course_works ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_course_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            ?            1259    25196    m_cpl    TABLE     ?   CREATE TABLE public.m_cpl (
    id integer NOT NULL,
    code character varying(15) NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpl;
       public         heap    postgres    false            ?            1259    25201    m_cpl_id_seq    SEQUENCE     ?   ALTER TABLE public.m_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            ?            1259    25202    m_cpmk    TABLE     ?   CREATE TABLE public.m_cpmk (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpmk;
       public         heap    postgres    false            ?            1259    25207    m_cpmk_id_seq    SEQUENCE     ?   ALTER TABLE public.m_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            ?            1259    25208    m_curriculum    TABLE       CREATE TABLE public.m_curriculum (
    id integer NOT NULL,
    code character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100)
);
     DROP TABLE public.m_curriculum;
       public         heap    postgres    false            ?            1259    25211    m_curriculum_id_seq    SEQUENCE     ?   ALTER TABLE public.m_curriculum ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            ?            1259    25212    m_dosen    TABLE     ?  CREATE TABLE public.m_dosen (
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
       public         heap    postgres    false            ?            1259    25217    m_dosen_education    TABLE       CREATE TABLE public.m_dosen_education (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    education character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.m_dosen_education;
       public         heap    postgres    false            ?            1259    25220    m_dosen_education_id_seq    SEQUENCE     ?   ALTER TABLE public.m_dosen_education ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            ?            1259    25221    m_dosen_id_seq    SEQUENCE     ?   ALTER TABLE public.m_dosen ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            ?            1259    25222 
   m_fakultas    TABLE       CREATE TABLE public.m_fakultas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_fakultas;
       public         heap    postgres    false            ?            1259    25225    m_fakultas_id_seq    SEQUENCE     ?   ALTER TABLE public.m_fakultas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_fakultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254                        1259    25226    m_mahasiswa    TABLE     ?  CREATE TABLE public.m_mahasiswa (
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
       public         heap    postgres    false                       1259    25229    m_mahasiswa_id_seq    SEQUENCE     ?   ALTER TABLE public.m_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    256                       1259    25230    m_mata_kuliah    TABLE     L  CREATE TABLE public.m_mata_kuliah (
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
       public         heap    postgres    false                       1259    25233    m_mata_kuliah_id_seq    SEQUENCE     ?   ALTER TABLE public.m_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    258                       1259    25234    m_program_studies    TABLE     9  CREATE TABLE public.m_program_studies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(10),
    pddikti_code character varying(10)
);
 %   DROP TABLE public.m_program_studies;
       public         heap    postgres    false                       1259    25237    m_program_studies_id_seq    SEQUENCE     ?   ALTER TABLE public.m_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    260                       1259    25238    m_questions    TABLE     ?   CREATE TABLE public.m_questions (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_questions;
       public         heap    postgres    false                       1259    25241    m_questions_id_seq    SEQUENCE     ?   ALTER TABLE public.m_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    262                       1259    25242    m_score    TABLE     \  CREATE TABLE public.m_score (
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
       public         heap    postgres    false            	           1259    25245    m_score_id_seq    SEQUENCE     ?   ALTER TABLE public.m_score ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    264            
           1259    25246    m_universitas    TABLE       CREATE TABLE public.m_universitas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.m_universitas;
       public         heap    postgres    false                       1259    25249    m_universitas_id_seq    SEQUENCE     ?   ALTER TABLE public.m_universitas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_universitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    266                       1259    33715 
   migrations    TABLE     ?   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false                       1259    33714    migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    279                       0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    278                       1259    33722    personal_access_tokens    TABLE     ?  CREATE TABLE public.personal_access_tokens (
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
       public         heap    postgres    false                       1259    33721    personal_access_tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    281                       0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    280                       1259    25250    roles    TABLE     ?   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false                       1259    25253    roles_id_seq    SEQUENCE     ?   ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    268                       1259    25254    syncronize_files    TABLE     r  CREATE TABLE public.syncronize_files (
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
       public         heap    postgres    false                       1259    25257    syncronize_files_id_seq    SEQUENCE     ?   ALTER TABLE public.syncronize_files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.syncronize_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    270                       1259    25258 
   user_roles    TABLE     ?   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false                       1259    25261    user_roles_id_seq    SEQUENCE     ?   ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    272                       1259    25262    users    TABLE     ?  CREATE TABLE public.users (
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
       public         heap    postgres    false                       1259    25267    users_id_seq    SEQUENCE     ?   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    274                       2604    33737    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    283    282    283                       2604    33718    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279                       2604    33725    personal_access_tokens id    DEFAULT     ?   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    281    281            l           2606    33741    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    283            e           2606    33720    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    279            g           2606    33729 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    281            i           2606    33732 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    281            3           2606    25269    a_mata_kuliah_competencies pk_a 
   CONSTRAINT     ]   ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT pk_a PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.a_mata_kuliah_competencies DROP CONSTRAINT pk_a;
       public            postgres    false    227                       2606    25271 2   a_course_work_questions pk_a_course_work_questions 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT pk_a_course_work_questions PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT pk_a_course_work_questions;
       public            postgres    false    210                       2606    25273 (   a_cpl_competencies pk_a_cpl_competencies 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT pk_a_cpl_competencies PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT pk_a_cpl_competencies;
       public            postgres    false    212            "           2606    25275    a_cpmk_cpl pk_a_cpmk_cpl 
   CONSTRAINT     V   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT pk_a_cpmk_cpl PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT pk_a_cpmk_cpl;
       public            postgres    false    214            %           2606    25277 &   a_cw_question_cpl pk_a_cw_question_cpl 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT pk_a_cw_question_cpl PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT pk_a_cw_question_cpl;
       public            postgres    false    216            (           2606    25279 (   a_cw_question_cpmk pk_a_cw_question_cpmk 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_cw_question_cpmk
    ADD CONSTRAINT pk_a_cw_question_cpmk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_cw_question_cpmk DROP CONSTRAINT pk_a_cw_question_cpmk;
       public            postgres    false    218            +           2606    25281 &   a_cw_question_mhs pk_a_cw_question_mhs 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_cw_question_mhs
    ADD CONSTRAINT pk_a_cw_question_mhs PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_cw_question_mhs DROP CONSTRAINT pk_a_cw_question_mhs;
       public            postgres    false    220            -           2606    25283 2   a_dosen_program_studies pk_a_dosen_program_studies 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_dosen_program_studies
    ADD CONSTRAINT pk_a_dosen_program_studies PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_dosen_program_studies DROP CONSTRAINT pk_a_dosen_program_studies;
       public            postgres    false    222            /           2606    25285 :   a_mahasiswa_program_studies pk_a_mahasiswa_program_studies 
   CONSTRAINT     x   ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT pk_a_mahasiswa_program_studies PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.a_mahasiswa_program_studies DROP CONSTRAINT pk_a_mahasiswa_program_studies;
       public            postgres    false    224            5           2606    25287 &   a_mata_kuliah_cpl pk_a_mata_kuliah_cpl 
   CONSTRAINT     d   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT pk_a_mata_kuliah_cpl PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT pk_a_mata_kuliah_cpl;
       public            postgres    false    229            7           2606    25289 (   a_mata_kuliah_cpmk pk_a_mata_kuliah_cpmk 
   CONSTRAINT     f   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT pk_a_mata_kuliah_cpmk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT pk_a_mata_kuliah_cpmk;
       public            postgres    false    231            c           2606    33545 6   a_mata_kuliah_evaluations pk_a_mata_kuliah_evaluations 
   CONSTRAINT     t   ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT pk_a_mata_kuliah_evaluations PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.a_mata_kuliah_evaluations DROP CONSTRAINT pk_a_mata_kuliah_evaluations;
       public            postgres    false    277            9           2606    25291 2   a_mata_kuliah_mahasiswa pk_a_mata_kuliah_mahasiswa 
   CONSTRAINT     p   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT pk_a_mata_kuliah_mahasiswa PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT pk_a_mata_kuliah_mahasiswa;
       public            postgres    false    233            ;           2606    25293 0   a_user_program_studies pk_a_user_program_studies 
   CONSTRAINT     n   ALTER TABLE ONLY public.a_user_program_studies
    ADD CONSTRAINT pk_a_user_program_studies PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.a_user_program_studies DROP CONSTRAINT pk_a_user_program_studies;
       public            postgres    false    236            o           2606    36870    log_api pk_log_api 
   CONSTRAINT     P   ALTER TABLE ONLY public.log_api
    ADD CONSTRAINT pk_log_api PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.log_api DROP CONSTRAINT pk_log_api;
       public            postgres    false    285            =           2606    25295    m_class pk_m_class 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_class
    ADD CONSTRAINT pk_m_class PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_class DROP CONSTRAINT pk_m_class;
       public            postgres    false    238            ?           2606    25297     m_competencies pk_m_competencies 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_competencies
    ADD CONSTRAINT pk_m_competencies PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.m_competencies DROP CONSTRAINT pk_m_competencies;
       public            postgres    false    240            A           2606    25299     m_course_works pk_m_course_works 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_course_works
    ADD CONSTRAINT pk_m_course_works PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.m_course_works DROP CONSTRAINT pk_m_course_works;
       public            postgres    false    242            C           2606    25301    m_cpl pk_m_cpl 
   CONSTRAINT     L   ALTER TABLE ONLY public.m_cpl
    ADD CONSTRAINT pk_m_cpl PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.m_cpl DROP CONSTRAINT pk_m_cpl;
       public            postgres    false    244            E           2606    25303    m_cpmk pk_m_cpmk 
   CONSTRAINT     N   ALTER TABLE ONLY public.m_cpmk
    ADD CONSTRAINT pk_m_cpmk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.m_cpmk DROP CONSTRAINT pk_m_cpmk;
       public            postgres    false    246            G           2606    25305    m_curriculum pk_m_curriculum 
   CONSTRAINT     Z   ALTER TABLE ONLY public.m_curriculum
    ADD CONSTRAINT pk_m_curriculum PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.m_curriculum DROP CONSTRAINT pk_m_curriculum;
       public            postgres    false    248            I           2606    25307    m_dosen pk_m_dosen 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_dosen
    ADD CONSTRAINT pk_m_dosen PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_dosen DROP CONSTRAINT pk_m_dosen;
       public            postgres    false    250            K           2606    25309 &   m_dosen_education pk_m_dosen_education 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_dosen_education
    ADD CONSTRAINT pk_m_dosen_education PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.m_dosen_education DROP CONSTRAINT pk_m_dosen_education;
       public            postgres    false    251            M           2606    25311    m_fakultas pk_m_fakultas 
   CONSTRAINT     V   ALTER TABLE ONLY public.m_fakultas
    ADD CONSTRAINT pk_m_fakultas PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.m_fakultas DROP CONSTRAINT pk_m_fakultas;
       public            postgres    false    254            Q           2606    25313    m_mata_kuliah pk_m_mata_kuliah 
   CONSTRAINT     \   ALTER TABLE ONLY public.m_mata_kuliah
    ADD CONSTRAINT pk_m_mata_kuliah PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.m_mata_kuliah DROP CONSTRAINT pk_m_mata_kuliah;
       public            postgres    false    258            S           2606    25315 &   m_program_studies pk_m_program_studies 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_program_studies
    ADD CONSTRAINT pk_m_program_studies PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.m_program_studies DROP CONSTRAINT pk_m_program_studies;
       public            postgres    false    260            U           2606    25317    m_questions pk_m_questions 
   CONSTRAINT     X   ALTER TABLE ONLY public.m_questions
    ADD CONSTRAINT pk_m_questions PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.m_questions DROP CONSTRAINT pk_m_questions;
       public            postgres    false    262            W           2606    25319    m_score pk_m_score 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_score
    ADD CONSTRAINT pk_m_score PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_score DROP CONSTRAINT pk_m_score;
       public            postgres    false    264            Y           2606    25321    m_universitas pk_m_universitas 
   CONSTRAINT     \   ALTER TABLE ONLY public.m_universitas
    ADD CONSTRAINT pk_m_universitas PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.m_universitas DROP CONSTRAINT pk_m_universitas;
       public            postgres    false    266            [           2606    25323    roles pk_roles 
   CONSTRAINT     L   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT pk_roles;
       public            postgres    false    268            ]           2606    25325 $   syncronize_files pk_syncronize_files 
   CONSTRAINT     b   ALTER TABLE ONLY public.syncronize_files
    ADD CONSTRAINT pk_syncronize_files PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.syncronize_files DROP CONSTRAINT pk_syncronize_files;
       public            postgres    false    270            O           2606    25327    m_mahasiswa pk_tbl 
   CONSTRAINT     P   ALTER TABLE ONLY public.m_mahasiswa
    ADD CONSTRAINT pk_tbl PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.m_mahasiswa DROP CONSTRAINT pk_tbl;
       public            postgres    false    256            _           2606    25329    user_roles pk_user_roles 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT pk_user_roles;
       public            postgres    false    272            a           2606    25331    users pk_users 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT pk_users;
       public            postgres    false    274            1           2606    25343 "   a_mata_kuliah unq_a_mata_kuliah_id 
   CONSTRAINT     [   ALTER TABLE ONLY public.a_mata_kuliah
    ADD CONSTRAINT unq_a_mata_kuliah_id UNIQUE (id);
 L   ALTER TABLE ONLY public.a_mata_kuliah DROP CONSTRAINT unq_a_mata_kuliah_id;
       public            postgres    false    226                       1259    25440    a_cpl_competencies_index    INDEX     g   CREATE INDEX a_cpl_competencies_index ON public.a_cpl_competencies USING btree (a_mata_kuliah_cpl_id);
 ,   DROP INDEX public.a_cpl_competencies_index;
       public            postgres    false    212                       1259    25441    a_cpl_competencies_index2    INDEX     q   CREATE INDEX a_cpl_competencies_index2 ON public.a_cpl_competencies USING btree (a_mata_kuliah_competencies_id);
 -   DROP INDEX public.a_cpl_competencies_index2;
       public            postgres    false    212                       1259    25442    a_cpmk_cpl_index    INDEX     X   CREATE INDEX a_cpmk_cpl_index ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpmk_id);
 $   DROP INDEX public.a_cpmk_cpl_index;
       public            postgres    false    214                        1259    25443    a_cpmk_cpl_index2    INDEX     X   CREATE INDEX a_cpmk_cpl_index2 ON public.a_cpmk_cpl USING btree (a_mata_kuliah_cpl_id);
 %   DROP INDEX public.a_cpmk_cpl_index2;
       public            postgres    false    214            #           1259    25341    a_cw_question_cpl_index    INDEX     e   CREATE INDEX a_cw_question_cpl_index ON public.a_cw_question_cpl USING btree (a_mata_kuliah_cpl_id);
 +   DROP INDEX public.a_cw_question_cpl_index;
       public            postgres    false    216            &           1259    25438    a_cw_question_cpmk_index    INDEX     h   CREATE INDEX a_cw_question_cpmk_index ON public.a_cw_question_cpmk USING btree (a_mata_kuliah_cpmk_id);
 ,   DROP INDEX public.a_cw_question_cpmk_index;
       public            postgres    false    218            )           1259    25439    a_cw_question_mhs_index    INDEX     k   CREATE INDEX a_cw_question_mhs_index ON public.a_cw_question_mhs USING btree (a_mata_kuliah_mahasiswa_id);
 +   DROP INDEX public.a_cw_question_mhs_index;
       public            postgres    false    220            m           1259    33742    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    283            j           1259    33730 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     ?   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    281    281            p           2606    25374 A   a_course_work_questions fk_a_course_work_questions_m_course_works    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_course_works FOREIGN KEY (course_work_id) REFERENCES public.m_course_works(id);
 k   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_course_works;
       public          postgres    false    210    3393    242            q           2606    25379 >   a_course_work_questions fk_a_course_work_questions_m_questions    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_questions FOREIGN KEY (question_id) REFERENCES public.m_questions(id);
 h   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_questions;
       public          postgres    false    210    3413    262            s           2606    25394 C   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 m   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies;
       public          postgres    false    212    3379    227            u           2606    25428 E   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies_0    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0 FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 o   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0;
       public          postgres    false    212    227    3379            r           2606    25389 :   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 d   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl;
       public          postgres    false    3381    229    212            t           2606    25423 <   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl_0    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0 FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 f   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0;
       public          postgres    false    229    212    3381            v           2606    25401 *   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 T   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl;
       public          postgres    false    229    3381    214            w           2606    25406 +   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpmk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk FOREIGN KEY (a_mata_kuliah_cpmk_id) REFERENCES public.a_mata_kuliah_cpmk(id);
 U   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk;
       public          postgres    false    3383    231    214            y           2606    25369 >   a_cw_question_cpl fk_a_cw_question_cpl_a_course_work_questions    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions FOREIGN KEY (a_cw_question_id) REFERENCES public.a_course_work_questions(id);
 h   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions;
       public          postgres    false    216    3354    210            x           2606    25336 8   a_cw_question_cpl fk_a_cw_question_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 b   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl;
       public          postgres    false    229    216    3381            z           2606    25433 L   a_mahasiswa_program_studies fk_a_mahasiswa_program_studies_m_program_studies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies FOREIGN KEY (m_program_study_id) REFERENCES public.m_program_studies(id);
 v   ALTER TABLE ONLY public.a_mahasiswa_program_studies DROP CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies;
       public          postgres    false    260    3411    224            {           2606    25354 F   a_mata_kuliah_competencies fk_a_mata_kuliah_competencies_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 p   ALTER TABLE ONLY public.a_mata_kuliah_competencies DROP CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah;
       public          postgres    false    3377    227    226            |           2606    25344 4   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 ^   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah;
       public          postgres    false    3377    229    226            }           2606    25416 ,   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_m_cpl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl FOREIGN KEY (cpl_id) REFERENCES public.m_cpl(id);
 V   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl;
       public          postgres    false    244    229    3395            ~           2606    25349 6   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 `   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah;
       public          postgres    false    226    3377    231                       2606    25411 /   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_m_cpmk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk FOREIGN KEY (cpmk_id) REFERENCES public.m_cpmk(id);
 Y   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk;
       public          postgres    false    231    3397    246            ?           2606    33546 D   a_mata_kuliah_evaluations fk_a_mata_kuliah_evaluations_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 n   ALTER TABLE ONLY public.a_mata_kuliah_evaluations DROP CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah;
       public          postgres    false    226    277    3377            ?           2606    25384 N   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies FOREIGN KEY (a_mahasiswa_program_study_id) REFERENCES public.a_mahasiswa_program_studies(id);
 x   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies;
       public          postgres    false    224    233    3375            ?           2606    25359 @   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mata_kuliah    FK CONSTRAINT     ?   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 j   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah;
       public          postgres    false    3377    233    226           