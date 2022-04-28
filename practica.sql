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

/*create user ventas identified by ventas
default tablespace ventas
temporary tablespace temp
profile default
quota 1M on ventas;

GRANT CREATE SESSION TO ventas;


CREATE PROFILE ventas_sesions LIMIT
		SESSIONS_PER_USER 2
		CPU_PER_SESSION UNLIMITED		
		IDLE_TIME 20
		CONNECT_TIME UNLIMITED
		FAILED_LOGIN_ATTEMPTS 3
		PASSWORD_LOCK_TIME 2;
    
ALTER USER ventas PROFILE ventas_sesions;*/

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

create table Academia
    (nombre varchar2 (20),
    direccion varchar2 (50),
    telf number (9));

create table Persona
    (dni varchar2 (9),
    nombre varchar2 (20),
    apellidos varchar2 (50),
    direccion varchar2(50),
    telf number(9));


