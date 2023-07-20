USE Biblioteca1
go

--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: CONSULTAS :::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

select * from Autor
select * from Configuracion
select * from Editorial
select * from Estudiante
select * from materia
select * from Prestamo
select * from Usuarios

--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: VISTAS ::::::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--1- Cree la vista "vista_prestamos" que muestre el id del préstamo, código del estudiante y el id del libro.
create view vista_prestamos
as
	select Prestamo.id as 'Codigo Prestamos',Estudiante.codigo as 'Codigo Estudiante',libro.id as 'Codigo Libro'
	from Prestamo inner join Estudiante on Prestamo.codigo_estudiante = Estudiante.codigo inner join libro on Prestamo.id_libro = libro.id
	
--2- Consulte la vista ordenada los datos completos del estudiante y el id del prestamo.

create view Ordenar_codigoEstudiante
as
	select E.codigo,E.DNI,E.nombre,E.apellido,E.carrera,E.direccion,E.celular,E.estado
	from Prestamo inner join Estudiante as E on Prestamo.codigo_estudiante = E.codigo

--3- Crear una vista "vista_estado " que nuestre los estudiante con estado 1

create view Vista_estado
as
	select *
	from Estudiante
	where estado = 1

--4- Crear una vista "vistasPrestamos_activos" mostrar las los prestamos activos

create view vistasPrestamos_activos
as
	select * 
	from Prestamo
	where estado = 1

create view 

--5- crear una vista de usuarios activos

create view vistaUsuarios
as
	select *
	from Usuarios
	where estado = 1

--6- Intente eliminar un registro de la vista para el cual haya inscritos.

drop view vistaUsuarios

--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: PROCEDIMIENTOS ::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- Escriba un procedimiento que filtre los libros cuyo cantidad en stock esta en un rango


create proc pr_filtrarLibros(@min int,@max int)
as
	select *
	from libro
	where cantidad >= @min and cantidad <= @max



--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: FUNCIONES :::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--1 Escriba una funcion que retorne la cantidad en stock y que se ingrese el titulo como entrada 

select *
from libro

create function f_libros_stock(@titulo varchar(20))
returns integer
as
	begin
	declare @resultado integer;
	select @resultado = cantidad
	from libro
	where titulo = @titulo
	return @resultado
	end

select dbo.f_libros_stock('tu');

-- Escriba una funcion que se envie como entrada su codigo del estudiante y id_libro y devuelva cuantos libros se presto 
-- y en caso que no se presto envie como resultado que "no tiene prestamos"

create function f_CantidadLibros(@codigo varchar(20),@id_libro int)
returns varchar(30)
as
	begin 
	declare @cant integer
	declare @resultado varchar(20) = 0

	select @cant = cantidad
	from Prestamo
	where codigo_estudiante = @codigo and id_libro = @id_libro
	
	begin
	if(@cant != 0)
		set @resultado = CONVERT(varchar(30),@cant)
	else 
		return 'No tiene prestamos'
	end
	return @resultado
	end

select dbo.f_CantidadLibros('201068',2)  as 'Resultado';
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: TRIGGERS ::::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--Crear un trigger que cuando se actualize la tabla de Prestamo, no le permita cambiar el estado de 1 a 0 

create trigger SeguridadUpdate
on Prestamo
for Update
as
	if(exists (select * from inserted where estado = 1))
		begin 
		print 'No puede modificar los datos de la tabla prestamo'
		rollback
		end


--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: TRIGGERS  DDL :::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- crear trigger que no permite que se borre ni una tabla por casualidad

CREATE TRIGGER Seguridad
ON DATABASE
for DROP_TABLE
as
	PRINT 'Para borrar esta tabla debes desahabilitar el trigger'
	rollback transaction


--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::: TRANSFERENCIAS ::::::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


BEGIN TRANSACTION 
insert into Prestamo values (1,'201034',2,'02/10/2022','10/10/2022',2,'Ninguna',1)

if(@@ERROR <> 0)
	BEGIN 
	ROLLBACK
	PRINT 'ERROR'
	END
else 
	begin
	commit 
	print 'Completado'
	END





