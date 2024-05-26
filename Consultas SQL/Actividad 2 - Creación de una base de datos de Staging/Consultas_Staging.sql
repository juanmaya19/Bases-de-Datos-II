
--Consultas para la generacion de bases de datos Staging


-- Tabla Producto

SELECT 
    ID_producto, 
    nombre, 
    Categoria, 
    cantidad_en_stock, 
    precio_venta, 
    precio_proveedor
FROM 
    jardineria.dbo.producto
ORDER BY 
    ID_producto ASC;

-- Tabla Empleado

SELECT 
    ID_empleado, 
    nombre, 
    apellido1, 
    email, 
    ID_oficina
FROM 
    jardineria.dbo.empleado
ORDER BY 
    ID_empleado ASC;

-- Tabla Oficina

SELECT  
    ID_oficina, 
    Descripcion, 
    ciudad, 
    telefono 
FROM 
    jardineria.dbo.oficina;

-- Tabla Cliente

SELECT 
    ID_cliente, 
    nombre_cliente, 
    telefono, 
    ciudad, 
    pais, 
    ID_empleado_rep_ventas
FROM 
    jardineria.dbo.cliente
ORDER BY 
    nombre_cliente ASC;

-- Tabla Categoría de Producto

SELECT 
    ID_Categoria, 
    Desc_Categoria
FROM 
    jardineria.dbo.Categoria_producto;

-- Tabla Pedido

SELECT 
	ID_pedido, 
	fecha_pedido, 
	estado, 
	ID_cliente
   
FROM 
    jardineria.dbo.pedido;


-- Tabla Dimensión de Tiempo (fecha_pedido)

SELECT 
    DISTINCT ID_pedido, fecha_pedido AS fecha
FROM 
    jardineria.dbo.pedido
ORDER BY 
    fecha_pedido ASC;
