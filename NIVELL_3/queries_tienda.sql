SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
-- CONSULTA 3, VERSIÓ 2:
SHOW COLUMNS FROM tienda.producto;
SELECT nombre, precio, FORMAT(precio * 1.10281, 2) FROM producto;
SELECT nombre AS producte, precio AS euros, FORMAT(precio * 1.10281, 2) AS dòlars_nord_americans FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1,2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- CONSULTES 11 I 12 MODIFICADES SENSE UTILITZAR JOINS:
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto; 
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC; 
SELECT * FROM fabricante LIMIT 5;
-- CONSULTA 17 CORREGIDA:
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.codigo, p.nombre, codigo_fabricante, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio LIMIT 1;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre = "lenovo";
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre = "crucial" WHERE p.precio > 200;
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo AND (f.nombre = "asus" OR f.nombre = "hewlett-packard" OR f.nombre = "seagate");
SELECT p.nombre, precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ("asus", "hewlett-packard", "seagate");
SELECT p.nombre, precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "%e";
SELECT p.nombre, precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP 'w';
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= 180 ORDER BY precio DESC, f.nombre;
SELECT DISTINCT f.codigo, f.nombre AS fabricante FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.codigo, f.nombre AS fabricante, COUNT(p.nombre) AS num_productos FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo GROUP BY f.nombre;
SELECT f.codigo, f.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante IS NULL GROUP BY f.nombre; 
-- CONSULTA 36 ARREGLADA, SENSE UTILITZAR ID:
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo from fabricante WHERE nombre REGEXP 'lenovo');
-- AQUESTA ERA LA CONSULTA 37, DIRIA QUE JA ESTAVA BÉ, NO UTILITZAVA ID...
SELECT * FROM producto p WHERE precio = (SELECT precio FROM producto WHERE nombre REGEXP 'lenovo' ORDER BY precio DESC LIMIT 1);
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP 'hewlett-packard' ORDER BY precio LIMIT 1;
-- CONSULTES 40/41: modifica dades de retorn
SELECT * FROM producto p WHERE precio >= (SELECT p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre REGEXP 'lenovo' ORDER BY precio DESC LIMIT 1);
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "asus" AND p.precio >= (SELECT SUM(p.precio) / COUNT(p.precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE "asus");
