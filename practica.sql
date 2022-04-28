CREATE TABLESPACE alumnado
datafile 'alumnado.dbf'
size 1 M
autoextend on next 10 K
maxsize 1G;

CREATE TABLESPACE profesorado
datafile 'profesorado.dbf'
size 1 M
autoextend on next 10 K
maxsize 1G;

CREATE TABLESPACE administracion
datafile 'administracion.dbf'
size 1 M
autoextend on next 10 K
maxsize 1G;

create user administrador identified by administrador
default tablespace administracion
temporary tablespace temp
profile default
quota 1M on administracion;

grant ALL PRIVILEGES TO administrador;

create profile admin_sessions LIMIT
    SESSIONS_PER_USER 2
    CPU_PER_SESSION UNLIMITED		
    IDLE_TIME 20
	CONNECT_TIME UNLIMITED
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LOCK_TIME 2;

alter user administrador profile admin_sessions;

create user profesor identified by profesor
default tablespace profesorado
temporary tablespace temp
profile default
quota 1M on profesorado;

create profile profe_sessions LIMIT
    SESSIONS_PER_USER UNLIMITED
    CPU_PER_SESSION UNLIMITED		
    IDLE_TIME 20
	CONNECT_TIME UNLIMITED
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LOCK_TIME 2;

alter user profesor profile profe_sessions;

drop table Academia cascade constraints;
drop table Profesores cascade constraints;
drop table Estudiantes cascade constraints;
drop table Administradores cascade constraints;
drop table Usuario cascade constraints;


create table Academia
    (nombre varchar2 (20),
    direccion varchar2 (50),
    telf number (9));

create table Estudiantes
    (dniE varchar2 (9),
    nombreE varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    idioma varchar2(10),
    idUsuario varchar2(5));

create table Profesores
    (dniP varchar2 (9),
    nombreP varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    especialidad varchar2(30),
    idUsuario varchar2(5));
    
create table Administradores
    (dniA varchar2 (9),
    nombreA varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    idUsuario varchar2(5));

create table Usuarios
    (idUsuario varchar2(5),
    nombreU varchar2(20),
    contraseña varchar2 (15),
    rol char (1));
    
create table Clase
    (id_clase number(2),
    dniP varchar2(20),
    nombreE varchar2(20),
    idioma varchar2(30));
    
create table Titulo
    (nivel varchar2(10),
    nombreE varchar2(20),
    idioma varchar2(20),
    cuota number (3,2));
    
alter table Usuarios
add constraint pk_user
primary key (idUsuario);

alter table  Estudiantes
add constraint pk_est
primary key (dniE);

alter table  Profesores
add constraint pk_profe
primary key (dniP);

alter table  Administradores
add constraint pk_admin
primary key (dniA);

alter table Titulo
add constraint pk_titulo
primary key (dniE);

alter table clase
add constraint pk_clase
primary key (id_clase);

alter table Estudiantes
add constraint fk_est
foreign key (idUsuario)
references Usuarios (idUsuario);

alter table Profesores
add constraint fk_profe
foreign key (idUsuario)
references Usuarios (idUsuarios);

alter table Administradores
add constraint fk_amdin
foreign key (idUsuario)
references Usuarios (idUsuario);