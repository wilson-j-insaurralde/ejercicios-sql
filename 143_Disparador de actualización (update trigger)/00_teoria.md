Podemos crear un disparador para que se ejecute siempre que una instrucción "update" actualice los datos de una tabla.



Sintaxis básica:



&#x20;create trigger NOMBREDISPARADOR

&#x20; on NOMBRETABLA

&#x20; for update

&#x20;as 

&#x20;  SENTENCIAS

Analizamos la sintaxis:



"create trigger" junto al nombre del disparador; "on" seguido del nombre de la tabla para la cual se establece el trigger.



Luego de "for" se coloca el evento (en este caso "update"), lo que indica que las actualizaciones sobre la tabla activarán el trigger.



Luego de "as" se especifican las condiciones y acciones, es decir, las condiciones que determinan cuando un intento de modificación provoca las acciones que el trigger realizará.



El siguiente disparador de actualización se crea para evitar que se modifiquen los datos de la tabla "libros":



&#x20;create trigger DIS\_libros\_actualizar

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;   raiserror('Los datos de la tabla "libros" no pueden modificarse', 10, 1)

&#x20;   rollback transaction

Entonces, creamos el disparador ("create trigger") dándole un nombre ("DIS\_libros\_actualizar") sobre una tabla específica ("libros") para ("for") el suceso de actualización ("update"). Luego de "as" colocamos las sentencias, las acciones que el trigger realizará cuando se intente actualizar uno o varios registros en "libros" (en este caso, impedir las modificaciones).



Cuando se ejecuta una instrucción "update" en una tabla que tiene definido un disparador, los registros originales (antes de ser actualizados) se mueven a la tabla virtual "deleted" y los registros actualizados (con los nuevos valores) se copian a la tabla virtual "inserted". Dentro del trigger se puede acceder a estas tablas.



En el cuerpo de un trigger se puede emplear la función "update(campo)" que recibe un campo y retorna verdadero si el evento involucra actualizaciones (o inserciones) en ese campo; en caso contrario retorna "false".



Creamos un disparador que evite que se actualice el campo "precio" de la tabla "libros":



&#x20;create trigger DIS\_libros\_actualizar\_precio

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;  if update(precio)

&#x20;  begin

&#x20;   raiserror('El precio de un libro no puede modificarse.', 10, 1)

&#x20;   rollback transaction

&#x20;  end;

Empleamos "if update()" para que el trigger controle la actualización del campo "precio"; así, cuando el disparador detecte una actualización en tal campo, realizará las acciones apropiadas (mostrar un mensaje y deshacer la actualización); en caso que se actualice otro campo, el disparador se activa, pero permite la transacción.



Creamos un disparador de actualización que muestra el valor anterior y nuevo valor de los registros actualizados:



&#x20;create trigger DIS\_libros\_actualizar2

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;  if (update(titulo) or update(autor) or update(editorial)) and

&#x20;   not (update(precio) or update(stock))

&#x20;  begin

&#x20;   select d.codigo,

&#x20;   (d.titulo+'-'+ d.autor+'-'+d.editorial) as 'registro anterior',

&#x20;   (i.titulo+'-'+ i.autor+'-'+i.editorial) as 'registro actualizado'

&#x20;    from deleted as d

&#x20;    join inserted as i

&#x20;    on d.codigo=i.codigo

&#x20;  end

&#x20;  else

&#x20;  begin

&#x20;   raiserror('El precio y stock no pueden modificarse. La actualización no se realizó.', 10, 1)

&#x20;   rollback transaction

&#x20;  end;

Empleamos "if update" para que el trigger controle si la actualización se realiza en ciertos campos permitidos (titulo, autor y editorial) y no en los campos prohibidos (precio y stock)); si se modifican los campos permitidos y ninguno de los no permitidos, mostrará los antiguos y nuevos valores consultando las tablas "deleted" e "inserted", en caso que se actualice un campo no permitido, el disparador muestra un mensaje y deshace la transacción.



Note que el disparador no controla los intentos de actualización sobre el campo "codigo", esto es porque tal campo, no puede modificarse porque está definido "identity", si intentamos modificarlo, SQL Server muestra un mensaje de error y el trigger no llega a dispararse.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&#x20; drop table libros;



create table libros(

&#x20; codigo int identity,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; editorial varchar(20),

&#x20; precio decimal(6,2), 

&#x20; stock int,

&#x20; constraint PK\_libros primary key(codigo)

);



go



insert into libros values('Uno','Richard Bach','Planeta',15,100);

insert into libros values('Alicia en el pais...','Lewis Carroll','Planeta',18,50);

insert into libros values('El aleph','Borges','Emece',25,200);

insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45,200);



go



\-- Creamos un disparador para evitar que se modifiquen los datos de la tabla "libros":

create trigger DIS\_libros\_actualizar

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;   raiserror('Los datos de la tabla "libros" no pueden modificarse', 10, 1)

&#x20;   rollback transaction;



go



\-- Intentamos realizar alguna actualización en "libros":

update libros set titulo='Alicia en el pais de las maravillas' where codigo=2;

\-- El disparador se activó, mostró un mensaje y deshizo la actualización.



\-- Eliminamos el disparador creado anteriormente:

drop trigger DIS\_libros\_actualizar;



go



\-- Creamos un disparador que evite que se actualice el campo "precio" de la tabla "libros":

create trigger DIS\_libros\_actualizar\_precio

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;  if update(precio)

&#x20;  begin

&#x20;   raiserror('El precio de un libro no puede modificarse.', 10, 1)

&#x20;   rollback transaction

&#x20;  end;



go



\-- Veamos qué sucede si intentamos actualizar el precio de un libro:

update libros set precio=30 where codigo=2;

\-- El disparador se activa, muestra un mensaje y deshace la transacción.



\-- Veamos qué sucede al actualizar el campo "titulo":

update libros set titulo='Alicia en el pais de las maravillas' where codigo=2;

\-- El disparador se activa y realiza la transacción



\-- Lo verificamos consultando la tabla:

select \* from libros;



\-- Veamos qué sucede si intentamos actualizar el precio y la editorial de un libro:

update libros set precio=30,editorial='Emece' where codigo=1;

\-- El disparador se activa, muestra un mensaje y deshace la transacción; 

\--el registro no fue actualizado.



\-- Lo verificamos consultando la tabla:

select \* from libros;



\-- Eliminamos el disparador creado anteriormente:

drop trigger DIS\_libros\_actualizar\_precio;



go



\-- Creamos un disparador de actualización que muestra el valor anterior y nuevo valor de los

\-- registros actualizados. El trigger debe controlar que la actualización se realice en los 

\-- campos "titulo", "autor" y "editorial" y no en los demás campos (precio y stock));

\-- si se modifican los campos permitidos y ninguno de los no permitidos, mostrará los antiguos

\-- y nuevos valores consultando las tablas "deleted" e "inserted", en caso que se actualice

\-- un campo no permitido, el disparador muestra un mensaje y deshace la transacción:

create trigger DIS\_libros\_actualizar2

&#x20; on libros

&#x20; for update

&#x20; as

&#x20;  if (update(titulo) or update(autor) or update(editorial)) and

&#x20;   not (update(precio) or update(stock))

&#x20;  begin

&#x20;   select (d.titulo+'-'+ d.autor+'-'+d.editorial) as 'registro anterior',

&#x20;   (i.titulo+'-'+ i.autor+'-'+i.editorial) as 'registro actualizado'

&#x20;    from deleted as d

&#x20;    join inserted as i

&#x20;    on d.codigo=i.codigo

&#x20;  end

&#x20;  else

&#x20;  begin

&#x20;   raiserror('El precio y stock no pueden modificarse. La actualización no se realizó.', 10, 1)

&#x20;   rollback transaction

&#x20;  end;



go



\-- Veamos qué sucede si modificamos campos permitidos:

update libros set editorial='Paidos', autor='Desconocido' where codigo>3;

\-- El trigger se dispara y muestra los registros modificados, los valores antes 

\-- y después de la transacción.



\-- Veamos qué sucede si en la sentencia "update" intentamos modificar algún campo no permitido:

update libros set editorial='Paidos', precio=30 where codigo>3;

\-- El trigger se dispara y muestra el mensaje de error, la transacción no se realizó.



\-- Intentamos modificar el código de un libro:

&#x20;update libros set codigo=9 where codigo>=3; 

\-- El disparador no llega a dispararse porque SQL Server muestra un mensaje de error ya que el

\-- campo "codigo", por ser "identity", no puede modificarse.

