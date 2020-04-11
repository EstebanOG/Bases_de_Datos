SELECT 
titulo, 
CONCAT(nombre, " ", apellido) AS nombre_autor,
libros.fecha_creacion
FROM libros
INNER JOIN  autores ON libros.autor_id = autores.autor_id;