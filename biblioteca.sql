create database Biblioteca
use Biblioteca


create table Autor(
	id Integer,
	autor varchar(100),
	imagen varchar (100),
	estado Integer
)

create table Configuracion(
	id_c integer, 
	nombre varchar(60),
	telefono varchar(10),
	direccion varchar(60),
	correo varchar(80)
)


create table Editorial(
	id_e integer,
	editorial varchar(100),
	estado integer,
)

create table Estudiante(
	id integer,
	codigo varchar(8),
	DNI varchar(8),
	nombre varchar(40),
	apellido varchar(50),
	carrera varchar(150),
	direccion varchar(60),
	telefono varchar(20),
	estado integer
)


create table materia(
	id integer,
	materia varchar(80),
	estado integer
)

create table libro(
	id integer,
	titulo varchar(100),
	cantidad integer,
	id_autor integer,
	id_editorial integer,
	id_materia integer,
	anio_edicion date,
	num_pagina integer,
	descripcion text,
	imagen varchar(100),
	estado integer
)

create table prestamo(
	id integer,
	id_estudiante

) 