--Obtener todos los libros escritos por autores que cuenten con un seudónimo.
SELECT 
titulo 
FROM libros 
WHERE libros.autor_id 
IN (SELECT 
    autores.autor_id 
    FROM autores 
    WHERE seudonimo 
    IS NOT NULL ORDER BY autores.autor_id ASC) 
ORDER BY titulo ASC;

--Obtener el título de todos los libros publicados en el año actual cuyos autores poseen un pseudónimo.

SELECT 
libros.titulo, libros.fecha_publicacion
FROM libros
WHERE libros.autor_id
IN(SELECT
   autores.autor_id
   FROM autores
   WHERE seudonimo
   IS NOT NULL ORDER BY autores.autor_id ASC
   );

--Obtener todos los libros escritos por autores que cuenten con un seudónimo y que hayan nacido ante de 1965.

SELECT 
titulo 
FROM libros 
WHERE libros.autor_id 
IN (SELECT  autor_id
    FROM autores 
    WHERE seudonimo IS NOT NULL AND fecha_nacimiento < "1965-01-01") 
ORDER BY titulo ASC;

--Colocar el mensaje no disponible a la columna descripción, en todos los libros publicados antes del año 2000.

UPDATE libros SET descripcion = "No disponible" WHERE libros.fecha_publicacion < "2000-01-01";

--Obtener la llave primaria de todos los libros cuya descripción sea diferente de no disponible.

SELECT libro_id FROM libro WHERE descripcion != "No disponible" ;

--Obtener el título de los últimos 3 libros escritos por el autor con id 2.

SELECT titulo FROM libros WHERE autor_id = 2 ORDER BY fecha_publicacion DESC LIMIT 3;

--Obtener en un mismo resultado la cantidad de libros escritos por autores con seudónimo y sin seudónimo.

