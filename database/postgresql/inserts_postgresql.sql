-- ============================================================
-- DATOS COMPLETOS - ENLACE EXPRESS
-- PostgreSQL
-- ============================================================

BEGIN;

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

INSERT INTO users (username, email, password, is_active, avatar) VALUES
('adminexpress', 'admin@enlaceexpress.co', 'hash_admin_001', 'ACTIVE', NULL),
('coord.despacho', 'despacho@enlaceexpress.co', 'hash_despacho_002', 'ACTIVE', NULL),
('facturacion01', 'facturacion@enlaceexpress.co', 'hash_fact_003', 'ACTIVE', NULL),
('operador01', 'operador1@enlaceexpress.co', 'hash_operador_004', 'ACTIVE', NULL),
('operador02', 'operador2@enlaceexpress.co', 'hash_operador_005', 'ACTIVE', NULL),
('mensajero01', 'mensajero1@enlaceexpress.co', 'hash_mensajero_006', 'ACTIVE', NULL),
('mensajero02', 'mensajero2@enlaceexpress.co', 'hash_mensajero_007', 'ACTIVE', NULL),
('cliente01', 'cliente1@enlaceexpress.co', 'hash_cliente_008', 'ACTIVE', NULL),
('cliente02', 'cliente2@enlaceexpress.co', 'hash_cliente_009', 'ACTIVE', NULL),
('cliente03', 'cliente3@enlaceexpress.co', 'hash_cliente_010', 'ACTIVE', NULL),
('cliente04', 'cliente4@enlaceexpress.co', 'hash_cliente_011', 'ACTIVE', NULL),
('cliente05', 'cliente5@enlaceexpress.co', 'hash_cliente_012', 'ACTIVE', NULL),
('cliente06', 'cliente6@enlaceexpress.co', 'hash_cliente_013', 'ACTIVE', NULL),
('cliente07', 'cliente7@enlaceexpress.co', 'hash_cliente_014', 'ACTIVE', NULL),
('cliente08', 'cliente8@enlaceexpress.co', 'hash_cliente_015', 'ACTIVE', NULL),
('cliente09', 'cliente9@enlaceexpress.co', 'hash_cliente_016', 'ACTIVE', NULL),
('cliente10', 'cliente10@enlaceexpress.co', 'hash_cliente_017', 'ACTIVE', NULL),
('cliente11', 'cliente11@enlaceexpress.co', 'hash_cliente_018', 'ACTIVE', NULL),
('cliente12', 'cliente12@enlaceexpress.co', 'hash_cliente_019', 'ACTIVE', NULL),
('cliente13', 'cliente13@enlaceexpress.co', 'hash_cliente_020', 'ACTIVE', NULL);

-- ============================================================
-- 3. RELACIÓN USUARIOS - ROLES
-- ============================================================

INSERT INTO role_users (role_id, user_id, is_active) VALUES
(1, 1, 'ACTIVE'),
(3, 2, 'ACTIVE'),
(5, 3, 'ACTIVE'),
(6, 4, 'ACTIVE'),
(6, 5, 'ACTIVE'),
(4, 6, 'ACTIVE'),
(4, 7, 'ACTIVE'),
(2, 8, 'ACTIVE'),
(2, 9, 'ACTIVE'),
(2, 10, 'ACTIVE'),
(2, 11, 'ACTIVE'),
(2, 12, 'ACTIVE'),
(2, 13, 'ACTIVE'),
(2, 14, 'ACTIVE'),
(2, 15, 'ACTIVE'),
(2, 16, 'ACTIVE'),
(2, 17, 'ACTIVE'),
(2, 18, 'ACTIVE'),
(2, 19, 'ACTIVE'),
(2, 20, 'ACTIVE');

-- ============================================================
-- 4. RECURSOS
-- ============================================================

INSERT INTO resources (path, method, is_active) VALUES
('/api/auth/login', 'POST', 'ACTIVE'),
('/api/auth/logout', 'POST', 'ACTIVE'),
('/api/users', 'GET', 'ACTIVE'),
('/api/users', 'POST', 'ACTIVE'),
('/api/empresas', 'GET', 'ACTIVE'),
('/api/empresas', 'POST', 'ACTIVE'),
('/api/envios', 'GET', 'ACTIVE'),
('/api/envios', 'POST', 'ACTIVE'),
('/api/envios/{id}', 'GET', 'ACTIVE'),
('/api/envios/{id}', 'PUT', 'ACTIVE'),
('/api/envios/{id}/tracking', 'GET', 'ACTIVE'),
('/api/tracking', 'POST', 'ACTIVE'),
('/api/mensajeros', 'GET', 'ACTIVE'),
('/api/mensajeros', 'POST', 'ACTIVE'),
('/api/rutas', 'GET', 'ACTIVE'),
('/api/rutas', 'POST', 'ACTIVE'),
('/api/tarifas', 'GET', 'ACTIVE'),
('/api/facturas', 'GET', 'ACTIVE'),
('/api/facturas', 'POST', 'ACTIVE'),
('/api/auditoria', 'GET', 'ACTIVE');

-- ============================================================
-- 5. RECURSOS - ROLES
-- ============================================================

INSERT INTO resource_roles (resource_id, role_id, is_active) VALUES
(1, 1, 'ACTIVE'),
(2, 1, 'ACTIVE'),
(3, 1, 'ACTIVE'),
(4, 1, 'ACTIVE'),
(5, 1, 'ACTIVE'),
(6, 1, 'ACTIVE'),
(7, 2, 'ACTIVE'),
(8, 2, 'ACTIVE'),
(9, 2, 'ACTIVE'),
(10, 3, 'ACTIVE'),
(11, 2, 'ACTIVE'),
(12, 4, 'ACTIVE'),
(13, 3, 'ACTIVE'),
(14, 1, 'ACTIVE'),
(15, 3, 'ACTIVE'),
(16, 3, 'ACTIVE'),
(17, 5, 'ACTIVE'),
(18, 5, 'ACTIVE'),
(19, 5, 'ACTIVE'),
(20, 1, 'ACTIVE');

-- ============================================================
-- 6. EMPRESAS
-- ============================================================

INSERT INTO empresas (nit, razon_social, contacto_principal, is_active) VALUES
('901701001-1', 'Distribuciones del Cesar S.A.S.', 'Carlos Mendoza', 'ACTIVE'),
('901701002-2', 'Comercializadora Valledupar S.A.S.', 'Laura Pineda', 'ACTIVE'),
('901701003-3', 'Servicios del Caribe S.A.S.', 'Andrés Molina', 'ACTIVE'),
('901701004-4', 'Insumos La Guajira S.A.S.', 'María Torres', 'ACTIVE'),
('901701005-5', 'Mercados del Norte S.A.S.', 'Julián Castro', 'ACTIVE'),
('901701006-6', 'Tecnología Integral S.A.S.', 'Paula Herrera', 'ACTIVE'),
('901701007-7', 'Soluciones Empresariales S.A.S.', 'Ricardo Díaz', 'ACTIVE'),
('901701008-8', 'Alimentos Santa Marta S.A.S.', 'Natalia Gómez', 'ACTIVE'),
('901701009-9', 'Logística Magdalena S.A.S.', 'Felipe Rojas', 'ACTIVE'),
('901701010-0', 'Ferretería Central S.A.S.', 'Sandra López', 'ACTIVE'),
('901701011-1', 'Papelería del Valle S.A.S.', 'Miguel Arias', 'ACTIVE'),
('901701012-2', 'Farmacéutica Regional S.A.S.', 'Diana Vargas', 'ACTIVE'),
('901701013-3', 'Electrodomésticos del Caribe S.A.S.', 'Oscar Ramírez', 'ACTIVE'),
('901701014-4', 'Construcciones del Norte S.A.S.', 'Camilo Suárez', 'ACTIVE'),
('901701015-5', 'Textiles del Cesar S.A.S.', 'Valentina Ruiz', 'ACTIVE'),
('901701016-6', 'Agroinsumos del Caribe S.A.S.', 'Sergio Martínez', 'ACTIVE'),
('901701017-7', 'Muebles y Diseño S.A.S.', 'Daniela Pérez', 'ACTIVE'),
('901701018-8', 'Importadora Regional S.A.S.', 'Juan Beltrán', 'ACTIVE'),
('901701019-9', 'Repuestos del Norte S.A.S.', 'Alejandro Silva', 'ACTIVE'),
('901701020-0', 'Comercial Caribe Express S.A.S.', 'Carolina Méndez', 'INACTIVE');

-- ============================================================
-- 7. CONTACTOS
-- ============================================================

INSERT INTO contactos (empresa_id, nombre, descripcion, is_active) VALUES
(1, 'Carlos Mendoza', 'Contacto administrativo principal', 'ACTIVE'),
(2, 'Laura Pineda', 'Contacto de operaciones', 'ACTIVE'),
(3, 'Andrés Molina', 'Contacto de logística', 'ACTIVE'),
(4, 'María Torres', 'Contacto de despachos', 'ACTIVE'),
(5, 'Julián Castro', 'Contacto comercial', 'ACTIVE'),
(6, 'Paula Herrera', 'Contacto de tecnología', 'ACTIVE'),
(7, 'Ricardo Díaz', 'Contacto administrativo', 'ACTIVE'),
(8, 'Natalia Gómez', 'Contacto de distribución', 'ACTIVE'),
(9, 'Felipe Rojas', 'Contacto logístico', 'ACTIVE'),
(10, 'Sandra López', 'Contacto de bodega', 'ACTIVE'),
(11, 'Miguel Arias', 'Contacto comercial', 'ACTIVE'),
(12, 'Diana Vargas', 'Contacto de compras', 'ACTIVE'),
(13, 'Oscar Ramírez', 'Contacto de operaciones', 'ACTIVE'),
(14, 'Camilo Suárez', 'Contacto de proyectos', 'ACTIVE'),
(15, 'Valentina Ruiz', 'Contacto comercial', 'ACTIVE'),
(16, 'Sergio Martínez', 'Contacto de almacén', 'ACTIVE'),
(17, 'Daniela Pérez', 'Contacto administrativo', 'ACTIVE'),
(18, 'Juan Beltrán', 'Contacto de importaciones', 'ACTIVE'),
(19, 'Alejandro Silva', 'Contacto de repuestos', 'ACTIVE'),
(20, 'Carolina Méndez', 'Contacto comercial', 'INACTIVE');

-- ============================================================
-- 8. DIRECCIONES
-- ============================================================

INSERT INTO direcciones (empresa_id, nombre, descripcion, is_active) VALUES
(1, 'Bodega Principal', 'Cra. 9 #18-42, Valledupar', 'ACTIVE'),
(1, 'Oficina Norte', 'Calle 12 #7-31, Valledupar', 'ACTIVE'),
(2, 'Sede Centro', 'Calle 16 #10-25, Valledupar', 'ACTIVE'),
(2, 'Bodega Comercial', 'Cra. 11 #21-18, Valledupar', 'ACTIVE'),
(3, 'Sede Caribe', 'Calle 35 #8-17, Barranquilla', 'ACTIVE'),
(3, 'Centro Logístico', 'Cra. 44 #72-30, Barranquilla', 'ACTIVE'),
(4, 'Bodega Riohacha', 'Cra. 7 #14-26, Riohacha', 'ACTIVE'),
(4, 'Oficina Principal', 'Calle 5 #9-40, Riohacha', 'ACTIVE'),
(5, 'Sucursal Sincelejo', 'Calle 22 #18-11, Sincelejo', 'ACTIVE'),
(5, 'Bodega Norte', 'Cra. 20 #25-18, Sincelejo', 'ACTIVE'),
(6, 'Sede Tecnología', 'Cra. 27 #45-16, Valledupar', 'ACTIVE'),
(6, 'Centro Técnico', 'Calle 30 #19-22, Valledupar', 'ACTIVE'),
(7, 'Oficina Empresarial', 'Cra. 15 #33-08, Montería', 'ACTIVE'),
(7, 'Bodega Industrial', 'Calle 41 #12-29, Montería', 'ACTIVE'),
(8, 'Planta Principal', 'Cra. 5 #26-44, Santa Marta', 'ACTIVE'),
(8, 'Centro de Distribución', 'Calle 18 #9-33, Santa Marta', 'ACTIVE'),
(9, 'Terminal Logística', 'Cra. 32 #14-55, Santa Marta', 'ACTIVE'),
(9, 'Oficina Magdalena', 'Calle 24 #15-10, Santa Marta', 'ACTIVE'),
(10, 'Ferretería Central', 'Cra. 6 #19-28, Valledupar', 'ACTIVE'),
(10, 'Bodega Materiales', 'Calle 9 #11-17, Valledupar', 'ACTIVE'),
(11, 'Papelería Centro', 'Calle 13 #6-22, Valledupar', 'ACTIVE'),
(11, 'Bodega Papelería', 'Cra. 8 #17-36, Valledupar', 'ACTIVE'),
(12, 'Centro Farmacéutico', 'Cra. 10 #28-19, Barranquilla', 'ACTIVE'),
(12, 'Bodega Medicamentos', 'Calle 40 #21-15, Barranquilla', 'ACTIVE'),
(13, 'Sede Electro', 'Cra. 46 #68-24, Barranquilla', 'ACTIVE'),
(13, 'Centro de Servicio', 'Calle 70 #39-12, Barranquilla', 'ACTIVE'),
(14, 'Oficina Construcción', 'Cra. 4 #32-16, Montería', 'ACTIVE'),
(14, 'Bodega Obras', 'Calle 27 #8-44, Montería', 'ACTIVE'),
(15, 'Sede Textil', 'Cra. 19 #24-17, Valledupar', 'ACTIVE'),
(15, 'Bodega Textil', 'Calle 8 #15-32, Valledupar', 'ACTIVE'),
(16, 'Agrocentro', 'Cra. 12 #17-25, Sincelejo', 'ACTIVE'),
(16, 'Bodega Agro', 'Calle 19 #13-40, Sincelejo', 'ACTIVE'),
(17, 'Muebles Principal', 'Cra. 21 #35-18, Valledupar', 'ACTIVE'),
(17, 'Sala de Distribución', 'Calle 29 #17-22, Valledupar', 'ACTIVE'),
(18, 'Importadora Centro', 'Cra. 51 #74-20, Barranquilla', 'ACTIVE'),
(18, 'Bodega Importaciones', 'Calle 78 #45-17, Barranquilla', 'ACTIVE'),
(19, 'Repuestos Norte', 'Cra. 8 #20-12, Riohacha', 'ACTIVE'),
(19, 'Bodega Repuestos', 'Calle 11 #6-35, Riohacha', 'ACTIVE'),
(20, 'Comercial Express', 'Cra. 3 #9-15, Cartagena', 'INACTIVE'),
(20, 'Bodega Express', 'Calle 10 #4-22, Cartagena', 'INACTIVE');

-- ============================================================
-- 9. MENSAJEROS
-- ============================================================

INSERT INTO mensajeros (nombre, descripcion, is_active) VALUES
('Mateo Hernández', 'Mensajero urbano', 'ACTIVE'),
('Samuel Torres', 'Mensajero regional', 'ACTIVE'),
('David Castillo', 'Mensajero urbano', 'ACTIVE'),
('Nicolás Vargas', 'Mensajero regional', 'ACTIVE'),
('Esteban Ríos', 'Mensajero urbano', 'ACTIVE'),
('Tomás Mendoza', 'Mensajero urbano', 'ACTIVE'),
('Gabriel Fuentes', 'Mensajero regional', 'ACTIVE'),
('Sebastián Lara', 'Mensajero urbano', 'ACTIVE'),
('Daniel Moreno', 'Mensajero urbano', 'ACTIVE'),
('Andrés Salcedo', 'Mensajero regional', 'ACTIVE'),
('Juan Carlos Peña', 'Mensajero urbano', 'ACTIVE'),
('Luis Fernando Díaz', 'Mensajero urbano', 'ACTIVE'),
('Manuel Ortega', 'Mensajero regional', 'ACTIVE'),
('Kevin Rodríguez', 'Mensajero urbano', 'ACTIVE'),
('Cristian Molina', 'Mensajero urbano', 'ACTIVE'),
('Brayan Gómez', 'Mensajero regional', 'ACTIVE'),
('Santiago Pérez', 'Mensajero urbano', 'ACTIVE'),
('Jorge Ramírez', 'Mensajero urbano', 'ACTIVE'),
('Felipe Navarro', 'Mensajero regional', 'ACTIVE'),
('Héctor Suárez', 'Mensajero temporal', 'INACTIVE');

-- ============================================================
-- 10. RUTAS
-- ============================================================

INSERT INTO rutas (nombre, descripcion, is_active) VALUES
('Ruta Valledupar Centro', 'Recorrido por zona centro de Valledupar', 'ACTIVE'),
('Ruta Valledupar Norte', 'Recorrido zona norte de Valledupar', 'ACTIVE'),
('Ruta Valledupar Sur', 'Recorrido zona sur de Valledupar', 'ACTIVE'),
('Ruta Riohacha Centro', 'Recorrido urbano en Riohacha', 'ACTIVE'),
('Ruta Riohacha Norte', 'Recorrido norte de Riohacha', 'ACTIVE'),
('Ruta Barranquilla Centro', 'Recorrido centro de Barranquilla', 'ACTIVE'),
('Ruta Barranquilla Norte', 'Recorrido zona norte de Barranquilla', 'ACTIVE'),
('Ruta Barranquilla Sur', 'Recorrido zona sur de Barranquilla', 'ACTIVE'),
('Ruta Santa Marta Centro', 'Recorrido urbano Santa Marta', 'ACTIVE'),
('Ruta Santa Marta Norte', 'Recorrido norte Santa Marta', 'ACTIVE'),
('Ruta Sincelejo Centro', 'Recorrido urbano Sincelejo', 'ACTIVE'),
('Ruta Sincelejo Sur', 'Recorrido sur de Sincelejo', 'ACTIVE'),
('Ruta Montería Centro', 'Recorrido centro de Montería', 'ACTIVE'),
('Ruta Montería Norte', 'Recorrido norte de Montería', 'ACTIVE'),
('Ruta Cartagena Centro', 'Recorrido urbano Cartagena', 'ACTIVE'),
('Ruta Caribe Empresarial', 'Ruta regional empresarial', 'ACTIVE'),
('Ruta Industrial', 'Ruta para zonas industriales', 'ACTIVE'),
('Ruta Comercial', 'Ruta para establecimientos comerciales', 'ACTIVE'),
('Ruta Regional Norte', 'Conexión entre ciudades del norte', 'ACTIVE'),
('Ruta Especial', 'Ruta temporal de distribución', 'INACTIVE');

-- ============================================================
-- 11. TARIFAS
-- ============================================================

INSERT INTO tarifas (nombre, regla_calculo, valor_base, vigencia_desde, vigencia_hasta, is_active) VALUES
('Tarifa Básica Urbana', 'Hasta 5 kg dentro de la ciudad', 8500.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Urbana Plus', 'Hasta 10 kg dentro de la ciudad', 10500.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional Corta', 'Envíos regionales hasta 50 km', 14500.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional Media', 'Envíos regionales hasta 150 km', 18500.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Regional Larga', 'Envíos regionales hasta 300 km', 24000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 1', 'Paquetes empresariales estándar', 12500.00, '2026-02-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 2', 'Paquetes empresariales medianos', 17500.00, '2026-02-01', NULL, 'ACTIVE'),
('Tarifa Empresarial 3', 'Paquetes empresariales grandes', 28500.00, '2026-02-01', NULL, 'ACTIVE'),
('Tarifa Express', 'Entrega prioritaria urbana', 22000.00, '2026-01-15', NULL, 'ACTIVE'),
('Tarifa Express Regional', 'Entrega prioritaria regional', 32000.00, '2026-01-15', NULL, 'ACTIVE'),
('Tarifa Documentos', 'Documentos hasta 1 kg', 7000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Pequeño', 'Paquetes pequeños', 9000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Mediano', 'Paquetes medianos', 16000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Grande', 'Paquetes grandes', 26000.00, '2026-01-01', NULL, 'ACTIVE'),
('Tarifa Especial', 'Carga especial', 35000.00, '2026-03-01', NULL, 'ACTIVE'),
('Tarifa Comercial', 'Envíos comerciales', 19000.00, '2026-02-15', NULL, 'ACTIVE'),
('Tarifa Corporativa', 'Convenio corporativo', 15500.00, '2026-02-01', NULL, 'ACTIVE'),
('Tarifa Nocturna', 'Servicio nocturno', 27000.00, '2026-02-01', NULL, 'ACTIVE'),
('Tarifa Antigua', 'Tarifa reemplazada', 11000.00, '2025-01-01', '2025-12-31', 'INACTIVE'),
('Tarifa Temporal', 'Tarifa temporal', 30000.00, '2025-06-01', '2025-12-31', 'INACTIVE');

-- ============================================================
-- 12. ENVÍOS
-- ============================================================

INSERT INTO envios
(empresa_id, mensajero_id, ruta_id, tarifa_id, direccion_recogida_id, direccion_entrega_id,
referencia, descripcion, estado, prioridad, fecha_solicitud, fecha_entrega, is_active)
VALUES
(1, 1, 1, 1, 1, 2, 'EX-2026-001', 'Documentos administrativos', 'ENTREGADO', 'NORMAL', '2026-08-01 08:15:00', '2026-08-01 14:20:00', 'ACTIVE'),
(1, 2, 2, 6, 1, 2, 'EX-2026-002', 'Paquete de suministros', 'EN_TRANSITO', 'ALTA', '2026-08-03 09:10:00', NULL, 'ACTIVE'),
(2, 3, 3, 2, 3, 4, 'EX-2026-003', 'Material promocional', 'EN_ENTREGA', 'URGENTE', '2026-08-05 10:30:00', NULL, 'ACTIVE'),
(2, 4, 16, 9, 3, 4, 'EX-2026-004', 'Documentos comerciales', 'ENTREGADO', 'NORMAL', '2026-08-06 07:50:00', '2026-08-06 16:10:00', 'ACTIVE'),
(3, 5, 6, 4, 5, 6, 'EX-2026-005', 'Equipos de oficina', 'ASIGNADO', 'ALTA', '2026-08-08 11:00:00', NULL, 'ACTIVE'),
(3, 6, 7, 7, 5, 6, 'EX-2026-006', 'Material publicitario', 'EN_RECOGIDA', 'NORMAL', '2026-08-09 08:40:00', NULL, 'ACTIVE'),
(4, 7, 4, 3, 7, 8, 'EX-2026-007', 'Insumos empresariales', 'ENTREGADO', 'NORMAL', '2026-08-10 09:20:00', '2026-08-10 15:35:00', 'ACTIVE'),
(5, 8, 11, 5, 9, 10, 'EX-2026-008', 'Mercancía para sucursal', 'CANCELADO', 'BAJA', '2026-08-11 13:15:00', NULL, 'ACTIVE'),
(6, 9, 1, 8, 11, 12, 'EX-2026-009', 'Componentes tecnológicos', 'ENTREGADO', 'URGENTE', '2026-08-12 07:30:00', '2026-08-12 12:45:00', 'ACTIVE'),
(7, 10, 13, 10, 13, 14, 'EX-2026-010', 'Documentación empresarial', 'EN_TRANSITO', 'NORMAL', '2026-08-13 10:05:00', NULL, 'ACTIVE'),
(8, 11, 9, 13, 15, 16, 'EX-2026-011', 'Productos alimenticios', 'ENTREGADO', 'ALTA', '2026-08-14 06:50:00', '2026-08-14 13:25:00', 'ACTIVE'),
(9, 12, 10, 14, 17, 18, 'EX-2026-012', 'Equipos logísticos', 'CON_NOVEDAD', 'URGENTE', '2026-08-15 09:45:00', NULL, 'ACTIVE'),
(10, 13, 18, 16, 19, 20, 'EX-2026-013', 'Herramientas industriales', 'ENTREGADO', 'NORMAL', '2026-08-16 08:20:00', '2026-08-16 15:00:00', 'ACTIVE'),
(11, 14, 1, 11, 21, 22, 'EX-2026-014', 'Papelería corporativa', 'CREADO', 'BAJA', '2026-08-17 14:30:00', NULL, 'ACTIVE'),
(12, 15, 6, 15, 23, 24, 'EX-2026-015', 'Medicamentos autorizados', 'EN_ENTREGA', 'URGENTE', '2026-08-18 07:40:00', NULL, 'ACTIVE'),
(13, 16, 7, 17, 25, 26, 'EX-2026-016', 'Electrodomésticos pequeños', 'ENTREGADO', 'NORMAL', '2026-08-19 09:15:00', '2026-08-19 17:20:00', 'ACTIVE'),
(14, 17, 13, 18, 27, 28, 'EX-2026-017', 'Material de construcción', 'EN_TRANSITO', 'ALTA', '2026-08-20 08:00:00', NULL, 'ACTIVE'),
(15, 18, 3, 1, 29, 30, 'EX-2026-018', 'Muestras textiles', 'ENTREGADO', 'NORMAL', '2026-08-21 10:10:00', '2026-08-21 14:40:00', 'ACTIVE'),
(16, 19, 12, 5, 31, 32, 'EX-2026-019', 'Productos agrícolas', 'ASIGNADO', 'ALTA', '2026-08-22 11:25:00', NULL, 'ACTIVE'),
(17, 1, 1, 2, 33, 34, 'EX-2026-020', 'Muebles empresariales', 'EN_ENTREGA', 'URGENTE', '2026-08-23 08:35:00', NULL, 'ACTIVE');

-- ============================================================
-- 13. PAQUETES
-- ============================================================

INSERT INTO paquetes
(envio_id, codigo, descripcion, peso, largo, ancho, alto, tipo_contenido, estado, is_active)
VALUES
(1, 'PKG-VE-001', 'Caja de documentos', 1.20, 30, 22, 8, 'Documentos', 'ENTREGADO', 'ACTIVE'),
(2, 'PKG-VE-002', 'Caja de suministros', 4.50, 40, 30, 20, 'Suministros', 'EN_TRANSITO', 'ACTIVE'),
(3, 'PKG-VE-003', 'Material promocional', 2.80, 35, 25, 15, 'Publicidad', 'EN_TRANSITO', 'ACTIVE'),
(4, 'PKG-VE-004', 'Documentos comerciales', 1.00, 30, 20, 7, 'Documentos', 'ENTREGADO', 'ACTIVE'),
(5, 'PKG-VE-005', 'Equipos de oficina', 8.60, 55, 40, 30, 'Electrónica', 'REGISTRADO', 'ACTIVE'),
(6, 'PKG-VE-006', 'Material publicitario', 3.20, 45, 35, 18, 'Publicidad', 'REGISTRADO', 'ACTIVE'),
(7, 'PKG-VE-007', 'Insumos empresariales', 5.40, 50, 35, 25, 'Insumos', 'ENTREGADO', 'ACTIVE'),
(8, 'PKG-VE-008', 'Mercancía comercial', 7.10, 60, 40, 30, 'Mercancía', 'DEVUELTO', 'ACTIVE'),
(9, 'PKG-VE-009', 'Componentes tecnológicos', 6.30, 45, 35, 25, 'Tecnología', 'ENTREGADO', 'ACTIVE'),
(10, 'PKG-VE-010', 'Documentación', 1.40, 32, 22, 9, 'Documentos', 'EN_TRANSITO', 'ACTIVE'),
(11, 'PKG-VE-011', 'Productos alimenticios', 9.50, 60, 45, 35, 'Alimentos', 'ENTREGADO', 'ACTIVE'),
(12, 'PKG-VE-012', 'Equipos logísticos', 12.20, 70, 50, 40, 'Equipos', 'CON_NOVEDAD', 'ACTIVE'),
(13, 'PKG-VE-013', 'Herramientas', 10.40, 65, 45, 30, 'Herramientas', 'ENTREGADO', 'ACTIVE'),
(14, 'PKG-VE-014', 'Papelería', 3.80, 45, 30, 20, 'Papelería', 'REGISTRADO', 'ACTIVE'),
(15, 'PKG-VE-015', 'Medicamentos', 4.20, 40, 30, 20, 'Medicamentos', 'EN_TRANSITO', 'ACTIVE'),
(16, 'PKG-VE-016', 'Electrodomésticos', 11.50, 70, 55, 40, 'Electrodomésticos', 'ENTREGADO', 'ACTIVE'),
(17, 'PKG-VE-017', 'Material construcción', 15.80, 80, 60, 45, 'Construcción', 'EN_TRANSITO', 'ACTIVE'),
(18, 'PKG-VE-018', 'Muestras textiles', 2.60, 40, 30, 15, 'Textiles', 'ENTREGADO', 'ACTIVE'),
(19, 'PKG-VE-019', 'Productos agrícolas', 13.40, 75, 55, 40, 'Agroinsumos', 'REGISTRADO', 'ACTIVE'),
(20, 'PKG-VE-020', 'Muebles empresariales', 18.20, 90, 65, 50, 'Muebles', 'EN_TRANSITO', 'ACTIVE');

-- ============================================================
-- 14. EVENTOS DE TRACKING
-- ============================================================

INSERT INTO eventos_tracking
(envio_id, mensajero_id, estado, descripcion, latitud, longitud, fecha_evento, is_active)
VALUES
(1, 1, 'CREADO', 'Solicitud registrada', 10.46314, -73.25322, '2026-08-01 08:15:00', 'ACTIVE'),
(2, 2, 'ASIGNADO', 'Mensajero asignado al envío', 10.47021, -73.25180, '2026-08-03 09:30:00', 'ACTIVE'),
(3, 3, 'EN_ENTREGA', 'Envío en ruta de entrega', 10.47650, -73.24510, '2026-08-05 13:10:00', 'ACTIVE'),
(4, 4, 'ENTREGADO', 'Entrega confirmada', 10.96540, -74.79630, '2026-08-06 16:10:00', 'ACTIVE'),
(5, 5, 'ASIGNADO', 'Mensajero asignado', 10.98210, -74.80120, '2026-08-08 11:20:00', 'ACTIVE'),
(6, 6, 'EN_RECOGIDA', 'Mensajero dirigiéndose al punto', 10.99020, -74.81240, '2026-08-09 09:10:00', 'ACTIVE'),
(7, 7, 'ENTREGADO', 'Paquete recibido por cliente', 11.54420, -72.90710, '2026-08-10 15:35:00', 'ACTIVE'),
(8, 8, 'CANCELADO', 'Solicitud cancelada por cliente', 9.30470, -75.39780, '2026-08-11 15:00:00', 'ACTIVE'),
(9, 9, 'ENTREGADO', 'Entrega completada', 10.46780, -73.25120, '2026-08-12 12:45:00', 'ACTIVE'),
(10, 10, 'EN_TRANSITO', 'Paquete trasladado a centro regional', 8.75750, -75.88580, '2026-08-13 12:20:00', 'ACTIVE'),
(11, 11, 'ENTREGADO', 'Entrega confirmada', 11.24080, -74.19900, '2026-08-14 13:25:00', 'ACTIVE'),
(12, 12, 'CON_NOVEDAD', 'Retraso por inconveniente logístico', 11.24500, -74.19020, '2026-08-15 14:10:00', 'ACTIVE'),
(13, 13, 'ENTREGADO', 'Paquete recibido', 10.47110, -73.25440, '2026-08-16 15:00:00', 'ACTIVE'),
(14, 14, 'CREADO', 'Solicitud registrada', 10.47280, -73.24910, '2026-08-17 14:30:00', 'ACTIVE'),
(15, 15, 'EN_ENTREGA', 'Mensajero en destino', 10.98200, -74.80220, '2026-08-18 11:50:00', 'ACTIVE'),
(16, 16, 'ENTREGADO', 'Entrega confirmada', 10.99050, -74.80510, '2026-08-19 17:20:00', 'ACTIVE'),
(17, 17, 'EN_TRANSITO', 'Carga trasladándose', 8.75020, -75.88900, '2026-08-20 13:40:00', 'ACTIVE'),
(18, 18, 'ENTREGADO', 'Entrega realizada', 10.46990, -73.25050, '2026-08-21 14:40:00', 'ACTIVE'),
(19, 19, 'ASIGNADO', 'Mensajero asignado', 9.29820, -75.39210, '2026-08-22 12:00:00', 'ACTIVE'),
(20, 1, 'EN_ENTREGA', 'Envío próximo al destino', 10.47540, -73.24770, '2026-08-23 13:50:00', 'ACTIVE');

-- ============================================================
-- 15. FACTURAS
-- ============================================================

INSERT INTO facturas
(empresa_id, envio_id, numero_factura, subtotal, impuesto, total,
estado, fecha_emision, fecha_vencimiento, is_active)
VALUES
(1, 1, 'FE-2026-0001', 8500.00, 1615.00, 10115.00, 'PAGADA', '2026-08-01 15:00:00', '2026-08-31 23:59:00', 'ACTIVE'),
(1, 2, 'FE-2026-0002', 12500.00, 2375.00, 14875.00, 'EMITIDA', '2026-08-03 10:00:00', '2026-09-02 23:59:00', 'ACTIVE'),
(2, 3, 'FE-2026-0003', 10500.00, 1995.00, 12495.00, 'PENDIENTE', '2026-08-05 11:00:00', '2026-09-04 23:59:00', 'ACTIVE'),
(2, 4, 'FE-2026-0004', 22000.00, 4180.00, 26180.00, 'PAGADA', '2026-08-06 17:00:00', '2026-09-05 23:59:00', 'ACTIVE'),
(3, 5, 'FE-2026-0005', 17500.00, 3325.00, 20825.00, 'EMITIDA', '2026-08-08 12:00:00', '2026-09-07 23:59:00', 'ACTIVE'),
(3, 6, 'FE-2026-0006', 14500.00, 2755.00, 17255.00, 'PENDIENTE', '2026-08-09 10:00:00', '2026-09-08 23:59:00', 'ACTIVE'),
(4, 7, 'FE-2026-0007', 14500.00, 2755.00, 17255.00, 'PAGADA', '2026-08-10 16:00:00', '2026-09-09 23:59:00', 'ACTIVE'),
(5, 8, 'FE-2026-0008', 24000.00, 4560.00, 28560.00, 'ANULADA', '2026-08-11 16:00:00', '2026-09-10 23:59:00', 'ACTIVE'),
(6, 9, 'FE-2026-0009', 28500.00, 5415.00, 33915.00, 'PAGADA', '2026-08-12 13:00:00', '2026-09-11 23:59:00', 'ACTIVE'),
(7, 10, 'FE-2026-0010', 32000.00, 6080.00, 38080.00, 'EMITIDA', '2026-08-13 13:00:00', '2026-09-12 23:59:00', 'ACTIVE'),
(8, 11, 'FE-2026-0011', 16000.00, 3040.00, 19040.00, 'PAGADA', '2026-08-14 14:00:00', '2026-09-13 23:59:00', 'ACTIVE'),
(9, 12, 'FE-2026-0012', 26000.00, 4940.00, 30940.00, 'VENCIDA', '2026-08-15 15:00:00', '2026-09-01 23:59:00', 'ACTIVE'),
(10, 13, 'FE-2026-0013', 19000.00, 3610.00, 22610.00, 'PAGADA', '2026-08-16 16:00:00', '2026-09-15 23:59:00', 'ACTIVE'),
(11, 14, 'FE-2026-0014', 7000.00, 1330.00, 8330.00, 'PENDIENTE', '2026-08-17 15:00:00', '2026-09-16 23:59:00', 'ACTIVE'),
(12, 15, 'FE-2026-0015', 35000.00, 6650.00, 41650.00, 'EMITIDA', '2026-08-18 12:00:00', '2026-09-17 23:59:00', 'ACTIVE'),
(13, 16, 'FE-2026-0016', 15500.00, 2945.00, 18445.00, 'PAGADA', '2026-08-19 18:00:00', '2026-09-18 23:59:00', 'ACTIVE'),
(14, 17, 'FE-2026-0017', 26000.00, 4940.00, 30940.00, 'EMITIDA', '2026-08-20 14:00:00', '2026-09-19 23:59:00', 'ACTIVE'),
(15, 18, 'FE-2026-0018', 9000.00, 1710.00, 10710.00, 'PAGADA', '2026-08-21 15:00:00', '2026-09-20 23:59:00', 'ACTIVE'),
(16, 19, 'FE-2026-0019', 24000.00, 4560.00, 28560.00, 'PENDIENTE', '2026-08-22 13:00:00', '2026-09-21 23:59:00', 'ACTIVE'),
(17, 20, 'FE-2026-0020', 27000.00, 5130.00, 32130.00, 'EMITIDA', '2026-08-23 14:00:00', '2026-09-22 23:59:00', 'ACTIVE');

-- ============================================================
-- 16. PRUEBAS DE ENTREGA
-- ============================================================

INSERT INTO pruebas_entrega
(envio_id, tipo_prueba, referencia_archivo, observacion,
nombre_receptor, documento_receptor, fecha_prueba, is_active)
VALUES
(1, 'FIRMA', 'firma_001.png', 'Entrega recibida correctamente', 'Carlos Pérez', 'CC1001001', '2026-08-01 14:20:00', 'ACTIVE'),
(2, 'FOTO', 'foto_002.jpg', 'Paquete en tránsito', 'Laura Gómez', 'CC1001002', '2026-08-03 09:30:00', 'ACTIVE'),
(3, 'CODIGO', 'codigo_003.txt', 'Código de entrega generado', 'Andrés Ruiz', 'CC1001003', '2026-08-05 13:10:00', 'ACTIVE'),
(4, 'FIRMA', 'firma_004.png', 'Entrega confirmada', 'María López', 'CC1001004', '2026-08-06 16:10:00', 'ACTIVE'),
(5, 'FOTO', 'foto_005.jpg', 'Paquete asignado', 'Jorge Castro', 'CC1001005', '2026-08-08 11:20:00', 'ACTIVE'),
(6, 'DOCUMENTO', 'doc_006.pdf', 'Documento de despacho', 'Paula Díaz', 'CC1001006', '2026-08-09 09:10:00', 'ACTIVE'),
(7, 'FIRMA', 'firma_007.png', 'Entrega completada', 'Sofía Torres', 'CC1001007', '2026-08-10 15:35:00', 'ACTIVE'),
(8, 'OTRA', 'cancelado_008.txt', 'Solicitud cancelada', 'Miguel Rojas', 'CC1001008', '2026-08-11 15:00:00', 'ACTIVE'),
(9, 'FOTO', 'foto_009.jpg', 'Entrega registrada', 'Daniel Herrera', 'CC1001009', '2026-08-12 12:45:00', 'ACTIVE'),
(10, 'DOCUMENTO', 'doc_010.pdf', 'Documento de transporte', 'Camila Vargas', 'CC1001010', '2026-08-13 12:20:00', 'ACTIVE'),
(11, 'FIRMA', 'firma_011.png', 'Cliente recibió mercancía', 'Pedro Molina', 'CC1001011', '2026-08-14 13:25:00', 'ACTIVE'),
(12, 'FOTO', 'foto_012.jpg', 'Novedad registrada', 'Andrea Peña', 'CC1001012', '2026-08-15 14:10:00', 'ACTIVE'),
(13, 'FIRMA', 'firma_013.png', 'Entrega realizada', 'Luis Castillo', 'CC1001013', '2026-08-16 15:00:00', 'ACTIVE'),
(14, 'DOCUMENTO', 'doc_014.pdf', 'Solicitud creada', 'Valeria Arias', 'CC1001014', '2026-08-17 14:30:00', 'ACTIVE'),
(15, 'CODIGO', 'codigo_015.txt', 'Código validado en entrega', 'Juan Torres', 'CC1001015', '2026-08-18 11:50:00', 'ACTIVE'),
(16, 'FIRMA', 'firma_016.png', 'Entrega confirmada', 'Natalia Ríos', 'CC1001016', '2026-08-19 17:20:00', 'ACTIVE'),
(17, 'FOTO', 'foto_017.jpg', 'Carga en traslado', 'Mateo Gómez', 'CC1001017', '2026-08-20 13:40:00', 'ACTIVE'),
(18, 'FIRMA', 'firma_018.png', 'Entrega confirmada', 'Daniela Castro', 'CC1001018', '2026-08-21 14:40:00', 'ACTIVE'),
(19, 'DOCUMENTO', 'doc_019.pdf', 'Orden de despacho', 'Sergio López', 'CC1001019', '2026-08-22 12:00:00', 'ACTIVE'),
(20, 'CODIGO', 'codigo_020.txt', 'Código de entrega generado', 'Carolina Ruiz', 'CC1001020', '2026-08-23 13:50:00', 'ACTIVE');

-- ============================================================
-- 17. REFRESH TOKENS
-- ============================================================

INSERT INTO refresh_tokens (user_id, token, expires_at, revoked_at) VALUES
(1, 'token_pg_001_admin', '2026-12-31 23:59:59', NULL),
(2, 'token_pg_002_despacho', '2026-12-31 23:59:59', NULL),
(3, 'token_pg_003_facturacion', '2026-12-31 23:59:59', NULL),
(4, 'token_pg_004_operador', '2026-12-31 23:59:59', NULL),
(5, 'token_pg_005_operador', '2026-12-31 23:59:59', NULL),
(6, 'token_pg_006_mensajero', '2026-12-31 23:59:59', NULL),
(7, 'token_pg_007_mensajero', '2026-12-31 23:59:59', NULL),
(8, 'token_pg_008_cliente', '2026-12-31 23:59:59', NULL),
(9, 'token_pg_009_cliente', '2026-12-31 23:59:59', NULL),
(10, 'token_pg_010_cliente', '2026-12-31 23:59:59', NULL);

-- ============================================================
-- 18. AUDITORÍA
-- ============================================================

INSERT INTO auditoria
(tabla_afectada, registro_id, accion, descripcion, fecha_evento)
VALUES
('empresas', 1, 'INSERT', 'Empresa registrada en el sistema', '2026-08-01 08:00:00'),
('empresas', 2, 'INSERT', 'Empresa registrada en el sistema', '2026-08-01 08:05:00'),
('envios', 1, 'INSERT', 'Envío creado', '2026-08-01 08:15:00'),
('envios', 2, 'INSERT', 'Envío creado', '2026-08-03 09:10:00'),
('envios', 3, 'INSERT', 'Envío creado', '2026-08-05 10:30:00'),
('envios', 4, 'UPDATE', 'Estado del envío actualizado', '2026-08-06 16:10:00'),
('envios', 7, 'UPDATE', 'Entrega registrada', '2026-08-10 15:35:00'),
('envios', 8, 'UPDATE', 'Envío cancelado', '2026-08-11 15:00:00'),
('envios', 9, 'UPDATE', 'Entrega registrada', '2026-08-12 12:45:00'),
('envios', 11, 'UPDATE', 'Entrega registrada', '2026-08-14 13:25:00'),
('envios', 12, 'UPDATE', 'Novedad registrada', '2026-08-15 14:10:00'),
('envios', 13, 'UPDATE', 'Entrega registrada', '2026-08-16 15:00:00'),
('envios', 16, 'UPDATE', 'Entrega registrada', '2026-08-19 17:20:00'),
('envios', 18, 'UPDATE', 'Entrega registrada', '2026-08-21 14:40:00'),
('facturas', 1, 'INSERT', 'Factura generada', '2026-08-01 15:00:00'),
('facturas', 4, 'UPDATE', 'Factura marcada como pagada', '2026-08-06 17:00:00'),
('facturas', 8, 'UPDATE', 'Factura anulada', '2026-08-11 16:00:00'),
('facturas', 12, 'UPDATE', 'Factura marcada como vencida', '2026-08-15 15:00:00'),
('users', 1, 'LOGIN', 'Inicio de sesión administrativo', '2026-08-23 07:30:00'),
('users', 4, 'LOGIN', 'Inicio de sesión de operador', '2026-08-23 08:00:00');

-- ============================================================
-- CONFIRMAR TODOS LOS CAMBIOS
-- ============================================================

COMMIT;

SELECT 'roles' AS tabla, COUNT(*) AS registros FROM roles
UNION ALL SELECT 'users', COUNT(*) FROM users
UNION ALL SELECT 'role_users', COUNT(*) FROM role_users
UNION ALL SELECT 'resources', COUNT(*) FROM resources
UNION ALL SELECT 'resource_roles', COUNT(*) FROM resource_roles
UNION ALL SELECT 'empresas', COUNT(*) FROM empresas
UNION ALL SELECT 'contactos', COUNT(*) FROM contactos
UNION ALL SELECT 'direcciones', COUNT(*) FROM direcciones
UNION ALL SELECT 'mensajeros', COUNT(*) FROM mensajeros
UNION ALL SELECT 'rutas', COUNT(*) FROM rutas
UNION ALL SELECT 'tarifas', COUNT(*) FROM tarifas
UNION ALL SELECT 'envios', COUNT(*) FROM envios
UNION ALL SELECT 'eventos_tracking', COUNT(*) FROM eventos_tracking
UNION ALL SELECT 'facturas', COUNT(*) FROM facturas
UNION ALL SELECT 'paquetes', COUNT(*) FROM paquetes
UNION ALL SELECT 'pruebas_entrega', COUNT(*) FROM pruebas_entrega
UNION ALL SELECT 'refresh_tokens', COUNT(*) FROM refresh_tokens
UNION ALL SELECT 'auditoria', COUNT(*) FROM auditoria
ORDER BY tabla;
