USE Ventas_Tech_DB;
GO
SELECT
	v.fecha_venta,
	c.nombre AS cliente,
	c.ciudad,
	p.nombre_producto AS producto,
	cat.nombre_categoria AS categoria,
	v.cantidad,
	v.precio_unitario,
	(v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;
GO
SELECT
	c.nombre AS cliente,
	c.email,
	c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;
GO

SELECT
	p.nombre_producto AS producto,
	cat.nombre_categoria AS categoria,
	p.precio
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;
GO

WITH VentasCanal AS (
	SELECT
		fecha_venta,
		(cantidad * precio_unitario) AS total,
		'Online' AS canal
	FROM ventas
	WHERE fecha_venta < '2024-03-10'

	UNION ALL

	SELECT
		fecha_venta,
		(cantidad * precio_unitario) AS total,
		'Presencial' AS canal
	FROM ventas
	WHERE fecha_venta >= '2024-03-10'
)
SELECT
	canal,
	COUNT(*) AS total_pedidos,
	SUM(total) AS total_facturado
FROM VentasCanal
GROUP BY canal;
GO