/*

Una empresa almacena datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe y créela con la siguiente estructura:
 if object_id('empleados') is not null
  drop table empleados;
 create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  fechanacimiento datetime,
  fechaingreso datetime,
  telefono char(12),
  mail varchar(50)
 );

2- Ingrese algunos registros:
  insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
  insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
  insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
  insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

3- Elimine la función "f_edad" si existe:
 if object_id('f_edad') is not null
  drop function f_edad;

4- Cree la función "f_edad" que reciba 2 fechas (de tipo datetime) y nos retorne un valor positivo 
correspondiente a la diferencia entre ambas.
Recuerde que en las funciones definidas por el usuario no pueden incluir funciones no 
determinísticas (como getdate), por ello, debemos enviar la fecha actual.
Note que la función retorna un valor positivo (tinyint), en ella se valida que la primera fecha a la 
cual se le  resta la segunda fecha sea mayor. Si quisiéramos calcular la cantidad de años entre dos 
fechas podríamos emplear la función del sistema "datediff" que retorna un int, esta función (ya 
vista) retorna un valor negativo si la primera fecha es menor a la segunda fecha enviada. Pero 
nosotros queremos la edad de una persona, así que siempre enviaremos como primera fecha una 
posterior a la segunda.

5- Muestre los nombres de los empleados y la edad (calculada con la función anteriormente creada)

6- Muestre el nombre de los empleados y la edad (calculada con la función "f_edad") que tenían al 
ingresar a la empresa y los años de servicio.

7- Llame a la función "f_edad" enviándole la fecha actual y su fecha de nacimiento y muestre el 
valor retornado.

8- Intente invocar la función sin enviarle valores.
Mensaje de error.

9- Llame a la función para que tome el valor por defecto del segundo argumento.

10- Elimine la función "f_valorNulo" si existe:
  if object_id('f_valorNulo') is not null
   drop function f_valorNulo;

11- Cree una función para reemplazar un valor "null" por el texto "No tiene".

12- Muestre todos los empleados, empleando la función "f_valorNulo" enviándole como argumento los 
campos "mail" y "telefono".


*/

 if object_id('empleados') is not null
  drop table empleados;

  create table empleados (	
  documento char(8) not null,
  nombre varchar(30),
  fechanacimiento datetime,
  fechaingreso datetime,
  telefono char(12),
  mail varchar(50)
  );

  insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
  insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
  insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
  insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

   if object_id('f_edad') is not null
  drop function f_edad;

  create function f_edad 
  (@fechaactual datetime,
   @fecha datetime='2007/01/01'
  )
  returns tinyint 
  as
   begin
    declare @edad tinyint
    set @edad=null
    if (@fechaactual>=@fecha)
    begin
      set @edad=datepart(year,@fechaactual)-datepart(year,@fecha)
      if (datepart(month,@fecha)>datepart(month,@fechaactual))
       set @edad=@edad-1
      else 
        if (datepart(month,@fecha)=datepart(month,@fechaactual)) and 
	   (datepart(day,@fecha)>datepart(day,@fechaactual))
          set @edad=@edad-1
     end--es mayor la actual
    return @edad
  end;

 select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad
  from empleados;

 select nombre, dbo.f_edad(fechaingreso,fechanacimiento) as 'edad al ingresar',
   dbo.f_edad(getdate(),fechaingreso) as 'años de servicio'
  from empleados;

 select dbo.f_edad(getdate(),'1971/05/25');

 select dbo.f_edad();

 select dbo.f_edad(getdate(),default);

  if object_id('f_valorNulo') is not null
   drop function f_valorNulo;

 create function f_valorNulo
 (@valor varchar(50))
 returns varchar(50)
 begin
  if @valor is null
   set @valor='No tiene'
  return @valor
 end;

 select documento,nombre,fechanacimiento,
  dbo.f_valorNulo(telefono) as telefono,
  dbo.f_valorNulo(mail) as mail
  from empleados;