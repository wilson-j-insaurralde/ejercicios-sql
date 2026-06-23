Podemos crear un disparador para que se ejecute siempre que una instrucción "insert" ingrese datos en una tabla.



Sintaxis básica:



&#x20;create trigger NOMBREDISPARADOR

&#x20; on NOMBRETABLA

&#x20; for insert

&#x20;as 

&#x20;  SENTENCIAS

Analizamos la sintaxis:



"create trigger" junto al nombre del disparador; "on" seguido del nombre de la tabla para la cual se establece el trigger.



Luego de "for" se coloca el evento (en este caso "insert"), lo que indica que las inserciones sobre la tabla activarán el trigger.



Luego de "as" se especifican las condiciones y acciones, es decir, las condiciones que determinan cuando un intento de inserción provoca las acciones que el trigger realizará.



Creamos un trigger sobre la tabla "ventas" para el evento de inserción. Cada vez que se realiza un "insert" sobre "ventas", el disparador se ejecuta. El disparador controla que la cantidad que se intenta vender sea menor o igual al stock del libro y actualiza el campo "stock" de "libros", restando al valor anterior la cantidad vendida:



&#x20;create trigger DIS\_ventas\_insertar

&#x20; on ventas

&#x20; for insert

&#x20; as

&#x20;  declare @stock int

&#x20;  select @stock= stock from libros

&#x09;	 join inserted

&#x09;	 on inserted.codigolibro=libros.codigo

&#x09;	 where libros.codigo=inserted.codigolibro

&#x20; if (@stock>=(select cantidad from inserted))

&#x20;   update libros set stock=stock-inserted.cantidad

&#x20;    from libros

&#x20;    join inserted

&#x20;    on inserted.codigolibro=libros.codigo

&#x20;    where codigo=inserted.codigolibro

&#x20; else

&#x20; begin

&#x20;   raiserror ('Hay menos libros en stock de los solicitados para la venta', 16, 1)

&#x20;   rollback transaction

&#x20; end

Entonces, creamos el disparador ("create trigger") dándole un nombre ("DIS\_ventas\_insertar") sobre ("on") una tabla específica ("ventas") para ("for") el suceso de inserción ("insert"). Luego de "as" colocamos las sentencias, las acciones que el trigger realizará cuando se ingrese un registro en "ventas" (en este caso, controlar que haya stock y disminuir el stock de "libros").



Cuando se activa un disparador "insert", los registros se agregan a la tabla del disparador y a una tabla denominada "inserted". La tabla "inserted" es una tabla virtual que contiene una copia de los registros insertados; tiene una estructura similar a la tabla en que se define el disparador, es decir, la tabla en que se intenta la acción. La tabla "inserted" guarda los valores nuevos de los registros.



Dentro del trigger se puede acceder a esta tabla virtual "inserted" que contiene todos los registros insertados, es lo que hicimos en el disparador creado anteriormente, lo que solicitamos es que se le reste al "stock" de "libros", la cantidad ingresada en el nuevo registro de "ventas", valor que recuperamos de la tabla "inserted".



"rollback transaction" es la sentencia que deshace la transacción, es decir, borra todas las modificaciones que se produjeron en la última transacción restableciendo todo al estado anterior.



"raiserror" muestra un mensaje de error personalizado.



Para identificar fácilmente los disparadores de otros objetos se recomienda usar un prefijo y darles el nombre de la tabla para la cual se crean junto al tipo de acción.



La instrucción "writetext" no activa un disparador.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('ventas') is not null

&#x20; drop table ventas;

if object\_id('libros') is not null

&#x20; drop table libros;



create table libros(

&#x20; codigo int identity,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; precio decimal(6,2), 

&#x20; stock int,

&#x20; constraint PK\_libros primary key(codigo)

);



create table ventas(

&#x20; numero int identity,

&#x20; fecha datetime,

&#x20; codigolibro int not null,

&#x20; precio decimal (6,2),

&#x20; cantidad int,

&#x20; constraint PK\_ventas primary key(numero),

&#x20; constraint FK\_ventas\_codigolibro

&#x20;  foreign key (codigolibro) references libros(codigo)

);



go



insert into libros values('Uno','Richard Bach',15,100);

insert into libros values('Ilusiones','Richard Bach',18,50);

insert into libros values('El aleph','Borges',25,200);

insert into libros values('Aprenda PHP','Mario Molina',45,200);



go



\-- Creamos un disparador para que se ejecute cada vez que una instrucción "insert" 

\-- ingrese datos en "ventas"; el mismo controlará que haya stock en "libros"

\-- y actualizará el campo "stock":

create trigger DIS\_ventas\_insertar

&#x20; on ventas

&#x20; for insert

&#x20; as

&#x20;  declare @stock int

&#x20;  select @stock= stock from libros

&#x09;	 join inserted

&#x09;	 on inserted.codigolibro=libros.codigo

&#x09;	 where libros.codigo=inserted.codigolibro

&#x20; if (@stock>=(select cantidad from inserted))

&#x20;   update libros set stock=stock-inserted.cantidad

&#x20;    from libros

&#x20;    join inserted

&#x20;    on inserted.codigolibro=libros.codigo

&#x20;    where codigo=inserted.codigolibro

&#x20; else

&#x20; begin

&#x20;   raiserror ('Hay menos libros en stock de los solicitados para la venta', 16, 1)

&#x20;   rollback transaction

&#x20; end



go



set dateformat ymd;



\-- Ingresamos un registro en "ventas":

insert into ventas values('2018/04/01',1,15,1);

\-- Al ejecutar la sentencia de inserción anterior, se disparó el trigger, el registro

\-- se agregó a la tabla del disparador ("ventas") y disminuyó el valor del campo "stock"

\-- de "libros".



\-- Verifiquemos que el disparador se ejecutó consultando la tabla "ventas" y "libros":

select \* from ventas;

select \* from libros where codigo=1;



\-- Ingresamos un registro en "ventas", solicitando una cantidad superior al stock 

\-- (El disparador se ejecuta y muestra un mensaje, la inserción no se realizó porque

\-- la cantidad solicitada supera el stock.):

&#x20;insert into ventas values('2018/04/01',2,18,100);



&#x20;-- Finalmente probaremos ingresar una venta con un código de libro inexistente

&#x20;-- (El trigger no llegó a ejecutarse, porque la comprobación de restricciones 

&#x20;-- (que se ejecuta antes que el disparador) detectó que la infracción a la "foreign key"):

&#x20;insert into ventas values('2018/04/01',5,18,1);

