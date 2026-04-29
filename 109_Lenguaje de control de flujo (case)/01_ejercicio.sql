--Un profesor guarda las notas de sus alumnos de un curso en una tabla llamada "alumnos" que consta de los siguientes campos:

-- nombre (30 caracteres),
-- nota (valor entero entre 0 y 10, puede ser nulo),
--Eliminamos la tabla si existe y la creamos nuevamente:

 if object_id('alumnos') is not null
  drop table alumnos;

 create table alumnos(
  nombre varchar(40),
  nota tinyint,
    constraint CK_alunos_nota check (nota>=0 and nota<=10)
 );
--Ingresamos algunos registros:

 insert into alumnos values('Ana Acosta',8);
 insert into alumnos values('Carlos Caseres',4);
 insert into alumnos values('Federico Fuentes',2);
 insert into alumnos values('Gaston Guzman',3);
 insert into alumnos values('Hector Herrero',5);
 insert into alumnos values('Luis Luna',10);
 insert into alumnos values('Marcela Morales',7);
 insert into alumnos values('Marcela Morales',null);
--Queremos mostrar el nombre y nota de cada alumno y en una columna extra llamada "condicion" empleamos un case que testee la nota y muestre un mensaje diferente si en dicho campo hay un valor:

-- 0, 1, 2 ó 3: 'libre';
-- 4, 5 ó 6: 'regular';
-- 7, 8, 9 ó 10: 'promocionado';
--Esta es la sentencia:

 select nombre,nota, condicion=
 case nota
  when 0 then 'libre'
  when 1 then 'libre'
  when 2 then 'libre'
  when 3 then 'libre'
  when 4 then 'regular'
  when 5 then 'regular'
  when 6 then 'regular'
  when 7 then 'promocionado'
  when 8 then 'promocionado'
  when 9 then 'promocionado'
  when 10 then 'promocionado'
 end
from alumnos;
--Obtenemos la misma salida pero empleando el "case" con operadores de comparación:

 select nombre, nota, condicion=
  case 
   when nota<4 then 'libre'
   when nota >=4 and nota<7 then 'regular'
   when nota>=7 then 'promocionado'
   else 'sin nota'
  end
 from alumnos;
--Vamos a agregar el campo "condicion" a la tabla:

 alter table alumnos
  add condicion varchar(20);
--Veamos la tabla:

 select *from alumnos;
--Recordemos que se puede emplear una expresión "case" en cualquier lugar en el que pueda utilizar una expresión. Queremos actualizar el campo "condicion" para guardar la condición de cada alumno según su nota:

 update alumnos set condicion=
  case
   when nota<4 then 'libre'
   when nota between 4 and 7 then 'regular'
   when nota >7 then 'promocionado'
  end;
--Veamos la tabla actualizada:

 select *from alumnos;
--Note que el alumno sin nota contiene "null" en "condición" porque no especificamos valor para "else".

--Mostramos la cantidad de alumnos libres, regulares y aprobados y en una columna extra mostramos un mensaje, ordenamos por cantidad:

 select condicion, count(*) as cantidad,resultado=
  case condicion
    when 'libre' then 'repitentes'
    when 'regular' then 'rinden final'
    when 'promocionado' then 'no rinden final'
    else 'sin datos'
  end
 from alumnos
 group by condicion
 order by cantidad;