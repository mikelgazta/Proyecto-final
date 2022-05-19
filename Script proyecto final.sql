/*TABLESPACES*/

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

/*USUARIOS Y PERFILES*/
create profile admin_sessions LIMIT
    SESSIONS_PER_USER 2
    CPU_PER_SESSION UNLIMITED		
    IDLE_TIME 20
	CONNECT_TIME UNLIMITED
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LOCK_TIME 2;

create user administrador identified by administrador
default tablespace administracion
temporary tablespace temp
profile admin_sessions
quota 1M on administracion;

alter user administrador profile admin_sessions;

create profile profe_sessions LIMIT
    SESSIONS_PER_USER UNLIMITED
    CPU_PER_SESSION UNLIMITED		
    IDLE_TIME 20
	CONNECT_TIME UNLIMITED
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LOCK_TIME 2;

create user profesor identified by profesor
default tablespace profesorado
temporary tablespace temp
profile profe_sessions
quota 1M on profesorado;

alter user profesor profile profe_sessions;

create profile alumn_sessions LIMIT
    SESSIONS_PER_USER UNLIMITED
    CPU_PER_SESSION UNLIMITED		
    IDLE_TIME 20
	CONNECT_TIME UNLIMITED
	FAILED_LOGIN_ATTEMPTS 3
	PASSWORD_LOCK_TIME 2;
    
create user alumno identified by alumno
default tablespace alumnado
temporary tablespace temp
profile alumn_sessions
quota 1M on alumnado;

alter user alumno profile alumn_sessions;

/*Drop tables*/

/*
drop table Usuarios cascade constraints;
drop table Clase cascade constraints;
drop table Administradores cascade constraints;
drop table Profesores cascade constraints;
drop table Estudiantes cascade constraints;
drop table Titulo cascade constraints;
drop table Estudiantes_Titulo cascade constraints;
*/

/*Create tables*/

create table Usuarios
    (idUsuario varchar2(4),
    nombreU varchar2(20),
    contraseña varchar2 (15),
    rol char (1));

create table Clase
    (id_clase number(2),
    idUsuario varchar(4),
    nombreE varchar2(20),
    idioma varchar2(20));

create table Administradores
    (dniA varchar2 (9),
    nombreA varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    idUsuario varchar2(4));

create table Profesores
    (dniP varchar2 (9),
    nombreP varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    especialidad varchar2(20),
    id_clase number (2),
    idUsuario varchar2(4));

create table Estudiantes
    (dniE varchar2 (9),
    nombreE varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9),
    idioma varchar2(20),
    nota number (2),
    idUsuario varchar2(4));
    
create table Titulo
    (nivel varchar2(10),
    idioma varchar2(20),
    cuota number (3));
    
create table Estudiantes_Titulo (
    dniE varchar2 (9),
    nombreE varchar2(20),
    idioma varchar2(20),
    nivel varchar2(10));

/*Primary Keys*/

alter table Usuarios
add constraint pk_user
primary key (idUsuario);

alter table Clase
add constraint pk_clase
primary key (idUsuario);

alter table  Administradores
add constraint pk_admin
primary key (dniA);

alter table  Profesores
add constraint pk_profe
primary key (dniP);

alter table  Estudiantes
add constraint pk_est
primary key (dniE);

alter table Titulo
add constraint pk_titulo
primary key (nivel, idioma);

alter table Estudiantes_Titulo
add constraint pk_est_titulo
primary key (dniE, nivel, idioma);

/*Foreign Keys*/

alter table Administradores
add constraint fk_amdin
foreign key (idUsuario)
references Usuarios (idUsuario);

alter table Profesores
add constraint fk_profe
foreign key (idUsuario)
references Usuarios (idUsuario);

alter table Estudiantes
add constraint fk_est
foreign key (idUsuario)
references Usuarios (idUsuario);

alter table Estudiantes_Titulo
add constraint fk_est_tit
foreign key (dniE)
references Estudiantes (dniE);

alter table Estudiantes_Titulo
add constraint fk_est_tit2
foreign key (nivel, idioma)
references Titulo (nivel, idioma);

/*ROLES*/
grant ALL PRIVILEGES TO administrador;

create role rol_alumno;
GRANT SELECT ON "ESTUDIANTES" to rol_alumno;
grant create session to alumno;
grant rol_alumno to alumno;

create role rol_profesores;
GRANT SELECT,INSERT,UPDATE ON "ESTUDIANTES" to rol_profesores;
grant create session to profesor;
grant rol_profesores to profesor;

create role rol_profesores2;
GRANT SELECT ON "PROFESORES" to rol_profesores2;
grant rol_profesores2 to profesor;

/*Inserts Tabla Usuarios*/

/*Usuarios Administracion*/
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('AD01','Raul','Raul','A');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('AD02','Karmele','Karmele','A');

/*Usuarios Profesores*/
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('PR01','Gorka','Gorka','P');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('PR02','Beñat','Beñat','P');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('PR03','Juan','Juan','P');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('PR04','Martin','Martin','P');

/*Usuarios Estudiantes*/
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK11','Ender','Ender','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK12','Oscar','Oscar','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK13','Gonzalo','Gonzalo','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK14','David','David','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK15','Christian ','Christian ','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK16','Martín','Martín','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK17','Alex','Alex','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK18','Mikel','Mikel','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK19','Anass','Anass','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK20','Jairo ','Jairo','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK21','Marcos','Marcos','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK22','Ander','Ander','E');
INSERT INTO Usuarios(idUsuario, nombreU, contraseña, rol) VALUES
('IK23','Javier','Javier','E');

/*Inserts tabla Clase*/

/*Clase de Ingles*/
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(01,'IK20','Jairo','Ingles');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(01,'IK21','Marcos','Ingles');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(01,'IK22','Ander','Ingles');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(01,'IK23','Javier','Ingles');
/*Clase de Frances*/
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(02,'IK17','Alex','Frances');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(02,'IK18','Mikel','Frances');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(02,'IK19','Anass','Frances');
/*Clase de Aleman*/
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(03,'IK14','David','Aleman');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(03,'IK15','Christian','Aleman');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(03,'IK16','Martin','Aleman');
/*Clase de Italiano*/
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(04,'IK11','Ender','Italiano');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(04,'IK12','Oscar','Italiano');
INSERT INTO Clase(id_clase, idUsuario, nombreE, idioma) VALUES
(04,'IK13','Gonzalo','Italiano');

/*Inserts tabla Aministradores*/
INSERT INTO Administradores (dniA, nombreA, apellidos, direccion, telf, idUsuario) VALUES
('03543202A', 'Raul', 'Martinez', 'Plaiaundi BHI Institutua', 943024836,'AD01');
INSERT INTO Administradores (dniA, nombreA, apellidos, direccion, telf, idUsuario) VALUES
('77239812Z', 'Karmele', 'Lopetegi', 'Plaiaundi BHI Institutua', 943009947,'AD02');

/*Inserts tabla Profesores*/
INSERT INTO Profesores (dniP, nombreP, apellidos, direccion, telf, especialidad, id_clase, idUsuario) VALUES
('12233445H', 'Gorka', 'Intxausti', 'Plaiaundi BHI Institutua', 943112233, 'Ingles', 01, 'PR01');
INSERT INTO Profesores (dniP, nombreP, apellidos, direccion, telf, especialidad, id_clase, idUsuario) VALUES
('22154879B', 'Beñat', 'Zapirain Sierra', 'Plaiaundi BHI Institutua', 943221133, 'Frances', 02, 'PR02');
INSERT INTO Profesores (dniP, nombreP, apellidos, direccion, telf, especialidad, id_clase, idUsuario) VALUES
('42153269J', 'Juan', 'Santamaria', 'Plaiaundi BHI Institutua', 943846598, 'Aleman', 03, 'PR03');
INSERT INTO Profesores (dniP, nombreP, apellidos, direccion, telf, especialidad, id_clase, idUsuario) VALUES
('33659878M', 'Martin', 'Mozos', 'Plaiaundi BHI Institutua', 943115488, 'Italiano', 04, 'PR04');

/*Inserts tabla Estudiantes*/
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('32985476Z', 'Ender', 'Alberdi San Martin', 'Plaiaundi BHI Institutua', 943457815, 'Italiano', null, 'IK11');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('65123578D', 'Oscar', 'Alvarez Granja', 'Plaiaundi BHI Institutua', 943651202, 'Italiano', null, 'IK12');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('87673256K', 'Gonzalo', 'Alvarez Pablos', 'Plaiaundi BHI Institutua', 943783295, 'Italiano', null, 'IK13');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('26187542A', 'David', 'Barberio Lazaro', 'Plaiaundi BHI Institutua', 943054898, 'Aleman', null, 'IK14');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('95320254L', 'Christian', 'Crespo Castro', 'Plaiaundi BHI Institutua', 943621045, 'Aleman', null, 'IK15');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('62154876N', 'Martin', 'Fagoaga Garcia', 'Plaiaundi BHI Institutua', 943786321, 'Aleman', null, 'IK16');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('36623256K', 'Alex', 'Garcia Matute', 'Plaiaundi BHI Institutua', 943359781, 'Frances', null, 'IK17');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('45195806R', 'Mikel', 'Gaztañazpi Vicente', 'Plaiaundi BHI Institutua', 943620159, 'Frances', null, 'IK18');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('60248421A', 'Anass', 'Kbir', 'Plaiaundi BHI Institutua', 943509574, 'Frances', null, 'IK19');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('87673006K', 'Jairo', 'Morocho Uvidia', 'Plaiaundi BHI Institutua', 943924681, 'Ingles', null, 'IK20');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('34125065J', 'Marcos', 'Prego Salvador', 'Plaiaundi BHI Institutua', 943472591, 'Ingles', null, 'IK21');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('12587965P', 'Ander', 'Sanchez Silva', 'Plaiaundi BHI Institutua', 943887520, 'Ingles', null, 'IK22');
INSERT INTO Estudiantes (dniE, nombreE, apellidos, direccion, telf, idioma, nota, idUsuario) VALUES 
('52120598J', 'Javier', 'Urrutia', 'Plaiaundi BHI Institutua', 943339548, 'Ingles', null, 'IK23');

/*Inserts tabla Titulo*/
/*INGLES*/
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('B1', 'Ingles', 194);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('C1', 'Ingles', 211);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('C2', 'Ingles', 217);
/*ITALIANO*/
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('B1', 'Italiano', 130);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('C1', 'Italiano', 186);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('C2', 'Italiano', 210);
/*ALEMAN*/
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('A1', 'Aleman', 130);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('B1', 'Aleman', 174);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('C2', 'Aleman', 240);
/*FRANCES*/
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('DELF', 'Frances', 146);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('DELF Pro', 'Frances', 158);
INSERT INTO Titulo(nivel, idioma, cuota) VALUES
('DALF', 'Frances', 198);

/*Inserts tabla Estudiante_Titulo

Todavia no ha empezado el curso por lo que no hay nadie con titulo*/




