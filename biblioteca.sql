create database Biblioteca1
go
use Biblioteca1

create table Autor (
	id Integer IDENTITY(1,1),-- id autoincremnta
	autor varchar(100),
	imagen varchar (100),
	estado binary 
)

--Agregando primary key a la tabla autor
ALTER TABLE Autor
ADD constraint PK_Autor
primary key(id);

-- agregando una restriccion para que sea pura letras la columna autor

alter table Autor
add constraint CHK_autor_letras
check(autor like '[A-Z]')


-- insertando datos 
 insert into autor(autor,imagen,estado) values('Larry wall','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\lary.jpg',1)
 insert into autor(autor,imagen,estado) values('andres velardo','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\seg.jpg',1)
 insert into autor(autor,imagen,estado) values('erick jhorep','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\ter.jpg',1)
 insert into autor(autor,imagen,estado) values('alex vilchez','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\tge.jpg',0)
 insert into autor(autor,imagen,estado) values('juana vartez','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\jua.jpg',1)


 drop table Configuracion
create table Configuracion(
	id_c integer not null, 
	nombre varchar(60), 
	celular char(10), --9 digitos -- puro numero
	direccion varchar(60), 
	correo varchar(80)  -- que contenga @
)

--primary key

alter table Configuracion
add constraint PK_id_c
primary key(id_c)

--restriccion para que solo sea 9 digitos
alter table Configuracion
add constraint CHK_celular_numeros
check (celular like '9%')

--restricciones para que el correo contenga 
alter table Configuracion
add constraint CHK_correo_arroba
check (correo like '%@%')

--insertando los datos
insert into Configuracion values(1,'Erick soto','926706376','av.renzo michelli','erick24@gmail.com')
insert into Configuracion values(2,'juan zabala','946606376','av.renzo michelli','juanZA@gmail.com')
insert into Configuracion values(3,'keyti arone','916716376','av.renzo michelli','keytiAro@gmail.com')
insert into Configuracion values(4,'lucia gerad','925446376','av.renzo michelli','lucia14@gmail.com')
insert into Configuracion values(5,'mehmed sulpi','966706376','av.renzo michelli','mehmed2@gmail.com')


create table Editorial(
	id_e integer not null, 
	editorial varchar(100), 
	estado binary, --boolean
)

--primary key

alter table Editorial
add constraint PK_id_e
primary key(id_e)

insert into Editorial values(1,'Ambar',1)
insert into Editorial values(2,'Futura',1)
insert into Editorial values(3,'Maria trinidad',0)
insert into Editorial values(4,'Macro',0)
insert into Editorial values(5,'colmena de editores',1)

create table Estudiante(
	codigo char(6) not null, --char 6 digitos 
	DNI char(8), -- char puro numeros
	nombre varchar(40), 
	apellido varchar(50), 
	carrera varchar(100),
	direccion varchar(60),
	celular char(9), -- numeros    
	estado binary -- booleano - bit
)

-- primary key
alter table Estudiante
add constraint PK_codigo
primary key (codigo)

--puro numero en el dni

alter table Estudiante
add constraint CHK_dni_numeros
check (DNI like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

-- insertando datos

insert into Estudiante values('201068','73639719','erick','soto','Ingenieria de sistemas e informatica','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201045','83639719','edward','velasquez','Ingenieria de sistemas e informatica','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201041','13139719','lucia','velardo','Administracion','av. Inca garcilazo','985613456',0)
insert into Estudiante values('201034','63639719','katherine','helit','Ingenieria civil','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201015','43239719','briz','chuyma','Docente','av. Inca garcilazo','955613456',1)


create table materia(
	id integer not null, 
	materia varchar(80),
	estado binary --bit
)

--primary key
alter table materia
add constraint PK_id
primary key(id)

--insertando datos
insert into materia values(12,'Fisica',1)
insert into materia values(22,'fundamentos de programacion',1)
insert into materia values(32,'data ciencia',1)
insert into materia values(42,'redes',0)
insert into materia values(52,'discreta',0)


create table libro(
	id integer not null,
	titulo varchar(100),
	cantidad integer,
	id_autor integer, --foreing
	id_editorial integer, --foreig
	id_materia integer, --foreing
	anio_edicion date, 
	num_pagina integer,
	descripcion text,
	imagen varchar(150),
	estado binary --default 0
)

--primary key
alter table libro
add constraint PK_id_libro
primary key (id)
--foreing key
alter table libro
add constraint FK_id_autor
foreign key (id_autor) REFERENCES Autor (id)
select * from Autor

--foreing key
alter table libro
add constraint FK_id_editorial
foreign key (id_editorial) REFERENCES editorial (id_e)
--foreing key
alter table libro
add constraint FK_id_materia
foreign key (id_materia) REFERENCES materia (id)


--insertando datos

select * from Autor
select * from materia
select * from Editorial


insert into libro values(	1,
	'La rosa de guadalupe',
	15,
	4, --foreing
	2, --foreig
	12, --foreing
	'2022',315,'Se trata de una coleccion de historias','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\rosa de guadalupe.jpg',0)
insert into libro values(	2,
	'Programacion en C',
	35,
	4, --foreing
	3, --foreig
	22, --foreing
	'2022',315,'Se trata de un libro de programacion y muestra fundamentos y tiene 20 ejercicios','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\rosa de guadalupe.jpg',0)

create table Prestamo(
	id integer not null,
	codigo_estudiante char(6), --foreing
	id_libro integer, -- foreing
	fecha_prestamo date,
	fecha_devolucion date,
	cantidad integer,
	observacion varchar(60),
	estado binary, -- boolean
)


--primary key
alter table Prestamo
add constraint PK_id1
primary key (id)

--foreing key
alter table Prestamo
add constraint FK_Prestamo_Codigo
foreign key (codigo_estudiante) REFERENCES Estudiante (codigo)
select * from Estudiante

--foreing key
alter table Prestamo
add constraint FK_Prestamo_libro
foreign key (id_libro) REFERENCES libro (id)


select * from libro
select * from Estudiante

insert into Prestamo values (1,
	'201068',
	2,
	'04/10/2022',
	'13/10/2022',
	2,
	'el forro esta dañado',
	1)

insert into Prestamo values (1,
	'201034',
	2,
	'02/10/2022',
	'10/10/2022',
	2,
	'Ninguna',
	1)


create table Usuarios(
	id integer not null, --primary key
	usuario varchar(50),
	nombre varchar(60),
	clave varchar(50),
	rol varchar(40), --docente
	estado bit 
)

--primary key 

alter table Usuarios
add constraint PK_id_Usuarios
primary key (id)

--insertando datos
insert into Usuarios values(1,'Erick21','Erick','erd3#44♦','Estudiante',0)
insert into Usuarios values(2,'velcito','Juan','sara3#44♦','Docente',1)

