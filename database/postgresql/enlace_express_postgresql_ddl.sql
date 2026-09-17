--
-- PostgreSQL database dump
--

\restrict 8mU6JGVwsJ3rVPaAAkjQHIHn38KTILbSUUKJdLU8wWrnTOjjtRnFYfuMDzhhax2

-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11 (Debian 17.11-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: estado_envio; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_envio AS ENUM (
    'CREADO',
    'ASIGNADO',
    'EN_RECOGIDA',
    'EN_TRANSITO',
    'EN_ENTREGA',
    'ENTREGADO',
    'CANCELADO',
    'CON_NOVEDAD'
);


ALTER TYPE public.estado_envio OWNER TO postgres;

--
-- Name: estado_factura; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_factura AS ENUM (
    'PENDIENTE',
    'EMITIDA',
    'PAGADA',
    'ANULADA',
    'VENCIDA'
);


ALTER TYPE public.estado_factura OWNER TO postgres;

--
-- Name: estado_paquete; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_paquete AS ENUM (
    'REGISTRADO',
    'EN_TRANSITO',
    'ENTREGADO',
    'DEVUELTO',
    'CON_NOVEDAD'
);


ALTER TYPE public.estado_paquete OWNER TO postgres;

--
-- Name: estado_recurso; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_recurso AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public.estado_recurso OWNER TO postgres;

--
-- Name: estado_rol; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_rol AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public.estado_rol OWNER TO postgres;

--
-- Name: estado_usuario; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_usuario AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public.estado_usuario OWNER TO postgres;

--
-- Name: prioridad_envio; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.prioridad_envio AS ENUM (
    'BAJA',
    'NORMAL',
    'ALTA',
    'URGENTE'
);


ALTER TYPE public.prioridad_envio OWNER TO postgres;

--
-- Name: tipo_prueba_entrega; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_prueba_entrega AS ENUM (
    'FIRMA',
    'FOTO',
    'DOCUMENTO',
    'CODIGO',
    'OTRA'
);


ALTER TYPE public.tipo_prueba_entrega OWNER TO postgres;

--
-- Name: actualizar_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.actualizar_updated_at() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auditoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditoria (
    id integer NOT NULL,
    tabla_afectada character varying(100) NOT NULL,
    registro_id integer NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(255),
    fecha_evento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.auditoria OWNER TO postgres;

--
-- Name: auditoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auditoria ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contactos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(255),
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contactos OWNER TO postgres;

--
-- Name: contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.contactos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: direcciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direcciones (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(255) NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.direcciones OWNER TO postgres;

--
-- Name: direcciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.direcciones ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresas (
    id integer NOT NULL,
    nit character varying(30) NOT NULL,
    razon_social character varying(150) NOT NULL,
    contacto_principal character varying(150) NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.empresas OWNER TO postgres;

--
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.empresas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: envios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.envios (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    mensajero_id integer,
    ruta_id integer,
    tarifa_id integer,
    direccion_recogida_id integer NOT NULL,
    direccion_entrega_id integer NOT NULL,
    referencia character varying(100) NOT NULL,
    descripcion character varying(255),
    estado public.estado_envio DEFAULT 'CREADO'::public.estado_envio NOT NULL,
    prioridad public.prioridad_envio DEFAULT 'NORMAL'::public.prioridad_envio NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_entrega timestamp without time zone,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.envios OWNER TO postgres;

--
-- Name: envios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.envios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.envios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: eventos_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventos_tracking (
    id integer NOT NULL,
    envio_id integer NOT NULL,
    mensajero_id integer,
    estado public.estado_envio NOT NULL,
    descripcion character varying(255),
    latitud numeric(10,7),
    longitud numeric(10,7),
    fecha_evento timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.eventos_tracking OWNER TO postgres;

--
-- Name: eventos_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.eventos_tracking ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.eventos_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id integer NOT NULL,
    empresa_id integer NOT NULL,
    envio_id integer,
    numero_factura character varying(50) NOT NULL,
    subtotal numeric(12,2) DEFAULT 0.00 NOT NULL,
    impuesto numeric(12,2) DEFAULT 0.00 NOT NULL,
    total numeric(12,2) DEFAULT 0.00 NOT NULL,
    estado public.estado_factura DEFAULT 'PENDIENTE'::public.estado_factura NOT NULL,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_vencimiento timestamp without time zone,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.facturas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mensajeros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajeros (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(255),
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mensajeros OWNER TO postgres;

--
-- Name: mensajeros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mensajeros ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mensajeros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paquetes (
    id integer NOT NULL,
    envio_id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion character varying(255),
    peso numeric(10,2) NOT NULL,
    largo numeric(10,2),
    ancho numeric(10,2),
    alto numeric(10,2),
    tipo_contenido character varying(100),
    estado public.estado_paquete DEFAULT 'REGISTRADO'::public.estado_paquete NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.paquetes OWNER TO postgres;

--
-- Name: paquetes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.paquetes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.paquetes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pruebas_entrega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pruebas_entrega (
    id integer NOT NULL,
    envio_id integer NOT NULL,
    tipo_prueba public.tipo_prueba_entrega NOT NULL,
    referencia_archivo character varying(255),
    observacion character varying(255),
    nombre_receptor character varying(150),
    documento_receptor character varying(50),
    fecha_prueba timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pruebas_entrega OWNER TO postgres;

--
-- Name: pruebas_entrega_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pruebas_entrega ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pruebas_entrega_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(500) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.refresh_tokens OWNER TO postgres;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.refresh_tokens ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: resource_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_roles (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    role_id integer NOT NULL,
    is_active public.estado_recurso DEFAULT 'ACTIVE'::public.estado_recurso NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.resource_roles OWNER TO postgres;

--
-- Name: resource_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.resource_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resource_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    method character varying(20) NOT NULL,
    is_active public.estado_recurso DEFAULT 'ACTIVE'::public.estado_recurso NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.resources ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_users (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    is_active public.estado_rol DEFAULT 'ACTIVE'::public.estado_rol NOT NULL
);


ALTER TABLE public.role_users OWNER TO postgres;

--
-- Name: role_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.role_users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_active public.estado_rol DEFAULT 'ACTIVE'::public.estado_rol NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
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
-- Name: rutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rutas (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(255),
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.rutas OWNER TO postgres;

--
-- Name: rutas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rutas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rutas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tarifas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifas (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    regla_calculo character varying(255) NOT NULL,
    valor_base numeric(12,2) NOT NULL,
    vigencia_desde date NOT NULL,
    vigencia_hasta date,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL
);


ALTER TABLE public.tarifas OWNER TO postgres;

--
-- Name: tarifas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tarifas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tarifas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    is_active public.estado_usuario DEFAULT 'ACTIVE'::public.estado_usuario NOT NULL,
    avatar character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
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
-- Name: auditoria auditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id);


--
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id);


--
-- Name: empresas empresas_nit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_nit_key UNIQUE (nit);


--
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- Name: envios envios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_pkey PRIMARY KEY (id);


--
-- Name: envios envios_referencia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_referencia_key UNIQUE (referencia);


--
-- Name: eventos_tracking eventos_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_tracking
    ADD CONSTRAINT eventos_tracking_pkey PRIMARY KEY (id);


--
-- Name: facturas facturas_numero_factura_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_numero_factura_key UNIQUE (numero_factura);


--
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- Name: mensajeros mensajeros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajeros
    ADD CONSTRAINT mensajeros_pkey PRIMARY KEY (id);


--
-- Name: paquetes paquetes_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_codigo_key UNIQUE (codigo);


--
-- Name: paquetes paquetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_pkey PRIMARY KEY (id);


--
-- Name: pruebas_entrega pruebas_entrega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pruebas_entrega
    ADD CONSTRAINT pruebas_entrega_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_key UNIQUE (token);


--
-- Name: resource_roles resource_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_roles
    ADD CONSTRAINT resource_roles_pkey PRIMARY KEY (id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: role_users role_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT role_users_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rutas rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id);


--
-- Name: tarifas tarifas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifas
    ADD CONSTRAINT tarifas_pkey PRIMARY KEY (id);


--
-- Name: resource_roles uq_resource_roles_resource_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_roles
    ADD CONSTRAINT uq_resource_roles_resource_role UNIQUE (resource_id, role_id);


--
-- Name: resources uq_resources_path_method; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT uq_resources_path_method UNIQUE (path, method);


--
-- Name: role_users uq_role_users_role_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT uq_role_users_role_user UNIQUE (role_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_contactos_empresa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contactos_empresa_id ON public.contactos USING btree (empresa_id);


--
-- Name: idx_direcciones_empresa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_direcciones_empresa_id ON public.direcciones USING btree (empresa_id);


--
-- Name: idx_envios_direccion_entrega_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_direccion_entrega_id ON public.envios USING btree (direccion_entrega_id);


--
-- Name: idx_envios_direccion_recogida_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_direccion_recogida_id ON public.envios USING btree (direccion_recogida_id);


--
-- Name: idx_envios_empresa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_empresa_id ON public.envios USING btree (empresa_id);


--
-- Name: idx_envios_mensajero_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_mensajero_id ON public.envios USING btree (mensajero_id);


--
-- Name: idx_envios_ruta_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_ruta_id ON public.envios USING btree (ruta_id);


--
-- Name: idx_envios_tarifa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_envios_tarifa_id ON public.envios USING btree (tarifa_id);


--
-- Name: idx_eventos_tracking_envio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_eventos_tracking_envio_id ON public.eventos_tracking USING btree (envio_id);


--
-- Name: idx_eventos_tracking_mensajero_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_eventos_tracking_mensajero_id ON public.eventos_tracking USING btree (mensajero_id);


--
-- Name: idx_facturas_empresa_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_facturas_empresa_id ON public.facturas USING btree (empresa_id);


--
-- Name: idx_facturas_envio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_facturas_envio_id ON public.facturas USING btree (envio_id);


--
-- Name: idx_paquetes_envio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_paquetes_envio_id ON public.paquetes USING btree (envio_id);


--
-- Name: idx_pruebas_entrega_envio_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pruebas_entrega_envio_id ON public.pruebas_entrega USING btree (envio_id);


--
-- Name: idx_refresh_tokens_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_refresh_tokens_user_id ON public.refresh_tokens USING btree (user_id);


--
-- Name: idx_resource_roles_resource_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_resource_roles_resource_id ON public.resource_roles USING btree (resource_id);


--
-- Name: idx_resource_roles_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_resource_roles_role_id ON public.resource_roles USING btree (role_id);


--
-- Name: idx_role_users_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_users_user_id ON public.role_users USING btree (user_id);


--
-- Name: contactos trg_contactos_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_contactos_updated_at BEFORE UPDATE ON public.contactos FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: direcciones trg_direcciones_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_direcciones_updated_at BEFORE UPDATE ON public.direcciones FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: empresas trg_empresas_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_empresas_updated_at BEFORE UPDATE ON public.empresas FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: envios trg_envios_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_envios_updated_at BEFORE UPDATE ON public.envios FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: facturas trg_facturas_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_facturas_updated_at BEFORE UPDATE ON public.facturas FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: mensajeros trg_mensajeros_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_mensajeros_updated_at BEFORE UPDATE ON public.mensajeros FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: paquetes trg_paquetes_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_paquetes_updated_at BEFORE UPDATE ON public.paquetes FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: resource_roles trg_resource_roles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_resource_roles_updated_at BEFORE UPDATE ON public.resource_roles FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: resources trg_resources_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_resources_updated_at BEFORE UPDATE ON public.resources FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: rutas trg_rutas_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_rutas_updated_at BEFORE UPDATE ON public.rutas FOR EACH ROW EXECUTE FUNCTION public.actualizar_updated_at();


--
-- Name: contactos contactos_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_empresa_fk FOREIGN KEY (empresa_id) REFERENCES public.empresas(id);


--
-- Name: direcciones direcciones_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_empresa_fk FOREIGN KEY (empresa_id) REFERENCES public.empresas(id);


--
-- Name: envios envios_direccion_entrega_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_direccion_entrega_fk FOREIGN KEY (direccion_entrega_id) REFERENCES public.direcciones(id);


--
-- Name: envios envios_direccion_recogida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_direccion_recogida_fk FOREIGN KEY (direccion_recogida_id) REFERENCES public.direcciones(id);


--
-- Name: envios envios_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_empresa_fk FOREIGN KEY (empresa_id) REFERENCES public.empresas(id);


--
-- Name: envios envios_mensajero_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_mensajero_fk FOREIGN KEY (mensajero_id) REFERENCES public.mensajeros(id);


--
-- Name: envios envios_ruta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_ruta_fk FOREIGN KEY (ruta_id) REFERENCES public.rutas(id);


--
-- Name: envios envios_tarifa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_tarifa_fk FOREIGN KEY (tarifa_id) REFERENCES public.tarifas(id);


--
-- Name: eventos_tracking eventos_tracking_envio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_tracking
    ADD CONSTRAINT eventos_tracking_envio_fk FOREIGN KEY (envio_id) REFERENCES public.envios(id);


--
-- Name: eventos_tracking eventos_tracking_mensajero_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos_tracking
    ADD CONSTRAINT eventos_tracking_mensajero_fk FOREIGN KEY (mensajero_id) REFERENCES public.mensajeros(id);


--
-- Name: facturas facturas_empresa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_empresa_fk FOREIGN KEY (empresa_id) REFERENCES public.empresas(id);


--
-- Name: facturas facturas_envio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_envio_fk FOREIGN KEY (envio_id) REFERENCES public.envios(id);


--
-- Name: resource_roles fk_resource_roles_resource; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_roles
    ADD CONSTRAINT fk_resource_roles_resource FOREIGN KEY (resource_id) REFERENCES public.resources(id);


--
-- Name: resource_roles fk_resource_roles_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_roles
    ADD CONSTRAINT fk_resource_roles_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: role_users fk_role_users_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT fk_role_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: role_users fk_role_users_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT fk_role_users_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: paquetes paquetes_envio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT paquetes_envio_fk FOREIGN KEY (envio_id) REFERENCES public.envios(id);


--
-- Name: pruebas_entrega pruebas_entrega_envio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pruebas_entrega
    ADD CONSTRAINT pruebas_entrega_envio_fk FOREIGN KEY (envio_id) REFERENCES public.envios(id);


--
-- Name: refresh_tokens refresh_tokens_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 8mU6JGVwsJ3rVPaAAkjQHIHn38KTILbSUUKJdLU8wWrnTOjjtRnFYfuMDzhhax2

