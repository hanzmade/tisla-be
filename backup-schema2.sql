PGDMP     2    '                 {            postgres    14.4    14.4 �    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    13754    postgres    DATABASE     k   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE postgres;
                postgres    false            `           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3679                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            a           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    25122    a_course_work_questions    TABLE       CREATE TABLE public.a_course_work_questions (
    id integer NOT NULL,
    course_work_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_course_work_questions;
       public         heap    postgres    false            �            1259    25125    a_course_work_questions_id_seq    SEQUENCE     �   ALTER TABLE public.a_course_work_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_course_work_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    25126    a_cpl_competencies    TABLE     '  CREATE TABLE public.a_cpl_competencies (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_mata_kuliah_competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_cpl_competencies;
       public         heap    postgres    false            �            1259    25129    a_cpl_competencies_id_seq    SEQUENCE     �   ALTER TABLE public.a_cpl_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpl_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    25130 
   a_cpmk_cpl    TABLE       CREATE TABLE public.a_cpmk_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.a_cpmk_cpl;
       public         heap    postgres    false            �            1259    25133    a_cpmk_cpl_id_seq    SEQUENCE     �   ALTER TABLE public.a_cpmk_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cpmk_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    25134    a_cw_question_cpl    TABLE     7  CREATE TABLE public.a_cw_question_cpl (
    id integer NOT NULL,
    a_mata_kuliah_cpl_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_cpl;
       public         heap    postgres    false            �            1259    25139    a_cw_question_cpl_id_seq    SEQUENCE     �   ALTER TABLE public.a_cw_question_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    25140    a_cw_question_cpmk    TABLE     9  CREATE TABLE public.a_cw_question_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_cpmk_id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 &   DROP TABLE public.a_cw_question_cpmk;
       public         heap    postgres    false            �            1259    25145    a_cw_question_cpmk_id_seq    SEQUENCE     �   ALTER TABLE public.a_cw_question_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    25146    a_cw_question_mhs    TABLE     =  CREATE TABLE public.a_cw_question_mhs (
    id integer NOT NULL,
    a_cw_question_id integer NOT NULL,
    a_mata_kuliah_mahasiswa_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    weight character varying
);
 %   DROP TABLE public.a_cw_question_mhs;
       public         heap    postgres    false            �            1259    25151    a_cw_question_mhs_id_seq    SEQUENCE     �   ALTER TABLE public.a_cw_question_mhs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_cw_question_mhs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    25152    a_dosen_program_studies    TABLE     '  CREATE TABLE public.a_dosen_program_studies (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 +   DROP TABLE public.a_dosen_program_studies;
       public         heap    postgres    false            �            1259    25155    a_dosen_program_studies_id_seq    SEQUENCE     �   ALTER TABLE public.a_dosen_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_dosen_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    25156    a_mahasiswa_program_studies    TABLE     .  CREATE TABLE public.a_mahasiswa_program_studies (
    id integer NOT NULL,
    m_mahasiswa_nim character varying(20) NOT NULL,
    m_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 /   DROP TABLE public.a_mahasiswa_program_studies;
       public         heap    postgres    false            �            1259    25159 "   a_mahasiswa_program_studies_id_seq    SEQUENCE     �   ALTER TABLE public.a_mahasiswa_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mahasiswa_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    25160    a_mata_kuliah    TABLE     �  CREATE TABLE public.a_mata_kuliah (
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
       public         heap    postgres    false            b           0    0    COLUMN a_mata_kuliah.master_id    COMMENT     j   COMMENT ON COLUMN public.a_mata_kuliah.master_id IS 'master id adalah ID Prodi / Fakultas / Universitas';
          public          postgres    false    226            c           0    0    COLUMN a_mata_kuliah.type    COMMENT     [   COMMENT ON COLUMN public.a_mata_kuliah.type IS 'u = universitas\nf = fakultas\np = prodi';
          public          postgres    false    226            �            1259    25163    a_mata_kuliah_competencies    TABLE       CREATE TABLE public.a_mata_kuliah_competencies (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    competencies_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 .   DROP TABLE public.a_mata_kuliah_competencies;
       public         heap    postgres    false            �            1259    25166 !   a_mata_kuliah_competencies_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    25167    a_mata_kuliah_cpl    TABLE       CREATE TABLE public.a_mata_kuliah_cpl (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpl_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.a_mata_kuliah_cpl;
       public         heap    postgres    false            �            1259    25170    a_mata_kuliah_cpl_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    25171    a_mata_kuliah_cpmk    TABLE       CREATE TABLE public.a_mata_kuliah_cpmk (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    cpmk_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 &   DROP TABLE public.a_mata_kuliah_cpmk;
       public         heap    postgres    false            �            1259    25174    a_mata_kuliah_cpmk_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false                       1259    33540     a_mata_kuliah_evaluations_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah_evaluations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    277            �            1259    25175    a_mata_kuliah_mahasiswa    TABLE     G  CREATE TABLE public.a_mata_kuliah_mahasiswa (
    id integer NOT NULL,
    a_mata_kuliah_id integer NOT NULL,
    a_mahasiswa_program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    presence character varying
);
 +   DROP TABLE public.a_mata_kuliah_mahasiswa;
       public         heap    postgres    false            �            1259    25178    a_mata_kuliah_mahasiswa_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_mata_kuliah_mahasiswa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    25179 "   a_program_study_mata_kuliah_id_seq    SEQUENCE     �   ALTER TABLE public.a_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_program_study_mata_kuliah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    25180    a_user_program_studies    TABLE       CREATE TABLE public.a_user_program_studies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    program_study_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 *   DROP TABLE public.a_user_program_studies;
       public         heap    postgres    false            �            1259    25183    a_user_program_studies_id_seq    SEQUENCE     �   ALTER TABLE public.a_user_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.a_user_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236                       1259    33734    jobs    TABLE     �   CREATE TABLE public.jobs (
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
       public          postgres    false    283            d           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    282                       1259    36864    log_api    TABLE     �   CREATE TABLE public.log_api (
    id integer NOT NULL,
    user_id integer,
    code integer,
    url text,
    message text,
    created_at timestamp(0) without time zone
);
    DROP TABLE public.log_api;
       public         heap    postgres    false                       1259    36863    log_api_id_seq    SEQUENCE     �   ALTER TABLE public.log_api ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.log_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285            �            1259    25184    m_class    TABLE     �   CREATE TABLE public.m_class (
    id integer NOT NULL,
    code character varying(10),
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_class;
       public         heap    postgres    false            �            1259    25187    m_class_id_seq    SEQUENCE     �   ALTER TABLE public.m_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    25188    m_competencies    TABLE     �   CREATE TABLE public.m_competencies (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_competencies;
       public         heap    postgres    false            �            1259    25191    m_competencies_id_seq    SEQUENCE     �   ALTER TABLE public.m_competencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_competencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    25192    m_course_works    TABLE     �   CREATE TABLE public.m_course_works (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.m_course_works;
       public         heap    postgres    false            �            1259    25195    m_course_works_id_seq    SEQUENCE     �   ALTER TABLE public.m_course_works ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_course_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    25196    m_cpl    TABLE     �   CREATE TABLE public.m_cpl (
    id integer NOT NULL,
    code character varying(15) NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpl;
       public         heap    postgres    false            �            1259    25201    m_cpl_id_seq    SEQUENCE     �   ALTER TABLE public.m_cpl ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    25202    m_cpmk    TABLE     �   CREATE TABLE public.m_cpmk (
    id integer NOT NULL,
    name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_cpmk;
       public         heap    postgres    false            �            1259    25207    m_cpmk_id_seq    SEQUENCE     �   ALTER TABLE public.m_cpmk ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_cpmk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �            1259    25208    m_curriculum    TABLE       CREATE TABLE public.m_curriculum (
    id integer NOT NULL,
    code character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100)
);
     DROP TABLE public.m_curriculum;
       public         heap    postgres    false            �            1259    25211    m_curriculum_id_seq    SEQUENCE     �   ALTER TABLE public.m_curriculum ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_curriculum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    25212    m_dosen    TABLE     �  CREATE TABLE public.m_dosen (
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
       public         heap    postgres    false            �            1259    25217    m_dosen_education    TABLE       CREATE TABLE public.m_dosen_education (
    id integer NOT NULL,
    m_dosen_nidn character varying(20) NOT NULL,
    education character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 %   DROP TABLE public.m_dosen_education;
       public         heap    postgres    false            �            1259    25220    m_dosen_education_id_seq    SEQUENCE     �   ALTER TABLE public.m_dosen_education ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            �            1259    25221    m_dosen_id_seq    SEQUENCE     �   ALTER TABLE public.m_dosen ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_dosen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    25222 
   m_fakultas    TABLE       CREATE TABLE public.m_fakultas (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_fakultas;
       public         heap    postgres    false            �            1259    25225    m_fakultas_id_seq    SEQUENCE     �   ALTER TABLE public.m_fakultas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_fakultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254                        1259    25226    m_mahasiswa    TABLE     �  CREATE TABLE public.m_mahasiswa (
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
       public         heap    postgres    false                       1259    25229    m_mahasiswa_id_seq    SEQUENCE     �   ALTER TABLE public.m_mahasiswa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false                       1259    25233    m_mata_kuliah_id_seq    SEQUENCE     �   ALTER TABLE public.m_mata_kuliah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false                       1259    25237    m_program_studies_id_seq    SEQUENCE     �   ALTER TABLE public.m_program_studies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_program_studies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    260                       1259    25238    m_questions    TABLE     �   CREATE TABLE public.m_questions (
    id integer NOT NULL,
    name character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.m_questions;
       public         heap    postgres    false                       1259    25241    m_questions_id_seq    SEQUENCE     �   ALTER TABLE public.m_questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false            	           1259    25245    m_score_id_seq    SEQUENCE     �   ALTER TABLE public.m_score ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false                       1259    25249    m_universitas_id_seq    SEQUENCE     �   ALTER TABLE public.m_universitas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.m_universitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    266                       1259    33715 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false                       1259    33714    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    279            e           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    278                       1259    33722    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
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
       public         heap    postgres    false                       1259    33721    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    281            f           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    280                       1259    25250    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false                       1259    25253    roles_id_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public         heap    postgres    false                       1259    25257    syncronize_files_id_seq    SEQUENCE     �   ALTER TABLE public.syncronize_files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.syncronize_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    270                       1259    25258 
   user_roles    TABLE     �   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false                       1259    25261    user_roles_id_seq    SEQUENCE     �   ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    272                       1259    25262    users    TABLE     �  CREATE TABLE public.users (
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
       public         heap    postgres    false                       1259    25267    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
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
       public          postgres    false    278    279    279                       2604    33725    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    280    281    281                      0    25122    a_course_work_questions 
   TABLE DATA           v   COPY public.a_course_work_questions (id, course_work_id, question_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    210   �5                0    25126    a_cpl_competencies 
   TABLE DATA           �   COPY public.a_cpl_competencies (id, a_mata_kuliah_cpl_id, a_mata_kuliah_competencies_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    212   �6                0    25130 
   a_cpmk_cpl 
   TABLE DATA           y   COPY public.a_cpmk_cpl (id, a_mata_kuliah_cpmk_id, a_mata_kuliah_cpl_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    214   -C                0    25134    a_cw_question_cpl 
   TABLE DATA           �   COPY public.a_cw_question_cpl (id, a_mata_kuliah_cpl_id, a_cw_question_id, created_at, updated_at, deleted_at, weight) FROM stdin;
    public          postgres    false    216   �C                0    25140    a_cw_question_cpmk 
   TABLE DATA           �   COPY public.a_cw_question_cpmk (id, a_mata_kuliah_cpmk_id, a_cw_question_id, created_at, updated_at, deleted_at, weight) FROM stdin;
    public          postgres    false    218   �D                0    25146    a_cw_question_mhs 
   TABLE DATA           �   COPY public.a_cw_question_mhs (id, a_cw_question_id, a_mata_kuliah_mahasiswa_id, created_at, updated_at, deleted_at, weight) FROM stdin;
    public          postgres    false    220   ]E                0    25152    a_dosen_program_studies 
   TABLE DATA           {   COPY public.a_dosen_program_studies (id, m_dosen_nidn, m_program_study_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    222   �M                0    25156    a_mahasiswa_program_studies 
   TABLE DATA           �   COPY public.a_mahasiswa_program_studies (id, m_mahasiswa_nim, m_program_study_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    224   �O                0    25160    a_mata_kuliah 
   TABLE DATA             COPY public.a_mata_kuliah (id, master_id, mata_kuliah_code, created_at, updated_at, deleted_at, type, m_class_code, semester, sks, m_curriculum_code, unique_code, dosen_nidn, level, year, scale_task, scale_exam, total_task, total_exam, scale_task_detail) FROM stdin;
    public          postgres    false    226   ��                0    25163    a_mata_kuliah_competencies 
   TABLE DATA              COPY public.a_mata_kuliah_competencies (id, a_mata_kuliah_id, competencies_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    227   ��      !          0    25167    a_mata_kuliah_cpl 
   TABLE DATA           m   COPY public.a_mata_kuliah_cpl (id, a_mata_kuliah_id, cpl_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   �      #          0    25171    a_mata_kuliah_cpmk 
   TABLE DATA           o   COPY public.a_mata_kuliah_cpmk (id, a_mata_kuliah_id, cpmk_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    231          Q          0    33541    a_mata_kuliah_evaluations 
   TABLE DATA              COPY public.a_mata_kuliah_evaluations (id, a_mata_kuliah_id, question, answer, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    277   �       %          0    25175    a_mata_kuliah_mahasiswa 
   TABLE DATA           �   COPY public.a_mata_kuliah_mahasiswa (id, a_mata_kuliah_id, a_mahasiswa_program_study_id, created_at, updated_at, deleted_at, presence) FROM stdin;
    public          postgres    false    233   �      (          0    25180    a_user_program_studies 
   TABLE DATA           s   COPY public.a_user_program_studies (id, user_id, program_study_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    236   �      W          0    33734    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    283   7      Y          0    36864    log_api 
   TABLE DATA           N   COPY public.log_api (id, user_id, code, url, message, created_at) FROM stdin;
    public          postgres    false    285   T      *          0    25184    m_class 
   TABLE DATA           U   COPY public.m_class (id, code, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    238   vN      ,          0    25188    m_competencies 
   TABLE DATA           V   COPY public.m_competencies (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    240   �N      .          0    25192    m_course_works 
   TABLE DATA           V   COPY public.m_course_works (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    242   �O      0          0    25196    m_cpl 
   TABLE DATA           S   COPY public.m_cpl (id, code, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    244   P      2          0    25202    m_cpmk 
   TABLE DATA           N   COPY public.m_cpmk (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    246   �S      4          0    25208    m_curriculum 
   TABLE DATA           Z   COPY public.m_curriculum (id, code, created_at, updated_at, deleted_at, name) FROM stdin;
    public          postgres    false    248   �T      6          0    25212    m_dosen 
   TABLE DATA           �   COPY public.m_dosen (id, name, nidn, jfa, science, taught_courses, image_url, gs_url, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    250    U      7          0    25217    m_dosen_education 
   TABLE DATA           l   COPY public.m_dosen_education (id, m_dosen_nidn, education, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    251   `      :          0    25222 
   m_fakultas 
   TABLE DATA           X   COPY public.m_fakultas (id, name, code, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    254   Tf      <          0    25226    m_mahasiswa 
   TABLE DATA           �   COPY public.m_mahasiswa (id, nim, name, curriculum, graduate_of, class, college_status, year_of_entry, tk, hk, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    256   qf      >          0    25230    m_mata_kuliah 
   TABLE DATA           q   COPY public.m_mata_kuliah (id, name, created_at, updated_at, deleted_at, code, status, paket, rapem) FROM stdin;
    public          postgres    false    258   u�      @          0    25234    m_program_studies 
   TABLE DATA           m   COPY public.m_program_studies (id, name, created_at, updated_at, deleted_at, code, pddikti_code) FROM stdin;
    public          postgres    false    260   f�      B          0    25238    m_questions 
   TABLE DATA           S   COPY public.m_questions (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    262   ��      D          0    25242    m_score 
   TABLE DATA           l   COPY public.m_score (id, code, min_point, max_point, created_at, updated_at, deleted_at, score) FROM stdin;
    public          postgres    false    264   �      F          0    25246    m_universitas 
   TABLE DATA           [   COPY public.m_universitas (id, name, code, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    266   |�      S          0    33715 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    279   ��      U          0    33722    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
    public          postgres    false    281    �      H          0    25250    roles 
   TABLE DATA           M   COPY public.roles (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    268   �      J          0    25254    syncronize_files 
   TABLE DATA           ~   COPY public.syncronize_files (id, user_id, path, created_at, updated_at, deleted_at, filename, type, unique_code) FROM stdin;
    public          postgres    false    270   O�      L          0    25258 
   user_roles 
   TABLE DATA           ^   COPY public.user_roles (id, user_id, role_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    272   7�      N          0    25262    users 
   TABLE DATA           �   COPY public.users (id, name, email, avatar, password, remember_token, verification_token, created_at, updated_at, deleted_at, expired_at) FROM stdin;
    public          postgres    false    274   ��      g           0    0    a_course_work_questions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.a_course_work_questions_id_seq', 7182, true);
          public          postgres    false    211            h           0    0    a_cpl_competencies_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.a_cpl_competencies_id_seq', 135201, true);
          public          postgres    false    213            i           0    0    a_cpmk_cpl_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.a_cpmk_cpl_id_seq', 7967, true);
          public          postgres    false    215            j           0    0    a_cw_question_cpl_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.a_cw_question_cpl_id_seq', 8375, true);
          public          postgres    false    217            k           0    0    a_cw_question_cpmk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.a_cw_question_cpmk_id_seq', 3612, true);
          public          postgres    false    219            l           0    0    a_cw_question_mhs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.a_cw_question_mhs_id_seq', 28064, true);
          public          postgres    false    221            m           0    0    a_dosen_program_studies_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.a_dosen_program_studies_id_seq', 1402, true);
          public          postgres    false    223            n           0    0 "   a_mahasiswa_program_studies_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.a_mahasiswa_program_studies_id_seq', 381648, true);
          public          postgres    false    225            o           0    0 !   a_mata_kuliah_competencies_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.a_mata_kuliah_competencies_id_seq', 6065, true);
          public          postgres    false    228            p           0    0    a_mata_kuliah_cpl_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.a_mata_kuliah_cpl_id_seq', 5781, true);
          public          postgres    false    230            q           0    0    a_mata_kuliah_cpmk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.a_mata_kuliah_cpmk_id_seq', 2933, true);
          public          postgres    false    232            r           0    0     a_mata_kuliah_evaluations_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.a_mata_kuliah_evaluations_id_seq', 954, true);
          public          postgres    false    276            s           0    0    a_mata_kuliah_mahasiswa_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.a_mata_kuliah_mahasiswa_id_seq', 9371, true);
          public          postgres    false    234            t           0    0 "   a_program_study_mata_kuliah_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.a_program_study_mata_kuliah_id_seq', 1233, true);
          public          postgres    false    235            u           0    0    a_user_program_studies_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.a_user_program_studies_id_seq', 37, true);
          public          postgres    false    237            v           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    282            w           0    0    log_api_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.log_api_id_seq', 689, true);
          public          postgres    false    284            x           0    0    m_class_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_class_id_seq', 1, false);
          public          postgres    false    239            y           0    0    m_competencies_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.m_competencies_id_seq', 1465, true);
          public          postgres    false    241            z           0    0    m_course_works_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.m_course_works_id_seq', 1023, true);
          public          postgres    false    243            {           0    0    m_cpl_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_cpl_id_seq', 1629, true);
          public          postgres    false    245            |           0    0    m_cpmk_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.m_cpmk_id_seq', 1069, true);
          public          postgres    false    247            }           0    0    m_curriculum_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.m_curriculum_id_seq', 15, true);
          public          postgres    false    249            ~           0    0    m_dosen_education_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_dosen_education_id_seq', 4688, true);
          public          postgres    false    252                       0    0    m_dosen_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.m_dosen_id_seq', 2442, true);
          public          postgres    false    253            �           0    0    m_fakultas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_fakultas_id_seq', 1, false);
          public          postgres    false    255            �           0    0    m_mahasiswa_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_mahasiswa_id_seq', 398325, true);
          public          postgres    false    257            �           0    0    m_mata_kuliah_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_mata_kuliah_id_seq', 1113, true);
          public          postgres    false    259            �           0    0    m_program_studies_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.m_program_studies_id_seq', 27, true);
          public          postgres    false    261            �           0    0    m_questions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.m_questions_id_seq', 873, true);
          public          postgres    false    263            �           0    0    m_score_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.m_score_id_seq', 7, true);
          public          postgres    false    265            �           0    0    m_universitas_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.m_universitas_id_seq', 1, false);
          public          postgres    false    267            �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);
          public          postgres    false    278            �           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    280            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 5, true);
          public          postgres    false    269            �           0    0    syncronize_files_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.syncronize_files_id_seq', 292, true);
          public          postgres    false    271            �           0    0    user_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_roles_id_seq', 46, true);
          public          postgres    false    273            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 43, true);
          public          postgres    false    275            l           2606    33741    jobs jobs_pkey 
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
       public            postgres    false    283            j           1259    33730 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    281    281            p           2606    25374 A   a_course_work_questions fk_a_course_work_questions_m_course_works    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_course_works FOREIGN KEY (course_work_id) REFERENCES public.m_course_works(id);
 k   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_course_works;
       public          postgres    false    210    3393    242            q           2606    25379 >   a_course_work_questions fk_a_course_work_questions_m_questions    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_course_work_questions
    ADD CONSTRAINT fk_a_course_work_questions_m_questions FOREIGN KEY (question_id) REFERENCES public.m_questions(id);
 h   ALTER TABLE ONLY public.a_course_work_questions DROP CONSTRAINT fk_a_course_work_questions_m_questions;
       public          postgres    false    210    3413    262            s           2606    25394 C   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 m   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies;
       public          postgres    false    212    3379    227            u           2606    25428 E   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_competencies_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0 FOREIGN KEY (a_mata_kuliah_competencies_id) REFERENCES public.a_mata_kuliah_competencies(id);
 o   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_competencies_0;
       public          postgres    false    212    227    3379            r           2606    25389 :   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 d   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl;
       public          postgres    false    3381    229    212            t           2606    25423 <   a_cpl_competencies fk_a_cpl_competencies_a_mata_kuliah_cpl_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpl_competencies
    ADD CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0 FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 f   ALTER TABLE ONLY public.a_cpl_competencies DROP CONSTRAINT fk_a_cpl_competencies_a_mata_kuliah_cpl_0;
       public          postgres    false    229    212    3381            v           2606    25401 *   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 T   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpl;
       public          postgres    false    229    3381    214            w           2606    25406 +   a_cpmk_cpl fk_a_cpmk_cpl_a_mata_kuliah_cpmk    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cpmk_cpl
    ADD CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk FOREIGN KEY (a_mata_kuliah_cpmk_id) REFERENCES public.a_mata_kuliah_cpmk(id);
 U   ALTER TABLE ONLY public.a_cpmk_cpl DROP CONSTRAINT fk_a_cpmk_cpl_a_mata_kuliah_cpmk;
       public          postgres    false    3383    231    214            y           2606    25369 >   a_cw_question_cpl fk_a_cw_question_cpl_a_course_work_questions    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions FOREIGN KEY (a_cw_question_id) REFERENCES public.a_course_work_questions(id);
 h   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_course_work_questions;
       public          postgres    false    216    3354    210            x           2606    25336 8   a_cw_question_cpl fk_a_cw_question_cpl_a_mata_kuliah_cpl    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_cw_question_cpl
    ADD CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl FOREIGN KEY (a_mata_kuliah_cpl_id) REFERENCES public.a_mata_kuliah_cpl(id);
 b   ALTER TABLE ONLY public.a_cw_question_cpl DROP CONSTRAINT fk_a_cw_question_cpl_a_mata_kuliah_cpl;
       public          postgres    false    229    216    3381            z           2606    25433 L   a_mahasiswa_program_studies fk_a_mahasiswa_program_studies_m_program_studies    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mahasiswa_program_studies
    ADD CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies FOREIGN KEY (m_program_study_id) REFERENCES public.m_program_studies(id);
 v   ALTER TABLE ONLY public.a_mahasiswa_program_studies DROP CONSTRAINT fk_a_mahasiswa_program_studies_m_program_studies;
       public          postgres    false    260    3411    224            {           2606    25354 F   a_mata_kuliah_competencies fk_a_mata_kuliah_competencies_a_mata_kuliah    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_competencies
    ADD CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 p   ALTER TABLE ONLY public.a_mata_kuliah_competencies DROP CONSTRAINT fk_a_mata_kuliah_competencies_a_mata_kuliah;
       public          postgres    false    3377    227    226            |           2606    25344 4   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_a_mata_kuliah    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 ^   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_a_mata_kuliah;
       public          postgres    false    3377    229    226            }           2606    25416 ,   a_mata_kuliah_cpl fk_a_mata_kuliah_cpl_m_cpl    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_cpl
    ADD CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl FOREIGN KEY (cpl_id) REFERENCES public.m_cpl(id);
 V   ALTER TABLE ONLY public.a_mata_kuliah_cpl DROP CONSTRAINT fk_a_mata_kuliah_cpl_m_cpl;
       public          postgres    false    244    229    3395            ~           2606    25349 6   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_a_mata_kuliah    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 `   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_a_mata_kuliah;
       public          postgres    false    226    3377    231                       2606    25411 /   a_mata_kuliah_cpmk fk_a_mata_kuliah_cpmk_m_cpmk    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_cpmk
    ADD CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk FOREIGN KEY (cpmk_id) REFERENCES public.m_cpmk(id);
 Y   ALTER TABLE ONLY public.a_mata_kuliah_cpmk DROP CONSTRAINT fk_a_mata_kuliah_cpmk_m_cpmk;
       public          postgres    false    231    3397    246            �           2606    33546 D   a_mata_kuliah_evaluations fk_a_mata_kuliah_evaluations_a_mata_kuliah    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_evaluations
    ADD CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 n   ALTER TABLE ONLY public.a_mata_kuliah_evaluations DROP CONSTRAINT fk_a_mata_kuliah_evaluations_a_mata_kuliah;
       public          postgres    false    226    277    3377            �           2606    25384 N   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies FOREIGN KEY (a_mahasiswa_program_study_id) REFERENCES public.a_mahasiswa_program_studies(id);
 x   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mahasiswa_program_studies;
       public          postgres    false    224    233    3375            �           2606    25359 @   a_mata_kuliah_mahasiswa fk_a_mata_kuliah_mahasiswa_a_mata_kuliah    FK CONSTRAINT     �   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa
    ADD CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah FOREIGN KEY (a_mata_kuliah_id) REFERENCES public.a_mata_kuliah(id);
 j   ALTER TABLE ONLY public.a_mata_kuliah_mahasiswa DROP CONSTRAINT fk_a_mata_kuliah_mahasiswa_a_mata_kuliah;
       public          postgres    false    3377    233    226               \  x��չm1DQ{&
% ��&�"������V4��$[U/�kU]&f�j��_"�Ϲ^�s���5w����]��]�)wg�-8�n\��L�x?S8����3?n�g��Y��~Vp��={��߂�m8����s=n�������~p��?{챟��7�[pC�}��/�������x����S�8�/����������-��߆��R�x����~��~ip�_:���e7�˂����~n���ac�8ޯ��+���ʏ�U��~�p�_�W�>�[pC������~�����x�v8ޯ�����ȱ_��7�[pC�}��o	���[���~���`��         %  x�����6 �o��4�@��\D*p�udEaͮ3��?biK��kY��G���MK��L�����=�Mǯy�5�?~����s>�~�:�G��}����E딜u_o�F��tx��Ӗ���|���x����@���� OzL9�s�okI�z�7�G��� 5�-������M�=n:8@����9��UNz�����4��~���*S���-���jpe��t�G���::�<�t�i��v�u��M�;�������ó�������~��ۥ��MG?�2���˜�~[{D�7]���-�SkN[N�m�_�u�{�o:���M�_�馣��sN$���'В?���t����x=t�<i�r:�tI����xz��ΜRjN[N�t<���㩔#�9�N9�s����5O��x�ԚӖ�-Ou��S=��Ԧx�9�K<����V��jN[N�x<�=O���6ŋh�s���i[��x<m5^D[����2���[F���2B:�t����2��t��h<]-#�W�Ȩ��׼~P-O�Z�@-O�Z�H�<�jy"��D��T���'R-O�Z���NZ�H�<�jy"��D��T���'R-O�Z�H�<��Z�H�<�jy"��D��T���'R-O�Z�H�<�.Z�H�<�jy"��D��T���'R-O�Z�H�<��Z�H�<�jy"��D��T���'R-O�Z�H�<�-O�Z�H�<�jy"��D��T���'R-O�Z�@��'R-O�Z�H�<�jy"��D��T���'R-O�M���'R-O�Z�H�<�jy"��D��T���'�M���'R-O�Z�H�<�jy"��D��T���'�]���'R-O�Z�H�<�jy"��D��T���'�C���'R-O�Z�H�<�jy"��D��i~R/O�^��M^�@�<�zy����	����'P/O�^�@�<=���	����'P/O�^�@�<�zy����	��ӓ.^�@�<�zy����	����'P/O�^�@�<=���	����'P/O�^�@�<�zy����	��ӓ/O�^�@�<�zy����	����'P/O�^���zy��z�V;����+cY~-���7�<�-�SkN[N��jst��M�����SG�-#�sN�m�_���������2.:<@�i�i��5:����_ฟ::@o!�s�o�$g�-㢟��/Z�t|��Ӗ�~[痻|~8��~���=n:��z��tx��2B�o�%W�[�E??�_���� 5�-����/w���~������-㢟_�O�[F�ó���~[痻�z��ۥ����~��2:�������M���[F�ԭ����9=ok;��u��{�-���l�e\t��u�-cK���[FH7$Ǔ�:�@����e�t���	t��Zt�֜��n:�@wO��Μ'�-#�sNO���'Т3���t����x=t�<io!�s��x]u<�O�Uh���	t��z��y��2B:�t����x-:�@�."Ж�M���	������e��"�s�� ]u<����5�-���'�]����I{���E:�����'P/O�^�@�<�zy�����I7/O�^�@�<�zy����	����'P/O�^��t����	����'P/O�^�@�<�zy�����I/O�^�@�<�zy����	����'P/O�^�t��<�zy����	����'P/O�^�@�<�zyz�����'P/O�^�@�<�zy����i��T���'�E���'R-O�Z�H�<�jy"��D��T���'�U���'R-O�Z�H�<�jy"��D��T���'Т�T���'R-O�Z�H�<�jy"��D��T�h��D��T���'R-O�Z�H�<�jy"��D��	�iy"��D��T���'R-O�Z�H�<�jy"���iy"��D��T���'R-O�Z�H�<�jy"���ky"��D��T���'R-O�Z�H�<�jy"��zhy"��D��T���'R-O�Z�H�<�jy"����Ǥ�T���'R-O�Z���I�<�jy"��D��T���T���'R-O�Z�H�<�jy"��D��T���T���'R-O�Z�H�<�jy"���rׯWF{�y���_g��G���2B:��֒�����~��?i��� 5�-����/w�zk����_��� �e�t�i���������~��2.:<@�i�i���u���+�7�����9��u~��ׇ�7�z}�r�я�[�E�gm9���%Wp��~}�?�q����/#�sN�m�_�������/����__�OZ���r�o��r�!�o:z�\-�H~��e�Y������)�뛶�w����5�-��m�痻��q��q��o:���[�M��2B�ă���l<��>���t��So�x�-#�9�e�t�����2���[F6sz�i�����2���[F2s��[FH�.�xz�5O/Z�5�-�[8�^t�Ӌ�x�So�"z�9�K8�^t�Ӌ�p�h�i���������G8���[F��^t����]��T��e�NW�Q�����-$u�-#Ou�-#{jo!�s���N�e$�N�e$�N�e$��N�e������^�@�<=i����	����'P/O�^�@�<�zy�����I��'P/O�^�@�<�zy����	����'P/OOڼ<�zy����	����'P/O�^�@�<�zyz�����'P/O�^�@�<�zy����	�����'ݽ<�zy����	����'P/O�^�@�<�zyz�����'P/O�^�@�<�zy����	������'/O�^�@�<�zy����	����'P/O�^��t����	����'P/O�^�@�<�zy�����I/O�^�@�<�zy����	����'P/O�^��t����	����'P/O�^�@�<�zy��?���'-^�@�<�zy����	����'P/O�^�@�<=i����	����'P/O�^�@�<�zy�����I��'P/O�^�@�<�zy����	����'P/OO�yy����	����'P/O�^�@�<�zy������'P/O�^�@�<�zy����	����'P/OOzxy����	����'P/O�^�@�<�zy�������	��ӛ����ϟ�S��         �   x����� F�g������� ��Q��SU-X�-G7�&T�)��� ~@m�0\�~b��:$p@�Pd�B�W�ʄ?�0+$G�L�+�
�Q�n�
S�� Q��zD�!q@2��p,��dpS�G1��2��x��2��~����	�����`YC]��Qd���.��(��MQ�av��U�z����/         �   x�m���0E��x��؆������Q �A����ir0�<@D����j-��f05kx�/�F�����<�ї��nn����o�m�,Ia���F����-��Y�2�b�T�=E�*"i�4��"�,��0KR�-��U@y
�b��%)�,����)X� i
�[HA7�)fI
�����R� }�i         �   x�mб1C��<L@Ig�^"��s��0v�!^�UW������-�V}�j]m��q�G���m�������4����vK�+��]!B-�"��\!��V��JZB*iU��U!��N��JZB*�UB*�UB*�UB*eT�Wk��Li.         j  x�mZ[��:��Y̔�6qWp����6i�!U�dO����Y��i4~������m�&+[k+`K�[3`S�|3��>�ѩ�%_>��~�>�i]%�>��b|[�`>�i��r|��������c��Zc�*9�5�qT�u�q�E�sX-Zh-#�a�ԚơS���q�:�4���Jچ|������wM�i#��4k�l��g^�DϬ��aG�xT���k���5]�1}]���{=�&M��t��a��Iӣ4��iz��h���4q���I�<L_��I㰧݆i�<৕<�'���'�t�y�&��^<�(��[�p�Uy����.L�`�u�T��UJ��F�6Ӵ�fS̴Iud�8�yq8�� �i.�HC��c_Bh�5-���c�����(J�O�b@q���c���Uw�=�����Cy�!����#邡<�%DӰݤ��B�xT=��6�3�m�i�u����g7��Hg�q��8tyx�y(���CqL`\/��}�c���9X@���ӛ���R��P���@�+�vb���ڔq|1q�j�I��$�J��E�+��*�Ǵ��h+.���Ϋ�[y��>.��D;r�0]���)Wy��>.p��Y��o�\`*�>�0Յ}�W����$b�8�%&b�8�/L�pK�\�e��4�q��q��e�i�O�4�FV�ĸ���c��!�y�l�Y��%�g|�~�a���sXW���k�uM��ܬk��]�W�^�@eD�ӷ�H|cG���}���|���f��^���/�Yt�a|�b��Is���{I����. ���Ga�3*�^<����F_y��`���<&/������Ӻ�&fb�M�:�aڤ�i�8�y��I.�&M�L��y�4i\�4m�W-O��D�B_w���U�S@#1S��ҧ�*%Ra��L0TM�&�c!Uc�f��j��Lh��G��>&�M���Lh����mS��煮��ߚ�xḩތ��xu<�CO��5�<1�x��aˋ�8^�������lX�\���ŕ���թ����h��<άM0�+�}��UM�b���tQ��cz�2|�1m��j���V�W%���4�	lU��{K����;��c���ji�
L��]L�ч����[�S�`0U��X
�����u8�[Ă+�޼�4�	.�/t�h��HA�i��Y
�M�qY*�M��R�����&pG�����O���Z��K-��5��̺&fp��5~֮�Ѥ�U�I�c���I#�4�>��.��}Nii&N4�4�&X�I��3i�\d�ޣ���O=:X��c�?]k�?��`�pT�����o{��Q=~CK����R�#�y�t�M��b��ǯS�L��,�tW$�{r�E�̤��X,�4.�2q�_�2p�xL�Qs�E�SO_�20�z��21�z�_��u�æ�(-�������vY&�c��	C��eZ��ѭ�O��M���im������C_Ⱥ��[s����ͨ)L�ϣ'�	!������F��B����o��`!�>�#侗�7��+U}!�yT��B�*�v�,�Ù�)#r�p���'��W��_3��+�驺�+�i,�j$[1l5�լ0l屓��a���h�x$W1\5❏0\屓��᪑f-�T#�	�T}a�;oI`��i������$��x�A�+�>���܇K���%�i�fƋg���2��p3���Ɛ�<V��yY=3}�>�p��.�6���*���53d���k����a4i�@ݘI�c��,����}s�]T����sJo�ġ�0�'�EM��Ս�4q.nдY�~�����抻��&�5~7�gr�F�nm7G�pۻ18jrb4C].U�r�GI�m�Dm,S�:���u��)�m�PM����4T�4�)��BjiQ5�p�P����0�(~�n�z$P�6�u�Æb�� i�1�F"��(D��P���i��>�o��6�vc�6�`�̮�)��Y�xm����]7����q��}��<��V��D�~�eD�K?r� r���s6L侗BB�~��UuB��r�Uy���b�s����}��E����������         �  x����q�@D�RN`]�6G����f�;���+��n@��!���.��K���x#���[���'a��PH	��l�,x����-et�fOXa;�#e�o��el�n�����A�-���N�	�����z%�ʂ�j�HE��2�A~��c�j���t@����aVW�� �ق�2dD��vf0l̠͓:Qc�Jx=���� %8j��8��v�V	��`8�QK���:፹(�������Ϯ�������7V�3���n6�㠊�5d��g:ذ���I������M-S�qn
���x�Z�tpr��hܔ����٢SЂ�Y�"-�n�q���υ�ј��R�n�.�ooD#�q� �ך'� ��� հ<�[V;8q4ޔ2�����m            x���͑��-�{������(↖�l�+���@jH���ܪ8���Yg�e���y�����������?e�OyJ�?Q��S�����u�߾����������o�>�):��:S2�t�f��L��Й���3#3Kgff�ά3��Lr�����%�9h�AhZr�����%�9h�AhZr����AK��'EsГ��9��A���hzrP4=9(����AO��'UsГ��9�A���jFrP5#9����T��H��`$Us0���9�A���ifr�439h���4��L��`&Ms0���9��A���ifr�539蚃�t��J��`%]s����9X�A���kVr�5+9蚃���J��`'Cs����9������`hvr04;9�����N��`'Ss���i9Or0-�I��`<����'9����$�r0��`ZƓL��x��i9Or�,�I�� ���9��`i"9X��H�� ���9��`i"9X��H�� ���9��`kJr�5%9ؚ��l�AI��$[sP���9(�����`kʿģ9H��'��}�H��'��}�H��'��}�H��'��}�H��'��}�H��'��}�H��'��}�H��'��}�H��'��}���������O�/����������O�/����������O�/����������O�/����������O�/���Ɂ������N{r��#9�ӑ���H��t$�w:��;Ɂ��c$����h�?Fr���Ɂ��c&����h�?fr����Ɂ��c&����h�?fr����Ɂ��c&����h�?Vr���XɁ��c%����h�?Vr���XɁ��c%����h�?Vr���XɁ��c'����h�?vr����Ɂ��c'����h�?vr����Ɂ��c'����h�?��@{��$���'9��>Ɂ���I���Or���|����h�?��@{��$���H����h�?#9��Fr�����@{�Ɂ��3���g$���H�K��X�8�ΏO,_�O��'�/Χ����������������t~|b��|:?>�|q>��X�8�ΏO,_�OgI��t��@�OgM��t��@�OgM��t��@�OgM��t��@�OgM��t��@�OgM��t��@�OgK��t��@�OgK��t��@�OgK��t��@�OgK��t��@�OgK��t��@�OgO��t��@�OgO��t��@�OgO��t��@�OgO��t��@�OgO��t��@�O�H��t��@�O�H��t��@�O��'����ϏQ�I��n"�?�����6R���ş��?n�'�M���ҿ��_�I�_��0���{�	6�nk��ߚ`��&��{�	6��k���Z`����{�6��k���Z`�����{�6�.l��[`���6��{�6�nl���`���6��{�6��l��/�`���6��{�6��l=`C���6�m=`C���6�.m=`C���6�Nm=`C���6�nm=`C���6�m��{�`C�
+���V��,� �[X6t��l�~a���
��;�`C����3�6tӰ
��]�*`C����7�6t�
�Н�*`C����;�6t�*���ê`C����?�
6t�*��Ī`C���}�`U��o �
6��U��������V�&�j`C�EXl����}a5��o$�6������������V�f��`C�MXl��	��}?au��o(�6��������:���V����`C�UXl�u���+�}�������?)���D�I���_+�OJ��E��p�-_�Õ^�|�Wz��?\�E��p�-_��5����k�����	6�?\lh�&���pM����`C��5����k�����6�?\lh����p-����Z`C�õ����k�����6�?\lh�6���pm�����`C�õ����lx�����lx��������lh�����~�������lh�����~�������lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh����p����.`C��]�������w��6�?�lh����p����`C��]�������w��
6�?�lh�+���pW����`C��]�������w��6�?�lh����p7����n`C����������w��6�?�lh�;���pw�����`C����������w��'���Γ���~������{��E��O�ǋ�/\��X���I�'Z���cD�u|h�¡��_��q���?&�~aO�ǃ�/���X���9�39��t��@[�=��L�L�1�39оt��@{�=�m=�L���+9��s��@�ν�m;�J���+9Цs��@{ν�m9�J���+9Іs��@�ͽ�m7�N���;9�fs��@{ͽ������$w�yd����<2���g���n3�Lrpw��e��$w�yd>D���S��#V2��&�HU������7�HI���@J���&R�7���0����ĩ=�Y���q����mÑ��Ñ��Ñ��Ñ��Ñ�đ���H�����H���փ�6#6�ۏ#6��#6�[�#6#6�ې#6��#6�[�#6#6���*ظoH�ظoI�ظoJ�ظoK�ظoL�ذ[��vs���`�nO�l������EiO~����ߦ4�q/\�ظ�G
l��#6�����H��{�z��ƽp=R`�^�2��ƽp=R`�^�)�q/\�ظ�G
l��#6�����H��{�z��ƽp=R`�^�25�ƽp=R`�^�)�q/\�ظ�G
l��#6�����H��{�z��ƽ:=R`�^�25�ƽ:=R`�^�)�q�N�ظW�G
lܫ�#6������H��{uz��ƽ:=R`�^�2��ƽ:=R`�^�)�q�N�ظW�G
lܫ�#6������H��{uz��ƽ:=R`�^�2��ƽ:=R`�^�)�q�N�ظW�G
l�K�#6�%���H��{	z��ƽ=R���G	�T<R�[��?� đ*H�o9�E��#G�!e�x�?�đHY6^�?q�R�����B0/�ǟ�8R`C�ʀ���B)��]e����!��Ю2�E���G
lhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�]e���v�/�U�hhW�q�r���6�/�p�hh��g���6�/�p�hh��g���6�/�p�hh��g���6�/�p�hh��g���6�/�p�hh��g���6�/�p�hh��g���6�/�p�h�/�)���h�����/ڋ�hh/𢡽h���E�h�^����E���2-�E{�/Z�-�E{�/Z��,�E�/Z��,�E�/Z��,�E�/Z��,�E�/Z��,�E�/Z��,�E�/Z��,�E��/Z��,�E��/Z��,�E��/Z��,�E��/Z��,�E��/Z��,�E�ʒ^�|q/��-_�(�E��Jz��Ž��^�|q/��-_�(�E��Jz��Ž��^�|q/��-_�(l�'Q�I���5��Dl�'Q�I���5��Dl�'Q�I�����J�����~u��_l��W�I���u��Dl�'Q�I4���� ��*l������    �2���� ��*l�������2���� ��*l���L����2������*l���L����2������*l���L�����������*l���,�����������*l���,�����������*l���l�����������*l���l�����������*l���l��������l���>`C�_��ɪ��MV}��n��6t�U�������d�l�&���MV����`C7Y5��n�j��d� �ɪ6t'Ul�N����R��ۥZ��n�j�]�l�v���ۥZ�c�O��ґ��rH�o�L��o�,�4e#�ـ�S�^�O�WxQ?u_�E��}��S�^�O�WxQ?u_�E��}��S�^�O�WxQ?u_�E��}��S�^�O�WxQ?u_�E��}��S�^�O�WxQ?u_�E��}��S�^�O�WxQ?u_�E��}��S��ǋ�o�U�����Q�ǉ�o�U����Q�Ǉ�o�Ul���Q�ǅ�o�UL���}Q�ǃ�o�U,���]Qu$�90��Ɂ_�Gr�����|&~��|�����OF�?������?�����d���c;������u�����ʌ�~vf�o��r�o���Vr�s+9𿹕���J��k%�w���;]Ɂ������NWr�w[;9�{�����N�>k'~������Ɂ�a����vr�wW;9�{���U{���jOr�[��$z:�=Ɂ�qۓ��=Ɂ�pۓ��=Ɂ�oۓ���=Ɂ�n[$��m��޶Er�[�Ɂ�l[$��m�辶Er���Ɂ�j[$��m�螶��@���$��m%9�m+Ɂ�g[It;�Jr���V��̶��^���@���$��m59Ѝl�Ɂ�c[Mt�jr���V��Ķ�����@���&��m59�l�Ɂ�_[Kt��~\���������g��A�#�2�9�q���?rdFf4?~q��A��ʌ���-�?� 3?fq��A�Lr�ύ�'���zr�ύ�'���zr�ύ�'���zr�ύ�'���zr�ύm$���Fr�ύm$���Fr�ύm$���Fr�ύm$���Fr�ύm$���Fr�ύ39��ƙ�s�L��q&��8�n�Ɂ?7����gr�ύ39��ƙ�s�J��q%�ܸ�n\Ɂ?7����Wr�ύ+9��ƕ�s�J��q%�ܸ�n�Ɂ?7����wr�ύ;9��Ɲ�s�N��q'�ܸ�n�Ɂ>7�'9����$��؟�@����sc�}n�Or�ύ�I���?Ɂ>7�'9����$���#9�S�=�}����Ɂ����i�Ɂ����7��H�to��@���H�do/Ɂ���%9�S��$z����@O����y�^�=��Kr�gy{I�$o/Ɂ���%9�S��&�m4�&z���@O���������9�^�=%�kr�g�{M�p�Ɂ��59�����ˁ����dpO���{�D?��'����>�O��~�|b�����Ol_x�����?>�}�a��'�/<l��������ؾ�����|b�����Ol_x�ޓ�a{O���=9����@{�>��a�H���#9����@{�>��a�H���#9����@{�>��a�L���39����@{�>��a�L���39����@{�>��T�L�S�39�N���@;վ��T�J�S�+9�N���@;վ��T�J�S�+9�N���@;վ��T�N�S�;9�N���@;վ��T�N�S�;9�N���@;վ��T�N�S�;9�Nu<Ɂv��I�SOr���x��TǓh�:��@;��$ک�'9�Nu<Ɂv��I�S�h�:"9�NuDr����@;�Ɂv�#��TG$ک�H�S�h�:"9�~t��@��Q��GGI�%9�~t��@��Q��GGI�%9�~t��@��Q��GGM�59�~t��@��Q��GGM��ؿ�;���~g||b��O�_������3>>��w��'�/���������ؿ�;���~g��@��ђ�wFK��-9�~g��@��ѓ�wFO��=9�~g��@��ѓ�wFO��=9�~g��@��ѓ�wFO��#9�~g��@��1��w�H��#9�~g��@�ٍ�h'4Fr���ɁvBc$�	��h'4fr��ИɁvBc&�	��h'4fr��ИɁvBc&�	��h'4fr���XɁvBc%�	��h'4Vr���XɁvBc%�	��h'4Vr���XɁwB+9�Nh'�	���;��x'���vr���N��ɁwB;9�Nh'�	��@;��$�	�'9�Nh>ɁvB�I��Or���|���h'4��@;��$z�n>Ɂ�H3��f$�#�H�G��h�4#9�iFr�=Ҍ�@{�Ɂ�H3��f$�#͒h�4Kr�=�,Ɂ�H�$�#͒h�4Kr���fI�\�,Ɂ�K�%9�si���^l~|��͏O_x����/6?>q|����'�/��������8��b���^l~|��͚h/6[r���lɁ�b�%ڋ͖h/6[r���lɁ�b�%ڋ͖h/6[r���lɁ�b�'ڋ͞h/6{r����Ɂ�b�'ڋ͞h/6{r����Ɂ�b�'ڋ͞h/6Gr���Ɂ�bs$ڋ͑h/6Gr���Ɂ�bs$ڋ͑h/6Gr���Ɂ�bs&ڋ͙h/6gr��؜Ɂ�bs&ڋ͙h/6gr��؜Ɂ�bs&ڋ͙h/6Wr���\Ɂ�bs%ڋ͕h/6Wr���\Ɂ�bs%ڋ͕h/6Wr���\Ɂ�bs'ڋ͝h/6wr����Ɂ�b;9�^l'ދ���{��x/����vr���z���֓h/���@{��$ڋ�'9�^l=Ɂ�b�I�[Or���z���֓h/�"9�^lErp�b����!�\���Lrp�b�3��ŋ��$/�;�\���Lrp�b�3��ŋ��$/�+S�����ߙ��r��w&9��?��I.�Og���v��w�g�#3�3����ʌ�vf�o!}��/���Df�o!}����������o���$��;�\\��Lrpqi�3��ť��$��;�\\گL���_]��I..�w&9���ߙ����~g���K��I..�w&9���ߙ����~g���K��I..�W��絓��������絓����џ��'�k'�;�3�?�������y�$~gVf����絓��Ɂ_GGr��ё�ut$~Ɂ_GGr��ё�ut$~Ɂ_GGr��љ�ut&~�Ɂ_Ggr��љ�ut&~�������I.���Lrp�$~g��K'�+���K'�;�\:�ߙ���I��$�N�w&9�t�3������I.���Lrp�$~g��K'�;�\:�_��\:�ߙ���I��$�N�w&9�t�3������I.���Lrp�$~g��K'�;�\:�ߙ���I���$�N�w&9�t�3������I.���Lrp�$~g��K'�;�\:�ߙ���I��$�N�w&9�t�2�\:�ߙ���I��$�N�w&9�t�3������I.���Lrp�$~g��K'�;�\:�ߙ���I�ʔ���I��$�N�w&9�t�3������I.���Lrp�$~g��K'�;�\:�ߙ���I��$�N�W�&�N�w&9�t�3Ɂ�$vMt'�kr�;�]��I��Nb��@w�&���59Н�nɁ�$vKt'�[r�;�ݒ�I��Nb���2{�;�\f�g������Lrpy'��̿�މ�+�>��2;}��ev�D���􉾗��}/��'�^f�O���N��{��>��2;}��ev�D���􉾗��}/��'�^f�O���N��{��>��2;}��ev�D���􉾗��}/��'�^f�O���N��{��>��2;}��ev���_���I�O��o��w&9�>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w���>q�O�w�İ>�?����7�X��f��    �Lr`}�I�O|3Ɂ��o&9�>��$�'������7�X�؟�a}�I�O|3Ɂ��o&9�>��$�'������7�X��f���Lr`}�I�O�O�İ>��$�'������7����32o�e�����������'.?#�fVf4�����L>>q��7�ь~|��32o&9�g�7��3�I���$�L�f�{�}3Ɂ=Ӿ����i�Ӓ{�}3Ɂ=Ӿ����i�Lr`ϴo&9�g�7��3�I���$�L�f�{�}3Ɂ=���'�L�f�{�}3Ɂ=Ӿ����i�Lr`ϴo&9�g�7��3�I���$�L�f�{���H���$�L�f�{�}3Ɂ=Ӿ����i�Lr`ϴo&9�g�7��3�I���$�L۟��3�I���$�L;���Ɂ?�����igr�ϴ39�gڙ�3�L��v%�L���]Ɂ?Ӯ���iWr�ϴ+9�gڕ�3�J��v%�L����Ɂ?�����iwr�ϴ;9�gڝ�3�N��v'vF��$vF��$vF��$vF�Ǔ��7���7���7���7���7���7���7���7���7������7���7���7���7�/z����hbdFs33��X���Ό�<���Ȍ栔�h�'��7�h_��ƛI����z��$�WE�D=��#}���x3Ɂ�U�>Q�`���@��H��g0�Lr�}U�O��o&9��)�'�y�7�h���<śI�{��z���$�=E�D=O�f��"}���x3ɁvO�>Q�S���@��H���)�Lr��S||���3��O�_tF�����(>>q���'�/:�����Eg��������Q||���3��O�_tF1��Ɂ���?�Gr���#9�����g�H�3x$�<���Ɂ���?�gr�;��Ɂn���?�gr���39������L�s{%������^Ɂn���?�Wr���+9������J�s{%�������Ɂ�b'������'vr����Ɂ�b'������'vr����Ɂ�b'��)Or����$��)Or����$��)Or����$��)Or����$��)Or����$��)����Dr���Ɂ�J$��)����Dr���Ɂ�J$��)����Dr���R����������@�?�$��)%9��O)Ɂ�JIt�SJr���R����������@�?�&��)59�w��Lr`�H����ޑ~3Ɂ�#�f�{G��$����I��7����wU����������&����@JK� ���V���TkH��u����R��j)��m뿔�7�m������pJ��6��)lh�S:��.�t��mN�`C�����6:���tJ��6��)lhKS�О���MM`C��2���5e��k� �ؔ�a#��_�FJ��AJ� 3��l̂�fcV�4�!�٘)��Hi6��/�l�������_�����~�_`ï�l�u~���/����6�:���_����l��l�������:l����6�:���v�e�m���ϗ6����Ў�>`C[������6������;�6���Ў�>`C[������6��6���6���6���6���6���6���6�=�6�ů6�ǯ6�ɯlh�_��6���}~-`C�Z��v���m�k���6�ٯlhO_�Ц�V��]}�`C��Z������m�kڿ�
6���lh7^+��v�V���x�`C����v䵁m�kړ�6�)�lhW^�ж�6��}ym`C����v流�f�^;���Zj�fK�`C�m�l��-��}��v��o��6�������R;���\j��K�����Hi6FAJ�1*R��ѐ�l���fc�4c"�ـ�w_*����R�E���
/�o�TxQ��[0^�߃���&L��wa*���S�E�}�
/�o�TxQ'��[1^T���M���*���OS�E���
/���TxQ���{5^�߬���nM���k*���_S�E��
/���TxQ˦�{6^�ߴ����M��o/�^4�	l���o
lh���E�I����^T���M�m��~3��6xQ�v�/��O��E�J��Gi��o)m��=�^Կ�����w�6xQ���/��W��E�K���h��o m���^Կ�������6xQ�&�/��E��E��H��i��o$m����^Կ�������m𢡧x�hhW��EC��/�U6x�Ю������^4�ul𢡭c�m�hh���EC��/�6x��&����6�^4�	l�M`�m�hh��EC��/�6x��&����6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�^�h��E�6�-�h�b��-_L ����	�^�|1��ҋ�/&�[z���rK/Z��@n�E��-�h�b��-_L �6�ʶ��_�6��+�~e�`ïll��m���m��W�6�ʶ��_�6��+[��^��6�����;����q�l莣?`Cw������G���8�6t��l莣��G��;�`Cw=���8z��q� ���6t��l莣��G/`CO;�6t3����H/`C7#��݌�6t3����H/`C7#��݌�6t3�+���H�`C7#��݌�
6t3�+���H�`C7#��݌�
6t3�+���H�`C�H�6t����}Jo`C�)��ݧ�6t����}Jo`C�)��ݧ�6t����}J�`C�)��ݧ�6t��;��}J�`C�)��ݧ�6t��;��}J�`C�~�6t���-L`C�0}����6t��г�}����6��w`C7>}����6t��'�ЍO�`C7>}����	6t��'�ЍO�`C7>}����	6t���l���/�g�;������~��Ë���/�g�;������~��Ë���/�g�;������~��Ë���/�g�;������~�������e� ��I�Oc �?����4R���H�_��xџ������I�_��xџ������'�)���2��)���2��)���2���`C7#��nF�� � �A6t�0l�a|����	'�F���I��������ER�Ï�Ii?^�'�9�xџ����ERW���ԕ�#��K�ר#6�kԑ�5�H���u���}�b����u���}�:R`�F)�q_��ظ�QG
l�ר#6�kԑ�5�H��{�y��ƽ�d���{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�d���{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�dj��{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�dj��{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�dj��{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�dj��{�y��ƽ�<R`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�Dj>`��r)�qo9�ظ��G
l�[�#6�-����H��{�y��ƽ�<R`��r)�qo9�
�qo9�ظ��G
l�[�#6�-����H���-�Hi6�E�h9��BJ�/�G����-�
�4���G�"�ـ���<R`C{�	/�G�y�����^��H��E'��-�ڋNx�?�pu�����^�7\)������WG
lh/:�E�x�ՑڋNx�?�pu�����^�7\)������WG
lh/:�E�x�ՑڋN    x�?�pu�����^�7\)������WG
lh/:�E�x�ՑڋNx�?�pu�����^��b)������XG
lh/:�E�x/֑ڋNx�?ދu�����^��b)������XG
lh/:�E�x/֑ڋNx�?ދu�����^��b)�����E'��o�:R`C{�	/��۴����mZG
lh/:�E�x�֑ڋNx�?ަu�����^�i)����L/Z��#:R)���^��5Gt�)�az���ё�HiӋ��戎TGJs�^�|1G4Ӌ�/�������>/�l���z��>/�l���z��>/�l���z��>/�l���z��>/�l���z��>/� ���l���
����+��>/� ���l���
����+��>/� ���l���*`C��W���
����U��>/�6�yy���˫�}^^l���*`C��W���*����U��>/�
6�yyU���˫�}^^l���`C��W���*����U��>/�6�yy5���˫�}^^l���j`C��W����������>/�6�yy5���˫�}^^l����`C��W���:�������>/�6�yyu���˫�}^^l���`C��6��`C��6��`C��6��`C��6��`C��6�њ`C��	6�њ`C��	6�њ`C��	6�њ`C��	6�њ`C��	6��Z`C��6��Z`C��6��Z`C��6��Z`C���~�h���9�/�����#Z�~�h���9�/�����#Z�~�h���9�/�����#Z�~�hË�9�/��6���#��~�hË�9�/��6���#��~�hË�9�/��6���#��~�hË�9�/��6���#��~�hË�9�/��6���#��~�hË�9�/��6���#��~�hË�9�����7������'R��_H�O~#�?�����HR���x���]�TEJ�*?^t��F�#6��|W���l��y�i^���7���l��y�i����7���l���ǋ��j��xџ�&��ER����Ii�>^�'���xџ�&��ER����Ii�>^�'���x�R~��`ï6l�զ���t��W�6�j3��_m��� ~�`ï6l��f������l��� ��0��?;L���l�����0��?;L���l�����0��?;L���l�������?;,��g*�z�b/��g*�z�b/��g*�z�b/��g*�z�bo��g*�z�bo��g*�z�bo��g*�z:bo���#�z:bo�a�#��;�����xS`�NG�)�a�#�ذ�o
l��76�těv:�M�;��������R�� v:�M�;�����xS`�NG�)�a�#�ذ�o
l��76�těv:b<l��76�těv:�M�;�����xS`�NG�)�a�#�ذ�o
l��76�t�x*ذ�o
l��76�těv:�M�;�����xS`�NG�)�a�#�ذ�o
l���4�a�#�ذ�o
l��76�tě��=�:R�xQ=�&R�xQ=�6R�xQ=�)�����xS)�����xS`��76��|S`��76��|S`�������76��|S`��76��|S`��76��|S`��76��|S`��76������xS`��76��|S`��76��|S`��76��|S`��76��|S`�������76��|S`��76��|S`��76��|S`��76��|S`��76��Oz�/�쿩@J�E�����*R��H/�ŝ�7Ցҿ���_��S)�KI/�ŝ�7��K��W<`C��z��л�x���}�6��+��w_����l��W<`C��z�6��+l��W�л���w_`C�"���}E���� z�6��+l��W��w_Q���}Ez�l��W��w_Q���}Ez�l��W��w_Q���}Ez�l��WT��w_Q���}Ez�l�~�M��/�)�a��76l������G4�a��)�a[�76l+����m���Эt4��[�h`C�����n����JG���6t+l�V::�Эtt��[��`C�����n����JG���6t+l�V:�Эt��[�`C��1��n�c��J� ���6t+l�V:�Эt��[�`C��1��n�c��J����	6t+l�V:&�ЭtL��[�`C��1��n�c��J����6t+l�V:�Эt,��[�X`C�ұ��n�c��J����J��o�^Է�/�[���t���V:�E}+𢾕xQ�J��o�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է�^Է���E�7����FJ_/:�����)�}}����6���H����E�7���TGJ_/:������)������6�:_��_�+���|~��`ï�l�u����W����
6�:_��_�+���|~�o`ï�l�u��Eg|��~��O�)�i���1���BJ�R>^�'�)/��ҿ���I�_�ǋ���h~�`ï�l�U����v��W�6�*���_E��� ~`ï�l�Ut�����W�6�*:��_E���6�ny��[�`CO�	6�<@�`C��	6�<@�`C��	6�<@�`C��	6�<@�`C��6�<@Y`C��6�<@Y`C��6�<@Y`C��6�<@Y`C��6�<@Y`C��6�<@�`C��6�<@�`C��6�<@�`C��6�<@�`C��6�<@�`C��l�y���=P����6�<@}������� �z�>`C��l�y���=Pl�y�`C�� z���� 5����6�<@���j�=Pl�y�`C��6�<@-`C��6�<@-`C��6�<@-`C��6�<@-`C��6�<@-`C��
6�<@�`C��
6�<@�`C��
6�<@�`C��
6�<@�`C��
6�<@�`C��6�<@m����j+Hi6�E�<@��� ^��TxQ?P�E�<@��� ^��TxQ?P�E�<@��� ^��TxQ?P�E�<@��� ^��TxQ?P�E�<@��� ^��TxQ?P�E�<@��� ^��TxQ?P�E�<@M/��՚^��;�5��7wTkz�o������Q��E���ZӋ~sG����jM/��՚^��;�u���N����6�ڻ��_{��k�~�]`ï�l��w���.����6�ڻ��_{7��k�~��`ï�l��w��.�6t�T7���R�`C�Q�l�N�n��;����I�l�N�=`CwR���j�НT{����6t'���;����.�l�v����R��ۥ`C�K-��n�Z��.� �]j6t��l�v����R��ۥV��n�Z�v�06��ґ�v�H��{�t��ƽ]:R`��.)�qo��ظ�KG
l��%�*ظ�KG
l�ۥ#6��ґ�v�H��{�t��ƽ]:R`��.)�qo��ظ�DG
l�{"�ظ�DG
l�{�#6�=ё���H��{Ot��ƽ':R`��)�qظ�DG
l�{"�:ظ�DG
l�{�#6�=ё���H��{Ot��ƽ':R`��)�qظ�DG
l�{"�ظ�DG
l�{�#6�=ё���H��{Ot��c㏞�H�4c"�ـ��':R)���=ё
�4/����u�*R�3�x�����#Ց��@��)�.�����E��w���x�����#����H����=R`��{�ظ��#6��H����=R`��{�ظ��#6�6��H����=R`��{�ظ��#6��H����=R`��{�ظ��#�a��\Gj#e?�����    \G*���a�x���M�#U���a�x���M�#Ց�������\Gj���ko��^{�6���l起��ko����`C��=��^{{���� z��6���l起��ko/`C�������6�����ko/`�޵)�q�ڎظwmG
lܻ�#6�]ۑ����
6�]ۑ���H��{�v��ƽk;R`�޵)�q�ڎظwmG
lܻ�#6����ظ7tL5�qo�ظ7tG
l��#6�ݑ���H��{Cw��ƽ�;R`���)�qo�ظ7tLu�qo�ظ7tG
l膮w������n�z���l膮w������n�z���l膮���>��n�� ���l膮���>��n�� ���l膮�q�������l膮O���>��n�����l膮O���>��n�����l膮/������n�����l膮/������n�����l膮/������n�����l膮o������n�����l膮����]�)���o�:��o���o���o���o���7��TCʲ1�E���u���6�^�\G
lh�9�E������7���Іs���q��H�m8��7���Іs���q��H�m8��7���Іs���q��H�m8��7���Іs����f�#6������#6������#6������#6������#6������#�/�(<R)�}���F�ZH��k#������(<R����ҋ�y��HU��o9��7
���{�6����h`����{�6�����`��:��{�6�����`��:��{�6����`����{�6�`��`����{�6�`��`����{�	6�`���`��&��-�`C��c��r�	6t�9&��-�`C��c��r�6t�9��-�X`C��c��W�6t_9��}�X`C��c��W�6t_9��}��`C��c��W�6t�86�����`C7�c��<�6t�86�����`C7�c��<�l��q>`C7���y�����|��n�6���������E�Ww+�ǋ��V̏�_ݭ�/���[1?^tu�b~����n��x���݊�������E�Ww+f�}�6��w��'�`C�|g��;��'�Y��>��6��w��O���}�l��,`C�|g��;��'�Y��>��
6��wV��O���}�l��`C�|g��;+��'�Y��>��
6��w�����H���V���]�"���R��֑�̷��f�M�4�m!��o���Vv�៕l�ge�Y���Vv�៕/��]�ǋ����1���B�)�i|��OJ�R>^�'�)/��ҿ���I�_�ǋ���6�/e��K`��R��6�/e����`��*'���	6��r����`��*'���	6��r����`��*���6��r���\`��*���6��r���\`��*���6t�27��}��`C�)s�ݧ�6t�27��}��`C�)s�ݧ�6t�27��}��`C�)��OY��}�z���5���[����¬l�f=`C�0���Y��-�z��naV��¬ ��Y6t�l�[c+���nV��ݬ ��Y6tw�l��f����*`Cw7���ݬ6tw�
����*`Cw7���ݬ6tw�
����*`C�5[l�f��}�lU��
6�]�U���k�*��w�V��٪`C�5[l�f��}�lU��6�]�����k���w�V���j`C�5[l�f��}�l5��6�]�����k�:��w�V����׋~5Ž���_Mq���WS�+��7~~���ϯ������^�?�ҋ~��Wz�o��J/���_lh����q����`C[�5����k�m� �:�6�u\lh�&���qM����`C[�5����k�m��:�	6�u\lh�&���q-����Z`C[ǵ����k�����6�?\lh����p-����Z`C�õ����k�����6�?\lh�6���p��7���p��7���p?`C������6�?����p?`C������6�?����p?`C�����w��w��w��w�mw�mw�mw�mw�m���g���������'��E?)���񢟔��~��'���/�I���ǋ~R���񢟔��~��'��?^�'��z��}��l�ޮ`C��v���+��g�]��>��
6�YoW���z��}��l�ޮ`C��v�����g����>��6�Yo7���z��}�����W3����'?���B��)���)���@J� ���"������+v~��`ï�l����bw��W�6��=��_���+� ~�`ï�l�{��b��W�6��=��_�'��+�~Ş`C۹=���s{�m�����	6�L��`C;�=��vz{�������6���lh����No/����^`C;����vz{�������6���lh��7��Noo�����`�;�6���`�;�6���`�;�6���`�:��<`�:�76��{S`�:�76��{S`�:�76��{S`�:�76�L����)�aM�|lX����5�o
lX�����	|S`���)�ag�ذ3�o
lؙ�76�L��v&p>lؙ�76�L��v&�M�;�����	|S`���)�ag�ذ3�o
lؙ�76�L�|*ذ3�o
lؙ�76�L��v&�M�;�����	|S`���)�ag�ذ3�o
lؙ��4�ag�ذ3�o
l��Ͽ)�a�?���c#����TGJ�/��?��&R�xQ���7���l��b��MR��H/��盪H�O#��3�o�#�)�E���|S)�KI/�������%�� ��)�a-���)�a-���)�a-���)�a-���)�a-�|&ذ��M�k��ذ��M�k��ذ��M�k��ذ��M�k��ذ��M�k������o
lXK������o
lXK������o
lXK������o
lXK������o
lXK<�6�%~S`�Z�76�%~S`�Z�76�%~S`�Z�76�%~S`�Z�76��}S`���ذ��M��{�ذ��M��{����6��lh��о7��}o<`C����}o�о7lh�6�� ��F��{#����`C����}o�о7
�о7
�о7
�о7>^4���}S)��Ց��])��5����h|3=��6R����o�g�T ���x��fz�M�}ʎ
6�);*����`C����}^�
6�y9*����h`C�|��}�6�6��g�h`C�a��}��6�6>^4����ER����I�O��ER���xџ���?^�'�?���I�O��ER����?)�~��?)�v����6�z�����1��_E��� ~`ï�l�Ut�mc�������6�u�6��=��_�'��+�~Ş`ï�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�lh�l���76���6���`û�6��,�Ю�<`C����*�6��,�Ю�<`C����*�6��,�Ю�<`C��`C��`C��`C��`C��`C��`C��`C��`C��`C��`C��R��v���=�Z
�г���=�Z
�г���=�Z
�г���=�Z
�г���=�Z*�г���=�Z*�г���=�Z*�г���=�Z*�г���=�Z*ظϦV���}6��6G
l�gS�ظϦ)�q�M=R`�>�z���}6�H�����Gj"ue�H-�4�̦2/��l�
�4�q7�G�"��exѸ�#�q7�G
l��w�y����:    )�q��L����:)�q��G
lܭ�w�x����)�q��G
l���wx��e����#��ҟFz�?g��T �?����~���f>�蟳�G�#��O/���������5��_�&��k���H��{s���_����~=\`ï�l��p��.�qoa����~�`ï�l�Ut��{s��ƽ�9R`���)�qoa�ظ�0G
l�[�#6�-R���H��{s��ƽ�9R`���)�qoa�ظ�0G
l�[�#6�-̑��H��{�T��{s��ƽ�9R`���)�qoa�ظ�0G
l�[�#6�-̑��H��{s��ƽ�a���{s��ƽ�9R`���)�qoa�ظ�0G
l���#6�}ʑ�>�H��{�r��ƽOa���{�r��ƽO9R`�ާ)�qoF�ظ7#G
lܛ�#6��ȑ�f�H��{3r��ƽa���{3r��ƽ9R`��q)�q�8�ظwG
l�;�#6�Ǒ���H��{�q��ƽ�`���{�q��ƽ�8R`��q)�q�8�ظwG
l�;�#6t�Q;��G�`Cw���q�6t�Q��G`Cwu��q���㨣#��)�ƘHi6�E}�Q�E}�Q�EC[�
/ꛑ
/ꛑ
/ꛑ
/ꛑ
/�:VxQߌTx��ֱ���^Է0^Է0^Է0^Է0^Է0^Է0^4�u�𢾻�𢾻�𢾻�𢾻�𢡭c�m+�hh�X�EC[�
/�:Vx��ֱ�����#�hx�/�:6x��ֱ�����^4�ul𢡭c�m�hh���EC[�����{�Gj!���6R������{�G*��D}�h���Hi�>^��}c�H��Rz��>^��}c�H��Ki6�.�����V���9�6�Ρ��� ���hl�=@+`C�Zz�
��{�V����6��U��� ���hl�=@�`C�Zz�*��{�V����
6�����`����{�6����h`����{�6t��>^��}#�HM����B��n�4�/Z���)M�ǋ��o�������E��7�T�/��l��F~�����ot���H`��R��V����6l��� ڊ�6��h��#`����{�6��f����`��m&��{�	6��f����`��m&��{�	6��f����`��m��{�6��f���Y`��m��{�6��f���Y`��m��SUm�=U�6��SUm�=U�6��SUm�=U�6��SUm�=U�6��SUm�=U�6��SUm�=U������6�TU���n��z�?`C�b�l�Y���=����g��6�,V�����6�,V�q��~������6�W��'�z�=��l�	�`COp� z����\��=��ظ�m?R`C�}�6��W/`C�}�6��W/`C�}�6��W/`C�}�6��W�`C�}�
6��W�`C�}�
6��W�`C�}�
6��W�`C�b�
6�,V�`C�b�
6�,Vo`C�b�6�,Vo��z������ZCJ��[GJ���E�,V���X^��buxQ?���E�,V���X^��buxQ?���E�,V���X^��buxQ?���E�,V���X^��buxQ?���E�,V���X^��buxQ?���E�,V���X^��buxQ?���E�,VO/��M��^����=��77�{z�on���������E����Ӌ~sӿ���O/��M��^����}���/����6�:���_�����~�_`ï�l�u~��n����6�z���_7����~=�`Cw7}����6t��7��}J�`C7#������x���8�6t�1��;���V�l��a<`C���w�н���{�`C�#���F��;� �A6t�0l�a������`C7����6t0
��]�(`Cw����6t0
��]�(`Cw����6t0*��]��`Cw��m�G��
6��lh??*��~~T�����`C;�Q���أ���G�c�6��lh�=����G�~�6��lh�=��{4��=�����=�联��zAJ�6�"���ސ�kT�H�o�����'R�[�)�-�ǆ7�c�m*� �T�6��lhS1�Цb��M�`C��1��6c�m�� �H�	6����HxQo���7�^��/���Fz��z#=�E���/�oxQ;x�����^��������|���{;�E���/�������^4�l�o{�ECϦx���^4�#���E�;"x����_/Z�i�ƿ^�~�.��h��]��z��M�4�����vi��E�7=��׋�oz������D�_/Z���^�~���l�}�|���G�l�}���wD3���� zG4l����wD3���� zG4?^�~�������w,̏�_�ca~�h����E��K�H�4�/Z�z3��x��՛�ǋ֯��0?^�~�f�Y��_�
��'�Y��_�*��+[~e�`ïll��`ïll������U��W�
6��V��_��Ч����>��6��m6��Om��}j�l�S�l`C��f��6���l`C��f��7;�����`C7���}��l�s��`C�+�ǋ֯ޱ0?^�~�������w,̏�_�ca~�h����E�W�X�/Z�z���x���;�ǋ֯ޱ0?^�~���9���9��wl��� ~�0���9L��wl����$5���oL���l���~�1���oL���lh�<��6�.e��KY`��R����6�~c���X`��7����6�~c����`��76����6�~c����`C{�����s�����c�lh����=�z������c�lh����g�6���z���u\���XX���+����\6��
��'$W�=!�l�	�`C�ca��s�+����\6�\�
���*Wz�r���*Wz�r���*Wz�r���*Wz�r���*W���=��*��Ә��=��*���XXl��U����\l��U��~�ª`C�caU���EW����������M]l�������M]l�������M]l��������:��=Ѻ���sXl�9������]l�9������]�?6B���ޑ�l����9,xQ?=��E����ӳ^�O�.xQ?=��E����ӳ^���.xQ?��E���s�^���.xQ?��E���s�^���.xQ?��E���s�^���.xQ?��E���s�^���.xQ?��E���s�^4��\�~v���9�/��J΂�ӳ^�O�.xQ�Wr���+9^�O�.xQ?���EC�/�'u����]�~Rw���I�/�'u7������~RwË�I�/�'u7�hhù�EC�/�pnx�ІsË�6�^4�����m87�hhù�EC�/�pnx�ІsË�6�^4�����m87�hhù�EC�/�pnx�ІsË�6�^4�����m87�hhù�EC��/�Unx�ЮrË�v�^4����]��*7�hhW��EC��/�Unx�ЮrË�v�^4����]��*wz�o�V�Ӌ~s�h���>�N/��}��^���D;��7��vz�o�V�Ӌ~si����N/��-����v_��m�v�b�6���lh��;��k��-�`C[�=���X{�m�� �b�6���lh���>j��}�`C��=���Q{�����G�	6���lh�'��>jO��}Ԟ`C��=���Q{�����G�6���lh���>j/��}�^`C������Q{����>j��6��>j��6��>j��6��>j��6��>j��6��>j������ذ>�M���ذ>�M���ذ>�M���ذ>�M���ذ>j=6��zS`���76��zS`���76�YzS`Ú�76�#zS`�:�    76�#zS`�:���aћ��)�aћ��)�aћ��)�aћ��)�aћ����;������g{S`�γ�)�a���ذ�lo
l�y�76�<ۛv��M�ǆ�g{S)�F{��l�@J��
R��V��l���y�7Ց�l���y�75��l���5�o
lX�xQ=������o
lX������o
lX������o
lX�����6����)�q��L���1w���}
�H���u<R`�n�ظ[�#6���H���?<R`���ظ��#6���)x�?�َظ��#6���H���?<R`���ظ��#6�&�H���	<R`�n�ظ;=��E��1;R`���ظ;�#6�N�H����;R`���ظ;�#6�v�H����;R`�n瘂�cZ�H����;R`�n�����ە븲-��1g�/�;.٥�����{IQb"0��8۹�g;�R`�l�R
l��\J����K)�q�s)6�v�/��K)�q�s)�a���}�R)�ɗ_/�^�>J�����˯m�w��B�������yu�ԯm���TAJ_l��))6�디�uJJ���:%���y��R`C�SJz�R
��k�R��^;�
6�ڡT�����=c�
6�[*��l�`CϢ��=��
6�,Z*�8�J3����`˯m�����H�ׯ}��;�:R��5����z���Sj!�9�����~��FJ�F�z���S
l�gJgc�R`�?�:��O�6�����$�`�?�:��O�6��h�m�� ژ�6�So���`�?���O�6�=��ڳ�6�g+lh�V&�О�L��g�	6�g+l�`��s.���v_e�?oL��獏��7��FJ_/��o�O����[�x��~C~J5����ǋ����Sj ���x��~�}J-�������/�៰6�6�����O� �	`�?+l��^�����z6��+���l��)l�g������޻)l轛���_�n��zl�������|�$�/����r�xџ����ǋ���\?^�'e����?)�-׏�I�o�~��O�~���ER�[�/�_J?��6�����_����l��h-`C?+k�YY����Z��~V�6�����W������l��h�`C?�k��\+����Z��^��
6�ӼV��W�����l�ɡV��'�����jzr�l�ɡ6��'�����jzr�l�ɡ6��'����^/�6�z�v���|�`C��������0�l�I�`C7Lj�aR;������n��6tä�q>5�R`C�R� ��R�н�:����6t/���{)u��K�l�^J`C�R���R'�н�:����	6t/�N��{)u��K�l�O���8�K)�q>5�R`�|j��6Χ�R
l�o1J)�q>k�R`�|�,�������经R
l�ϵ��8�kK)�q>זR`�|��� �sm)6���R
l�ϵ��8�kK)�q>זR`�|�-����\[J��󹶔�sm)6��ژ�`�|�-����\[J��󹶔�sm)6���R
l�ϵ��8�kK)�q>זR��(�sm)���l4xїsm)U��l4xїsm)Ր�l4xїsm)5��l4xїsm)���l4xїsm)6�m�/��R
lh/��E_ε���^�����kK)���h�}9זR`C{�/�ϵ5xQ�����sm^ԟkk��\[������?���E_nwO)���h������?��E�i�/�O�5xQ�����p^ԟ�k��4\���������)6�m��]�-ڋ6xQ���y�o���ϋ~�%n^��.q���t�۟��K����7]���E���?/�M���y�o���ϋ�/�|� ~�`��6l��f�?���g�6�l3���m��� ~��`��6l��f�?�L��g�	6�l3���m&���~��`��6l��f�?�,��g�6�l����m���~�Y`��6l��f�?�,��g� ~�	��g� ~�	���|[����l�=�`C��� zϷ��{�-����ml�=߶����ml�=߶����ml�=߶����ml�=߶����ml�=߶�������{��zϷ_`C���l�=�~����/���|�6��o��������{��z����wo{z����wo{z����wo{z����wo{z����wo{z��W��wo{z��W��wo{z��W��wo{z��W��wo{z��W��wo{z��7��wo{z��7��wo{z��7��wo{z��7��wo{z��7��wo{�ǆ߽��BJ�/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��~��Ë���/�wo;��߽��^��[��������E�����zѯn��^��[��������E�����z���y���E�7�a����ƿ`�Ol��a�?9l��'�6�����6���~r�`�Ol��a�=9�l��a\`CO�zr�Гø����6��0.��'�q�=9�l��a\`CO��=9�6��0
�Г�(`CO��=9�6��0
�Г�(`CO���7:
��{����7:*��{����7:*��{����7:*��{����7:*��{����7:*��{����7:��{����7:��{����7:��{����7:��{����7:��{����7::��{����7::��{����7::��{�����9:�л�����9:�л�c���9~��W��_/�ս��׋~u/����_�K<~��W��_/�ս��׋~u/����_�K<~��W��_/ھ��	6�zyL����c��^l���`C���z�<&����1��^/�	6�zy,����c��^^`ï�?^t|u���x���m���E�W����_ݶ:>^t|u���x���m���ER�Ï_��:>^t|uG��x����#����
���l�ߨ �7*����
���l�ߨ6�o��7j��������`��Fm�����m�����m���޼��vz����lh�7/���޼��vz����lh�7/���޼��vz����6�ӛlh�7��No����,`C;�Y��vz����f���6�ӛlh�7+��NoV���ެ`C;�Y��vz����f��͏�iy~��O��R��p#���xџ����ER�ޏ�Iiz?^�'���xџ����E�K�iy6���������gzZ�l�iyv���������gzZ�l�iyv���������gzZ�l�iyv���������� zZ�l�iy���6��<�������� ~Z`�O�l�iy�?-O���	6��<����'����~Z�`�O�l�iy�?-O���	6�����������~Z^`�O�l�iy�?-/���6���������;�3����6����w�g��>l��`C�� z|��;�3����6���`C��6���`C��6������zn��w��z�}n��w��z�}n��w��6���u�}�x]`C�)^��g��6���u�}�x]`C�)^��g��6���u�}�x����6���U��>S�
��g�W�L�*`C�)^l�3ū�}�x����6���U��>S�*��g�W�L�`C�)^l�3ū�c��3�^ԟ)^��L��g���?S��E���/��/xQ�x���3�^ԟ)^��L��g���?S��E���/��/xQ�x���3�^ԟ)^��L��g���?S��E���/��/xQ�x���3�^ԟ)^��L��g���?S��E���/��/xQ�x���3    �^ԟ)^��L��g���?S��E���/��/xQ�x�����h�^t�����h�^t�y�oZ��ϋ~��^^�����ߴ�ן��Ž���7-���E�iq�?/�M�{�y�oZ��ϋ~��^l��&���ml��&���ml��&���ml��&���ml��&���ml��f�?�l��g�6�l����m6���~��`��6l��f�?�l��g�����m�z��l��&.��g�����m�z��l��&.��g�����m�z��6�ll�=�(`C��Fz�7
��{�Q����6��o���|����l�=ߨ`C��Fz�7*��{�Q����
6��oT���|����l�=ߨ`C��Fz�7��{������6��o4���|����l�=�h`C��Fz�7��{������6��ot���|����l�=��`C��Fz�7:��{������6��ot���|c���l�=�`C��� z�7��{�1����6��o���|c���l�=ߘ`C���z�7&��{�1����	6��oL���|c����~�7f �ـ�{�/��|^�������xQ���~�7�E��o���=߀�{�/��|^�e�w /���R`��ES
l��hJ���M)�q��)6�^4���ً��8{єg/�R`��E��}��M)�q��)6�^4���ً��8{єg/�R`��ES
l��hJ���M)�q��Hmxї=ߔg/�R`��ES
l��hJ���M)�q��)6�^4���ً��8{єg/���˞oJ���M)�q��)6�^4���ً��8{єg/�R`��ES
l��hJ���e
^���hJ���M)�q��)6�^4���ً��8{єg/�R`��ES
l��hJ���e
^���hJ���M)�q��)6�^4���ً��8{є�������ZH��+����FJ_�^��})U�ҟ��}_@J5��_�}_@J������^!�6�
qw��W����B�l��`C�� z����+�=��^!�6�
q��W�{��B�l��`C��z��'��+�=��^!�	6�
qO��W�{��B�l��~�8��_!N��W�l��~����_!.��W�l��~����_!.��W�l��~�`ïl�b��B��W�6�
1��_!��k� ~�`ï�l���~����_�m���z�^������H��_/�~wzJM�����E��NO�@��)�-��׋�ߝ�R)�-ߩ�/e�w
lصÝv�p���];�)�a�w
lصÝv�p���];쫀�v�S`î�ذk�;6���N��v�S`î�ذk�;6���N��v�S`î�U��];�)�a�w
lصÝv�p���];�)�a�w
lصÝv�p���];�)�a��j`î�ذk�;6���N��v�S`î�ذk�;6���N��v�S`î�ذk�}u�a�w
lصÝv�p���];�)�aw��ذ+�;6���N��v�S`î����=#L}��|�HJ��g����=#)Րҟ�ǋ������@J�/:��3�R)������=#)6�<?����'����~��`���l�y~�?�O����	6�<?����'����~�_`���l�y~�?�/����6�<���������~�_`���6�<`���6�<`���6�<`���6�<`���6�<`���l�y~�?���,_MD/�����)�8���~��OJ���?)M�ǋ��4�/�������IYz�ǋ���Q������6�DT.��'�r�=�l艨\`COD�z"*��Q)`COD��=�6�DT
��Q)`COD��=�6�DT
��Q)`COD��=�
6�DT*��Q�`COD��=�
6�DT*��Q�`COD��=�
6�DT*��Qi`COD��=�6�DT��Qi`COD��m8K�p�6��,lh�Y�І�t��g�`C����6���m8K�p�6l��N��EKڋ�6�-l�N�.l�Nŝ�?������)�a��w
l�����?������)�a��w
l�����?���{ER
l��I)�q�W$����^���{ER
l��I)�q�W$����^���{ER
l��aj���")6�����8�+�R`�|�HJ���")6�����8�+�R`�|�HJ���")6���0`�|�HJ���")6�����8�+�R`�|�HJ���")6�����8�+�R`�|�HJ���"Lm�q�W$���Q����TEJ�/�r�HJu�4�/����DJ�/�r�HJR�xї{E���/�����^���+�R`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/���S`C{�
/Z����^�;6����^�;6����^�;6����^�]�E��"w
lh/Z�E��"w
lh/Z�E��"w
lh/Z�E��"w
lh/Z�E��"w
lh/Z�E��"w
lh/Z�E���^T�+r�����^T�+r�����^T�+r�����^T�+�+�h�^��E+�h�^��E+�h�^��E+�h�^��E+�h�^��E+�h�^��E+�h�^��y�/��ީ��&�ϋ~q�NM�4Q^��w*��D�y�o���?/��y���E�9[���7�ak�oElx+`�[� ފ��V$���"6��`�[�6��`�[�6��`�[�6��`�[�6��`�[�6�i��V�]`C[�v�mE�6�i��V�]`C[�v�mE�6�i��V�]`C[�V���"��mEZڊ�6�ilh+�
��V����H+`C[�V���"��mEZڊ�
6�ilh+�*��V�U���H�`C[�V���"��mEZڊ�
6�ilh+���V�5���Hk`C[�����"��mEZڊ�6�ilh+���V�u���H�`C[�����"��mEZڊ�6�ilh+�:��V�u���H�`C[�6���"m�mE� ڊ�6�il�X`C��� �-���m�6��n��6t[�M���bm��kl�X�`C����-�&��m�6��n��	6t[�M���bm��kl�X[`C����ǆo�5xQ�k�-��E}[�����X��m�/��b^Է���o�5xQ�k�-��E}[�����X��m�/��b^Է���o�5xQ�k�-��E}[�����X��m�/��b^Է���o�5xQ�k�-��E}[�Ë��X��m�/��b^Է�:��o�uxQ���-��E}[�Ë��X��m�/��b^Է�:��o�uxѢ�h��m�/��b^Է�:��o�uxQ���-��E}[�Ë��X��m�/��b^Է�:��o�uxQ���-��E}[�Ë��X��m�/��b^Է�:�h�^�Ë��X��m�/��b^Է�:��o�uxQ���-��E}[�Ë��X��m�/��b^Է�:��o�uxQ���-��E}[��z�o�5v�
R�����߼k�N5��'��E�7wp�_/�����D��)�W��E�y�؝�H�oy�����	6��lh�'���O��=@�`C{�>��� }�����6��lh����/��=@_`C{����� lx���� lx���� 6���=@��lx`�{� ��� ��� 6���=��l��=��l��=��l��=��l��=��l��=����� ���lh0.��=����� ���lh0.��=����� ���6�lh0
��`��=�(`C��GzE?
��+�Q��^��_/������FJ˿^����    ݩ������7o��S)���E�z{����_��n�zѯ�^7~��Wo�l���`C�FGz5:�Ы����^��6�jt4��W����l���h`C�FGz5:�Ы����^��6�jtt��W����l����`C�FGz5::�Ы����^��6�jt��וc���l�u�`C�+� z]9����1��^W�6��r��וc���l�u�`C�+�z]9&����1��^W�	6��rL��וc����`ï+'����6��r���\`ï+����6��r���\`ï+����6��r�����ו6��2���_6�j4��_���� zy|����݋��E�W�^/��z���x��ջ�ǋ��޽8>^t}������w/��]_�{q|����݋��E�W�^l���~5���^��l�����^��l�����^��l�����^��l�����^��l�����^��6�jt��W�����l���,`C�Fgz5:�Ы�Y��^��6�jt~��*�<��ǋ�����ER�Ï�Ii?^�'�9�xџ����ER�Ï�Ii?^�'�9�x��R��5+��ϯ���~~�6����j`�?���ϯ6����j`�?���ϯ6�����`�?�:��ϯ6�����`�?�:��ϯ6�����`�?���ϯ6t�g���`C;�9��v�s��`� ���6���lh;��vN���`C;�9��v�s��`����	6���lh;'��vN���`C;ع��v�s��`����6���lh;��v.���\`C;ع��v�s��`g��`g��`g��`g��`g��`g��`g��`g��`g��`g��#�l�3>s�}�gn�����6�����>�37��g|��������8�}�R`�|�R�经R
l��>J)�q��(����经R
l��>J)�q��(����经R
l��>b�����G)6�w��8�}�R`�|�QJ����G)6�w��8�}�R`�|�QJ�c���>J���f^��*Hi6�E_�>J���f^��Hi6�E_�>J���f^��g/�����G)6�^4���ً��8{єg/�R`��ES
l��hJ���M)�q��)6�^�)xї��R
l��hJ���M)�q��)6�^4���ً��8{єg/�R`��ES
l��(S�/w��8{єg/�R`��ES
l��hJ���M)�q��)6�^4���ً��8{Q��E_�>J)�q��)6�^4���ً��8{єg/�R`��ES
l��hJ���M)�q��L����}�R`��ES
l��hJ���M)�q��)6�^4���ً��8{єg/�R`��E��}��(���ً��8{єg/�R`��ES
l��hJ���M)�q��)6�^4���ً2/�r�QJ���M)�q��)6�^4���ً��/��MSj"�?Å��)�n��g^���iJ���W�y��Ӧ)Ր�_��E_O���� .��=@\`C{����� q��������������������������������������������������������������������������������������������������������������������������b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��b��s?*��ƹ�R`C��b�ݏ�6t?*����X`C��b�ݏ�6t?*l�~T�������Q`C��"���GE�ݏ� �6t?*l�~T�����`C��b�ݏ�6t?*6������������������������������/��Q^���6���GmxQߏ����E}?jË�~Ԇ���/��Q^���6���GmxQߏ����E}?jË�~Ԇ���/��Q^���6���GmxQߏ����E}?jË�~Ԇ���/��Q^���6���GmxQߏ����E}?jË�~Ԇ���/��Q^���6���GmxѢ�����/��Q^���6���GmxQߏ����E}?jË�~Ԇ���/��Q^���6���GmxQߏ������{�R� �?�_/��ޥ�jH�O�׋��w)�R�/�׋��w)�R�/�׋��]Rj�K��|�?�O��g�	6��=����'����~Z�`�O�l�iy�?-O���6�����������~Z^`�O�l�iy�?-/���6�������l�i9����l�i9����l�i9����l�i9����l�i9����7����~Z�`�O�l�iy�?-o���6�������7����rZ�{�rZ~R`CN�O
l�i�I��"xR`C��ؐ-�'6d��I��"xR`C��ؐ-�x�V�4l����E���l<)�![O
l����E���l<)�![O
l�A<2R��
6d��I��"xR`C��ؐ-�'6d��I��"xR`C���/��ē�Hi6~���;�R� ��������J���f�׋���+�R��_/��N��Z�R�9<)�!�Ór70�	)�F�T<)�!Mœr7�I��7�ؐ~�I��7�ؐ~�I��7�ؐ~#�	)�� �o<)�!�Ɠ�o<)�!�Ɠ�o<)�!�Ɠ�o<)�!�Ɠ�o�3!#�٘`C��'6��xR`C��'6��xR`C��'6��xR`C��'6��xR`C��x&d�4lH�����O
lH�����O
lH�����O
lH�����O
lx�`��� �o��~#���6�����F��7lx�`��� �ol�����ol����ǋ����R�#�?����4&R��XH�O#��)/��B�|�h���*�
R�/�|�h���*���^��l�U[���^��l�U[���^��l�U[���^��6�����Wm���j+l�U[)`C��Jz�V
�Ы�R��^��6�����Wm���j+l�U[�x�(�<�ǋ������?)�-��OJ�/�����ǋ������?)�-o�����?)�-��)�th`�?��O�6�ӡ��th`�?��O�6�ӡ��t�`�?:��O�6�ӡ��t�`�?:��O�6�ӡ��t�`�?:��O�6��a���� ��6��+lh�W��N����^`C;�2��vze������	6��+lh�W&��N�L���^�`C;�2��vze������	6��+lh�W��N�,���^Y`C;����vze������6��+lh�W��N���N���N���N���N���N���N���N��Н�`Cw�J��Y*l��R�`Cw����T6�Н�����,�6tg�l��;Ke��Y*l��R�`Cw��6tg�^`Cw��6��'O
lțO�ؐ7�<)�!o>yR`C�|������I�y�ɓ��;U�����I�y�ɓ��'6��'O
lțO�ؐ7�<)�!o>yR`C�|������I�y�ɝ�`C�|���Q��'O�"�ـ�7�<���f^��|�&R�xQ{�ɓ
�4���;/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/Z�����'6�����'6�����'6�����;/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/jo>yR`C{�
/j�������^�    ��I��E+��}3ԓڋVxQ�f�'6�����PO
lh/Z�E훡���^��7C=)���h�-ڋVxQ�f�'6�����PO
lh/Z�E훡���^��E�h�^����E�h�^����E�h�^����E�h�^��y�oN��?/������E�9�����7'[۟��dk��ߜlm^�����ϋ~s���y�oN��?/����V���=��m{Z���
6��ilh��*�ж�U��mO�`C۞V���=��m{Z���
6��ilh���ж�5��mOk`C۞����=��m{Z���6��ilh���ж�5��mO�`C۞����=��m{Z���6��ilh��:�ж�u��mO�`C۞����=m�m{� ���6��ilh���ж���mO`C۞6���=m�m{� ���	6��ilh��&�ж�M��mO�`C۞6���=m�m{����	6��ilh���ж�-��mO[`C۞����=m�m{����6��ilh���ж�-��mO��mO��mO��mO��mO��mO�o{lx�`�۞ ����g�o{6��g�݂kl�\�`C�����6��-����n��6t�m��[p���/��[p���/��[p���/��[p��ǆo�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxѢ�h��-�/�[p^Է�:��o�uxQ߂����E}�Ë�\��-�/�[p^Է�:��o�uxQ߂�^�7y=����w�z�/����:R��5����z�/����R��_/�ś���FJ3��E�x�ד~�^`���l�{�?c/��g�6���������3�~���g� ~Z��� ~Z��� ~Z��� ~Z��� ~Z�`�O�l�iy�?-o���6�������7����~Z�`�O�l�iy\`CO��zZ������yZ^L���R`�<-��8O�)6��rJ���R`�<-3U��yZN)�q��S
l����i9��ƹE�R`��H)�q���8�R
l�� )6�} �*�8�R
l�� )6�}���>@J��s ��ƹ�R`��H)�q���8�R
l�� L5�q���8�R
l�� )6�}���>@J��s ��ƹ�R`��H)�q���8���`��H)�q���8�R
l�� )6�}���>@J��s ��ƹ�R`��H)�q�05�ƹ�R`��H�_6^O�TC��v����@J���E��C�R)M�}]Jm�4��^��=t)U����,���٘��8��gc�R`�l�R
l��YJ���1K)�q6f)6�ƌ�6��,���٘��8�J��8{��gϖR`���R
l�=[J���gK)�q�l)6Ξ�� gϖR`���R
l�=[J���gK)�q�l)6Ξ-���ٳ��8{��gc�R`�l̘�`�l�R
l��YJ���1K)�q6f)6�1�`��6�1�`��6�1�`C�y�m��6�1����l^`C�y�m��6�1��8��I)��=ۼ���l�ڳ͏��oCK�����?^t��-�R�[�x���6��H�o��E����Rj!�����oCK��/�����v�l�ì`C�fz�0+��k�Y��^;�
6��aV������v�l��l`C�fz�0��k����^;̏���Ï�I��D���R��Hi�?^�'���xџ�f��ER����Ii�?^����=�`��v��;��l���6��a��p��{8���=`������l���6��� ��p��R� ڥ�	6�K�lh�2'��.eN��]ʜ`C��9��v)s��R�ڥ�	6�K�lh�2�8w�R
lh3��f.���\`C����60s�m`����6���lh3lh3lh3lx`�� ����&��706��	��L�o`6��f�o`6��f��t�l���`C7����47��M����n:�6t�i]`C7��6t�i]`C7��6t�i]`C7��6t�i]`C7��6t�i]`C7��6t�i���N���tZl��*`C7�V��
��M�U��n:�6t�i���N���tZl�Ӫ`C7�V��*��M�U��n:�
6t�iU���N�����')6�7���8�|�T�OR
l�o>I)�q��$���Q�7��TGJ�/�r�IJM�4�/7��T �ـ}���)xї�OR� �ـ}��$�����^��擔ڋ.xї�OR
lh/��E_n>I)����}��$�����^��擔ڋ.xї�OR
lh/��E_n>I)����}��$�����^��擔ڋ.xї�OR
lh/��E_n>I)����}��$�����^��擔ڋ.xї�OR
lh/��E_n>I)����-ڋ.xї�OR
lh/��E_n>I)����}���)xї�OR
lh/��E_n>I)����}��$�����^��擔ڋ.xї����^t�����+�����^���_)6�]�/��J)����}y�WJ��E�����R
lh/�/��J)���h�����+�����/�����ڋ�����R
lh/�/��J)���h�����+�����/�����ڋ�h�^4�E_���R`C{р}y�WJ��E^�h/�E{р-ڋ�h�^4�E���/Z�xѢ�h���E^�h/�E{р-ڋ�h�^4�E���/Z�xѪ�h��V�E^�j/�U{р�ڋ�h�^4�E���/Z��?/�ͩ���ߜz�?/�ͩ���ߜz�?/�ͩ���ߜz�?/�ͩ���ߜz�?/�ͩ���ߜz�6���6���6���6���6���6���6���6���6���	6���	6���	6���	6���	6���	6���	6���	6���	6���	6���6���6���6���6���6���6���6���6���6���6��� �HG�m�#��6�`C����t��F:lh#6��� �HG�m�c�m�c�m�c�m�c�m�c�m�c�m�c�m�c�m�c�m�c�m��6�����Fz_`C�}�m��6�����Fz_`C�}�m��6�����Fz����.`C�]��6һ�m�w�H�6���lh#���Fz����.`C�]��6һ�m�w�H�
6���lh#�+��FzW�����`C�]��6һ�m�w�H�6���lh#���Fz7����n`C����6һ�m�w�H�6��������E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E���^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��o�nxQ���𢾩��E}SwË����M�/꛺^�7u7��n�>o�KY/�\Ʉ�d㹬)��s�R����$��HI6�K��l<�ő�l<���l<GL��l����s,)���n�>GY��l����SGJ�/���Oe)���n�>5;�4𢺩{�����w
lX/z�����w
lX/z�����w
lX/z�����w
lX/z�������M�;6��S`�z�;6��S`�z�;6��S`�z�;6��S`�z�;6�-��n�ީ��f^�Z/z�R� �  xQ�ԽS)���n�ީ��f^�Z/z�6R�x�j��֋�)�a��֋�)�a��֋�)�a��֋�)�a��֋�^�Z/z�����w
lX/z�>l�/n��S)��Hi�h����;����z�����wj#�9����ۧ�TAJs��E��O�)�����Ql�ߨ6�o��7j�������
���l�ߨ �7*����
���lؽ�;6��͝v��N��ws���ݻ)�v��N��ws���ݻ�S`����)�a�n�ذ{7w
lؽ�;6��͝v��N��w��ʆ�e�\`���<'�����͝v��N��ws���ݻ�S`����)�a�n�ذ{7w
lؽ�R
ذ{7w
lؽ�;6��͝v��N��ws���ݻ�S`����)�a�n�ذ{7w
lؽ���v��N��wS*��{7���wS~��9���x�OJ��E?)Mԏ��4Q?^���D�x�OJ��E?)Mԏ��4Q?^���D�xџ�^ݔ6��4��W7����)l��Mi`C�nJzuS:�Ы����^ݔ6��t��W7����)l��M�`C�nJzuS:�Ы����^ݔ6����W7e���)l��M`C�n� zuS�Ы�2��^ݔ6����W7e����`ïn&��	6��f����`ïn&��	6��f����`ïn��6��f���Y`ïn��6��f���Y`ïn��6��&>l����(H��0*R�3�����#�?�H��p"���b!���"��_����<�����7����~��`���l�y~�?�o����6�<�����7���|������6�<_/����z�=��l�y�^`C���z�����|������6�<_���|-`C��=��6�<_���|-`C��=��6�<_���|-`C��=��
6�<_+���|�`C��=��
6�<_+���|�`C��=��
6�<_���|m`C��=��6�<_���|m`C���[Q�л���[Q�л���[Q;��'Mj��I�`C�4�l�&��}Ҥv��O��6�I����>iR;��'M� ��I`C�4�l�&u�}Ҥ��O��6�I�:��>iR��'M� ��I`C�4�l�&u�}ҤN��O��	6�I�:��>iR'��'M���I�`C�4�l�&u�}Ҥ.��O��6�I����>iR��'M���I]`C�4�l�&u�}Ҥ.��O������O�TxQ}ϝ*Hi6�E�<w�!�ـ�7�ܩ��f^T��s�R�xQ}ϝڋVxQ}ϝڋVxQ}ϝڋVxQ}ϝڋVxQ}ϝڋVxQ}ϝڋ6xQ}ϝڋ6xQ}ϝڋ6xїx�)�q��)6�^4���ً��8{єg/����<)6�^4���ً��8{єg/�R`��ES
l��hJ���M)�q��)6�^�)x�r��)6�^4���ً��8{єg/�R`��ES
l��hJ���M)�q��)6�^�)xїxR
l��hJ���M)�q��)6�^4���ً��8{єg/�R`��ES
l��(S�/7��8{єg/�R`��ES
l��hJ���M)�q��)6�^4�~٨o}���H���ϋַ�MJ�����E�[�&�R������o�R)�}�y��ַI��/u^W��8�+S
l�וLM�q^W��8�+S
l�ו)6��ʔ�ueJ���2���y]�R`㼮L)�q^W��8�+�Z`㼮L)�q^W�����6��r���\`ï+����6��r���\`ï+l�ue�����ו6��2��_W���� ~]`ï+l�ue����`ï+7����6��r����`ï+7����6��r����`ï+7����~��������~��������~��������~��������~��������^��^W�6�����ו�����l�ue/`C�+{�MJ��s�&��ƹo�R`�ܷa���s�&��ƹo�R`�ܷI)�q�ۤ�8�mR
l��6)6�}���MJ��s�&��ƹo�T�MJ��s�&��ƹo�R`�ܷI)�q�ۤ�8�mR
l��6)6�}���MJ��s߆�6�}���MJ��s�&��ƹo�R`�ܷI)�q�ۤ�8�mR�/}��
�4�/}��E_�6)U��l����mR�!�ـ}�ۤ�@J�/�ҷI)���h�}�ۤ��^�Ë��mR
lh/��E_�6)6���/}��ڋvxї�MJ��E;��K�&�����^��o�R`C{�/��6^��m:����txQ߷��o��E}ߦË��M�x��~�S/Z�o�J���&��E��W)Ր�D}�hy��*�R���-�7\��BJ��������I���m��Dl�'��I���m��Dl�'��I���m���D��I4.���D��I4.���D��I4.���D��I4.���D��I4.���D���C7
��;t���C7
��;t���C7>^��v�?��ǋ���g���a �?Í��?^�'�?Ï�I鿯��I鿯��I鿯��/��ˣ��\l���`C?�G��<*�������~.�6�sy4���ˣ��\l���h`�?�����6�s���\n`�?�;����6�s���\�`�?�;����6�s���\�`�?�;����6�sy��\`C7g� �93��͙1��nΌ6tsf���3c�ݜl���`C7g��93&��͙1��nΌ	6tsfL���3c�ݜl��̘`C7g��93&��͙���nΌ6tsf,���3c�ݜl���X`C7g��93��͙���nΌ6tsf��͙`C7gF�ݜ6tsf��͙`C7gF�ݜ6tsf��͙`C7g��936��͙���nΌ6tsfl���3c�ݜl����`C7g��936��͙y�ݜ���͙y�ݜ���͙y�ݜ���͙y�ݜ���͙y�ݜ���͙Y��n��6tsf���3��ݜ��E7g&��o�LxQߜ��93�E}sf��̄�͙	/�3^�7g&��o�LxQߜ��93�E}sf��̄�͙	/�3^�7g&��o�LxQߜ��93�E}sf��̄�͙	/�3^�7g&��o�LxQߜ��93�E}sf��̄�͙	/�3^��T3�E�M5^T�T������������         '  x��Q�n�P<?�������[�H�� D�x�բA-X�M�����/�f��l&�� C�:Q�6���=�e*LD���-����Kd<�@�q�f�?���d����b��JU=�{�I�K���|�����X/6���i_�)#!4�`��= ����nt�Ҫ]���|I�n�j��;
3�_�]�|�鮕��/�E�:�f�Q�:�l�N���'=�̟�,�����>��w���=���&q���λd��tT�:R��ߗ�:�m̍��I5����J�$���t           x�}�˩�0��uR�40����[��_�9�$#��[Ώ��-,��.��ț�M��q0�/߿�F����j��	7���p+��^C5��P��X�f�< ���2�el��b����22�G�{k��F�d�xc��	Pc=6�XO�0��]0���	ˤz�2�;�I��eR=���i=v���Oh7l��F;`��CL�x��z<�S=�T��F��xȀ��L��C,�����z<�2���~�u�a�A      !   �   x�}���0��3L��b'q���?GQ%�3���w��k+cͲ��X4�n�[ʯ4vI�������V�5͡ �*�>�q��� �9��u���9�}QF����~e�)����&		* '$�9!��		V@NH� 9!��		v@NHp rBʄ�e�cB����1�	�0$�� ��V���C	=l�!��0$�p ���z�21�<��~��K      #   �   x�}��� E�o������"d�9J*�AU�瑥k�Ճ�4��=@�M��=ċJ�#\g�����0ϰ�!���/�6��!V1@A��17�b�3�L8�Th]�A8���[ƤR�Єp��05��SL��AN1�����~=c�o`+s      Q   
  x��XMo"G=ۿ�NH0I|�ڗ�ެ��o�34�3=�e��o����n�@؋�^�0�-�LwW�z�����/F���b4��J�=�{M��)�ē�J�����b�����U�|Pnxҍ�����uC>��^y⦤�ٙQ���Ԟ>�No��s�[t��ěj�sb���u��s ���m!:l]q�f3��z�䅺�C���wD����u�ӱ���UL�Z���W,�|�<��V�-����pS���|���
[��TI�¡}�s
�V�g1�A��<=���k�F�ry�p|F���Ƕ�.I�u�v������eb�����Sa�8#�}��߿�?�j�$�)�/1��r 8Y(�bIȟq�>���׏����!�aq�� ≬w�\����pt��%�.X�'Gb?ʛf���aD?�N�(���ay�f�t�U�z���S�l�"�
J�!�?��a뒫3�����
�b�ȨT �����������z���݀�d�%��m`��F`��ֲ�ɢ�l�º�<*�	��u�-�*��D|��
²�@���{Z�my�B^����(���j�հ�{���EBǥ�:�e�u
�=��k�p�8!%]��>��>)q�L&g�ɹ�_�AyP�r���>�T�$s�� ��@�\Js	j�m`�f��oI
p����l�P+)}-�嬉 �Y
򈴠~����?���� U�ʩOZ����� _8�J%�Q
�C�DQk���Wϭ�B	�[ݘ!vKH���I&�?�t*���~x[�O������DO�@F���Ie���ң;4%�������QZ2�R�>�.�Qe`��Vfߪ*_p+v�f҂�!.[*��T�[;J��B��pj$���v�I=0=���Ⱀ65߱�ï�|���#���	��npB�Tw�H7�t�ȷ�E~����"�f��39�,�=��_2��,��D�d��Y䕳�4�_d��"�,��"�`��r=u�șYd:��t��w�"��Lz7��5�י�ny�,�<����-8=      %   �  x����mAD�5���>�=��(�8,� y�E��Y��]t�Zy�����VQ����+�#����Ͽ�j�auC��i��>��З�'���zꌰzA������.�ڵ�(hײ��]ˎ���ЮNǄvu:^-3]��L_-��I�L['�2m�D˴u-ӽ�N�L�2�2m�D˴--˶���~٪�S/��ޢ+��{�N��ުz���������z<�.��	���'��vT_жe-h۲ڶ섶u��m�nh[�_-u�T��,�j��eS���l��R�M5Zʲ�>�R�M5Zʲ�FKY6�h)˦-e�T���,�||�[�	-�}B˽E_�ro�Z���ro�	-�]O�f�D7������ڶڶ'�m9.h_gA�:3�m��j�f�D��.�h��e���l��R�M4Z겉FK]6�h��&-u�v}��.�h��e��?����vĬ      (   �   x�m��!��0�-@����	n�9��rT-R>�lU �@��=�а3�����v�}+J`f�v�[h���QT��,k9�
�A�D�cm�I���ą�&+��"���Jp��S�6�F�I�����k�)�LF�      W      x������ � �      Y      x��}�#Gr����u:�=��^ �h��q�]YҞ�������i��l�����"�|��Tw2���g�X�EvDedf����п��o�R���������ۛ�����t�r�X�����߼�ߍ�iZL_7�*^�,U���TEbv��2�/&�ۗ׳��|6}� �r3�-ݦ7��(�W�{.�R��ʹ0��K[ڌ~/������6	;.�靈�ͣ��S�8�!X2o���Ň}�T.�D��\�$vA�Y��6�q��h]���H��LGl�z��(��~��J������p=�[�����������ݙo��k�������v|�.G?N�e��_�ݟ�+���d�������?��z:�_��1�����l^=�l����˶�����|��|���by3/>����?���T��W�Fo~��NF�>K'�����9����\�`�tv�e����6����������������ջ���zqu��뫫�d1��qt�3���������j:��~O���R������Z̯���y:�?�-�WW�����*���뚣����]�t~u��������z\^��O����'�m��OO�ScY��b�a|}���-=���i����|�/�h��]Og�����_|�O���P���w����W.��P�hU�����܏�~5�N����w��O���Wu��Ųݶ����%q�%��L�'Sz#V�1��VũKr�D������{(F՟�|�������Æ��j�Z?��o=�|.I�G����%��^��u�|�Ռ�}�x�x7�e��t��鍿[�P�oA?��/6oբ���1��z�of7���ᱵ��{=��.VO��Ҽ�n7Ex��o=wۡyğ�����|I_�v>���Sݽ���������e�Y=V=�y�N��塟:���������1M=�� VOT'����ӿ��z6��/����]�����k\�U]L?u�|����֍Rk�7�����f��/��Tϼ~ΖE���R]=�����`�ݎ~/~��n�*fu���ʦ��1x�E�g���y���l��i>^<��u==u,}���KC�����F�7����n:�|��op��Q�U�z4�/��/޼���2�y���O:}���u�u�uk��?������r�����9?��i��[��>�7Z��?���?��*��X�y��atMeY���nA6{���?Z��\�mG�jd����jӼ'A-��������z�ݟ�?��|�暖3���\���.��RLd��nv�����]������O/5�Q�<izuՖ���XV�Ȉ,������n��~�*��{���'4NR}|Y��>�K�S"k�̓�WS��i�����f��Mu�k�����3��{�*,U<D�M����j�K�r��1�Y��	����Vfm[OW?�Ȣ����x:������r<h{��͇G�"��(��B�frC���F�j�0�'N���r�>���O}d�E�cՐ����~�_~�~|��������H���eSY���4Z|7��������Y?�2"Q3�K}��(;�o?���?.��%u�ד����U~�.V�Vdd?Z��Jdo��S��g���|�\Nǫ�Y�$��&�\}ʎ�/��߽j���
^�������Y�I�Gcp������ �D�s���{Zj���7��������>�鬦]�,$�/zUR�s�/��v���M�'ף��u6���F�cq�Z��x������L�y�ӦP\oMiNvR����~l	DK��_��iR�OYD�'�ٱU���%}B�9��x쇬����A��[ ?�Z��*�����ۛ�"�}����v����:���P�9J�M��
��R;��_nNd�q�X;�>!x;��_��d���݉L7������/�����w�_�_�y����O���J�h�`����;9yf�b-2]x���|�̓��z���O��S�u/2K:Q[ߊUl1E�Hǟ�����t����O���aXk�^d�t��ݏMl�v4��.·�1Y[������v��hr�ߎn���-�|��'V��b[�"���b� ��()���U���u��DlՉ̵���������Ú�����N7�ZT�v,b���c��6��ȴ���ݵy�<��:��l?�.��"}A^W��=����ջ-k��T������0����6����3�����������W�W�X��!�J�#}AE/�=�F����J��g���9���W�Mn>K��q���_�����x>��W�m��݌�ǿj�3���)5�ÿ��Q7xs;���o+��
�U��ۏ����7�����hI�Z����i:僷T��k]拞5t�	���I
��x]	��w�xu/��x����x	k�N,���I	��UtR��'A������w=u���K^�>@y��dx�ʻ�:��,�:��np�.��t���� �]2��~�]��uC�wu������z����س'ȻD��=˻ڎ��wuϣʻ"�u�˻���w���]�����3�+��N�׻�Kvt?yW�j��wu:��U�%r
0,yW�Z�N�]�"YʻDfR��w���(��Np׏��3���������Ni���]=p⽋\D��,��wrғ���_�-_d*sV�.U���]}���wY�wjyW꽡ɻ��擖w��چ$��W�')��H�ק�khڼSʻ:=V�n�KF�'(���E��v*ӝ�K��]���li|�~!�~!�~N��_H���_׃!�~��"	��G��_Q�!��##C��0$��"	���	��:4~�8	B¯G+	�.C��_�C�/$�B�/$��8E~!�~��<G"��_�Q�!�ץ�b��	�����T�Z7��_�*B¯!�h�MT��_}���C¯a(�	�-�B�/$�� �~L���_H���_x!�~���	��Gޅ�_�w!��##C��.$���	���	���9H���X	����h��+�"����]H�ջ��<�]H�uA�.$�:W�	��&�B¯�˻���\�]H�y~}*-	����b�]C�!��'��C¯��E¯3�wM���_=I����~�R�Dkل_�2-�/��8��~v����g�ݖ����������h�����δ��ݾ�������.B���^H��^H��^]����Dj��i����|�_H�5�R{=22���Bj��i�������k�C#�W�3��z�2���2�_H�ua�/��Bj/��Bj���~!�R{!�W��s$H�5�R{]�������>M�נBH�u�b ���0yR{�V���CH�շ�h �/�������-���
���xm'�j��������G�s��	����M�1$k�0Hv��1$C�0$C�0$�6i�s�cH��a��1$C�0$CҰ3�!i�	ǐ4IÐ4�́��=Z�Q�!iX\E"i�e	ǐ4�w��yǐ4삄cHv�L��M8��aC�!iعǐ4�1$�TZ>��!i��
ǆ,	DҰOJ'��a����ag,��I�z�!i��'�J�m$���/�R-�?�GK���v�L5�5���Mn����m:������V����1�.�/*a����ݴJY5���������������yNʦ�Y�F�T��Xp����!��|��Xy�&�B�/��B�������y��K��<_�#�B���ȵ��둑�_��|L��<_��<_{y�Z� �ף��<_�!�B���k!��|!��|]�\y���y�Zt�#@���ȵ���RE+��<_���iʵ-�A��K�� �ׅ)z��K�r���A����?�k!��0�Z��u^y����Bj��N�u`���P!U���_HՅT]H�5p�Ru!U�9i����|�_H�5�Ru=22���B���i�������kO��T]-�|���������*��.K��T]�K��C��T]��B��s�b��kh�/�������E��T]�~!Uק����.V�5dURu}RR?�ꊬ\��:c��Є{H�Փ^��.;UW(�-]�h�T]H�Ս�	���������������"U� �ZHՅT]�r-��B�.��B��3�k!U    �ɵ��������1Ru=ZH�ur-��0�Ru!URu!U��ɵ�������E�9���\��.U��T]HՅT]��\kТ��T�Ru]����D+wh����[�3�RuC��T]HՅT]HՅT]O�T]H�u�/��������+Vk�T]c��:{�Ru!URu!U�h���내_HՅT]H����������+�"��벴_H�ջ��<�_H�uA�/��:W,�����B���k����\�_H��Ru}*-�����b�_CV�!U�'%�C����E��3�~M��T]=������Su9Uj�hw�T]_��y��%]�Rz��[j7���ۊj&s�����n:�~��O#����e�o{�ri��e����l�x��qC���H�'||^��Ţǟy|F��r�g��$�:_��ɲ�.�cRv�d}�`ǭ�C����, 2v�Z34P��ə��	;
;�;V	;�v,�]��[1U�رL�Aa�=H����D�x�ر����ر�k@ر�k0ر���XFZ�-v,#�v,�m6|)�r:c�gMT?ر�Jj�-�q���zÎe�Y�Ǝe�Z�Ď��u;�V6,�XF,6 ��|o]b�2�Aa�2��a`��fg�n���l'Î��U���VPu��ǰcW��h�ر9���9���<�1��Ɣ�%:������䂩��fy�"�r3�-������}����#��6��q7��n5]��ǩ����B��0]|8�nm��ؐW�L�TgKW$FK��Z�҉1��yny��*JM1uq1��Ø�2����r1%�T>1A҇q�V�쟕C�/��Ҝ_&.OLW�Y���*�Nh��*�PPGW��yiu��Q�T��^J���K�{��SbE{)���*�PAaMlmȩ���F��y^�M1u�~+8V>|H�����8i�(irE�g�b�+�4����Gg�bZ�����P��~q���(�*M��nk�i
���Z��W���zd(�^'N��i]��6�q��<��l����������[��ʥF��TSJ������hfK��c+[
�����;���*ծ�4ͦ���ݕ^BR��I���VG�ۯ_6�S�h��K<�={��X�g�oN���J������O,]_��t�g:{�v1^r��_F��1��\�u��8�osj"ZP�n��m�͖rw����Df����m�����K��w��{�^i	��) O�?%�~f�Z��þdL��z�3��S'�w�pJ8/� �'S#w��~�K��吏����[� e���'%!�W�-�1�'Ք��HV�݁���4�"Dǩ4�"��H�w��jG��H�q���ȌO��n;vU�ݽT��TS�I�{�|�h�����Yܥ�[vt?ͷ�$�B4��*q��|�@���|w?7j��b�j�5ߝ)�#SMu&�[�-���w�wgת�i�;R�j�;������d\�ڃ�wؚ�~''=i�;R�������{������Aܷ�{�"�Sk�{��eh��~e��j�;����l�t�o��ְ4��^�"����X��TS��5�]%[�G��v*ӝ��6h�Y�X��r��M���5�y�k�)��_4U��6t������9����U�T9�rP��A��*o<TU�T����rP��A��*?Z���A��*U��<�@��*oQRP��A��c'A��*���rP��A��*U>��UY���A��*U�|�T�����:��\*T~� �*T�P9�r@���*T�P�	*P9�r@���*?Y�T�P9�r@�ʏU�r@��Ek�*T�|pmP9�r@��?Z����`@���*����Һ�{�����4l��Y:��&++�|���b�Lg��/����~O��ލ�[ZJ!��E#�{�n�^gr������v����9�s �@΁�9r����9�s ��@΁�9r��h}9r��9���8�r�EI��9r��r�<:r@΁�9r���Ъ�yd�9r��9��a#�Δ�H�1̜�5sN�c��5;����ߍ�iJ�܌�FKF��G鈾�ߨ�h�R�ԨR�ʉ�;N�������K>5�Tyi|b�z�,5�T������Z�ڕ����d&ƒN�0/�J|�ti@i�."_�I�'���@ i ��@ i ���C i ���K�@ i ���OH �4 � H���� HZ�� H h�B i@t� �4 � H �4`h�i@d�B i ��@0li�ץ��.9w
��zM�8)����o�.7�s �@΁�9r��y�#�s �@�e�-��9r�����r��9�s ��q��y��9r�X	��yt䀜9r��9��U7����r��9�s �G�}�}�s �@΁�9r���m�9�s �@΁�;-r��C �@΁�9r��9�s �@΁���i�s �-J
��9��v`%�s �ёr��9�s �@·V�@�#+�9�s �@΁�9�Je_\8rns �;��Ős�i	9����9�s �@΁�9r�x���9�s�m �@΁�9r~�>��9r���y��9rޢ�@΁�9oV9r9 �@΁�9r�|h��<�r��9r�����sS*]j�c�97Ǚ������b���kKZ�T.5�Ծ�&1��X��߂���By�$�r3�-b�Ҏ�}���qRJmK��������lt����?Nu^{�?���t���|�SZUz*�2e�*�(��fIP��A�������	�(P���A���?(�����!(P���A������?(P����� �?(�%���;��?(��ȁ����?(P�C�nP�����?(P���N��ҫ$h �@΁�9r���m�9�s �@΁�;-r��C �@΁�9r��9�s �@΁���i�s �-J
��9��v`%�s �ёr��9�s �@·V�@�#+�9�s �@΁�9��+�`��9r��9���- �@΁�9r~��9����9r��9�s �@΁�9r~�q@΁��()�s �@�ہ�@΁�GG�9�s �@΁�9Zu9��\ �@΁�9r>p�(�K�r��9�s �@�Oض��9r�����r �@Λ>r��9�s �@΁�9r�����9rޢ�@΁�9oV9r9 �@΁�9r�|h��<�r��9r�����s[�P��97k�l��kvd>=��-&Ӕ~�ݍ����3��}��Q9��r�ѥ�J�'��'�w����Q���)����:3�Շ��Ã��r|i|b\*C�SZUz�x��8i��7��7��OuQ:]Z�wᔿS��whwZ8KQ�G��}S�u�A������?(P���yA����/�S��?(P�����'(P���A���?�PP���[��?(P��XVP����#��?(P���A���A�GV.(P���A���8埗*$�9r��9�s �'l[@΁�9r���i9�s �M9r��9�s �@΁�9r��N〜9oQR �@΁��+��9���s �@΁�9r>��rY�@΁�9r�|�ȹV�)�.9�����fbȹ}v�Z�Q,r^��9�s �@΁�9r����9�s ��@΁�9r��h}9r��9���8�r�EI��9r��r�<:r@΁�9r���Ъ�yd�9r��9��#硴y2F��q���x�n�����=CF��%!�1D���5��E��ft7Z2�Ne�#�
c�GVڬT&	Ŏ����lt����?Nu�i�B���t��к�I��K�m���p���t>Ɍ���.�|m��Ƅ�+��we���I��}P�|L�kC�T��A�a�I]�֝e�>�J�<. l��b�d���f�+�\ŵ�<��[����k�    T9$r��&�#�b^X�H(���r]�}��D%���"��0.˷���K�R��ld�J�PvRJ�K�'�ϭO����2q�F�$���":@鵣x�����`�1$�W]n(����J/(����J�F�J/(����=-��J/(�����h}B���^PzA�u�^Pz�()�^PzA��N� ��^ё��J/(����J��U7�^����^PzA���`�^�ត���5�\����5t�=`N2���0��8��݁"m-0!�C�ԡPV7I�*�MrQ��Ȓ<��p?�~����Oض ����p�1.p?�������p?�~�������瞀���()�~�����!����GGp?�~������Zu\���������p�ץ�I^ �4h<�x��'l[@���4�ة>�x��M�4h<�x��@���4�N���oQR��@�Ʒ@������x��@���?��Y�@���4h�I�xSڐ*��{�m����>)����#K
���ߘ�?�7��N'�z�"5�T�"�.*�E0.�wmݕ�H
/ZWj�R�	wm�W+����a����γ�ֽ�n�z!\�'�'Z�T����T616{n�����Pj���u���橦�+==��"��ۼp�۪V2�U�=5oNb��2_P��&��k����Nt�T�4��M&�2�8�9˪�R�UAW]tU�UAWu¶]tU�UAW]�1$�*誚>��
�*誠���
�*誠���
�*�� 9��
��%��
�*�ک����*:r�UAW]tU�UAW5�ꆮ*�r����
�*誠���*RWU�6XG�h��'��Qz��6#�FT{BN
rb������|?���-���������M ����C����������|?�~���������'�~��-J
�|?��v+�~��ё��|?�~�����V���#+|?�~��������?	ߟ�F%Z9��`��ƃ�6��ml<�x��`���;�6��C��`��ƃ�6l<�x��`��Ɵ��!�x��-J
6l<��v(�x��ё6l<�x��`�V�`�#+l<�x��`��ƃ�?	_��%Z�Ȼ�VMw�UjC������'�d;N�������ڒV/�cK*/=Y�yD4��ƺl+l>�*�Ɨ�H�+b��Y����6�����s�`���*SBi��+��g�s�D�$:U�T�4:1���g,5��ڨ�[[z��\Ř��:?0oliM�ؼT=�N��!��N\i9�xG�õ��RqI2Q'E�E�RͶr�5U9)D�xn�>��~�j~�j�/%�L��W_A|��W'l[_A|��W_�� �����C�� ���
�+�� ���
�+�� ������� �jQR�� ������ �+���#��W_A|��WC�n��"+�+�� ���
�+��N!�2��y�U�܈�WN�F�-�'�J�'Y��z�R���+m KZ�qm���D�<��!'�֑y	UΎ���եSd)V�W���Z10D�a�����K�BK�$�;+'�T�t\y1@�R�89��JO�0J��Ē�g��,�����5�e�ʗ����Q!7y�������<�y'ZrB]����ז�b�6B���T��q�bB�g���|�ހF��>8)�I��RV=�ꔵo��Ց!�3�rO��!�R=uㄺ���!�����q/EÛ`�A�6�YN���0v�	�h��Fm�s�I�_�I�%'���V�S�+������f�Z�^���{2�z��	�X\��Y[�w��Ǖ�|� u%�C�������n-��紆 �������KE��pBjuv�M�ZF���Bn�i9g�dŽvB:�'�g����P�y�N�N��U��<����'9�0�ȼes�	O���6W�Јb�ꤾЄ�8rӄV��6Lx����j��Mb�����$�״&��w�o�м,2��%+�7� �u���P�J���\�
���R_P���cD���}���v|�������K}K��������}A�^[\�p��)����uw5�3K����!��[)�K�)p#n�����7R�F���ip#n�h�7R�F
�H�)p#n�����7R�F
�Hq�>n���-J�)p#n�h��ƍ��":r��7R�F
�H�)p#�Ъ7RDV.n�����7R�F
�Hq#Ŷ@��D{��;Pw��@݁�u����#e���Sz��@ݛ>���;Pw��@݁�u�����u�ޢ�@݁�uotu�9��@݁�u��}h��=�r��u���;P�������Pw��@݁�u���;Pw�	��GN遺uo��;Pw��@݁�u���;Pw��gp
��{��u�Խ�	��{t䀺u���;P��U7P������;Pw��@�O��{WZ�h�u7k���n:�����w��d����q�Cp��J�W����-�-m �a�<b���u��<�~�ݍ��S8F鈾��8tR��L��e4��~�2�]5����������V����O�ܯ"�q�=�' ��"�� |��R������ty�~	A����?(~P�@��o�?(~P���A����?(~P�gp�	���������
�t�@����?(��U7(�����?(~P����)~&�]��D�\�w���0{`�����?���=0{`��쏖	��G`���>f��=0{`�����f����@�fߢ�����o��f9`�����f�~h��>�r���f��=0��`���:�A	�#>�J������������6���'��Wa�8 ��	���(�
u��?��]#��!�<�}�t@݁�u���;P����u���!Pw��@݁�u���;Pw��@����;P�%���{;��;P���u���;Pw��C�n���;Pw��@݁�ǣ�ԶT.�Aw���ӓ� �s�y!A����r@�{]b�� �A��t���;Hw�� �A��t���;Hw�� �A��t���;Hw�� ݏ����� �A��t�>����;Hw���~�� ݏ?0Hw�� �A��t�Iw_���;Hw�� �A��t���;H��2�t��!=Hw��M�t���;Hw�� �A��t���A��toQR�� �A���9A��t��Hw�� �A��t�>���Y� �A��t����)HwS��'�L��5�~7��n�I������b2M�S�8�!���6S�>L̻��Ҙқ�8�c��ߘ�?~�RJJ�%��Ky��)�ML",i�*U:˖t��	@& � d�	@& � d�	@&�\&�>B8@& �@Ӈ�	@& � d�	@& � d�	@& ����B& �@��B& � d�`X� ��d�	@& � d�	��!��\� �L 2� 8�L�����3�=x��@݁�u߄�;Pw��@݁�u���;P��[\@����@݁�u���d�;Pw��@݁�u?VA@݁�����;P���u��@݁�u�h�u�~����u���{��������u���;Pw��@݁�u��H�����;P����u���;Pw��@݁�u�~��@݁��()Pw��@���@݁�GG�;Pw��@݁�uZuu��\��@݁�u��=u��Q�.Bg�{!@�� �w��\�t߇ĆD�� �A��t���;Hw�����N�� �A��t���;H���	��;Hw�� ����;H�%���{;��;H��ȁt���;Hw��C�n���;Hw�� �A���t7�-c��fM�����5㲏���ߍ�iJ�܌�FK��yG鈾���8q���Ļ�8����n:�<j��8�S�W�μ�0]|x0RJ�KG潑)�V���Y�C�CI $�@ I $    �@ I $�e�$�#4$�4}I $�@ I $�@ I $���i)$��()$�@�|�$ ����A I $�@ I�Ъ���ʅ$ � H 	�$ ���H\�M�C���7�����xϒե�d����](����_�w��ͤ�'����h�JA���hdJQ�j��ӥ�hX�h�ON\t4�)}A�|d4lh�F��F�9��I��Ԏ,��a_!S���T��"�A�)59W�|�r��;��aҹ�L�L{mΓ������/�xG���|g�!�<E�s��xQ9��g��3�F]�7��_���-]䏁��y������x���%/�O)�i%6�}�犍��aҕ�h�tk������F'��t*6:�|���S7'�Fl$�31L�Qk��F])s�T�*�j���5g�6�@��|���, Rm���DGj��c���Fݟ2���!���HF�3���>,�Q�EGj��%8��zV�Bm$;���Q��E�j#cXj�~	�N�F
bt��Su���]mԝ��Q�!�j#�9N�j�~�0�Jmԃ�wͅ�t��F�NNzR������Hm�Km���-���D�H�V�L��6�h�5d�Q�����6��Imԯ�YRm$2��ڨ�����"��dT9�or�!މSu4��Gm�v*ӝ�H|�q"��oV����䂲�P:[*MN\����MB$2�*yE�E�@N<9	�z	��+�W+[	���a5H�T�,���d��aVZ��z*T\3ȴ��̀l祡*�h��R�&2�d�(m KR=Ϧ�(���?���yEa��ymޕ��M!���N�=���W[��ǖ2��u��9���36JXU�m���L�J�����ɉ�-��<ό�m!��My�BbBL�'�En�C�T�Y�
2/� �N�*�\I	]k'ڲ �D�kK4���,	���	5L�~�ǼW�L�S�"��
�I��tQm�WoW��N����vh+�Wf.Z#�Ώ��2S+���x�T{o�o+���]	����Q������U2�7��ZE�ؠ_�����Ҥz�%�\r=�� ׃\r=��>FB��^Ӈ��A���z��A���z��A����L��A�ע���A��^;Q
�z��EGr=�� ׃\r=���Vݐ�EV.�z��A���z��E��*q����(.����w�s{�����-`y�����,4������,X^v��<`y�����O�����,爀�˷()`y����!����GG�<`y�����Zu���\�����,X���S�
	_N/��(��n�W:&�F�{e���y��y迉���9��*����8�V����m<�_����qnx�H��*�S�X��v��+8������ҭ�"����O]�Cp2IC'–I�&YS���7m��a?ڀ��ڀ���JЙV�9ڀ�O��{�/�h;�H�����6���=Pm@km�YjdG�ai�=��H ;�6�o��=�#�C���w�� ���ai�=��D�)a�ݱ���A@Н��om@g*�~��I��"s���"s��iD&�&���C[���'m��te�-�=İ��ߙ�XR1lm@��ht��h�5dm@��iDfmC��{/��6@d�5,m@�RSQm@�����FO��A�Н6��T�;m����D� פ(J��Z'F�Hl���/J_�y/��kU*���2d�Qz�}�L��4���w�4K6���,[:bq�&�M�0��>1ZTL�N�Z�G×��DFÅ�1Y�}k��y���N4�Ei-9��J7E�RGd�!:VS�&K�}Κ���$��F�H4,�c2_�G�U�f"�U�.���Uj[jjz�P��&U��y��.��]��h!�[9��+�ĕ��$f\�^����<5*G-���ИVļjK�H-7�ׁ��R���;��y����2Oc���e`'yb���+'�t�$ft^Y�Y�i�T�N,9��kK<�y���-iz�Լx��p��Q�bj���ES�����Vj^���+/f^����qE���є���x�&6jv��D/ij�Z���Jn���On��#�U����JM��IV-ϸ^}d��R�Y
Y
���k@~�,.�s�0��2�k4-��779�Y�Vehz{U��u`{j�z����=�%o�VS;��WW�����i�2��˅j`5Qs�������,�RN#M��R����+�,�,)kK4��E����?_mEY�n�9=�s�]8�^C�j���U;�@�v�ʒgK���[���
yV�aȋ�{QS���W�'6�瑥j��Z��ʘ���֧���*8�+���W�mi��;���q�/3P�,���ƥ�S@�����R\(��7+�9o�Y'�S7N�"'1c���\D�bƼ����t�$𖼥N�b�Y��2�燕W�NpwtB뼍.�W�!|�`h	��E�	�]�ʫhs
��胐�������}p��mn,���6_j'�ќ���l�p�3}���<-H��z���rB�Y3q]Y
���G��A���<��YO�#7N����1��d��G���ۢ)�Tm#v��	u��3ne��b���B�X�̳2/4e}p�e����Z�y�B���q�F�w�KKs� 7:���{#�ْ��,�����$Q�����ꋛA5/ڻ}�fe�^Afr�Rv�KM�,r^��X�{^QM�Ag1[��l�l|e��kTjY9�n�1�:K����wo^%�1�:�Ɛ�̉� �Sɉ��Y������+����v+�P����y���&й\wd�D�ш쎙և�ym�jߑ3���ѐ�I^Ec��yz4�=����y�PD��d�~u)pf�f���."G���ƶa����k'��]D��lI׏�@�(�� ��R��� R��Ɖ�2�MV3��l*�S�KZ
�a'�ھ��Sq}4�c��2���G�y����GN��o儯��D�kK��vJ����Ф+�I�hJ�j��6�y_7��M��s�dI���j�l�I\Oͩ���k��`O�����tԲ������i�N�� ��vQ�9�ܺ�)��T�FK��pO�Q��ڒ��P��6]k'�׮NǍ����Bk�6#�Q�<��jb�t�<��ħ�d)j��y�VQ{����rbx�Pv���`F�6o��Ea2+K��g.
�YY�\vFp���P�2����Y���̇j��լ,e|����h��
"'��������|�����pV�
>�sRN���;��s�ֱMѨ�B���s����b�4�+8Ï���h�0FT�y��Q�ڒ��R��ʉ�^�6n�&����ڼ�����<O��Y�f�ֳ�ŭ�P�����U�(��R`}��lj'3�.��	y��}j�6�Wc���[V�
�-���ү�.rn����6�i\t�sK�'�<	vRG�ǈ�sq�y�ƶ�\�v��kjKZ�$�����d$_�g�k���|�{Hb|��	O̼�45�Jյ7M-��Y-�ȘHw^p��*m2;�2[���z	��o�&A^p4ͪ<9	q�iA׆wDe�R=��85�_T�� 8��Ն<��B�hZdyS��y��f�o��;�͹�x*$F��U�S�܆Ȟ����re�'�A���,��6Į5s���}&���W ��vjK�*��ee�#�d9>s��u�,nYY�EhXd�e����|Vm=�Q9k'<��r�Be{ߕy�,g��J>?�^���@X��p9f?7��<��r�)n�F[1*ǯ0�5�#��:Q����y�1�v���o�Zj�yԊ3SJ���8�+΢�T�dIp ,�j�AN�V�kf��y��"v���&�\�S[��,]��Y;q�$��Q\���6�sk1*g��F�S[���pqTE#4�+5���r*'<�)bG�ʒ/�Rl��x��|u�����r�,99Aw�������h4�W7��@����.C�ku���|_�)��o]����^�y�ij턣?�U4"{��]cOq�{�K�+�� '�=��
Ԕ�ЗL�,�Fӻ��X��� ��rB/�X����mDݺ��h�0d�/�ԍ2N �  <9��)�%ϖ���3U���!�e*%��r:v�W�DN�R�{��ȭ�hF�7:r����xm^��)�aKձ�Deȉfܝ��uG���p���m�SbQ��1���91�F��Ce2���IMm�'5F�;�����vGS����ơ2�6&4���&����f��s4�#M�[��Ӥhd��m8_[�ؾv�S<�]`:�[��V�����u�L[�� Ê���J�h6NhvQ�1� Ln!Njt���돽�s����7Nj��v*�kj'�y wcMm)�='�D����2|�/B�^c� 2�L�v���|u����l*'(�%Yf�9���-�Y�t�"�Jrb��o���;�ǌ��Ӵ~���`�nh_�m�Ș������c�ƒ�^�>fL�h�ݍ���z�J�n�-'�7u��!�e0<~�Y�n�-'�
�1m��~�b�.Uy%��+�l9��h`Ce��A�"�E�)�2��w�$TkӨ�p���ː�ݛ^�.�-'��է��1MeЦ�mR}z�^2@��	�4D\��e��;"�
y��f�x�d���r�)��lY���,j��hd����y�s?2/5Į�Xz�eQClm��q}����R�'i>��*ʼU>k|��hl^�ϱh�+/��U�f���+�-Y[�Ѳ�i��&�_�l��F��g�	�0��Zm�����G����N�P��D��Twm)���<�/�*�^W���5�N�F�{�7�{#���S����W�����f�	�� ��Te��͉"nt�44��l����P2�N�1���h�jW7�TSmJf���"��}��P��+Т죵TԦ�wJ��KOW]h���Ԧ��	�ڣ����b����Oy�4��XPR���	ͱ�̵6k'�����y��-���zv�θ�^�uU%2w�l;	�$�gS��oj�� ��l�T�{PQ=�ʐ���7���B2/ճ+'uV���/��X��X6設��i=����2Jj�2�l9��$j�Le(���گ���-Cm�0IN�fȕ%W�2�TN�3�!�ڙ��?MY_���[&-떓*PQ���R��dX��I����qM\Ou�U��^j��d �-'r#7в�
	���R��
2�P�o��č�.�vk5^�6�ܘ�r'nLu�:�gYK�hA�ܘ�r�e�Ske6��zevl�*���쩵�D6nL�Z��Y�*]:M�dn��vB���SW�DQٮ
Z���v�ar^ԸV���gˉ�����uZY�@��q4F��y��Gh4�8�4E�CkK,w�����u�h�'V�ĴA��-'�j4�.C���Z���K��r�`��y*'�@ǃu��<utc�~�j�/�k�I����/��Y�X�
2y�6N�[���b����e�x�;�\��u��!/���h���e>'յn!�2�2d���&C8D�}�X�|Be�ep>4�AWn)�h��C����P���&���I��)et���[��/�2ɵ��PmD\�S[�SuS4����X�0���`�X�Yj"�em,L;h��8��Bx>3��d�c�s7�l/���|��27�l;�ʋ�^y�7t/����^2��l;��q�̺�2�y��A�v�e��y%A��ɣ�vR_b�!���d����9pA��v�!������V�>z�I��儗1�Q}k�k��T��A�5�vB��ǎ�դ�R����g�g�IlO���h$�#�\yn/���<���M�7��<v4�/'�hDvGg]s4*EK���g���s7�*=�ի$I�?/Cp      *      x������ � �      ,   �   x����n�0Eד�����<Z�"*UJ�Jt�ƘI2bb#'A��;�b$/�8�9�7/+����;ՠ��|F���ZJo����/9Y^V�"M�,��'�j��c81���Q�;�/��i�/��lC;�-I�������2�
�0��?L�2�&c��T�0F�*�8γ{B��"�lO!�e���$?^�y\��Z�g�cO�e��OYϏ[�B�{)�%6������Cw.�������R;�dY��&��      .   `   x�}ʻ�0�ڞ"��@�4@�������']y*��X621�jQR����h����;(n՛�ּ%�&o#l&�2n��f�*n�[�����IQ      0   �  x��V�r�8<�_��\��(���=lew+�=�24!,�-���H[t\r��$��t��;�W�~��ݭ��Hq`J&�d3��M'[��a*XR���ɥѴ�=6���{�}�����u&[O���$f�^7l���X�6ݛ�~��ov����l�����v�����x��%T���F7��)=S:)2�sq@�
�r��2$a�G?��\d=^�܌�q�z�B�S^SK�9�7\�Ä�m]G]-B �h�0R�LOp ����@����b���H��yS ����t�9���}�[�ఞ%d�GGam�>8���v83Um�4�-S�́ҙ�i@�t$*�t_,�0#G����L�=]��_��o�S�-%	�+?�)g��H<�|�l5}&0�8��-�~U8�|C���-���t		i�4PA�'��r�gL��.��Tu�Y�5�Ool� lqG��Z�#�^����"��5%P����>0����8{���B5��K�o#~Pğ߯�hK���.8�&3������N $��KP��2��T���%���;y]�M��?i&��L@z'%NyF1{D�Ƅo��tC�j���Ԧ��!Vɤ�Q�nC����,Mo��4����[��`t .|�j��z��R�ڭ }��$�6�mVoZ��@-}@�AQ]�ǣ�G��Yx�V&ѯ*]�BE`����Ꝇ����/���
A-�F�]v2g����@hY��n>�ۀ��"�������,��Vn.i�G���Rxy�E�/���4�J��B���B���b�I�A�:#/�|@s���{J�섎�N�[��
�3.�aV/����?�kx��왆2�NA�v��q��~�oo�jNMJC&��{����,w�����?t�l�Ը9Y�sYL=I��᫒p���k����pn��4l�/��}yK���www�E�Z      2   �   x����j�0E�������X���/��-��X�3��O���AR�.W��u�����{����J��`�t�.(�rB���D�L��?v��^ȝ/��x�\?����������J7�TŜ���s�*�f�AK�sk#+�p߆��C�l�.�@b�SY}�'�xJ�sſ�����}v��H#r�U���#�񧁧y�N5C��iy=�m�%~��      4   W   x�3�4432��"�Ң��Ҝ�\�����l���<##C.C#NC##�ڒ�b�l�z��	P��!�q��t"�͊���� ��      6   �
  x�Ś�R�������վ��:k����C��`��T�K؍e��b�~�����	I�T���y�M+0���ЧQ���~\�|˒"}�Og�>��H@��S���4�/���6��h��˄�X��������/X�-�b���Q��}��"K���XGټ�-Y�67xx���y�QR��8ea~d�Q��$E
;R@P@���B�L�����?5�1�	�҉���A��O��δK�៳U����=6ΒES� �9��e̵3�-�!K� ����(cɜ%|�8�nQ���*K7Y�Gy���/�۴���$�mȳ@~@~��A����t6yXu8[����GY�O��t[��1��P���I(�9a�O"T{ϲϤ֋gʊh�z��T�.\P�����T���G��A��	7�2ꃢ`k��=^�P��e�h����G�����M��$Ԑ�ӯ������J]����,+Ð'�ߧ\��iߵ�]+�
�_��B��%�)��~�<D��Ye^��ǩ-��OX�+k��7ܿ���S�,c$ۦ����߀��{�?�`Z)*u���ԣ��s��j}�*��Pa<�bQ˫}eF$կE���e��2{�X5��h���(��fV��q�zFܓ6�W�DFPYZ1V�If�n�2�/�|�fI����]I��0�(�z��`��
�*�fz]�M�v]�K�(���.���"������S�;������2,$Tt(��u3�n����jc�euZn2,҅�©�4UZ�)�L�v+���H�"�FIX
��㠎,�τM��i9�w�ij�-[�<�1[7�H���D���x�2��2.���t�)�(�E��_qKK�y̛:LuX��k:�,.��g�W��yO&".y�x���q{%�l���v)��$c[��pf�0߷l�`i~H!�Ƒp��9�l�`��S��@ � ���+�r�s����8�C��:�O�̀�%��D+ E�T%���D�(��~��"�Ay��F���-�z�`2m�p �@����<�%[�6�<)3�����<�mw���c{SN>�1�I��	�W��ڐ�1ק<c�x��U�v�Ҫ�<(�c�DNy�e����hz �@��T�����õ5
�[h�Ew��Str���/�7�ꆉE����m���Չ���s��� ᠆�ͧf�x~EڅR��\�Q%�d���&���Z���9/���� ��]O��q���A�vqNJ���k��2��R���ƻ���A�,Jj�I?���+���1�8�d}ˣb7�?�V�.pf ��&(�c��3���'b���*}L�f]��F��luD�,��ӉyD�#�5�f��p6������X���2ȋ��o���a{�BP�Q��@�
�����U�0� �v��1�~!�x���E�h���h�?5��0Wj4�.�^9��{"���H5Ѣ!L�(�>i���;*�@����jj�=��s�i�z�_+�.�%�/�
��>	w�s)�M�i^�ȃ{��$H<��PVqU ��tpr�E����Q2�36+W\�w}�N�z��]�xUƘ}��۽X�EH;�fuhi�1ۋ���a�dI���y5��k�@�5^3�lgߎ͠C�1	&�/jd��e=���%����ul�?�$b=Y�V��^����0��|�T�l�҇,c��f@���ע���� M$!(¦%ӂ��wPij��RLF_�r[�,i�B������6�!�\SeV|��|<���>��	_��+��I�p���UcӂJ_XH������Ӷ���P�B�ؔ}���E���c���u�J����c�w�eZv{w:��Y��0c�<�S (@�% �vK�%��Jm 68�N�el�iR�{-��qT�a���
���PaA�u0�4ᦋ#�h&0G�I£��Oвl�'��^�yJ@�A�'�T��ofWÓ.I�ӎ�d����d�O;)�Q��F{�	����#Ϳ��9]t�����c�>����yA�2�$K7�ўj�%��yC�>§�ق�]D��r%�N���\,�bL`K,#c6F,�iqط����(h�AC�<��.X\t�XD�:�Y���`%����3��ff�j���rܸ���E5lM�-����`c��g����=�ԶK	�Ī	Th�f=aw��� ���,�M&|.�w&�ȴЊ��U�~:��@q����ft�!�Z���s�S��n��Ǽ�/֦��XY6SR.�X������{��7h����+W�@H)��������.�dk�,
�-N_�&k&3ڭ��]�$��Q����[m
��-�=P�P�B��l������&�]r��]���W����sM�ǃ��C����6�R=�0��ujo'V�%�]�F>*�b<#%�6��f���������ڴ��7�-�PJ�iL���W�y�c���E]��i�'�Ė�9��*��8���ow���&�fM��sm��r�B����1��!��ucǨ�����u?��?�i8�|���h��T����Һ���G��?'��[:r�s��ɋ���x\跅� �Ǥ�����((������=|�0��D]�O_��Q�ٻE!+�g���K������>9�dv���X�Q��4��;�7�j�4��i�(Y��cW��a�aV�j�r<Ѡ}(���qҠ���ZݕM��ƫ��ى�u�k���U���O��I�æG��sC�oi���
<xƫ�K��/�M��>���x����lxl      7   6  x����r�6�������A�.n�$m�x*ez��b$Z��S�� -�KQ 4̌.���rw�= R�+�D��]-hr�|*�&o�&Yfۢܕ�<��u^v���b�kx#D_1��e7�'$}��[b�����ZH���g��?YU獭�[Ve�չ�X��Y)bq?K�Yf�z��o���w�~�e~Sr��s6Rc��E��.�������>x���.�a�Y9�� �w�>�]V=��mk���?M �{��,�!���%�7x��M���=՟�DT����-���ۓ��:�h��z�maW���EV#���Y�yN��T	x�qmm�v�ʋ޺@�kvY��6yoW�E'jSjJ�!��hc�Nh�`�(#Z�)�]$U�Y��|�����>wi��M�+�8-��:m�8��$����q2�w�#
����hD;#�E��ݵ������Ϊ�\�EJ�f��Zګ���@*�ѬWf�tڀb���g�F-e�9m�h��U�#Z�6�n$q�r�a\�fم͋:yo�AH�m�Wy����"���hN*TB���n���*���7��U���j���T�o/˩�R´:�����.b�Ğ����8���oJ~�(E(��/EY_[�U�vo���ɗ�VQR�g�����K��'�=�Փ{U���/T"Z0��.���C����۠�����Q��S��u�vF�iOj�_i�\D�~L�iJ��@�����J9�{���E�u����P���*�ǌ#��:�D7qP�����lL"�\�^Ta�9�ơ5<`�F�qx�Jź�II��Hg�h���O@�5
�)���ȊU�ʷP�FX��ag�0�S	4��MD��t<��n[�/	�C����*wf�s�K���ȶ��%,I��p#�&�w��"�nfk�h0dJ��yθ�#3��M��dR�� hn �ݲn�L���nh�ߙ� ^D��*A_��tz
W��yт���]�P}��^��B ��<N$�r��Q$˻O�'ڍ�����cfk]a����cj<d��9T��r]���8W�ἣn@��`�H��p�;������y��_�12�� �L�I��Chc��Q���K��μ_��fS>n��M��`y��ucWML�H'��<#��d�gʀ��@����_�RvG�Dr��v��ma(o-�B����9yhع^������R#��j �~��mj�F{y�0�P3S��a�2���:MQD�9e)�dk�E�>�l�6}A���"`cw�+(��ѯ;%��\�(���;J�m^}���k�+�;�re�����M_~��&�7�kqN:���p�&�m�2�Ǧ���_��]��i�]8'j�hљ��i���\79@�g��/(--`�@��W�s5z���Nh?@[Z#jl\�W���*g���Q�����30s�s��@Y�<j��6w/>��������$�0�]�`g/��t��M0�ݥ�����������t��M�2���H}�mQ�����^�'Z~D�.Ѫu�b�X����q��]�3M���3kĊ��C�b��?2y3����������      :      x������ � �      <      x���ۖ�8%�\�+�63�+�+5oP�!���嚗챻*���Zi{zy�f��|�A��F(ST
���r�-B$�@Ď����~��}8�����}���_��/b�iP%��pN��F�R}�����^~�~������z�����Y�;��#���~�G�}��yD���,��)�_����ς�܉}o?o�|�S���QT�ESv�������#��������!�E<�"=�Xv^��c�p�������C��,�H�w����C�Y���E*�7Oa���	�/�q�۪��(
�Ť�R�*�K)���j0���*:���f>��}��[p�����__޼{��@��z��??~q5 q�Ҥ�׿�}�8��X^\2�/��J&���(' o8g6�Z���*����O �pa\l��\�G/1n��n�AfYR�H��xH����CO � �NA�f�	�0��� �@��CP���K��>�<�?h<���֭� ͓��/����_��>�����ɀ�����A������>{� LOL�I!��MH���f\O\�2�EP��j�߸o�S {2 ;>���r���@�d@u+4�����}`z���S@���ۻ��)�<���K�����-=I���}�~
@z2@:)bQlUpR痴,�17������AQ�U�6"w�����ވT�Vu˒�����՛dMg���MO�ߪ���`{:=�C/����\o(�(�P�J�^~|�����g�b�O���\�v#y*�f翟��>��>}������(�.�����j�x�� 0�Fp�>B�������+�?{����Nu�)��V��Dg �,��"�<ܝg��l�M�=o۾�w6=3���]��h\Oz3 w6����H7�)ˇ�����@�m�aw������j�������z��l����C�a�~�����R+�\ș����;[qG���B�O �����q"�+?�9�;�����mk���fmsP��Lܭ�������_>?�n�nsQ���Ө���:�ð�����\ �����V��&9��m4�u ����m*(u��Z���l������믧��x�����v��W�=��������GL[ ��{�Fy)��S�g�j�oA'�ج( �b p�γ������Rw��b�q������0 � \<{
ď������gu<��@�b@tQ~�	�@�c�['��b��ZG��TW����y6� @�b@w�?u�XP�[`KYf��� _ �ӄ:T�������A��囟�x_xW+7-�M�S�>��K�}9��j�L��?��W���ܗ�k�n͙�wʗ��o?�����7�<|`|9`�N*�8/|܏���r�z�����������ܐ���u� �J�{��6�X�'����:?X�/�SL�2��B~����_�oD��{������t�k[�T����^�ns�� S�J�_#@;�}Y��à�I0���GYm��.��ᲀ��h'G+�����>��� �Gظ@" ;�}��Z�m���a�hE�m�� �~���/_?�K�t?�z�꺄V o4������^�f����A�����=�?
�Ex���_���=}s~ 9Z!��������W�TQ��	vB�e���B�J�kJ���z�n�8^8����R�n0^0�I^>��{�[ū�T!Y�*εM�����=`�`��ji�,���}�x5�x+�Z����� y��ur�e
�bk�]!s]6�����z�ݕ��6Q�_��i����� _�+�j�,�[錮)�_!�_;u���Z9���m�������.4��;�� �0��,g}��j�`&!VlEӺ��)h_!h_xt*�nU����������%(u�ƭ��B}�*�:�)(`!(`�]P��V-��R����H����T���ݻ���@���w>��X��$�g�5p�Bp���0�+�5 �V��Zu���լ��L�_	���Z��(c�_�W�׉*7]�K!l+�<�_!�_t����� Ă��T�:�I#}�OP�BP�v��=�U=�+|�_΂J��w@�y��o�2�0 ;������5������es�j`��+��{�PXxZ����ө-�� �C*q�Sk��"�7R��Nuyk+8 3r��j;ض�Zb�/=,��f�������>h��:#�*�ԍ��[8��(���>�Z3��Ѣ���:������;����MG� 5���|-En���.G.�"PP8���c�tkqj)٘���,����J�c�H��sʷ;����bQHuUN�.��,l���T��TL�e��x����,\ à5ǔ�P�f'Ͽ��� ns�ldLI��zC�� ��X��f}h���� g"7���:�� 5B#�����ܨ�T����� ��9'�F�)��e&չ� 7x�!չ���9~�L�QM}��_���y�T�:�vw�K���ϟ� :odu֖��gXO�1���l�pp HO��S�|��6[����0������=���x t��Y��~x*��eց�)�@~���fmӜ��l.�m=� 1ˇT�V-�8����8�YV�k�c]�o*��;Y � 4غ������Z ��3˗�M��/_��,���3��ؽ�`+�FG���y@�fY�q:,l��3kN�9*���7�6��{ڏ���&A��M5ʹ�������w��A�j�I��P�K
@ٹ#٪�V���F����a�Zx�AzΒ�ХB��Q>��`|f��uU�=��%�=;�Qj�&�-�ܷ�%@��@�CS{���|	����g���>NK 螇�vI�� �`AwW����C �`C��h��o��z��������?>��1��7Hњj�[��`rtU���	vmݴu��{��S�*OE�Q�b)?����J��~LbBw-3�lVp�,]�t;U�%�գ��Xc��� �sSi�}�TiuH��6�=�:�A���C�&iF	P���!X����b=������ pФ���<���D��2���Z�cHڦ�Qx�)�N
b��{SqA`�tL�ٽ$�^��Ho�NTAW0P>�˩[?�68Ҥ>�t~>���k�
�3Z��Ҫ糪���9jt�͉�.��l0��e�ت�M},+wh� m�*ʎ����H{�؄�2�F��2[���=,����������NP�{�3�P'��#����
�Q�S@N�KJ��u���ì�Mx]Nk���v�9��Ag�%�v'�tT[8��JrT{
�PRjW��txl�e
/C4Z�+��c���\@ڠ?ð}���g�MX�.�Hr@]V.�}m�ҡ5��$H,c��>�7p�:�����ӟA�����Q��ihv��Yx�Q�S;P�V���� ߨ�u�靂��B���.�8z���h�V���jͶ�N�����E���J�ߵ���C�H���Y�o�픓���e.���Gz�+�Zx �Q�۵{uے[ټ��s��9�v{u7����is1�h�(@9�vy���g������)']�Ȅ^� ����A�N��� �(��-���+�@:�v��������� 2�Q��؊�|�}������]]&��E��#O m�����w���T:��	�=5�Q����-l��3���q`�;u���5u��ث'�2�wMٔ�D��� �p$��wۄ��sv�qs2�Q�뺏Y��˷��(��Q��R.,� ̨��^=\�F{�-< ͨ���og�7`;X����cC��9�X�vS@e�$�O�V�EK{�̲q�W?�5Jx���Yy^ΗS`�(	��F\���������u�g\8���j����k@��~4�s���B]���G�y����s�}���Ww'�5ju�mF)Eq�A�r��|�IxF�����j_~�KY�?�����;�\���5ZW�P~|�������O���-͘�陟��?;�Gs���#�Ɏr�~�,�do�|��돧�G\�~�    %s��M�n۶�eFlL?�1G�3^���9H�?>�x���V̏Q�����yy���ֹX�D88ǋ���x0t뚔0�<�aZ�E�:���=yb�7��Ǵ�T��+�����I˫<��?����:ɚ���^�V�0?g�7�O����߮<�%P��H��~e��{�>�����~�
T��ʜAI������'����<$$1m(�ϱ`h7\�O���+4;�`�7Ll}�������`�?�cﻔgw�������|V`�?}��%8>���^,!ꣂK&�BD��5�0�5��\6\y�8ba��S��^��>�|��ˏ��PM�&�=����#T�ޚ�4v�>/��,.�j��}lՉ<��,Yd0Zդ�)M�*s_�X�@�(���{Gg˵�d预t\�����+����ÂRF��o����񰮗,&�ꧏ�}���<�m�l/U��4l?��$�6�^���nh��]9�, {�y��'���W�T��������v��Yt@Ni+{�T�"s=�D,2��;"�ka�_=,��E#w�����u}�u��X@����=e�N%i�e]���/���t��#��V#L�I/��Y���H,4 ���H���E]�W�i�X�@j'����=�}�/2���O��/,J �k��j+N��?`���2#�_�#����0��*���.���V,>�M������c/QL_�&^@�b���Lf�<���ף��#�����Z����<=�Lv��h��
*>yz*,�
������wy��N?.Y�0��I��޴b�b�����H�Zd2��#�M�^�˜�F��K/y]�y̓#+�zw�#�I�9�o�]Yj~��h����w��v�e~ς����;u����U]�����=��k������ń�i>��s�N+���X ��At�������Q?|���gu:��O�-�{ �S?<���{P}�$�ǋ^��J�{~���Y[+^�yU� �WO���������?�>�]l�C���N���*\��W�yȠo�������w��!=�������d��rðnt�ˢo%u~K�F�����}�I�!�����o_�y��m�������Ӌ'�Lû�u������F���� bk�A��]&YW�����{i:�j}[S�IO״��a|i�̚�]�
�	�8ļ��ߞ�:���=a��������+u7�0�GF��$�˗X[���n�����Y���+�9�0�Cޛ�9]k����|�@���Jo�	�9��ۿ����FwZ[G��>&YvҢuŶ�~r��	=�urf�kR�xq�{��3M���)�w����s��d�O��~���70��t4e1�/juh??<-�,.@#�Tꉿb3̂u�SV�u���N����S"�^����3�Ņ���_�c��:e�
��A/齏�m������N�3w��1�]���|��]c jF4����ʬ��M=#[Ǿ�eZa�j��eM_9�S�)�?�p�F��s#M�B}�֓�)sx&J��*��xj@/��Ƀ��}M�]^ǜ� ��.����4J����-�3&Z%A�n)9�����a|6�����_��X�0̶GY����ŏd�X� �mM3�uI^x*���,R~[y�q�m��Ҟ� an��w"���`�m|H�+~�,��F�YU2p����9�Lf4N ���˰��Gz�\�/�9\sTz���,
��:��t���V�Z�7�Gb� �7z�}��yX�a_�^-x�@T[qq�E�Z-�Z^�`AL�d+c�6���Qڮ$�m�Obs}go&�%�}���-X��N��y���1F�k�.Z�v��4F�ŜX?NX�qN����R盢��i�/X�u.��'��|�"�?=NZ�'�z&���t6l^���îP<vȱ���IU!��V����Tj��x\�K@�S���ԉ:�:I�@슓��Ň�a���\���'��|�"hu;!�`�" �so�"8u}�gi����vm�g�-YT e.KԾ�.�a��D�v�6A,�N\�b�$:�.DsAI.Y�*{)O˝0��n_�{Zv,>�N�M���B?7��r����X����,��J����w���Ilh?�X� ��h��h/�0,�@�`ӕ�Aۤ���ZU۝R�k/bQbf��>S� �ў�i��X�����QTEBs*!��]����� �-����o�B�r]ފ�=�e2����4,(�3׹#*mG�D�*5�XH u�n���[��Ug�j�"�s��&���râ�rj��T�V�_r�b� ��&Mʍ̈0��I;O7�� �5Z�0�z�b����Xt {N��U@s!�Z����>� �i?���W�u�b�|�������C|X���0󲏨�x�ǬXX a�(u:�PQ�o��Xs'}g��R��^ܳ8`�]�*ɥr�'���Zܳ@ �ܩ��2�=,��=3��6:K�^��g �9-ᒋ�����4��Ν�!���wq��I�ֺB�7n��Q�\�3��=G��7��E[{�:,�G7hj����_��$:��Qݹ�Bϣu~a� �Q�SE��m��D_�, �T׽���ԩkc[�!˳*ơ�UY���A������J��3bu��o�B��A_�GA�E�%J�,�g�\�QW�����$�i]g:I&Pw���E��ٌ�f�al��v��gFB��AX0 ��H��@�*�=�arv��BdNu*�N`2뤟\�LXP 	�*�����	� ߡ�K�~�	���ч��3�b�"x��U&E����]�����j�.����b¢ �w{~5����\;���3mjIǞ��	���GO�Yd,�^M?.w��Ga���*)�5�N�U����2�ތJM�ٓ^�ʔ P��K�{���M�A����/��T�so^L���ӽ�^>�
,��G�x�'��+P��虜�Z�e���S�Պ�I:��؏������,ݾ��y�~=�tf��"�Έ�R�QV�R����8e�J��Q�܉\dc�U�Z���'?N�r_��@�ʼ�ɪ7��0m3�t��v��-���?��ӟ�~HO�����0�� Z�ՙ�t�-�Oa��m�R: >��ښ��<�����积߾���aC�yHI�A��U�<|�<�������.�2[X^�2(�I�M- "�k�ߟ�� ��"�P�U���v��y�;4	�#��Ɔ�Y:��F�����/�2t́hp!��$��-��]?@���>^���z�ArO���_?�] ��_]��H#Q �������������`�Y�\�<��v+��~ �C�v���h�r���Ӱ��<r=����&����9����?�O׾����!�b�����[�+s����* |�������ɿ��R?�������'�G�z�/O���9ǵ@�ߺ�n�� �`����Vt�^��8�@r��W�{%u^� T>b��#����ց^���W�C\X �S�z�U�j�w]7K =��s ���Ӌ�m��4��E�~������o+n����$,��fN������ �%�������|�l> �]U�D�����=��0�]��ח�*�?�|����W��I(YIr 2�� ��V'�z~y�?�Ա��t��0��?&��d��r<�h�f7�{��;�E��������w���Z�qבU��������L�:t�bi!h4wy�pd�k�|��0�μz=��f�Φ�ɜ9A�_��&�g�1wg=�ݜ�wR2��̑i8�2q⿨5��k��h����@,P{�c_[8[2g�=�0�$���e,����z����yX�Y�>(���p�t���
�zݑ���^���#BV�'~KA�fu2:�O���H+p�թk��m�;�m�� �;��:����Qh�Q��+]��OĢ�Qէ�ӓB��ӗa1��uY�:]_I��s�}�m�X�R����Q���
�<꧒�a����d(�I<u=��t��t���=�Fp_�i��    ��Q�����g�3��OLX޳�`��i����ߚ��6��X>�K�5���||#&fl{��q�����,6 �@��4)*���ܰ}u,2�R٧3P#�I�����\�������=�Fu?>��J���&�/z�
I�+�B���������,`���r���,H����=U*�JJXxb�������*wr�K���HP�^h@�����WO,P UA��y��-���a���+>P-4���$M�b_�uѸ]��!�F~���ӠsA��=�'����<P��e�	6!�
�el�^��y����Ģ��oJ�n�ԧI}=�l�c71��e{Y����w*pg�>X'*�����XL0z��.�k0�~���w�����@�Q�]%5i�x{,,���Wņl_�
�L�܅l\���1X0����m��POg�	hLeF�:M*�8�T[?,�;P��1�|�#(u*��=�	���ZL��B��@��@rr���r˙2����A"m i�n���gc�E��� W�،2�l�� ��@Y����<_S��p�"���kQ���i)�`�F��}
��I&ڪ=zzw,$�P9+��
�.��lJ�ڵEs��j��j9��:��I!�A����m���>A�*�zmͳ؀����r1�X\X�{�E�I�x��"zE�׵�(�x��¢��M#@�V��,?͌E�	��w])����eEy�\\Sӳ�<,"��LW]�����`,(,V����5�3c�`��>d^�ֽl]0������w&�X�Ef,��/o���ڕ���s��E3ҭe���,�u� Ր6&��w����"z���o@�ã�2/���X@@_��t�m���B��J:����K�ܯ�,�y�P����׵(-ܰ(�ƽCu�tK�3�k�y���V�{�f,m=��瞐7��@�h٫d�-�f��`�� �cOf�-e�=��h��z�b��ҫ��n�ѲW}����;�g�G��
d'� �5?߄��z��4���N�ѭW'�Mu�]�~��`�G�^�М�T��m�0쯘�ϕĚ��b�G�^-��	�Jv��J�`�G�^��\��=,�W�Ҿmӡ(;��h늡�tT:�\+���Kv��5mG�M��4��E���b�G7]������.�d�GS�Q!����SQ�$�s�Z�'��ri�o��NZ��l�d~0�"��SP$�x;�����1�=�%��zm�Њ�OgS�:y%�ڗ#�G�o�v��$�4"�W$v,|�������c%���5�<l���2�^�N�2����g�1.bȸ{���2{_�FF�� �I�z2}'���#���W��A3��n�=��114D>�w�}�bx@��w�<Z<���M�BP��0�b�)}�%����2Mx���u*�I&�b��Ќ�yzJ�E],4���.�����
����P��,�}�� ur��f�.�4�R-���7.8FPMO_Y��#��[�qC>P@'U�,��ھJ�@��O�F��8>F����`��ս���^Xd`z�i�V����H1�bh���~��gP}�?WGkZxa���'��H��"FN���v�8������+!��[����a����L���um� ���#'�l�zI$UOeوC#�/>��D���]&c°�O�b�%��F��6}�q���&b�� H*��	�4ۄ���I@���6��c&�F��A%�X&�^�%�L����4)ڋ�\��'!��?F�(�	�pâh|�'=���o���Ƙ���sdW>�?1��U��:w�A��Ϫc������� 314r�I�_;��\��pÂ��oҸ�qŌ-14����xE�v	�@`��E�G�sN^�c%�F�_�j��>����F��D�&��S�D�36bh���t��21
bhT�ˌr2Ta�e�ԅ��fĸ�!�{ �%�1&b�^U���i�N�ԟ/������^�7̌��ł H|U��j3�HБql˶+D����W�q�m@���i[���&�$t��[�����w�������4�D����דG��xG�d1�bhd�EC��\�/[7,L��הJoi�����h�!}��R�;h��9+���w�q���)bŐi�{��#1d*�D��)��x�fT�Ј��K?~��D�/14b��f�\QC�|q����#�������2�=�MŴ��VĘ�!�|]��w|O�FI!�/
��������C����7�a�Ip�P�6u��e[o,�*�n�R��ՙl���!Ȃzhm���@�IcЫ$B����7���(�Ip��b�m�11\���y�w��}\C1g��(yLԒ�~P�l"�O1uP�x\��6�1�ba�:Sl���Ĉ�!8�Welm�� � ih���l�	���I����S�e�����Z�e~K����Xx �P�(��1�ba�le��ݕ/,��1C#�?���~��@���GG4�ϗa|�|Bdz5*}�E�xH��1������}�����Ox��0c�aE�Tݳe"%��7�y�=�2Zc�!pR��kO�"�jW&Ր�z3�=�E��֡Z ��Lc6��r�^���>��rH�~�z�_o��ȍ�����)�Ft5�d�P��r��Q��+��s�s��g���C�x��%8m��� �c��eWy;20�c�2�&R�֚n}�=w���	
�{3A�n���Bd>(&#<N��?�x%
=�/V�_ɻ�[ļ�a��~Q�E���Ǘ��{�2�̲�؏��i?F��8�qW&ԚZ&��m�̑i|H�6hĠ��qޙ��	s6ĉ�Z��x��rfb�e��`��_��r�1�������?O�}�-�s�o�!�4N@1L^>?�翞�I��a���GM���!�ґ1�$�=�0ŝ��x0.�����}t��NbuR־Xz�5N�9��L��e�~��  �a�H���qb(�Ƀ���hF���za�� p-)�dZw��tmet�	h�'j��\d}4�H���
d�ܿǧ?~�<��v���U^Xl����ԕ��katd��#��k��!�ʲD��8�k��&ޝn~���4N@������),,�ثAeI}K��mw��5N̐���RV���V��81
~����=�4̴��Qi�T�I	s������)�^�n��k�H, L�g'�� .�{l=�`�T��Au�We`�℉�ʬ� �t����iE�.+��.`��D�k���@ԫ��\�/@��8���z6�Wy�RY�0u�#��8���)ͽ֪��_]���/��e¼���TI-��Ӡ���sW�7N��9e�Շ�B?�|���\��}�V��H| ��	�=[���8�*kQud�������B(pmь9���^?��E	\[�D���W��:�B�T����{j���QA7�皰���Q����~XD��:��AM����ń���P�4��V��H��J_wG΄E��<��j�G�e5a��e�K&M�L䞾<�����Nȵ', �.�=i�Ժզ�#$��� 0y�p��0�OLʢ�2I�2TN�q�&p_	�Ք����;����ѧ�g����� ��Ts������e*׭��r�@�kH.7�Hu�.
��sӔAב*!F$�����S��j��?5|�,;����Hl�D,LY��
$���v0�+�3-]��DIXMY@_��u��J姺��c�e�B�����wegn�&3	�D�NiJfq�}�ݸ��X8@CP��ROy ��Q�X�b� �@���Qj\߇��9?w�C�eW��x�� ِ�J-/'Y,���E����o�,	ۓP�j�"���}Sҹک��0��'b�h{'4*H�s_$�Ռ�tU��y���MM�{1n΂���-5�;����,:�Sh��.:�G4b�ݨ�,8�W�f���2Y��ǚ���d1�C��>��:��e��<�s)�:�������2O�9��R7    �}ҴMP�Dp�Xk��,h�m�+
�;��Y�0�B4�v���ZU��>�yj|X�Y�@�P%���H*�:aC�f��Ãn}�ƲD�}��F�=jaun)O>��:�='q��c]����ςE��!�O����h��&������7>�C�i�K]ɔ�fa,R���.Շ��2r��B�?����+Z-X�X�Qݸ8��k��V7,4�"R�*]�T�Y��N"=��(��Cr)�u4�Ղ��R�Mۥ�_��W��Ϳ~�bړ�c����Կhf��w�d�]J���2�,��C�J�A��:Ќ?��VKkЪ���v<�.�%5�Q�ͷ��M���t)��g�Ba��X�A���*m����&���$��^�nXxAORw�rw�{y��m�>1�KzHK�1��<O���lNP}U�.�� �ޠ��O�Ho5���.b�s�9�q:�X@�PLVA��)�C��ŀ�Lg�뭹q���H�QQ׭��U&��]E,.�qhݞ�LC9{�ϩ��(X�@��?��'�*Q[���#����h#�'!m��=�P�>�n��j^כ-��X�@ў��Tg
;�H?m�bGd����rX�X���F�n+3Vg�b$�z�r�q�X�X��?ڡ�Go[fV,V�զJN��P�t��G�s�"�l��.v"a��h~c�]���yЪqR���Y����ʭ߇���ź}����b��H��[�z���FAc�m��{VF�O�Ou+x�g3W~L0B⠿8_���'̾i�[So�|��!0��?5n&�ZK'�>r5c��z��2��1g>�8o����+���y��h=�W��kF~�-�;C��4u<,������V'*��P'��ޮiR�E�s�|�+�x?_u�S1^���
H��ǽ[�`����D+o�刅��\�)YE)�['>��q)�(�뒫nY��!�I����~$��B�z+�����ϗa� 8\Q6�y�?M����SY4 �A4���ot����3�� N\���>{��,v\!j�a��"�\x'v�5U�<cE�p������ʸ�F-\�	�R���XD�i���P�U[�Ԯ�N���a޶Q�Q&�h8e�flМ��b!�9]u�;�D��K�c�bb��nn�����Xx@�У�*6�S6PnXh Uq����|�r��Ä����H��Nv�Li���MϹ"�f������ˢ����ڛ�����-��˵���76�ed�t{��O�c����<}��fS�;�
�UY�I��9?�n������ly� S�"�o�n���mn=(W	�Z2��|��r�A6*(�8�j}��.�#;�����s�,��r��:R�wZمƁ�yM� ��0�֩��ZjCs�R�}��F�R�낪,ģ�u�G�S������m�8�>҅��R܌�8�>�٦�g�f�C鄵T꫔���5.{���a ��M�ۭ\�wEmW�"�u��D�G����.f̅�&\����`h�8TC}����QJ����,/�����r�>�u\��dCI��,`�:Wא��yy9��~����h��A�����D��D�!)ԅ^�X��.��5�~Mǵ������!yH���f�EGK�c^�t�j$4[x xM#ɖ��<|� l&���X��'��� ,�)o;�S���郥i ;W�55�Z��/��W}Z���<p�d%
=�G�8�� ����͡Sl���ȼ����%�{֙�#z.�	k����ƁWdQz�n��9v�� �"������)�-W$Od-�C��<��\I/L��s�Y�Ȑ�#��p��"/�q�ɡ�Qg���m�l�JkaX�~�^]4��y�D�*z!�D����hD�d�.�Y�Bf	�E��󲌀Z4@v�
M�VX8 h����A�W|���1�FmOZ�C<��Y3�LTI��o֙���M;��VO�w�Ĳ1g��I}�CI��9d͈�A �!ɉ�p!�h��=�s�|ԧv�Ƕ`�FF��hm7痴��T��2���@�:W�@�iY�e ��"��k�S���ˑd�7��?��}�� a�#v�$Ά�[6��{g3h�F�_�V@0TV�G��4�[�y�w���)t �> ����Z$��M���,k&T�βӣr]8�=Pk&�e"O��&�Q����f�X��Rp�=b� \�R�Y��ܑ��h$�X��[WxԢ�V;��fq5�΍j�@�r����O���q ��V����q79��6`������S�"G!�����&-��Pg|"-v��!`��n2N/��jE�]!��:9%$����T�ե�=h��fP]�n��y@�sf�m�ԉt�r�!0kz�d�nVq�c�s"-��Z�)��FF��1��o�F�KK�GH+%���v�;K[G�?Z^KIY8��\&S��Ƃ���	�T�d����������Ǩ�:'���g8Xz����B��m-3���þ��O��FW�7��B�8Ȧ=�Y��a9x@UH�0Kb̏��,��(Q_퐣�X�����'-�`C��������0*A�A��������(u*����aF����dԃ�B�8DJid#Gr1. fT���m��E>�Q��  � �"��&(�"pI 2�B�\}���\�ʨ
ɜ����Ca�����+`�,h�:H��녅m ��\���k���;*�j��rf=�f�Tq��F�H��:�{���=y-YK�`���x��j�	�F��؊=%�O%q�hC=���3�U$*)Sڠ�q���#c�6�:����p �O�NNR5�E��{��:�',�%�X}qj=
��Þ����sG���� �-���TD��ЎS}��.Y�Hc:��,�Q2�&�U4Uy
T���y-E*��8�Qw����*��r��9���SM�pi��(9��C�A��{L��2���0��SC�m��{����QyjvR�AZ�f�"�%F) �7���0G���^ʕ۾.���S�Ӻl %(�����'R%1�u���%HYs_R���m`|���r��+�s@6�Q:c 3�����g 7jR�Eǭ%���`5�.o�o냇� �Q�m�A��kYI�մ �g��.NI�/�.u��^6� >3�-5W��J���>��2�7���@�JU�����Q��DW�߷�_ըUu��^?��>�Z�Z������eVzx 5+��gY��Q������d�〰���%�g����} {q���Z�>29Lg�Xõpl��;uҩ�?d��(�6�Zq�>�:�g1����%���V�Ni��5	X���x
�5o7�(j�(=l����(k%Z'�GJ6�Q�J�,8���Z a��\v�F����E1+9-�;|�t �,G�Q2�몛��fh])=���G@�Q��~s�<��t��G�*�ez�=iP�����%׾��^�P�%%Ե'NFz�nw�z�٫l�{�^篱��g��D�P:��!���l�F�;
Bi�.;�+ z	�+��+o���锴�!2���)0\���}I���Gq�F�x����;�u�
���LT�47�7T$���y6؉&��	�P�Ȭ}����6��]L�n(FR��Q�"����=���!���Y��^�pC��C�����mM�$GX�� q(C�j�P1���7��׵��[8 ����E&���XC���j%�Z�;_n'���j���Bf�L�k��: �!(I0�=��&��2$$��A��f!`�2j�N��d��oȐ������ 1�)��^�"�����i��c�2sO �ʰ=�T!?;~Wg42w��$~�?٤e.��H��Ε�I8�بO��R>���C&�]l���D7OA㺝/�pʌ�.�z9dL�)3������k�6��B80���!����:�ʌ�d�@�SI��vLˌ�d�ޏ�{���^�S�4ޕ���vsx8�%�הl,������h��0�Kܵ�~�3�IP�g��c�b��쵏~�1�ڂ8]����If3.ZA    %������z�ٌ�V4c�/ ��מ]6;�H�(���?�#�>^=�v�x�u��;r1���
Q�խ\�<�p1�u��(���V'u�9����Z. ��&��Z�AM���f�sga(62��P�����̀]#R�R`HjRKP�!�Z� ~�X�����.PkT*������5-��� R
~��j�e��K}Z��P�'_ /X�	�E>��q��ma��0��it<[ga��Pˠe|*E%�Q*�� ��D����H����`07�<�����`�_���񘆍�`t�M���P�g���<|�9���l��`aapː(
U�k��GR�> j0S�Z.<|j����Lʭ3�@34ؤ���4��os`zjJYNӂD>.Bc� ��OWu�Y�ޖ=54~���+`p�N"���؞22�|����������q��3X���z���p6������_fy�z �A�������� ��u&�Eɋ��zX���n�E�(��!>�[��q n��veZ�h�*����~��} |?�R�9\���a	4Ϙ�L��.�$��z	D��7T��[�-��f��P�҇g�4h~D\��M< n	@ϙ�̝Ȕ�+�����zn�d���%)��9?@�_!j:ٟJ�>��,� 3�~�.zQ�Z~��c��ُ
j� q�4��WҎ��(6C�uk����: 6_�����ێ�^0�������� ������TWat���|��\�OA�q�� ^���b�U4ݿ/p��1��@���������`�����P�:�\�JY� b����L�k�]�F����z�W�pA쫓�{��n����jf��Z+`wif�=H����,ҫ=��������1Z��m`wi�{���x[E@0HwZ��W_Qt�lG��IM`#iI�|�
xѮ���k�x׮i�s�o�{�\;�-
�c:*�fapӮ}(��KE'��ޙ]+��ҵ41����;&4:�����נ����YR��Y��#��D�9y������� ԑ�w"n�F���y�N�hp�Ne]���j�~e����t�}��Om��Qoz4�Z��f{D�|��Ơ��5	ϒ����	b0��F-�#
j+4�A�۵���ֱ���p�x������~��;�������.��*wb�Y��F����O��8$�?�Qt��ZF������>����W:B,�/ay'����ʚ�N)u~�t�"�Z���O�&�Y�_�~d�����\�}��'x�9��u=R@�<dOϟ����^�B���4���'���U�w��Y��[��C3���/���>��6�\�#m<�ܻ? �J��9�#�ۀ4�]Rja�BTc�( vh�l��XX�C3�G�j(v\���Ϊ{>�dn�>��� 맾Tz/�Z� �'����$�ƙ���Y8�A��qu?<b��f�p��Aݛ������P��+N�� ���*��H�����S`z�Z��sݩ� ѓŹu�Ņ�p�t PO���%�)�06-< �gU���*��|�*��Й����т4��Ŝf��1�,��sҚ��p1ʸ��,��A���J�)"�8�΀h�9b��RF�֩�����)`x��?�}u��ha��C���t�	���hr�Fѩ0�M�Ŗ^ m:�ј2U��Zx�A�HE/L�zګ�ط;��v���NN�8C>�2�gl��Xk��] ܎m�v��} |fhZ���T���p��a:�F�ց��+�f:�������7���c��3CԪZ��}s�`� ��C7�k�/y�9�B�n�/�j�K��)��9&ˣ���Cj���$6��j������\� ��˕}X�߱S������c�����}��"]��YX��l�W1>	��4�.G.�:ɴ�R݌5?Zx ��YM]OZ��B���Q�='@4H��&v�j�� �A�`�W�K�x�ze���/��>�cM;~�dP=?�|ܫ?��p�\�`|���BR^��G����XӠ|�i�DIFhZ�Xw��@��JĉگI�J�w�%@�G�`����̵���.����Q���F�����Tj񮯲p,< �`��hrzgꄅ}�\���n:���_q��B��U�p��js[8 �#D98����# ��B�F�p6, ���t'�`]��BzHHD��!�t䜫���k(=���r�K���N�����I�pP�Kĵ�E ��к��\5N!�� �fRk������V�1�&�V�T{=N��� �l��I��>^j�Lm� a�K��@uK�:~>�IS%
��.J��������A4Q7��2AWz`-��`��J�ܢ��g�g�+<��bL���y�k�c���bPL:�O�u�n(��T�	VǺTo6>��A2!���Ѯ�@/&��C'��R���>��G��L�����KW+;x��a��"����p�%�Š�=����Ԝ����2-| �P������z�؂S|4K�!-�������/a�����MՕ�����ʫ�Z��w���~V�R �/�"K�=]l��>��~eR����ϙ>�D��ed�b��S�-�#a�����>�����3x8g�\����?�N�z�r�-�Ɔң{-{f��O(ZO_Sm��>���Á\C�^���g����i�vG�8d�����N f���,yd��!\#)=G�4'�$��O�� Ԇ�S�U��m� �Zl�:��#-�֌�sj�f��tĶpx�O�>�29"U�)c� �~E�yO!��0Έ>�N��E�w��N���ҏ&\��q�vS���}>�t(��T�� 7t*�牤$��$��}u
�3�OA����������SKJG^Z u���y�MwFzP�=�eL�7�O�rҾ��ݟ H(ɄzQ�X-��6@����u\�CǢP��R�|��� �{M�v'��v
����M�E���� �G��v�p��x|����|O�T�G8&��jP~6r�bea(�gӊXO`h��3`̞���T�����ݙ�!�w�+��-��33B�Vg�=�p �nO��_�c\V>`k�=IU&A|U ��pk>2��'����5�Ye��X�dgg�"�Lg��댍��DF�&θ���̣	6�]�^����³�M�vb�:�&s ��EzvoD#�Q�?@�a��(� .�;��nݷ�9�ʈ;t}Jš.+g��WPwr"�Pf�r�����=#�hn֕� ��w<$t ��숎�&��
i���k8;��D�÷#�,��oX;�4����}C��@��S�r}] �#�������	rK��+U�x碅i ��{݅_۪�����b�g �LW)ɤs�_�`�����k=<�`Pr�S�Bܐ�o����p@��Cԟ�8~&���z	0��C\u����_�x
����?G]O�Z�eT_9�\PK�zy&�T�m�~V_Ѡ�T3���٢���@4�9T�WqU�%@�4�]�z�E�ЩE��p����4�9c)s����3�]l˃�U/���f'�8�J�YI�	0mH:�ؓf*񏝿tDL���	�0�k�c,L �+J�~��1:������L�d����e�x�Y:V��"�z���}d�h���%�X�т����k�X瑙aT��q���yl]`�ԧv���a�T`��Igj}���vM������T�k�(8,G�$۝�oBWF߈������] �+�qT�T��e���:Z�>����A�7����>Fw�M�CY$[�~����̚�T�ɒ���l�D����
��׾&���z����C��K��	���ܜZ$�t�����Qj���	��'h�
����9X����u���nOU.��/`ئ57W��ӚK;��L�q������]�v���'�jI{j�n&���HQ!(3QI�7r�3�~������ܽZF�Kkv������@�Ǯ��[��A��uK���ezT�D`�u�񅇽z    �T�L~�~���k��rh���;��� Ġ���
�x0� S���}�G��<�����:�G{B�+۠E���T*V�Q����ܲ� �N�Ei-w>�%hP��ܔ�?�L{m�%�븼޼ca���뒇�����&H�֔�vX�@+�/M�����9���=�i�)ϔ��A�f,��ۏ`�p���yE�Rf���
.^�����
��>z���5ṭP+s����:No�JO�:�ǒ|.&pqN{�t�/N�#[���)\�#�%�C��u'P�,b�ql�p4�#p%3ȼ�m[؞�6��Y�T�Kq:R��p��&'_���p Ds��{C�,�ц�\Q�����>`ap6�g��N�#�y��6���X�B�`>�I�b��r�3@緁;����^'*Z��q�{H>HԚʍ4����h���oJ�y�W��^�k��b�]5�^T��(P�m������^�h���}�nN�o��4��?&��vg�8�ym�S��8�u��U,��J����@��=�N�W�_����s����\֝d����-�C��JP��x������x8�A|NȺlq��c�H��ZH-�&�m=��]�X�9�䞴��$Z>^��p��N*�[�8�RE, �S���U���|J��f�%��8~i��̰L�:x�� >e�h�]&�o�)�6-m��-����RO����X����o���� 3��X�T��c�v,< �fp�ޮ=mB �}*�n`{����, ��@�ۺ��bu����Д� � ���Γl�"na(zP�Қ�/h	� ��dBy�L_Zz���'�lhb��BR�P{�����j/+&h�KQ~HL;��'`�̱lS9Zh��\����(W��6�+�:SB�0(�]�������Я�H��ki�j}���7��Id#�N����Ȟ:�%���ɵ�Qlˬu���=7l�ǽ:T�b#Ɣc-�ϠJ��z�8_g�P�/�d~� �t-�i>8'59:�A���kY럩���H�5]���J�M��J��>�Җ�4��Rt/L��
!��2 �8��%�F@�ay��'��(B���e�������&e�u�{*��|<�7�ű�J�[����n4m��8��0Ҵ���K��ԧ��3�V�����ʱJ��a�\i-�uj���d�%����VR�g��r`,��KC?���4*������a�������
�c�D�WI�q���>��d�=T���7���qf��e���`H�@4X�t��1��0�-��l�Bҽ�g'K/�2��������gH�󣼃y`\o�8�윋{@d�nۿ������K(�q�_�@08�ݞ��*�.���@,��"w��,B 62$d��+�,��l��z�k,��k�z����u׎�8x!���+9:���<p�h����sj_��/����s9k{p��>�E�kr��_��z��Umg7�18�`����Zz� �����B|i���tp!�Y��A�Մ���|O�o�K��)��6m��Ɍ�8���C���5o�Hl�8��d����.QG��I���L�b��P�V+@�'5�3'��{��e����b+���!�#��Iܷ#P�L@���%+� m����B�׮��n�1C��6$��p�ffOQu�a�26����.�؞����V��Zx 3,�3�=�Hg�<DpP��_�Ԃ��ae�k���J�� �1ݺ�Q>��VpU������S�k�DM�[g 5�ct�)���2���^T�t_���q�?��=�/<l���1��:���{-ǌ�������Χ�$y]r���^��z��&�A]��� �����=�=;�HP��_O�(�I}����	0;a�y�B�q; 넍��b�9��=�+�����P��`|GAn���0C�?��6ժ�TI�N7 2Ha�B�u{�{�L0�Pu����� l��H�G,��h��{Y��A��W��]G�p_���Ӿ�w�9.��
����uR5z�BCM����B𾪻�dA��1�de�����Ŗ�ա��a��W�x�źQ�yt���n������wΆ���>�-�b����<P<5�47��q��pj�>��`|�`|5靺����-/�}�z r���17��UZ����қ���/�^!�^^jr��B����־-<���B���Ĺ�c�k"zyX� z� z��"�R�)�ez�G .x^ge�.�"܏,�z�3�OU�}��J�+����[g����L�T�WWz��W��(�\+��
�;7�&�����z�ۇ�t�S@�
A��t��*�Z����ڈ�*wοd�d��C�\� �+�kS���-s�U��`:W:W*���A�
猉)�N�����ރ' �	`^nea�5җe�Zպ^qv�BWҔT�p���՝7��z�W@�
�K��%��z׾���l�h6쮫rg���+��H#�hf�5UIc���Λx]!x]'j$�:���<`^���&�e/�+�Khjzӈx�o��)Z���ӵ.�طvz��/L��z,��[o*�?hC�3�~�Wh1僲�}PkD���< o1ǧZ��A�����C�t��b��7Ɍ�ly�Ӹ"���u����	���D��v!\�`w6����.�l�Hhli}
�\�!K�n�U��L �p4�#>��]��0on�d��%��jX8Y���� ��#,a�ڄ�D��\��J����E�1j��������jp��J=�Cu���6B$r>�̃%B��I9ȍ
��:=����l���e�� O�vl�0���u����� ����t"y\N�����r@���:ۏQ�,��(ЭE]��>.da 6���D���R.o6��*�x��&���if�5N�Wz�sK7���k��z�����6�9�;�)��)6��A�DDnm��pTņ6��&M�8 ��LC'�;zr��83��ƺ�^�^ ��܆�2�"��Fan�4:�p��ۂ `Fyn�S<����?�Q�ۨ�;��d+=@l
�(�e�:bc�%�M�c#��	�]!�Z���,CG񮮋�X� �Q��v���1���)p��\*hϚ���ցc#��)�f���t
$q��Ӫ1�=�e$i-��o�N����@4�u��>�t���F�N#��0����� �w'	Yx �Q�ۉ��nva��v�����_�'���,� Ũ��ڂ����n�I;��һ|$i�
hF�n_&��Jj��|b����]F6�E��3��(3�t�>��`,,�F��:��>:� ����+��8��9 <_��W��,� ��	wB^��ܗ:-�1s�e������s��̰�%]6
��r�S�&#��9�9P��^A��>����mT��܈&&��}�z\��WujVYR�&��m�9���^�<�@V�N�Ӵ�;<@>7��z/�[& ��X_0���4i�j����aм��@�z_U�'MY麍d�l�u@,<���w6��) uS��$0��9j|����u���	���^]nN����g��|�{axr�"��i`z�hr\�����(��	D>>,P�^}�i�*�),���.��f��:��k�o7��_�5t-�W59,� �F�A�9�z	��މ� ���B�N��62}�hM�C�cRŠ!�?�m�Jz�v	���T�����6�; ���@ԀG����d�#�ѦI�������]Sa��r m�7��.���r{���Lx
��~|zy���jFu����]" �����6��/#�<�s���lS%MP7��m���C�����h0����T��:>���6@��u�n� މ���r�h[O�l����y@ye�\��|M�x�]�~����p����kn�NTB��]��L����")Ƙ6����t$��l/�B�q�2�d�Ï�B��֧���r-t�Czr_��@���~��Vy朌^�� ��"n�f��\v��x[����@�-���[X_���X�    �W��"x��[*�i���
��\��qY�5F�l:1���EE�LO�:�ցcÂ�F����:�2!(u�m����KOf�PE�@3���H�T#Ǻ�-| ��C��55��ɬZ�j���M-Uy��`k&�$z:T��#�L�z�y3*�lax��޸��������=��eZ��7��/ba��%t�qK������E�X#wc�r�@��=s3���FY'�0�w��oaН�Su�9��IY�l'gr���ng����(��X`}��p�����hA@YS~��.h^�3\Oߕ��]�\o�T��8c�.�~��4�E<<_��t�_M��K�oW8]����E��aդ"ŗ�ڼ<�@)h&��TR�
p���fRHu��Cj�����T$n,�O4=�kŻtG-��bZJs�W7;�y\+��@����\�����GS�\�W��^&�2;�rU`�����ܾ.eZS�˥:~����� ��\��!ht�_�-|��E]VA�օ������)��͋$�Ǿ���%̣���9��}����X���~4�7w��ӝΒ���f`�������T����3ʍ���_˃va�{3 <4|�&:6r?*m� ���.N����jw� 7nv��4A|������.V��r~�@����=��P��J&��j\�:���g�T/�pp㾗w������3�7�d�\�&��[��q������Ǜnw0�'fh]>Z,�08O-ZWS�Dv��n�����uoG�9�`zb�A������@OL��j��~�1�@��J�;��z �q���kb-�=�Znns �KI��2W����֒�# �M�$�Nc�� ��N��8\���O� �q�f�N?�� 4��Y��u�����<5���c��-��<��WX �S3���<��$Oϕ��u!$���x�4�SG�Gj*گ����! �)�	պ	���F�:WC��= - et ����#ĳ	3Mab7F'�t��gf��>h��V���̌�ӍMJ��J��'/�at!T2֓�(	֏mw��K -��~���2����,�.��I` h� T4��|$�C�X��D�I�����чPW}/���&����L�Kǉl�c���8�8���z�עV��;�"���ϟ����O/A���?�M��-hG 7�:�'q�X���Z� �!0vc��.,�;
Ψ�_)���X���
(kk!�щ��f*��S�-��sVyI�D����B1�r������ G���(-�hF��N s� ĉ
��SI����k��� V[�?�/T����vX� ��w��4��T��X�h<H��zG�at���u`{a��%�H1+����Y�6#V7�}%/�x</�r�CJ�V��m�x�F2�;�H6�]cF*H���� P6]m,�qތ�m ش�z⡳e�vi����q vi��^�M�C��hE�A��v�������Eg��F��R�EЍ�Բ�w��=`�4e��
5�&�|��u ���@K�P���\7��=��f��z>'��>��>�,�粂���=��V���d��}�mY��z�x�� � 3���:����.o���kt�?�h��%�@0B槪V�.i=t�t.�B`92t�X��m�f4��bfm����
����!�}l��5.��} c!=]�W��L��
��"��kN���$<{�BY-�/�����}�iԎE�c$�Kf�����3VD���\������`�V�R�Tm>�s���M�?����EJ��|�C�<��ӛ'��_[=}�w��;�M�#S�)�DI/d�es��kGS��\7��,����if�	b)I�m<|��qa�i}`-
��!�ð�������E#/'K윰  ��^���E��G`�_B��۟���|�}Ø�]v�i�� ����]Y�&��<�+*��{���1ЃAѧ�:ёZ�B���bˏ4e��κ\��y�bd�sF��b���.�To��#;�`Q���A������8e��3������ړ�7� ?1C�H"�L���U1ԃ� �:�v��x�|m�!b���)�E%��f��P�Un:r�o����A�إ�d��	oAMU)����l����Z"�p^�I~���A�ؖ�h{�e�1����j��z����aȸ�;�k��S�c�l�����	�{��x�����{Y2/Sa��_ȗ�x��<b^�������zq����~���\+��Fj��{��h~ϼ�@��()��?�6�Ƌ�ۛ����]`
��n&�̀���Fl�A'��ϔ�;���g�����8�a\-5= ��S\��#B�K�Nb�m�.1�7�sy"��H��iX80�oM�/?qg�"Bh�[6)�j�ql��(2��^eA\�p�E�XTe׺���,$2Q/�����	���_��O����8G�ͦ�R����?���<��`�"�v�6�e�ι��[�e�g.Xt����y ^�Ă�O��!:���AZ�K����^��ST_��H,DL��B���;�F��8�����"[_,DL��K*iJ�Iv����"��ԍ�S�����,&�,�5P��4Kp���F��������daa�&��t�K�D�%�S>�$� ���[���yFy[�'���XT`���s��>�U��hɂ���RP���� ���CK!�g�$��!��w?�X� �Yԇ�����̧�@��i|�",@c��k��Z~�q"bq����n�����ۧ`bfƾ��L�A�Iv�RήX� s:'nyv��g,�� R�ey ��Yk� SS�rȐxr�"���,H�ITG��t��`$�c�cx�ԷEgU?�a�1�O�~X< �4
��7+�`�d�BHкNB��]�}#/w�~�WĊ�P�3q$.����W@]� �tw��X��.�q��g�������ߏ�"3��W6?T�u�R�z�垖�[���� ����"�qlK�q;cH��{o��@����Y�~�������ޙ��; fM�QYZ����X���  �4]W�:_}�; &L�|��YG�1>� ,0OZ��t�+N*o����-���`��Q���ddj@fN������ͪ�Y fQ'��R��)�l���T`&u+��7#��
0��t4
�ybZk��y�M�����F���f�q��+ &T�8�@���U�~ � �>��X�@��Kv��Q@�����������ӚPX��Y&��W��k|�j K�&�.���.���g�	U��G�H=���ԡ.�u��==��}��;� 	�q�%�[�j�xZ!�3�u���) ��u�AW�ep釠�y�/0bc�g�I�J�T��@���2� z�G�	�����
x�,c�Z���BlA�K����A�'���F�^wMRV�bkY='��׉ +��������O_�� �����1���O�D ���I�h��d�vk��0 [� I�o��J�|} ��R =D%(Eӵ��	@���pE;O� a�ij߈����ң�6��Q=��P�t�E����RW��Zz�������ۊTmX�_�� X�� 4I6	rѐ���P����X >� y��'@�P��V=E��� ���U�;��h���H�;;�h/�l��\�<@�Ϊ�il��QxC��O�E��&��X`�
�V��6�.��l!��������-�4������,���b7;���)z�5���!3��b�wY�婙,�|�e�X�D�*.�Ԟ]���p���2����˧W��f=�Bp�P�AQe��{7�dAX�A��x:��p����&u"o|�ط4b��c$�VO��}�G#L<H��hg��T-ju�,ՃP������,��]�%�ܜLk�NLG;��(k:�+�Nq��tG;ˀ�?���-5£j�AjO�f��a�G;�@[���u}a 
�;6$k��������c��v-��N�H�y����
��<} ����"9�,�O���,�.Xx\�     �7Sp���R5�'�������ꥵ�ʫ�E��X��&8�6 8ڹ��J�L��-��Q �iF�vM	�����Nc���Un���b 0��rե��o{��ԝ�2����P��9����[�����p�S�+�uGu1�y �٦�4�����;�=5��ی����������րh�CK:z ���@�$Jy&%��  0��L&�,��[��vڃ�(�&8&f���H��u9�e�z���j��h�zm`9���@g� t�[�U�v�8���.��?  3�8�v=A5�C��]�K�rP��� �Ő�k�~��3�0��'��KMe2��R�c�Ȍ!s���(}�c��X��jT�0����V��i�rm�bƐYk4ۑh^�������� ���J/5D /��Y#B�=����� �Q;��ǃ�N�<l|��)�Lr�6�t�t}K��F�_�%%�1���g�M���C��J���rk�b���]x��/��S�k x�!�h�z�O�k E1d�Z�K�h�z�W�����òjb���؜�Q}W�;����g~Z���P�Y�x�X + �$��z�f���P�	�P;�cWSe*3~swCf�5T<��$���am�t�{��_3	Ȋ��V�}��E��2G��Zq�3�h���b4Ő�j{��m��GhIn�(�b���u��V�H��5���zK*�����ϫXX�Ěz�5�&��O�Gեb,l0���;?�0�=>s_��ZvWp0����2NO*y���Q�ϋ``.i})X������:1 ۀ�R-�a�nH��q�{�x,�@b���4o���[.s1d�_�\�A,�TwB�.�[�?���� ��p�M:��'@��;�zc�~�O�1�b�l;YHC�5ꯡ���p�Z�*�0�Ҍ�r���2��ꭤ��<=�s�R���Dr�8�!��ԥ���S`'<�b��Gk�C��~v���U�����^b���ZP��@�M�D�:O_ȉ!s��5��e:��=� ~䢙a,�L91dN��V�dr���D�Z�0W>u��������u����N>����vV�q�E���VT����B���K�<ɇ�+�e1��Љ>و�����b�45�~��k
����7)��
��=X�P=���j��Y@.huy~Q�鬖�: ����x vb�D5\�g�~�H�s���/��luBF���ג�bd����jv=��m����6���󷝦B��a5��Y,�f*�U]i.��]4ň	j�4h��W�G���ނ'%�~�؉����R����!P��������k����4lv �T���o:g��(��o�+�~��5�%���X4��UCy\�M��1�p�t/��s0%�0��x��;�i��1M�i�
��(/��?ǧfb���q}1!�(�H 
vBs|	�"t�����EN�h��qb@f����� D�uB�r��uU�O7���۫f�6��g�⽆LG�����Ԧ�[Lk8O��P7������>�A<nj�6��>ӾH!3#�~�e��SI3��M,S0/1B�W�k�,Y�#p~����"���j�U7O� �)F`[TI���1���uϔ��`[���5�WՏ��x�{�s��� '�	�\�A�B���\ɣJH9N��D�~�|aH�����=S� @ؙ-�i~�l 8���'�0���3������6��.�h�t�� Jp��{��l�(l 8���,������#l 
���Q�B�kZ�ׁ~	�����:���c2p��o"j��W M��P���f�	�S��@N��V����f��m��: j:t�e�������`"����4���Kx��z u\4�ѳ\�B7Y����+;�Z�B �b����yZ�[���E��F^�:`ES�eP��L�,ս���toH����t�}W�w����ba�d-i�}]P��B���#<| V<��o�I����H[����W�p�`�O�����͙��A�^�<\�1R��MO���r��� ��uO@�V�<�l`� ыT:�ҰP_���ai����W޵DX��ȇ�kZo�p��ֶmU\t�E���<�d`=����Z�4`偈�����+���Z
��ޢ�V$����u\��,(Zs�_���Z�SW��1#z \X��3M�'�4��L� ��
L�#�BV�=q4# ����g�:�no~��� +I�!����5���1�� �	+��x�ۋB@(��a�� ,K(�^��ƀ=�z�����6�J���>k>�ǖ�LIv�+�|�#��Ĕ�П�vÊB��k{[Ȫ �H͌B��kk+K�"�(��ϲ���	�=�D!��>Ŀ~�:�/��:��,X[�R,3��Y�m���49�C�0��'Q���El8��.��%�Ʒ�a�o�K�E���v/��\nu�(�����F�Zs5�F�����禗��D(������0`�Į���#��{-x�/ս��}�d�p�E��y�\�i1 �k�h, XΰW�iR����h�������eu��s@�wdy�;?w�h a%�V�$��G�%Z <��A[��j����l[\$��4 J�j��t��@�(�6�sr O�s��yy [��OA������$n�P��)����P�u�x�-y��8l�����$�<��5�y��l_�i��;_���� ,ֈO�&��>7OXl������ΠQ�k0�V�t�<�����8`���:(��˽Fv�$�YJ�Q�Jٗ  �QHS_��N2�Ac������{���`���ζ�i�� M���լ���ޱ����=KUeS��C��ʹ�X�`�G[���z��q���z��,c��S�ERk��$l@��=�l�����X�ŵv�
H�닌�Ѻ�=]�Ȭo�����6������^L�"�.Z��F
j��A��=_�g�A$�&t�T��~Mr�!
lE�N��.tŪ�Q�rG>W�E�(�|$�]������E�T��M񴺁��D��hp]7ȋt���H\AT��$Ghj��<���Oq��DC��d>c,��u*ֆ��$�_��x4 _Ѻ�Dc�=���B@`�⩢3;�� {�|�t��hM��Z��#b��`�G@P��Ě2��A��9�zb��A�=ֲ^����1���!�ׯ���R֏�C$�c, ������V4� :�I����Շ�h�͎��(��˃nO���k�����𺵉��_{���@(� wv��[���BC$I��'~1�c֛1�\�y1z����p_&:I���OE�v=��48�l��&��2[������MZ9�@�EKX?�D� ��������|z��_/�<��1 @h�Ņ��`K\���m�I���v&��� B�Y��f��þg.z�� ����?�O�����际�6H´��O {�9��ߨ��ϟ^��ϟ�k*o������`�3����|}	�^~��M�;g��lx��Փf�j������Δ�=����끙�'U��z��*Ĭe��e;WT���q4Kr���x6�U酖���{q\�kq��U���k��s�~B�gq�G�_}a���W�{OU8F�@4�h��w-=�xu[��{�|��&^bz"��}��2yp͝�*���EO(4�'��~j%�'�8|�%�I�Ԟ�oQ"���2�S�&�V��X����Ǵ��qJʡvpm�Fd�$��;mZ��E��2i��T��F�67� 8�9ԉ�{�;����E1a/�x�<'M�}R���t�{8�P#��&@g:���� ��c}����|����u#�� ���	�
N~������G
$8�E�S=f=I��IPo�t����H��eڇ�*�4��~^`�C�:��O��F \�tH�C,��ӛT`��K��) �zv���O'FD`�]IS�N�H��    ��5w�Q�R��zo ���~�v�'$��Ep�֗��Ih'Ř@Ώ����65�u�z5��b�D��(3My&Fd`�z���)?�O��@���UIڔ'}�݉4� !X����޽� ��ʎ�`AM�&��ȓ�L,`h�ME��IP� O��N}#S%�&Xs��+U��(_onP��F��h'u���	�����ⶀ
N�>@�ux�EX���- 'X��=ɫ߷�G�`I��K$��� &���60u�!ۛ�- +X�GG��e��G�Xڦ����hd�+ ���M]�5���7�[ Z��'��7慄���XB��h���� ��{��H_�z	��
�SW�hek���7���y{-��]�K@��Q��y�?����ey�0GߜԍF��|`�����������X����<�'�n'Y�:)� ����V�e4�ԏȰz�L.�?�0�0�*���q���5� "�(!�G��'ZT�p/�c��ަÐ�����`՞6�����4�������
�a�|��ݰ||�V�ɦ��y���O��S�^B�r��[*�P���ٷ|X��.l=��~����O/��|�0b}��9љ����7���#�� �7�e.w/�W�`bmm�h
إ#�O�c �*�먤b�Z���� t�1(����k@��}���{f������yX�����}����5M>��p�u<�� ��Kb:�h!;b���,�kw����@C��aj~j�ԯi��d���U���'�`�
��1:y5�Rb��5���D�';��5��}pm *6[DB�I����. �H�Iz�W��R��s�	��@c�}���d���� ~l�)�::�����6 ,�qr��y��l ,��ԫ���_Mg(���Bݤj\�~�	P���D�nlyҴ���i#ZQ�u�`��z�"r��b��a{k�~���OZ�t��FG{�<�.�~*[�����P��H�V+�<ET`�E]m�Dl�z�� v�v�A0Uhڬ�Űl؁��2	��O��p�z@Y��RuVmG&X��E:�]�L�l���3ɡ��^~����^@2s�F���- SzgW]C,��:�M4���Di�AW�8,; 
V

���u���v�7A��um+~�{Q���v#�L���eGsgOq�����r\��b���ޭ����� ��)�|�ͳ��"��ZC,	��G�L*�L��Pl]���:Ց4�wp�SZ��A��)�����@>��󢉏���l`N^,t�����_��J�m���a���Y��
i(������%p+�Np�ޗ���k�p}�5�C�Mӣ�S�Y��
�
��D/� �͢U��\e\/i	dJ+Է�R�D�T�@����q/�@"�Q���E��:���2f�N�L���`�����~�nI���ax3s�:����K�X�vց(j�{�]��"�u�<!{U���ӗ\�2�l�����d/����e2�R�O��� �N['�)��*FY�H�!�,��Qd����L0��p���l��S�p	ː9�Z+��|�4��[�e+�}W���/�`Fֱ�Z,;@�w�5��#;���`w7gF@��D��7��B]�2\@����1N��^NW Q�L���� gbb�d���L ̡�%	2n0~��%�(CK��vO5Tlr^e� L���-��a���8����ʪ�����9I��Zƞ�%K`L�̘ԪI�3�$C&H���$/�.$���وsKVuo��	7=�����'�fȹ�@ �F���IdW��O��tI����$Ry?���l 
K˭�oɳs�s%���v��d�I��	���*�l�;7������[���@@��"y�i�l��.�Rjge�^�01&��&/*��}UH�22e�Tɮ�W�t�~급�$2I���ڮ4�0� ���
t�M��=���z& &J�ʎEp���(0SR��E�5���1�M(��J�kc��n��XW2d�$9a־.���W8�ȫ"k	�Ȑ���T���X������bd����<�Gq�8����!S#;34�\�=�P�2;r/ˆ��e��O@&H�vu-�_� �`[2��H��R|�E+s��Ӄ00A�������!ɐ��)�O�8�uevd��HQS������8�L�$��B���*FdȌH]��H>��a�E��OZ�%P"Í�x0W��<6�����ƚk~�'��Ȑ!�!{fX��(3����؈<���Z{�M�Q�V����y��ؐO+��#Ľ<�±�l�-�&;���q�m!�M��/��	;_�v�}YS��R�/_�%�!#��y�YG�,	�Ջ�S3��8�4mr�z�j�j�L�A�k/32���E��oqq`�۹S7�k٣���KfFF�wӨK`�9	��Y2�p}��#ܖ='m��� rXת��n�y$n .�!ۛ]���@����� `pWV�Κ*
Y?���aj8�n�^hT���J���&<�&x�a�-@Gh=.�|C����� �e���Id�0q��-n.��f��l�Nx�M�!����c`���l��mu��[ �Ǌ��Y�>���u��XQ+�o�tX��Y"9PKNӓ<��,��ܕ����pA��dO�b>7`wjM;X[V� I�cX����*��0��5�wl�y�9� (�[��Iey?��P"�w�����̳�|L���lbqT��TE�F��6.%g�_k���q��;��R��G԰=\�L�I�`�k4@��-�<�@>��.>p�A���rY.��۪k  
n�^[DLvr��<m� `��]2OS_� bOB����v�N�����V|��'�x�U�@��~��} d���q���Ȭ 9��1^�p}�n�j��7���0�vwk=�S��}���0�ۻ�\V=��*?�@�Ꞻ"���k�����X�/��Q ��[P"F�W�!����

����1r#sڟ�(���$p[�/�yZ !� 7t4��9��?~�N �-\� �n$+|iW!����-�+S*s*�d��0�B@n��zZ}�{qׇpXYpHϺ�����f���ۻ4)�5S ��B@�p>h����|�W!@���R��L~�d-�ߗX~xp�W�X��מ�� �۽m5%~�*�X1XE ��%���s������۽׫����K ���� '��Kε�NA�8"�(a�GQhuq8�u'����/%E�Mb0QƩG�UH����x�xSˬ" ����0GU������� lXۉ�f
gSˑ���k ���P��}���8�p�/�I�ĩ�@�۾��ן�wl�W��bs�kq���� ���*��H��@4� ���� .`�}�	����Ђ�p���\����%_- "��&Vhub��'1�j��7�W'��=ޥ�-���o��B�!4�F�錮� ��FWb��V��]�����ɯ�2/ur�'��
 b5�r���� 
[��$Ʀ��Ş`a	��n7
����0ȗ_�j	���7*%��E[�x+y�뮖 l~C�å7�c5�$ &� ������߿��T�l}�>wd�[�-��2_PX��#{�۪�#�n� [�聪�o8�|s�ʮV�l��$ޙ1�~;��E^�%N�d�w�p�_�+ �ݍ��=A��o��^8Z�H�3���
�`+J)�4_��� -��柪�﹦�w�����-pNUV�
��p�� V��f�O�pL|�5`�Β�	<���րlzӦM��:���:�>��2�3��&,`���pyOi�`�pD~�eK^�y.�M�>'_�ʫ���C�]����V�
����x��7�������۠�p1�Υj*b�=�I���"�e��-=�t���� ^�:��7� ���Ǥ��]�kf�
x����$<�,�П��t��Z���Jy?[�.apb��Dr��D�+`Y��6bk����s#0��    i�*�5 ` �+Ջ�!��)���u�!��_�}�7
�ey�;?l��-�NR���m�_i�o�̡�lb?�����4�5ǜ�fRem�����Yi�n��~֮�RПGQ'm�rKk|s�TR�'8UA��2�c�����1�*̲$�Guw����`�%YM'A���Ҷ��9�Zqy7���>+��5�靍�*2|u~D fa�ʎ��P0�7�^"�]+��i<�� D�=N-�j;��g�T[,ޡ�9F��u�鋗Z��'���5��i�z�H#ro� :�uI+@m�.��Ө���;�`�� �C�p~���7�P��laMw'dMH��K��$ꥦ�z��\����P�M=ӝk��3\0�֞��z}�!��� -�}�DR�y{0��_j��/d�i,��WѕqW�okL�#�+���>�=5m����iv�yIGeS�'P�����u��\���*"?���˟A��_�_��U�"����HF���gqn�]��w���|@�|��������K�6�YV��uךL�hoU�*��XC�)���G�xo��5��=��ۈ�k�-D k��ĳl��%�����H|�e��[W8���z֥	b[wE?�y�#�$K��|�����)h��������6�M���ڝ������/
vyh�����(���J�~}җϟ�|���* ���ޟ����c��1l����C!�L� ��|��_��������_�X��`ˇv&��uҴ���|��|}n�|~��׿���a1Î�s��/�z�s~�v;_���T�l:�%E��#ۧϓTe/�ꊐ�T�燁]��_=��Ɍ��T���u���y��t���PO�4����-���K�D`t.���{^��jax؍�qHjr:��尨96��!��]!���ɶ�-U&�|;�T���v�3�q�sަ?Nτ4�}�Ѧ�wH�ABb��i,x�U*��2X�|���/��8� �G i��a�8�@�LC��ć� �g_�p!���dps���� l�>M��@��^��G@�3��<��|B!�! Ch���|*b����{�ͺ d��)��=ˡ�D�K !�e����j{��ϴ|��c��Ge�Zwx{K��CԱWz<���ק`�\�w���G�k�.8!c>c��>s�`�u����6��x'�!�W�k�I��_�K [�W?��&�+���to�˺x�>��Iy�*!�  ���t����!�g����[���Ι[j YEc|�c����k�'r��� �	\|?Ԣ|�ͣ�B'����� ��~��\-� U�0���9I�A_���*�A�N:���Ģ���'���R|#"��nd"�k�	.���X�V_�r;Sx~4�	pA�R �qs�8��ws?- 8Xۃ+CZ��<JԚh���5_�k����0n�n��ahǺ>����O��Gk ���5b�	����ˁ��
����C�s� �N�h�δڪ<���\_!���}��{�5e�O"�t������݉�%��Ƅ5`� �I�d�.t�8��� ��e�D�$������κP_&���]#:X�$?�klE���6�!�[ <��R��Pbe�QÛu�q�� D������4\� :��@�US��� (��0��X-v�<�X�ŘükL@���S�<�I�vȺ���9v�7��8��%�#�{�G�&�� UMtyfT�����&�-�_�h"_g����635\No�� a��Tb�I� |< �����;���0�����ڰP���V�"K�8y��A �a��w]-�d���VrX� 
�4 �D��UP%w�	^!`��bC+jo)�@��W,���
۵��m�t�&�񝥝���z:@�͍��k��8��h����E��%c`y=�<�7v �7�Tr��a��]�; 
���(tx 
�`p�Ļ68�$�=�<`�:}/o�k��pb�3�Թt���F���?��LRe�d����a?9��@�=�M;Ը�K*7 l;@�:�|'u#bA�e�����w��&
��Hϼ�O�-�u�j�< xl-����սn��=��y �`3���Q��U[�o��`�[;���]���],�![�\`��ݻ��0 �B����n�q�S�>@|L�z@�ڔ+;s
 �.��H��Q���(!`���O��x�\Ќ��*nB@����}�#�qx0 k@p1���z�&��Y#-��*��-�h��I�F���V���mB ������+��;K�o�/�TQ��H,�<�%y`��r�`��}E(�^�
���^ Cvo=�ͺ�0R�!`	[\*=�b/�-�S��)�^n~� ��
�M�-�H5[�62�*�S��'� `v6)Is14�̭���,�X���ՃuI���S+qE�*�����d��9�sO�(�ֽ��H"�ȱ� ��Z���)�b.���8L��u�D�R�h�ر�51��.��B���6@��V�`ѵ��e���i�,��Y�3d�W}�P�F�A�-~*�V�p��qz, bZK냾M��VP1����,[96Q�9
�#���W
S�E[� �����Ŕ���6Ő��5 @Eh�<�R�A�76m���I��nx���>07���%I�=��Ǵ6��멨"�}������@�#��z
 ��H��A��x�ۥ:R3�Z��x��� ���V�������z[�<R7�ϴ��W1꬧�'��@մv��e�k�|�Z�]_$�3(	�ڸ5���.;�GY���L�F�ILʉ� K"[/mro50�jZc!��Ƕ��%  ��%E
���p5C`Ojj^ӀE������%o"�[����G����k���c6��H�!̐�3��6��A߮�Es���(jOwG�mZ#��������{�ba���dC�p+� �b:/@���m~�b�9���i�$�z����O��L�̠�3X��S�>����e ������M�f�����u����6@�����E���3�S���٦*��т��2g�,K�RHw�qt}0@���[kG��Oh���'�� ��яjf�ΐi������PYh#�]��ΐY����B����O1=�j)���|��_#Q�.���Rg"�8#P�
��Chq�eN?�9#���L<꺸J2e�Be���r�{djg�_�ɲ�|�j�ؘ�����L�@���`e������s�g�!�blx��]{�u�bJg
�4����潮ı7R��|�ޙ����M�]\u~��`��Es[ɮ �d��^�
/���y"�l6�
\�J��42���<[ �Y��(u1B�v�:[� �#"R4
�d��zB`}�a��p�	!tɂSw��@Y_O�Zd���X��"zh�F�]���փS%�5������b�����1g��<�N��v�9�$"5]�K9����:n&eP���ru��� &�D�q���v \�bB?9��KR{�Ґ�@�f2��P \�zMo��V��n�>� �b�2[�_%���_~�0��QD����Yb����������*��R�S�F��դhj�al��cW~𰸱#2�y�G��6pa�������i� �e�2,��﹐jiۛƓ$d� �`SRKOd^��|�����S�Z6�4����g�����4����|�����\���\�����`��^ξ��W�T��$z���/4m�m !l�D�O��@�����#���_���1��"�re]I�@l 
���W�4�-���> Xuo2��jZ�0`i�T֞����?W�.U���t�*#���6`�E/�I^D@����4��!���f21�l=�hX���Fi`5�sd����|L����0 +ۺ:J_W�m�����֪��	��@ 	�6��z������J.�h{�!`K��Y�MW�~[V^�"b�Y�Ւ�F�6�XًD�Qa�j�7��l}�6�`11�[d	q��!r ��be��    ��,
?���P�Ģ�x:�# ���|~�sVe�hG����`!q�!0�E �4���"�`1q�X�O�NBN�M�������1	.tF5]L�!H�����5�4�l/��H�� ���h��Gu�v��A/x�Yv��<��-��fR�j"*, XM\Viy�z��'h] 2���g���8�#V[��Y9A,X^�w�1>H�'�v`���C�+�o� �@��.�- XP��gY~ڽ�`�0��#��m�k�-XA\v�cZ���� 	,!��Hw*}:�l��	�7�Y�IԺ��i�-66ex����1�T`����5��6�v	 �s�_�]��g��+G�`đ�5l|+vt�O���Gb�h��GO� �rj,S��vk{����џ��v��
a]�UY�8�qUٮ  ���$5h��ǲ�
@bk��Y+�Ɂ���#6�F��<ߗ9�v���`�~2W���b�oW��κF�Squg��k4@���#ׯ��`3��TO����W��
>����q}[ 	��%{�������ր��5��T�"�!��ʷ��Գ��u�	 `wۈ���'%�v����"r��\��2i��y��v?����=�)Pi��O���^���׍kٳ�������j����4F[u���Hl`t���[�A�8r!�ũ>ӽ�������ޞ��U#�5?� ����I��D�΃�:K_��[�BZ���I6m7��;.w�BZ��.�Bs��d���u���I��׹B�U������6/|Ui�i�*;
������I�Z��n8r����<w�A<�C�r��a��|����_w�H+�}���b	t'�ߖ+��V�[����]� XI�u
&�n�i%���&=�� ��w�şjq4H���ݰ}�R�i����nOI�����O��Juu�@
O�V[�>Z��:�5�MQ}����V���F�uQ0�Q��mЪ��EPw*��c�4E�孟V=P!�R�Q �2Irȫ��rI DZ���/�d'���f�H+�U�Ym�@/�x��#�R7��x�O�g=Ҋu���hQ�n�c�����܌*n~���{��_��?����Ќ�����0��f� m��:�����A6亵rѩd�Y�4����E�ɏ�k��I���ꙮC�U����Qve��ٵ4�>�3C�z��vnq���C�J�m+����v=rs3ĸ���נ���j~��gd�|~��_��6w��zZ��f�1C���l��օ�y�qQx�X.�1Ϧ ?/���<�����o�������/���\� g���8�}�* 8����v����	-gFsC(�a�Ʌt��\.��(��[�� �����o/������g�C?�a 8�r�.��+��^�h�ڽ;��6�}��q4=l��I�^\�L7��B���BHMm�^��8�983'��Neir�Y�  �4�H�s ru�����ó X���׿��?^~/�z�д����$pNh}��߯���o���0��o�S}����* �vɁ�������ex��C, N�yhEJ�]2��0 �_�/߿�|ʗ�y���=n�P4��m�my�t(LC�����骟��F�H6���]�w4a���(��6]�KQ�F�GZ@,>����`	~ �52��4�i�2���V�m�EJ5uS��da���kx=�֢;oO,���:�@ 8uO��`�dA�bd�ڴm�R���v6T.'���R؛1�c�*�c. . mlHLu���a. '��f9��Y<�[t�Z@
�I��ߛ��"��H���τ9� ��̑>JPVg�ҏ�U\� ��D2�}�DG�0��uC���.���(�`㬮�A�#|\��N�����`�=E]�)`�m�z�׆Y�o	��IcMg�������ݘ���{\6p�hj�8�fp�O|, �#iQ�f�`���3-8��BL�?��%`��yצ��
\ǽ\> k{�-m�8< ��L���șH?�����Zmi���dC�w ��/4�Z{٫3��H흆�C<�
֖��2K�=�
@e��7�!���v����C��tH��>��;����r���qЩ�5���:�h�N+�G&�~����cL���s �������
��N�VI����#'ò����]_ K�Ϣ|t�w� k�/Uy�T�/�4̮�����b/qրK[�e<��;SG� ,����ג[,q��74[��\���[��'� ���f̙�\{8`E�	�� X	y��1gqו����2OEA�P��\B��;����Z	���:�K�Ƃ��2����Mz�
��L)_L�`999���?�t ��˺��J�Թ@��Fy@�AVp�Y�<�28����=m���E���n �j:PUNu���@ ,��X�ԅ�gd��@�+kW�07��l )XH^���[�:�8� �`�x&j��mj���o  ֶ�7�zv�H`�x�;�*=H�4%9TX���t���g8�Zq���Vm�H�
_�P�~+��B�w�<[@����P�K"�뽠�ЀE�jtekD�4�v�y�}� 	v�6(W��(z�ϸ+�C< �����3�W�g���qbd����
X�8 V-NubV�cS��"��p���F�wM:%3��P;�	����RSF�-���{6��N�\;�֏��'!}��w�,'�^��*V� X,��̗��
��T��&�n<�V'�ln+��쐌3�^@ K�?ʖ�#��\ӧ���2 $�Z��
���,`��\�Zz ۞%�F ���M�{�5�d�dw즜��
��eᏢ�������L�;n� Xn�ς*�����H���.����<ׇ��p�zW���	Q������:�z�y`��Z��N�-Gm��9 ևKF�Z�K?�B@������M��쪭�n|�C< �2zlԥ��=8U�T @�ݛ��ԋT'�=]�d�^<� �WhwP;�R`q�p>5����T�xjUs���؁�}C�C�~@���w�!@��1e�kφ ;��������_�Y���C��>�d��3��ͩP;eM&[=6�N�q�f)k���(�V4��z��9��g���
��*ɸ k���&��Z<%=Q�^d*��vwy�ĺ���˂��n������p�(��.��RD�0+Ð��@4�I�Gˬ8k�sŌ,UYx��"l x��k]�{c�"\X���5��<��MuA<6��A�8Z�xK�z~\-���\�>X�8��7�0�Z|���}��  	V+��*�(�/N΁ ���'Y�4�D�$�ӳv�\��ux��F$��<P���xd�@ LH<�Z� �!��N����9��j��D�:8��$�o��V8 3u� ��}Н���;Z�xBƢW��!�.9�o�;����䏡���������@iPЕ�c��Y;��w`��īȍ��̍�G������#P�X���׋¢�4��<�p�T9�T�uǼ��m ���@�qg^�ˣl!�uٙq	�s��HU��*����L�9k�i�Hg�-0׶ڝG���B��y�(Zu"��j��41T��3f$-qU�Z�;�f;F��!�fa�}�F]7�#���������O:�"Np�ϛ�������=xW����gz���;J���P����y&�	+�&�FK�SW�Dh[d��G�q���xXVp����F�<������@68��<\� ��^��NIA�3��e^'~�5 �u>��Vew�f��Ә���bXD���w��� 8gMj��G�}���;�\��5N�'��&~`��Z��6�������p�cbJ佣�;��1�_0X�����d�38v��q6�
������tMp�:.�Q��Y�
����7.����!vb0@���\U%�ꜟ��O�h�:��*`}�;�ʡ�v����A��I�f����o    ��z�;�:\�o`��$�Bf�OI�* vLw�I����۩O@�z��ʂS�=bʓh
3�r���P +ť麝�JgO�ip���'o��-@+w�ᘚ|�&g&,[���L����)��(�lGe�	�q*N	΅� �e;�r�����Pь�����T������	�d`M�)�q����� Kk�F������B�K���Y��<�y�S	@�E6B��k���������6���5���`�C� !XmC��T���8��۹���/U�@kn�*�ɦ�� Xis���?��,؁�S��s�Op]�;@����-)-�FG�X`a��}�_������5MR����R�Ǜ1H��"�h����UMdcC�{"����D  Xm�gcu�$i7�=���`���T�z��7ܛ8 ,����h�Ih��P)��8����Qצr�.�	p�������d��`��l��M�	VݐO0��S�>��M$�	�$*�B�9� b}Ù�~��[�PL�t����l�5�=���/`�@a�.�m�靅 Vh��S��������M��\���O��lO ���:�3=���,�!lӖA&���Q׽	P��Ӽ�#��5�]f������� �R'��+�'``L-KҲ�b�����l��8�'l_���1��L�iP�D�,��ÁF�P��4PGRK�?X�G��y�0��2ꈕ�v�&��K��ck'��Gg����&
 ��6���qX���"�V��u�u�9��f��2�� +X4cX���L=o�]�q0�`錙A����P ,�g���=�Q���`Kgt�[4q�p� �`�ehJ�,9�M@����R�R��SwP���U���_�oB��&N��}4~�04����jXag-R�*�2�)9_ D����R@>C�}�aw���Ţ9���0 ��Q�J����qo">�f&���-m�<�LZ :��@�+�L{�]+~�k=���/�O���f�!;穖 ;���u��*�q��h ,�ie���`gw�o�Y��A���n/$����k�s����-��9��1���v67qV�x��Uwo��!8r�"a��L�ƨ+��>����8[�Nݹx�~ޕ����Р�ޓ�-�(������(=kr{33誂'
r&ӱ��!R����IW;rI���h �HDbm7�n�X����?��!�b\�Y���˧����寗?^���������Ŏ��l���RE��(lg>�
�l�,S��dA��Ydz�n]���6���_�x�4�_~����������([�rX����g >��=�������� `������`�j���_�_���_���d��1�}&����>H����ח�Qi��]��moy��?�X�v����5�|f���^�=C���E`�3?�Hr�V�S��B�P������g�j�巗?�x�d���ח����߾�ǇO�j7������e6��B,lO��4�������p2���z�ԧkSZ �-�������ϗ@����y9ր
L^%{MΊ�Y��8 f����V��ͷ?բ���;s� �Lի���\&��3sl (��ZV���� 6����U���� 80MUۖ��"�u���9�zS=0��'��V�;���N/����d��z��Gs�lK:<���)��6�����/:}&K3��oFc����=�q{3��ĊT/m�L㝰�z���fFQo�B�xm;8�	!���Ӡ"o̓�因�HE��Y�=r{3�(Q�.�Ჽ0gnυ�ގ*����׷�8?%;�����5`Dh�ƌ��k��Jp��	��M6���Rp�Zʺ���8�zw&�˂�-PdiN\AOO�`3Vcv)n����� B+�<�"���@���7�g(L��8��@��t�V��I>Z�vx@ NV�f�'�n�V�va=��=oT�����m�1)�[w�$������ ���o6\�v�
� .��ʈ	��Ri���r�hY�ʏ/��;���R�'7��7u�Y����� ��F��#�@ ��^aO<��N�W= Tp
{�J�������,ㆳ1��= <���1�\�	��ӃD���Ȫ�l�a������Um���Q]`jOi^� `���F�L����������x(�KB��R���t4� ֽ�Ԫi������\Ў XY�Y+�٦��9�L 	�X��Z<���@��U�z��&x�\ģs�^b8����Z榿�g�� ��2� �>�3yty@�Y�-r���w�O �2���S�x��Ё�U"�CV�.+4.�ŝk��` <)S'`�.���s�x��D!�k��.x�zZ����[)�`9W�e�BׇL`W��uU��)
X�u�qup�ЏS4̭��qF�,�j:�J��y��a�CC�k<�_��a	T�:��O���=�"����`>�V[��������XY&�A^�v�1�Gt`A������֐g枊  X��/s͹U�j�3�3r���.r��k� �BR���-�{�Ĉ����K��l#�;BI�LU"�Ր_�#T, *V��a�5uG�<5�d~='Z b��K��ԫ,��@�u5�%�e�T4o���[ ^����ϙ��t�Zx6��] h�-�3N�I�j���1��*|Oɐ�� �X��q��J�f��xZ \X��n��s����/Ѫ�W-qI�d"H�*�\9Y��9' V�e4e�V�Q���̮_o	��ʯg�}�/�G���2��lK@�~�i��*����%@K��:lI����� ?Xv���f�I�5��Z2VE@8���r0㠙�����z�������6�5��3��!`K��ͷi��pj.�,AX	VV�V߃M#�8�{K8D�hῗyP���"��5ʛ�ͬ (X��I�&1+@��7]nlv=T*V�V�%j3A^Z0W`���_<��K�$�o��@� @�uy��gȼP�a\���a&o2�n7OCU���[:��K� xJ�V�
��R9yo���T`�W&�[�[�P`��^Ě��*~*dk�{�-�B�g|&��� 0�!Iy~a�V6[��րvV��tm��3&��+&�e3��2�sr~  yi�ۢۋ��<-�5@����͟�L��X�e�RȺ���T`��"]�T�-U�:>��4��뢋�^� K�N
F۴��~pЮ�� ,���=6U����;�X`mץ:�#HOe��ƪ���e�f$�8W��EQ,��ݛ%��[����2˨џC�b9�-Y�ܛ��j���(���hDK+��I_��.6����l1�',M!5B/��6~*����Z���K"���`� o�W� �i�^>���Yi ��Pe��)HA�g5�5*x���Ҏ?ʓJ��U%G�h����ҎBJ�*؋&cә��J;I��-��Q�;y�Si��=yRA&h3��o���o���ٶ���������AW���C �;��>��A��9��ڹ�Š��� ��?2��w%O0�O��KiG �$U3�U�u������Mi'!�˛����4�dx�$_޺��ܴ���#�L�BO!���˛t`j�l����&�ׁ&�p`���B!Kڭ�˨��C(��Ȏ`7���ms���y8�`�p�Dp'O�9 RڱG�h�qB��f-�E2���<�N��h�F��S<@&7Ro�/ږ��f���(���y�<���8g5�E�gcnQ v<B�>_~$�R��j��k1U���D�>��SҘ�8b����(�zr���� �/l��>�����dP�F�x�@,�32�����Lb2ڻH�79k]e2d2c�d����SzY�@�oK�i8�p����8�����yR���^8�YoZ02�o�-�%�Z0y2!�ޢ��Y�gqد�:�;`�V_�kaV�����c8;�"]�iڲ�E��=K$��[Y0�2	���)$�b!��;�5��~�s%    #���#�^�C�6��� KzM���s�C@�é|!��*�J�b��IrJ��Ð�x 
!�m���a��
��қ)����{�o�~Z�g�����-" 
��S��(�Ǌ.cAߚ�t�[D |7�ER�& !�rNv��T��I�2�E�Q7V^�\5�F��m��u��0��] l�=�b�����Lg���b�Y�pk�j3o�
�������S��$* ������1@Et;���/�C@	���h�N<!ß� ��0NTQ�2t��.�0�M}�R�3�� D?�h��.?�^� |9'��r���sD�O�iSu�K�X��W���� |;�Ս�	�iz�0tܼK@����|&
���6��`���,*�Sԕo��0ªS�SXǩ&��ǧ�>�X�U�ԃ������o�z�dPkZd�ֵp޷��{;��-W�����%�� �A���G�^� ���^����:�޸pz�V�|u����Dw��L��`b*�?8@w=�V�,B�.�>�ə5���]N����/���V��D���V�zz�
K�C�S��i�ʣ�O۟{ڹ+ 
�$�ө�I�$�"�������H4
l���W�X^�)s�c�3-'Oo�bi���Έ5�k�
�r�TVk9|�p���`���V��W7r'tL�׀�d�A�!�樱XV�Z�l��I[&�*�r��Yk��
�֭�	�3����K��X��T�I�eu뉠�X\�D��]���52*��Uu
��|�=j� ,4�V�*f+k�;����x$��S����u6�|^����0hu�'g��0�%}��q$��I�<��7���9��AF8�;m >X�wPI�kՕD�^�����|���ݙH�����@c�V�[k>��p�5�� f�|���ͥ����`��`ݞ)x{��,6���;Ⱥi5e�H�J
��;��5�����h�L`�^!3�^Ӊ��W4ǝ_" �	��I��+�a� �գbs?/�0�~�Ԉ�,ػT�.�P���R���9q���o䵃�G�MՓ-w7	�_���?����o�;��GXB��{��E��}����߃�^~��篟��v��@,�V�Z����dR����'/?��˟��`�*�|����든��o��-�A��l��
t�v���T��oGF�or�-�;Χנ��__�
{;���)�Ó� �V����׿^>�~������<���+�����/��jb�/��U����.w7�
�^�T�t�?ӫ%��/��r��Xp�r�1����g[�n��Հ�e[�����e���4��r�� ���$[�^���������FV��=\� $X��_�������߃���<�bN$��=V������c���� ��o�������~8�V�Q�[��{���	ߖ�ﹹk�jɺ�������z��_/4C���_/�����uu������«�d��~dY�WǠ�"<�*���TU�Ƿ������Y�;���=U����\d[�[�4�f��t�y���õ�2������(�󹥚�Ԇ|p��ï�~�j����/A����/�4�~�N��i���%�VJZ�=8,�!l��GA���<lpn��/_�����Px~��_*��o�);3��t�f���1=/F�����i>?�/C��A��������a����-�YKV��b(3�q��;����_��"��^�{���*.�cJ5�!����[�a�s�%0/�"���6O��Y��p�U&ȉ���f�!Ċ?E[eZ��&��D�+[Ɂ�y��v3B- ���y_���%�6��eA��T��U:�	V�g�c�t���ڍ�6_��Ũk�V��;J/�6;߱�7��a�������?{�oVE��O�����i���W���U.�G2k>�>+A��e�eO[܅Xn;��6I#�24n�{�m�"��T�A��<�YB��*8W1�ȶ���ٌv���9�ɞv�zyM۵c�*�@kĶEzTk�r�4�!���1+M6f����[���cC�TI��L�M8D�AT��i���cև}������={ф�i*��#��u��u[p+�R��`��! ����X�u�E��i �h A������^9x��a�j�����=@�p��H}��M*�Ǫ$s�V���͵��C�G57��;���凍(�0.,� }	�Z2���m}: l�z\W�s@<�	���V�\�{�fa�aST5y}\FI&�9����!�3O����
]��h(9��ͺ"RXs��QJ���q��E;�E��e��4Q��g} fX9����ش��"ޑ\�k���V�Z��������ױB���u��g_��R���,���RjU��39[PpE�ҡZ>k��E�h�^�-!�H����h.OA(�!�x�(��րK���M�(xV����XB�YL�;��|�Z,Sa��=��k@@4"�'����uA�=�� �7��m��ֳ@���L��v�L� ��mu���nթhdZ����6���&��}7��	��� ����Hm*�4���� "X��S	h���M�0 �8UF`v�my���x!� :,m�OW��8��#6��aO>Ř��! @��N��WU\�  ����ܠYض8`q�4���k	%���Ϸ`��K\�x�-M'�`�%��
�2r�z,���B.���RQ6�'��q�u����S���oV0��,�j���Ө�c�a"&lXI���,�jS�����` 
���?mr�4m�j�8�� +�{��q 2�Z���u�!Mޱ+d>��:�+� +PX��Fp=�:t]}�,�P��YMO�M���1���;���t�U�-�D�yJ#w����W���1v����+�����x � ������^3���4b��Y�<UC��q 'X�AMk����0bmZ(2EO�����f5>}�5 k4��)�$h��1]_ ��f~��6��TW�,�xҲwm/#�4�V V�'�\�v�1�!��Ǝ^h�K�gl�������1�"^�8���@�d)M��+zw�H�C��M��!¶4�� ���,��/k9�=]g�7���$�ًF����p� �x�*����X��$�G0@9|xf�kp ����	:��&+��B������IOm�Uవ��g�$��wLt">�&��P1��C0��-��yL�B���dr 2�)n���fVv�
'x\S�Q���9>��nҞJ������& /xt��?��Ҟ����b�	B�D��`����O�o�B ��$>'A��~bD�vx�:4�"k%i�h9�Zr\��oRK\&���$�R�\E�<��N�מi����>��iM�^h�R(�Û.]�
���_��o�O�>Zh*�ԋ v���h�����y v7w�����+=�t�N�PF[_�&plqOݳW\���G��U��e�'�R&oL�����t���
~���<yc�|u�e��VWO7�s)#���aS� ������+�QF�4��H������?�|�%�\߄D�l�:�̧��hq�
X��q�9�0M����0�6��,9�l0�2�:�JY�V�JD���X� �	���t�Q+�t5��h	x~�M�)ȅ���vr�b	x��@� #{2?ݭ���
s�⢳K?Ո%@Dh{��Pua���op�y�4��Ds��f]c6X���Lp��\�#Mj8�񣇮�j	��T����:�$�;��� �@*��x�
���������l����^��
��y�q_��B֏�����T�,���\/�4W��� ��wI�H�1��!�V� ��,k��RQ,��O�g� '��Tg�-�Z:D���v8Ĭ�����Z�M=O��x�N^�)�� ��w��y�����UG0�V�	�4���h�����0k���%
�i�`}�*����%    2�<,�5 ��FkO렭R9��v��ր;����n��5�s�D���W�N>��r�ʃ�wа�Q*O�h}�ǂX�%,)�z��s�Td?d��@�yy��͊G/`��`F^��)QN�8]� L,o�<wuV�<_�Pby���w�v��&�����H��U�Ƈ� '��פzn���a#�6 L�k��P�] 803���3�7��Q�\�Tae�&~�|�����°����K�X����_�ڏ�2>���P� F0G�Hk���y�;� ������j��� �T�� \0i����E���[�	��Y�j!i@����V�b�����F��N0E��bL!6�V�~�j`���*'c����\ ��3���x$���-@�ʎS�����g��i��`��n����1���X����.nTEw+w���	ƺ��n�<�|v �K�+j����3���n��i����0; ��U�?�*R����:k�cc�'��yt �C@�f��c�6�fؚ�8c�W׀�k{�׎��ᐔ�Z4�L�u��T{L�[ϵ��x����!������{S.q6�-+_���� ����밋�K�-��qy�y����h�8Y�\u��-���u�۴�)�ڐ)�@|��������N�����K@.��=���aT��6�}�IWǗoA�G� �A��҅]l?����^����spVk���ٲ�c,mn��Z ��!5��o��v���z	�/���Y2痯�o�_�g��
 lӬ7�+_�|���ۧ��$���_��y.�H���e���>:� �";��B��A����oA�^��������G

�c�c_�"�Ҙ�%�@S�
=y&�ŏ�5@ w���ȶ�3s焀���M�e�,%Cǣa�N7F��T�1��h�����;%��]���� ]b��禘i�g�iz�8o���%�]C�ښ��%�wŊ����3P}��_?۱��H�~(�k˔8���)=��&Dv�_[��)���O�>^b���"ؿ|�߾������^��|���N!��5�!��XN�U�����ıV��a4]�S�%���\�F(�.(O����`��u�hѮ��I�Ep����Ӄ�!���;�_� p]���*�eR���Q"�`[�&$-�Нk��eQ86=
u�u2��u�x�Po�![]�;d?�o�p��aY.��$e��ZmW{zB 
N����T*��|l8�K$�
N�K�T>Q����L�plO���1q�G����1Vau�P�r	@�y�#55�h��2��c.���t���Xm�% Gh]ab�(Q�񞻗K$�Θ�*���=��Y�T�1�k0@N����,[L"��)����.Il:�H]Ȓ�l�L�0rh�{6C��XXdp�V�Z�*�>��ʑ�����g�����<`�ʚdt:�K  k%��$D%��DP�FrrOӡ�*Y!K��T_���p!�>���I4ݙ��^����Sfr��AW
񚛦ҬH�
Ȼ롓���W���K�w��%؋ǔ��%�� ���yMƄ:YZ�vN]�&0���W�_˛��uI\B*��܍���:0�M���l.�� !�>�Q�A)�*�<w�-0� )�P��s�Zś����R0�M��Z�#�9�( +Y���+�$l�N� ²��\�R���<_TX����$�)�qq�<�`��k���n����{(����y�o�T)UF��%#���v	�46�Y�Z�;t�@�K�P�������n(�D6�f�P�48KJ�{���h��-��V�;1�1j�
�Hm-	�TN��`(�%EU�~�>���F N$0=!���Fjο�D�6�8�i��a�i�W/O�$Y�;���H��*��Cm D��F2��6��.r� ��6I܁�<4F� ?�de��q|ђܚ8Z��� ��`h��`x�Pd�tX�Y�Ⱥ1m�H��q+�6���\W �JQ�s�s	����vWC� ��l�*�m9l���ʶ Lc3lh��!�n�&�H�L`6[�g}�,%�u	�R�a�Wǭ��X�5��U��z��Llӽگw楸�XX�ޞ���t�n��8�>N��"H\>Dqt}u L�kšѸ \`1o4#��%�����SG�sh��z��%$ s�~4����a�s|�;@�5Lй��������D�]�h�����o�r�]�4X#:2u�){����8]� <�����ⲡL��v/=�d]�Xl��L)[�	b��Q�H���m�P�*S��̟�;���o3�Q��>r� ����XYL�л��`��Zf�@����@{��{���^�@
0����a���3����ڋƩ#��{.е�}��< f�9��L*DsV[��C`�)]��ӎ�< 6�'ݩ�u�Q���������ak=xNc!����m�b=���V�< $�	���1"cڮ4���* d`;��"twt`���e~�� {�5$V��B �-�&jQP����uݍ�H��o=s�tS�z�LJ��%?���[5]�ݕ5[]9�ݿ~ ��S���]gz�N?�C$��@č{��P v�:X؂�Fѩ�/JDۑ�P���İ�K@��{ҹ��J���@{7p�Z�k���kF.a "���Ҋ��d
�ak���(t�����K, ����
��d�@HR�,][��j����t�_~��(�(v�sĲ��_�Z�e~GD �-��:bK��B�cȱ�Fi���H�g+�4���LO[¬ʙ����j�����$j����s	7�p���52�(W���CM�j�����3+�APS�7�n����~�e�%�"��3�ՠ5o�K�� ����8�]�ane�5�4ghm\��
��<���~_n��B&+u����3�������<�)�3 �&����0��bb�h�*��'���LƜY��5��C�6�CF�Gso�d�0u�J�d�1�"�V]N�H��$fe�P�єN����XK��7R�PuB�NM�K��ɘ3 �A"S�⻬� �u��'���#�Cn)@�xd�v�)�K �f�>��Y[��Q���Rk�Z9[��i�[i���]� 8�`��Չxꦜ[\� 4�oJۙ�t����.��K=��<PKo� `�A]�;j�$[a9�Ёi��ժ��%�sġ��qeI���]Y:�
���'���U��L2M�	r�^ F0K��ai��I�k������Ђ	�j�weەvl���X`0gWk�є`�O�^f�^9�^���� �`����DNi˲�P�<]mL:��z��% �+�G��z�x���@�K &�>�D�tf�IU4�8 ��<i�4a�K�
��)� �68��Ĳ�Y(0Gw��"mcnNd�d��=[Z�{
G�]t��^s	 �4ݪ*��״��P�Y��%*�������%���/"�X�v���}^�i�(HEY��$}
�+�f钩�-"�.q ��[k�8u�h !{٪�h�J0K�Y�ku���S5��P�9��#��
WÐ-�k�	�6ٓ�i ��4���`�ɹF�ثMIj^���]
ր���uʪ�^�u�v���a5��k� "������OR��2q���� L�}����Z�'h�b��X�*�N��]�րL����VD����$ ̏�d�5���� H,m线�P��Ȋ�G� P0;��Ӝr�q��+@�Қ�SC�����LY#XGMX*a��$#c��tٺ۫̒fh�?�(�@-��sf�C�CԻ)&�r� ����j�isݵ�� [w��LYQ>��jPT�� H0_�.6WƦU;��	�˚9{�X ̗�ڷ�n�ӆ�q� ̕mdy�hև�'����~��`��J�����R��`άvT��$�ݥe�8�L�%�P��`�ɱ��jR��:�=7��:�_IHk��%�w�8 ̒��iGG��Fx�4�v	����RY]�d$r�~�En�k�5���$�ı�^���� L�    �TY]9�c�w��I��������@��T��>�	�"�,�©𷄷���8�t%9����ˏ����!-�>���""������L����Dey$M�>WT72�-51�PK�Z�
{��� �_�k�D��In-���r�����Y���g���.��1�"l-�y2�����6 �������ߣ����_�����6���{������� ?��[}��:��Ҍ���E�D�8�ܚ}�����a�z�L `M��v �4�1輖m{�۲��M��4�l�瀽�پ�ij�}���A`�s����e/����7V����a�Ϭ�<�vcc�o���`�sK���M+�	�M��ӹ+)
Ҝ8�m��3��܉���T@2�~�����cW�{�UaNS¡�`�[�͂�FΝ}�{�����?��Y�Q��o�/���1�Zz�f���%�"��e�\{�0+�i��;�.�tC�!��X������Eރ��l '[����/��&�}���r!��#��Ȩ}Z>]tsDʞ�h���Rf���l����zv��6 ��"�,bu	�ؕ�����t8��[\�}���|c�m,�4/�+�� 1���iˬ�(�y�k���Ԉ�2q�uX05OK#�,ru$-u}j�.�͸>��e�����]2��r�a���5�|驾[FE�88���9�*��N>�dwST%R<�r(���#�|k|�j ���B������ �C��xL�i�^uu�)��� <8c��\T��mp �`-���,`=Lq~��p��IJ�r���\�'@
S�LBN��+f�8 &6[>ɓZ ?Z� #��S7R��f��! gΙh��RY��宛�I;�������(k/J�:��% ��V.i.��B;�f�y�% ��vr'[�w\d0�O;	��E�(�Lޫ�F�����}(�&��I?�%�s��Z�Vz�	h$��:0��)#bݫo�AK ���*�����&iӋn6�N��{�`6�i�S����.����d��j/� �����;yY��� w�	�=׀ ��W'�3X�����P�C( ��8Cd.�Qd�� 2��w�(|���=`���ȍ�� �x���A�"%���Z0�/-����52�P ��=�4 WVm5������ 1��׳M��9�ǅOP\f,���A�t�R0�BA�5 ����D �`���x}��! �":Ȝ���y:^�P���F�B&W�hJ0]P���uƠC@
ft�Ϸ2d�gP��AMا��c]�h8���B#ܜ��[>Kr:ɴ��7��H���N�dcV$""ߌβ0C�{�
��Y=
���D6 K������|�7d�� ^,�H���b�-�B7,�P�Ӆ�q���`a����-]t�$Pn�� �M1�	x��ArJ����M�.�M�'�f�9�7�+�:+xl��A�P��[�c���p��4@Ye���r�l /�P�w�{�|���9� 	���y����M�kS�1Y���m<�cx/��N�U�� L0��U+�(��q�sd
�(�kےז�ziz�
���7(��<�@*��A��{  	�
�h���[h��T�<��TrlEW�]�q��B�44D����57iʑ���'#���(�Ջͦ��7��>� gϲ��,�c������u8���	*v��0�AN������S�1��`��� :6c�10���o� <X�����?Gi�ˏtww{�����]�$V$}?`�����V�`F 
`�f<�(�R}�}�sq{豱���V��D9���-�` ��I�ǈB�2H�b^�,�!-��������8�OW?H%��@�6�`yΓJǪ�S/p�`C}�-�&.��>"����7i�`]�m�ƀ��i|42�t[��c����G��� +X�s����+ɩ�Y s��:���-*L?����( kt���J��@OPa:�R��@���Z�6�A���F�χ4�����}�V�^vɴ��C,@��L$��X%L V��ܩ�W��͓	mi�XW-=P"xj�g�uU,!�NP�'YA �����4�>���w�`p�5"��T�����W�D��,QG�"A�8[����<� �3�.�G-�?zfa�3fv���`�xy��^'�(����u�4gڲ{Ѫ�G�w�K���� �ki���F:���{�I�`�vF�oE��S��A ���NvR�Nj�Te@���G��7�S! �oػ�py,����r�jf��<
���î�ʨ�%1����Yo��͘9��fa�5N	�Z�㪈��f<�̏��=B�o�`���t��w�f�,@})<���1�;3f`���	������	�ԙ�����y�)�ܓ�g�e�<M���r�jO�P��z�5�l�9�{R����7���cGN`{�DfQ"w�ߥE�B$^���>e�TM��N�lI\PGţ_9�C��Sݶ!��n���������Х��4ѧ�nU�����AkS8���G���TM���tɭ��_׼v��y� �@��U�C�վ��h'M$q�6t�_3E��!sqO��*K�
>�ົL��@9���JE��1V�L��X+ ��v=X{���K�%e+�;q"�*�R�,��'R�ި�c'�{}>_l���ݫ�)�����O�}
%�X��;�O��&W�P�s�'M/@pE���%��ɀ�j@b�F".IC�+�N/��Ƴ�wFGY^#t|qk�P��o͇�0��`�S}',Ȑ�!½�m�'\����c�(�D���:�1�\fT̉��P��#����LZb%54����T�5���A^��Ӯ7[��Q<@+���A�Њ�:�2]�!q��'E�Q���H:��t�C, ;v���M[=MXzҥ����*U�F2��`�1]R��-I�(y�v�Q��J7 )<}B~
�����Ď�$g���Q��6��zN.N���3���ȵ]j����COD�. <��I�,T��E
3�����!�P�<y�n�M����>�-F����kL�Г&Μ�c&��@ ?x
� �geB!�v�����@��=m�+�,�- ��4G�V�X�^� +x��U�!���[���O���G���z@=1gI�Q��(x=���K#)@�Ir�M����DSU�֨��,�(���4�X���\ݐ�n���j�<����㐔�n,ފX���;�b� ��O
��Ϡ������XZ�=Os�F��ai٩�H$kͱ-.*�:}p�G@؝�����;��b���D������1��,N�!�H�t�A�Z���=HqQ��5 O�E��sA�o���0���?����\S3U�O���e�����Ƽ,�� x�C���ˋ�0�G/2�nGi"��*8>L���u�ųvcIvV^��Ā
<��G�Oz�����ֶW�(��4� 躆`�Q��uw����x�H&%1>�"��%uק|����.���Qԃ윾�8�w1������1�
���. $x C你�Jg+q�Q<����������`�-��B�3�
�0D��F!.�*���ڹE��� x�!�`o�'�� ,�ԃ����A>��#2� x��ҟ�j��um��_�D-B��UD ���N]-�B��P�\���\-kr3���-=���0I:�`q����{٤et_�,�׋����(��J���0 <��\>I�`(3�@�ԃ��]��X-�FE����R<%K� <� �FD����K�H��wrǘXl1�d��,+��ࡇ������<����Ll���Kw����#���X&)e���*��֖و���U���cf���p,� [;(Ց�-I(�E/,Tر��|��z"v�.fg@��؊G"@�Łsu�k��C8�
�mK�*g�	3����G    �O����	��G�������i ,@�]ӈ\\��v}�+�6 F�Ф��o�Xv���h<-��֥�=_���_�bi���N�Q"/ه�>�b�KF{�'� ,�2��E�1��zk��Vhg��R��5&@k�hΚ5s��[��N����|)�f�i�~P�I��J�@̌A�ڈ��6^8��
P��B� Z\� �T�Х� .0��8IF#�G�'H`�z���YF_��9J]�Eo�B���y�;�a�鑌r$b�S�q����F� fP����0�����l �KhL�z!��^"�� 2��T)*�p�?�96��iGU���u�4O��`Z�������&�k(�	f>t�;�Ʃ�Z#M�f��`̬3�BC]C��[�j�)�,�I[�]r�s�����4y��ʝ��3�d�L-l�}�C�1�ui��t�,�P�=�02�9���H�$uQE���f�M�K� @Ɍ-�P�UD�=N"����tƻ�H�	&���zs s�(��;����(
����i�8�w��L�C��4�N%|Df�x���.㹵��)��ݿR*�������Hu!K��f�IU� 5VYr��}������2f���C]��s3g�Ti��z�ѣlI��?�<�A��ȩՌTN8��n��K��еї��l��?�
B0�HR�����YC�����Ͻ�E�q���P�����/}񓼶�t���8|���R��e3X��A�5Nϣ��,S{���j5D����]�Oy�9�!(cϳ|�a�jXt��f68��+��3�8�m�����/��<  �5��LV>*S���-@�-h�P@=���_�[����@���k[>����Q�9_����S�������Ij�&svyF��7�A��tc#�7��ך��`��,����:P��z����Յ ������pe����n'�T���[��;ܚC8�q���}Ηk��%����g��[]r� �v�/v>߭�Sd~|��8`��Υȓa���~�������xh% �%[if.�ǉa�������Q������|�h�! l���+�2����������������}�N����-���1  ߞ����������˗��N�o0`n1�����84<p `/КQ��eod���1�}�8�5��=��N'�t�������������/z)G⷟����oo���1l|�4���5�������ùC��|Qn����?�����컼f���zL���3_}��jZ�IS�}��VC ���o�f����o�� 
x��J	����g7�F.ާ�<t���<]rr���8ëJ�J�4cNKCM�1"-!қ��'��Eָ���y�����P�!%s*NՌB�!����52����d1�!�±�ғ����̔C�-D��JZ�7��o�Sg#O���Z4g�a%����ھ�^ڌ�Ћ.?�k̙�i�i/4.�����������|�$բ܋��X�$\7(~��jJӫ�hbr��!`	��J�g�/�p<~�  �eWf:�7}��GKd����CH ����w]��! 	3$Jm�}��S-F�^k��'����"�� ��
K*��Ϥ�^��o�t�bͽ�ޓL^9�����ͣ��A$>̚X pp��LA����ޝ�R_ Zp��\e�L��"��o���0c�a�6�G�bR_��izg�7	�1+�]�9B�Ȧ��yz��!$��[��Y���D- 3�Xo��7b�~�`��,�;)�+T�ۃ,9f���V�Q`xE9�!�['N�yw���y�[�弶��k0{!�G�B�	B,����N�Jf�IB�C�.�hߌaGz ��%Oӡ\��D��!��bN��s= � \��j�� bT��`��+\� 8p%�����䠾�7��� !�cEL�7Y�׺^BpQF%�Z�,�2X,�tIB:�i��xJ*1[,��N���G`�@ \�ѼĒ�2�6pa XW)8��Psiݹ�D`�#R�S�B�\�Q�n�+;�`�#u�՗��n�3k�H�+��R��d�@���Վjِ�u$�:xw��C�ih� ������5�n`��3�	�_S�t���ZG�+�KK+?UY���)2Pc���r��z���`���29Į����0g���Ŏꔺ����*�p�t]�  �yt�áZ�1���/h�,��0׬5�� �뢜��{�`	�D[u�G�Z�B��k ��{'6!5�;�˿ U�l���KZv=Ryz9�>�pc�2�G)b�Q�d���66 #+;�%�W"������K�-ʊ�]����ڪ<�-Ž�ce	���95�����N�~s^m Xwɬp��L���aeq����'"�R�^�{� �
j�OZ�Q�uu���&� �ܤ�s� ����Z� �Z���d"un���2��}a[ 
�|*E�'E3C"U�vj��5$��?�5����ւk, ��u�M�QB���k�q���~3���e���q :X�I&�Us��p bU��������dr�H���zv�F���0g��a�5���eZR��8�;���:*5f25X�j��; ������(�D0(�_�$�\c3�'��.k&��� L����
�����r���S}��]Q�>��R��F��TK��x�(�&  Xi�Q�-�f�@��
���Gve�!
`kL�+(mZ�O��^�d��҃��*\�;�
֛:R��r�V�N
юab@
P�j�V�~
�g�� Vk��p(�*�P��y0�` �55�^�fz��{�`U��Z�4�:�A�y ��Ldw��6�X�� �$< �鄊r��i����L�{���>u�?N;�`]&����w�z�����gm=�i	�k
�>�be����
?A^���Nb��D1���)�Fg�k!�.��"��)�ҧR{7m!��!P�b�Np����I�Q�>�a#p<�S/����כ\B(k�t���u}�DP�6���#�;�R�π�iŘ�1ܞi&��#�8����x|�O��FF���nEחH�\ţ���S�O
tO�h�����(��\�s��@��&�j=t;$���g@�bMZ�]s�C�f��JMZ����v\@�߲��:f�-���{�01�0乊v�Յ�$	hdO�q��g�w9II��#.B@�zN���~� "ji��	���`�R�ca�23`xZ'Rm��N�M�4�g���M���x�Iw�b�C4�+�d|�-`uZ�&��i�u���*-EB���1�A�g��#�?2�h�Ll�V��~��x1�ؤ��.������i՛jI�IJiZ�a> �|ۥ��q��sԕ�B������Rp]�槼�݈�3fu�k{?!�Y�0=c^'��'� ����h�����;yE��!��p�L%�*Sڛ�6�g�&����,؋[@�aQ���xL3fm�C�q��h���!�
��E����*YD��1os6���&M��K͖ �����"R�v� �&䔺W�Ƀ��� 8%oH�<z�a�Yp+����a�)L�iu���)�>��g�� �;1);���t�B 6�Yݽ��KZ�� 8��e���<�Y�"'��TW��]"p27�)�W�^,p*G�7�n��fJ'�M���ax�V�0��f]m4�IF_��ͧ"�����$ʇ^��%G��[\p�W��Ru
��ր<�b��f�j��$���Дi��,�,�r���۶��"N����#)�_��w@1��Һ�x�tD�5 �a<S�q	4j<[:�F������ 	x$b/>�{}�Y�� �hD"�T��_��`}����� �'�n �#���D��Dw˅�Rz0���kdh�m xl����a�  ���1�T�ZM���`���G�꽧�s���s�a�ay7:h8A�v�k���_����o7p����T���X���:���X <4@�C�%3����;�J��     ���@ V��V�ꘙl*��_V�đ؋<-[r��Ph�}��`srO�Z�M�Z0��HτGQZ�F��iy��h��\�G�}K
� !�ѦV{Z+��E��AN��;� Y�a ( �y�V�0d5jϋד��� D�g�7J�i��r]�5���XcL
a�� �����E��0on~��l��V�Kw�:X�c~����su���5��j�z��<0�� '�R.�L��c�� �vgO�vR� ���X��7�=�1�|`^}�Ct�*Y�ͅ�w~��d���Ia;5��q�� �N�uM���8�����tX[K�':�r]�rN�c���˺To�ړfT�,�ioV�` �t�m[ʮ��])E��3�(�x*>Ț�?O��P�1 ����[֎�N�+6v�MkDiIs�ޅ���� ,�u"ک�k$� X����<Ȱn�4VoC�x�Hw}���o~H%��Iw*:ׁ��y�ay�=��ꄩ*�c@����]贚Z0��m��d�{����g ����Z6�)��k,�fT�;#R��w�O5��Z���4-��(���v0��x�)�Ȥ�x����3@�����xa��`��[�edMl}=����Kw��X��ǋ��6f�[}�C;�e��|��H֡I� �)��&��#��  bO�g��#q��1D�S��VXK��!����a�Qa!�T_d��F�C$���a���EQ��d�7�\�G��>���a�f8�a��ň(ͣ�׎d"4J7�N0��M��Q�OCUq�s 
Kjh����� X�ʦ�Q6���P���tPS��Y��E�U�F�0�q�a\�ˈ:ɪ����;���*��Yh�O��9DĈ_K'fݾ�.ݾ]�@��8<�� �b,�Z��5�>@S��@! .�_�">� �7��R4Y_�D�g�|y���1���S&�����)�:m���U������ri�'���R�&��e�I�*Z�*tc����;�tDL�2��˦�#@´,c��0��< aZ��Jѩ�<X��[@��X��2 ���6ݽ�>����G�8�,�z�ru�SI�+ ˨���p]�L�1nPj%{��r�����i�[uMi��g�w��F&8���<!����i�Mi��DHt��~?=U|�9���1*�jI�@O���#ܡѐ�R�,����4K�L;,�8bB́�/,����� �d���M����y׭����t�05#u�W�JO��IZ��[:O���ƪ�x��d"f���ѼS��,�gL̘�>�"�����dj~�̘Y>"$�����I3Vfl>#���:��7s�s=�B�5�s����Vj�|�h�q�GO���+���� ΂qJ���]-��k��ݝݰ����׆�7F~h$ZK��N.��8��B�a���}�GCų�:WWV���6��sL�$ߎ�z�m0�hQ�vc���@3]|28*���!����'��P�'�� ��&u�����5��#v��^'b�^-[�	��z�T�[8˷؈�~�v�}��:�	 �/�� Hp��&��!� \���(N4Y��  pmg7t��p �@�����Z��� 3{ޤ4q{� �;t=;��6��ܫ��E�����J��4�fp�}m���ቜ�� ӄ�Z}[���%#o�k��bc�4��A�\�/x��@�/�E��оd!8)�#d��V����!=�҄`�p�(�og���d�s.M�lʦ�4����w5�Pl]���%'R� sd���D�R��?��ت��O�\z� �ٹ3�d������X���7
��؎~���{�]|<6��ƩKd��g���������<)��B�V�w�>��� �7�{�/�/�ޑb@nő�g!�u{ݜ��^�itw`��R����|�O������?�Yx�c��و��^ۮڝu�8�ݾ���m��b��#������� lE޳I�(�gM.?����1`�U���c5�)��E&C�> 
N��������p6}���f�� 1�mef�H٪?"�V��5����/jyG�O�z�N/?�����<��r�@1����e����p��~��`�[WiRE��]˽?�� ��p=<3��w���߈HA��������i�B�ߒ�� *��9�hzi`������[�3�;>,k���?�-:|��//��B� �;b������_�`>���֚�!��P���F�T�dve2X�y"�Ѐ�ӚD[m֬.�I��b���������˗��%*^����w-���'���9�?��o�����7G�Q]�r��}�iϐ�ǣ˼nS��<oA=3�āF�9"��7lm���'G�X�J�ǹ2}�2�S� St�����zW�BKk�/jy���5`�Q�g���Y�$��!�H��9<���
m�!��Z@�SI�I��EaJ�0=I҄y;���nb��5X�؏��벏
�_��;~����Ŗ\��:A���
���T�d��Y��oV� ����'#ً�RNd�/ /�&p��N�U)�wM \�VP���C�m� |�ah��*Ѡ+��� ���⇛ѳ�h�`{
p�+�:s-c�NYk�e	0a5ԌW�J�ɦ�C@.;�����'��i�=ט \�����]&̞ZXp��S�Je�F��.�^Kq	����X3�v�'8=�@4�J���"�a 2���(��E[\L�\_��썀����J 3[@���l�M��9����M#&���o�P�GY^p������n�>�Z�O�����Zsf�i��@� ,�$��uMJ���C(�.K0�M��G�L&-#�PpqB_�dr��!
 W&�7K��|����0�}ˤ���9�x���_�.z��
�an5JT�d潧f.\C:pI����4��:ّv7
ry[Xpq�Q�:z��XщZ\�*:>���V)E��I�˕W$����
1�\����`B2M+��7 ���%���k�A c�"�+B�5 s�sQdUK����mV;��d��xh���6펝�$ȁ/z'+��Y�Yf0���e�I���i�{�`�LDާ*���Ku|V�)6��D66k�fu̪\Ü� ���N�ê��%�G�X�
½f(L��>��Ҷ9]k��щ�խ�2w�@�����ѡʚ�X2X-a�d����B�]�u�<М��MN�;�(a�C��h�^+I�v�auC{t=��'\m @X�����U.�o ;�֪lw�ZQw�rQ���|,mu�W��p��-`�
$>��Af���:DYY�P]�4Lq�<���]�^99Ha)�~�=��#���OU�N~O
x���Q8K��3��y�m��5��$��*�6����T}{���:�E��L�I�ݩ˻ '�Є5� ���YJ�n4p��Z�B�s�,_h	�W]/߷
�ª��\�
����!SL��py��s#?[fa.�;@��U:s����Obڰ�!��U_��ʨ��*��^#N����S���JZ��J��h��'d]��� k1�I�=�������dm���u�Ī��b���LV)�Բ��0�����ں]��B�J�w� �r���U.W����; �5�����5�SM�~�!���ŀk{���jA3����] ��
v ������(��\��r\�1 +L6���S��iR��!`ņ[��(:�3*��b���bcm��9��oţt~-c���ԶVFE��C,��3��ǴT�G.�K� Zl��Ӫo^G� -X ��6�Ӵ8�C@
����NF
�ԡ_�a���@�~w�xSii�&^�^/o�E�n�*7���J1�m�P�U@�ml�� X�s/�k�W��4a��4�[�m#��@K`�uEMq��\z��&�.l��-��Q X��H�17��l��튻���j��B�0~ �g�,]ڨt%�#�ާnW�U��7�`�R��܋�V��)ѓT�    ��V�vj�"f9SJ������%X�`B>V�B�Y��`'�h��x�O����e�@�ʩ��q<>#�,�-P�N�[Rd*�����-�&��P�y����>��O��*e�����6�GE~�DC��NL[�8�B A�ezj�g�Iw���s|{� �T�䨫h��槕2ݛ�!5SdFYEt�W���7�G����y|�������c�6���Z�pT0��ȠV��@���/淮q 5�9IC����2�8 ̙L(�-d�R0YRf*���DZW%���"H
,P�fz������ 0b+�$�	Ɲc�� l������Mkn;����� h�Q>�6ʻfO�~��3��96��iL��E}����d�A� ��%�@A�tB�(�j�Ms��<V��rC�z�����=�j�W5�BX0_21��Z��C��P+i�3�h��0l�z���!@�&�Ld�.P�kJ"��*�y�Z]S�s���z�W$���[����y�s��P�nJ��a�wI����VؔV�N)t��}@�@ vZ��ϴ>�v�Y�>�^�VBuWvQ�������"���7}��ZE�D��6��o����t����by�v���K����Ѽ�Z�
�$���T �Z�X"�	WS
��+h�V$V�F����
�1�2i�7#5u��[GMs�a�	Ђ���C��G�Z>�0@�Pl�i��������
��Z�X�n�n	\P�K�nR~���C  ff
I��ۇP�:P@��+�ǱRX��p��L:�<J���2�\7@�؅y`Ziؔ��^M�+����xiU�,��3f.fuT�?1f�Ԟؽ��y��`*fE�t�[�3^���P�B�3fҥ>�ڨV�ź��G�8㡫�0:�; �3f�e"
J]I�+�^����O_�zC$@�[j�2zs���K`u�̴L��r����3�R�ϑ��!+���Wo���4�a^���[�猙V){Yo��rp�-Θ)�iy�����f�Ih?\1
q� ������8����=N0��h��%Qᚧ�=f�	P�Ej=� ��=�`��%�7c�R�����z�8�\����6&����0���g�%Yt4��F��#�
��1s(�>���L�ί��3u�ԝ��.jo�`�BjX�$�0E
�.L�h����%�m-�s1�w�̘��0ˡ�6�wP��s��ƈ��� #��po���T��<�L`4�}�*_�{X+ f�L_Tل�Ӻ��-��i�;�,uyg/���2c&.��A�N�U?d�~҅�}[>�*f���V�D���L�9�V�Č��HU>��̡�g��L��b��͘����*�^O��Ł��\[݆�c���3{����.S^�T�x�$Anf�K��J&�� ��ؓ���\T�R�z�7v�k0������o'���>�3��]UW�c��6���3k���D)�Ϻ:��9.fc�@�N�z͕hP%|^31�
G�t�0���R����V8���5z{��Ʃä�+�f�%�&e�����e*�b!�I�1jJy~������6Ǳ��q�d�h�iQ���L+�g��z�O��%�`�&�4�s�L���K.z�8�a�&���[�z�ļ
R&Y�<�J�<��(y���n�S���j�4(�j�A錫9`��)�K�X�6��cA�9U��d0�&�ed$l5�@'紼<����YOir&kD��� ���:6L����� ᩻��00�I�jL�u� X`�Sw�4;W��i���J<�.�[\ 2X�1k#��T�V�� i>�:�6LSe� D`����BL%.�_�	H�f�u�@o ��*gF�VC��E
�B"�P²�L2aT,iwE���;ܘ��N�ԥG���0����@������H�ޗ�"퀋LB�GYd0��jSp�uW�jՇY�K�
�]/��ɵrߊL˚��@��% s�Z����Y�,j?��Y8q�� ��I�L�a`?&�t��$��ƣb�o,��MҺ�*�YJ�m
}n�K��(���5m���I��I��&I�5�N��Ʈ� LM2¦Z%#9s��X�(䕑�0+��%�{��^��V+�&&)�h�Q2�H�|�&$�.
B!őF�a�
`b1���>�����$��I\!`�f%5�Qw�B�+���#.�Y�>@����P�L� S�D�{$s����6 �C:te�Q��&�� ϳ<X�T��|)7J�i�6*�:�Վ
�*� �IR9_}���5����k�u��� �V9���iA�-� LF2�#�,ח�`e�5 ��L��H���5�s����&��: p`R�&��2��pY>�5��
z���ӑ��(5{~� ��vk4+���_~ ����Q�t3q�����6  @8z�T MB5�7�+k=Y�;���$� ����P 
L;*�z���ǎ�y0���{��R��i�ѱ
��fe��e3PB%>�+��R�x:�R�Zm ֶ����q���� �j�=S�9�����Z�e�Cb8������y��&A�.�2��Q�*�ŹnǕ��`n���������Z2��Q���0Qh�dVJnm��=�e��Zd	��_��Ε- 	�xL�0'��ͦ�y[�f�h'�M-:���À�Pe��� ��&`
�y2u-̸���?�y��+��Q9{�eJԉ��c�Xa2OӦ�&��PP)��`��"��3ms܄ʤ�w  L�����������` L�Qgu�W'�����7�m}���S�L=p[�;�f�4z2������zz~������.
�;@f�ܫ��1vk-z ��������zY蘿t�]Y���pckq����J�,@V)��QS�[C;8��
�f�L��vE ��:�`��6�^~"L&΁:��0c;��ߔ�}�$��=Te�Ꜯ2���:�`���R����A�q�ul!���
�j���[�+�3�G���-�L:f҅���hz����$�J�s��"�t)�����\)	��4���.]�-,R��Q?��yfw�2H��!�˸��C�,�(��'���	F�_�s,\F�e�R� �@�H�V�,��n�d~��E��[@�-£>>�$5M�S��h�1����}�z*���&�d���Dd@i\N��6/�;ʯ �*��FK�pw#�0��58�$I�gjg�(9k pZE4�P��뻐���.��_�7�,���� x�V��d&��S\��u}} 1X�	���R_a�k�nZu�a}�d��m�k���_ 	1�l�"�E x`���#<H���]�Gs@���qP��A�i���_%����F� ,X!��5�{e>��(�3[<<H��r����Q��iEѪ���s.$���h�@K�e&��4����Gm5al���������Q9f���?j5�tOu�=�E�_�G� @�)�wT�U�Z�u�OU)�u�O�v��j���P��m哠����~} Ī�iM��A�Z�ӽ�8��2���-�E��g�&5$����R7��� ~0y���4��d"O�.�!��b�0e�N%frj����A"��J�e��=w�Y�Em/�Q8�f����5u�(W7̃G-g ��}ujP�:ʈ�Ih�����(;W\���`�dPda�����ҧ{?������a�I�;�/����	:`2�Ҽ�D���9��dO�v��~�� =�ug�5=7rZ���� A�~G�f}9J�n��qU �����~Z_����E԰F�t	�":V�v)�F+��%��J���~Zv��� &,O��5���R	��� F� '���QS?�{,���]'���3�E����Q, ��q�F�c��f �Z�.z:KΞ��Q �&�5B/u]��h\K�:%�j��z�sYATx�E`$`�Z5���E��8
 pa�r��1��ԣ4�h>��Q4 ����Ww���>C[����i�Q��{�����Q ��J{�eaG�6-B��J�	f��	u	    ���L]Q㒥�#7�jx�zTtR�)y&z�J��ᕤ��>i�=p�=�< ��(�[u�R�Kt���!c��D����o���E��?�C����L��1��3i�A)L^9�o4�@v�D7���faF��:i�R�GuM���p����m�:����k�h`��H�H�juK:��-Օ���V6wh��gtL��+��ۣ�!+Ŧ4y�Z7=�*�@@&\�e����.�4:����[��,T��o����~�U���X��{�-�7T��֮�4�t�[v{$@n��]���Nr{ ��V��K�B��o����B=@7U�
�˨�ט��Gذ�3�n>���A�+���ch�`��x~����bf��0vG��>�3ۢLOQ�)J�� Fp�A��m�h�"��dE�׷���2��jod������6w�s���7����bn^y@���L,`"i5�s�F�v��@���-M���B,,��5T=gS
��"�2�y{L@
i.�VS�<�����ͧ2���y{�3�sWo��q�g4X�L�~��:Gq9{s�������9���3�F�s��#ZUH����k�)���JOd�-��|�r{�b%���H����O��@�Gm�
u�蹙7h�s1y�Tޫ�BI��
���@k�� O2WU����EZ� TH@��h����ȷ�`�خ;fU-#��3x"�dW@n�;����N���8԰t2M��� n�G����5jı�������o>�hvZ�ЌD��HlGF��9R,�ħ`�P�Zm��; @_ytMF�of՟$M�u�^�-y�f��Ehn�z��'�@� S�lO!D@��i'uYxz��[6��q���VU��x�D{ɲ�9��l�lt�<����Z~Z]���"T�*f0Go��B�O6��y����i���4��$��U���Ik�ľ�#AU�0��Q�i����sk��)�I�$��;�k6'�G����5��&�%���� V03���hk�@oP�7}�5��]���p�%ؚ�)��C D0Ik��2��#y��+:з��X�f.��o�ݳ \�ܬ'MWZ�����v�j}/�Y����ݷ�Y�&�:Ń6���4w����H���,���S�q���-����o������ϗ/Q��__��"�����:D�B��U�y�D��0���kiIx?UO�4�����~�'��{�����?���a
�01�aQf͔ޥm����+����_�_��G�A,�ey��>�/mn#p�O�2u�5��F�RE��Et�T|w���[�(S�h��[��o�gL�����;���p�7͝,u��Af��<�+����m����}_�� ��yJ�/��  ��R��8���"� �b��M#���0`�Fe���2ķ_��˰��{>@߽�LA��F�3���ti��0��Dh6�_�00��m��ɣg?��vR�"�wT��i�{��Jd����!��2��U?��Wϗ��w��JėS��>OW s�Pk� Dci�~�T�A�e���:��_,��������y������!���4qx��TҢ�+�q?y$ Y��W��P��X(5R�� 4�+V���_~y�1���y����?~}��~�b�����H�Y�q�;�\­!�P��עlds?E�u���8�>U C���f"m!;�^�ݝ������Y�&�U�i���H�8f��bľ�O�`@ =Ywq�2�(�N���"������k�9��Ze?( m:�4m[q8f�O��h�%�rČV�x�o���L�-�Se-�}�~�{ic�ݨ�i���z��I��6{ux4��d*8���-xu�V^�(t���$�,K����� 9��(2W'Hy�@�T 6���C��W=�/�5w��CnB���C�-��q Abк�t�(���Oǋ#��~@�w@��\\���X[@�&��h��1hb%���{�0��B���׋/�;aT�- ����J��~��x�]�B��	�;��|�}���~ꚓ��M{Y��uy ^X�h�k�DǪa���������#�C����9P@�K&=]|v(��련����Y)�{2P�DR)�4��!`�Ձ��ݕ'�0� LXǬ�̽ʃu��`���[�H�J�@��Q�2�m�՘ŝ���� :p��Hk?$�(�UyRW�L�� ���.�Ё����'>���`9�����Y\��r���%u�jJ2S�5�F�I��1@�fOtQ
a�L��H�G�������5���M21L�<)b 
n��������i-��u�0=�m��d��~(E�V�u�j����57�tչ��p�a���WKIH}��ə��z��ǹ:ܢ"����<�}J�6�g�z aQ�5]J'$A�M9�@���`��<�Y��0-���e<�b�H#��^J�\C~���ܩ�'����D��������A���"��ѫn�0�2t}n�!�;l�dy&����%��i� 5�c�x�G�=���IT��)P63�`��@֒I�P7��9�P�K;�PR^C�]2=�	����!"ڨ]��C��RH�L�zZ��!2���dC��KՒ{�@�,�N�4����7��9�X�bM��,�3X9d'�s)ʤ�օr����!yw$�Fz�
�W���f���U�7u� U���e���+N�Q̽ �L��x�(/ gXh�wS�I e�2ְ�k��n'M5;T�c� �Y����ĉFes��g���]
�U��{p��T2P� �a��t_���Cu�R���r�i�B�� 7l�UVu�v?�I=�����yQ�j�O�i�T�( 3k[!mS��dS\�s}&��� 3�nw&�����C$���-�$�����,6���=H�U]�r����v�Z�r`�L�}���c=��1�6�3I��ܾ�`df���ꇄ�":Da�3���]� ��~�k���%���M��,:j� n���C�?�i�dk	��g<�F�bZ龪��q���!& [��%A<ߊ\������v;D�`ó���=��B�\�@g�
��MϞ�}�G[�T�}�7�(�X�3�]3��h�*�y�� ?6��X7]��x�����U�b�x �y���l��!+M+@��-�dZ�\�ԧP�����H���8  ����$�2�� �X�3*�������d����
Pd�*?2���%�v�'� �Z�I��/�����Z��s���q0�v ��g��b�v��m�5�����&{��6��
��zNk �?�(�(:+&r� 6���<ze�@�ڂF̾gF�R�3_�D$m�Oj=�ڪ�q��.ԇC�O7u]î!,#
5�('���l � "����vEcǳX�c�3�n4}��e@+����φ-��_�or�CT0Q$���A�#M�	ZZ�flYkmiO�K���݀oj-�D�rmܵ׏��~ 	�S끖w4PZt��hchn��d &v�.Od�<�ì~��Z�4ߥu�J�w!l0��p�B���SjM���)3�<śp}u �+�[�0О���ڑ@+W�~��>���Θy��y�Sk�F.s�O���tS�J��W��T/P(s�uMk�C���1G�N��j-ӞR��Pm06���(M��4�lFY6���:��ie��UF̫S��<-N�k�!T�zZWg�w�"�y���H�`�ff��EzU@�� YfV���/�#��U�&6��Z��z�QP���R� 3����1�ώRQ /@�Wy�^�>Y��a��$@}Nk����QA f�O���c�7���0��PgD����F�Q� !�}���.e����٧
{� �����kU<���>�uC���M��Z�skê�D4�v��=pP���9-��ZR�;̶�5\��T!���(��G�#Q�`"���	]~��tq�X1G+�4�䋦���s��T���I!)��� \0��ϋ�p&׳��8�oP��#,����:��j�oYcy�S���T;q�
���t    @�ߞj���#%��_~��^��9���KT|��׿~��W�ӟ����o_���3��3l+:+��*7�4�_���;SQ2�pEK�7��bz�{�&���0ݳ��3�����}mJ�z�z�>ݴ����~�j Tr�b�w,�wؼ�itR]%����%K�%#�����I�D��y��������R������jZ�?�]�_��)@垨��
ky[�=����_q�I%mȘoZ7^? ��O����w�o����?gx�~�2޼1�	?�(џ������~-@*�Ćl�4�Hy��7OdT0������r�iS�X��C�ۈB���0 �\I�Zi|=ne�z��7�6��_NWSjQ�T�^ x�w���g�%�S»�s@]+V%�<2:[��S��.��N����u��P۷֍�w�����NF��
@�x��uͶ�����m���8x�B}��8<��-7М�^�h����h�;C��2LZ.���P� ĵ��~�C�tI-�^`.�*�g�Y,7v4�_@-W3�UӐ�M�����x� �媧���L�7��:zג&��j%�+jn��f[TǏ�@X;�/��J�d�p[u��,c�0v'�����.�q����,b�+
�������o-����5�GYާe�'�5�[�	�+V?� -�s�'j"�(@��W�Wxk���V��U��K�[���Y�y��nh�����q]�HB�@�:��-�&@_./�d"�i��_�T�&���_��9��'i�c�H�rR�\e_�/��4u]��a��i�݀�N ����AQ��@Vp�XC#Fփ�A� �Yá$�J�H��ؓ�dy�b&�\F^��RD�~-����0�� ��SG2Md��|��,k� �Y2��,w����+ �YF⾪�4���N4o\&oX�����`���m��Q���?p��)2�<gN����|( ^֫Т)ձ5:��t� rYʢ莹l������e.�y��n�i� �K[T���� � ��1H�I]��z�z*	}Q^Ҳ��H���>��U��.�r� ˢ���_,��,�1H�Ed��]�	�S WY�Á��� ����.��B}�[׀�+���\`�)���SB�� ,k�4���w>|7 �����љN^b6~PB��]�B1eF�@�ǜ�@� l�S~?�~
�j�X����<�z��\7��+� �>M&��'ZM�G�)��,�O�|a�{�m���!2'�u���L>蒾le�I��4j�<��� ��I"���I ����d�~#�n��r"�_�m~1[��5�§U����>�v0�J'�@HZ���6ć�&*g��h��'�ˏ��DO�������A?�vt]���gɭcF~ -��T�3�� �����	��vc�.D�$��w �n���8���^8��nl?L׹�*O]A��(�r-I��� a���V�2j�4�$?��n�TM��rWT��nl=�(p�uH[�N�����d�;@Z։���1���~|x�!;�p���t�w ���zw��He	'��7�����g�&Қ.���+�m�,�He�L4z�B}�������ւ*u"cP�!<��@��k�4�t֫r�v{�w�Z����1��A�Z���ҵb�|���ʢ8��ӊn/��N3�`�Yiz/��tk�������Ut�mi�OoF��(��V� ������Q.ꤊ���Jw�vj�|&��V�'U�C�����J��5��[c���}��,�i�)`�0��4�*��߫�u�_i��K��Uzێ��0�fՀ��fZ��������1��$������̗�N��kVM�I�:EJ�Iuk�S�w��a���׬�P�/��k]6����;X�]����϶L�kV���Љr"��K�&�"���#�׺������� ���r��p��/�k��̘���Yq�U沣}~�.�i�V�R}R�fל����0�f��T%�����r��������=��ο�����Ah�����ErW�=�jV�)������A�̪Y��L��$:WD[-f���ca�Y!�x������|�0�4��M$�p�i0=��*�~�����`z*��~0�fe��.���v�9��i����P�ՑRy�nzݬ���3 Rg�=�kL�+���@T��J��e�w�2���C My�����1�,�z� ����N��3�X۹�_���4���:��]���w$�^?`�:�҅�*L�����0�fU�jC�<hBz0�f����Y�̣ZVQ�g4>� ��8X����}�i�1I4̥Y1���	zy��O�#��+[qA+6�[�15��E��nԕ��ѱ��l�fIJ�7�!*F�?�j{���\XJޕ�Y��B��?��GÊ�0Xό��o)���@bkh���,�5ٞL�[y��Z.�*^�����Ԛ*YVZ��nڳh��٭�X�0����e=�K�T��&�����x�7@�J���P�&��j��2�4nM�����h�ܖ���Fr����+s{�b�8V]\w�=�bX�"�����RW���c- �����gy�ҡ�=�҆�G����EG� {�
5�Ԭj!D�P+�R��= ��W�L� ��[�w�G�=�%5��ye�60W�v)�dJ\�9�v.��NiK��y�"'onq��Boۗ_=�[�'��p$RU���Cî��%E�]�m��Ab.a5����:q��8��XT��p���'*���x{ �.0�j�'�����D \ARG�{�-����A��,{� ��e}����\j�^h�ڑ�ol����<�JQ�C�r)nd[e��_@@.���<��s��~h�e����h=n 1�Hӈ�K�1�x��y�а���`!����WW�0������`��es���� 3�4bf��J��U��WNJ7E�x�a�p23�֪Mu�C�����G-:R�S�~��V�Dc	to:lႄNћ���m0lM�����ڥ��Cfp��RԽ�S ��hp9�	Yw��b`�E�R���jb��q /X���4|MŬ��q���X�ZY7��@�ʪ���)�YLJb�nj� ��S��R�N	�^�k�P�{��afw��z�hiC� �Dw�
�w4���X:�A�(O�51��`��^�lOZk����� '6�(�򸓻*z����ʰ��=6ո�~0r�����l��� @���g-�@����ciG����
��b_W�b��H��C��XڒF�T���]����Z4�F�5R�Se�ŀ��A���P�Z��N�n��R�$����� ��A��j
��Z���@����S׏zd}�����?}��1 ����&�VuH�0G�,8`a��~٘��B� �5/��.t�bG%�:�<��?����A҄�z�b V��l�O�D�]����L �N�jyV�g3 ��h$ٴ7�AfW��G<`a	�U���R'��� X7⁲����)J��M<�4�s= �1<t�=D��݀�T}�*f ��P��qr�"�֚`���Q�Xio�B��!��f����v�ќ4�ġ�l�J�Q�n4�k��4�� �>c$���#���ŀ��D�����Y_l �3{�K��a[��-o+a��C��o�-<�塦:ѝ�s��������ʀ�W��w��z�FLuu>�ѽ�V��]�a�[f�[��?9T	u�;3}��_�~�pdh��h����������9�3
d�t�U(�wꮘ6�n��{X�#O����L�5����d��3��&�������6�!O�2j�����R �ɟh���y�[���	�nl;z��d���ޕ:��OZ �2K��Ⱦ��w�km��t`��(�#����A���88tu�ݦ7� ��#�M-�p��J���ۄ�Pgc_n��n'�N���ky"��ʕ��� �2�!K�BWQ�@_fC�L]�.��f� `�K���ʵsQ��{km<�o��MMz";/��\�:�K������KZ�    �_���MV2I�!-5�A-H�3�1��O���;b���j8��ړ�����	���O��ayFZB��IS��qq�3��i��&�4��j�|Ԏv�x����_~�嗗�������m��1��H�ZD��Z��������rGbE��;�
� ��j�D�ܷ"#2C��/� ��eUf�L6mV �~:��0�u�`�Fj>c�A�����V�g<�N�dy_���<����z�U��C<Sϴ:8���`�7I�4��5�	�!��C;��H�� d��ē�as1�֨��VЀ�,@
N�H�yo)�~� �F��N�0a�̙T�!�'GmzP�3;����M��8��8Mw���FhX40�T�Z�жYZ�eN�quW�?�ր�7;��������>����?~~���5� I��ꫪ���a �J*hp�I�VM�� �5@��N���S���R�yD9ϡ;����`2鿾�����o/?�ϯ_~�ޤ�&�>Ȣ����~������Y���ÓT�{����0�Zm-�v�u�m �5�,G��A`�[�h��(��V����~�2��zs��D]}��&��il��"��y> �C%�z1E�v��D 0KJ��FA[�`�@���D|���(�AZ�����la�2i�_�w�z���_~�fma�2U�W\���M�Bz>lV&m��zƀ�ʌM��j�|����*5� g�;c6�s ء��̄^�$
�G)(q7��O۔��_����5/_~�����5ؠ�Ĭ��r�����}����H����߾��8��[إLô6�Z�A� ߀l�7���i��]�W��8���w�� �0�\b�0��^�����g�~���RFY="���z������/џ��������OCM�ߣ�����y�%�[�pw��x�����[���A�{sM���-�1=G]�d��BKNN�8�0���<���w퇭��qM&'�H&[�������:�&�C���'m�'q:'����W��M�����o���x�8����L;*\��ۏ���Gg���T)bLV���1{���i��ISB{a������w������x�g��k-�������
^M�N}���� �V�A���&���0@}��k�ySqT	��{_ ����>O�'����=u�Τ`��{�N���w����_��~�$���~ ����)�%ӓ(��p��w[e3@~n#�l=U*�FR��?�vJ��#�~�w]��Ӕ���]p̬v�7�_�e�@6��G79���� ������S`fMa
-�����c>%�D�s��l>I����l� Ƚ�j��Q+Nn���Vv�Xc<|���!�-�~� *~�=x��ϭ � P��Q+l��~|�3�#�̐
�x��~�76������ʮ֣��#���L���ܚJM5r4��p?��f�c��9	�tuPXuxW��sK�#:19g���꬐�V��������P�1���:�0 ������$��#�c����{��ݼ$��st�l��,�
�?�6���r#Y �C��z��dj��ok�o����6���y��`��{��Uj�O��9|D@�����V.y�w`�mT�����05��~�`�[���R���k�_���e�
��{�'Y
�UGa�O��`���[)ݝY�T��$��Ο��{�dJ�}�҆,QL�[C���� �c�@��Q��P��5�w{{K@~�=����5G�w{kK ~�V�R��'M��+�MՊ���%�97�e�(JJ_�H�`
;�x��Ag2�,����H�t	͍m-�,��+Q�?檰�殸��	ƴ����d	`����Z�h���� �Y�h��cJMb;ղ�2^�~�����������[�fq%]������-*� �Y����8��%��ʃW Ѭ�ӹ]�\Q%{�`ΊO4Ifڠ���
��šHH�*1A;��܋+@~�#իc��y��𾼍�>�N�4R����6��CZ+�}����3Ґ����o���y�s:$��q�WY]2m�~���e��Q,�3�>�*����w��p ��֮���aD���ݾ�p��c ��l/�;Ϥ9ϻ��5���'D��yW�q࿾�N�ie��N׀���h�>ųjG�$����"����)��g$(�͈��<������H����,�f��o?6�X�a�f#N���ʪ��=�WD�����������R"�	�w��p�߰2�(���ґ7p����Y�|�r��I�f6����T���!y�N����T)�:Я���ߏ��`3�tЖ�4�Ƿ6p
lx&�L��TW�:C��^��1���s�S�Ƭ�o��,,�I$I|��߼R��4�^W�f�F �o�o��L�퇴�ԕ~�����F`$�o�f�U�w�m[@����_��յWl��;n�7��b#�Uǖ��e�R�ï�����G��?�ʻ��ZΥi+�ˬ*U<��>�p;��N��ޭ�u�:}>��O�N�>����jR"ě&/�f�~�.��+N���������$MI-7A���ʪTY�Ar|��w����y�Z�v-L[�������o�fg�l/�3����A��m_o��i��k)��>�'������H8�m�Z���7dtT%��y�\_�@���^���I@	șx'��	xK���;t���t}�W�vN�����Ue|*�΂�&.i%�珲n�\w�Z�O_tW����#M'�����Ĕ�-��+7��{�w�������,��W��ƫ�)_�5T7@��e��`beL�j��^޺x�K��Wd�	��,ȥKCAW�>��߆�������@ ����F��3��:)NO �Yz{���`�v���W�O<H@���hf����tZ� �m^�T�����wܐ�:I��?"ю)�|�.@ �f��^�{�݆�MN͵E�v���=�=B�m���iz������5�lu`�Z�Joy�],@t���5+)&��o|����Yi{�Q��$&?UA����4'ȵ���K� �m�
[C0q�K)����̲}(��n�_���?��":����*ah���A�g�m!_Kw��T~��x� Xv�S��\�.@pή\u�9�����	�ېŷ�;&�S�� �Ę�i�hpC��&4UY?�P��3}�΁E�g��ې��uK�$j�|�c �Yx[w1�pW�:��("�����'�@���8��$P��H@��XGwu4�07���i8~� �䦗t���U���QJFݼ=Q"�����E�<F��Y�ە�(��q(� JJ���vA-�#^^<Q*`�u#�X�C[���&#�O��nȢ]���ؐ}�~Ⱦ��,���!����j�L~�)p�U�tђ�r/3�,�o�"^g�j(긅�	a���tjg��i��BP@���	���=]�0$+�b?�K�b챍�����״�D�J/͘E���0�L�ήv�nS?aV�bb�ν�ӴGcQ/���3�>�tVKy1C��~�	����{h�Z*��lO5����0���'B���-�HOft:����0�Z�E2.O��G��z���j��KI�q��O�.U^�ۗna�Mj����^��L���z�]B�G_��~�G{pC�P4}�p1O��[;z�c
y>������Z�MP+s����K(�[���_+����;� ߻��J�[J�1m[���}���M0 ��{Y4�{����@f�3�
�����b�1�U�
 �/^('�#W��n%;� �/_B53�ҙQ~�+ �م޺��5���1Z��)��)�`ߢ��}�k �}���Y����,�6-b��pړ�?_���/0�L4|�<-�k `�[��ǆiyx������.m$єǥ�>�0���+��S��@�盕��I�oE�cC��?����x�~�tL�k~~iг�����#)Z���C�`"�7�    (��h:Q�@}�Q�C2��@���>$9��\���>ߝH�-ژr�U�Rz�^����W'40���2�������Ou��oNڜl�D��b^n�6���Ƅ��8]{a&l���۞���Q��O�0�w&��.�Y�>����O�T��DMY ����WCZ��KH��9�#9[�v�%���������l��[��w��}�$��B�g�S�7�bAN;b�B�g�SJB<��!���c��<Q@ [�&���_*`�<�m�Z���^���>S��Cę'�����V{Y�w�
}|�d;?�[��%�l�2 �g���s;��&�ݪ6P��x� ��*9-Ud�^�BE��X� &��j%j{�%����p�`���[
��/��y����]V�<�jL+�Z� ����<֞������qp�^�ê�m0��GE���#�>Q"�ۭƕ�*�;�/���mUKt�8?���4�ߐ!ۙ����-��V)�����Y�\�����._����d(���ʮM�!�2��o=V˽��L��Q���E�S!� [��M@Y\��<�/C �Y����vF��fYyC��x� V�k����Փ�kOw�� �}W5cU�}�>?�L�{uGք�B-WU���"���^4i����K�W������.���f��;Jĭm�۽Q�����$+��IO(��`�
�V����!�Y��ߵ�ۮ��̂}{���O��\� �w���eR�Z���,g k���L>I�шdd߯'
P`�Ճ̴�n�K?������: ����㖯�� �X_E�V��r��&�\��Ya��dؒUd�=��w���� ����P�Ì�������&]D�fHR���'.@�Z��P�����æ|5\����"� �}����cִ�՚fm~�$7d
\��}� [l+2�7�u+�B�q���n�s��3Q�!)��9�,0�d)�$�D�]����� ��g�Etۢ.oZ:;�/_���?�+��Uj���j�gB3�b�Xcl�ndPt�z?�]��3��^^s�6�?;L������7��n$�M1�>Q@���:���x��`�e�m�p2����� [{��0uM�
�/k�;C���][�q}[. �_Vm�_�,�E�4��;�L��P[X��N�fN�T2�7�w\�
�~#�ڊ�R"9�BWP����PO���R�2�B�^��ٚ̒_�6��f��H�������&<}�[����ˋЙI���t�v�Z�$W�F��K�g�"��-	EM��T�>>K�=[7Yr��tj]A�o�8�/A�leU-�^Odr/�jKP=[C٪goj�9q�5���h�������^8�b�#�n	2h�-�+�¤ў>Y�*Fd�ޯl��A�g���>�w��@d�S[�XΪ�ޭ�:U�%�9���`�u�uE�r�	�����UGQ��S��N��j��{����kVlf��ӱ��Jh`�i�&�`8ˏ����@�Z���|�.ƹS��*��­�������/?�6]a�,�.<hUc]9�퉲 �Z[H����:���]���)��*p`!t����w�ZC?Q���5�����(ϊD ���`4نK�u���e�����t��w��M+ H���$Տr����&�x����Pyܾo������_3�x7sW�~����`�V����	g�� Z[_J�\lU��z{frO��ipT�ڎY�W
P���u&�1��!��l���Ĳ�;�M�<Uu�L,���L�FWt�*�[C���g�@ͭ[S��@*؉d�4<�
����V-QN���ePKq���p�gA�mo;m&{�^0eU L,�&蔢>N)�;+
 in�z1���D\�Ӊ���Pb��qV��Dqn޶6i��K� �vȢm#�>(RS6j��k�!m�s�=+����Y�${tj����%  �r�:���zk��	H���*�b��ޑ<5�T��nr� �Y���YP��=�����vȲmz�DrTQ���
D�!��-�=�����Y�,���Y �J;�;jL\� K��D43� ?0`i���`W�!��sbd��'����jm3z�>�v?;�0��,�V�Y���o�B�>�� ��8�ܑ:Iu���i��Ce��Lg�i$#����Ί����lq$s{]��;�h�C�f�63*P�^;x8��@��P�*� ջ�/N'�.� ��M��@��`d6�����4��m�`��	o�ϊ0`�v���W5}���+�i�+�Ğ0�h�,�6���Z=��W��Y���׮�IR���өy�*XYg����c��?�B�gu6yH��H��Qq�V��Y�]i#<�Z�� ��������.ۜF궞2�*��,˖���k��8R���k�I?�A�=_^�y�m���-��c{���/�폿�:��?(�ua�#i�>�?�rV�ꚟ�w]�GJgge��,���:���� � �^����$\�7=���������o��񃣯���P����F<��tUѠ���XG��&�{p�㬴Ж�<�H����Z$�f+Ϊ�Au<%�Y�u��g⢩����韈�E�*��t��똷�ÐggA�gz#E�a.ɐ��wu&�Y �����`S�RZQ8N$?g��<@�����S��
T`�cV���<<�^��n�:�l�˷@q�d)���� ���
$��]����i�U 1��6�ӻ]���ǉ|���`Σ�
�9��4Gҡ>LkwV `SE�(�7����8��Y���Ա����߉��s@�@���vg
�=- ��A��'"{p��4�	S�v������U �����G{ڍ� �ُQ\����g�Η'~� ����O�~ףf��vP���*N�V��9�O�.����|�K���R��i�\:VN�A�g2!;�!�Xۉ���������T?��ty�V���~�Z'�UAs�_y��4?O:��:�Sv�I��=����z������<>�<3-���ϳ�%�(T���8��יJ�p�#j��C?�b	�|a�$�H���;�/ �9��MB��7�K��6��m��.�(��f���A�_,�6^t�ft�rkw����k�%@�<�.�E|"C�v'��B-�F(U� &�Cr��� 	�FH��AǊ�BY��N��M�9�/ s
Չ<��>l��u�ͭ�g�>�``ra�J,��sgu.0��]�k����{�?�60�PV:gW<V�;+0ay���0�k��'�VW ��S0�v���o�܎�'^D@	f��B�25g��RF⌭3q� �ߧZd5��������@�Ϋ�lLV��֧��N~��+@�����\�}~g2H��3 ��)[�*w�1�w�n��Y�w�ta@�dm����g�>(�u}C7>������Y�e��D��gY���R��A��cA��ϵ������ķ���~6��-�

cIe[�q� ��M�=������/��G���?�'��*��ȧ$��kkK���2˴���|$�>M���  0aF��Mmȫ���r`�D��0����,��'3q� \��T�s?O� \��>��tV� �c�����*���n>���h�L��j������@�gBL�vd��|͎6��C�����q�3��?3bdTRRzCU��%�B�gL"N�N���D�ch0��jo��I0���{�ۻ�t������S�������1_�����rj��	aM��.���x�C�r��C�g��Lu��=(M�T����|�!�2������D-+���&������yƿ0�v�����o��b"��Ǧ���@ s[�J*�K ���f���ss��R��xy��/����Vy�)��B����Ye����F#=�f�;�`���6�8 �I����]� 0�\��T�"@Y������sb�\UC���Wu�^5� ��eb�MGֿ{/T��� b�>�ړ�z?saGq�ȮCh�L�9���ޭZX���eAϷ�a�#>    �l8��>3`T��JR����ޗ^;��>�_zf&)���y�!4}k�E�8��c0�m<=J���z�Qf'�E&���C��m�^P��}Kg�A�g�˩<i��)}��	.�apen=���:�f��\VɥўB��nl��-j�z���IX�����%X���]�ɓ�wlM�2o(��:?jaGX�Ͽb3��˫L����IW�>�W�ؚ�}���3h�Lbٙ[T�fmM�
L�}�s{g��ë4��j���鞗g�[�%��&�^l~���������	��v$D݈��]�D��Ol�'�GZ=UIL�O:?&�����ۚ�����V�z�I�◞\�^<k~銏PP�s6OQ��,���z=������O�㾴O�b?�!D�-��zD�G�#�/0���x`�|�uX�߱1_zr�J��}�sh6�K{h�}#�D���6�A[�w�YoR��=�׾�94�6�~wf-K��t��R�NH�������Z_nםhՏd�Њ@KU��;� �ʺ������� jo9`����H��V�wײnJ]'�ًlԪ���)/����t&�8P�T��!R���C�'~���f�P�Ԫ�E����"�/|_�_ �s�a����l?��%�/|\�Ƹ�,_�{��X?�����w�+�����޲��2;���7�����~��'��oB��YK�<J�/=�뿳��w���ny���Zߡ�q�&���s�Md�/���W�&�֞����ZB��]\H�p3Or���9,���T"Y��D>�?YB��ǦkJ�t�-�0�_�K�}�b������5����:��j4���6����9&%�^%�/*��Kh|]�;�l!ji��)��~j=�^��¾��߀F0�S��.o�~��k��
_���$�̗��V�qᏂ~`����A�����ɏ_�G��?;q��P�H�韾��V� �"ː�����'�O���'Wf�o����IM_\S��K�A������-�
�e2���b#Ն�य����Ź�>����h���t^н��'����^Bd�����x@�tWQO�=Rߎ�N^AQV��θ"��?�)뻺~w�͡�s*b��Y�ò-��O��W�
b1N�{HXM�$ު[Au�s���R�B����׏
O������;w�)�+2qW�Ɩ�<�̭��,��<���"%�Qd"{�M��̷��oU9�J��As;qa��y�(�[�����@���c�.f�~M���h�<���U���\����C�ri�\��9beO,�j�+�Vd���qw5Aӷ:�����!驟7�=�H�z��s�چ^'.>OV������m!�	����������M�4j�$F3�iWo͟�e��Z�PH��i/�-t��fmJ��TGc%
����ܕX`��$�G�y�<�  <G���	�M~S��, ����7"*u�D|/ksL�Q[@�Ck�a-��=�c�h�4��z�E\��q��uL�7���[��N�����-@����wy��V	�>���v�i�!��.��k�]�z���U$ڻ�*�����^#�N�e �����[���<ߧ�=[!�}[tw+��7��ˤ㺠�ۄ{m�W��$�ۦ�e|W_��yB۷�mOá ���n��|~�s�a}��j���.���+NvW� _j��j㭵�h�n�5;~��|bNiR��}�we�e�!b�m���L묬��ެ��%2�0g<�y	��w,@૘�hʂ�M���,(q�uLXX2�*]��bTP�2�g����:U���ےi�f� �5:���5�~¹�&���
��杦@�W����%mBh��ө:���h��P�b��E���b�_���sX.����_����O?���@�Ǐ�����&�fo:��ն_���3�f�~i]�
���v���erO��4h�����E�צ�@��2����<��Kk�%�͵6.�G�@QS��雇y�f �r�C�������sM'V j�{�-��EEI��ό!���{w� ay%��E�Ȣ����]A�����u���^�K�������"$�,7���n@��r V��Õ�ϫ��pbe��H����B�mQs �� }~��k�����(3���#�o�cn�Es����GZ#�./�@�+;�]3��Հi[Gj�P��n� V*y�ⶳΡ�s�}Ѣ0x�Z='�SPЈ*�7�ʎ�	z��:��(hZM�%N�'D�9������N_�4��St�5wwM��l���m��-�ǯ�cE��}���q��Y@�_�P�d��掌�j��\���ӧ� @��)OU�`W��Z�{U��e�󯗌�͞:?�=$������`OL*M;&/�Hx!Co k��k�$x�K�pWQ�Ⴠ�Y 4��co�S�2!sO�:��_��Xp���K]�������p|��a�71����c�(~��hK���5l�ԃT�T��>M�+�p�X
=}��)�8�k�p�,xwT��T�}��n� 6�5��;\�O `� �/�I��n�9~���7C�oʢ肨,�7#��x�������uݩ'O�%��͖�%�j�c#L~�]�Kw `k{���͛�G	�˹M�yM�*�������7��ֿ=�mR�ɋM�+������y�Ǟ���
�v�ߤ:�o%K��|��
0`ˢ��p�$��nf1;�
 `�Wå��e�&����]l���$���b����"�|l�V [��#Y�6��DA\Q���� �vk�UG#���g3�2����9���L��Yj�n������:�SC�̵ܵ~��	��iN�ޘ.���<�qU!TeOj�d�N���;�˒͠8kk�ڇ���Ha�aH����"�{6�ǀw\����Aa�<̓�)wU-��sސ��B2��T�!���(�-������[CU�6�jD��I��@1�b���/�p�~� X3L�_���j�YަI���O��A;,km�~8zi��Y7Lgc�7m����� X@ܐ�L�d&��d%�Pr@>b��^r~�̋p��0�.D��j+��w��"����+4`��kߧ�z�|��@R���f��0)��� �q���+��Hӻ3?7S )AR�ȵ���	@��a�*)�Z�gөo`d���q�
�=yt��urIp��b��XH\��:,Sg�tS��j��B���z/������=q�zb�&߂�|3��[Q�nw��(YQl��&~
�R#A����
�u���:?�INY� K��V��<�\��gpK�ٵ�2W�0H��6���!��V�(�� '����'	H��bUQ.��2�1Uۂ�8�[A�Z���wF���Qit�^�-(�CV�ߴʹT���M~��l��鷠.Y]|�<�H�$�Փ�K�w�3?7B[��sk0Aޙ�I�<!;.
��5Ƥz.!w҂ ��V���Y���t:���X�Ӗ.	�A&�S*Xh<��-��CV�&�:�d+�����ᵫ*�yU�u^�}��E��D֯"(_��W�d���iq�8��7�i^�H��b�$�O�q�܂�8d%q\�W��%��l��3�C��]�����:�J�	�<����?T�VSH�Bv�����xc*�U�U�wA.Sm���V�@jt�-h�C��{z��$������	p�J�&>�y>{�Aނ�8d���ڀ"ӥh���&_�))`����]�Ԫ����DYa��'
�㐅�:vR+��2�+
�`	I�������!k��nH�Yi>uQ���#H����BY턈�4M{�2 �S@���7��-ȋ�sy����oY����U���.#��^\U��Y=L�t�=����������e��qA�g�0鐚�":�6>��;���a
���^���Ǟ��!�ߴyP��c��Gdh>Qt|����Z0���I����&Q��FmAO���6)�$�;Q��9��LAQ��8����&�n��pĲj�H��9��e��ԓ�̬�l��Mx�< �g2#vIRf2aÆ��    �(� u�����]�Ë��L.m='���!+����&�{V�{_&�[P��6�9�Ú&���>Q���1-�^M����1߸'
$`}������$qc�W����E\�D�~U�'?�G�VX�v �)�E���3H�C��v2�:2MZ` ��^�n+"]����"lATn��������]߂�8�ج��A�eR� :+�g�y��ڤ]ŔL�wdM��ό;��1��S�g������NQċzX�9����F:lN���νeU�R�vt�jJ2��Ƌ^��[V� �7������z�VPښ7��n��\k��͏ʨ4���/�YJ<��3=1n#Mz՘~/O�����aOv�{u�(j�8����[A�g!��k_��Kg]A�g�B�tQKV�(�wU��Q�������L�m� {�N�ĺA�g����~Fv���B�gC!�2��ē��vM?<��1S�[��?I���[�⨷���YA�g�±����蛶+���NP_^D=��@��C���:���3,���@b�3�:>+
u4`��\gI/�F�54���,�%:�E^�dkh�V�Й���1��[�54}�V�2��7P�/ԗK�vM��
{QhQS}�oJ�L�������k ���:����P{��w?kh��,$^��-�[4X�lA��|����������(6ڏ_�v8��:�45�}���Gi ,����Τo� ���C���O��vퟥ
R�}*Y��rx�(���F�P��hg|/r���?��q粏J�D�@�gi�!q�	�̼��l7��m��7-�w�mݔ{�����J!/{��ʃVĜ��OY��(>	���l  �O��Z�>}�X�u���G/u�2A�iZґ�=���r��kg��t|�<�/�[��,`�O�������Xm��6v�DG;�D�K{�F� �O���T�Z�]yz� X�GW���(;�U�2A��}'(q��R��W@��	��1?H�
�6�@�QK&�T�m�^^ X�0���ew���q]�6
��uA�=;=�UQ��Y����7�K,dG�v�2	�IͪL�(�}uK��26Q���m	�u�{�;�1�U�A�_bҍ����/QeA�_� �&?� �8؉:��D��CT?��U���A4�޴3��W���;�D�,�y�.��+;�O��mՈ��KU!�r�T-�Q�b����?ǅA3�Ȳf�^e=5܋�c�����-�����n��"M�[�Dn�/�nS˪����m��'	��Jb��;'M��S�A/g��ֱ����.\S���%�~���&?�'&M)�X����W�B��3Ƥk�eɥ���eA�_�OsN
��i�,�:?+*-���\�ϡc�2���
#�iu�C<��ο�f4�Bw�qq��YaP��lԖ� |L�UQ��YUP���3/_�z>	ȋC'��^�"�2ߍ���D���YS@9}���t1���j��������~�b�\���V50?������'���(�w�9t�͙������蝲s��	��c�D�AUWA�f���`͟���25'K}m�_̡�sHY��"(�F�񢇱�*?���~���M�yI�m����26�T"i��@�&툑�OTx������^�C��1>W�6l6��d����et� �S��9��R�ü�;�� "8���7�F(ד���e�fƢI���nX��!������g��y���[��^�� ��k�[8/ELp�Y�\�&q͇��*���̊����8�|�n�_�[�Zph��	����p/x�8 63$cU��i-y�/��@� ���]Z��:�˽��,�3��еx����4�#�}� ��������K2�#���}m���WҶ!# M���Di3(��-i�M܇��8m� ��M/�0}���}��,{#E�j��^N 텬�L�|�хT:hB��E��y�VP����y��{ō{y�k(js������K����-�\q�a�����6��&ސ��{��|i ��̲x/���~5�m(�����"��`�� ��J̥�=r��� X�{ y�����+�L|�
`�dF�"����)�m���!f�6�;����ʉ�I  �!f�1Y&eڻܕ�~�o���eu{�UiD��"�Ve,�Բ�g"�o�q�T�o4t�Ce��-�J}*��nje�b����0�DPu6�$&��J�'J_��2�f��"m�Wۤ�8h�m�T�'�H`q�A_�h�2�N�c�Á<�&��@�ژBx�ā6�&�iڱ>�.=yb� l�y���Y����
�`�cf�F�P�E�Da�	�����3�1��0S����qE)�Fp�v ����Qd�� `n!�DFen�����^@l���L�q�������nA�if�i�UY{J�QuA�gq0��&]l!��
�?k��6kk���R�oِ�=G�:؆�����y�u�.�)|݈�51��Ks�)�`��ڟ�]@����ܕ�B���M=b?�P��2�Q�CqP��2���2� @Z"R���6�.8d]p��~$�/ǜ�>Q`��f���(���3Q��-��趇���������� a�e&�������~�6�LVodqc8
^�`Qpݾ��Y.2)�#��'�h��	�$׌N�~�(h�,	Y��R�6�2]�]is�øf<O<R V�U�K�R@˂O�8�����L[�����Aܵ��nv@~
`ip�}+�wi��G�`y�8@�wt��3Љ���F��i݂Ի��EC_���@���D��>���v_�-��.+ȉ�����e� X#�/du E6�@䉪 l`�(�B��ԧ�FLpz�!B�_�s�6���SV8�r�w�.i�"����3�)��8ĹΓR���=hbu4h=�˨� 
XX��E#I��c���f�%�S�I�L�{A&P�3��7N��r�Te� ,*�^�peot��6�L�T'4���r�AM�eY)�^[[��K�p�$ ��X�
A���ZZ�� ��*��e&��xkߖ;�L�T� ����H��>.���� *��efP%�0k��B'9�,��b֦����X{�K�T�6����jA�����UY��*��e�\�-�Q�e��2�����)Pc�UI�VSW:�odb��H��⤬Tm�H���T��8T����B��Bm񨯽������ۯ�?�7�����f:�p\��b�ǇhZ
#%
i[�0�\7�uq<:��5ݼJ_Or��f4: F�Y︅�ʛAy|�
}�B��B���B��=�qV����j ڣ��C��q̠��P:��U���N2z�U���Y���I�]�f�l
�����趦/�ȶ�n������n�ZսD�fv�nl-��^��}Y�7��]��3�)��t�r�"�u- ��-2i�i�[�Ӥn��8~��&x7����ӡ:+����E�&�������D 6�)�6��:'��̓��������j��ou��$o=�/��9o���sV`���'\�}z�9+p����	�_>�L9+�y�چQ�7�Z 0�{�m�=���=bQ�)q��ũ�3�'U�,�x�Ou�\��u[\ͮ.�
�/3WOt	PŬs��8��c���� ��tn,��f穏-�f�ǌ6��ͪESǃ}�v�j�{jweV�Z@ )f��8Sg���m\M[��Of"~0�sV$@�ҍ6�7iФW�w��o��������t�(�㐨6)<�4>�K�.6U�|#�n�~�w�%��i���b��@j	 3���V+�Ǡu�^+��L����<�p�Oh��j��Ca>�&uVtqf�W��־7�C儳������P�֞�d�}�г�6^��OQ����v]t配W�R��"������
�9�I�&e�ǒ���i�`a`����qH9���N�1 0���v3�D�� Ok8���g�yC����sqK����D��L8M9n�O;+����d�AW �,���� ,�<՗���*?    �5�����E���k��[�Yq ���ca��� �NN�5?{�5 �#I�d�<��U@��v�u�^�� ��Bd\��� ��q�S����*q|��,����yu�D�x�6��1�������ɓr]ty���{^��U���gM~����c��@�g�x%���[?�Ҫ�!a�+�vo3��i�:�� �3k� 2!�<$���h���GIj�X��0��>r�wV�����eV�Vw$ ���z?��Ӹi�@}�u�ͤ_)  sǫ.������v�[ &��߂�T@�������]���n��}�w] Nj��8^��8+�a�}��O�{G/�����MD����$����v|6��qP)�g���J������(뢮(�&$Xd����T�*�v��z�M����H^g�m�:������y�ek�>�-��b}m�R��vc�N^���e]��k+��T�-���G&�Ί�8;��Yˈ����� U��� o}������Z͡6���}P?3�T��VńOdи����28�� 0�4����Sx��OC!0�rxgu
0��U4�FU�^}B����`��G���f����{�#N���d!�~�z�\R�H�����'����D����Q6*m�����V��d�����z=�8��<�j��o-n�S��z����Ą.�����[��3�Su�B�]X%��ռ�E��?�������6S�w�~vE���%��9�,��ϔN��&$�Jd�{��Bh�̛,d}R��Fd~�q����5�-��@g���9)vR�u�1�\�d̛���3@�O�e�d�rI����E��v�Y� ��K2�C��7��[Q�l��TI�N����&���Ѐٔe���R�$e�F�>� �|I�2Ё(xΜ�4@�p�d�����ϫ�� ��hرD�??	O]���:֞��� �q)����\}�s@f9ֱQ�*d�s���>`�cn(W_���X�\������|�LǓh�T�-߆M�����#A�e��>Q��8��8��Q&(d�|� 
�䘔iZ�����$��m��l$��6T�`�1�C�g:cU��T/�=�\�@ ��� U]G��7�T���  � W�L��a��LQu�=.��3�1k�d/l�&����7h@����]ե��ST��pn�K[��Yk�) �rv�d�R�z����R������9j��y$^ �?."����[�u�W���(7�h���4�����l� ������S/�����rW�	��L[ �i�m(�7�u\�8�$Gst�Ӓ�u���4�\tt�O���D^��m,VV�J*����`e)�>(T������� 9u�|�����	�����A�R� ���;]����Wl*J�D�F��=Q!t~6ʥ�VIr�)�H^g+���(����F��=�SV ̺<�Q�>�6"ʁ���3)�,~�j�����L�r�kRJ2jN��ӎw��ͻ,j�'�T����lb��>�ژP�Z
�VH6L��;�)m=Iy�zq��)��I.�ϩ������?����Mb6�B&��k�	έ�˨��Z�[2|���뿸�_䍵�^c��(�od#<�-���$͕�v_/�����gB��@�%���o��q޸^�j~phb���`�/��~8�%�w~��}n�ۙ��$e%���G"�2���-��oA#`b^*2mA���h�����s>�+��i��aZ�W�t�9_\9h̜��e<�*�s x���F��wY�:�����f�>����������ǟ��/�����?�r�K�O�t �O��r/�l��
��z��"�dH!��_yr�6��3}��_}����=�|���ɲ�a��و_�h ���_0�0��ǿ���z�z'�S}��G��_>��5�����?������ Q����/
����+���R�&�}���&�X�Oz����D�����$�_���=\���dFɆe��W��e2��o��~�����C.��Z����\G��=Seⲿ�[�8�qt�L��?o���/�����B6�D��I3��ZW�Ba6�^��DD��B"���|�a�R/|DW��'��'��-�����ۯ�?�����/�������o������ !���VB����^�;��O�}��Eb�2+[0T�W���S���OV���e/3����{κ=���换㲶P3�"�����s=��N�<�8̔f����$��t��,>����\�ܼ����`�֕�����^��A]<G#����K&��!O�]ys(����wy�&����J���խ�C��,m5�y�x�W>��'�pWt~>S�a`�FlOM�O�M��*3
.>��NY4|NP���}��ʴQ[�[���E{��B�ao�-�s-��W�]���B��)�@��Ug6��σ��6;3����W�j���#�}Esu�]c��'�&�|�@�4��������>�+H�)S�E{2�P ���}�@0���8�uY�����4)d��0�Y��!h�KI V�F�{�p �/_$��M$�N�S�Wp��c�����~��kN��>�otҐ�U�u^o�	�#�}~�f��g6X�DF���i���T���w%B���ЫHUqjm:��\����(�����s�|3� ;x�����U�\?�p`&���{9uY��y��.R��A�!�c��`�k4ݵ�z�j��Zp\@ݾ�AҤ�=��9gզ��>GmtV� ���d��������z`)�:� ��b�Ҝ,���[d���>Q4~�ґ�f�3�t��͡�N}���D��_+���t�
�z:Ii���C���|,���[z�h�a�,��A�_\�mT2��l��'  ��deq裌�㬂7���`a�C{������`eu����5���^�K� lXرP�Hqk_�� ��3�Z9*|��\ ���8��=ұ���B։�s]X��74r�Z ����LmI^��L�h ,��t�"͍��mʼ�X���΀"J��P�MY ���W��}��]����:?��H	��@}���7���M�T5mguç�,���ܮ���RA%m9���jwuA��UW��Ҝ���1�2Q��n䮻"	XP�S �(����L��ݕ���:���/5��N��*��LA��Q6�J@��:b�G�S���5P>�t	x��:U���A�ě�% ��	�.H�鞯���`uv5p~�9uY�,��]'A��X�KC����@�
;=}�Q�կ9{�W ��d�{A>�uKʛ���$`y]!Ӵ�T�o���'�(� ��dFr5q���x��,����0~��n� ��b@�A��D����咻� 	��d@��Eϝ�0���Uԁ�V�6�������/8�`Xs�$9U��JKmE�r'���ő�� b}.�!a����K�pX/�޼F�ti*2/e:��� i�L"�D+�p��<��8D���{Z��V�x9h��:ж��x~fk����QYV�H¶jA������ 6<3"b>�?]i��jg�*lT�˔�����!�n�}�Y��k��Æǽ<��l�j,�̹��}㾚����,���u�6����1���l�@af`Ҏy�7uY� �(��geu�M����o
Ϊ���Y��%1&t�g����f��;�]v��nV�NH9� `�Bwc��N��'$)��0�صu�^،�5�x� �,����� �L��7�����EQ�������o��$_�Hd�jU'�ݭ[��Ҡ�o-�(��5��l��o9K�,Yx���YE��C�Oc�]�餾��Y�~�h��f�ޕ�.��SMv'��r�U��X"���O%�9��ֆ��}�yYYKzӠ)�L��\:��U��P{}UϵV�C;���u��.;zՌ���4�k�1oʞ�o���x�i�s��]t׽�]i(�ʴ��\UM'9+n�1aHfy�f2RѦb7���\��8dqT��f��B(i    ��&>�I`�'���U5���b�/Ii���H���ڸ�~������ �{��P�Q��1��O	``0���j�^s���S��yrk�z���/0qm�,+��A6�k�X^�$��b��$��B���{ `�Ģ!��%��8�E��8dq�֚pN�Yk�f�^F}~�@H��x/����$:���D>��KEt��@W���+�VtE,"q�M{j����c�5�	�<��/'�h�C������=�-@U��X��<5� V�"޷�4u]��YJ�Yh0�e݌<�z�1XQ1�dI�T�z���D]��+&�O����{N�4��3{1Lbg?#��Ck!��L$�;��
:�M���S[e>"Q􉪠����n�\U��}ل�YguA�g�z�۠��,F��yb��˳f�nPc�}���!B�gͰ�㓖tJ�4�+ݞUÑ�I�Q�6וz��Y�)�=ˇ�e���r�'
�n?�Z��yz��p��a�Zth��	��s���Z Y:������,+o]�;��]�n8�_���4�Cu%�Ƿ���.4�!k���Mjy>.�򉲠˳B���r���i��paw�tI�o�
���j�'��f���[ۓ��#��(�>�"����Hh�6v�|�48dip$_�s~Դ+��pa�<Y��[����ip��Ý�H����u�O�M���R��cS���
:���}�}o#ڽL��`�����̌�ae�����I\7����3��Ϻ�c������`=�6¡���MF������D	�,���@����d
A���A�p�Z�Z-^|�!��y�@8\Z�g&Ӡ���Ϧ��!˃U=�
�����dd����2��-嵹��H�C+	��Wqc$��*.>���A�<�ؒ�W X��/w�аø�\�=uU�	V\�ot/�P�+8`y��F*u2��P�G�e�	�5�U�e
�"m�ܮ��e�p�JacӬ��>'ƠY%\'j��E���*�Б@'��m�����`���S'H�C�ˤVR�w:�fUW��"�,.u���G	P���N�&�y;�68\�]��pt����`Y�:Iem��ޑ���$��w/gwP	�k��q�kZ��~OT������w�h�Y��y� X��3��N[(���U$�����}45����d�c�"��M�闿���_~�m��8�Aғ>����N���VX�1`"v^�/X<���]�S���c*���g��#=���$�� ���%�Ƅ���'M�F��ǟ(m��-��`������3H{�����n�֥����@a�ר�����`[(�E���~�ı�dV	�V���ǰH�
� �i��-�9{)+�e1k;��I�*9���YQ��֖9y�Y`-��p�P�8!�o B ص�Ց8����W�*�,� �k��q��~�
���,�	��,V��k/g�� s��l�-���OTݖ��{I�S��i`��}|�[h�̂�;��L1zk�I��j��;ߔ�ܪ*k�S,���k��䛢õS�:���B��\z�
��;�J�_D�-�_fK��I`�o�6I������{H.38��l�	3U�#���ħ�B�e��w�!6a�`��li��B���B/�00o����[��˭���i����-܉4Ɉ�B��>����w"N�w/������˂4i��(���/���9ݕ�8��?Q�|�L��PZGQ�Og�}V�{�K�� ��Z���b��2��޴O���>�l���8��LT������t~fN��{��L����g�Aן[���dv��rWz9�-C��̧V��	b#�?�x!�~�U�`�Jmک�}�j`fu!��j��&߼`S����S���>|ܲ/C���@��V(HJ�\d����H�Tj���:��ˊX"�N7��Ө��'�	Z?���V8��?y�=��S`5Y�f��)P=mL��� 0��[+��/��r͟��C�;�h�X�-g���Q���O��f��=�f���Pm8��Ϥ�(:?�3b�S �1KgeA�gu:�ۓ�F慙��A�g�t�i;P�e�F��	/�3�fS��F�D9� L�&#��2��;�ΣǌE9ar�Y��L��ۊ���1�C�(	@���zK��qD\��)k?6X��b��-γ�����i�js���i+=�n��:A��Yq ̦6�T:P�����x� �M�&��]�/��r��,����'<+��,0��WTBɍ}�|�y0�:��ש+�ț^��kl`*u*�R���������y�?_;���@�����@�o S�s3r�xi�v�\ $0�ڬ�Q4R���L���B4��`����qi�L�V��*t[�uo������9ԵPG����}.������ t`B���L8C��[L��{V ��QI�M+�#r��x� k���^�����p`fu�w�1�]&�is �D�;�b;�&�\ *p�RF[���O�/j	��IK{�i�J
�ۉZG.e�NNl~V@�-ѻE�+ͻ�i�Ӹc�'�|��%jlDY�J�k&�|�K [���r�k8�QK5Y=�0Z���1l� ��FY�E �\B�稥F�����o�4��  8p�ad]���z�(���+���D�VW�� � �D��)h�kl�o<��
����hXZ����w��̥wY+ ((0���z�0�S���L�W$Lj��H��lm�F�#=��T�6ӆ��~+���=P�)Q�Q�ܣ� ���X�|щE�������]^@e���,�P��~c��]]v`!�!��e1@X3��}b	%8�I��(�&N�c��^L\��2��L>�ӽ�����G�l�l&�/J�	m��}[[`�yL�T5x��$���$M������2�uWA?^����L�����&2U�����#��M\��bfѡ�{�RA[/�_K��(&�߼����+(�}X�W�DJsG��^���_C]|y`�\�q#q���q�@e|��m:
J^������bo�F%s���T�6��Ѝ�����^��T�ۂ�np��ʠ᳎W��iʑ��Od�Ļ6q�����a~*����]���i#��^�� ޵�K�[I�6*�=�.A�kC��E
�]�kB�5Y�v�J֧Y�r�ӕ�e$���Qcu��
?���o��<���@Ml3����!��O�"��Bo�9��?�,����n2/֭K�۴��hHڠML"��M�`xi�"��K�L_� ������Ud��x�%�m�R�]��'}����p�u �%��Oھ�Y���֐nw^N��QB�qKZ섴�ө���JA�F;YZ����^�h�m��^�����J�l��"��s��F
(��uK�%��h�m꒾24��HzT��@Al���qu�"֓/�
$�6v�)�F`�Ŵ]cJb��T'4B$�0@�������9~���Y<��dF�u�F����\���F/%Zt])�ezق�@<l����Ǐ��6��k�$0�~6d+��(&Y�bK4�z����\������nz���>K��4EW!�����
�6r�_{�n|�ȍ,��5����fX��Ih�]'��3�iA��6���G�ER���� ,��|��:�.M�p�� ���[Zu��r	���cjDc☴�͇�ib�TI⼫�YR��>��N�$��L��'u>��M�� �e���I�^5�2�G 2b��Ե�^u٪��2���0��89q�N(�z��O��v�`�E�:�2�ͪ���U�ǲn����<D+s#����*�������o��_��㫯V�`���{���\aO�[[(���Q�
Q�s�e�ᤫ6�uqL�.)�G��{�Σ�>g��P��R��Uygv�=�'
�AaV6��l��i��P��=$�N( ��Ggu-�.f��k��w����b&4��߱�~�V�,f>�V[�x���ua�L|�S��8ׅA�g    ~�QkԊ������  �e���@���i�A�Sb��x�IsuT��5�r�\  |�/��:�gf����^�(�C���uW�z� �v?N�@K�;O�  _�,�z��L�=h�V����:������(/�u���Ox� <���q-����Y] |�o�&t*��"�j�@O+�0;����Ϻ�8+����̫�M�jK@��E^�E��p~��t	p�7�������w��|dz�l� ���	��7���ԝ�# ��Wm�)�7ه������H��ꓥ�=(�w�p��l���Ygl�'O]& ��2�]��C���g����A�p�I��^��H�Yi ��+�zK��6�-�gVC�' 3�IJ�*�}������?~�����t+���5���.����AD\�Q7+O��1�X�[z�Ԑ��?;q
v��?��뿪%���������#wV0���h)�U�j���O�Y�0�@_S�jXS?�|0����P�V��q	�Q^5��sr�qV &L-�E4��qKr���0����Դg<�I�c��y(���� �Y$O����
0���6�m�U��. ����%�ڈ�,7bQ�����۶�`r�y���Z�ڣ�K���� L2��������g��㞮��OQ�L.u|�Q@%E�����Τ�?3)rV"`�z��JF���������_~�YQ ���}T��@}%��n\� L=P��#ֲwRzTZ����<���BJ�m{�2�C�`�����8�W�b� �:证���~��c � R��9%����{���&�Ƹ%d�����m@
62?�5�N<���9k%�^A�v3o�C��R�X��Kh�6扨N"��Yt���%�v07�?� �o�r$��*�	m��<@��U"��ئ�������?2��O?+@����s�3;��qb(���h�j)���]|xy�[�v3�KJ�/�n���"�]����0�M���َ'jY����n���{q���>)��Ϝd������z�80�r,��y����(Թ/r�Ё]͋��P���zH&k2�T���&i�dsE����yX�v�Q��a�I�v�h��6�"���"�����xj��A���$��QT��6�3?�n�H���$��������0)N����l����/�ll�Sv�S������[�F�qo2x�+�٦�zs��)ll�;�^�/fW�~�sh�Y��P����_�ݏ���߂�ZUO����01z���%���-���D箉lP��^��.����Kꌦ2�c�B]WU���Wu>H�rUޠ���0^�Xh���<�p��B(ϊv�3�ԢE^^�AO�����*5y��y�>�S[��P-փ�Z�7��A�BPH��Pt�n�փ��(J�d�t塻M,s��
D�R�Ӎ\V��!��$��FM��n*�!�k��Ȃi"(J��;�`m�x�o�2���F��FXC9�r��#W껽������J�e�: �Z]Z��dsV �+rqlk�D�L����(��
s����r�3�k�H�EYԴ�k��w/)O�@,�s����3����R, )�Nd��" ���.��׎m���iO��l��ƭ�"��ִ��J ���� �a�?�rV@�T�1f8���I�4s@VW�E#IE������;�Y�9��,�`%6��� 
,�U.YUO߹��It`YoE��פj�2�肁^���
�4Hi&u����U�;XrA	���_� u�ѻ�����:�'��� M=�$@��Z�w���yO�� ,s������)
p�*.�B�o�M�i_�z� KXsA6RC����z��*B6d ���s'�^ r̯���dEd�����S] ��ч��S���+~�W�R���7z�藿��?k�sS�����4s�.=M� ",��gߕul,H�,`�����C�[E�m�=8�9�P��Z�Jh�w�[�h�Nd�,M4��=���j/$]�h��Gn�Ζ��;f:�F[!�A�o��K@Vdh����k��v��� bX�Q7��54I\Fe����^/[���E�)L�h���谒�ĺ�x�ܮ��,���ׄ2xR�k��F���b��+�G�A���������P��1͉**�?��� I�6�5{7�@
V^�4�� �]\5�߸I�EK��c�RikP���V��� ]�C"�ɰt`�I����8&�9m��NJަX+��%AT����S�
 b	Fxݐo���w�up`��:=��w_
��B���>N�#�n�&/@�E��5��A'+O�> ��`��^����:���a+@^��\g��@ �-(@E3�����^��yAK`�)ׁ��8鰄���_�ǿ�J��?�/?��!X=��T�����TB�6�ՔыR(4=�^� �~����3�Mf���!�X�dNu��4�_bƷ�>Z��ćԆ\_����%��I¨'���C\3IBG��]d��������lʞ�����k�ߜD���x ׆_�S��c���:�M}��D{^����s������P�A7mZ�\ح�q�U��V�/�(w_��� �8�(�X�a\�Ù�?p͇�d1y��t�����w���'�����7������pq����*���&�����.��7�m&��_o��Q�ȕ�����/��L-�L)݉��V�/*uj�ĩ���UŇH�ޞ7г��en���<�/�4+�W���o?�3H~������	��~U��~��/��������eNu�p/��;���9��-���s�o�6��?]�	P���T�� �&2�z���������K����~���Bob�R��jW���:�Lj�=]�e_���ͬ(�n��3��/��!fE�I�߮�iw"mw�B�!m�!��U��H&�=�eГ�T�ꅢ�GY���l�O�,�UpgԑiЪ%h��щ9�>�[}{
�U�{�W����.���c�+(MYC�EJ���xw?��ɪ>}$��JSOg��]�|������ΠB�1g�HmWR�w���
�{�s�n�aoqUu�)��_�OԵ��,��6�B�Dg�CS������TB��U�}��խ�:kH��&�5�W��Ǻ��x��
xL��nlYVfE���D��Hw��,�S�>��ܙ�:�*( A�w�c�]�� Bt�ع��G ��]C"g/Y@�'�4~S�Yĝ	`��ل��(�C�Ls�=�&�xY8�>��*Y��R�qF�H�r���pn�����t�2w�)��
$�c|*h����j�Jg/��ɿ*w����,���A�Y���wm7�} 3{�$R����x����z� x�P�i�i#��幫
��i�%�i���V����?����U	�z����/��hCm�dq�R���D���@�D�{�I�p�pW�����*����Hz���]e <A��7]S�����l��U�ǥu�F^J,��X��S.uJ1�^�0�)}�N��3Iܴ��X�!��'��pඡ�l���I^�wE��0�%Q��/RD�h(j��ĩ���>�VE�ZM���:/����OtH��((*�N̟�,sW �K�ԡ�>
:ɗ�l�|����2�DM��W�Ki 	V��t�wA����4we��nEI�ް�a������z'�L��j�`�:[�`��xf�&L~K!�* V;Er/tEROc�����Ky {8P_e�&$]4=�~�}wW ��<˒�l�����4ӿ���̢`'^�~0�2&�`��w"9���8��25���!/�;��Ϟr`�b&cDE�D?� (X��_Ʉ���`0��%3��Nz�-/�p.���K��*�p �msq-5qm��[��L&�!�AB�cI�(�?��*b��i-#}l9�u�z)@��J֔��硫�� ��Ju|�F�,���>k��:o��i�(���Mݓi�����y�(z>+�:�AG�2��U-��I    EK�ݘ�K���i+h�,O2�Y����?�����.IG��4������~�K���Y�DV�}2�v9�yI��SXA�_ٻb���@<ޙ䉢���(�uЫ�Om}����?���8h��#r}}G�1�KOT �0u"�����{�v���p̑�%(Z�s2�Y:@��Yl}F����w7���P���!��i�L��Tm�w�t76in�[0p�ݤ�:@�l�(d�Q�?��,ʤ�˻����Ca�[�z�j�]�o��3�1��� 8��-�7�.���9��� $8&.���:6��2OX<pL$#����\~�F���"�ɥ6>�~���\.S-^^�;�|���XMd���
`~y��!6V�Dy���hM��A8ô�t����\�*7I�й��XA�\-_e`G��>Q@��z�}'nd�(�]] km�pW��Ƃ�+u���e4ج���^=?/El��&�LY���	͊DE�Cjbm.D�Z��O���e_�(Q���=Z�Υ
O�!���O
q���"0�Z6|��շ��I��is�*� UKy�X� ��##�D��ITLH�6㵗��-`����(7��G�� a�	qS�z؛�Ӹ=��� ��-�����_��Tm"�D�d�S�e�8�dM���Tl�^A[�O��-@�v�m�<Ux�,<�St. �P��@�-�( ��w�(��Ue[�!��CNi���J~H/�qB䐅�&CSD��ړ�r
��qZj=˸E}�ElAx���/�������J-�������`����&�l	�1�T$t�T�Bm~���+(��D'����������۵����@4����g��ٳΘH�4Z�W���^O��{���;5����%��8m^|�6. ����ѳ�8oI�8J;�� A\Bh#����U�s<�\�
`s�N�eqZ��$ĵ�N$�Q��o��!���R��c��)�ikY�����O<Zh��.��*�>\�&�[��,-�6��f/z��8h�6��4v=2ӏTT�h�5�(�bL	�u̮#TD�i3j�p�	\Y�^J�O���O?���o��:�3kD�o*4��Č�xE�Kl`���^����>��噂�8��1���W�rV�� �rc�[{b,��O�|Ah��Xi���gİ)�0��x"	d�ڇ�����!닫� ��U���l��T��cI2���OY���W��4��#s� �
c�\�5�EB���W����NX}���d��  Xfl�j]yF�[��~��J�V��˲^��ׂ�8�[?͚|�K/��[P��.މ�����n���0�����ʓ�s��e��0W������s�[P���0x?���@[g�0Yw��Ԑ�wZO|c��Y'\��Ѫ?�i�����F+?�!����&D=����`��!K���I�t_��1G�OT�{a��V��v���~�����G��>�HбYL6Ή:PT�:�^�l[ �, � �@�xw�^{<Q�v���o4�ٿ{�|��7d�(b��	&�L�}ق�7d�o��b�.��.ڂ�7��_C������ �ߐ��d��� Ҕ�4�p�˪A�g鯉�*Q'r������� �Y���F�N����B��ѭ��XB���V���{d�綥�
8d0;��	I�m�3��(�������5�nT��'�$`U�j t��ț֓�d�������U�����.d�!˂��~O�k���v�}�A����e��PM，Zuv���Y�.8d]�N�(1E׌˽T����<����`�Eݴcz�>Q ��P�^J��G�qp����Lu���j.}0ط�Y<3mC�F��Zz�,NTS��H�}�(�CV+|�W��G�����bOT���`�t7�]A����F~��}Q�����<�*8dU�q���A*2�k����ܻ,9�Y��~
�F#����sL�D7&.��lR��T��궺L�����#@���G2�D fS�,�������s|�#�å]�酟^6Z=��mFbiU�h5�Z� B��{Iv�����(�)��!��XcF0���(��@��4��:�? f	�F8�`bi�Di��:p�t`�m���R�?�GdVf^l���	�l� e����������`���Ӿu�+����0��Kf0Q$_T���- -8dZp�6z�eK~���@
W���ft������W��v��{����];!����D��gS�f�����=`dm�%Wi��������xm��U(x�K����i�>�����(8��w�H�R�Jt/����N�Ndm��!��t�ںfj�|��a�}T��K�tͤ�	x���VTMYt�>��N���&۩8�J�����ĸ]3x.|9u��z���`��:*�8�W-+M���e�ne��S��V= �e̔MdZe�����%�m/(0s�IJ�L�}I� �!�9�7��f"Ҹx�X/��l`�*qb��%��� sfԙm$I��;�|�^�!!��� �;�k��H��
`�I3�P���OSE����Lj�#��z�
��Z�	�/����K` L������xW���QqL�Z�t���B�$�%>@ f��d�j��}*j���G
 �ĘRs��,T���z�r/Z���i1Ia��BEe�k�-�BH�L�ٷ	��-�x �O�D��o�sL�|��|��# �����*,H�̋�ןRQ��σ����:>*\��'C/�,�|��p�+1�n������%��i�m�kk�8vh� Sˍ����
��)���lm��|�D��	1�q�S�����4X��r>�a�&"��T	끨 �3�����O�H�̘��J��A��/��}��leJv�f� ���8��ϼ��N���D	��3�7m4~�B�i�y34���.}���;Sf���*���GGMU�T�!΄��
���#wP�5l�ʋ۶���V�ɰ��H"߈*x���1��ϬU�](��!L!�3�F�R�X���fЙ�'��i5���XA-2�>\�v{w� �F�4�咷Gq�c|���[b�:�BU��-z?�,!�3��"�z���gb�"$`���6��;�#0�ܚV��)��R��B����I5*�ԭ�ڊ�������6�i[d�	��kY�y4UL��4)TU�7�
r?sh��m��ڈ�������*ܻ�����f���Gs���R�=�	�{�b3��L�166z&�%&��L���Qн
�@����Qo�5Oa�����f�Nj�J-���ј�3����J���;S�����;��oi3z� S���O����``:��Q��'� ,>v���q�|���@��3�ͩh�����1_�9 Sg��M����y�U�,m�_}�e�/ID��/�@*6��3�L�����f���Y3i�i&(<8[p;8 ����Ld��D���`�e�tsw*��������2��+^��˧���*"g�(uy�	, ��K�U@kU�z1�R�,A#=��Q���@d� ̎y)1Nv*�ʸ*xv2rl����|#��1H�#���w�����ӵ[�7�wl�$~&�TzP^�v�N*0H��!/+eM��6��}�d}f�DI�	����]��B���~y����E���u��`Ӽ],�2���on#��ώyꅯ䖶0ȭ��r�
���om�d��z��٪���������yF&�UV�V+��ԇ҅�P�=���q�ΰ�w�@X l�G�cc�*"Y��*����n	p��M��в���x�.I�o^��T� l��Q0�K�KٱPX۫@�O�����a�C��2�0���i�˧`��U�`����"�?� ���3I�ƚ��UaJ��� ��բ���e��M��Oh&]�Χc���m���Y4`놷�U&�$�'B�!��Z"�u�3����T�1~�Ȗ�)�G���5�wFF}�+����s"�    HAd���쥯n.Ξ�*gi����&���3�"���sG��`�׾�d�mW~G�ŗ
�`�ǊKFN�.��>�[�M\��j���`_�e���5P�f	z�z~\G54�
f�7.�]�(ޔ~���~z��Ӎ !������dj<`o��s�-RlI0��~�r��e��H�W�
���i��� ����w�ۃ�;]t`k�g)�W��C�l=�2A�V�y�륅��z��zz�ݼm�"}L{B�[ۼ8˺`pR�AA�gZp-�W�R�=�7��>m��2%p$`��؛�|��6j��i���Wͺ�n����.z��$UK{щ4P�ҁ�J8C��KR����� &��yZ�	�"�yQL7R��
�l��=c$�3��������CBK��	�f`[�cYU%	�J��Z�ۢ���a�'*�W��?���D���UE	8��aY��vB�K��O�a��TR�.x%|�r^�L&_ҹM"O&��ֺ!P���nQ�Ƞ���rj��=\�Y�_���=G�1�t`qFyp��7�#���3]T�`��3���y .����.iJ�;Z����j��!��ii�0�W2���Gp�i�]�*k��&������Ť!AXd�3(�灸 �W��DQ3�`}[�H������/ZU�
�Z_�g�[�>��|GH�q� �5�i�]�4 ��LM��u�L56�[/59p��c߆]�\_�Sl}�*V)h�·ߐ�P`��֜�(�5�J�����P��Ǜ�bp�3N��3z5��ܢ��I��P�y�E{l�]G"
/����O�D�K���",`��.A4����m��$�:iW���V���!(��+�p�uf��wO����?����>�5D����,�g�ѣ�u��.T�:T�cs�$z,��g��X��K͍,v��I�+Gu�i��' _KM�kCb,*�L[��G8�� ї�m�'�⃼7�u�b[~|)�$�X�����o��;'Ꚑ�5몋���3[@P����g|��7ݙV��o��FȻ�4w���	��6~9{� v���׬H$ݠy�#���U��u�LV��1�duu^s 	^fxN������N>�6�,@@���f*v-%`?���!��e^u�J���(2�'h�4��gIr�-5�˥.��?�����;�˿?������������3��� ���*\Y��Fr�/?Dċ4�%Q���G�u�� j��C��u�ӷq_@@
�{����(�]���� #&V��VOWվ��E��uu��5�}���%[ X�E��莗�7�wud@	�%�>~�i"��ʩ�3��������*KJ�V�X JLlǰk���A�i^{z���b��+��n���������`�-U�Eq!:>��ĕL�m��϶�1O����
�"����'���Ԃ��<%_@^+x��}��UU ��k�'�_6L�+Q\Fe��A����N6�k�����e��UC�ZҦ��F�����F��2��� x� /OMĸ�F�p�����_��?�=���S;oR蟩�X%r�ID*SO��%��Ԛ��->U�l_�V��@�h�?�m�6�͊k�O��d��AFW�WQ<�&��&���W�曖�D�&�/�����u�_�C����o	`»��jʄ(f��@C��{�!��'�X����Sz����!����?����:(��1@�l0� �z�6��,.@^T0'I�6t72B�R����<��f��H�$&u�X"W�X"��i���~� <��дYK<UW��pv� 73��b��#I7��w	䦳��x��z�8���ar��Y| B�����jmE���d��~@�:肂��$a5"F���+djI|��2%��Z��ƃN9��R��2�,* �V7RG���K�b���~������S� 4V��5ω��'�V�=q �:���}f{�YX  �r�|�tU2��ߝ�O���_�:7���[8� cq&pK��=��X�Ķ�m��,D��?��W���,#s_r�YN���7Oo @�b����jB���_��׿�=�_�r�v~���)� ��H�����:���k��bU�Ƀ�M�w]��j�貰L���nk�� ��F/㪍��<�� +�*z?$�	ե�:�;V�^/ VEג;"�ޓ�p��Һ�U�P_co7�)2@
�Bo����;.��A�EUӓ<�8���ȗ��`�����.ikp���0_�A�g%t��D_gN킓`Fp�X�Y�����{�y�2s�,0��%2�+��ŉ����ֈ����F�Ѓ%�㜺/1�w�W��hRLt��5	PX]����Q�~��aiu=�6�Z��70�VVO�RVeA{W��(LV����xW��ʕ�34ae�,�ʢzʜ��	`�������6e!��x��",�����x"g��ϟ��˴Iyx��N 7V�N����ɼ��{��� ;Xq�{� W��/��J�����ă	�NU����s�p$����Y���Zό �'����ȓ�� )�86 �������P���#���V����!�� &X{=k��4jn�t�r�+�eY�����c?�	2&g�D�5y�S�vr���&��4ُ
S�+ ����D��Q?|��og�M\G��LY�2о�J�G\��MŚf�4�&-�
³F��
��b�B���N^Mǣ�C� ŉ��:�]�Ku��'&�����S�.����3���q/ nVZ�ER,�U�������q�>q�ulk8SS6���F}�o�{J�ΎoeCd�"�H��%���:���x�a�5�w=|	'g��'Mɦ�� � ��2k�{�A��!� CB\0 ��7Yi��3��1?��sw2#^;Y�J^����0QEԕ;ҟ��.���p�Pf�#LR�$Q���ߟ�G
X�<�<����R=�z�"İdE-���r;�`�⛺����Z!�"o��Ѐ��_e��Vr ܉L&�U(̭�){/�"&��.IH�ݒ�l2�`Z��*�~��"�|�s@	�VF��W�Ϥ���yg�H0�R�y����T	�g�f2�`Z%��uZ������ ���<V�e�D��s��9���Js�I&��i�NU��7O�9@�Ī��Σ��	�`��đ��~�,��F����)d՗PFRJ�k�`���S�:2)]W:�F|����d�0�bYi��t���0]�č�g� t�ZY��H^G�鑗������[=�&���觐[ *0�2�ɶ��z�v�K]�}��K��[P����o~�{ &0�:>�G��Q��`��i���Y�qD�O�r�p"@SIǳ6]�_�د$ S�2�F|J⤊&)��2è��`�R�Dw�ٵ:>�%���B��d�Qk�G?�f07�#�����MyM��q^^`�l^�*�14�_���L�T,K +���"��-)�f�.��{@�'���w&?5v�``���?k�}?�c	��C#�SǩQQ��,�Ih��A�*(`oq?e�0����ث�4msUP��E���Ou8�� x�i��<7/b�Q~��4­�G�5�^`�F7�T�Z�jrp�?�o����� 1�b��������ޖ�vv���9�b�1�4�֥-����<Yr̹�O���G>*���D� 8��h��i���Ǧ��O�cn'��V�!5�!��l�B��HV $̀�����P��b3P�~:� ߫l�*ZS9	�M�|��xr&��O�H�_z�V�[v�Gs������'Z�s��[��R�QF�����Z���g�G�'\�_���6b��ϒ���?���~�rwKW�֐ʾ~�=����)-�[�V���¿���Z�r�n�l�f���p)��S}b��2�9�9��f���������[؟Bn��=S�������W5h�= �6��51h3q(+͗�_�܋�H�G�&m��a��f�D�M�IkH�j����s�h#�t��l�7��,�@���N� q�"E%�2��e�����	�	h=w�+    ����_�����ܾ���^L-�һo�Y�F	�
0k&uo���!��BUgKh9*3��7�A^��$#^F��qk�!��I��
�h����(�F�2m���q��>A��M����xd���[�4e�N�ݵu��τ4��J�O��W���ٯ\�OC�f�K]�Bs�t��$�?~t�=�sbe[��^OY�����#�@dܒN�{Mt{S�]PS��Hhs���g�L�>}E��N��Rpu���ob�:Q�Η���C�s|��M��R���[}iw�- ���|())�����ZBX����K�(����.�D�{$']X-ʣ��C[Chl������wqU��JwMU����vFtf���aZ��P��W�on	� �/3���:0��'�	�AhUVI��溔�u�����.: ���~\�2�g�o���`Mtd�I�j��Vzz��	|�2B��;ԣ~��|Scmԏ��n��881���*r�t�6�9�H���c'@��J�� �KJ��%����ztvA����h��#�) ��d�Vו�����:4�ۢHHJE}�]w�xpy�<�՘n"�_�v|z |	�w\��ƧF��'�`/��ԡQ��᳟�0�|�Z�ä�{48w>�ڹ^~KhQ��V�h:/in
1m����5r��8h���c�m%�����7�P���>�I��4���P�7��=�4dc�{��9�v��5�)��k�7QE�W��}3����y+Jr�Y�1T��{�p�Ή�ޕ��T�o̥�f �n^�Q�>Ne�wxc-�]d��onZ�y[D$���+ 8���}gKDd(��
��� ���Y����]�i�W���D��;\��w�ev�i���� ��2S� ����3���4̞.^;��Ъ�9�mCd���U��J�d�K�����6���|��ws[�q�KT��;ﹺp���J��p���3d��wj��1� } �`���_�����.΂�Jp*�l�k��!f����T��!�:�K��@��{#��mA�hmO��o3�ݽv ����K��uf�w���81[�h�!�����'� �����3F�Ok��k�&O�4�$]�1CL�w�4��g�c>G��9�����m���<��B{Rn5�Go��p�����t?�n����Ѐ��U�&�@7��0f��P�;셨!��R�1k��ȋ�(����@^e7TA�U�o�ߺ- 	x���,���$�"Y]��}�K@v�Q�����M��ܖ�q�P� 
l⣪#���_��6d���cT`�#�>��� دg_�}3Y�~o^Np��x���qL�6b#n�-�;7@��i���
Q�A_��T`[j�>���F�j��T�q�D؛'�1G��ܫ��>O�"�MϫLRV��>�`	P��<5%� ���>�$X^(b�L�D<|<� {�Tb+�%����W/ � `�cKj�N���2�
��mz�iA&_�N�n��82@v�Ii��Z]y:.@ v�Iġ��˵��;H�?ڛ��",�<��F�*s�I��n��*�{�(��/�=pl K0N��0!J�x[�^"��N\�^�B�h��~�k�����Lު�����n�@ae�zç*�b�A��r+�X`�+7����=V����4Ao\����b�p`㝮$)v��&Z!�Z����y�.;{q���#�^Â���^�8J�	�ۑiB.IvW�Cܦ�5���$2����H�A��r ���|���Y$��UG�*��U�d�R���	���u�Tռ"��"�;O\������[�5'
6�e�а��Q�H��6���y�^�r�HfO�k;`ؕ�v;��Pc�g��;�'1��@�b�%K\}��'��5w����JU��qg4l8s�5�͞ �8w����z.r�큸 !�<i�+�)���~�q<�W?V�%��:�*�ix�.L@�5�Nk��L��n@6
=����LV�|����	،�G\e'��f��^B�>�L}���yTG&է��^�*3 ?�O֝�Ŕ�*��-EwqM!�N(�O�G�ݨ����'Kq�*�%E8O��p��'�r|�
�TC��n�q�i/��fS��]LK�������k3o��)ϕ�;2���,��0�Cf<�˺e9�2�jf�6�rvt�u-������h �3��a^��qx{���]��������^��M>��3<� f:�k�����; �s�4g�R+p�s��q+! :�  Eҁ*09��2�Y�=��Lr�$�Tw�����`�dgm�r�5�]@�j�A��i��+�˟J/����C&k�u�/����E�7�E��Q#���<�|&��N˨ɆT�K?l������Ry��{8��UM��>�����CfWqASu��M�vq�8^o�$���s�XS&�
�|�6NΔ�"��WOQA�e�0��zv�]pwOJn&��u3l�i��., ���m�M@�(�oG�Q���'*��L6W�^�DvǨ�]h�� �j��Dn[�e*:jp��गN�{F>.�@
�V~u'��Tȴ�*��gyY�78dn��p�L�2C�[�,�*��s��Y� ��8=[N� <�y�YL�U��O��"���s ��H`��� S	�o����2LQL�P�M��G`@�9�6i!���Px/�!ע>��Q8d�0	���&!�S#"��� #fg�[-�+n�@\�L6���Z(�Dzi�A8�Y�s��,mґ�de�E�^5�&
�\l"9��������FUE��΍݃�� f��\�d��Vĵ
Q;P�i�-8dZ�A{�������Ż0�Ù��5;2�LjA²��U��!Ò"�/V?�(�w��� �*�Iw�u|PY.V��H���|����P������(oCn`��Kō��ȼ`mu�m[�!�7T�l�Ty/g���Їù'm���D8�������Q,�]<��y��� 4�����t"Ƀ�Q�eg@�VF�B�ϐ�M���ᐩ��Hr�Lfe�72o�+�ϭd]�;�lb/�D,.��T�߶�u�<�5..V?kq2v�� `t~jUM����"`��i o�I
ql�u��>�82q8M��o�%<'AZ�u�{$��x:>��Ǖ|NUAL�,��á���hz�4@���.2 �ˈD�T�!�Z��d}䥅D␉���Q������&q���O��
�A��?�X�F2���H�.0k�7���pX^�C%�f�]טw[(�8d:1�dQ��=�A�o��S�#���G�=e�# ��!3�i��=Q>�ǎ��*0�8���&<[>�L␙�d�Ë�~�T`"qW1-�ǯ=M�ӑ0���r��OM?S_��p�ÕD����R���� �A�*�A#�:h<��΀;2w��nq�&��<�42ix+����P�/�L؀2�쀁zEf�FmTU��|V�	`ua^@{r{b9i�:)�yDD
���aSW�Mπtd�
q�b��۵uv�"3�ЈC�(�z��o�.Z �L(�)X�-�������(�����7u���h�!ӈ�O_|T�s`�� f��|m��!����� �v�݌B�X�����#G��b:�.�K�o��]_�Rs`�� �U/�S~6�=����|�y�W ���{����R��k����@>��J0�����L4�][��;n�>6q�l⮭ںL������4�p��a�BR�][��o΁)<�L�}L�s]��dNK�9Є'O�Y�DP�Kʽ��99����rĠ���r��UR�㣛B��_P��R����΁33r��	s������sF=�9�tU�mJ���2��R�߳u�u���B�)r5����otu!eR-�!����L������Ÿ(6��rϚ3wx&�z��4x	���0Y�ī���n��ɢs��B������6*�UW�'��9�'ఞ�
��eG���L�{�dˬ�	ث�3��w��o�����	6����?�6x�c��l�ee�I~�"� V������m�    ���q- �Sif0uK*�~HPs&O�\ՏVn�OX ,9 ^��Ty�	L ����$�4t�O!�	�S��q��c�<�MS��ж�i�\������L��m�SH���;����ۮ]	�m��B�g��TAy�T�l$�lU��9��h���OF���*��id
�`���M4MT��ꢬӉ�|
h�������~ � �Bx�=v.��D}����|
P`e�^��E��� 
X�@�Pdt)���f��6� ��rw=ے�{�������^�,䳟� �XzSg���x��u/އ��| `NR���}b�g���B�u�2���>�� �
��cx����>� �YV�N��0}T��|�u�lV%I���������E;H�	(0�P`jE'���tO���Z����5*m/���sb�3�X]�)4�ji}L���������_��u'�2�i X�o���f�׫F�G ����&�vH_��z��,v�5MU�O��,؊=y8�$��'F �<��W����37��)@�[Y�G�,�2����>�Dd��X���*G�qp 3;xN�7���>[ �1zU�L�����,��?+�1�Q�P�Yy��, X���Lt/q�܁�����3QY�<�!����>&�Q=��(���>  Ki۪��[]/ ݳ��T�kѪK�A�w�^� �z�1(D�Ui�ԽK��@m�� 糐��:����­����=+��kJZ��X+��K���]P�\�Yl[�<�%6���\��$������⁸ �hA�Ҕ5Xc��o�R>�4�)�+�j��F>)���T�OI'y�tu�`���H�{�fTd��� �<���Jb�d��b	 �"���TOm�u.�(�ϗ��Y�@� �����A�g�Y4��YI���N��>^�@ �l�.�ICZ�?$�(�.��/�����W��Y����J�� ���
 �e	LۧGM���@��BA�/6�t�V��L@��f��-:� >h(pʮ��� �/m�?�V�� ۳��1?�4�^��+H�,:��/�J�Ꝋ�!;;�k)�����>Ӳ92H��j�z������!ճ�@G��qDI�J��l�;�Z�|	�Z��¬��HT�� ۳����y��EqP�H0�v����/Dh��>k��ӧ���= ��7@�8��
������KԒ.tzWV��!�q�ǩ5�kT�c����^���	����N7�J�(�
���b8��RL�Y jqE��io�@��*�nD�tA.+���z-�  X_`+*�Ԥ6����N��� ���$�to  ��BZM619�2Ta{mv��^<�,�2N�t=O�,)p9}����yXk����,+�Éz�9bS���"1�x`��`���������*��\ϙ�^HC���z���n�B�{�	(�*��@x�,.`�]H> �
�1	��/���s��'�l��Nj�E��� έ�Uy��TyL[� kQR���g��E����Z����#�x�E	g�`�@ޑ���������E�b�`k@N�A%)�$��f0؏�Q�� ]|���S� V0��[�}�,�ڼ(
,�l-���9!�r���ԫo�*�-P7����$����:���C�=	D�J�>jI [�C[�Ҏ,�K"Jnʷ۱��S5غ�p��	�2/+��Ry{�q���ދ���^>�"�8F��W"�tK�T-3wu<��U�`����r��'Tb�Q���Q�F-�2�UUR�����^��I�M�O�#�г�iR�� ��ږ_s׿�\�O��D�O�1v{9�lQ�h� �8dq�����}WAh0��|A?m��7Q����Z�'��J���w��_��1�����ޫ��lo��'�Zl��i
�������x���]��Y�1�Q�+ �	���h�^�7����>�2����Aj�hk�2���@2�.믴lj�D���8����t��MbQ��Ct�L8u���B�N�^V�@7���*�mh��n�5����P���:���X���.�ol�ןų�P��@��5`yM��a^2���{$I���pwW�-���Z��i�6�j�k�;�C�TL�.�wm���6��l��_�*�I�̯���ֈ}#��෮)/j�Q��aj)
�Y�+��0��8R���F 4�V�h+�����:�^0/9�ڭV+�a/�l�&�3k�U�~�q�F���Ff�ntT���!Б��i���rc[ ����&�enDѵ�2/^$@K>�`�L�:�:�w��)�z����Fw�2��/ &[v��
u	�f`7Jz~��`��<�3U�lpKiԯ�>�������cr�� �des"��%��b�� ���\7�]�u��tn��V�Z�����Dek��w����3Ռ1��)[�u)�;���;$e묮]f���H#���N��lm�ɝp�7bs�H���EMFv��D��� ����y�u[߸\��ݻ �5Y߉�<��_��� ��G�8��V4�J���{���ʥT��Ln��k������s�z�ƅ�N3i����{Bڒ�ώ40���y�Q����S�%��H��x�nS�`o��܂>0���z�=
)����(bU	'e#N�l#��S��!���u.����n���U�%W�ML�����~~>��ٚ�����#H�z������p=JThAIC��>�s����,:��S<`�sT��#9
�7/d <[{���Zw�e�lg뫮۹w���6K��l-Ս���$�"d�7˗�ꋲ�� �3�9���Q���i���^_��ㄼ�<�0��5z��TO����A�gfs$"���*5��	��l��w�N]��m#�r{��^ ��z�s�t+��
�t\K`6[cu����^����_������6UGT��*�H�N�3�t�X���G�UFA��Kͅ;�(WO���Λvg�TU9,�� ��\�]���
 u1��r4N�	K�9�x�4GV��u�a�����O���;��1#D`�3�m3��;��裶]�9�����Pr<:���C]�ڷ����y:�(��0=/�z�.�
j�yY�\�����WZ�m��7&��&>�����l����6KEU�kۉn�L 5[�t�̖(,U�g��ꉗ�	P��渒�uYГ,��
���	�fk��RmFj/Q�
��K� B3ؤ˜�K�5����&�A�]�ٺ�����0����!�qh+���F}	�8T=tRO��ot�1��D��TA��|L��L�܎��o��餰EYW���O�5�IY���2�UVZZZ�#����A���V6�"����K���HPMV�rSRm�y����[��C��=R�7�E Ƙ�.�m�M�d�ղ�a|����C|'iJu����'���(7�-�ѓ�3��z��.�=	�����L��'è%P�'�9�V�P����n�=O��l>U�K������<a�s���v��>�Н'Lw�� i�B$���9��q�0Ǚ�N>�È��%�'Lp��HEOS��%�D7GA/�8O��,�J�β��p D��.+[K�7O���B]��L%��M��o�sډ�zG��[�y2�:$b���k~�m�#�  L.4U&�z�w��,0��(�Bdꭓѝ��~�'��4|z�K�16 �[8}d�?���?����1�뇘q�����/؉ެ�bǉ*��G!"Uy�E�ul��������B�'<%�M�����p��ϲ�Xk��C\'@�U.~p���z�Ŷ��N8Z�������8�%t��7�&mR�k���o�
�:!iJ�d��Q�����׻����%�t�D���$�M��w�	\��p�oSzD�%s�=�Jn��#��p��WU,��Z!#uݺ���,>��g5I��ޔ7b���C��{L%:"����8�osȽ|�1��V�[�߻5;�2/�`�H|K�I&^dFa�_?_�a��l�^TZUB$���    qA���������� O��,��������;�},Z�	b=?�4��\@��ۋ�B�ʵȵ,ѴM�!K�����e�'�.�g���kS�֐������F	�U�٘�$����,6��	�����v�ݚ��Q�Ve�~(��*X�j� &V��P�Л*w�KY9 ��1��F������� �O1�W}:��[��������@{/�UY�l?
^��Ѐ��v"kMh,7}䇻<�ZC�:W���@e�$P�͕���s{��� �[�eݥ�ܨE��`j[2o��$q���x�ف����F���,t#��#��X�鴣W�-�e�eo^<} ,��$�J�M�ks����TR���m��{�W�&a�Is<M��% k1mĎ��ȮMUs4�ɝ-ng'	�1���n�B�E&r/E�
P�u�NoaC&M!N��(+��i�B缶�� ��+9�0+@�i�^~�J0����`�RM����;��v�w�+�
�g���OSD~�+�
��$��z�[u��Sn� X��� ��(o�d;~1�X`i�\����ku�Ԕ�2����E�h�4�"ؗ�G0vh ��Dȩ�m�m:ڦ�>�ѭX��FX���&�5� �3��J�?���<  K3�}��|0IB�T�k �h����4�{IͳG;��0����nP��|��ۭ�� X�)mSuW%EJ���2�LS�F���fݍ=k^0�BS�eTҕGq4ެ�5~����?��<b*h`�&�G��U���*�m����
@+5	��v%�8����k]=<�NS!�K�������/��?��r6������~|��>*��aOh^nw��o�u��\JUd�FW�Y?���麪��w~i�d7w��c'�T���"�l
?����`J��j�� ���ş��OY�&QՏ�T�l>�/��~�[H����]s����S&o�!�����,�W��U����?���`[Y�T=rz�kE��|��Z��q3ER��Nڬ�w:�BEݗ��T�o�g�c��ӎ`u�v���!'�J"��,��� M��#��^Z�&���2Ҍ�?�l~�|w��oBf�����*q&?�����c�x������)>�[�"j��.T�FM���ExA��g�s�a�6� ���'�oO��H����A&	W�4�[��o@����׸Rhm�?��ᱟ�@��EmX�;ch���{�韁T���n��zZ�h�_��	$�ɹ�p[��@����_�1���V���ܔ��� �	^dhbu�
�K,O��wA��k	z.�*#�%��|��+Ibb�E:�N�=��Ͳ!�J��G@3��No�~��o������_~�������o?������~��?����<T.�@��������s��Oy�i�_�B�~,<��[�iY_/�I�'S����:�ɕ�(���ۗ��r
�ڵ����&^f���k
9e���P��^U������Ʉ��ۘ�{����oa
�N�q�輽�o����!��	���T����C�5��y!�L/�DtL��_����}H,<I6�]Y���"���UZ��5���ϛ���� ��./0����Ub�cf�ˀ��<[@��f�;x�E�U��,dɤ�p#7_�� yX��t���@�����_�.6f�v�Ｕ�_)f�AfV\Z}����G�^fm�l� 仾���?	�cf�ߴƬ��em�/_=��g�5f���x�4`�_�e�/��0xh�!�r(`��)��6���S���wU_��􋪶~�������Pֈ���C+�"�M$o֥�sH<����o�?��Ͽ��7U>���;٣g���o��_��S���T���_�����އ�y�!}�@�tz��+I���1H�t���Ҡi�k?�����'^�vk�:���sGx֓O�o�J��y�����m#�R����� ������ ��"[Ad|h�!�Ii݊j��y5���V�5���1�m������e�a񌹎���:���71��-B��	�RSD�q�ω��PUxk���N ��G�7�otu�u�5�t��-����+�eNE�f y��wf�&jU�#qa7��MSw�@��]F-v�l�,\a/�}�����e�����H�썤�oq�$�k�d��Υ�G���4�twֳ�;)�UT�v�SE&Z�����z)oh���b��<,�J"��S�%*�`5Gq� �0a�R~�#p�aT����}.��V����5p��>��J�JŎdd�[����'��?�%�P���Pw92L>2G>@�
���"��EF�����h�q4��m�F��4��U"��Yz4�;f�����`�Β���uF�[�Z&L읁DT���ez��t�
����[Z)!I����D]_���q� x���o�"��z�}
+���ł�&,�mc>[��u��R�l�Ne3�=���j�E�}S'�5�q^7 �|�*��TP��lڃ�vyy� �$�ߔ�s�p���@2&4��%�Ϗ������i@���u6~h���ܦ	-�ɓƫ�7n(��^~����׊�W�5`��I�R�-m�h�Ǹ��W�Wt:FI+k�
2���J��He7h��@`�<���Uq�f�����jcS�;��3�Q4�$[�phVII}�8�qd 	3�%�b�n��,�y9������Y�^�$�Ѻ��S�ʸ3m$�`���I��>aR��C]?*��P�p��F�鬺
�av1���������[?�@%�*�g��H��h{lJ�� fg�0���ٌ?\Z?b\n'�7�ƙ>���' �fi%ru�h��?�`}<k���ŕ��T�~��z� %�>�WwF+��wRTפ�ր&���G��x���	���3z��m%�k�n�+��>yf5���}�K���󡹕*�v#���y���Ͽ��@�|_��'/��u2�>՚�_�Z�{��M� �]"%L�*Ӂ���h��
\/N�,x���`^03ڤ�%7�~^�%6@�����vl�.�d��t��T,NP��4�$���~e���b���~W���Ǜ	y���m>� h,f�O�TX��T�x�v�v[�L -'�(bZ.9IPy�B�' +͝hr��뉽���z��K�7�0M�����{ 4 �O)h������{�y<,N���(����' �'�D�2:�,�'�	K^v%ںM�g?���rr^����U�q,O P��3i�ցJ�9}�[yg���u
X����JFI٨�~�A�̮��`y���64��Y����Uk&Dzw�P���a�Р��qE:Ϫ�~ؙh�w��
X��`�U�.��x&I�����cy�^���	��`,y�-��P�G;�XY����S�اh�
�6����Vm��rQލ�����Xf�+8��z��NGV|�Pw� ��"�7��n߽��ʊ����
�y��%��@d����b�2�Qu� *V'��ʢ����ЈU��ae����'uy[�RqEn�qt 	++�Z���.�F}�E���F�X����nh2�m�z=�X�miK�Ù�bbo���d���'��Դ(�e$_�>c��5��f2�I�)6�X���(�SV[o���9`���m�Z傄�h$d�����3�V&C=[3W�*���4 ݁��c���0�fZ��;���� d�Q���v�z�����zp�^��Rh@�@��no�s ����Z��L2[R빅���a�t�3�,!<��M����ȧ���N��ŴBN:$��G���NpQK���m*�� 0��'ۛ�/X$�&�J~��2;�_elb�ޞ��9Τ���5��CfaS�)��RAqj�2� vhUf�m��woh�߿������\��2�.�t�!Z�m�'�p������d"�D{]��q| �{��O�NGn��:d�uC�0AR6�*�[d���E��/��8�\�v�PY��=l����	�Eyw��+p�C�b�"�Y����1}�1�:��    -�X���6-v����q�@��~-_*�jns�����7�`ns��Cf_����FT��B�P�?�@���u:'��n�o��N���N��nS��Y��%��:2 ���>,�Hq�[���0 ��i�P�R��<�!C;d��F/�M��qQ�w6���y��2?�ϐ$�,����6�)�0H �K�6�C�0�	�o"Q��i/��~'�{�T�Q�0{;��;�XV�����L;g��0{[��\�h��YP L�֚�1�A�� �����Yd�V	D��k���끳� =,K[�=�s4���O�bz�4'��+k��qÔ��z0N l�Sd��1�2��'6�k��pz������]��@�}��lt���Y��L�V�K����Z��k >R�C&n��H*�j�%�1��`��hjԔ�G�`�d�̽U��\%��KB"w�Dn�gk��^����R0���I��*�Yp[� �;d*7�w�eT��|&��!�'
�aeՋ�,d[i���&.�5���o�L�pv��A��mPwr+�T-�Rf�Ѻ@gal��aC]3���΂�`>�V��#��E����,�ɽOK��N�r����x`����>e�iU����Wre_�e����`�v�J:��&u���g�>0Q�����EȥO�+ɼ|��+P^y��C�=����X�U�SY��/�"xK|��P0Q�${^�Z�?��Q|��Qtz<5�^�,�Y���?�	�6� �;d��)���:�une���^N��Iۆ[v��:�%R�Xb��q%=^,TT�s+���������/�������,.�%H�|�����ȓǳ K��]����Ϯ�#��Ϣ8a������qN0�Y��à1�.�J$m#�#�D�xb���3�D�[�B�B%���x�	��Y݇v/��M�x]K�Hetm=d�d�pq�'E���<�T��g1���0S���,�-/�L�Za�����,.�{QY*픰y������	�!���VP��,��/8��&p�!7GUO?�Q#���k�䛪�#���0O	1.��֝���Sn��~O���Ǔf5����T��lc.�~B]A��H�mH��z�m�����)�U��{/��2f��c6��{����˪��f�O��G�O
7�^�~O��'�w����MdmG��H���{7J9���	x���(U������f6,�<*^��-�
;��v{��Uh �7Z���hWY��d��^�	*:@kݣ%�E%���{ * ^�ĳnb�m:�F�YT�!�Y�W�A'�;��� /����B+j��Et���m�3 ��ע]#��x,{�p��G+��o"Q7��V��Π�q� �D�KtO<۪,G'Y�"#� �Қw��,�������bb/6rC]u��cS Ϣİ��ETuAW������z���N�ZU�4��f����Gi�@�Ko^������V��(��YR�^�v������{G5o��x��;�����m
����۝��?I��1"��^���u|� �,�oq��Yh��sD4��eь�׉��e~?��U�B�z�'_�5�/��o����=_�t|X 
S;�-��,�����ҹ�Ё�E��y�����x�ѸNDP>k5���ga&�j���6R�}w}D�Mn����e�L~!�jd�.�\�P0�h�'���[� �MPs�����v��|]� �گ�30J�*��Ox 3��e�,\�C��
���A��˂��������@�eLw@風cR����S� @�]�}If�k�> oFoz4L���,��`x�a�ɋ�����-x���I�(*.k�1�"K ��N�`�s�nϙ�6�Z4�h�%��2�P����D���(�.O����,@���4m!b�����x�g�>��衾Et�J���E�~ڕ��4��+O�%�L����U���#+�% �yr�A���I�{	 ��<��M��'�#�������ўR"��T�R����;�mv���z���,�6~�d�-O�I�U~n��Uh���I��#��E��K���њ�jU��e,�M�+@��E�H�T���<� ��v
J%}_��c�V��H��f�_�ltiʳ� +x�3��F$�(�J��}#Ŵ�ajXÞ�U
-a��>�5@��B�B������r���&"�:�\�X�{Q\�z0���x��~9���.��jt0�<7x#�C�b�j��`'�L�ʸ��5Z�*D��. 6�v��ʊ�;���jq^/7�5`��đB�M�n�k�QX��O/��1��k@��1{�[9����\U��� ؑg��Q���^��P�B�ܿ���r�^y�9|�Q:�h�  ؓgC[}�t)k�퀝��ܿ���IE�r+_|$��	��y�*�G��Q=|���f<[��}26�u�C�Ӱ+|X��!ԓ��#]��H�㹤�Ep��<��Pw����5��	ae�z�x��<nN�nB�=q��}��C��u��g� +ZxGd���|����� 1أ'�����ia��=����(~�w:��c�X[&D$�1
.����=��"A��N��꿩�C��7�0�`o��`H�$9V�Ƅ�,t�AOTn{w��0�`{���k�����g�*Z��,�7|�0Y�mW�
PW�v{G����1�`{��)�is�#�$� x�3��*D�N�M>�w��~<�z|T� C��R�N /؉'"�����Ϟ�f��4��J
�Q�����e���?�9yB�gZ�����imy��Op���t	Q����ݯ�0��8p�p��ң7�ʀV9���*�:�T�܅���v��^�!l�@���<z��n����Ŧ����֙����։�llkk��/�mdgDN/M���֞Ǹk^�4<@���C��]�u���fm�y̤���OIe9��"<�bЃ��3dt&H��#���`��@���䙟��ql��)Z{�|FH��7����^n1���S|kk�s��2�ۺ�d�e( ,kkҳ�s�{��n�~�q��Z�Y;r/�	��:�$�̼�[��5�ِJ�?���ֆ�C�f��~��!���Nd�*�۬��5Q�⺹�q�L!�3���^e��.���X��~��Ȭ���5prJy	�B�;����;5傣�E�?�Fm�w�¬���:QW�����2	�Lm�w�)���8�;�zҩ�x9D��Q�	y���W�	o��]����;i"�NW�"U_��x�ւGK`��0b[{���;<[Q�h�}�A��d/6�Qj�;�{����u3���R��;�����m�c%�@�_7B!S[}�wV�;'�QϿ�[�şX�O����b1ե��~�z"���9�-�������	�w�lRG�dkxLVV]�a� �9��d4QcX�ш.��S��S:�5���|���o���,��	6��T�iǹ/�����G��N!�Q:׬�˟��H��8��VH�:.��4&���I�{���i���}� /Xͷ�&�=��� ;p#a#vZՠ.Z�hE��΃z�����5�W��Td� ?����z!U�Pm�F�t��a_�A�
|u'm*�w�A|=%,!%����2o�oƕ����.�[yL�R�zeB�f�������$�2��_ރ��O?���ǯ�I�./���R�����ׁ|	��j��m��E�/�
���E��Gݧ�k_��1��~�%Q<����d������r����*�o�����P}�!5�}O�R� ��7�W���&6�&������������矂����l�~���?}�� !��MfQ�]�)�_�Hӧ�S5B��iI6i�`!�:� 'L��ն���� �$ր��Do*W������@6`)'�t\��Mx8�X�I���@����~T�y���������֐Xb)"і3%�/�d��{M+�j��~��!�Q��G凪B^6��S�w��Cߡ{�����*{�NRR�m���'��Ưt�N-��W=���jz��	����D O	  �ts��Ou����
��صE{Ӹ���-!��Ggz܌�w�6^�v#=���Y�X����!���:A�VUC��ѩ�׃ho��z�&=��Dfe��F�R%�Qd����۶�'����mq�o������W2�i3ygO��[6y0����3"�yb��H`U#)WCP�vs���k d-2��E��H|�p��i���
�$�^B<�]jsF¨����� a�VTϷ�]�
����=UaYQ����#��$L��q��������$�'�#�=֭�SH8oP�z�z� ��Jy?�Lp{K/�u� ~���@\���ڔ�I�ִYr���y ��{�f���85#ҡ�S�9@��re��Mg��Q�J9Y\ם����]<񨤺������&�ĕ���Lv%@	� ��h���p6ǬVB����Cơ���KX���%�V�$�5�m?Ot��=ʤ��Ե[U�F�|!vP���}�qu� %��d��m���ձh���>w�fO>A�t��U�?jn�6&�T��:�Z�s�04��%�J��z`q}����� %�S[��t���* n��\�DM�%��5/�`���!Քs�T�W���` �ߧU\¬,�m桒
6�p<��MX _d����ւ%��q[3�]x ,�O7D���4��?�)` K�ӥ�0^�^�
@���V��M$E� ��x;�p`6�rH+>��c�	�U�[ykI�]�����[��4�讥��� X
���Q���;�Fw�0�
~'�ћ���YS����UL��D���0X�^�eFH�#68��?~�f���{wC��q� 
sk�E"	�V������� X���Vh�6Jb{���88��7��t=�7eo�}�3�ֽO��7+9>���=}(w��0�� ����P���'���E
�Z��N�WjB�=e�N�-N��w�y` ,�G	��ɺ��+t�u L�?���V��ƈ/�����7b���;;�9���*�u�fIf�݂܅����}V�Az��h9~��,|���h�ez<9�	�o��d�'�(�Ё�eꤊ{ *@��U1�j-F�%"H�,g�y�'~��o��A�g9�(��z��r��| &�����@"/���=K֫�qvr�ڗ�^��|����]�1�	w�A�_�-�c*͢��� �/q��%�a+��4�:��u�;M0��w�8�����X*�o��.�����=K�g-)�JU�%��U�b/�B$��$� X^8�4�@>	�m�w��b���>Hur��S\ �d����-���^s�@� ˋ^�����ƫ�����w�"`�Z��N�v?��Gp�u����6@�Q�g�c	�
�7UG����������Tى��ʃ�/u	����b�ˊ��'��J��X]�Kj}�{MI��%@��6�Y��䦍n�^��2�,�x��Kq�2�~>	 �/���/ڥ#�K/r�X[D�d}-zKӛ��n���08Id�K��S;>7@������"���@���*�����=� a��$��D+{��.�+�֨���Aݵ�)�#��
Pa�pC� ���`��� QJEf������jQ�����K��x�R\<�(��T�W��=�񦌹��L`Yz����� hm�!dYzz����Y]i"�oĦT�]f��p'�	&z�ߏ;�c.��J��eA��Z�J!FvG����7��NPaxq�&�O�h\��;7��c���W���{�D��(O�a��u��rP��a-!,�P�6$D(�]�.�՛�ыh��V�	1�Dl�F/I����9N'k�oe�#r��<������p]��'wz)�3�j֛J�*�y:�)�b��l�`/������V�����M��z���eq+ �%M��Hŉ�=H +]��N+�Atig�;�2:��Ū�k����XI{u�������� [���E�#��xS}fK�q� 3̰���~Y�:��(c	ց���.��Q(�~���dmu���kluy(o�\�!���~S�N�rڹ�l�_�"~�*0�+�����m"��#da�uC_/���6x���^���)�0��T9Z���^��� M�q]�K���e�
q�<�8D fZ'�3M���m/�����Uda���*.}|j���)�L�s���*in�����7[I�=U��}{�"�u����:����c}&�3�k8P�^�EH�Hh��ݨo�a��a�X�.Q�{+�1�Zr�� �S�io�؈�Z&tZx� -���"�4&y��!��3�ψ�)��Cfg���U�r�O��C�����_�����=      >   �  x��[�r�H�&O�e�*Iq��YX��
Ц��7D�2�K�B()�i�,~��g3H��`�I%����g�����cg`I�M��!
��Q {8�C<�էGw�.�2[$k�*+���ge��迨��h�gU���b�m+鿀���TK�_��MR%��3�����O@#����==w��]���0]g���mew�[$UV�gt���1 
��tu��i�F1
�geQ��*�_�Io4JW�<�?=��:�d�תP�*����8�<���y��-W��~W�%8�X��f��+!wt&]��q���=l���̷_+Z}8�}�.�(v�� G��.��-[����Aה78͟o�|�{�!�+�(� F��=.���We"�D�*d�CZf��"K�E*p�bZ��5&7(�zx���G���X�h�
�'7[B�W4y8pQ���ey��2Z��e"b�����E ���INo��M�\��)��3��J;���DB�E���A�P�u?=���"`)��L���i�3W{&sE�8L�.�0��._&�4���V.n[�9;M�Z�@���P��Q�H�\eU�;ͷwٽH�r��5'=�R�`~� W�S�4A�d��#y�����b����Qv{��` ��W�z�[�D�n��2O��v2��<�m$CL�1���qn�!NAM����ez���*�y�y���!p��(�*��=l�tsV�q���u���a��,�,U:m���XI���Ö&��ʱ�C���P�]�K?�QqY,����q�?�0��a�t��1,bX� Bh_}i.>�c�Y�ʪ��(�f+!�2�e�)��`<q$���|�ζw28']�p������<�ÙI������Y� '�R�*��mu�l0t�l!8�]@i�r� �,ttd�;R�N h��S���W�+�
;���c��7���n8�2=���<-W$���V0MX����<{�v!?���h,�l�S���*�6�����n �^��� �˓UJ)�s~H�[���RK�`*^7������-S�O���ե0�n{��Ec/g(��ۦ��t����w��`��-@8�ڥ����Ͼ�L ��se���޵���`�G�Ρ�[��2�/5V�즐�y<�A�L�bk�`��B��U������n�(�aՓ!Z�����'�bEq�A���B���$��F�2�zh�mY�xj�!E�v%�V{[�����h��)En����	e�!�G `4�U��Ù�]Ix�X%b��@nC���z�A�V �n��z<8+^�8��/�J̢�1���12?�Y��B!�/�Yq,�'Q�g�>n�A
ܼ�S�+_g�ZATƦ[��BLz�Z�� �~��DDr�4�.%��0P�h�ᑇ�P[�����HNz�/2�o��F�*�����*9�8vlh�i�BL�ކ���;A4�_�_���v+��&W��,�������I8��QDJ��-��VR����@//�n5�+4�e�#H�f�_��[1ap�3� ��b�Á�\��|��"5-�R�<Jb���:�L�-4ޔ���D�˺ΥZm���A7V���i� q�(+!�����o� ��8��r��OB�֫\�#A�������r�и�aڭ�5;s��田y)W���V��v-�8���
*��6[�
��_/a�t�e:ܨ	�+7�^75�u�"�G�����5hu=����������\�p0��C��wy��L~�ϝ'�L��y���x�B����tc�b����6��>,�]��0�mdN��"�e�އ���]	��R�+���
�I�fp�@�F8�7���D�ev�י�ƗΑ�.� ���s(�D8L���@q)����t�zh�N6_��W�cܣ;\�V�ZS�j��z��cL0"L�iR.��-��"��lïd!�&˵��禺Iʠu�k��[^4ĈLy�;A^?P�"CB�OT�h"���y�ЪL�>Y�v:���*Bw������J��-�i�+�. s��i�a�O��h6�����!2����Ԝ?8;��f��R��C�Z�ƕ�5Ωh|v�s,�-�T��.�;�p5�T|8J?�QLV���"�"�����Q���,��2K�o�rGԑ�3�����=�С9��t7E��HD��!Ow:㬓���	��*ڀ��=�8}��C�^�f�g:�^��B��q�<v�}@�za꧋�$�-��){��B���`p�}y�
<�ƛ��K[0߾�e��p�jmض��4� ����@e%#���3��A�D��;R X��~�2�S�����DC}����x��v���4�̯�s����y��>�96�>�����cx2����8��?P��}���+���v��n>(2,�%b���C+���y^P���u�꩷�~���m*�7m�'�<�M�-��c�5O ëJv�'��_��gG�(��c�W������c�z-�Q���<�d�//;Z޷.�G;�K����D��t�kwRk�L�R]l_V�1k�o��ytZڋ[�7-aj}<P�N��ܟ��Rό�9�����c�e\f�+{���ܻsz��ld]b�T�����3O���@��{�?������VzO	k�1�z���`X��N�^jE<�m�[��ь���rG�U�ab<6���(���L�W�竢,w�u!h�%��/r�zS$�y����_:ԩ�+��'���r>2��?�Upb�^m�߳�Z%�Gis�+��R<c"3>�n�Y�V������Xn�6�Su�֋I��=�^�������L)�� ��I&_�4��UՈB ~������D������ɺ��$G�mZ=|b��O���̀�ѓ~��"��d��Y�����'��!����������$���OqC��L�oH�E����f"	��tL8X8����<���X�{߈���W���bw��o�)�Nk�B�a*��ֱ��Y�?=o��^4P�48L/�!�)�+Yf�|���U3D�뀯ZO<� (��p���G#O��o��k�ˋ� �i��"Ѩq��GA>�J�j�H�.��yiR�bX��\�3��z6&#C�ؗɳ���AK5B�I_Hc���0�������U.�x�zL���]b]��B����!�~�6Ge����O��L�����"�+r.�ʢ�X�o�Oc�` � �d�!�A�T/�l��ͣ���l�x�QKj][����I��/>|�?��n      @   =   x�32�I����Vp�I�.)��4202�54�50V0��26�26��!CNC ������ ��      B   O   x�}���0��3�)��!���s���=�2����֣�������	�.�Pa:x����!�)� K������2�      D   Z   x�Eʱ� D���
2`�@�f��#X�@���K�����'���x�Z�RA�5/�I0,{ؚ�Y1���0n��oL�[�=����Qt      F      x������ � �      S   W   x�E�1� D�cvW���d!�(�?ba��7��	q x�c�f:��^�fhJ�;F���h���˔"�+O)a�O�5��c��?r�]      U      x������ � �      H   "   x�3�tL����� .S΀���L�@� ��	Q      J      x���I���ֶ=>�<�C��L	��(���h%ы_�&�l��F���p��;j�k'�y��łE�����~��W���_����W�����WW���]<?�௿�%������{�]C8�����=�a��ª�â�Q��X�"
곪��`���(�'B� �����O���{����b���\c?��v�K����s�'��x(���Z�Vk�9I
���Ŗbb0�;&�APS��3�Ⱦd����²9ǀt�0�B��>�Jm��9���+�K�ߊ�@T�,���9g� �l����11ER�2��+)�!nC��C2��(�:��q�wĚl�ܑ��ϻ��`�e��@��� �$�����1�`;�r�]�H@�[�t�$[��ܓW�D��3!�'XC��k
��K.��b(1g��(�R�7�I^w�Tnw[I�fJ˛����ܛ�`}�e�*q`쟉
yќ�?X�Ô{��ߴ�b��7A��wP`�pt�K������K/���F��؈?�F���~������>f^��E�ڽ�5��D�Y��=ۙR�|�y�F'*�٧�	����Y�	E	g�L���� oL���+��)�E�i'�D)�
m����r;�5�Ê�w����J���]��e�e"�L�(gL�\has��+�v8��l�G�2[q8�]`���<���_��U�v��?`!(��~��:��W9_�13�5NdJZ����	�k!���=E�zx����k�լ/���r ��%�1���OK@��0?P��f	&�ԍ6V���W-�:�y��\��g��U2dLH�"[�*[,AҙP�x*�2�@��L|�D9��)����x52.�W\;<�kh��f�r(���eL��� �H/9lh@-b
p��I�s��G��c?��]���{�Jݱ�Ƌ�)��1�\~p^'#y����a\z~]�H�q8N��s��9����zSΠ*���cۤ�@���[]�_������Po��,�C%�Ħ?��9��- ��FE K�N�~)�P�����^ħ��v����&�4I#��Qw6XG�i\�t����K@��|��"�o?�Ǹ�NG�ru�N�"�!��"�&�*�CH��Q��@?��y���vxF��:?�K5�)�?��/&/���o����/`q0r�K��_A�x �X�3��X��iL�*���s,bW�n��	N%ڕ�"?�������+Qq�	<��l��5 ��	�i���}bp0&֛r�/��b[��?���tM4>'�t7��J�
2&�5��h�u���?Pt Bef���@�&�]9��j���v�i�������E�mH8J��q��$��E�'���18���m�ǸO���r�]=����ϡu	O�
��{�:���u�{���!m�o��Ŷ�`�˘ ��1
��$~`���M9O8ux�Q���� �n�GX�K)B�)b}�|6v��i�����8R� ����ZP�+B&P��3(���M<ݏ��ڤ^'#�V�/��]j����҈7��ƞv�P�˘ LV��X(z\(��9���AIB%h�k���Yq/�t�h��rH�3�����;ѯ�Ն�4��- ��	 �"??f<������zWΠ(�����2�&�C�!DXO��b�;|�r\�]���6ɢҨ0\vF�eL �03�D3������~���<��Vcԫ��g�7��⣰~������l|z�[��a|��9T ������IN��UΝ�G�劋���+M�hc4�>m�5)��SYy�m���S�U��2��DXdvR�E"Sc�����V~.
\9���)�o+��n�~���/+�wg#.1�״����
2ptGB%P�[(�s�~)��:���������I8�jHN��-U������ê���&L�?PlGA�F|.��xކ?��l�]9��\ת
�占�����+q�{s�}�J嵭d��~PWv�6avH��e��?G�
%~���_���9'pn���i�N�soJx�K"�1��̥N��[�D��a�8
���s��	5nU�_ʹ�}�q�i�`7����9*-9n�����z�J
q��[zv�ڃ%[�Q�P�ٹ��V(6��~{.���d=��"ꈭ�T�}����+;�}Ȳ��jw�E�I�
lGB%��}�'>��ޕ3(����vG�Z
C顮�ꥆ+:���M[�����[�9l�
u�=;��[�Q�40��A�`I'�P�*gP
0�%қ��'�1������i���^Bo��E>�-�iI|AF��K���Q�O(lzT���A�*%c����x`�ްNC�o���w����?�A��2|	4�F6_lGA!���(ļ&��]9�:�lA���	��ty�{^���>��k����Glnύ���	FH�z`�8

�{?��~�g@�s�]9�?0}������9�۝&P�S��
u·����Y��~iԻ��F�eM8���c���	��v�:QΠ���dU��E���t�.��{�yk��W��젛�*c%�g<~�2�����wP �ܒ�+gPW��2���'"�IM�K�Quk��L�?����ݱ���!C�&ا�er$
�A�M
A��ǻr�z�c>*��;�@�t9�C�&�MLF�j
ޫ�)��T�|�B�� ��� p���Ǐ��~ �x{�&�^�~sz0���$�^y}���R�J���/qp4
I"�ȧ�EAa(��?~(�_�y���&M��"pw՝��=��}[�Q!zA��J1�����PzU�n�t�F�`h�Eǰo���&a��rKk��x�]*����Kh��ʙ��9������aC��v}rj�j�jGAP,����'����D9��B�fn�L;��=���{q�fE��0C���H���`�/~��1�|
_�Q�PY��) E����ԛre����\>�Q��(�<z�p�����l�n�vo6�y���CG!��}
_�Q��A�o�tR=3QΠ^�C����c�f�DӃ՜��l�\<�'�����'�q�dp��"�b�����#���/�ꄷ�M�Pν�9�r�p����~��X�=:���Yr�M�+㒾��C�&���B�`UǧP�o��e��U#����d�`UY7�Zy��&	3�/����W�ձd�N�A���8
*�|7���	�K97���ׇM�'�! ז&V�����oƥ�B��_����C����A jGB�Q�C�\��$����������m]�Y�Tk�C�4�#��2-s�΁|�^m���������Y#�(|�~(�eޡޔ�%�T�ɏW��!�@f�"1��~H���8�X!�.�踿5Z~�%Q?B-�(�D0���|�OM��3���H�51ܤ��M�����VM7#���9c����Q�M�Uu�|�eg�o��Qg�P�*gPk��#��$�7�/J���3�H_ԡ���lq(+[p�cFa�9����q T�v���~�Կ�T~+�q�ZU�"�l-���p�b��W�Ny5.1��s����ߛG��P�8
��0�s���¦����V��`�@������tqͭ���O�r��(��d�{����z���	@-�(@�EEO�T&��H�:wdCf�F�]��&j^ԃ{akv�[��;a�n�e/��uA�H,�(@��,����>����S��*�7O)"s{�Wzو���N0W�.�%���eK����C�K8n��8
*�(|r�=Q��y�
���&�	?N��,�v��}�"y��{[�,��vǟeΡ��~�\�Q0����1�� �@�	�/�j�>�����f���ǕzI���U���QG2�L��66�殂}�\�Q0,F���+�/{�(gP�y��j1��;�C!����[�N
�jD���!�V�GʉG�U�@-�(�i�;(����V�͇��mE�#R����SkR�ؠ�\�M��Q��ғ�4�5q(�@�H.�(H�#���N���`�z�~�<���$t��
9'���㓦Y+�p�ٞ�r$p5��6}�%��-��� �b8�Aa�dI�(gP��5    N�}�:��`T�ӋZB��H#{Id���\5N\�]]`�W���DrG1�����NN��&�y���è���g9,'��n܁�'�ֈ���ћ@�QƂ���q$�sA�P�xA ���95QΠH!��+R��C��1l�\��Þ{��:�����"\O$� jGAb��R�ϱ�$�oK�D9�Ȇ��4=��mo��k�y��0�՛f���3�N��ҕ�*�	ٖ�q�W��>�"�d�d&��M�3(��p�^�B����z6�jZ<��4����,�./6<���Z�Q�PY��j����&��滊R���g<�,��,B(:��N�vQJƅ����z������S�8�1T����'u�|�ޤ���b�6��lu��S���).w)&"�� I�q ��0
���'��4�֮�Z����$D�yb%��}h�o���Ex=�F(Ҍ�<Yzh���(�Uu��OJwP��+��Ų7g>Q�]uM-�lH;Ƈ�F�?��+����r�`�/��O�����݈Em�\6H�?k�m���5}����T��p�
S�8b�~��_P [ �	�/��X!����c+���<f1)5��y�y�з��z�D����&��R jgC"$�23(�z���]9OV��C��^�77�̬H\R�Ч3#�7'�C�꒸%q��d1fT jgC"B�Gj�"~���r�`ݍ@�v��N�_zE��Iz"
�ʿ��n	�x�ފ�J��`���q6$p�����j�S�S���S��o�����{�rhh-�uWݺ�@g�q�_r�ɤ�U��z�Z��0ɐ�P�x����z�zWΠ��pT6�C�+nP
�W�����0�U�m��ɻ����tv(nB Y��q6F���;(�P��M�3(me������������ �L�3j�t�Mf=�gO�ɮ�ӭGjg��ߌ�/��Hѿ)W��bY�����e�#�	�,淤��zd'�����ZYK���O�l�^��0 �!�9=>~=����A���Ćp���\ٵ�F�����o���HgEKkC�tQ��_kX��d�^�ٌ�~��}A���o?�ڨgk���!.�w�NCv�~7����g��Z�hr`O jG��8B|k�J �Ի�~W�_�9yN��Q�����#}�ᜁ�5^�����v������z8�}�^�Q08Ͳ���O�;����A��7��ܹ��I�Uˇ�N06)�q���U��W1�\�w�� V?zGA3+}�~�n��>L�3������Z�F����V�����Po�r���#�H�L���׏q�q9�4|,���039T�(gP��s׎�y<!� �ۼ��^���<��,Thh��]�<g�q-4ڕ �q T�d�9��n$;����_Ӟ�������U�A:�J���ն�/��Aǧ�w`5/+\�� ����f�D j,}�'���E� !���E��.C�����)ETt&���9u쭅]�|� �"�b��t�?�H�yS(��.� 1�{ǥ~�9���b�:$+�d��}[�G,˕���M���q�Z�Q�P1�T͡��A1�����Uw�3�i��E8Qy���:�0 3l���,�lB:�A���cq T�����s�~)癯�=���ː�<��#�7��֟�5.YC�F��Ϣe:�^�N�/��� ����5�E�������r^Nt<��փI���ƞ�B�.��4�Z��c>T�O)�M\�(fߎ6�Y�QP�(6�b��V�E����?xM�<u����n�@��+�bOG�c�)�Չ�9)wK:��� ���g��u�I���_�T2թ��4�>+�]Ӽ����:�&�����+l�Y�9o��Z�Q�P��Ϳ�����D9�:8-U/+[#��cӁ��D���S��s%�a݉J%d���%`Ig�qJ!��Pc)95����A�G��uikW��
/e�ڝ��}�4�+���.��=�|,'b�q �ٕ�u�<��NN�~��[ۻ-Z���٦|��R�G�/��A�;ñ,m-C+��]@-�(����W��B���O��ՋIs#e&�v��vV�]�\5�7L�;'Xq{Ë
m"��Yn��p��|���I��D9������gEʒ�J&��!��]��F?ֳ�C�㕁O/�^��@-�(�^�;R�{\���r�����i.A�Mhjg�;�PxaY4�ȧ����!)>/�$t 	�?Pv!GA�`?�u����ߕ�k�p4�����)s���h���F�VЭ�M�ZN�V�?�����)v!GA���wP29K�(�/��t"�
A��,)��Ca�y�Z1�6I�-:8n��=1 ����ǳ�9>Zt��ޔ�$Q���I�wNf�g�v�C#�yQ���z����m�ai�cY`h��IQ ��z�j�ϛ�sL�3���Nd����ȑz��3��q�k�c���X:�����H����b��� T��S_P=)��(gP��J�3YL�\vV׫��=����"��U��4��ed�&�+�E	0����C����"����M9)���w���;3�2m�M�E�|+���J����[�������`rv�����>QΠL���豓��խ��>ݬ����;����5�_)�l�c̋�<�@-�(��m��Ώ��)����+?&﷤'�7P�T��WgG7@"� ����]�h�/K�)�;H=��	B%Q��9E��u�������睅o���K�k֍=�V���ut{h2imʚ��a�W<��_�>���`H泞�'�I5�b~[����+j�J��zV1�ces�T
N&;?Ĝ�!r�]�8mD�.#��-�n�JM[�5��&P��[�<&n��HU�P��]$���|c�ܡ��{O��+F����O�q�ٷ@-�(��M��F�7](~)絼� ���?���Sv,.�*�j�g�ZweW���	w�^0O�n�Z�Q0=;x�	�}��)gP��#��CD��C�+3�����V�[f�����jO$�c���r�|;�p�sN�RΠd}T_<ÐN};�!61�e?S6Bً��3�X��!����늤 �R��F>+^��b>W�_�y-�Ů��l}��o�S��"�VLw�H.M��[�D���ܴ�ۍ�@-�(h��<M��]:3��~��V��Bw(��`�e�C=uj��#�[���v�<聽�".��o=@-�(h��v�����M9�xy��ڸ�����wS�b�,6���r	�������a,6CTځy� �R����o�ı:�#�xSΠN�\X�-U���w�pC��Kٯ��!��m{%�� ��0�y� �B������_�����*�M9�����9���A!�	Qe�jR=�v,{S��f�[&������3��B���������ޔs����1�T��B[V<��p���#p��� �:��břv�ׯ@-ӻ�J��/Q��L�C&�����*P��ʰ����.��{$X綾��S�&�BG�;kP�:�`�X�w'd�ߌ�W�Տ�������M� ��$v+�[��N:�Pk�_Nƽ�|��V-�*���@-�(X�n�`����B�A��>L���E�5K���	;��n�I�E�h
������(VT�~��˰���?�@��|@�����^WV���c��^7׀i��5v^�7�u�E6mp�Ј��:T���"�7�<�u�6�|ߔ3(�٘� �LI���y[G[��X�����N�pr��)w�b�5���F�	@-�(X�|���x�h�#�K9�J�,�ȭ���$�H`��uu�ˋ-ͭp���w78��,���/ӻs�B�y��1���S��3��}-Ï���+�ȿj�v�k!��������.���!,ω���Z�Q��.�o����w�w��9���\v4M��E_c��B�y�|S�͋�>�ڋkҊ��� ��2�b�v��O�_��
�m����	.����z�����rJz�Ҙ������!�6az��A�� �X�w�*9����_  �P�o�.��q��N�Y�֒    ��jب�N�Ew�wl�X���W�޽
��ezw��R�f~��0S(귇��ϠM�S��!	ʃ��h�9�2��L:��d� 6�ezw��ҳ���P������A{���|�f�dp�Ъ��m|9���k(V~]؈����`�Z�w���<�b&�<M�3���WA��u�5e�8_�΄6mz;eP)��*P�b,Z
l��7�Ͻ9>~�8
A��n?�FC;]�~)��z�5����&|�����TC�#�i^�t�����Ji��8d���@-�(@����G���/�j�Jo�w�1Jљ��x$V���˷�#U��e�FEs�&���h���ezw�P)��+�����~��yap����`o^2�P�{$V�b�\�i�+���3fC�"���0B-�(@��%�#;5���y��Kv�PZ�z�8�*��\Z<9�E/���e��^���/y���! ���`�o-�"�iϻr�z�3��x��ڢΏ��*}��U��}Uښ�_��H*_�����H-�(P�fI�⓮@��{���l|�`��6��k[�Fk�QJ��TIkY�Y��J�@-�(P$��A�����]9�j�ᄎ���y�����жW�掐�3ڪ[]�;�\H?gQq��2�;A�(��>5�'��O�)gP��}BC9<{�[��W� V�\|d��yH���.H�srw'c�"p�O-ӻ��M{w���%��r>R[+m��n�y��_e�5��7���ĶU�DVaM�D�[h��ezw�����	E��#����p�r0�"j�h]����v�^��uW��dPG�#���Wc���X��Z�Q�(N~�����6�]9_�b[8@ֹ$v�M�4ﵓMV�~E�;�^B^W1l=n���X��Z�Q0���ҩ�E˱���ٻr~=��J�:=�B��v#筵
v�ݑ���y����p�{���ew�Z�Q�8�������o�����(gP����++�J���z(�t1o0�~���Pyv�YA���V8�N��Z�Q�H���E|A�M�鉣�(�е�^7�eȳ3�M�0^���՞?\T�,��溊��qN-�(h%��{��ؒwN�r%��۔�.�����ٿ�{��<����k�̢�v�kd����|j�ޝc��ԥ�EO��O���J�k7�6�]:D�u�au�n'n7W�w�R��8�,�I���[�Q����7Pظ��#��r�nb��Ur|?�*�� ��>$-WIn���]!Xݚ�/y^��ezw����5�E|}����7Q��,�o��KU��t4}�h����|{��%,F�:�C��H^��E�&gs���b9)�(��ؓ���%.�TN7��X��o������,!�c��֝�;��_�s ���C�&ߖ��LL��#2MxA�S̛��d
ß�ʊA�e��ZxJ�P��]}5�9�E
@-�(�PY�
�&��D9���ࢬ���{���Q��F¬=�0ta��#<3���������L�N*����(|��m���Q��d�p�\�C�mV(�w���D���%�I�+�����Ks�:�ezw����"�����)��"��b�I#��9��s�����a�X�I���1�*�n&�(�P<4 ��� q���](Hjr=:QΠ�L,����R��^]��V��m��.����īH�*������K�?�O-ӻ��1�|N��g`&�!�|��s�K���v+��$t��r�i�����:R���qB��P���q$�O���jz�1QΗ�=�W��ڳ�36���+���*��c�`DD˶�XE�F�e4.�8
*C}��/��89�b~���;�B�&���1:����k��V_��Ѯ��>8��� h�ゥ�l�ޝ Ta�b���n�(���$�%��p6ϲ��;��;4��0_��p�5�o�fկe��؍}@D��-ӻ�
�|IG��\~,���%�X���x����؀�!���Úq�jQ ���P�&�NzH��ǑZ�Q�$��M���ЩMzSΠ(IMoOԯ�:X���S���8'��~l[���v�/X吅�}�X�����	B��Y������(��Z@ץ��}f�X}|�6�>��(Q���1aH��p��s���j!GA �z_�O�>������"n������o�^�h�fp�$�(�l}��뭬��,��d����I���9E�	�0R�W9���y��ۆ�7��E+�e�}��	*�1��6��)*�3���c;*P�8

%0���#�-2}�ޕ�Տ�JZ�m]Rs'���B]a�V��5feA�jG�F�y��]�z,ӻs�$>���P�!�D9�B�V	��ש+���o.Hu~m������|gԂYIuW)�O㒾�� ���7��b���]9�t3"$��ݎ���9<���;���Zivz��-���%R���P�8
j��͜bǅ�����r%�)yÍt�@�Q����J�/{?;���g��:�Pu�M�s@-ӻs��>W?��|�`�P�*�e<�z�w� !7�r��=�w-OA~�;����z "���E�?w.s�R@-�((�������F�t�{W���%��P#���k�ƒ}�4����xި]]�!��;a�̸h �2=3i� O�g���`m�f��ٻr�$�0�+^79��`�Vv�9Q�R-�Ã %��ш#w�u�q��S����������������QzhԶ���9�����{eX�8��1��I�|I�5n�❘�I��������,I�Y��N���(�~������:�r��V hM�n�{uM^`�(R�>9�f��&�GjGA�6K��M?k=Q�7_�����,=�|�S=�"�K�i�!�l�Z:�]�R������.�(H%���X�DNZM����S��$`���u�"��h�:JH��BP�P�/���2wT��oN ��6�E>�f�i�,�{���뿂8�/Y�e	��Ƅ1������D9�R��mt�n�U����^.�:L�dsnY֑����<�;"���l���c��U�o(vr�2QΠ��}�5�X�����x������X���]9ʛ�j�`o4�򕑀i�LG�1ԙ]�	5�?�S��۵�e�Z�ȝ���]ǡe�C�߲xߑe kGvuN����jO���
�e:B������P�d��(gP]�H/*u\��Υ>6��߄�j��^���Ki�z(LQ�Ձ][�#$;~��?~�ւL�w���n�X��Sq�H���^��م�4םg����>��a˓��u�t�C%p�[(|R�<Q����!so�=Ǖ<Iӝ��p��a��n�,��^�������5��/�P)��j�%�r#�!?��{ z�H��C
 ��א���^+c|`���X���!����/�P����pR�1Q�ky�^���'�b����+*l�=Y��dpq�2Z��,8-= �HB�Qr�O�?o4���/���x����"� 1�J
k����ŕk7e���C]�����$�qN-����$�:}5w��A�J�����b��G+[��!/�Q��H��Rx����K��<?�[�lh��lh��b��	��@ƫٷGn����,���$e���Ϙ���M��_�-s˵�=3�S'f��d����f�Y�^��v�5	P��F���%L�*��n�'=��B&��7��p��^K�d��C���q��f�VH�j��?�O�������������H�1T�4~3R����#�K9��P|���C�l.�G�dS�I��*��d�='�����{�-��8� �H�1T��|��o(����S�_��I�f��tqK�%�HY�j�F?Wq��^�K��ޕ�W�sͮ�#nI'P��nn��`߁`�{yS�3���a(���Ł���GS�?qP��8H�)�|�M����?�s����6Y���
C�o�����ʷ?�gtKls_?��_��������Rί�l�BW���+��d_��F\�J���hZI[�����f��i\�6�H�¯P��v,�{���T9O�O&q�#�pCwΊp/m��IzW��ض)q�kϺC��nJ �   ς ��"m
�.I|����������7�V6W|�����_��5����H���7�����rp�L�G��`�Z�M�*�������JbE�����P����U���AN�@U��)��97?�g��a�<X�Kh��y�6�_����P���r�	ڐ2��P���X�5d�޶B���i{�k'�X��5&�+-��/�?���hR�      L   C   x�U��� ����I�	*��:���!�kt[i{��x��.P�qA��NV
AV
�<)��I`3; $      N   �  x����r�0���)8䊑%��`�l�C���7��<� Y&!�L�T��������%�u� Jq��ATY����kv�88&�,�L;w�xG�����t��Z���v���"�s�g�Yռb��񳡃�a���&���r�@�BP]D����..ȋ���~]V~�+����檻n�IVco�,ge��;N�c.2]�\���Q��Fʦ��o��3E� ӥX 1�+BԪ�L	$�����6�I�8��ٖ��%��
�a�����:%����F|M����7\;\Dy;/'"�e���
AS)s��-{��/;ƙ2��&'�B%�˚�4(䡁h�Jl�Gz�:��\%采Bj���&o5V��O�'��]�,+NZvo|�qR�Ӭ�4��ёzNw�20yWn+P�:2�ر׍R:.��J���&�%��Eȵ@ߺ�C{o"��A�����݌���=�4���$$��y\�eݬ���o��}0�����p"[�r�4z����2��4&���P��S��ӂ$p�
ʆSܴHI��h�YVځ�q��/�"s�?�o󆝁�ള���%'q����-�?7�	���a^ج{�8���5��*�ʜ�m��қ�����UxBK~�Ӹ�� �׸�箿��i�$�7v:��     