
SELECT anio, mes, COUNT(*) AS total_pedidos
FROM dimension_tiempo
JOIN hechos_pedido ON dimension_tiempo.fecha_pedido = hechos_pedido.ID_tiempo
GROUP BY anio, mes
ORDER BY anio, mes;

SELECT c.ID_cliente, c.nombre_cliente, COUNT(h.ID_hecho) AS total_pedidos
FROM dimension_cliente c
JOIN hechos_pedido h ON c.ID_cliente = h.ID_cliente
GROUP BY c.ID_cliente, c.nombre_cliente
ORDER BY total_pedidos DESC;

SELECT c.ID_cliente, c.nombre_cliente, c.limite_credito, COUNT(h.ID_hecho) AS total_pedidos
FROM dimension_cliente c
JOIN hechos_pedido h ON c.ID_cliente = h.ID_cliente
WHERE c.limite_credito > 10000
GROUP BY c.ID_cliente, c.nombre_cliente, c.limite_credito
ORDER BY total_pedidos DESC;

SELECT p.ID_producto, p.nombre, SUM(h.cantidad) AS cantidad_total, SUM(h.total) AS ingreso_total
FROM dimension_producto p
JOIN hechos_pedido h ON p.ID_producto = h.ID_producto
GROUP BY p.ID_producto, p.nombre
ORDER BY ingreso_total DESC;

SELECT p.ID_producto, p.nombre, SUM(h.cantidad) AS cantidad_total
FROM dimension_producto p
JOIN hechos_pedido h ON p.ID_producto = h.ID_producto
WHERE p.Categoria = 1
GROUP BY p.ID_producto, p.nombre
ORDER BY cantidad_total DESC;

SELECT p.ID_cliente, c.nombre_cliente, SUM(p.total) AS total_pagado
FROM dimension_pago p
JOIN dimension_cliente c ON p.ID_cliente = c.ID_cliente
GROUP BY p.ID_cliente, c.nombre_cliente
ORDER BY total_pagado DESC;

SELECT forma_pago, SUM(total) AS total_pagado
FROM dimension_pago
GROUP BY forma_pago
ORDER BY total_pagado DESC;


SELECT t.anio, t.mes, SUM(h.total) AS total_ventas
FROM hechos_pedido h
JOIN dimension_tiempo t ON h.ID_tiempo = t.fecha_pedido
GROUP BY t.anio, t.mes
ORDER BY t.anio, t.mes;

SELECT c.ID_cliente, c.nombre_cliente, t.anio, SUM(h.total) AS total_ventas, SUM(h.cantidad) AS cantidad_total
FROM hechos_pedido h
JOIN dimension_cliente c ON h.ID_cliente = c.ID_cliente
JOIN dimension_tiempo t ON h.ID_tiempo = t.fecha_pedido
GROUP BY c.ID_cliente, c.nombre_cliente, t.anio

SELECT p.ID_producto, p.nombre, t.anio, t.trimestre, SUM(h.total) AS total_ventas
FROM hechos_pedido h
JOIN dimension_producto p ON h.ID_producto = p.ID_producto
JOIN dimension_tiempo t ON h.ID_tiempo = t.fecha_pedido
GROUP BY p.ID_producto, p.nombre, t.anio, t.trimestre
ORDER BY total_ventas DESC;

SELECT c.ID_cliente, c.nombre_cliente, p.ID_producto, p.nombre, SUM(h.total) AS total_ventas, SUM(h.cantidad) AS cantidad_total
FROM hechos_pedido h
JOIN dimension_cliente c ON h.ID_cliente = c.ID_cliente
JOIN dimension_producto p ON h.ID_producto = p.ID_producto
GROUP BY c.ID_cliente, c.nombre_cliente, p.ID_producto, p.nombre
ORDER BY total_ventas DESC;