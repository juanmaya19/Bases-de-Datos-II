--Consultas transformacion

--DimProducto
SELECT 
    p.[ID_producto],
    p.[ID_producto_o],
    p.[nombre],
    p.[Categoria],
    c.[Desc_Categoria],
    p.[cantidad_en_stock],
    p.[precio_venta],
    p.[precio_proveedor],
    -- Columnas derivadas
    CASE 
        WHEN p.[cantidad_en_stock] > 100 THEN 'Alto'
        WHEN p.[cantidad_en_stock] BETWEEN 50 AND 100 THEN 'Medio'
        ELSE 'Bajo'
    END AS nivel_stock,
    p.[precio_venta] - p.[precio_proveedor] AS margen_ganancia,
    p.[precio_venta] * p.[cantidad_en_stock] AS valor_total_stock,
    LEN(p.[nombre]) AS longitud_nombre_producto,
    UPPER(p.[nombre]) AS nombre_mayuscula
FROM 
    [dbo].[DestinoTbProductoJr] p
JOIN 
    [dbo].[DestinoTbCatProductoJr] c ON p.[Categoria] = c.[ID_Categoria];


--DimHechosPedido
SELECT 
    DP.ID_hechospedido,
    DP.ID_hechospedido_o,
    C.ID_cliente,
    P.ID_producto,
    O.ID_oficina,
    E.ID_empleado,
    DP.cantidad,
    DP.precio_unidad,
    DP.total
FROM 
    [dbo].[DestinoTbPedidoJr] DP
INNER JOIN 
    [dbo].[DimCliente] C ON DP.ID_cliente = C.ID_cliente
INNER JOIN 
    [dbo].[DimProducto] P ON DP.ID_producto = P.ID_producto
INNER JOIN 
    [dbo].[DimOficina] O ON DP.ID_oficina = O.ID_oficina
INNER JOIN 
    [dbo].[DimEmpleado] E ON DP.ID_empleado = E.ID_empleado
INNER JOIN 
    [dbo].[DimTiempo] T ON DP.ID_hechospedido = T.ID_hechospedido;


--DimOficina
SELECT 
    [ID_oficina],
    [ID_oficina_o],
    [Descripcion],
    [ciudad],
    [telefono],
    -- Columnas derivadas
    CONCAT([Descripcion], ' - ', [ciudad]) AS descripcion_completa,
    CASE 
        WHEN [ciudad] IS NOT NULL THEN 'Ubicación Definida'
        ELSE 'Ubicación No Definida'
    END AS estado_ubicacion,
    LEN([Descripcion]) AS longitud_descripcion,
    LEFT([telefono], 3) AS codigo_area_telefono
FROM 
    [dbo].[DestinoTbOficinaJr];


--DimEmpleado
SELECT 
    e.[ID_empleado],
    e.[ID_empleado_o],
    e.[nombre],
    e.[apellido1],
    e.[email],
    e.[ID_oficina],
    o.[Descripcion] AS oficina_descripcion,
    o.[ciudad] AS oficina_ciudad,
    o.[telefono] AS oficina_telefono,
    -- Columnas derivadas
    CONCAT(e.[nombre], ' ', e.[apellido1]) AS nombre_completo,
    LEFT(e.[email], CHARINDEX('@', e.[email]) - 1) AS usuario_email,
    CASE 
        WHEN e.[ID_oficina] IS NOT NULL THEN 'Asignado'
        ELSE 'No asignado'
    END AS estado_oficina,
    LEN(e.[nombre]) + LEN(e.[apellido1]) AS longitud_nombre_completo,
    LOWER(e.[email]) AS email_minuscula
FROM 
    [dbo].[DestinoTbEmpleadoJr] e
JOIN 
    [dbo].[DestinoTbOficinaJr] o ON e.[ID_oficina] = o.[ID_oficina];


--DimDetPedido
SELECT 
    [ID_hechospedido],
    [ID_producto],
    [cantidad],
    [precio_unidad],
    [numero_linea],
    [cantidad] * [precio_unidad] AS total_linea
FROM 
    [dbo].[DestinoTbDetPedidoJr];

--DimCatProducto
SELECT 
    [ID_Categoria],
    [ID_Categoria_o],
    [Desc_Categoria],
    -- Columnas derivadas
    LEN([Desc_Categoria]) AS longitud_desc_categoria,
    UPPER([Desc_Categoria]) AS desc_categoria_mayuscula,
    CASE 
        WHEN [Desc_Categoria] LIKE 'A%' THEN 'Empieza con A'
        WHEN [Desc_Categoria] LIKE 'B%' THEN 'Empieza con B'
        ELSE 'Otro'
    END AS categoria_clasificacion
FROM 
    [dbo].[DestinoTbCatProductoJr];