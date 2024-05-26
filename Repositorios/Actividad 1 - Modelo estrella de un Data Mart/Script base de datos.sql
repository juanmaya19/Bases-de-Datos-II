-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS JardineriaModeloEstrella;
USE JardineriaModeloEstrella;

-- Creación de las dimensiones pertinentes
-- Dimensión Tiempo
CREATE TABLE dimension_tiempo (
  fecha_pedido DATE PRIMARY KEY COMMENT 'Fecha del pedido',
  anio INT COMMENT 'Año del pedido',
  mes INT COMMENT 'Mes del pedido',
  trimestre INT COMMENT 'Trimestre del pedido',
  dia_semana INT COMMENT 'Día de la semana del pedido'
);

-- Dimensión Cliente
CREATE TABLE dimension_cliente (
  ID_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente',
  nombre_contacto VARCHAR(30) COMMENT 'Nombre de contacto',
  apellido_contacto VARCHAR(30) COMMENT 'Apellido de contacto',
  telefono VARCHAR(15) NOT NULL COMMENT 'Teléfono del cliente',
  fax VARCHAR(15) COMMENT 'Fax del cliente',
  linea_direccion1 VARCHAR(50) NOT NULL COMMENT 'Dirección línea 1',
  linea_direccion2 VARCHAR(50) COMMENT 'Dirección línea 2',
  ciudad VARCHAR(50) NOT NULL COMMENT 'Ciudad del cliente',
  region VARCHAR(50) COMMENT 'Región del cliente',
  pais VARCHAR(50) COMMENT 'País del cliente',
  codigo_postal VARCHAR(10) COMMENT 'Código postal del cliente',
  ID_empleado_rep_ventas INT COMMENT 'ID del empleado representante de ventas',
  limite_credito DECIMAL(15,2) COMMENT 'Límite de crédito del cliente'
);

-- Dimensión Producto
CREATE TABLE dimension_producto (
  ID_producto INT PRIMARY KEY,
  CodigoProducto VARCHAR(15) NOT NULL COMMENT 'Código del producto',
  nombre VARCHAR(70) NOT NULL COMMENT 'Nombre del producto',
  Categoria INT COMMENT 'ID de la categoría del producto',
  dimensiones VARCHAR(25) COMMENT 'Dimensiones del producto',
  proveedor VARCHAR(50) COMMENT 'Proveedor del producto',
  descripcion TEXT COMMENT 'Descripción del producto',
  cantidad_en_stock SMALLINT NOT NULL COMMENT 'Cantidad en stock',
  precio_venta DECIMAL(15,2) NOT NULL COMMENT 'Precio de venta del producto',
  precio_proveedor DECIMAL(15,2) COMMENT 'Precio de proveedor del producto'
);

-- Dimensión Pago
CREATE TABLE dimension_pago (
  ID_pago INT PRIMARY KEY,
  ID_cliente INT NOT NULL COMMENT 'ID del cliente asociado al pago',
  forma_pago VARCHAR(40) NOT NULL COMMENT 'Forma de pago',
  id_transaccion VARCHAR(50) NOT NULL COMMENT 'ID de transacción',
  fecha_pago DATE NOT NULL COMMENT 'Fecha del pago',
  total DECIMAL(15,2) NOT NULL COMMENT 'Total del pago'
);

-- Creación de la tabla de hechos hechos_pedido
CREATE TABLE hechos_pedido (
  ID_hecho INT PRIMARY KEY,
  ID_cliente INT NOT NULL COMMENT 'ID del cliente asociado al pedido',
  ID_producto INT NOT NULL COMMENT 'ID del producto asociado al pedido',
  ID_pago INT NOT NULL COMMENT 'ID del pago asociado al pedido',
  ID_tiempo DATE NOT NULL COMMENT 'Fecha del pedido',
  cantidad INT COMMENT 'Cantidad del producto en el pedido',
  precio_unidad DECIMAL(15,2) COMMENT 'Precio unitario del producto en el pedido',
  total DECIMAL(15,2) COMMENT 'Total del pedido',

  -- Restricciones de integridad referencial
  FOREIGN KEY (ID_cliente) REFERENCES dimension_cliente (ID_cliente),
  FOREIGN KEY (ID_producto) REFERENCES dimension_producto (ID_producto),
  FOREIGN KEY (ID_pago) REFERENCES dimension_pago (ID_pago),
  FOREIGN KEY (ID_tiempo) REFERENCES dimension_tiempo (fecha_pedido)
);

-- Inserción de datos--
-- Inserción de datos en la dimensión Tiempo
INSERT INTO dimension_tiempo (fecha_pedido, anio, mes, trimestre, dia_semana)
VALUES

('2021-02-15', 2021, 2, 1, 1),
('2021-03-05', 2021, 3, 1, 3),
('2021-04-10', 2021, 4, 2, 6),
('2022-05-25', 2022, 5, 2, 2),
('2022-06-15', 2022, 6, 2, 4),
('2022-08-20', 2022, 8, 3, 2),
('2023-09-05', 2023, 9, 3, 5),
('2023-11-15', 2023, 11, 4, 3),
('2023-12-20', 2023, 12, 4, 6),
('2024-01-25', 2024, 1, 1, 7),
('2024-02-28', 2024, 2, 1, 2),
('2024-04-15', 2024, 4, 2, 7),
('2021-05-20', 2021, 5, 2, 3),
('2021-06-25', 2021, 6, 2, 5),
('2022-07-30', 2022, 7, 3, 1),
('2022-08-05', 2022, 8, 3, 3);

-- Inserción de datos en la dimensión Cliente
INSERT INTO dimension_cliente (ID_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, ciudad, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito)
VALUES
 
  (4, 'Vivero Verde', 'María', 'Gómez', '234-567-8901', '234-567-8902', 'Calle Flores 234', 'Barranquilla', 'Colombia', '34567', 4, 8000.00),
  (5, 'Plantas del Sol', 'Luis', 'Martínez', '678-901-2345', '678-901-2346', 'Calle del Sol 567', 'Cartagena', 'Colombia', '45678', 5, 6000.00),
  (6, 'Vivero Natural', 'Laura', 'Hernández', '890-123-4567', '890-123-4568', 'Avenida Verde 678', 'Santa Marta', 'Colombia', '56789', 6, 9000.00),
  (7, 'Flores Exóticas', 'Diego', 'Pérez', '012-345-6789', '012-345-6790', 'Calle Exótica 890', 'Pereira', 'Colombia', '67890', 7, 12000.00),
  (8, 'Jardín del Edén', 'Sofía', 'Castro', '345-678-9012', '345-678-9013', 'Avenida Paraíso 123', 'Manizales', 'Colombia', '78901', 8, 15000.00),
  (9, 'Floristería Bella Vista', 'Carlos', 'García', '567-890-1234', '567-890-1235', 'Calle Bella 456', 'Armenia', 'Colombia', '89012', 9, 11000.00),
  (10, 'Plantas de Ensueño', 'Elena', 'Vargas', '901-234-5678', '901-234-5679', 'Carrera Sueños 789', 'Bucaramanga', 'Colombia', '90123', 10, 13000.00),
  (11, 'Jardines de Primavera', 'Daniel', 'Rojas', '234-567-8901', '234-567-8902', 'Avenida Primavera 345', 'Barranquilla', 'Colombia', '01234', 11, 9500.00),
  (12, 'Vivero Campos Verdes', 'Mónica', 'Torres', '678-901-2345', '678-901-2346', 'Calle Campos 456', 'Cartagena', 'Colombia', '23456', 12, 10500.00),
  (13, 'Plantas Frescas', 'Gabriel', 'Silva', '890-123-4567', '890-123-4568', 'Carrera Fresca 678', 'Santa Marta', 'Colombia', '34567', 13, 14000.00);

-- Inserción de datos en la dimensión Producto
INSERT INTO dimension_producto (ID_producto, CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
VALUES
  (1, 'P1001', 'Planta de Interior', 1, '30x30x60 cm', 'Vivero Verde', 'Planta de interior ideal para espacios pequeños.', 50, 15.99, 10.50),
  (2, 'P1002', 'Herramienta de Jardín', 2, '25x10x5 cm', 'Ferretería Jardín', 'Herramienta para cavar y plantar.', 100, 9.99, 6.50),
  (3, 'P1003', 'Maceta Decorativa', 1, '20x20x20 cm', 'Decoraciones Flores', 'Maceta decorativa para plantas de interior.', 75, 7.50, 5.25);
  (4, 'P1004', 'Fertilizante Orgánico', 3, '10x5x20 cm', 'Agricultura Sostenible', 'Fertilizante natural para el crecimiento de plantas.', 200, 12.50, 8.75),
  (5, 'P1005', 'Césped Artificial', 4, '100x100 cm', 'Jardines Verdes', 'Césped artificial de alta calidad.', 30, 29.99, 20.50),
  (6, 'P1006', 'Riego Automático', 2, '5x5x5 cm', 'Tecnología Agro', 'Sistema automático de riego para jardines.', 50, 49.99, 35.75),
  (7, 'P1007', 'Semillas de Flores', 3, '5x5x1 cm', 'Semillas Selectas', 'Paquete de semillas para flores variadas.', 1000, 5.99, 3.50),
  (8, 'P1008', 'Tijeras de Podar', 2, '20x10x2 cm', 'Herramientas Jardín', 'Tijeras profesionales para poda de plantas.', 80, 15.99, 12.50),
  (9, 'P1009', 'Sustrato Universal', 3, '30x20x10 cm', 'Productos Hortícolas', 'Sustrato para plantas de interior y exterior.', 150, 9.50, 6.99),
  (10, 'P1010', 'Insecticida Ecológico', 3, '15x10x5 cm', 'Control de Plagas', 'Insecticida natural para el control de plagas.', 120, 14.75, 10.25),
  (11, 'P1011', 'Escalera de Jardín', 4, '150x50x30 cm', 'Mobiliario Exterior', 'Escalera decorativa para jardines.', 10, 69.99, 50.00),
  (12, 'P1012', 'Cortadora de Césped', 2, '100x50x80 cm', 'Herramientas Jardín', 'Cortadora de césped eléctrica.', 5, 199.99, 150.50),
  (13, 'P1013', 'Controlador de Riego', 2, '10x5x2 cm', 'Tecnología Agro', 'Dispositivo inteligente para controlar el riego.', 30, 39.99, 28.50);

-- Inserción de datos en la dimensión Pago
INSERT INTO dimension_pago (ID_pago, ID_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES
	(1, 1, 'Tarjeta de Crédito', 'TRANS001', '2024-01-05', 100.00),
	(2, 2, 'Efectivo', 'TRANS002', '2024-02-10', 75.50),
	(3, 3, 'Transferencia Bancaria', 'TRANS003', '2024-03-15', 150.25);
	(4, 4, 'Tarjeta de Crédito', 'TRANS004', '2024-04-20', 120.00),
	(5, 5, 'Efectivo', 'TRANS005', '2024-05-25', 90.75),
	(6, 6, 'Transferencia Bancaria', 'TRANS006', '2024-06-30', 180.50),
	(7, 7, 'Tarjeta de Débito', 'TRANS007', '2024-07-10', 80.25),
	(8, 8, 'Efectivo', 'TRANS008', '2024-08-15', 135.00),
	(9, 9, 'Transferencia Bancaria', 'TRANS009', '2024-09-20', 95.50),
	(10, 10, 'Tarjeta de Crédito', 'TRANS010', '2024-10-25', 200.75),
	(11, 1, 'Efectivo', 'TRANS011', '2024-11-30', 70.25),
	(12, 2, 'Transferencia Bancaria', 'TRANS012', '2024-12-05', 150.00),
	(13, 3, 'Tarjeta de Débito', 'TRANS013', '2024-01-10', 110.50);

-- Inserción de datos en la tabla de hechos hechos_pedido
INSERT INTO hechos_pedido (ID_hecho, ID_cliente, ID_producto, ID_pago, ID_tiempo, cantidad, precio_unidad, total)
VALUES
  (1, 1, 1, 1, '2024-01-01', 5, 15.99, 79.95),
  (2, 2, 2, 2, '2024-02-05', 2, 9.99, 19.98),
  (3, 3, 3, 3, '2024-03-10', 3, 7.50, 22.50),
  (6, 3, 1, 4, '2024-03-10', 3, 7.50, 22.50),
  (2, 4, 2, 2, '2024-01-01', 5, 15.99, 79.95),
  (2, 3, 2, 2, '2024-02-05', 2, 9.99, 19.98),
  (5, 6, 6, 3, '2024-03-10', 3, 7.50, 22.50),
  (7, 4, 4, 1, '2024-03-10', 3, 7.50, 22.50);
  
  -- Consultas --
  
-- producto más vendido --
SELECT p.nombre AS producto, SUM(hp.cantidad) AS total_vendido
FROM hechos_pedido hp
JOIN dimension_producto p ON hp.ID_producto = p.ID_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 1;

-- categoría con más productos --
SELECT Categoria, COUNT(*) AS Cantidad_Productos
FROM dimension_producto
GROUP BY Categoria
ORDER BY Cantidad_Productos DESC
LIMIT 1;

 -- año con más ventas--
SELECT YEAR(t.fecha_pedido) AS año, SUM(hp.total) AS total_ventas
FROM hechos_pedido hp
JOIN dimension_tiempo t ON hp.ID_tiempo = t.fecha_pedido
GROUP BY YEAR(t.fecha_pedido)
ORDER BY total_ventas DESC
LIMIT 1;




