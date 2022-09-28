create database Biblioteca
use Biblioteca


create table Autor(
	id Integer,
	autor varchar(100),
	imagen varchar (100),
	estado Integer -- boolean
)

-- id autoincremnta
-- que sea pura letras

create table Configuracion(
	id_c integer, 
	nombre varchar(60),  -- pura letras
	celular varchar(10), --9 digitos -- puro numero
	direccion varchar(60), 
	correo varchar(80)  -- que contenga @
)


create table Editorial(
	id_e integer, 
	editorial varchar(100), 
	estado integer, --boolean
)

create table Estudiante(
	id integer,
	codigo char(6), --char 6 digitos 
	DNI char(8), -- char puro numeros
	nombre varchar(40), 
	apellido varchar(50), 
	carrera varchar(100),
	direccion varchar(60),
	celular char(9), -- numeros    
	estado integer -- booleano - bit
)


create table materia(
	id integer, 
	materia varchar(80),
	estado integer --bit
)

create table libro(
	id integer,
	titulo varchar(100),
	cantidad integer,
	id_autor integer, --foreing
	id_editorial integer, --foreig
	id_materia integer, --foreing
	anio_edicion date, 
	num_pagina integer,
	descripcion text,
	imagen varchar(150),
	estado integer --default 0
)

create table Prestamo(
	id integer,
	id_estudiante integer, --foreing
	id_libro integer, -- foreing
	fecha_prestamo date,
	fecha_devolucion date,
	cantidad integer,
	observacion varchar(60),
	estado integer, -- boolean
)

create table Usuarios(
	id integer, --primary key
	usuario varchar(50),
	nombre varchar(60),
	clave varchar(50),
	rol varchar(40), --docente
	estado integer  
)

