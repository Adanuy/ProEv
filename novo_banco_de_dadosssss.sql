-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.2
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: novo_banco_de_dados | type: DATABASE --
-- CREATE DATABASE novo_banco_de_dados
-- ;
-- -- ddl-end --
-- 

-- object: public.participante | type: TABLE --
CREATE TABLE public.participante(
	id_part integer,
	nome_part character(30),
	cpf_part integer,
	cep_part character varying(10),
	cidade_part character(20),
	bairro_part character varying(20),
	end_part character varying(30),
	pref_curso_part character varying(25),
	tel_part character varying(15),
	email_part character varying(40),
	senha_part character varying(10),
	CONSTRAINT id_part PRIMARY KEY (id_part)

);
-- ddl-end --
-- object: public.coordenador | type: TABLE --
CREATE TABLE public.coordenador(
	id_coord integer,
	nome_coord character(40),
	cpf_coord integer,
	curso_resp_coord character(20),
	email_coord character varying(40),
	senha_coord character varying(10),
	conf_senha_coord character varying(10),
	"id_inst_instituição" integer,
	CONSTRAINT id_coord PRIMARY KEY (id_coord)

);
-- ddl-end --
-- object: public.administrador | type: TABLE --
CREATE TABLE public.administrador(
	id_admin integer,
	nome_admin character(20),
	cpf_admin integer,
	senha_admin character varying(10),
	"id_inst_instituição" integer,
	CONSTRAINT id_admin PRIMARY KEY (id_admin)

);
-- ddl-end --
-- object: public."instituição" | type: TABLE --
CREATE TABLE public."instituição"(
	id_inst integer,
	nome_inst character varying,
	cep_inst character varying(10),
	cidade_inst character(20),
	bairro_inst character(10),
	end_inst character varying(20),
	tel_inst character varying(15),
	email_inst character varying(40),
	status_inst boolean,
	CONSTRAINT id_inst PRIMARY KEY (id_inst)

);
-- ddl-end --
-- object: public.curso | type: TABLE --
CREATE TABLE public.curso(
	id_curso integer,
	nome_curso character varying(20),
	descricao_curso character varying(300),
	"id_inst_instituição" integer,
	id_coord_coordenador integer,
	CONSTRAINT id_curso PRIMARY KEY (id_curso)

);
-- ddl-end --
-- object: public.evento | type: TABLE --
CREATE TABLE public.evento(
	id_evento integer,
	nome_palestrante character varying(50),
	nome_evento character(30),
	data_inic_evento date,
	data_fim_evento date,
	hora_inic_evento date,
	hora_fim_evento date,
	descricao_evento character varying(500),
	quant_part_evento integer,
	quant_atual_part integer,
	id_part_participante integer,
	"id_inst_instituição" integer,
	id_certificado_cadast_certificado_cadast integer,
	CONSTRAINT id_evento PRIMARY KEY (id_evento)

);
-- ddl-end --
-- object: public.certificado | type: TABLE --
CREATE TABLE public.certificado(
	id_cert integer,
	id_part_participante integer,
	pdf_cert oid,
	CONSTRAINT id_cert PRIMARY KEY (id_cert)

);
-- ddl-end --
-- object: "instituição_fk" | type: CONSTRAINT --
ALTER TABLE public.curso ADD CONSTRAINT "instituição_fk" FOREIGN KEY ("id_inst_instituição")
REFERENCES public."instituição" (id_inst) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "instituição_fk" | type: CONSTRAINT --
ALTER TABLE public.coordenador ADD CONSTRAINT "instituição_fk" FOREIGN KEY ("id_inst_instituição")
REFERENCES public."instituição" (id_inst) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: participante_fk | type: CONSTRAINT --
ALTER TABLE public.evento ADD CONSTRAINT participante_fk FOREIGN KEY (id_part_participante)
REFERENCES public.participante (id_part) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "instituição_fk" | type: CONSTRAINT --
ALTER TABLE public.evento ADD CONSTRAINT "instituição_fk" FOREIGN KEY ("id_inst_instituição")
REFERENCES public."instituição" (id_inst) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: "instituição_fk" | type: CONSTRAINT --
ALTER TABLE public.administrador ADD CONSTRAINT "instituição_fk" FOREIGN KEY ("id_inst_instituição")
REFERENCES public."instituição" (id_inst) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: administrador_uq | type: CONSTRAINT --
ALTER TABLE public.administrador ADD CONSTRAINT administrador_uq UNIQUE ("id_inst_instituição");
-- ddl-end --


-- object: coordenador_fk | type: CONSTRAINT --
ALTER TABLE public.curso ADD CONSTRAINT coordenador_fk FOREIGN KEY (id_coord_coordenador)
REFERENCES public.coordenador (id_coord) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public.certificado_cadast | type: TABLE --
CREATE TABLE public.certificado_cadast(
	id_certificado_cadast integer,
	descri_certificado character varying(500),
	assinat_certificado oid,
	CONSTRAINT certificado_cadast PRIMARY KEY (id_certificado_cadast)

);
-- ddl-end --
-- object: certificado_cadast_fk | type: CONSTRAINT --
ALTER TABLE public.evento ADD CONSTRAINT certificado_cadast_fk FOREIGN KEY (id_certificado_cadast_certificado_cadast)
REFERENCES public.certificado_cadast (id_certificado_cadast) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: evento_uq | type: CONSTRAINT --
ALTER TABLE public.evento ADD CONSTRAINT evento_uq UNIQUE (id_certificado_cadast_certificado_cadast);
-- ddl-end --


-- object: participante_fk | type: CONSTRAINT --
ALTER TABLE public.certificado ADD CONSTRAINT participante_fk FOREIGN KEY (id_part_participante)
REFERENCES public.participante (id_part) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --


-- object: public.credencial | type: TABLE --
CREATE TABLE public.credencial(
	id_cred integer,
	pdf_cred oid,
	id_part_participante integer,
	CONSTRAINT credencial PRIMARY KEY (id_cred)

);
-- ddl-end --
-- object: participante_fk | type: CONSTRAINT --
ALTER TABLE public.credencial ADD CONSTRAINT participante_fk FOREIGN KEY (id_part_participante)
REFERENCES public.participante (id_part) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE NOT DEFERRABLE;
-- ddl-end --



