--Eliminamos, si existen, los procedimientos almacenados siguientes:

 if object_id('pa_multiplicar') is not null
  drop proc pa_multiplicar;
 if object_id('pa_factorial') is not null
  drop proc pa_factorial;
--Creamos un procedimiento almacenado que reciba 2 números enteros y nos retorne el producto de los mismos:

 create procedure pa_multiplicar
  @numero1 int,
  @numero2 int,
  @producto int output
  as
   select @producto=@numero1*@numero2;
--Probamos el procedimiento anterior:

  declare @x int
  exec pa_multiplicar 3,9, @x output
  select @x as '3*9'
  exec pa_multiplicar 50,8, @x output
  select @x as '50*8';
--Creamos un procedimiento que nos retorne el factorial de un número, tal procedimiento llamará al procedimiento "pa_multiplicar":

 create procedure pa_factorial
  @numero int
 as
  if @numero>=0 and @numero<=12
  begin
   declare @resultado int
   declare @num int
   set @resultado=1 
   set @num=@numero 
   while (@num>1)
   begin
     exec pa_multiplicar @resultado,@num, @resultado output
     set @num=@num-1
   end
   select rtrim(convert(char,@numero))+'!='+convert(char,@resultado)
  end
  else select 'Debe ingresar un número entre 0 y 12';
--Note que en el procedimiento controlamos que el valor sea positivo, además, como los parámetros fueron definidos de tipo "int" el valor no debe superar 12 porque el factorial excede el tipo.

--Ejecutamos el procedimiento que nos retorna el factorial de un número:

 exec pa_factorial 5;
 exec pa_factorial 10;
--Veamos las dependencias del procedimiento "pa_multiplicar":

 exec sp_depends pa_multiplicar;
--Recordemos que "sp_depends" nos informa sobre los objetos dependientes del objeto nombrado (en este caso el procedimiento "pa_multiplicar"), mostrando el nombre y tipo de objeto (en este caso el procedimiento "pa_factorial") y, si existieren, los objetos de los cuales el objeto depende (en este caso, ninguno).

--Veamos las dependencias del procedimiento "pa_factorial":

 exec sp_depends pa_factorial;
--Recordemos que "sp_depends" nos informa sobre los objetos de los cuales depende el objeto nombrado (en este caso el procedimiento "pa_multiplicar"), mostrando el nombre, tipo y columna (en este caso el procedimiento "pa_multiplicar") y, si existieren, los objetos dependientes de él (en este caso, ninguno).