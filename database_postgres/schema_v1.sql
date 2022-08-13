-- Database: mande_db

-- DROP DATABASE mande_db;

CREATE EXTENSION postgis;

CREATE DATABASE mande_db
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;

\c mande_db


CREATE TABLE Labor(
    labor_id SERIAL PRIMARY KEY,
    labor_nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Ubicacion(
    ubica_direccion 		VARCHAR (45) PRIMARY KEY,
	  ubica_ciudad 			VARCHAR(45),
    ubica_departamento      VARCHAR (45),
    ubica_latitud 			DECIMAL(8,6),
	ubica_longitud 		    DECIMAL(8,6)
);

CREATE TABLE Persona(
    persona_id SERIAL PRIMARY KEY,
    persona_nombre VARCHAR(45) NOT NULL,
    persona_apellido VARCHAR(45) NOT NULL,
    persona_email VARCHAR(45) NOT NULL UNIQUE,
    persona_password VARCHAR(45) NOT NULL,
    persona_celular VARCHAR(15) NOT NULL UNIQUE,
    persona_ubica_direccion VARCHAR(45),
    persona_tarjeta_usuario VARCHAR(45) UNIQUE,
    persona_cvc VARCHAR(3) UNIQUE,
    CONSTRAINT fk_ubicacion_persona
      FOREIGN KEY(persona_ubica_direccion)
        REFERENCES Ubicacion(ubica_direccion) ON UPDATE CASCADE ON DELETE RESTRICT
);
   
CREATE TABLE Cliente(
    cliente_celular VARCHAR(15),
    cliente_recibo VARCHAR(5),
    CONSTRAINT pk_cliente PRIMARY KEY(cliente_celular),
    CONSTRAINT fk_cliente FOREIGN KEY(cliente_celular) 
      REFERENCES Persona(persona_celular)   
);

CREATE TABLE Trabajador(
	trabajador_id		     INT,
	trabajador_estado        BOOLEAN,
    trabajador_foto_id       VARCHAR(5),
    trabajador_foto_perfil   VARCHAR(5),
	CONSTRAINT pk_trabajador PRIMARY KEY (trabajador_id),
    CONSTRAINT fk_trabajador FOREIGN KEY(trabajador_id) 
      REFERENCES Persona(persona_id)
);
CREATE INDEX idx_trab_ocup ON Trabajador USING HASH (trabajador_estado);

CREATE TABLE Trabajador_Has_Labor(
	trabajador_id	    INT,
	labor_id 				INT,
	t_h_l_precio 			INT 		 	NOT NULL,
	t_h_l_prom 				DECIMAL 	DEFAULT NULL,
	CONSTRAINT pk_t_r_l PRIMARY KEY (trabajador_id, labor_id),
	CONSTRAINT fk_t_r_l1 FOREIGN KEY (trabajador_id) 
		REFERENCES Trabajador(trabajador_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_t_r_l2 FOREIGN KEY (labor_id) 
		REFERENCES Labor(labor_id) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Servicio(
	servicio_id 			SERIAL PRIMARY KEY,
	servicio_costo 			INT NOT NULL,
	servicio_calificacion 	SMALLINT NOT NULL,
	servicio_descripcion 	VARCHAR(200) 	NOT NULL,
	servicio_fecha_inicio 	VARCHAR(25)     NOT NULL,
	servicio_fecha_fin 		VARCHAR(25)     NOT NULL,
    trabajador_id           INT             NOT NULL,
    usuario_celular 		VARCHAR(15) 	NOT NULL,
	labor_id 				INT 			NOT NULL,
	CONSTRAINT fk_servicio1 FOREIGN KEY (trabajador_id,labor_id) 
		REFERENCES Trabajador_Has_Labor(trabajador_id,labor_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_servicio2 FOREIGN KEY (usuario_celular) 
		REFERENCES Cliente(cliente_celular) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE INDEX idx_trab_doc ON Servicio USING HASH (trabajador_id);
CREATE INDEX idx_usu_cel ON Servicio USING HASH (usuario_celular);

CREATE TABLE Pago(
    id_servicio INT,
    id_usuario VARCHAR(15),
    id_trabajador INT,
    CONSTRAINT pk_pago PRIMARY KEY (id_servicio),
    CONSTRAINT fk_pago1 FOREIGN KEY (id_servicio)
      REFERENCES Servicio(servicio_id),
    CONSTRAINT fk_pago2 FOREIGN KEY (id_usuario)
      REFERENCES Cliente(cliente_celular),
    CONSTRAINT fk_pago3 FOREIGN KEY (id_trabajador)
      REFERENCES Trabajador(trabajador_id)
);
