-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- enlace_express.dbo.auditoria definition

-- Drop table

-- DROP TABLE enlace_express.dbo.auditoria;

CREATE TABLE enlace_express.dbo.auditoria (
	id int IDENTITY(1,1) NOT NULL,
	tabla_afectada varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	registro_id int NOT NULL,
	accion varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fecha_evento datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_auditoria PRIMARY KEY (id)
);


-- enlace_express.dbo.empresas definition

-- Drop table

-- DROP TABLE enlace_express.dbo.empresas;

CREATE TABLE enlace_express.dbo.empresas (
	id int IDENTITY(1,1) NOT NULL,
	nit varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	razon_social varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	contacto_principal varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_empresas PRIMARY KEY (id),
	CONSTRAINT uq_empresas_nit UNIQUE (nit)
);
ALTER TABLE enlace_express.dbo.empresas WITH NOCHECK ADD CONSTRAINT ck_empresas_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.mensajeros definition

-- Drop table

-- DROP TABLE enlace_express.dbo.mensajeros;

CREATE TABLE enlace_express.dbo.mensajeros (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_mensajeros PRIMARY KEY (id)
);
ALTER TABLE enlace_express.dbo.mensajeros WITH NOCHECK ADD CONSTRAINT ck_mensajeros_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.resources definition

-- Drop table

-- DROP TABLE enlace_express.dbo.resources;

CREATE TABLE enlace_express.dbo.resources (
	id int IDENTITY(1,1) NOT NULL,
	[path] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[method] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_resources PRIMARY KEY (id),
	CONSTRAINT uq_resources_path_method UNIQUE ([path],[method])
);
ALTER TABLE enlace_express.dbo.resources WITH NOCHECK ADD CONSTRAINT ck_resources_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.roles definition

-- Drop table

-- DROP TABLE enlace_express.dbo.roles;

CREATE TABLE enlace_express.dbo.roles (
	id int IDENTITY(1,1) NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	CONSTRAINT pk_roles PRIMARY KEY (id),
	CONSTRAINT uq_roles_name UNIQUE (name)
);
ALTER TABLE enlace_express.dbo.roles WITH NOCHECK ADD CONSTRAINT ck_roles_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.rutas definition

-- Drop table

-- DROP TABLE enlace_express.dbo.rutas;

CREATE TABLE enlace_express.dbo.rutas (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_rutas PRIMARY KEY (id)
);
ALTER TABLE enlace_express.dbo.rutas WITH NOCHECK ADD CONSTRAINT ck_rutas_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.tarifas definition

-- Drop table

-- DROP TABLE enlace_express.dbo.tarifas;

CREATE TABLE enlace_express.dbo.tarifas (
	id int IDENTITY(1,1) NOT NULL,
	nombre varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	regla_calculo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	valor_base decimal(12,2) NOT NULL,
	vigencia_desde date NOT NULL,
	vigencia_hasta date NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	CONSTRAINT pk_tarifas PRIMARY KEY (id)
);
ALTER TABLE enlace_express.dbo.tarifas WITH NOCHECK ADD CONSTRAINT ck_tarifas_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.users definition

-- Drop table

-- DROP TABLE enlace_express.dbo.users;

CREATE TABLE enlace_express.dbo.users (
	id int IDENTITY(1,1) NOT NULL,
	username varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	email varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	password varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	avatar varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT pk_users PRIMARY KEY (id),
	CONSTRAINT uq_users_email UNIQUE (email),
	CONSTRAINT uq_users_username UNIQUE (username)
);
ALTER TABLE enlace_express.dbo.users WITH NOCHECK ADD CONSTRAINT ck_users_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.contactos definition

-- Drop table

-- DROP TABLE enlace_express.dbo.contactos;

CREATE TABLE enlace_express.dbo.contactos (
	id int IDENTITY(1,1) NOT NULL,
	empresa_id int NOT NULL,
	nombre varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_contactos PRIMARY KEY (id),
	CONSTRAINT fk_contactos_empresa FOREIGN KEY (empresa_id) REFERENCES enlace_express.dbo.empresas(id)
);
 CREATE NONCLUSTERED INDEX idx_contactos_empresa ON enlace_express.dbo.contactos (  empresa_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.contactos WITH NOCHECK ADD CONSTRAINT ck_contactos_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.direcciones definition

-- Drop table

-- DROP TABLE enlace_express.dbo.direcciones;

CREATE TABLE enlace_express.dbo.direcciones (
	id int IDENTITY(1,1) NOT NULL,
	empresa_id int NOT NULL,
	nombre varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_direcciones PRIMARY KEY (id),
	CONSTRAINT fk_direcciones_empresa FOREIGN KEY (empresa_id) REFERENCES enlace_express.dbo.empresas(id)
);
 CREATE NONCLUSTERED INDEX idx_direcciones_empresa ON enlace_express.dbo.direcciones (  empresa_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.direcciones WITH NOCHECK ADD CONSTRAINT ck_direcciones_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.envios definition

-- Drop table

-- DROP TABLE enlace_express.dbo.envios;

CREATE TABLE enlace_express.dbo.envios (
	id int IDENTITY(1,1) NOT NULL,
	empresa_id int NOT NULL,
	mensajero_id int NULL,
	ruta_id int NULL,
	tarifa_id int NULL,
	direccion_recogida_id int NOT NULL,
	direccion_entrega_id int NOT NULL,
	referencia varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	estado varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'CREADO' NOT NULL,
	prioridad varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'NORMAL' NOT NULL,
	fecha_solicitud datetime2 DEFAULT getdate() NOT NULL,
	fecha_entrega datetime2 NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_envios PRIMARY KEY (id),
	CONSTRAINT uq_envios_referencia UNIQUE (referencia),
	CONSTRAINT fk_envios_direccion_entrega FOREIGN KEY (direccion_entrega_id) REFERENCES enlace_express.dbo.direcciones(id),
	CONSTRAINT fk_envios_direccion_recogida FOREIGN KEY (direccion_recogida_id) REFERENCES enlace_express.dbo.direcciones(id),
	CONSTRAINT fk_envios_empresa FOREIGN KEY (empresa_id) REFERENCES enlace_express.dbo.empresas(id),
	CONSTRAINT fk_envios_mensajero FOREIGN KEY (mensajero_id) REFERENCES enlace_express.dbo.mensajeros(id),
	CONSTRAINT fk_envios_ruta FOREIGN KEY (ruta_id) REFERENCES enlace_express.dbo.rutas(id),
	CONSTRAINT fk_envios_tarifa FOREIGN KEY (tarifa_id) REFERENCES enlace_express.dbo.tarifas(id)
);
 CREATE NONCLUSTERED INDEX idx_envios_direccion_entrega ON enlace_express.dbo.envios (  direccion_entrega_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_envios_direccion_recogida ON enlace_express.dbo.envios (  direccion_recogida_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_envios_empresa ON enlace_express.dbo.envios (  empresa_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_envios_mensajero ON enlace_express.dbo.envios (  mensajero_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_envios_ruta ON enlace_express.dbo.envios (  ruta_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_envios_tarifa ON enlace_express.dbo.envios (  tarifa_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.envios WITH NOCHECK ADD CONSTRAINT ck_envios_estado CHECK (([estado]='CON_NOVEDAD' OR [estado]='CANCELADO' OR [estado]='ENTREGADO' OR [estado]='EN_ENTREGA' OR [estado]='EN_TRANSITO' OR [estado]='EN_RECOGIDA' OR [estado]='ASIGNADO' OR [estado]='CREADO'));
ALTER TABLE enlace_express.dbo.envios WITH NOCHECK ADD CONSTRAINT ck_envios_prioridad CHECK (([prioridad]='URGENTE' OR [prioridad]='ALTA' OR [prioridad]='NORMAL' OR [prioridad]='BAJA'));
ALTER TABLE enlace_express.dbo.envios WITH NOCHECK ADD CONSTRAINT ck_envios_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.eventos_tracking definition

-- Drop table

-- DROP TABLE enlace_express.dbo.eventos_tracking;

CREATE TABLE enlace_express.dbo.eventos_tracking (
	id int IDENTITY(1,1) NOT NULL,
	envio_id int NOT NULL,
	mensajero_id int NULL,
	estado varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	latitud decimal(10,7) NULL,
	longitud decimal(10,7) NULL,
	fecha_evento datetime2 DEFAULT getdate() NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_eventos_tracking PRIMARY KEY (id),
	CONSTRAINT fk_eventos_tracking_envio FOREIGN KEY (envio_id) REFERENCES enlace_express.dbo.envios(id),
	CONSTRAINT fk_eventos_tracking_mensajero FOREIGN KEY (mensajero_id) REFERENCES enlace_express.dbo.mensajeros(id)
);
 CREATE NONCLUSTERED INDEX idx_eventos_tracking_envio ON enlace_express.dbo.eventos_tracking (  envio_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_eventos_tracking_mensajero ON enlace_express.dbo.eventos_tracking (  mensajero_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.eventos_tracking WITH NOCHECK ADD CONSTRAINT ck_eventos_tracking_estado CHECK (([estado]='CON_NOVEDAD' OR [estado]='CANCELADO' OR [estado]='ENTREGADO' OR [estado]='EN_ENTREGA' OR [estado]='EN_TRANSITO' OR [estado]='EN_RECOGIDA' OR [estado]='ASIGNADO' OR [estado]='CREADO'));
ALTER TABLE enlace_express.dbo.eventos_tracking WITH NOCHECK ADD CONSTRAINT ck_eventos_tracking_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.facturas definition

-- Drop table

-- DROP TABLE enlace_express.dbo.facturas;

CREATE TABLE enlace_express.dbo.facturas (
	id int IDENTITY(1,1) NOT NULL,
	empresa_id int NOT NULL,
	envio_id int NULL,
	numero_factura varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	subtotal decimal(12,2) DEFAULT 0.00 NOT NULL,
	impuesto decimal(12,2) DEFAULT 0.00 NOT NULL,
	total decimal(12,2) DEFAULT 0.00 NOT NULL,
	estado varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'PENDIENTE' NOT NULL,
	fecha_emision datetime2 DEFAULT getdate() NOT NULL,
	fecha_vencimiento datetime2 NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_facturas PRIMARY KEY (id),
	CONSTRAINT uq_facturas_numero UNIQUE (numero_factura),
	CONSTRAINT fk_facturas_empresa FOREIGN KEY (empresa_id) REFERENCES enlace_express.dbo.empresas(id),
	CONSTRAINT fk_facturas_envio FOREIGN KEY (envio_id) REFERENCES enlace_express.dbo.envios(id)
);
 CREATE NONCLUSTERED INDEX idx_facturas_empresa ON enlace_express.dbo.facturas (  empresa_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_facturas_envio ON enlace_express.dbo.facturas (  envio_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.facturas WITH NOCHECK ADD CONSTRAINT ck_facturas_estado CHECK (([estado]='VENCIDA' OR [estado]='ANULADA' OR [estado]='PAGADA' OR [estado]='EMITIDA' OR [estado]='PENDIENTE'));
ALTER TABLE enlace_express.dbo.facturas WITH NOCHECK ADD CONSTRAINT ck_facturas_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.paquetes definition

-- Drop table

-- DROP TABLE enlace_express.dbo.paquetes;

CREATE TABLE enlace_express.dbo.paquetes (
	id int IDENTITY(1,1) NOT NULL,
	envio_id int NOT NULL,
	codigo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descripcion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	peso decimal(10,2) NOT NULL,
	largo decimal(10,2) NULL,
	ancho decimal(10,2) NULL,
	alto decimal(10,2) NULL,
	tipo_contenido varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	estado varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'REGISTRADO' NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_paquetes PRIMARY KEY (id),
	CONSTRAINT uq_paquetes_codigo UNIQUE (codigo),
	CONSTRAINT fk_paquetes_envio FOREIGN KEY (envio_id) REFERENCES enlace_express.dbo.envios(id)
);
 CREATE NONCLUSTERED INDEX idx_paquetes_envio ON enlace_express.dbo.paquetes (  envio_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.paquetes WITH NOCHECK ADD CONSTRAINT ck_paquetes_estado CHECK (([estado]='CON_NOVEDAD' OR [estado]='DEVUELTO' OR [estado]='ENTREGADO' OR [estado]='EN_TRANSITO' OR [estado]='REGISTRADO'));
ALTER TABLE enlace_express.dbo.paquetes WITH NOCHECK ADD CONSTRAINT ck_paquetes_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.pruebas_entrega definition

-- Drop table

-- DROP TABLE enlace_express.dbo.pruebas_entrega;

CREATE TABLE enlace_express.dbo.pruebas_entrega (
	id int IDENTITY(1,1) NOT NULL,
	envio_id int NOT NULL,
	tipo_prueba varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	referencia_archivo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	observacion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nombre_receptor varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	documento_receptor varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fecha_prueba datetime2 DEFAULT getdate() NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_pruebas_entrega PRIMARY KEY (id),
	CONSTRAINT fk_pruebas_entrega_envio FOREIGN KEY (envio_id) REFERENCES enlace_express.dbo.envios(id)
);
 CREATE NONCLUSTERED INDEX idx_pruebas_entrega_envio ON enlace_express.dbo.pruebas_entrega (  envio_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.pruebas_entrega WITH NOCHECK ADD CONSTRAINT ck_pruebas_entrega_tipo CHECK (([tipo_prueba]='OTRA' OR [tipo_prueba]='CODIGO' OR [tipo_prueba]='DOCUMENTO' OR [tipo_prueba]='FOTO' OR [tipo_prueba]='FIRMA'));
ALTER TABLE enlace_express.dbo.pruebas_entrega WITH NOCHECK ADD CONSTRAINT ck_pruebas_entrega_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.refresh_tokens definition

-- Drop table

-- DROP TABLE enlace_express.dbo.refresh_tokens;

CREATE TABLE enlace_express.dbo.refresh_tokens (
	id int IDENTITY(1,1) NOT NULL,
	user_id int NOT NULL,
	token varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	expires_at datetime2 NOT NULL,
	revoked_at datetime2 NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_refresh_tokens PRIMARY KEY (id),
	CONSTRAINT uq_refresh_tokens_token UNIQUE (token),
	CONSTRAINT fk_refresh_tokens_user FOREIGN KEY (user_id) REFERENCES enlace_express.dbo.users(id)
);
 CREATE NONCLUSTERED INDEX idx_refresh_tokens_user ON enlace_express.dbo.refresh_tokens (  user_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- enlace_express.dbo.resource_roles definition

-- Drop table

-- DROP TABLE enlace_express.dbo.resource_roles;

CREATE TABLE enlace_express.dbo.resource_roles (
	id int IDENTITY(1,1) NOT NULL,
	resource_id int NOT NULL,
	role_id int NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	created_at datetime2 DEFAULT getdate() NOT NULL,
	updated_at datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT pk_resource_roles PRIMARY KEY (id),
	CONSTRAINT uq_resource_roles_resource_role UNIQUE (resource_id,role_id),
	CONSTRAINT fk_resource_roles_resource FOREIGN KEY (resource_id) REFERENCES enlace_express.dbo.resources(id),
	CONSTRAINT fk_resource_roles_role FOREIGN KEY (role_id) REFERENCES enlace_express.dbo.roles(id)
);
 CREATE NONCLUSTERED INDEX idx_resource_roles_resource ON enlace_express.dbo.resource_roles (  resource_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX idx_resource_roles_role ON enlace_express.dbo.resource_roles (  role_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.resource_roles WITH NOCHECK ADD CONSTRAINT ck_resource_roles_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));


-- enlace_express.dbo.role_users definition

-- Drop table

-- DROP TABLE enlace_express.dbo.role_users;

CREATE TABLE enlace_express.dbo.role_users (
	id int IDENTITY(1,1) NOT NULL,
	role_id int NOT NULL,
	user_id int NOT NULL,
	is_active varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'ACTIVE' NOT NULL,
	CONSTRAINT pk_role_users PRIMARY KEY (id),
	CONSTRAINT uq_role_users_role_user UNIQUE (role_id,user_id),
	CONSTRAINT fk_role_users_role FOREIGN KEY (role_id) REFERENCES enlace_express.dbo.roles(id),
	CONSTRAINT fk_role_users_user FOREIGN KEY (user_id) REFERENCES enlace_express.dbo.users(id)
);
 CREATE NONCLUSTERED INDEX idx_role_users_user ON enlace_express.dbo.role_users (  user_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE enlace_express.dbo.role_users WITH NOCHECK ADD CONSTRAINT ck_role_users_is_active CHECK (([is_active]='INACTIVE' OR [is_active]='ACTIVE'));