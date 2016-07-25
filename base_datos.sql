--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: asignatura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asignatura (
    descripcion_asig character varying(50) NOT NULL,
    estado integer NOT NULL,
    abrevi character varying(10) NOT NULL,
    codigo integer NOT NULL,
    id_asignatura integer NOT NULL
);


ALTER TABLE asignatura OWNER TO postgres;

--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asignatura_id_asignatura_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE asignatura_id_asignatura_seq OWNER TO postgres;

--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE asignatura_id_asignatura_seq OWNED BY asignatura.id_asignatura;


--
-- Name: aula; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aula (
    descripcion character varying(20) NOT NULL,
    turno character(2) NOT NULL,
    id_filial integer NOT NULL,
    estado integer NOT NULL,
    codigo integer NOT NULL,
    id_aula integer NOT NULL
);


ALTER TABLE aula OWNER TO postgres;

--
-- Name: aula_id_aula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aula_id_aula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aula_id_aula_seq OWNER TO postgres;

--
-- Name: aula_id_aula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aula_id_aula_seq OWNED BY aula.id_aula;


--
-- Name: capacitacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE capacitacion (
    id_docente integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    institucion character varying(30) NOT NULL,
    fecha_ini date,
    fecha_fin date,
    id_capa integer NOT NULL
);


ALTER TABLE capacitacion OWNER TO postgres;

--
-- Name: capacitacion_id_capa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE capacitacion_id_capa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE capacitacion_id_capa_seq OWNER TO postgres;

--
-- Name: capacitacion_id_capa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE capacitacion_id_capa_seq OWNED BY capacitacion.id_capa;


--
-- Name: conocimientosidiomas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conocimientosidiomas (
    id_docente integer NOT NULL,
    idioma character varying(20) NOT NULL,
    nivel character(2) NOT NULL,
    fecha_ini date,
    fecha_fin date,
    id_idiomas integer NOT NULL
);


ALTER TABLE conocimientosidiomas OWNER TO postgres;

--
-- Name: conocimientosidiomas_id_idiomas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conocimientosidiomas_id_idiomas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conocimientosidiomas_id_idiomas_seq OWNER TO postgres;

--
-- Name: conocimientosidiomas_id_idiomas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conocimientosidiomas_id_idiomas_seq OWNED BY conocimientosidiomas.id_idiomas;


--
-- Name: conocimientosinfor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conocimientosinfor (
    id_docente integer NOT NULL,
    curso_tem character varying(50) NOT NULL,
    nivel character(2) NOT NULL,
    fecha_ini date,
    fecha_fin date,
    id_ci integer NOT NULL
);


ALTER TABLE conocimientosinfor OWNER TO postgres;

--
-- Name: conocimientosinfor_id_ci_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conocimientosinfor_id_ci_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conocimientosinfor_id_ci_seq OWNER TO postgres;

--
-- Name: conocimientosinfor_id_ci_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conocimientosinfor_id_ci_seq OWNED BY conocimientosinfor.id_ci;


--
-- Name: cronograma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cronograma (
    descripcion character varying(20) NOT NULL,
    fechaini date NOT NULL,
    fechafin date NOT NULL,
    codigo integer NOT NULL,
    id_cron integer NOT NULL
);


ALTER TABLE cronograma OWNER TO postgres;

--
-- Name: cronograma_id_cron_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cronograma_id_cron_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cronograma_id_cron_seq OWNER TO postgres;

--
-- Name: cronograma_id_cron_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cronograma_id_cron_seq OWNED BY cronograma.id_cron;


--
-- Name: dias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dias (
    dia character varying(20) NOT NULL,
    id_dia integer NOT NULL
);


ALTER TABLE dias OWNER TO postgres;

--
-- Name: diasxturno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE diasxturno (
    id_dia integer NOT NULL,
    turnom character(2) NOT NULL,
    turnot character(2) NOT NULL,
    codigo integer,
    id_diasxturno integer NOT NULL
);


ALTER TABLE diasxturno OWNER TO postgres;

--
-- Name: diasxturno_id_diasxturno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE diasxturno_id_diasxturno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE diasxturno_id_diasxturno_seq OWNER TO postgres;

--
-- Name: diasxturno_id_diasxturno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE diasxturno_id_diasxturno_seq OWNED BY diasxturno.id_diasxturno;


--
-- Name: disponibilidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disponibilidad (
    dia character varying(15) NOT NULL,
    id_docente integer NOT NULL,
    id_semestre integer NOT NULL,
    horas character varying(20) NOT NULL,
    id_dispo integer NOT NULL,
    turno character(2) NOT NULL
);


ALTER TABLE disponibilidad OWNER TO postgres;

--
-- Name: disponibilidad_id_dispo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disponibilidad_id_dispo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disponibilidad_id_dispo_seq OWNER TO postgres;

--
-- Name: disponibilidad_id_dispo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disponibilidad_id_dispo_seq OWNED BY disponibilidad.id_dispo;


--
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE docente (
    fecha_nacimiento date NOT NULL,
    ruc character varying(15),
    direccion character varying(50) NOT NULL,
    distrito character varying(20) NOT NULL,
    departamento character varying(20) NOT NULL,
    telefono character varying(15) NOT NULL,
    id_persona integer NOT NULL,
    id_docente integer NOT NULL,
    id_semestre integer NOT NULL,
    estado integer,
    tipo character varying(20),
    provincia character varying(20)
);


ALTER TABLE docente OWNER TO postgres;

--
-- Name: docente_id_docente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE docente_id_docente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE docente_id_docente_seq OWNER TO postgres;

--
-- Name: docente_id_docente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE docente_id_docente_seq OWNED BY docente.id_docente;


--
-- Name: experienciadocente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE experienciadocente (
    id_docente integer NOT NULL,
    institucion character varying(50) NOT NULL,
    asignatura character varying(30) NOT NULL,
    fecha_ini date,
    fecha_fin date,
    id_experiencia integer NOT NULL
);


ALTER TABLE experienciadocente OWNER TO postgres;

--
-- Name: experienciadocente_id_experiencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE experienciadocente_id_experiencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE experienciadocente_id_experiencia_seq OWNER TO postgres;

--
-- Name: experienciadocente_id_experiencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE experienciadocente_id_experiencia_seq OWNED BY experienciadocente.id_experiencia;


--
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filial (
    descripcion character varying(30) NOT NULL,
    direccion character varying(50) NOT NULL,
    codigo integer NOT NULL,
    estado integer NOT NULL,
    id_filiar integer NOT NULL
);


ALTER TABLE filial OWNER TO postgres;

--
-- Name: filial_id_filiar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filial_id_filiar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filial_id_filiar_seq OWNER TO postgres;

--
-- Name: filial_id_filiar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filial_id_filiar_seq OWNED BY filial.id_filiar;


--
-- Name: formacionacademica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formacionacademica (
    id_docente integer NOT NULL,
    gradotitulo character varying(50) NOT NULL,
    fecha_ini date,
    fecha_fin date,
    universidad character varying(40) NOT NULL,
    id_formacion integer NOT NULL,
    tipo_grado character varying(50)
);


ALTER TABLE formacionacademica OWNER TO postgres;

--
-- Name: formacionacademica_id_formacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formacionacademica_id_formacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formacionacademica_id_formacion_seq OWNER TO postgres;

--
-- Name: formacionacademica_id_formacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formacionacademica_id_formacion_seq OWNED BY formacionacademica.id_formacion;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos (
    descripcion_g character varying(10) NOT NULL,
    id_grupo integer NOT NULL
);


ALTER TABLE grupos OWNER TO postgres;

--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupos_id_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupos_id_grupo_seq OWNER TO postgres;

--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupos_id_grupo_seq OWNED BY grupos.id_grupo;


--
-- Name: horacurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE horacurso (
    dhoran integer NOT NULL,
    horaf integer NOT NULL,
    horane integer NOT NULL,
    horafe integer NOT NULL,
    id_asignatura integer NOT NULL,
    id_horacurso integer NOT NULL
);


ALTER TABLE horacurso OWNER TO postgres;

--
-- Name: horacurso_id_horacurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horacurso_id_horacurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horacurso_id_horacurso_seq OWNER TO postgres;

--
-- Name: horacurso_id_horacurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE horacurso_id_horacurso_seq OWNED BY horacurso.id_horacurso;


--
-- Name: horarioxdia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE horarioxdia (
    id_dia integer NOT NULL,
    horainicio character varying(10) NOT NULL,
    horatermino character varying(10) NOT NULL,
    horareceso character varying(10) NOT NULL,
    horaterreceso character varying(10) NOT NULL,
    intervalo integer NOT NULL,
    turno character(1) NOT NULL,
    id_semestre integer NOT NULL,
    id_horarioxdia integer NOT NULL
);


ALTER TABLE horarioxdia OWNER TO postgres;

--
-- Name: horarioxdia_id_horarioxdia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horarioxdia_id_horarioxdia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horarioxdia_id_horarioxdia_seq OWNER TO postgres;

--
-- Name: horarioxdia_id_horarioxdia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE horarioxdia_id_horarioxdia_seq OWNED BY horarioxdia.id_horarioxdia;


--
-- Name: maestriadoctor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE maestriadoctor (
    id_docente integer NOT NULL,
    grado character varying(50) NOT NULL,
    duracion character varying(10) NOT NULL,
    universidad character varying(40) NOT NULL,
    id_maestriadoc integer NOT NULL,
    tipo_md character varying(50)
);


ALTER TABLE maestriadoctor OWNER TO postgres;

--
-- Name: maestriadoctor_id_maestriadoc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE maestriadoctor_id_maestriadoc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE maestriadoctor_id_maestriadoc_seq OWNER TO postgres;

--
-- Name: maestriadoctor_id_maestriadoc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE maestriadoctor_id_maestriadoc_seq OWNED BY maestriadoctor.id_maestriadoc;


--
-- Name: modalidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modalidad (
    descripcion_m character varying(15) NOT NULL,
    id_mod integer NOT NULL
);


ALTER TABLE modalidad OWNER TO postgres;

--
-- Name: modalidad_id_mod_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modalidad_id_mod_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modalidad_id_mod_seq OWNER TO postgres;

--
-- Name: modalidad_id_mod_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modalidad_id_mod_seq OWNED BY modalidad.id_mod;


--
-- Name: otro_dato; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE otro_dato (
    id_otro integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    id_docente integer NOT NULL
);


ALTER TABLE otro_dato OWNER TO postgres;

--
-- Name: otro_dato_id_otro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE otro_dato_id_otro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE otro_dato_id_otro_seq OWNER TO postgres;

--
-- Name: otro_dato_id_otro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE otro_dato_id_otro_seq OWNED BY otro_dato.id_otro;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    nombre_per character varying(50) NOT NULL,
    apepat_per character varying(30) NOT NULL,
    apemat_per character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    id_asignatura integer NOT NULL,
    usuario character varying(10) NOT NULL,
    clave character varying(100) NOT NULL,
    dni character varying(10) NOT NULL,
    id_persona integer NOT NULL
);


ALTER TABLE persona OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_id_persona_seq OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_id_persona_seq OWNED BY persona.id_persona;


--
-- Name: planacademico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE planacademico (
    id_asignatura integer NOT NULL,
    id_grupo integer NOT NULL,
    id_mod integer NOT NULL,
    codigo integer NOT NULL,
    horasn integer NOT NULL,
    horasf integer NOT NULL,
    id_planaca integer NOT NULL
);


ALTER TABLE planacademico OWNER TO postgres;

--
-- Name: planacademico_id_planaca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE planacademico_id_planaca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planacademico_id_planaca_seq OWNER TO postgres;

--
-- Name: planacademico_id_planaca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE planacademico_id_planaca_seq OWNED BY planacademico.id_planaca;


--
-- Name: profesoresunprg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profesoresunprg (
    dni character varying(10) NOT NULL
);


ALTER TABLE profesoresunprg OWNER TO postgres;

--
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE semestre (
    descripcion character varying(20) NOT NULL,
    fechaini_semes date NOT NULL,
    fechafin_semes date NOT NULL,
    estado character varying(20) NOT NULL,
    codigo integer NOT NULL
);


ALTER TABLE semestre OWNER TO postgres;

--
-- Name: semestre_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE semestre_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE semestre_codigo_seq OWNER TO postgres;

--
-- Name: semestre_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE semestre_codigo_seq OWNED BY semestre.codigo;


--
-- Name: id_asignatura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asignatura ALTER COLUMN id_asignatura SET DEFAULT nextval('asignatura_id_asignatura_seq'::regclass);


--
-- Name: id_aula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aula ALTER COLUMN id_aula SET DEFAULT nextval('aula_id_aula_seq'::regclass);


--
-- Name: id_capa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY capacitacion ALTER COLUMN id_capa SET DEFAULT nextval('capacitacion_id_capa_seq'::regclass);


--
-- Name: id_idiomas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conocimientosidiomas ALTER COLUMN id_idiomas SET DEFAULT nextval('conocimientosidiomas_id_idiomas_seq'::regclass);


--
-- Name: id_ci; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conocimientosinfor ALTER COLUMN id_ci SET DEFAULT nextval('conocimientosinfor_id_ci_seq'::regclass);


--
-- Name: id_cron; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronograma ALTER COLUMN id_cron SET DEFAULT nextval('cronograma_id_cron_seq'::regclass);


--
-- Name: id_diasxturno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diasxturno ALTER COLUMN id_diasxturno SET DEFAULT nextval('diasxturno_id_diasxturno_seq'::regclass);


--
-- Name: id_dispo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disponibilidad ALTER COLUMN id_dispo SET DEFAULT nextval('disponibilidad_id_dispo_seq'::regclass);


--
-- Name: id_docente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docente ALTER COLUMN id_docente SET DEFAULT nextval('docente_id_docente_seq'::regclass);


--
-- Name: id_experiencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experienciadocente ALTER COLUMN id_experiencia SET DEFAULT nextval('experienciadocente_id_experiencia_seq'::regclass);


--
-- Name: id_filiar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial ALTER COLUMN id_filiar SET DEFAULT nextval('filial_id_filiar_seq'::regclass);


--
-- Name: id_formacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacionacademica ALTER COLUMN id_formacion SET DEFAULT nextval('formacionacademica_id_formacion_seq'::regclass);


--
-- Name: id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos ALTER COLUMN id_grupo SET DEFAULT nextval('grupos_id_grupo_seq'::regclass);


--
-- Name: id_horacurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horacurso ALTER COLUMN id_horacurso SET DEFAULT nextval('horacurso_id_horacurso_seq'::regclass);


--
-- Name: id_horarioxdia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horarioxdia ALTER COLUMN id_horarioxdia SET DEFAULT nextval('horarioxdia_id_horarioxdia_seq'::regclass);


--
-- Name: id_maestriadoc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY maestriadoctor ALTER COLUMN id_maestriadoc SET DEFAULT nextval('maestriadoctor_id_maestriadoc_seq'::regclass);


--
-- Name: id_mod; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modalidad ALTER COLUMN id_mod SET DEFAULT nextval('modalidad_id_mod_seq'::regclass);


--
-- Name: id_otro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY otro_dato ALTER COLUMN id_otro SET DEFAULT nextval('otro_dato_id_otro_seq'::regclass);


--
-- Name: id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN id_persona SET DEFAULT nextval('persona_id_persona_seq'::regclass);


--
-- Name: id_planaca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planacademico ALTER COLUMN id_planaca SET DEFAULT nextval('planacademico_id_planaca_seq'::regclass);


--
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semestre ALTER COLUMN codigo SET DEFAULT nextval('semestre_codigo_seq'::regclass);


--
-- Data for Name: asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY asignatura (descripcion_asig, estado, abrevi, codigo, id_asignatura) FROM stdin;
RAZONAMIENTO VERBAL	1	RV	1	2
RAZONAMIENTO MATEMATICO	1	RM	1	1
ALGEBRA	1	ALG	3	3
GEOMETRIA Y TRIGONOMETRIA	1	GYT	3	4
FISICA	1	FIS	3	5
ANATOMIA	1	ANA	3	6
BIOLOGIA	1	BIO	3	7
QUIMICA	1	QUI	3	8
LENGUAJE Y LITERATURA	1	LENG	3	9
ECONOMIA Y CIVICA	1	ECO	3	10
PSICOLOGIA,FILOSOFIA Y LOGICA	1	PFL	3	11
HISTORIA Y GEOGRAFIA	1	HYG	3	12
\.


--
-- Name: asignatura_id_asignatura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asignatura_id_asignatura_seq', 12, true);


--
-- Data for Name: aula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aula (descripcion, turno, id_filial, estado, codigo, id_aula) FROM stdin;
aula-4	M 	5	0	1	7256
aula-5	M 	5	0	1	7258
aula-3	T 	5	0	1	7257
aula-4	T 	5	0	1	7259
aula-2	M 	5	1	1	7252
aula-3	M 	5	1	1	7253
aula-2	T 	5	1	1	7255
aula-1	M 	5	1	1	7251
aula-1	T 	5	1	1	7254
\.


--
-- Name: aula_id_aula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aula_id_aula_seq', 7259, true);


--
-- Data for Name: capacitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY capacitacion (id_docente, descripcion, institucion, fecha_ini, fecha_fin, id_capa) FROM stdin;
1	asdsdad	sdasdasd	1932-03-01	1931-04-01	1
1	qweqweqw	qweqwe	1930-04-01	1931-08-01	2
\.


--
-- Name: capacitacion_id_capa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('capacitacion_id_capa_seq', 2, true);


--
-- Data for Name: conocimientosidiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conocimientosidiomas (id_docente, idioma, nivel, fecha_ini, fecha_fin, id_idiomas) FROM stdin;
1	GHJGHJHG	as	1991-12-02	1991-12-02	1
1	HJKHJK	as	1991-12-02	1991-12-02	2
1	GHJGHJ	as	1991-12-01	1991-12-01	3
1	TYUTYU	as	1991-12-01	1991-12-01	4
1	ido a 1	B 	1919-02-01	1916-03-01	5
1	isidasdasd	B 	1919-01-01	1919-02-01	6
6	retetrer	B 	1932-03-01	1932-03-01	7
\.


--
-- Name: conocimientosidiomas_id_idiomas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conocimientosidiomas_id_idiomas_seq', 7, true);


--
-- Data for Name: conocimientosinfor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conocimientosinfor (id_docente, curso_tem, nivel, fecha_ini, fecha_fin, id_ci) FROM stdin;
1	sdfsdf	ba	1933-02-01	1932-03-01	1
6	tertret	in	1930-03-01	1933-05-01	2
\.


--
-- Name: conocimientosinfor_id_ci_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conocimientosinfor_id_ci_seq', 2, true);


--
-- Data for Name: cronograma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cronograma (descripcion, fechaini, fechafin, codigo, id_cron) FROM stdin;
DISPONIBILIDAD	2016-04-18	2016-10-19	1	1
\.


--
-- Name: cronograma_id_cron_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cronograma_id_cron_seq', 1, true);


--
-- Data for Name: dias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dias (dia, id_dia) FROM stdin;
LUNES	1
MARTES	2
MIERCOLES	3
JUEVES	4
VIERNES	5
SABADO	6
\.


--
-- Data for Name: diasxturno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY diasxturno (id_dia, turnom, turnot, codigo, id_diasxturno) FROM stdin;
1	M 	T 	3	1
2	M 	T 	3	2
3	M 	T 	3	3
4	M 	T 	3	4
5	M 	T 	3	5
6	M 	V 	3	6
\.


--
-- Name: diasxturno_id_diasxturno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('diasxturno_id_diasxturno_seq', 6, true);


--
-- Data for Name: disponibilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disponibilidad (dia, id_docente, id_semestre, horas, id_dispo, turno) FROM stdin;
LUNES	1	3	7:30-10:50	1	M 
MARTES	1	3	7:30-12:50	2	M 
MIERCOLES	1	3	9:10-12:50	3	M 
JUEVES	1	3	7:30-10:50	4	M 
VIERNES	1	3	7:30-10:50	5	M 
SABADO	1	3	7:30-10:50	6	M 
lunes	1	1	7:30 - 12:50	7	T 
martes	1	1	7:30 - 12:50	8	T 
martes	1	1	7:30 - 12:50	9	M 
martes	1	1	7:30 - 12:50	10	T 
miercoles	1	1	7:30 - 12:50	11	T 
lunes	1	1	7:30 - 12:50	12	M 
miercoles	1	1	7:30 - 10:50	13	M 
martes	1	1	7:30 - 10:50	14	T 
jueves	1	1	10:50 - 12:50 	15	T 
lunes	1	1	7:30 - 10:50	16	M 
miercoles	1	1	7:30 - 10:50	17	M 
miercoles	1	1	7:30 - 10:50	18	T 
viernes	1	1	10:50 - 12:50 	19	T 
miercoles	1	1	7:30 - 12:50	20	M 
jueves	1	1	10:50 - 12:50 	21	M 
lunes	1	1	7:30 - 10:50	22	T 
miercoles	1	1	10:50 - 12:50 	23	T 
lunes	1	1	7:30 - 10:50	24	M 
jueves	1	1	10:50 - 12:50 	25	M 
sabado	1	1	7:30 - 10:50	26	M 
lunes	1	1	7:30 - 10:50	27	T 
miercoles	1	1	10:50 - 12:50 	28	T 
lunes	1	3	7:30 - 10:50	29	M 
\.


--
-- Name: disponibilidad_id_dispo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disponibilidad_id_dispo_seq', 29, true);


--
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY docente (fecha_nacimiento, ruc, direccion, distrito, departamento, telefono, id_persona, id_docente, id_semestre, estado, tipo, provincia) FROM stdin;
1991-12-12	123123123	cruz de la ezperanza	chiclayo	chiclayo	534534534	1	1	1	\N	\N	\N
1992-12-12	123123123	cruz de la dasd	chiclayo	floricda	12323123	7	2	3	\N	\N	\N
1943-11-15	12312312	qweqewe	05	18	21312312	7	3	3	1	-	01
1929-09-16	12312312	qweqwe	02	17	qweqwe	7	4	3	1	-	02
1929-09-14	asdasda	dasdasd	03	16		7	5	3	1	-	03
1932-11-18	12312312	casadadasd	10	16	432423	7	6	3	1	-	01
1930-09-18	12312312	casadadasd	09	14	432423	7	7	3	1	-	03
1936-11-18	32423423	wqeqweqw	02	16	2323232	7	8	3	1	-	04
1931-10-18	123123123	qweqweqwe	02	19	213123123	7	9	3	1	-	02
1929-11-17	123123123	qweqweqwe	02	17	213123123	7	10	3	1	-	01
1929-10-19	12312312	21312312	02	16	23423434	7	11	3	1	-	06
1930-11-18	12312312	123123	01	18	123123	7	12	3	1	-	03
1959-09-17	qweqweq	1231231	04	17	21312312	7	13	3	1	-	01
1931-11-19	qweqweq	1231231	02	17	21312312	7	14	3	1	-	01
1933-12-17	asdasd	asdasd	02	17	qweqweq	7	15	3	1	-	01
1930-10-17	82736283726	cruz de la ezperanza	10	11	12312312	9	16	3	1	unprg	02
1930-12-14	3243432343	wwrwerwerw	02	15	234234234	10	17	3	1	invitado	03
1931-10-17	34234324	wqeqweqwe	01	16	123123123	10	18	3	1	invitado	01
1932-12-13	22222222222	222222222	02	18	33333333333	10	19	3	1	invitado	02
1930-10-16	erwerwerwe	rwerw	02	17	rwerwerw	12	20	3	1	invitado	02
1948-08-17	12312312	qweq	05	14	2131231	13	21	3	1	invitado	03
\.


--
-- Name: docente_id_docente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('docente_id_docente_seq', 21, true);


--
-- Data for Name: experienciadocente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY experienciadocente (id_docente, institucion, asignatura, fecha_ini, fecha_fin, id_experiencia) FROM stdin;
1	adsdasd	sadsd	1932-02-01	1932-05-01	1
1	sdfsdfdf	sdfsdf	1932-05-01	1932-04-01	2
6	rtyrtyty	rtyrtyrt	1933-02-01	1966-04-01	3
6	tryrtyrty	rtyrtyr	1959-03-01	1971-07-01	4
\.


--
-- Name: experienciadocente_id_experiencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('experienciadocente_id_experiencia_seq', 4, true);


--
-- Data for Name: filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filial (descripcion, direccion, codigo, estado, id_filiar) FROM stdin;
CHICLAYO	JOSE LEONARDO ORTIZ 1330	1	1	1
TUCUME	AV. MIRAFLORES 130	1	1	2
PACORA	AV. LOS GIRASOLES 133	1	1	3
ILLIMO	AV. TULIPANES 1230	1	1	4
TUMAN	AV. TUMAN 130	1	1	5
\.


--
-- Name: filial_id_filiar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filial_id_filiar_seq', 5, true);


--
-- Data for Name: formacionacademica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formacionacademica (id_docente, gradotitulo, fecha_ini, fecha_fin, universidad, id_formacion, tipo_grado) FROM stdin;
1	asdadasd	1932-02-01	1931-03-01	dasdasd	1	titulo
1	sdfsdf	1931-02-01	1928-04-01	dsfdf	2	bachiller
6	werwerwer	1932-02-01	1931-02-01	werwer	3	bachiller
6	werwer	1933-06-01	1932-10-01	rretert	4	titulo
7	camino a toco	1933-04-01	1932-04-01	asdasd	5	bachiller
7	viendo el amanecer	1932-02-01	1929-05-01	caracas 	6	titulo
13	wqeqwqwe	1932-05-01	1931-07-01	wqeqwe	7	bachiller
13	rebienta	1933-03-01	1970-08-01	csm	8	titulo
15	qweqweqw	1931-04-01	1000-01-01	eqweqw	9	bachiller
15	qweqwe	1931-05-01	1932-05-01	wqeqwe	10	bachiller
15	ddddddddddd	1000-01-01	1000-01-01	www	11	bachiller
18	1231231	1931-01-01	1932-01-01	23123123	12	bachiller
18	1231231	1931-01-01	1932-01-01	23123123	13	bachiller
\.


--
-- Name: formacionacademica_id_formacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formacionacademica_id_formacion_seq', 13, true);


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (descripcion_g, id_grupo) FROM stdin;
GRUPO-I	1
GRUPO-II	2
GRUPO-III	3
GRUPO-IV	4
\.


--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupos_id_grupo_seq', 1, false);


--
-- Data for Name: horacurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY horacurso (dhoran, horaf, horane, horafe, id_asignatura, id_horacurso) FROM stdin;
20	12	8	0	1	1
12	12	8	0	2	2
10	12	8	0	3	3
9	12	8	0	4	4
\.


--
-- Name: horacurso_id_horacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horacurso_id_horacurso_seq', 4, true);


--
-- Data for Name: horarioxdia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY horarioxdia (id_dia, horainicio, horatermino, horareceso, horaterreceso, intervalo, turno, id_semestre, id_horarioxdia) FROM stdin;
1	07:30	12:50	10:50	11:10	50	M	3	7
2	07:30	12:50	10:50	11:10	50	M	3	8
3	07:30	12:50	10:50	11:10	50	M	3	9
4	07:30	12:50	10:50	11:10	50	M	3	10
5	07:30	12:50	10:50	11:10	50	M	3	11
\.


--
-- Name: horarioxdia_id_horarioxdia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horarioxdia_id_horarioxdia_seq', 11, true);


--
-- Data for Name: maestriadoctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY maestriadoctor (id_docente, grado, duracion, universidad, id_maestriadoc, tipo_md) FROM stdin;
1	asdasd	asdasd	qweqwe	1	Magister
1	qweqweq	qweqe	qweqwe	2	Magister
6	ertertret	ertrete	ertert	3	Doctor
8	piedra	232	sasdasd	4	Doctor
8	yep uep	dfgdfg	sdfs	5	Magister
\.


--
-- Name: maestriadoctor_id_maestriadoc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('maestriadoctor_id_maestriadoc_seq', 5, true);


--
-- Data for Name: modalidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modalidad (descripcion_m, id_mod) FROM stdin;
ORDINARIO	1
EXTRAORDINARIO	2
\.


--
-- Name: modalidad_id_mod_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modalidad_id_mod_seq', 1, false);


--
-- Data for Name: otro_dato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY otro_dato (id_otro, descripcion, id_docente) FROM stdin;
1	value mundo	1
2	sdfsdfsdf	1
3	dfgdgdf	1
\.


--
-- Name: otro_dato_id_otro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('otro_dato_id_otro_seq', 3, true);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona (nombre_per, apepat_per, apemat_per, email, id_asignatura, usuario, clave, dni, id_persona) FROM stdin;
MIGUEL	PANTA	CHAPOÑAN	panta_2moons_93@hotmail.com	2	48186731	48186731	48186731	1
MIGUEL	PANTA	CHAPOÑAN	panta_2moons_93@hotmail.com	1	12345678	097bb6b77c66ad637a97eb6a9bbd24e4	12345678	2
acuario	acuario	mysql	pgsql@gmail.com	1	acuario	097bb6b77c66ad637a97eb6a9bbd24e4	93067569	6
carlos	benavides	montenro	carn@gmail.com	1	vimcemt	d41d8cd98f00b204e9800998ecf8427e	71433272	3
fiorella	herrera	saavedra	fiore@gmail.com	1	fiorella	d41d8cd98f00b204e9800998ecf8427e	20397272	4
carrie	carrie	carrie	carrie@gmail.com	1	carrie	097bb6b77c66ad637a97eb6a9bbd24e4	11223344	7
postgresql	pgsql	mysql	pgsql@gmail.com	1	psql	d41d8cd98f00b204e9800998ecf8427e	10203040	5
naranja	manzana	melon	pera@gmail.com	2	naranja	601ec540dd2246ed62b919ed98efcba7	72323423	8
patricia	manzana	melon	patricia@gmail.com	6	patricia	601ec540dd2246ed62b919ed98efcba7	16489936	9
melocoton	manzana	melon	melocoton@gmail.com	6	melocoton	601ec540dd2246ed62b919ed98efcba7	77766655	10
caramelo	manzana	melon	caramelo@gmail.com	6	77733322	6d70af09e6bea77499bccba8d6ddc658	77733322	11
calabaza	manzana	melon	calabaza@gmail.com	6	calabaza	601ec540dd2246ed62b919ed98efcba7	88899900	12
javier	manzana	melon	javier@gmail.com	6	javier	601ec540dd2246ed62b919ed98efcba7	66677788	13
karina	huertas	pizarro	pizarroalmagro@gmail.com	5	lojkilla	601ec540dd2246ed62b919ed98efcba7	99991111	14
\.


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_id_persona_seq', 14, true);


--
-- Data for Name: planacademico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY planacademico (id_asignatura, id_grupo, id_mod, codigo, horasn, horasf, id_planaca) FROM stdin;
3	1	2	3	2	0	75
3	2	2	3	2	0	76
3	3	2	3	2	0	77
3	4	2	3	2	0	78
3	1	1	3	3	3	71
3	2	1	3	3	3	72
3	3	1	3	2	3	73
3	4	1	3	2	3	74
1	1	1	3	5	3	33
1	2	1	3	5	3	34
1	3	1	3	5	3	35
1	4	1	3	5	3	36
4	1	1	3	3	3	79
4	2	1	3	2	3	80
4	3	1	3	2	3	81
4	4	1	3	2	3	82
4	1	2	3	2	0	83
4	2	2	3	2	0	84
4	3	2	3	2	0	85
4	4	2	3	2	0	86
1	1	2	3	2	0	55
1	2	2	3	2	0	56
1	3	2	3	2	0	57
1	4	2	3	2	0	58
2	1	1	3	3	3	63
2	2	1	3	3	3	64
2	3	1	3	3	3	65
2	4	1	3	3	3	66
2	1	2	3	2	0	67
2	2	2	3	2	0	68
2	3	2	3	2	0	69
2	4	2	3	2	0	70
\.


--
-- Name: planacademico_id_planaca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('planacademico_id_planaca_seq', 86, true);


--
-- Data for Name: profesoresunprg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profesoresunprg (dni) FROM stdin;
16489936
16404848
16490934
16702146
16494419
17523035
18005820
17531263
16725642
16712034
16543829
16689491
32941968
16652955
16692786
17902827
17628147
19222634
17895879
16755764
16409651
17548697
16460593
16686687
16439118
17876379
17864216
16493099
18010655
16761647
16709583
16477876
16480159
06092257
19184424
16773608
41699367
17883408
16400090
16482999
16739788
40231633
16406148
17539621
16488223
16542839
16497724
16656594
42105255
16429791
16762439
42877603
16649699
16474687
17614320
16646763
17400177
18820503
40158939
16407252
16452609
16633958
16542195
16668829
17525273
16440368
16401737
16758388
16668778
17933450
17527499
17531615
17840584
16575898
16450150
17520958
17633114
16609754
17525733
17526987
16656596
16423540
16594632
18077041
16409301
02603355
16636078
16528173
17610117
16475660
16491980
16523819
17875754
16417950
16424032
16471463
41371834
42824947
18091444
25632246
40073474
16412266
02641407
16708596
16628464
17526418
16561069
16408406
17870373
17820946
17531178
16443174
16778311
16487511
16707611
18856845
16476152
16523098
16537735
17539240
16538219
18005964
17898187
16796041
03701836
16406409
16527930
16625079
16748071
20009053
17831495
16550992
17806155
41258280
17528838
16424814
16491942
16665700
17626890
16423139
27849968
16453030
16477959
16465226
16475526
16519474
17612431
16655814
16500982
16644857
16778525
17640067
08068320
16471571
17636159
16583112
17534429
41812294
16464600
16614946
16510217
16419210
16579671
17928747
17535867
16738360
16476009
16502269
17940814
16480863
16771122
16576966
16490896
18034167
18038464
16658406
16522037
16635450
41252761
16776179
18007486
16427868
07197464
17578166
16559623
16679048
16730977
16761054
16666154
17400198
17896352
17448558
16463336
16720105
16705098
16581832
16724468
16636049
17523036
16460003
18180224
16778911
17538445
16440693
17535368
17545801
17911200
16527442
27836254
16426097
17633734
17536483
16429683
17623262
16423269
17531294
17538221
16734323
16407133
16710275
16644934
17520777
17632712
02602714
02771070
16632739
16415433
16490410
16409878
16719050
16486578
17536059
16591487
16459753
16759286
16732082
16420026
16762629
17523078
41400875
16673732
16642263
16502764
16439415
16642438
16738707
16449388
16502376
16402634
16477241
16410934
16721885
27417586
16524905
16439676
16692431
16702085
18036345
18080838
42292166
16574029
17448329
16690047
17847927
16651697
16496694
16475411
16502387
16412047
16641632
16496924
02895975
18851766
16673939
17628955
17918783
17828487
16471724
16790635
06753227
16674409
16717150
16412275
17818598
16643837
17530351
16458010
16729837
16477153
16701959
16494424
16720146
19321961
16457360
16419234
17640685
16471231
16617775
21520450
41594984
16453781
16470196
18068078
40033164
16491879
17845218
17415271
08741520
17623016
40866057
16408419
16538022
16487496
16623309
17939636
17531022
16551767
41004147
16466058
16703734
16623859
17529309
16472546
16400507
41385979
17533975
17603016
16751260
16586707
16571279
40997649
16654135
16768861
16727994
26728050
19184412
16638382
16491940
17436481
17586897
16725532
16802184
16680503
16770664
16759264
17875250
16464842
16466109
41564701
17806619
16718357
16517955
17594217
32802095
16413465
16618463
16670066
16712436
16659048
17819977
17533030
16498315
16480676
16802175
17892152
17610776
16462782
16422747
16790017
18213780
16487705
16415746
16791060
16652754
16620941
16410806
16576786
16775809
17628559
17843016
16676879
17414743
16721819
16480348
17982377
16537595
16722595
16463029
16659492
18055367
16546924
16718011
17520370
16690483
17433542
16633754
17830721
17628708
43440874
17629464
17892785
27858646
16654541
16412559
16655397
16424601
16591532
16776183
17536800
17576811
16413345
19079848
08467281
16423071
17609739
16733316
17533942
16719269
16756765
16484944
40600973
16703920
16693112
17812255
17629546
16623450
17614488
17432231
17619542
16449697
18143485
16755686
16795425
16730587
16635490
18108810
17612536
16460970
16465401
40989347
16468732
16484315
17450122
16477775
16438854
16635752
16431654
40774977
16485908
16796563
16431541
17628890
16607342
16681654
10476757
18022248
16739780
17530900
16674628
16404201
02838694
41221278
16772407
16496603
17408071
16483760
18161465
18158960
23006439
16419204
16481124
16620328
16658113
16677372
16594236
16743978
17568506
16770097
17537069
16581951
07394041
07904813
16647237
16483687
16497176
16452650
17414358
16441663
16669649
40267883
16524459
16657697
41747228
18059808
07949823
17558431
16436831
17526546
16477908
19211473
16429325
17900167
16497733
19197055
16769678
16486277
16782532
17531925
17538213
29270773
16425252
16419768
07913925
17628607
16545101
16591256
16617329
16533586
16491668
16681280
16720444
16532032
16539420
16505740
17535696
16540785
06089150
17403791
16766270
16455717
09270679
17523422
16593733
16686336
17526544
16438208
16656814
17628889
16688697
16415727
16650844
16720979
17610143
16641407
16641406
16430513
40388780
16783242
17879097
16675757
16720937
16755316
16725584
16721830
17925375
19212014
19216121
16463076
16431890
16655482
16771016
16690429
16680698
16710447
16725113
16652838
17451960
16536860
17450393
06015835
40183040
16445188
17530101
16563385
16403327
17531144
17403401
16652868
16436094
16453015
16459097
16505773
16727517
17622848
16704678
16719703
16519286
16769559
16691978
16411690
17924702
16426145
16468771
16650828
16778782
16477413
17623118
16650200
16496739
16720594
06712603
44055372
16406054
41465042
16448233
10797975
16476151
16620898
25586864
16762652
16400155
18124083
16796176
16668773
26607064
17863503
16734709
16764506
18040331
17625469
16640178
16424463
16410310
17807270
16422075
16435981
16440129
16476663
16419093
16472167
03700742
18024486
17537910
17895023
17935127
17623333
16711840
17610196
16600649
16563325
17909361
16543938
06434236
16720249
16628077
16644397
16806535
16616940
17809051
17449592
18134651
45474367
16495067
16723985
16449347
16477905
16769231
16689184
16433580
17607874
17615085
16428219
16596145
09922587
16492880
16426643
40643581
16716243
16636112
17407478
16437487
17542256
18109914
16689945
17842826
16406056
17894211
16603746
16534083
16526985
16668408
16586199
16466344
17899515
16742683
16697186
16467066
09866598
19212015
16495101
16403958
16633387
42249955
16688711
26675868
16675190
16433187
41010050
16537794
16713673
17628143
16756567
16702377
16493407
16410639
17927301
16688904
16472587
16621586
16769130
16505086
16487794
16700997
16573932
16429688
17536307
16733574
16484422
17532524
16703105
16698092
16748513
16529475
16524837
16525869
16525874
16497905
16632040
33812802
16779034
16419345
16644658
16469407
16625107
17524406
16482709
16470634
16792907
16770861
16739789
16165943
16699530
19206132
06683048
16654922
80103991
41335642
17529675
16467652
16437453
17523102
16732107
17536656
18006325
16667328
16788868
16645404
16455600
16719392
16698898
17521139
17537299
17535792
17522236
\.


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY semestre (descripcion, fechaini_semes, fechafin_semes, estado, codigo) FROM stdin;
2016-I	2016-04-18	2016-04-21	INACTIVO	1
2016-II	2016-04-22	2016-04-23	INACTIVO	2
2016-III	2016-04-24	2016-04-27	ACTIVO	3
\.


--
-- Name: semestre_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('semestre_codigo_seq', 3, true);


--
-- Name: asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id_asignatura);


--
-- Name: aula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (id_aula);


--
-- Name: capacitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY capacitacion
    ADD CONSTRAINT capacitacion_pkey PRIMARY KEY (id_capa);


--
-- Name: conocimientosinfor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conocimientosinfor
    ADD CONSTRAINT conocimientosinfor_pkey PRIMARY KEY (id_ci);


--
-- Name: cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cronograma
    ADD CONSTRAINT cronograma_pkey PRIMARY KEY (id_cron);


--
-- Name: disponibilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disponibilidad
    ADD CONSTRAINT disponibilidad_pkey PRIMARY KEY (id_dispo);


--
-- Name: experienciadocente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY experienciadocente
    ADD CONSTRAINT experienciadocente_pkey PRIMARY KEY (id_experiencia);


--
-- Name: filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (id_filiar);


--
-- Name: formacionacademica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formacionacademica
    ADD CONSTRAINT formacionacademica_pkey PRIMARY KEY (id_formacion);


--
-- Name: grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id_grupo);


--
-- Name: horacurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horacurso
    ADD CONSTRAINT horacurso_pkey PRIMARY KEY (id_horacurso);


--
-- Name: horarioxdia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY horarioxdia
    ADD CONSTRAINT horarioxdia_pkey PRIMARY KEY (id_horarioxdia);


--
-- Name: maestriadoctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY maestriadoctor
    ADD CONSTRAINT maestriadoctor_pkey PRIMARY KEY (id_maestriadoc);


--
-- Name: modalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modalidad
    ADD CONSTRAINT modalidad_pkey PRIMARY KEY (id_mod);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- Name: pk_docente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT pk_docente PRIMARY KEY (id_docente);


--
-- Name: pkdias; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dias
    ADD CONSTRAINT pkdias PRIMARY KEY (id_dia);


--
-- Name: planacademico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY planacademico
    ADD CONSTRAINT planacademico_pkey PRIMARY KEY (id_planaca);


--
-- Name: profesoresunprg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profesoresunprg
    ADD CONSTRAINT profesoresunprg_pkey PRIMARY KEY (dni);


--
-- Name: semestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT semestre_pkey PRIMARY KEY (codigo);


--
-- Name: fk_asignatura_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asignatura
    ADD CONSTRAINT fk_asignatura_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: fk_aula_filial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT fk_aula_filial FOREIGN KEY (id_filial) REFERENCES filial(id_filiar);


--
-- Name: fk_aula_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT fk_aula_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: fk_cap_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY capacitacion
    ADD CONSTRAINT fk_cap_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_ci_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conocimientosidiomas
    ADD CONSTRAINT fk_ci_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_cif_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conocimientosinfor
    ADD CONSTRAINT fk_cif_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_cronograma_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronograma
    ADD CONSTRAINT fk_cronograma_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: fk_diasxturno_dias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diasxturno
    ADD CONSTRAINT fk_diasxturno_dias FOREIGN KEY (id_dia) REFERENCES dias(id_dia);


--
-- Name: fk_diasxturno_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diasxturno
    ADD CONSTRAINT fk_diasxturno_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: fk_disponibilidad_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disponibilidad
    ADD CONSTRAINT fk_disponibilidad_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_disponibilidad_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disponibilidad
    ADD CONSTRAINT fk_disponibilidad_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(codigo);


--
-- Name: fk_docente_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT fk_docente_persona FOREIGN KEY (id_persona) REFERENCES persona(id_persona);


--
-- Name: fk_ed_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experienciadocente
    ADD CONSTRAINT fk_ed_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_fa_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacionacademica
    ADD CONSTRAINT fk_fa_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_filiar_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filial
    ADD CONSTRAINT fk_filiar_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: fk_horacurso_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horacurso
    ADD CONSTRAINT fk_horacurso_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);


--
-- Name: fk_hxd_dia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horarioxdia
    ADD CONSTRAINT fk_hxd_dia FOREIGN KEY (id_dia) REFERENCES dias(id_dia);


--
-- Name: fk_hxd_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY horarioxdia
    ADD CONSTRAINT fk_hxd_semestre FOREIGN KEY (id_semestre) REFERENCES semestre(codigo);


--
-- Name: fk_md_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY maestriadoctor
    ADD CONSTRAINT fk_md_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: fk_persona_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);


--
-- Name: fk_planacademico_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planacademico
    ADD CONSTRAINT fk_planacademico_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);


--
-- Name: fk_planacademico_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planacademico
    ADD CONSTRAINT fk_planacademico_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo);


--
-- Name: fk_planacademico_modalidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planacademico
    ADD CONSTRAINT fk_planacademico_modalidad FOREIGN KEY (id_mod) REFERENCES modalidad(id_mod);


--
-- Name: fk_planacademico_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY planacademico
    ADD CONSTRAINT fk_planacademico_semestre FOREIGN KEY (codigo) REFERENCES semestre(codigo);


--
-- Name: id_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY otro_dato
    ADD CONSTRAINT id_docente FOREIGN KEY (id_docente) REFERENCES docente(id_docente);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

