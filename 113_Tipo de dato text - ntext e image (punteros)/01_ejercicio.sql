--Una librería almacena los datos de sus libros en una tabla llamada "libros".
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla con la siguiente estructura:

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2),
  sinopsis text
 );
--Ingresamos algunos registros:

 insert into libros values
 ('Ilusiones','Richard Bach','Planeta',15,null);
 insert into libros values
 ('Aprenda PHP','Mario Molina','Nuevo Siglo',45,
    'Trata todos los temas necesarios para el aprendizaje de PHP');
 insert into libros (titulo,autor,editorial) values
 ('Uno','Richard Bach','Planeta');
--Veamos la dirección que almacena cada registro en el campo de tipo "text" ("sinopsis") de la tabla "libros":

 select titulo, textptr(sinopsis) as direccion from libros;
--Note que un sólo libro, el segundo, tiene una dirección, los demás contienen "null".

--La siguiente consulta muestra si los punteros son válidos en cada registro del campo "sinopsis" de la tabla "libros":

 select titulo,
  textvalid('libros.sinopsis', textptr(sinopsis)) as 'Puntero valido'
  from libros;
--Note que el primer y tercer libro tienen punteros inválidos, en el primero porque se almacenó "null" y en el segundo, porque el campo no fue inicializado.

--Declaramos una variable a la cual le asignamos el valor del puntero a texto de un registro y luego vemos si dicho puntero es válido:

 declare @puntero varbinary(16)
 select @puntero = textptr(sinopsis) from libros
  where titulo= 'Ilusiones'
 select textvalid('libros.sinopsis', @puntero);
--Veamos el siguiente ejemplo:

 declare @puntero varbinary(16)
 select @puntero = textptr(sinopsis) from libros
 select textvalid('libros.sinopsis', @puntero);
--Declaramos una variable, almacenamos en ella el puntero a texto de "libros"; esta consulta retorna varios registros, por lo tanto, el puntero devuelve el valor del último registro (cuyo título es 'Uno'). Finalmente chequeamos si el valor del puntero es válido.