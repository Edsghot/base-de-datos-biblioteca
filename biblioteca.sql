create database Biblioteca2
go
use Biblioteca2
go

create table Autor (
	id Integer IDENTITY(1,1) not null,
	autor varchar(100) not null,
	imagen varchar (100) not null,
	estado binary not null 
)
go
create table Configuracion(
	id_c integer not null, 
	nombre varchar(60) not null, 
	celular char(10) not null,
	direccion varchar(60) not null, 
	correo varchar(80) not null 
)
go
create table Editorial(
	id_e integer not null, 
	editorial varchar(100) not null, 
	estado bit not null, 
)
go
create table Estudiante(
	codigo char(6) not null, 
	DNI char(8) not null, 
	nombre varchar(40) not null, 
	apellido varchar(50) not null, 
	carrera varchar(100) not null,
	direccion varchar(60) not null,
	celular char(9) not null,   
	estado bit not null
)

go

create table materia(
	id integer not null, 
	materia varchar(80) not null,
	estado bit not null
)
go
create table libro(
	id integer not null,
	titulo varchar(100) not null,
	cantidad integer not null,
	id_autor integer not null, 
	id_editorial integer not null, 
	id_materia integer not null, 
	anio_edicion date not null, 
	num_pagina integer not null,
	descripcion text not null,
	imagen varchar(150) not null,
	estado bit not null
)
go

create table Prestamo(
	id integer not null,
	codigo_estudiante char(6) not null,
	id_libro integer not null, 
	fecha_prestamo date not null,
	fecha_devolucion date not null,
	cantidad integer not null,
	observacion varchar(60) not null,
	estado bit not null, 
)
go

create table Usuarios(
	id integer not null, 
	usuario varchar(50) not null,
	nombre varchar(60) not null,
	clave varchar(50) not null,
	rol varchar(40) not null, 
	estado bit not null
)

--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::::::::::::RESTRICCIONES ::::::::::::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla AUTOR <<<<<<<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Agregando primary key a la tabla autor
ALTER TABLE Autor
ADD constraint PK_Autor
primary key(id);

--Agregando unique a Autor

alter table Autor
add constraint UQ_Autor_autor
UNIQUE (autor)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla EDITORIAL <<<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--primary key
alter table Editorial
add constraint PK_id_e
primary key(id_e)

--UNIQUE
alter table Editorial
add constraint UQ_Editorial_editorial
UNIQUE (editorial)


-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla CONFIGURACION <<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla ESTUDIANTE <<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- primary key
alter table Estudiante
add constraint PK_codigo
primary key (codigo)

--puro numero en el dni

alter table Estudiante
add constraint CHK_dni_numeros
check (DNI like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

--UNIQUE
alter table Estudiante
add constraint UQ_estudiante_DNI
unique (DNI)
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla MATERIA <<<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--primary key
alter table materia
add constraint PK_id
primary key(id)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla LIBRO <<<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla PRESTAMO <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla USUARIOS <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--restricciones de default
alter table Usuarios
add default 1 for estado

--primary key 
alter table Usuarios
add constraint PK_id_Usuarios
primary key (id)

--UNIQUE
alter table Usuarios
add constraint UQ_Usuarios_usuario
unique (usuario)


--::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--::::::::::::::::::::::::::::::::::::::::::: INSERTANDO DATOS A LAS TABLAS ::::::::::::::::::::::::::::::::::::::::::::::::
--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla AUTOR <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

 insert into autor(autor,imagen,estado) values('Larry wall','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\lary.jpg',1)
 insert into autor(autor,imagen,estado) values('andres velardo','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\seg.jpg',1)
 insert into autor(autor,imagen,estado) values('erick jhorep','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\ter.jpg',1)
 insert into autor(autor,imagen,estado) values('alex vilchez','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\tge.jpg',0)
 insert into autor(autor,imagen,estado) values('juana vartez','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\jua.jpg',1)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla CONFIGURACION <<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

insert into Configuracion values(1,'Erick soto','926706376','av.renzo michelli','erick24@gmail.com')
insert into Configuracion values(2,'juan zabala','946606376','av.renzo michelli','juanZA@gmail.com')
insert into Configuracion values(3,'keyti arone','916716376','av.renzo michelli','keytiAro@gmail.com')
insert into Configuracion values(4,'lucia gerad','925446376','av.renzo michelli','lucia14@gmail.com')
insert into Configuracion values(5,'mehmed sulpi','966706376','av.renzo michelli','mehmed2@gmail.com')

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla EDITORIAL <<<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
insert into Editorial values(1,'Ambar',1)
insert into Editorial values(2,'Futura',1)
insert into Editorial values(3,'Maria trinidad',0)
insert into Editorial values(4,'Macro',0)
insert into Editorial values(5,'colmena de editores',1)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla ESTUDIANTE <<<<<<<<<<<<<<<<
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
insert into Estudiante values('201068','73639719','erick','soto','Ingenieria de sistemas e informatica','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201045','83639719','edward','velasquez','Ingenieria de sistemas e informatica','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201041','13139719','lucia','velardo','Administracion','av. Inca garcilazo','985613456',0)
insert into Estudiante values('201034','63639719','katherine','helit','Ingenieria civil','av. Inca garcilazo','985613456',1)
insert into Estudiante values('201015','43239719','briz','chuyma','Docente','av. Inca garcilazo','955613456',1)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla MATERIA <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

insert into materia values(12,'Fisica',1)
insert into materia values(22,'fundamentos de programacion',1)
insert into materia values(32,'data ciencia',1)
insert into materia values(42,'redes',0)
insert into materia values(52,'discreta',0)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla LIBRO <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
insert into libro values(1,'Base de datos',15,4,2,12,'2022',315,'Se trata de una coleccion de historias','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\rosa de guadalupe.jpg',0)
insert into libro values(2,'Programacion en C',35,4, 3,22,'2022',315,'Se trata de un libro de programacion y muestra fundamentos y tiene 20 ejercicios','D:\UNIVERSIDAD\QUINTO SEMESTRE\BASE DE DATOS\proyecto final\rosa de guadalupe.jpg',0)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla PRESTAMO <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

insert into Prestamo values (1,'201068',2,'04/10/2022','13/10/2022',2,'el forro esta dañado',	1)
insert into Prestamo values (2,'201034',2,'02/10/2022','10/10/2022',2,'Ninguna',1)

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>> tabla USUARIOS <<<<<<<<<<<<<<<<<>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

insert into Usuarios values(1,'Erick21','Erick','erd3#44♦','Estudiante',0)
insert into Usuarios values(2,'velcito','Juan','sara3#44♦','Docente',1)



