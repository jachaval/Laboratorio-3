create database actividad3
GO
use actividad3
GO
create table Carreras(
	ID varchar(4) not null primary key,
	Nombre varchar(50) not null,
	FechaCreacion date not null check(FechaCreacion <= getdate()),
	Mail varchar(40) not null,
	Nivel varchar(12) not null check(Nivel = 'Diplomatura' or Nivel = 'Pregrado' or Nivel = 'Grado' or Nivel = 'Posgrado'),
)
GO
create table Materias(
	ID bigint not null primary key identity(1,1),
	IDCarrera varchar(4) not null foreign key references Carreras(ID),
	Nombre varchar(30) not null,
	CargaHoraria int not null check(CargaHoraria>0),
)
GO
create table Alumnos(
	Legajo bigint not null primary key identity(1000,1),
	IDCarrera varchar(4) not null foreign key references Carreras(ID),
	Apellidos varchar(30) not null,
	Nombres varchar(30) not null,
	FechaNacimiento date not null check(FechaNacimiento <= getdate()),
	Mail varchar(40) not null unique,
	Telefono int null,
)
