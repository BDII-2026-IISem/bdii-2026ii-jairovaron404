USE enlace_express;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

/* ============================================================
   DATOS COMPLETOS - ENLACE EXPRESS
   SQL Server
   ============================================================ */

/* 1. ELIMINAR TODOS LOS DATOS */
DELETE FROM dbo.auditoria;
DELETE FROM dbo.pruebas_entrega;
DELETE FROM dbo.eventos_tracking;
DELETE FROM dbo.facturas;
DELETE FROM dbo.paquetes;
DELETE FROM dbo.envios;
DELETE FROM dbo.direcciones;
DELETE FROM dbo.contactos;
DELETE FROM dbo.refresh_tokens;
DELETE FROM dbo.resource_roles;
DELETE FROM dbo.role_users;
DELETE FROM dbo.resources;
DELETE FROM dbo.rutas;
DELETE FROM dbo.tarifas;
DELETE FROM dbo.mensajeros;
DELETE FROM dbo.empresas;
DELETE FROM dbo.users;
DELETE FROM dbo.roles;
GO

/* 2. REINICIAR IDENTITY */
DBCC CHECKIDENT ('dbo.auditoria', RESEED, 0);
DBCC CHECKIDENT ('dbo.pruebas_entrega', RESEED, 0);
DBCC CHECKIDENT ('dbo.eventos_tracking', RESEED, 0);
DBCC CHECKIDENT ('dbo.facturas', RESEED, 0);
DBCC CHECKIDENT ('dbo.paquetes', RESEED, 0);
DBCC CHECKIDENT ('dbo.envios', RESEED, 0);
DBCC CHECKIDENT ('dbo.direcciones', RESEED, 0);
DBCC CHECKIDENT ('dbo.contactos', RESEED, 0);
DBCC CHECKIDENT ('dbo.refresh_tokens', RESEED, 0);
DBCC CHECKIDENT ('dbo.resource_roles', RESEED, 0);
DBCC CHECKIDENT ('dbo.role_users', RESEED, 0);
DBCC CHECKIDENT ('dbo.resources', RESEED, 0);
DBCC CHECKIDENT ('dbo.rutas', RESEED, 0);
DBCC CHECKIDENT ('dbo.tarifas', RESEED, 0);
DBCC CHECKIDENT ('dbo.mensajeros', RESEED, 0);
DBCC CHECKIDENT ('dbo.empresas', RESEED, 0);
DBCC CHECKIDENT ('dbo.users', RESEED, 0);
DBCC CHECKIDENT ('dbo.roles', RESEED, 0);
GO

/* 3. ROLES */
INSERT INTO dbo.roles (name, is_active) VALUES
('ADMIN','ACTIVE'),('CLIENTE_EMPRESA','ACTIVE'),('DESPACHO','ACTIVE'),
('MENSAJERO','ACTIVE'),('FACTURACION','ACTIVE'),('OPERADOR','ACTIVE');
GO

/* 4. USERS */
INSERT INTO dbo.users (username,email,password,is_active) VALUES
('admin','admin@enlaceexpress.com','Password123!','ACTIVE'),
('cliente01','cliente01@enlaceexpress.com','Password123!','ACTIVE'),
('cliente02','cliente02@enlaceexpress.com','Password123!','ACTIVE'),
('cliente03','cliente03@enlaceexpress.com','Password123!','ACTIVE'),
('cliente04','cliente04@enlaceexpress.com','Password123!','ACTIVE'),
('cliente05','cliente05@enlaceexpress.com','Password123!','ACTIVE'),
('cliente06','cliente06@enlaceexpress.com','Password123!','ACTIVE'),
('cliente07','cliente07@enlaceexpress.com','Password123!','ACTIVE'),
('cliente08','cliente08@enlaceexpress.com','Password123!','ACTIVE'),
('cliente09','cliente09@enlaceexpress.com','Password123!','ACTIVE'),
('cliente10','cliente10@enlaceexpress.com','Password123!','ACTIVE'),
('despacho01','despacho01@enlaceexpress.com','Password123!','ACTIVE'),
('despacho02','despacho02@enlaceexpress.com','Password123!','ACTIVE'),
('mensajero01','mensajero01@enlaceexpress.com','Password123!','ACTIVE'),
('mensajero02','mensajero02@enlaceexpress.com','Password123!','ACTIVE'),
('facturacion01','facturacion01@enlaceexpress.com','Password123!','ACTIVE'),
('facturacion02','facturacion02@enlaceexpress.com','Password123!','ACTIVE'),
('operador01','operador01@enlaceexpress.com','Password123!','ACTIVE'),
('operador02','operador02@enlaceexpress.com','Password123!','ACTIVE'),
('operador03','operador03@enlaceexpress.com','Password123!','ACTIVE');
GO

/* 5. ROLE_USERS */
INSERT INTO dbo.role_users (role_id,user_id,is_active) VALUES
(1,1,'ACTIVE'),(2,2,'ACTIVE'),(2,3,'ACTIVE'),(2,4,'ACTIVE'),
(2,5,'ACTIVE'),(2,6,'ACTIVE'),(2,7,'ACTIVE'),(2,8,'ACTIVE'),
(2,9,'ACTIVE'),(2,10,'ACTIVE'),(2,11,'ACTIVE'),(3,12,'ACTIVE'),
(3,13,'ACTIVE'),(4,14,'ACTIVE'),(4,15,'ACTIVE'),(5,16,'ACTIVE'),
(5,17,'ACTIVE'),(6,18,'ACTIVE'),(6,19,'ACTIVE'),(6,20,'ACTIVE');
GO

/* 6. RESOURCES */
INSERT INTO dbo.resources (path,method,is_active) VALUES
('/api/auth/login','POST','ACTIVE'),('/api/auth/logout','POST','ACTIVE'),
('/api/users','GET','ACTIVE'),('/api/users','POST','ACTIVE'),
('/api/users','PUT','ACTIVE'),('/api/empresas','GET','ACTIVE'),
('/api/empresas','POST','ACTIVE'),('/api/empresas','PUT','ACTIVE'),
('/api/envios','GET','ACTIVE'),('/api/envios','POST','ACTIVE'),
('/api/envios','PUT','ACTIVE'),('/api/envios/tracking','GET','ACTIVE'),
('/api/paquetes','GET','ACTIVE'),('/api/paquetes','POST','ACTIVE'),
('/api/mensajeros','GET','ACTIVE'),('/api/rutas','GET','ACTIVE'),
('/api/tarifas','GET','ACTIVE'),('/api/facturas','GET','ACTIVE'),
('/api/facturas','POST','ACTIVE'),('/api/reportes','GET','ACTIVE');
GO

/* 7. RESOURCE_ROLES */
INSERT INTO dbo.resource_roles (resource_id,role_id,is_active) VALUES
(1,1,'ACTIVE'),(2,1,'ACTIVE'),(3,1,'ACTIVE'),(4,1,'ACTIVE'),
(5,1,'ACTIVE'),(6,1,'ACTIVE'),(7,1,'ACTIVE'),(8,1,'ACTIVE'),
(9,3,'ACTIVE'),(10,3,'ACTIVE'),(11,3,'ACTIVE'),(12,4,'ACTIVE'),
(13,4,'ACTIVE'),(14,4,'ACTIVE'),(15,4,'ACTIVE'),(16,3,'ACTIVE'),
(17,2,'ACTIVE'),(18,5,'ACTIVE'),(19,5,'ACTIVE'),(20,6,'ACTIVE');
GO

/* 8. EMPRESAS */
INSERT INTO dbo.empresas (nit,razon_social,contacto_principal,is_active) VALUES
('900100001-1','Empresa Andina S.A.S.','Carlos Mendoza','ACTIVE'),
('900100002-2','Comercial La Guajira S.A.S.','Laura Pérez','ACTIVE'),
('900100003-3','Servicios del Caribe S.A.S.','Andrés Gómez','ACTIVE'),
('900100004-4','Tecnología del Norte S.A.S.','María Rodríguez','ACTIVE'),
('900100005-5','Distribuciones Riohacha S.A.S.','Juan Martínez','ACTIVE'),
('900100006-6','Inversiones Guajira S.A.S.','Ana Torres','ACTIVE'),
('900100007-7','Soluciones Empresariales S.A.S.','Pedro Ramírez','ACTIVE'),
('900100008-8','Logística Caribe S.A.S.','Diana López','ACTIVE'),
('900100009-9','Comercializadora Norte S.A.S.','Luis Herrera','ACTIVE'),
('900100010-0','Servicios Integrales S.A.S.','Sofía Castro','ACTIVE'),
('900100011-1','Importaciones Caribe S.A.S.','Miguel Vargas','ACTIVE'),
('900100012-2','Grupo Empresarial Guajira S.A.S.','Valentina Rojas','ACTIVE'),
('900100013-3','Distribuciones Nacionales S.A.S.','Jorge Silva','ACTIVE'),
('900100014-4','Tecnología Empresarial S.A.S.','Camila Moreno','ACTIVE'),
('900100015-5','Comercial del Caribe S.A.S.','Daniel Navarro','ACTIVE'),
('900100016-6','Insumos Profesionales S.A.S.','Paula Mendoza','ACTIVE'),
('900100017-7','Soluciones Logísticas S.A.S.','Sebastián Ruiz','ACTIVE'),
('900100018-8','Corporación Regional S.A.S.','Natalia Díaz','ACTIVE'),
('900100019-9','Servicios Profesionales S.A.S.','Felipe Gómez','ACTIVE'),
('900100020-0','Grupo Comercial del Norte S.A.S.','Andrea Martínez','INACTIVE');
GO

/* 9. CONTACTOS */
INSERT INTO dbo.contactos (empresa_id,nombre,descripcion,is_active) VALUES
(1,'Carlos Mendoza','Contacto administrativo','ACTIVE'),
(2,'Laura Pérez','Contacto comercial','ACTIVE'),
(3,'Andrés Gómez','Contacto principal','ACTIVE'),
(4,'María Rodríguez','Contacto administrativo','ACTIVE'),
(5,'Juan Martínez','Contacto comercial','ACTIVE'),
(6,'Ana Torres','Contacto principal','ACTIVE'),
(7,'Pedro Ramírez','Contacto administrativo','ACTIVE'),
(8,'Diana López','Contacto comercial','ACTIVE'),
(9,'Luis Herrera','Contacto principal','ACTIVE'),
(10,'Sofía Castro','Contacto administrativo','ACTIVE'),
(11,'Miguel Vargas','Contacto comercial','ACTIVE'),
(12,'Valentina Rojas','Contacto principal','ACTIVE'),
(13,'Jorge Silva','Contacto administrativo','ACTIVE'),
(14,'Camila Moreno','Contacto comercial','ACTIVE'),
(15,'Daniel Navarro','Contacto principal','ACTIVE'),
(16,'Paula Mendoza','Contacto administrativo','ACTIVE'),
(17,'Sebastián Ruiz','Contacto comercial','ACTIVE'),
(18,'Natalia Díaz','Contacto principal','ACTIVE'),
(19,'Felipe Gómez','Contacto administrativo','ACTIVE'),
(20,'Andrea Martínez','Contacto comercial','INACTIVE');
GO

/* 10. DIRECCIONES */
INSERT INTO dbo.direcciones (empresa_id,nombre,descripcion,is_active) VALUES
(1,'Oficina Principal','Riohacha - La Guajira','ACTIVE'),
(1,'Bodega Principal','Zona industrial Riohacha','ACTIVE'),
(2,'Oficina Principal','Riohacha - La Guajira','ACTIVE'),
(2,'Bodega Comercial','Centro de Riohacha','ACTIVE'),
(3,'Oficina Principal','Valledupar - Cesar','ACTIVE'),
(3,'Centro Logístico','Zona comercial Valledupar','ACTIVE'),
(4,'Oficina Principal','Barranquilla - Atlántico','ACTIVE'),
(4,'Bodega Tecnología','Zona industrial Barranquilla','ACTIVE'),
(5,'Oficina Principal','Riohacha - La Guajira','ACTIVE'),
(5,'Bodega Distribución','Zona industrial Riohacha','ACTIVE'),
(6,'Oficina Principal','Maicao - La Guajira','ACTIVE'),
(6,'Centro de Operaciones','Centro de Maicao','ACTIVE'),
(7,'Oficina Principal','Santa Marta - Magdalena','ACTIVE'),
(7,'Bodega Principal','Zona industrial Santa Marta','ACTIVE'),
(8,'Oficina Principal','Barranquilla - Atlántico','ACTIVE'),
(8,'Centro Logístico','Zona industrial Barranquilla','ACTIVE'),
(9,'Oficina Principal','Cartagena - Bolívar','ACTIVE'),
(9,'Bodega Comercial','Zona industrial Cartagena','ACTIVE'),
(10,'Oficina Principal','Valledupar - Cesar','ACTIVE'),
(10,'Bodega Principal','Zona comercial Valledupar','ACTIVE'),
(11,'Oficina Principal','Barranquilla - Atlántico','ACTIVE'),
(11,'Centro de Distribución','Zona industrial Barranquilla','ACTIVE'),
(12,'Oficina Principal','Riohacha - La Guajira','ACTIVE'),
(12,'Bodega Principal','Zona industrial Riohacha','ACTIVE'),
(13,'Oficina Principal','Santa Marta - Magdalena','ACTIVE'),
(13,'Centro Logístico','Zona industrial Santa Marta','ACTIVE'),
(14,'Oficina Principal','Valledupar - Cesar','ACTIVE'),
(14,'Bodega Tecnología','Zona industrial Valledupar','ACTIVE'),
(15,'Oficina Principal','Maicao - La Guajira','ACTIVE'),
(15,'Bodega Comercial','Zona industrial Maicao','ACTIVE'),
(16,'Oficina Principal','Riohacha - La Guajira','ACTIVE'),
(16,'Centro de Operaciones','Zona comercial Riohacha','ACTIVE'),
(17,'Oficina Principal','Barranquilla - Atlántico','ACTIVE'),
(17,'Bodega Principal','Zona industrial Barranquilla','ACTIVE'),
(18,'Oficina Principal','Cartagena - Bolívar','ACTIVE'),
(18,'Bodega Principal','Zona industrial Cartagena','ACTIVE'),
(19,'Oficina Principal','Valledupar - Cesar','ACTIVE'),
(19,'Bodega Principal','Zona industrial Valledupar','ACTIVE'),
(20,'Oficina Principal','Riohacha - La Guajira','INACTIVE'),
(20,'Bodega Principal','Zona industrial Riohacha','INACTIVE');
GO

/* 11. MENSAJEROS */
INSERT INTO dbo.mensajeros (nombre,descripcion,is_active) VALUES
('Carlos Pérez','Mensajero urbano','ACTIVE'),
('Luis Gómez','Mensajero empresarial','ACTIVE'),
('Andrés Rodríguez','Mensajero urbano','ACTIVE'),
('Juan Torres','Mensajero regional','ACTIVE'),
('Pedro Martínez','Mensajero urbano','ACTIVE'),
('Miguel López','Mensajero empresarial','ACTIVE'),
('Jorge Ramírez','Mensajero regional','ACTIVE'),
('Daniel Herrera','Mensajero urbano','ACTIVE'),
('Felipe Castro','Mensajero empresarial','ACTIVE'),
('Sebastián Vargas','Mensajero urbano','ACTIVE'),
('Diego Rojas','Mensajero regional','ACTIVE'),
('Camilo Silva','Mensajero urbano','ACTIVE'),
('Santiago Moreno','Mensajero empresarial','ACTIVE'),
('Mateo Navarro','Mensajero urbano','ACTIVE'),
('Nicolás Ruiz','Mensajero regional','ACTIVE'),
('Alejandro Díaz','Mensajero urbano','ACTIVE'),
('Ricardo Gómez','Mensajero empresarial','ACTIVE'),
('Esteban Martínez','Mensajero urbano','ACTIVE'),
('Cristian Mendoza','Mensajero regional','ACTIVE'),
('Óscar Fernández','Mensajero temporal','INACTIVE');
GO

/* 12. RUTAS */
INSERT INTO dbo.rutas (nombre,descripcion,is_active) VALUES
('Ruta Riohacha Centro','Recorrido urbano centro','ACTIVE'),
('Ruta Riohacha Norte','Recorrido zona norte','ACTIVE'),
('Ruta Riohacha Sur','Recorrido zona sur','ACTIVE'),
('Ruta Maicao','Recorrido Riohacha-Maicao','ACTIVE'),
('Ruta Valledupar','Recorrido regional Valledupar','ACTIVE'),
('Ruta Barranquilla','Recorrido regional Barranquilla','ACTIVE'),
('Ruta Santa Marta','Recorrido regional Santa Marta','ACTIVE'),
('Ruta Cartagena','Recorrido regional Cartagena','ACTIVE'),
('Ruta Caribe Norte','Recorrido regional Caribe','ACTIVE'),
('Ruta Empresarial','Ruta para clientes empresariales','ACTIVE'),
('Ruta Especial','Ruta de servicios especiales','INACTIVE'),
('Ruta Alterna','Ruta alternativa regional','ACTIVE');
GO

/* 13. TARIFAS */
INSERT INTO dbo.tarifas
(nombre,regla_calculo,valor_base,vigencia_desde,vigencia_hasta,is_active) VALUES
('Tarifa Urbana 1','Base urbana hasta 5 kg',8000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Urbana 2','Base urbana hasta 10 kg',10000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Regional 1','Regional hasta 5 kg',15000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Regional 2','Regional hasta 10 kg',20000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Empresarial 1','Empresarial básica',18000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Empresarial 2','Empresarial prioritaria',25000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Express 1','Entrega express urbana',22000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Express 2','Entrega express regional',30000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Especial 1','Carga especial',35000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Especial 2','Carga delicada',40000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Corporativa 1','Plan corporativo básico',12000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Corporativa 2','Plan corporativo premium',16000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Documentos','Documentos empresariales',7000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Paquetes','Paquetes comerciales',14000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Frágil','Mercancía frágil',28000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Urgente','Servicio urgente',32000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Nocturna','Servicio nocturno',27000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Institucional','Servicio institucional',19000.00,'2026-01-01',NULL,'ACTIVE'),
('Tarifa Antigua','Tarifa histórica',9000.00,'2025-01-01','2025-12-31','INACTIVE'),
('Tarifa Especial Antigua','Tarifa histórica especial',13000.00,'2025-01-01','2025-12-31','INACTIVE');
GO

/* 14. ENVIOS */
INSERT INTO dbo.envios
(empresa_id,mensajero_id,ruta_id,tarifa_id,direccion_recogida_id,direccion_entrega_id,
referencia,descripcion,estado,prioridad,fecha_solicitud,fecha_entrega,is_active) VALUES
(1,1,1,1,1,2,'EX-2026-001','Documentos comerciales','ENTREGADO','NORMAL','2026-08-01 08:15:00','2026-08-02 15:20:00','ACTIVE'),
(1,2,2,5,2,1,'EX-2026-002','Paquete empresarial urgente','EN_TRANSITO','URGENTE','2026-08-03 09:30:00',NULL,'ACTIVE'),
(2,3,3,2,3,4,'EX-2026-003','Documentación administrativa','ENTREGADO','ALTA','2026-08-04 10:00:00','2026-08-05 14:10:00','ACTIVE'),
(2,4,4,6,4,3,'EX-2026-004','Productos comerciales','EN_ENTREGA','NORMAL','2026-08-05 11:20:00',NULL,'ACTIVE'),
(3,5,5,3,5,6,'EX-2026-005','Equipo tecnológico','ASIGNADO','ALTA','2026-08-06 08:40:00',NULL,'ACTIVE'),
(4,6,7,4,7,8,'EX-2026-006','Material de oficina','EN_TRANSITO','NORMAL','2026-08-07 13:00:00',NULL,'ACTIVE'),
(5,7,9,7,9,10,'EX-2026-007','Insumos empresariales','CREADO','BAJA','2026-08-08 09:15:00',NULL,'ACTIVE'),
(6,8,6,8,11,12,'EX-2026-008','Documentos legales','ENTREGADO','ALTA','2026-08-09 07:50:00','2026-08-10 16:30:00','ACTIVE'),
(7,9,8,9,13,14,'EX-2026-009','Mercancía frágil','CON_NOVEDAD','URGENTE','2026-08-10 10:45:00',NULL,'ACTIVE'),
(8,10,3,10,15,16,'EX-2026-010','Productos alimenticios','EN_RECOGIDA','NORMAL','2026-08-11 08:10:00',NULL,'ACTIVE'),
(9,11,3,11,17,18,'EX-2026-011','Carga importada','ENTREGADO','ALTA','2026-08-12 09:35:00','2026-08-13 13:45:00','ACTIVE'),
(10,12,10,12,19,20,'EX-2026-012','Equipos informáticos','EN_TRANSITO','URGENTE','2026-08-13 11:00:00',NULL,'ACTIVE'),
(11,13,4,13,21,22,'EX-2026-013','Repuestos de transporte','ENTREGADO','NORMAL','2026-08-14 07:40:00','2026-08-15 12:30:00','ACTIVE'),
(12,14,1,14,23,24,'EX-2026-014','Material promocional','EN_ENTREGA','ALTA','2026-08-15 10:20:00',NULL,'ACTIVE'),
(13,15,5,15,25,26,'EX-2026-015','Documentos contables','ENTREGADO','NORMAL','2026-08-16 08:30:00','2026-08-17 14:15:00','ACTIVE'),
(14,16,11,16,27,28,'EX-2026-016','Suministros administrativos','CANCELADO','BAJA','2026-08-17 09:00:00',NULL,'ACTIVE'),
(15,17,7,17,29,30,'EX-2026-017','Paquete empresarial','ENTREGADO','ALTA','2026-08-18 12:10:00','2026-08-19 15:50:00','ACTIVE'),
(16,18,3,18,31,32,'EX-2026-018','Documentos financieros','ASIGNADO','NORMAL','2026-08-19 08:45:00',NULL,'ACTIVE'),
(17,19,6,3,33,34,'EX-2026-019','Mercancía comercial','EN_TRANSITO','ALTA','2026-08-20 10:30:00',NULL,'ACTIVE'),
(1,20,2,4,1,2,'EX-2026-020','Contrato empresarial','ENTREGADO','URGENTE','2026-08-21 07:55:00','2026-08-22 11:40:00','ACTIVE');
GO

/* 15. PAQUETES */
INSERT INTO dbo.paquetes
(envio_id,codigo,descripcion,peso,largo,ancho,alto,tipo_contenido,estado,is_active) VALUES
(1,'PK-2026-001','Documentos comerciales',1.20,30,20,5,'Documentos','ENTREGADO','ACTIVE'),
(2,'PK-2026-002','Paquete empresarial',4.50,40,30,20,'Mercancía','EN_TRANSITO','ACTIVE'),
(3,'PK-2026-003','Documentación',1.00,30,20,5,'Documentos','ENTREGADO','ACTIVE'),
(4,'PK-2026-004','Productos comerciales',6.00,50,35,25,'Productos','EN_TRANSITO','ACTIVE'),
(5,'PK-2026-005','Equipo tecnológico',8.50,60,40,30,'Tecnología','REGISTRADO','ACTIVE'),
(6,'PK-2026-006','Material de oficina',5.20,45,35,20,'Oficina','EN_TRANSITO','ACTIVE'),
(7,'PK-2026-007','Insumos',3.80,40,30,20,'Insumos','REGISTRADO','ACTIVE'),
(8,'PK-2026-008','Documentos legales',1.50,30,20,5,'Documentos','ENTREGADO','ACTIVE'),
(9,'PK-2026-009','Mercancía frágil',7.00,55,40,30,'Frágil','CON_NOVEDAD','ACTIVE'),
(10,'PK-2026-010','Productos alimenticios',5.50,45,35,25,'Alimentos','EN_TRANSITO','ACTIVE'),
(11,'PK-2026-011','Carga importada',10.00,70,50,40,'Mercancía','ENTREGADO','ACTIVE'),
(12,'PK-2026-012','Equipos informáticos',9.20,60,45,30,'Tecnología','EN_TRANSITO','ACTIVE'),
(13,'PK-2026-013','Repuestos',6.50,50,40,25,'Repuestos','ENTREGADO','ACTIVE'),
(14,'PK-2026-014','Material promocional',4.00,45,30,20,'Promocional','EN_TRANSITO','ACTIVE'),
(15,'PK-2026-015','Documentos contables',1.30,30,20,5,'Documentos','ENTREGADO','ACTIVE'),
(16,'PK-2026-016','Suministros administrativos',4.80,45,35,20,'Oficina','DEVUELTO','ACTIVE'),
(17,'PK-2026-017','Paquete empresarial',5.60,50,35,25,'Mercancía','ENTREGADO','ACTIVE'),
(18,'PK-2026-018','Documentos financieros',1.70,30,20,5,'Documentos','REGISTRADO','ACTIVE'),
(19,'PK-2026-019','Mercancía comercial',7.80,55,40,30,'Mercancía','EN_TRANSITO','ACTIVE'),
(20,'PK-2026-020','Contrato empresarial',2.00,35,25,10,'Documentos','ENTREGADO','ACTIVE');
GO

/* 16. EVENTOS_TRACKING */
INSERT INTO dbo.eventos_tracking
(envio_id,mensajero_id,estado,descripcion,latitud,longitud,fecha_evento,is_active) VALUES
(1,1,'ENTREGADO','Entrega realizada correctamente',11.5444,-72.9072,'2026-08-02 15:20:00','ACTIVE'),
(2,2,'EN_TRANSITO','Paquete en ruta',11.5440,-72.9100,'2026-08-03 12:00:00','ACTIVE'),
(3,3,'ENTREGADO','Entrega confirmada',11.5300,-72.8800,'2026-08-05 14:10:00','ACTIVE'),
(4,4,'EN_ENTREGA','Mensajero en camino',11.5500,-72.9000,'2026-08-05 13:00:00','ACTIVE'),
(5,5,'ASIGNADO','Envío asignado al mensajero',11.5600,-72.8900,'2026-08-06 09:00:00','ACTIVE'),
(6,6,'EN_TRANSITO','Envío en desplazamiento',11.5700,-72.8800,'2026-08-07 14:00:00','ACTIVE'),
(7,7,'CREADO','Envío registrado',11.5800,-72.8700,'2026-08-08 09:20:00','ACTIVE'),
(8,8,'ENTREGADO','Entrega confirmada',11.5900,-72.8600,'2026-08-10 16:30:00','ACTIVE'),
(9,9,'CON_NOVEDAD','Novedad reportada durante transporte',11.6000,-72.8500,'2026-08-10 12:00:00','ACTIVE'),
(10,10,'EN_RECOGIDA','Mensajero realizando recogida',11.6100,-72.8400,'2026-08-11 09:00:00','ACTIVE'),
(11,11,'ENTREGADO','Entrega confirmada',11.6200,-72.8300,'2026-08-13 13:45:00','ACTIVE'),
(12,12,'EN_TRANSITO','Envío en ruta',11.6300,-72.8200,'2026-08-13 14:00:00','ACTIVE'),
(13,13,'ENTREGADO','Entrega realizada',11.6400,-72.8100,'2026-08-15 12:30:00','ACTIVE'),
(14,14,'EN_ENTREGA','Envío próximo a destino',11.6500,-72.8000,'2026-08-15 14:00:00','ACTIVE'),
(15,15,'ENTREGADO','Entrega confirmada',11.6600,-72.7900,'2026-08-17 14:15:00','ACTIVE'),
(16,16,'CANCELADO','Envío cancelado',11.6700,-72.7800,'2026-08-17 10:00:00','ACTIVE'),
(17,17,'ENTREGADO','Entrega realizada',11.6800,-72.7700,'2026-08-19 15:50:00','ACTIVE'),
(18,18,'ASIGNADO','Mensajero asignado',11.6900,-72.7600,'2026-08-19 09:00:00','ACTIVE'),
(19,19,'EN_TRANSITO','Envío en desplazamiento',11.7000,-72.7500,'2026-08-20 11:00:00','ACTIVE'),
(20,20,'ENTREGADO','Entrega confirmada',11.7100,-72.7400,'2026-08-22 11:40:00','ACTIVE');
GO

/* 17. FACTURAS */
INSERT INTO dbo.facturas
(empresa_id,envio_id,numero_factura,subtotal,impuesto,total,estado,fecha_emision,fecha_vencimiento,is_active) VALUES
(1,1,'FAC-2026-001',8000.00,1520.00,9520.00,'PAGADA','2026-08-02','2026-08-30','ACTIVE'),
(1,2,'FAC-2026-002',18000.00,3420.00,21420.00,'EMITIDA','2026-08-03','2026-09-03','ACTIVE'),
(2,3,'FAC-2026-003',10000.00,1900.00,11900.00,'PAGADA','2026-08-05','2026-09-05','ACTIVE'),
(2,4,'FAC-2026-004',25000.00,4750.00,29750.00,'PENDIENTE','2026-08-05','2026-09-05','ACTIVE'),
(3,5,'FAC-2026-005',15000.00,2850.00,17850.00,'EMITIDA','2026-08-06','2026-09-06','ACTIVE'),
(4,6,'FAC-2026-006',20000.00,3800.00,23800.00,'PAGADA','2026-08-07','2026-09-07','ACTIVE'),
(5,7,'FAC-2026-007',22000.00,4180.00,26180.00,'PENDIENTE','2026-08-08','2026-09-08','ACTIVE'),
(6,8,'FAC-2026-008',30000.00,5700.00,35700.00,'PAGADA','2026-08-10','2026-09-10','ACTIVE'),
(7,9,'FAC-2026-009',35000.00,6650.00,41650.00,'VENCIDA','2026-08-10','2026-08-20','ACTIVE'),
(8,10,'FAC-2026-010',40000.00,7600.00,47600.00,'EMITIDA','2026-08-11','2026-09-11','ACTIVE'),
(9,11,'FAC-2026-011',12000.00,2280.00,14280.00,'PAGADA','2026-08-13','2026-09-13','ACTIVE'),
(10,12,'FAC-2026-012',16000.00,3040.00,19040.00,'PENDIENTE','2026-08-13','2026-09-13','ACTIVE'),
(11,13,'FAC-2026-013',7000.00,1330.00,8330.00,'PAGADA','2026-08-15','2026-09-15','ACTIVE'),
(12,14,'FAC-2026-014',14000.00,2660.00,16660.00,'EMITIDA','2026-08-15','2026-09-15','ACTIVE'),
(13,15,'FAC-2026-015',28000.00,5320.00,33320.00,'PAGADA','2026-08-17','2026-09-17','ACTIVE'),
(14,16,'FAC-2026-016',32000.00,6080.00,38080.00,'ANULADA','2026-08-17','2026-09-17','ACTIVE'),
(15,17,'FAC-2026-017',27000.00,5130.00,32130.00,'PAGADA','2026-08-19','2026-09-19','ACTIVE'),
(16,18,'FAC-2026-018',19000.00,3610.00,22610.00,'PENDIENTE','2026-08-19','2026-09-19','ACTIVE'),
(17,19,'FAC-2026-019',13000.00,2470.00,15470.00,'EMITIDA','2026-08-20','2026-09-20','ACTIVE'),
(1,20,'FAC-2026-020',20000.00,3800.00,23800.00,'PAGADA','2026-08-22','2026-09-22','ACTIVE');
GO

/* 18. PRUEBAS_ENTREGA */
INSERT INTO dbo.pruebas_entrega
(envio_id,tipo_prueba,referencia_archivo,observacion,nombre_receptor,documento_receptor,fecha_prueba,is_active) VALUES
(1,'FIRMA','firma_001.jpg','Entrega firmada','Carlos Pérez','100100001','2026-08-02 15:20:00','ACTIVE'),
(2,'CODIGO','COD-002','Código pendiente de validación',NULL,NULL,'2026-08-03 12:00:00','ACTIVE'),
(3,'FIRMA','firma_003.jpg','Entrega firmada','Laura Pérez','100100002','2026-08-05 14:10:00','ACTIVE'),
(4,'CODIGO','COD-004','Código generado',NULL,NULL,'2026-08-05 13:00:00','ACTIVE'),
(5,'FOTO','foto_005.jpg','Registro fotográfico',NULL,NULL,'2026-08-06 09:00:00','ACTIVE'),
(6,'DOCUMENTO','doc_006.pdf','Documento registrado',NULL,NULL,'2026-08-07 14:00:00','ACTIVE'),
(7,'OTRA','registro_007.pdf','Registro de recepción',NULL,NULL,'2026-08-08 09:20:00','ACTIVE'),
(8,'FIRMA','firma_008.jpg','Entrega firmada','Ana Torres','100100006','2026-08-10 16:30:00','ACTIVE'),
(9,'FOTO','foto_009.jpg','Novedad fotografiada',NULL,NULL,'2026-08-10 12:00:00','ACTIVE'),
(10,'CODIGO','COD-010','Código de recogida',NULL,NULL,'2026-08-11 09:00:00','ACTIVE'),
(11,'FIRMA','firma_011.jpg','Entrega firmada','Luis Herrera','100100009','2026-08-13 13:45:00','ACTIVE'),
(12,'DOCUMENTO','doc_012.pdf','Documento de entrega',NULL,NULL,'2026-08-13 14:00:00','ACTIVE'),
(13,'FIRMA','firma_013.jpg','Entrega firmada','Jorge Silva','100100013','2026-08-15 12:30:00','ACTIVE'),
(14,'FOTO','foto_014.jpg','Registro fotográfico',NULL,NULL,'2026-08-15 14:00:00','ACTIVE'),
(15,'FIRMA','firma_015.jpg','Entrega firmada','Daniel Navarro','100100015','2026-08-17 14:15:00','ACTIVE'),
(16,'OTRA','cancelacion_016.pdf','Registro de cancelación',NULL,NULL,'2026-08-17 10:00:00','ACTIVE'),
(17,'FIRMA','firma_017.jpg','Entrega firmada','Sebastián Ruiz','100100017','2026-08-19 15:50:00','ACTIVE'),
(18,'CODIGO','COD-018','Código de asignación',NULL,NULL,'2026-08-19 09:00:00','ACTIVE'),
(19,'FOTO','foto_019.jpg','Registro del paquete',NULL,NULL,'2026-08-20 11:00:00','ACTIVE'),
(20,'FIRMA','firma_020.jpg','Entrega firmada','Andrea Martínez','100100020','2026-08-22 11:40:00','ACTIVE');
GO

/* 19. REFRESH TOKENS */
INSERT INTO dbo.refresh_tokens (user_id,token,expires_at,revoked_at) VALUES
(1,'TOKEN-001-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(2,'TOKEN-002-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(3,'TOKEN-003-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(4,'TOKEN-004-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(5,'TOKEN-005-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(6,'TOKEN-006-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(7,'TOKEN-007-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(8,'TOKEN-008-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(9,'TOKEN-009-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL),
(10,'TOKEN-010-ENLACE-EXPRESS','2026-12-31 23:59:59',NULL);
GO

/* 20. AUDITORIA */
INSERT INTO dbo.auditoria
(tabla_afectada,registro_id,accion,descripcion,fecha_evento) VALUES
('empresas',1,'INSERT','Empresa registrada','2026-08-01 08:00:00'),
('empresas',2,'INSERT','Empresa registrada','2026-08-01 08:01:00'),
('empresas',3,'INSERT','Empresa registrada','2026-08-01 08:02:00'),
('envios',1,'INSERT','Envío creado','2026-08-01 08:15:00'),
('envios',2,'INSERT','Envío creado','2026-08-03 09:30:00'),
('envios',3,'INSERT','Envío creado','2026-08-04 10:00:00'),
('envios',4,'UPDATE','Estado actualizado','2026-08-05 13:00:00'),
('envios',5,'INSERT','Envío creado','2026-08-06 08:40:00'),
('paquetes',1,'INSERT','Paquete registrado','2026-08-01 08:20:00'),
('paquetes',2,'INSERT','Paquete registrado','2026-08-03 09:35:00'),
('facturas',1,'INSERT','Factura generada','2026-08-02 15:30:00'),
('facturas',2,'INSERT','Factura generada','2026-08-03 10:00:00'),
('facturas',3,'UPDATE','Factura pagada','2026-08-05 16:00:00'),
('eventos_tracking',1,'INSERT','Evento de entrega registrado','2026-08-02 15:20:00'),
('eventos_tracking',2,'INSERT','Evento de tracking registrado','2026-08-03 12:00:00'),
('pruebas_entrega',1,'INSERT','Prueba de entrega registrada','2026-08-02 15:20:00'),
('pruebas_entrega',3,'INSERT','Prueba de entrega registrada','2026-08-05 14:10:00'),
('users',1,'UPDATE','Usuario administrador actualizado','2026-08-01 07:30:00'),
('roles',1,'INSERT','Rol administrador creado','2026-08-01 07:00:00'),
('resources',1,'INSERT','Recurso registrado','2026-08-01 07:10:00');
GO

/* 21. VERIFICACION FINAL */
SELECT 'roles' AS tabla, COUNT(*) AS registros FROM dbo.roles
UNION ALL SELECT 'users',COUNT(*) FROM dbo.users
UNION ALL SELECT 'role_users',COUNT(*) FROM dbo.role_users
UNION ALL SELECT 'resources',COUNT(*) FROM dbo.resources
UNION ALL SELECT 'resource_roles',COUNT(*) FROM dbo.resource_roles
UNION ALL SELECT 'empresas',COUNT(*) FROM dbo.empresas
UNION ALL SELECT 'contactos',COUNT(*) FROM dbo.contactos
UNION ALL SELECT 'direcciones',COUNT(*) FROM dbo.direcciones
UNION ALL SELECT 'mensajeros',COUNT(*) FROM dbo.mensajeros
UNION ALL SELECT 'rutas',COUNT(*) FROM dbo.rutas
UNION ALL SELECT 'tarifas',COUNT(*) FROM dbo.tarifas
UNION ALL SELECT 'envios',COUNT(*) FROM dbo.envios
UNION ALL SELECT 'paquetes',COUNT(*) FROM dbo.paquetes
UNION ALL SELECT 'eventos_tracking',COUNT(*) FROM dbo.eventos_tracking
UNION ALL SELECT 'facturas',COUNT(*) FROM dbo.facturas
UNION ALL SELECT 'pruebas_entrega',COUNT(*) FROM dbo.pruebas_entrega
UNION ALL SELECT 'refresh_tokens',COUNT(*) FROM dbo.refresh_tokens
UNION ALL SELECT 'auditoria',COUNT(*) FROM dbo.auditoria
ORDER BY tabla;
GO

/* 22. COMPROBAR IDS */
SELECT id,razon_social FROM dbo.empresas ORDER BY id;
SELECT id,nombre FROM dbo.mensajeros ORDER BY id;
GO
