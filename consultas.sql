-- database: /path/to/database.db
SELECT
    MIN(precio_unitario) AS precio_minimo,
    MAX(precio_unitario) AS precio_maximo,
    AVG(precio_unitario) AS precio_promedio
FROM
    Producto
;

-- Consulta para calcular la cantidad total de productos en stock por sucursal
SELECT
    s.id             AS sucursal_id,
    s.nombre         AS sucursal_nombre,
    SUM(st.cantidad) AS cantidad_total
FROM
    Sucursal s
    LEFT JOIN Stock st ON s.id = st.sucursal_id
GROUP BY
    s.id,
    s.nombre
ORDER BY
    sucursal_id
;

-- Consulta para obtener el total de ventas por cliente
SELECT
    c.id         AS cliente_id,
    c.nombre     AS cliente_nombre,
    SUM(o.total) AS total_ventas
FROM
    Cliente c
    LEFT JOIN Orden o ON c.id = o.cliente_id
GROUP BY
    c.id,
    c.nombre
ORDER BY
    cliente_id
;
