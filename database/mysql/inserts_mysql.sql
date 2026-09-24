-- ============================================================
-- DATOS COMPLETOS - ENLACE EXPRESS
-- MYSQL
-- ============================================================

USE enlace_express;

-- ============================================================
-- LIMPIAR DATOS ANTERIORES
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE auditoria;
TRUNCATE TABLE contactos;
TRUNCATE TABLE direcciones;
TRUNCATE TABLE empresas;
TRUNCATE TABLE eventos_tracking;
TRUNCATE TABLE facturas;
TRUNCATE TABLE mensajeros;
TRUNCATE TABLE paquetes;
TRUNCATE TABLE pruebas_entrega;
TRUNCATE TABLE refresh_tokens;
TRUNCATE TABLE resource_roles;
TRUNCATE TABLE resources;
TRUNCATE TABLE role_users;
TRUNCATE TABLE roles;
TRUNCATE TABLE rutas;
TRUNCATE TABLE tarifas;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 1. ROLES
-- ============================================================

INSERT INTO roles (name, is_active) VALUES
('ADMIN', 'ACTIVE'),
('CLIENTE_EMPRESA', 'ACTIVE'),
('DESPACHO', 'ACTIVE'),
('MENSAJERO', 'ACTIVE'),
('FACTURACION', 'ACTIVE'),
('OPERADOR', 'ACTIVE');

-- ============================================================
-- 2. USUARIOS
-- ============================================================

INSERT INTO users
(username, email, password, is_active, avatar)
VALUES
('admin01', 'admin01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('admin02', 'admin02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('cliente01', 'cliente01@empresa.com', '123456', 'ACTIVE', NULL),
('cliente02', 'cliente02@empresa.com', '123456', 'ACTIVE', NULL),
('cliente03', 'cliente03@empresa.com', '123456', 'ACTIVE', NULL),
('cliente04', 'cliente04@empresa.com', '123456', 'ACTIVE', NULL),
('despacho01', 'despacho01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('despacho02', 'despacho02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('mensajero01', 'mensajero01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('mensajero02', 'mensajero02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('mensajero03', 'mensajero03@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('mensajero04', 'mensajero04@enlaceexpress.com', '123456', 'INACTIVE', NULL),
('facturacion01', 'facturacion01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('facturacion02', 'facturacion02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('operador01', 'operador01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('operador02', 'operador02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('operador03', 'operador03@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('consulta01', 'consulta01@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('consulta02', 'consulta02@enlaceexpress.com', '123456', 'ACTIVE', NULL),
('consulta03', 'consulta03@enlaceexpress.com', '123456', 'INACTIVE', NULL);

-- ============================================================
-- 3. ROLES DE LOS USUARIOS
-- ============================================================

INSERT INTO role_users
(role_id, user_id, is_active)
VALUES
(1, 1, 'ACTIVE'),
(1, 2, 'ACTIVE'),
(2, 3, 'ACTIVE'),
(2, 4, 'ACTIVE'),
(2, 5, 'ACTIVE'),
(2, 6, 'ACTIVE'),
(3, 7, 'ACTIVE'),
(3, 8, 'ACTIVE'),
(4, 9, 'ACTIVE'),
(4, 10, 'ACTIVE'),
(4, 11, 'ACTIVE'),
(4, 12, 'ACTIVE'),
(5, 13, 'ACTIVE'),
(5, 14, 'ACTIVE'),
(6, 15, 'ACTIVE'),
(6, 16, 'ACTIVE'),
(6, 17, 'ACTIVE'),
(6, 18, 'ACTIVE'),
(6, 19, 'ACTIVE'),
(6, 20, 'ACTIVE');

-- ============================================================
-- 4. RECURSOS
-- ============================================================

INSERT INTO resources
(path, method, is_active)
VALUES
('/api/empresas', 'GET', 'ACTIVE'),
('/api/empresas', 'POST', 'ACTIVE'),
('/api/empresas/{id}', 'GET', 'ACTIVE'),
('/api/empresas/{id}', 'PUT', 'ACTIVE'),
('/api/envios', 'GET', 'ACTIVE'),
('/api/envios', 'POST', 'ACTIVE'),
('/api/envios/{id}', 'GET', 'ACTIVE'),
('/api/envios/{id}', 'PUT', 'ACTIVE'),
('/api/envios/{id}/tracking', 'GET', 'ACTIVE'),
('/api/tracking', 'POST', 'ACTIVE'),
('/api/paquetes', 'GET', 'ACTIVE'),
('/api/paquetes', 'POST', 'ACTIVE'),
('/api/mensajeros', 'GET', 'ACTIVE'),
('/api/rutas', 'GET', 'ACTIVE'),
('/api/tarifas', 'GET', 'ACTIVE'),
('/api/facturas', 'GET', 'ACTIVE'),
('/api/facturas', 'POST', 'ACTIVE'),
('/api/usuarios', 'GET', 'ACTIVE'),
('/api/reportes', 'GET', 'ACTIVE'),
('/api/auditoria', 'GET', 'ACTIVE');

-- ============================================================
-- 5. PERMISOS DE RECURSOS
-- ============================================================

INSERT INTO resource_roles
(resource_id, role_id, is_active)
VALUES
(1, 1, 'ACTIVE'),
(2, 1, 'ACTIVE'),
(3, 1, 'ACTIVE'),
(4, 1, 'ACTIVE'),
(5, 2, 'ACTIVE'),
(6, 2, 'ACTIVE'),
(7, 2, 'ACTIVE'),
(8, 3, 'ACTIVE'),
(9, 2, 'ACTIVE'),
(10, 4, 'ACTIVE'),
(11, 4, 'ACTIVE'),
(12, 4, 'ACTIVE'),
(13, 3, 'ACTIVE'),
(14, 3, 'ACTIVE'),
(15, 5, 'ACTIVE'),
(16, 5, 'ACTIVE'),
(17, 5, 'ACTIVE'),
(18, 1, 'ACTIVE'),
(19, 6, 'ACTIVE'),
(20, 1, 'ACTIVE');

-- ============================================================
-- 6. EMPRESAS
-- ============================================================

INSERT INTO empresas
(nit, razon_social, contacto_principal, is_active)
VALUES
('900100001-1', 'Tecnologias del Caribe SAS', 'Carlos Mendoza', 'ACTIVE'),
('900100002-2', 'Distribuciones La Guajira SAS', 'Laura Gonzalez', 'ACTIVE'),
('900100003-3', 'Comercializadora del Norte SAS', 'Andres Rodriguez', 'ACTIVE'),
('900100004-4', 'Servicios Empresariales del Caribe', 'Maria Torres', 'ACTIVE'),
('900100005-5', 'Inversiones Riohacha SAS', 'Jorge Martinez', 'ACTIVE'),
('900100006-6', 'Soluciones Digitales SAS', 'Camila Herrera', 'ACTIVE'),
('900100007-7', 'Alimentos del Cesar SAS', 'Daniel Perez', 'ACTIVE'),
('900100008-8', 'Transportes del Norte SAS', 'Sofia Ramirez', 'ACTIVE'),
('900100009-9', 'Importadora Caribe SAS', 'Miguel Castro', 'ACTIVE'),
('900100010-0', 'Comercial La Guajira', 'Valentina Diaz', 'ACTIVE'),
('900100011-1', 'Farmaceutica del Caribe', 'Juan Lopez', 'ACTIVE'),
('900100012-2', 'Papeleria Nacional SAS', 'Natalia Vargas', 'ACTIVE'),
('900100013-3', 'Construcciones Guajira SAS', 'Felipe Rojas', 'ACTIVE'),
('900100014-4', 'Tecnologia y Redes SAS', 'Paula Moreno', 'ACTIVE'),
('900100015-5', 'Distribuciones Wayuu SAS', 'Luis Epiayu', 'ACTIVE'),
('900100016-6', 'Comercio Express SAS', 'Diana Brito', 'ACTIVE'),
('900100017-7', 'Productos del Caribe SAS', 'Sebastian Acosta', 'ACTIVE'),
('900100018-8', 'Servicios Logisticos SAS', 'Andrea Jimenez', 'ACTIVE'),
('900100019-9', 'Mercado Regional SAS', 'Oscar Medina', 'ACTIVE'),
('900100020-0', 'Soluciones Empresariales SAS', 'Carolina Suarez', 'INACTIVE');

-- ============================================================
-- 7. CONTACTOS
-- ============================================================

INSERT INTO contactos
(empresa_id, nombre, descripcion, is_active)
VALUES
(1, 'Carlos Mendoza', 'Contacto administrativo', 'ACTIVE'),
(2, 'Laura Gonzalez', 'Contacto de operaciones', 'ACTIVE'),
(3, 'Andres Rodriguez', 'Contacto comercial', 'ACTIVE'),
(4, 'Maria Torres', 'Contacto principal', 'ACTIVE'),
(5, 'Jorge Martinez', 'Gerente administrativo', 'ACTIVE'),
(6, 'Camila Herrera', 'Contacto de tecnologia', 'ACTIVE'),
(7, 'Daniel Perez', 'Coordinador logistico', 'ACTIVE'),
(8, 'Sofia Ramirez', 'Jefe de operaciones', 'ACTIVE'),
(9, 'Miguel Castro', 'Contacto comercial', 'ACTIVE'),
(10, 'Valentina Diaz', 'Administradora', 'ACTIVE'),
(11, 'Juan Lopez', 'Contacto financiero', 'ACTIVE'),
(12, 'Natalia Vargas', 'Contacto administrativo', 'ACTIVE'),
(13, 'Felipe Rojas', 'Director de proyectos', 'ACTIVE'),
(14, 'Paula Moreno', 'Coordinadora TI', 'ACTIVE'),
(15, 'Luis Epiayu', 'Gerente general', 'ACTIVE'),
(16, 'Diana Brito', 'Coordinadora comercial', 'ACTIVE'),
(17, 'Sebastian Acosta', 'Jefe logistico', 'ACTIVE'),
(18, 'Andrea Jimenez', 'Administradora', 'ACTIVE'),
(19, 'Oscar Medina', 'Gerente comercial', 'ACTIVE'),
(20, 'Carolina Suarez', 'Contacto principal', 'INACTIVE');

-- ============================================================
-- 8. DIRECCIONES
-- ============================================================

INSERT INTO direcciones
(empresa_id, nombre, descripcion, is_active)
VALUES
(1, 'Sede Principal', 'Calle 10 # 8-20, Riohacha', 'ACTIVE'),
(1, 'Bodega', 'Carrera 7 # 15-30, Riohacha', 'ACTIVE'),
(2, 'Sede Principal', 'Calle 12 # 9-15, Riohacha', 'ACTIVE'),
(2, 'Bodega', 'Carrera 15 # 20-10, Riohacha', 'ACTIVE'),
(3, 'Sede Principal', 'Calle 5 # 6-40, Valledupar', 'ACTIVE'),
(3, 'Bodega', 'Carrera 11 # 18-25, Valledupar', 'ACTIVE'),
(4, 'Sede Principal', 'Calle 9 # 12-18, Barranquilla', 'ACTIVE'),
(4, 'Bodega', 'Carrera 22 # 30-12, Barranquilla', 'ACTIVE'),
(5, 'Sede Principal', 'Calle 14 # 10-22, Riohacha', 'ACTIVE'),
(5, 'Bodega', 'Carrera 5 # 16-40, Riohacha', 'ACTIVE'),
(6, 'Sede Principal', 'Calle 18 # 7-11, Riohacha', 'ACTIVE'),
(6, 'Bodega', 'Carrera 9 # 25-15, Riohacha', 'ACTIVE'),
(7, 'Sede Principal', 'Calle 20 # 14-30, Valledupar', 'ACTIVE'),
(7, 'Bodega', 'Carrera 19 # 8-50, Valledupar', 'ACTIVE'),
(8, 'Sede Principal', 'Calle 30 # 20-18, Santa Marta', 'ACTIVE'),
(8, 'Bodega', 'Carrera 12 # 35-20, Santa Marta', 'ACTIVE'),
(9, 'Sede Principal', 'Calle 22 # 15-10, Barranquilla', 'ACTIVE'),
(9, 'Bodega', 'Carrera 40 # 25-12, Barranquilla', 'ACTIVE'),
(10, 'Sede Principal', 'Calle 8 # 7-14, Maicao', 'ACTIVE'),
(10, 'Bodega', 'Carrera 10 # 12-22, Maicao', 'ACTIVE'),
(11, 'Sede Principal', 'Calle 16 # 9-10, Riohacha', 'ACTIVE'),
(11, 'Bodega', 'Carrera 8 # 20-16, Riohacha', 'ACTIVE'),
(12, 'Sede Principal', 'Calle 11 # 13-25, Valledupar', 'ACTIVE'),
(12, 'Bodega', 'Carrera 17 # 22-14, Valledupar', 'ACTIVE'),
(13, 'Sede Principal', 'Calle 25 # 10-12, Riohacha', 'ACTIVE'),
(13, 'Bodega', 'Carrera 6 # 28-30, Riohacha', 'ACTIVE'),
(14, 'Sede Principal', 'Calle 19 # 8-16, Barranquilla', 'ACTIVE'),
(14, 'Bodega', 'Carrera 21 # 40-18, Barranquilla', 'ACTIVE'),
(15, 'Sede Principal', 'Calle 6 # 5-20, Uribia', 'ACTIVE'),
(15, 'Bodega', 'Carrera 4 # 10-15, Uribia', 'ACTIVE'),
(16, 'Sede Principal', 'Calle 13 # 6-12, Riohacha', 'ACTIVE'),
(16, 'Bodega', 'Carrera 9 # 18-20, Riohacha', 'ACTIVE'),
(17, 'Sede Principal', 'Calle 17 # 12-10, Santa Marta', 'ACTIVE'),
(17, 'Bodega', 'Carrera 16 # 24-20, Santa Marta', 'ACTIVE'),
(18, 'Sede Principal', 'Calle 21 # 11-18, Barranquilla', 'ACTIVE'),
(18, 'Bodega', 'Carrera 30 # 32-15, Barranquilla', 'ACTIVE'),
(19, 'Sede Principal', 'Calle 10 # 15-20, Valledupar', 'ACTIVE'),
(19, 'Bodega', 'Carrera 18 # 14-30, Valledupar', 'ACTIVE'),
(20, 'Sede Principal', 'Calle 9 # 10-10, Riohacha', 'INACTIVE'),
(20, 'Bodega', 'Carrera 7 # 19-25, Riohacha', 'INACTIVE');

-- ============================================================
-- 9. MENSAJEROS
-- ============================================================

INSERT INTO mensajeros
(nombre, descripcion, is_active)
VALUES
('Alejandro Rios', 'Mensajero urbano', 'ACTIVE'),
('Brayan Lopez', 'Mensajero urbano', 'ACTIVE'),
('Carlos Diaz', 'Mensajero regional', 'ACTIVE'),
('David Martinez', 'Mensajero urbano', 'ACTIVE'),
('Eduardo Torres', 'Mensajero regional', 'ACTIVE'),
('Fabian Mendoza', 'Mensajero urbano', 'ACTIVE'),
('Gabriel Castro', 'Mensajero urbano', 'ACTIVE'),
('Hector Ramirez', 'Mensajero regional', 'ACTIVE'),
('Ivan Gonzalez', 'Mensajero urbano', 'ACTIVE'),
('Jhon Perez', 'Mensajero urbano', 'ACTIVE'),
('Kevin Herrera', 'Mensajero regional', 'ACTIVE'),
('Luis Rojas', 'Mensajero urbano', 'ACTIVE'),
('Mateo Moreno', 'Mensajero urbano', 'ACTIVE'),
('Nicolas Vargas', 'Mensajero regional', 'ACTIVE'),
('Oscar Acosta', 'Mensajero urbano', 'ACTIVE'),
('Pablo Suarez', 'Mensajero urbano', 'ACTIVE'),
('Rafael Brito', 'Mensajero regional', 'ACTIVE'),
('Samuel Jimenez', 'Mensajero urbano', 'ACTIVE'),
('Tomas Medina', 'Mensajero urbano', 'ACTIVE'),
('Victor Epiayu', 'Mensajero regional', 'INACTIVE');

-- ============================================================
-- 10. RUTAS
-- ============================================================

INSERT INTO rutas
(nombre, descripcion, is_active)
VALUES
('Ruta Riohacha Centro', 'Recorrido urbano centro de Riohacha', 'ACTIVE'),
('Ruta Riohacha Norte', 'Zona norte de Riohacha', 'ACTIVE'),
('Ruta Riohacha Sur', 'Zona sur de Riohacha', 'ACTIVE'),
('Ruta Maicao Centro', 'Recorrido urbano de Maicao', 'ACTIVE'),
('Ruta Uribia', 'Recorrido urbano de Uribia', 'ACTIVE'),
('Ruta Valledupar Centro', 'Zona centro de Valledupar', 'ACTIVE'),
('Ruta Valledupar Norte', 'Zona norte de Valledupar', 'ACTIVE'),
('Ruta Valledupar Sur', 'Zona sur de Valledupar', 'ACTIVE'),
('Ruta Barranquilla Centro', 'Zona centro de Barranquilla', 'ACTIVE'),
('Ruta Barranquilla Norte', 'Zona norte de Barranquilla', 'ACTIVE'),
('Ruta Barranquilla Sur', 'Zona sur de Barranquilla', 'ACTIVE'),
('Ruta Santa Marta Centro', 'Zona centro de Santa Marta', 'ACTIVE'),
('Ruta Santa Marta Norte', 'Zona norte de Santa Marta', 'ACTIVE'),
('Ruta Santa Marta Sur', 'Zona sur de Santa Marta', 'ACTIVE'),
('Ruta Regional Caribe 1', 'Ruta regional Riohacha-Maicao', 'ACTIVE'),
('Ruta Regional Caribe 2', 'Ruta regional Riohacha-Valledupar', 'ACTIVE'),
('Ruta Regional Caribe 3', 'Ruta regional Barranquilla-Santa Marta', 'ACTIVE'),
('Ruta Empresarial 1', 'Ruta para clientes empresariales', 'ACTIVE'),
('Ruta Empresarial 2', 'Ruta para entregas especiales', 'ACTIVE'),
('Ruta Especial', 'Ruta para envios urgentes', 'INACTIVE');

-- ============================================================
-- 11. TARIFAS
-- ============================================================

INSERT INTO tarifas
(nombre, regla_calculo, valor_base, vigencia_desde, vigencia_hasta, is_active)
VALUES
('Tarifa Basica', 'Hasta 2 kg', 8000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Estandar', 'Hasta 5 kg', 12000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Premium', 'Hasta 10 kg', 18000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Urgente', 'Entrega prioritaria', 25000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional 1', 'Hasta 20 km', 22000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional 2', 'Hasta 50 km', 35000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional 3', 'Hasta 100 km', 50000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 1', 'Volumen empresarial', 15000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 2', 'Volumen alto', 13000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 3', 'Contrato especial', 11000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Fin de Semana', 'Entrega fin de semana', 20000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Nocturna', 'Entrega nocturna', 28000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Documentos', 'Documentos hasta 1 kg', 7000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Pequeña', 'Paquetes pequeños', 9000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Mediana', 'Paquetes medianos', 14000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Grande', 'Paquetes grandes', 23000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Corporativa', 'Clientes corporativos', 17000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Especial', 'Servicios especiales', 30000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Historica', 'Tarifa anterior', 6000.00, '2025-01-01', '2025-12-31', 'INACTIVE'),
('Tarifa Temporal', 'Servicio temporal', 10000.00, '2026-01-01', '2026-06-30', 'INACTIVE');

-- ============================================================
-- 12. ENVIOS
-- ============================================================

INSERT INTO envios
(
    empresa_id,
    mensajero_id,
    ruta_id,
    tarifa_id,
    direccion_recogida_id,
    direccion_entrega_id,
    referencia,
    descripcion,
    estado,
    prioridad,
    fecha_solicitud,
    fecha_entrega,
    is_active
)
VALUES
(1,1,1,1,1,2,'ENV-2026-0001','Documentos empresariales','ENTREGADO','NORMAL','2026-09-01 08:10:00','2026-09-02 14:30:00','ACTIVE'),
(2,2,2,2,3,4,'ENV-2026-0002','Paquete de productos','ENTREGADO','ALTA','2026-09-01 09:20:00','2026-09-03 10:15:00','ACTIVE'),
(3,3,6,3,5,6,'ENV-2026-0003','Material comercial','EN_TRANSITO','NORMAL','2026-09-02 10:00:00',NULL,'ACTIVE'),
(4,4,9,4,7,8,'ENV-2026-0004','Documentos administrativos','EN_ENTREGA','URGENTE','2026-09-02 11:30:00',NULL,'ACTIVE'),
(5,5,1,5,9,10,'ENV-2026-0005','Productos empresariales','ASIGNADO','ALTA','2026-09-03 08:45:00',NULL,'ACTIVE'),
(6,6,2,6,11,12,'ENV-2026-0006','Equipo tecnológico','EN_RECOGIDA','NORMAL','2026-09-03 09:30:00',NULL,'ACTIVE'),
(7,7,6,7,13,14,'ENV-2026-0007','Alimentos empacados','EN_TRANSITO','ALTA','2026-09-04 07:50:00',NULL,'ACTIVE'),
(8,8,12,8,15,16,'ENV-2026-0008','Documentos de transporte','ENTREGADO','NORMAL','2026-09-04 10:10:00','2026-09-05 16:20:00','ACTIVE'),
(9,9,9,9,17,18,'ENV-2026-0009','Mercancía importada','CREADO','NORMAL','2026-09-05 08:30:00',NULL,'ACTIVE'),
(10,10,4,10,19,20,'ENV-2026-0010','Documentos comerciales','CANCELADO','BAJA','2026-09-05 11:00:00',NULL,'ACTIVE'),
(11,11,2,11,21,22,'ENV-2026-0011','Medicamentos','ENTREGADO','URGENTE','2026-09-06 07:15:00','2026-09-06 13:40:00','ACTIVE'),
(12,12,6,12,23,24,'ENV-2026-0012','Material de oficina','CON_NOVEDAD','ALTA','2026-09-06 09:25:00',NULL,'ACTIVE'),
(13,13,1,13,25,26,'ENV-2026-0013','Material de construcción','EN_TRANSITO','NORMAL','2026-09-07 08:00:00',NULL,'ACTIVE'),
(14,14,9,14,27,28,'ENV-2026-0014','Equipos de red','ASIGNADO','ALTA','2026-09-07 10:20:00',NULL,'ACTIVE'),
(15,15,5,15,29,30,'ENV-2026-0015','Productos Wayuu','EN_ENTREGA','URGENTE','2026-09-08 07:40:00',NULL,'ACTIVE'),
(16,16,1,16,31,32,'ENV-2026-0016','Paquete comercial','CREADO','NORMAL','2026-09-08 11:10:00',NULL,'ACTIVE'),
(17,17,12,17,33,34,'ENV-2026-0017','Productos alimenticios','ENTREGADO','NORMAL','2026-09-09 08:50:00','2026-09-10 15:30:00','ACTIVE'),
(18,18,9,18,35,36,'ENV-2026-0018','Documentación logística','EN_TRANSITO','ALTA','2026-09-09 09:40:00',NULL,'ACTIVE'),
(19,19,7,19,37,38,'ENV-2026-0019','Mercancía regional','EN_RECOGIDA','NORMAL','2026-09-10 10:00:00',NULL,'ACTIVE'),
(20,20,20,20,39,40,'ENV-2026-0020','Servicio especial','CON_NOVEDAD','URGENTE','2026-09-10 13:20:00',NULL,'ACTIVE');

-- ============================================================
-- 13. PAQUETES
-- ============================================================

INSERT INTO paquetes
(
    envio_id,
    codigo,
    descripcion,
    peso,
    largo,
    ancho,
    alto,
    tipo_contenido,
    estado,
    is_active
)
VALUES
(1,'PAQ-0001','Sobre con documentos',0.50,30,22,2,'Documentos','ENTREGADO','ACTIVE'),
(2,'PAQ-0002','Caja de productos',3.20,40,30,20,'Productos','ENTREGADO','ACTIVE'),
(3,'PAQ-0003','Material comercial',5.50,50,35,25,'Material comercial','EN_TRANSITO','ACTIVE'),
(4,'PAQ-0004','Documentos urgentes',0.80,32,24,3,'Documentos','EN_TRANSITO','ACTIVE'),
(5,'PAQ-0005','Productos empresariales',7.00,55,40,30,'Productos','EN_TRANSITO','ACTIVE'),
(6,'PAQ-0006','Equipo tecnológico',4.80,45,35,25,'Tecnologia','EN_TRANSITO','ACTIVE'),
(7,'PAQ-0007','Alimentos empacados',8.50,60,40,35,'Alimentos','EN_TRANSITO','ACTIVE'),
(8,'PAQ-0008','Documentos de transporte',1.20,35,25,5,'Documentos','ENTREGADO','ACTIVE'),
(9,'PAQ-0009','Mercancía importada',6.30,50,40,30,'Mercancia','REGISTRADO','ACTIVE'),
(10,'PAQ-0010','Documentos comerciales',0.70,30,22,2,'Documentos','DEVUELTO','ACTIVE'),
(11,'PAQ-0011','Medicamentos',2.50,40,30,20,'Medicamentos','ENTREGADO','ACTIVE'),
(12,'PAQ-0012','Material de oficina',4.20,45,35,25,'Papeleria','CON_NOVEDAD','ACTIVE'),
(13,'PAQ-0013','Material de construcción',9.80,65,45,40,'Construccion','EN_TRANSITO','ACTIVE'),
(14,'PAQ-0014','Equipos de red',5.70,50,35,25,'Tecnologia','EN_TRANSITO','ACTIVE'),
(15,'PAQ-0015','Productos Wayuu',3.80,45,35,25,'Artesanias','EN_TRANSITO','ACTIVE'),
(16,'PAQ-0016','Paquete comercial',2.20,40,30,20,'Productos','REGISTRADO','ACTIVE'),
(17,'PAQ-0017','Productos alimenticios',6.80,55,40,30,'Alimentos','ENTREGADO','ACTIVE'),
(18,'PAQ-0018','Documentación logística',1.50,35,25,5,'Documentos','EN_TRANSITO','ACTIVE'),
(19,'PAQ-0019','Mercancía regional',7.50,60,40,35,'Mercancia','EN_TRANSITO','ACTIVE'),
(20,'PAQ-0020','Servicio especial',4.00,45,35,25,'Especial','CON_NOVEDAD','ACTIVE');

-- ============================================================
-- 14. EVENTOS DE TRACKING
-- ============================================================

INSERT INTO eventos_tracking
(
    envio_id,
    mensajero_id,
    estado,
    descripcion,
    latitud,
    longitud,
    fecha_evento,
    is_active
)
VALUES
(1,1,'ENTREGADO','Paquete entregado correctamente',11.5444,-72.9072,'2026-09-02 14:30:00','ACTIVE'),
(2,2,'ENTREGADO','Entrega confirmada por el receptor',11.5440,-72.9068,'2026-09-03 10:15:00','ACTIVE'),
(3,3,'EN_TRANSITO','En camino hacia destino',10.4631,-73.2532,'2026-09-04 08:20:00','ACTIVE'),
(4,4,'EN_ENTREGA','Mensajero en zona de entrega',11.0041,-74.8070,'2026-09-04 12:10:00','ACTIVE'),
(5,5,'ASIGNADO','Envío asignado al mensajero',11.5444,-72.9072,'2026-09-03 09:00:00','ACTIVE'),
(6,6,'EN_RECOGIDA','Mensajero dirigiéndose al punto de recogida',11.5448,-72.9065,'2026-09-03 10:00:00','ACTIVE'),
(7,7,'EN_TRANSITO','Paquete salió de origen',10.4635,-73.2538,'2026-09-04 11:30:00','ACTIVE'),
(8,8,'ENTREGADO','Entrega realizada',11.2408,-74.1990,'2026-09-05 16:20:00','ACTIVE'),
(9,9,'CREADO','Envío registrado en el sistema',10.9685,-74.7813,'2026-09-05 08:35:00','ACTIVE'),
(10,10,'CANCELADO','Envío cancelado por solicitud del cliente',11.0700,-72.8500,'2026-09-05 13:00:00','ACTIVE'),
(11,11,'ENTREGADO','Entrega confirmada',11.5440,-72.9068,'2026-09-06 13:40:00','ACTIVE'),
(12,12,'CON_NOVEDAD','Dirección presentó novedad',10.4630,-73.2530,'2026-09-06 12:30:00','ACTIVE'),
(13,13,'EN_TRANSITO','Envío en ruta regional',11.5442,-72.9070,'2026-09-07 14:00:00','ACTIVE'),
(14,14,'ASIGNADO','Envío asignado a mensajero',10.9680,-74.7810,'2026-09-07 11:00:00','ACTIVE'),
(15,15,'EN_ENTREGA','Envío próximo al destino',11.5250,-72.3900,'2026-09-08 15:00:00','ACTIVE'),
(16,16,'CREADO','Envío creado',11.5440,-72.9070,'2026-09-08 11:15:00','ACTIVE'),
(17,17,'ENTREGADO','Paquete recibido por el cliente',11.2405,-74.1985,'2026-09-10 15:30:00','ACTIVE'),
(18,18,'EN_TRANSITO','Envío en desplazamiento',10.9682,-74.7812,'2026-09-09 14:30:00','ACTIVE'),
(19,19,'EN_RECOGIDA','Pendiente de recogida',10.4632,-73.2535,'2026-09-10 10:30:00','ACTIVE'),
(20,20,'CON_NOVEDAD','Novedad reportada durante el proceso',11.5450,-72.9075,'2026-09-10 16:00:00','ACTIVE');

-- ============================================================
-- 15. FACTURAS
-- ============================================================

INSERT INTO facturas
(
    empresa_id,
    envio_id,
    numero_factura,
    subtotal,
    impuesto,
    total,
    estado,
    fecha_emision,
    fecha_vencimiento,
    is_active
)
VALUES
(1,1,'FAC-2026-0001',8000.00,1520.00,9520.00,'PAGADA','2026-09-02 15:00:00','2026-09-16 23:59:59','ACTIVE'),
(2,2,'FAC-2026-0002',12000.00,2280.00,14280.00,'PAGADA','2026-09-03 11:00:00','2026-09-17 23:59:59','ACTIVE'),
(3,3,'FAC-2026-0003',18000.00,3420.00,21420.00,'EMITIDA','2026-09-04 09:00:00','2026-09-18 23:59:59','ACTIVE'),
(4,4,'FAC-2026-0004',25000.00,4750.00,29750.00,'EMITIDA','2026-09-04 13:00:00','2026-09-18 23:59:59','ACTIVE'),
(5,5,'FAC-2026-0005',22000.00,4180.00,26180.00,'PENDIENTE','2026-09-03 10:00:00','2026-09-17 23:59:59','ACTIVE'),
(6,6,'FAC-2026-0006',35000.00,6650.00,41650.00,'PENDIENTE','2026-09-03 11:00:00','2026-09-17 23:59:59','ACTIVE'),
(7,7,'FAC-2026-0007',50000.00,9500.00,59500.00,'PAGADA','2026-09-04 12:00:00','2026-09-18 23:59:59','ACTIVE'),
(8,8,'FAC-2026-0008',15000.00,2850.00,17850.00,'PAGADA','2026-09-05 17:00:00','2026-09-19 23:59:59','ACTIVE'),
(9,9,'FAC-2026-0009',13000.00,2470.00,15470.00,'EMITIDA','2026-09-05 09:00:00','2026-09-19 23:59:59','ACTIVE'),
(10,10,'FAC-2026-0010',11000.00,2090.00,13090.00,'ANULADA','2026-09-05 14:00:00','2026-09-19 23:59:59','ACTIVE'),
(11,11,'FAC-2026-0011',20000.00,3800.00,23800.00,'PAGADA','2026-09-06 14:00:00','2026-09-20 23:59:59','ACTIVE'),
(12,12,'FAC-2026-0012',28000.00,5320.00,33320.00,'VENCIDA','2026-09-06 13:00:00','2026-09-20 23:59:59','ACTIVE'),
(13,13,'FAC-2026-0013',23000.00,4370.00,27370.00,'EMITIDA','2026-09-07 15:00:00','2026-09-21 23:59:59','ACTIVE'),
(14,14,'FAC-2026-0014',17000.00,3230.00,20230.00,'PENDIENTE','2026-09-07 12:00:00','2026-09-21 23:59:59','ACTIVE'),
(15,15,'FAC-2026-0015',30000.00,5700.00,35700.00,'EMITIDA','2026-09-08 16:00:00','2026-09-22 23:59:59','ACTIVE'),
(16,16,'FAC-2026-0016',9000.00,1710.00,10710.00,'PENDIENTE','2026-09-08 12:00:00','2026-09-22 23:59:59','ACTIVE'),
(17,17,'FAC-2026-0017',14000.00,2660.00,16660.00,'PAGADA','2026-09-10 16:00:00','2026-09-24 23:59:59','ACTIVE'),
(18,18,'FAC-2026-0018',17000.00,3230.00,20230.00,'EMITIDA','2026-09-09 15:00:00','2026-09-23 23:59:59','ACTIVE'),
(19,19,'FAC-2026-0019',22000.00,4180.00,26180.00,'VENCIDA','2026-09-10 11:00:00','2026-09-24 23:59:59','ACTIVE'),
(20,20,'FAC-2026-0020',25000.00,4750.00,29750.00,'PENDIENTE','2026-09-10 17:00:00','2026-09-24 23:59:59','ACTIVE');

-- ============================================================
-- 16. PRUEBAS DE ENTREGA
-- ============================================================

INSERT INTO pruebas_entrega
(
    envio_id,
    tipo_prueba,
    referencia_archivo,
    observacion,
    nombre_receptor,
    documento_receptor,
    fecha_prueba,
    is_active
)
VALUES
(1,'FIRMA','firma_envio_0001.jpg','Firma recibida correctamente','Carlos Mendoza','10010001','2026-09-02 14:30:00','ACTIVE'),
(2,'FOTO','foto_envio_0002.jpg','Fotografía de entrega','Laura Gonzalez','10010002','2026-09-03 10:15:00','ACTIVE'),
(3,'DOCUMENTO','doc_envio_0003.pdf','Documento firmado','Andres Rodriguez','10010003','2026-09-04 08:20:00','ACTIVE'),
(4,'CODIGO','COD-0004','Código de entrega validado','Maria Torres','10010004','2026-09-04 12:10:00','ACTIVE'),
(5,'FIRMA','firma_envio_0005.jpg','Recepción confirmada','Jorge Martinez','10010005','2026-09-03 09:00:00','ACTIVE'),
(6,'FOTO','foto_envio_0006.jpg','Registro fotográfico','Camila Herrera','10010006','2026-09-03 10:00:00','ACTIVE'),
(7,'DOCUMENTO','doc_envio_0007.pdf','Documento de soporte','Daniel Perez','10010007','2026-09-04 11:30:00','ACTIVE'),
(8,'FIRMA','firma_envio_0008.jpg','Firma del receptor','Sofia Ramirez','10010008','2026-09-05 16:20:00','ACTIVE'),
(9,'OTRA','evidencia_envio_0009.txt','Registro de evidencia','Miguel Castro','10010009','2026-09-05 08:35:00','ACTIVE'),
(10,'CODIGO','COD-0010','Código validado','Valentina Diaz','10010010','2026-09-05 13:00:00','ACTIVE'),
(11,'FIRMA','firma_envio_0011.jpg','Entrega confirmada','Juan Lopez','10010011','2026-09-06 13:40:00','ACTIVE'),
(12,'FOTO','foto_envio_0012.jpg','Evidencia de novedad','Natalia Vargas','10010012','2026-09-06 12:30:00','ACTIVE'),
(13,'DOCUMENTO','doc_envio_0013.pdf','Documento de entrega','Felipe Rojas','10010013','2026-09-07 14:00:00','ACTIVE'),
(14,'FIRMA','firma_envio_0014.jpg','Recepción registrada','Paula Moreno','10010014','2026-09-07 11:00:00','ACTIVE'),
(15,'CODIGO','COD-0015','Código de seguridad validado','Luis Epiayu','10010015','2026-09-08 15:00:00','ACTIVE'),
(16,'OTRA','evidencia_envio_0016.txt','Registro de entrega','Diana Brito','10010016','2026-09-08 11:15:00','ACTIVE'),
(17,'FIRMA','firma_envio_0017.jpg','Firma recibida','Sebastian Acosta','10010017','2026-09-10 15:30:00','ACTIVE'),
(18,'FOTO','foto_envio_0018.jpg','Fotografía de recepción','Andrea Jimenez','10010018','2026-09-09 14:30:00','ACTIVE'),
(19,'DOCUMENTO','doc_envio_0019.pdf','Documento de respaldo','Oscar Medina','10010019','2026-09-10 10:30:00','ACTIVE'),
(20,'FIRMA','firma_envio_0020.jpg','Recepción con novedad','Carolina Suarez','10010020','2026-09-10 16:00:00','ACTIVE');

-- ============================================================
-- VERIFICACIÓN DE DATOS
-- ============================================================

SELECT 'roles' AS tabla, COUNT(*) AS registros FROM roles
UNION ALL
SELECT 'users', COUNT(*) FROM users
UNION ALL
SELECT 'role_users', COUNT(*) FROM role_users
UNION ALL
SELECT 'resources', COUNT(*) FROM resources
UNION ALL
SELECT 'resource_roles', COUNT(*) FROM resource_roles
UNION ALL
SELECT 'empresas', COUNT(*) FROM empresas
UNION ALL
SELECT 'contactos', COUNT(*) FROM contactos
UNION ALL
SELECT 'direcciones', COUNT(*) FROM direcciones
UNION ALL
SELECT 'mensajeros', COUNT(*) FROM mensajeros
UNION ALL
SELECT 'rutas', COUNT(*) FROM rutas
UNION ALL
SELECT 'tarifas', COUNT(*) FROM tarifas
UNION ALL
SELECT 'envios', COUNT(*) FROM envios
UNION ALL
SELECT 'eventos_tracking', COUNT(*) FROM eventos_tracking
UNION ALL
SELECT 'facturas', COUNT(*) FROM facturas
UNION ALL
SELECT 'paquetes', COUNT(*) FROM paquetes
UNION ALL
SELECT 'pruebas_entrega', COUNT(*) FROM pruebas_entrega;