

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12429)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 583 (class 1247 OID 32908)
-- Name: permissoes; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE permissoes AS ENUM (
    'Administrador',
    'Colaborador'
);


ALTER TYPE permissoes OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 33337)
-- Name: conta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conta (
    numero bigint NOT NULL,
    criador bytea,
    data_alteracao date,
    data_cadastro date,
    descricao character varying(255),
    nome character varying(255),
    saldo double precision,
    criador_id bigint,
    ultimo_alterador bigint,
    ultimoalterador bytea
);


ALTER TABLE conta OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33383)
-- Name: conta_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conta_aud (
    numero bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    criador bytea,
    data_alteracao date,
    data_cadastro date,
    descricao character varying(255),
    nome character varying(255),
    saldo double precision,
    ultimo_alterador bytea,
    criador_id bigint,
    ultimoalterador bytea
);


ALTER TABLE conta_aud OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 33343)
-- Name: conta_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conta_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conta_numero_seq OWNER TO postgres;

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 187
-- Name: conta_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conta_numero_seq OWNED BY conta.numero;


--
-- TOC entry 188 (class 1259 OID 33345)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 33391)
-- Name: revinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE revinfo OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33319)
-- Name: schema_version; Type: TABLE; Schema: public; Owner: postgres
--



ALTER TABLE schema_version OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 33347)
-- Name: transacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transacao (
    id bigint NOT NULL,
    data_alteracao date,
    data_cadastro date,
    data_efetivacao date,
    descricao character varying(255),
    efetivado boolean NOT NULL,
    valor double precision NOT NULL,
    conta_destino bigint,
    conta_origem bigint,
    data_vencimento date,
    criador_id bigint,
    efetivador_id bigint,
    filepath character varying(255),
    ultimo_alterador bigint,
    ultimoalterador bytea
);


ALTER TABLE transacao OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 33396)
-- Name: transacao_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transacao_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    criador bytea,
    data_alteracao date,
    data_cadastro date,
    data_efetivacao date,
    data_transacao date,
    descricao character varying(255),
    efetivado boolean,
    efetivador bytea,
    ult_alterador bytea,
    valor double precision,
    conta_destino bigint,
    conta_origem bigint,
    data_vencimento date,
    ultimoalterador bytea,
    criador_id bigint,
    efetivador_id bigint,
    filepath character varying(255),
    ultimo_alterador bigint
);


ALTER TABLE transacao_aud OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 33353)
-- Name: transacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transacao_id_seq OWNER TO postgres;

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 190
-- Name: transacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transacao_id_seq OWNED BY transacao.id;


--
-- TOC entry 191 (class 1259 OID 33355)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    ativo boolean NOT NULL,
    celular character varying(255),
    cpf character varying(255),
    data_alteracao date,
    data_cadastro date,
    email character varying(255),
    endereco character varying(255),
    nome character varying(255),
    permissoes character varying(255),
    senha character varying(255),
    criador_id bigint,
    ultimo_alterador bigint,
    ultimoalterador bytea
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 33404)
-- Name: usuario_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    ativo boolean,
    celular character varying(255),
    cpf character varying(255),
    criador bytea,
    data_alteracao date,
    data_cadastro date,
    email character varying(255),
    endereco character varying(255),
    nome character varying(255),
    permissoes character varying(255),
    senha character varying(255),
    ultimo_alterador bytea,
    pesocpf bytea,
    confirmsenha character varying(255),
    criador_id bigint,
    ultimoalterador bytea
);


ALTER TABLE usuario_aud OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 33361)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 192
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 2086 (class 2604 OID 33363)
-- Name: conta numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta ALTER COLUMN numero SET DEFAULT nextval('conta_numero_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 33364)
-- Name: transacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao ALTER COLUMN id SET DEFAULT nextval('transacao_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 33365)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2099 (class 2606 OID 33390)
-- Name: conta_aud conta_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta_aud
    ADD CONSTRAINT conta_aud_pkey PRIMARY KEY (numero, rev);


--
-- TOC entry 2093 (class 2606 OID 33367)
-- Name: conta conta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (numero);


--
-- TOC entry 2101 (class 2606 OID 33395)
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 2090 (class 2606 OID 33327)
-- Name: schema_version schema_version_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schema_version
    ADD CONSTRAINT schema_version_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 2103 (class 2606 OID 33403)
-- Name: transacao_aud transacao_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao_aud
    ADD CONSTRAINT transacao_aud_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 2095 (class 2606 OID 33369)
-- Name: transacao transacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT transacao_pkey PRIMARY KEY (id);


--
-- TOC entry 2105 (class 2606 OID 33411)
-- Name: usuario_aud usuario_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_aud
    ADD CONSTRAINT usuario_aud_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 2097 (class 2606 OID 33371)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2091 (class 1259 OID 33328)
-- Name: schema_version_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_s_idx ON schema_version USING btree (success);


--
-- TOC entry 2114 (class 2606 OID 33551)
-- Name: usuario fk1nokeo0oogfjn1qp3u52ghiv0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk1nokeo0oogfjn1qp3u52ghiv0 FOREIGN KEY (ultimo_alterador) REFERENCES usuario(id);


--
-- TOC entry 2116 (class 2606 OID 33417)
-- Name: transacao_aud fk27h7b79j35hxdq9p250jvpiju; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao_aud
    ADD CONSTRAINT fk27h7b79j35hxdq9p250jvpiju FOREIGN KEY (rev) REFERENCES revinfo(rev);


--
-- TOC entry 2107 (class 2606 OID 33536)
-- Name: conta fk2vbxa7sww3kqq6m2uhaouvr0c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT fk2vbxa7sww3kqq6m2uhaouvr0c FOREIGN KEY (ultimo_alterador) REFERENCES usuario(id);


--
-- TOC entry 2112 (class 2606 OID 33556)
-- Name: transacao fk3iwyqcxnn05a3heg63svcavne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT fk3iwyqcxnn05a3heg63svcavne FOREIGN KEY (ultimo_alterador) REFERENCES usuario(id);


--
-- TOC entry 2110 (class 2606 OID 33510)
-- Name: transacao fk3nektm7v7pk150nuqudxyi2ok; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT fk3nektm7v7pk150nuqudxyi2ok FOREIGN KEY (criador_id) REFERENCES usuario(id);


--
-- TOC entry 2113 (class 2606 OID 33546)
-- Name: usuario fk7n8ptg8x9n6p7x0bs11a8rkw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk7n8ptg8x9n6p7x0bs11a8rkw9 FOREIGN KEY (criador_id) REFERENCES usuario(id);


--
-- TOC entry 2117 (class 2606 OID 33422)
-- Name: usuario_aud fkb4udgpaafsx6ibss7hbbbb100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_aud
    ADD CONSTRAINT fkb4udgpaafsx6ibss7hbbbb100 FOREIGN KEY (rev) REFERENCES revinfo(rev);


--
-- TOC entry 2115 (class 2606 OID 33412)
-- Name: conta_aud fkblarahfmmb4s65fq7wl39sebb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta_aud
    ADD CONSTRAINT fkblarahfmmb4s65fq7wl39sebb FOREIGN KEY (rev) REFERENCES revinfo(rev);


--
-- TOC entry 2108 (class 2606 OID 33372)
-- Name: transacao fkknuq5yi1h2sjspj0hd82s6m90; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT fkknuq5yi1h2sjspj0hd82s6m90 FOREIGN KEY (conta_origem) REFERENCES conta(numero);


--
-- TOC entry 2111 (class 2606 OID 33515)
-- Name: transacao fkl67b3gxc4nt72vualicqux40v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT fkl67b3gxc4nt72vualicqux40v FOREIGN KEY (efetivador_id) REFERENCES usuario(id);


--
-- TOC entry 2106 (class 2606 OID 33505)
-- Name: conta fkm753i9s68b8uu8n3x875vb4ns; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT fkm753i9s68b8uu8n3x875vb4ns FOREIGN KEY (criador_id) REFERENCES usuario(id);


--
-- TOC entry 2109 (class 2606 OID 33377)
-- Name: transacao fkrqm4qdce8dn0ivswg0pg9rt4i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transacao
    ADD CONSTRAINT fkrqm4qdce8dn0ivswg0pg9rt4i FOREIGN KEY (conta_destino) REFERENCES conta(numero);


-- Completed on 2017-07-11 17:11:51 BRT

--
-- PostgreSQL database dump complete
--
