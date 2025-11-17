/*Creacion de la base de datos*/
CREATE DATABASE JuegoDeTronos;

/*Entro a la base de datos JuegoDeTronos*/
use JuegoDeTronos;

/*Creacion de las tablas*/

CREATE TABLE Temporada(
    id_Temporada INT IDENTITY(1,1) PRIMARY KEY,
    anio_estreno INT NOT NULL,
    numero INT NOT NULL
);

CREATE TABLE Episodio(
    id_Episodio INT IDENTITY(1,1) PRIMARY KEY,
    fecha_Emision DATE,
    titulo_Episodio VARCHAR(100) NOT NULL,
    id_Temporada_fk INT NOT NULL,
    FOREIGN KEY (id_Temporada_fk) REFERENCES Temporada(id_Temporada)
);

CREATE TABLE Evento(
    id_Evento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_Episodio_fk INT NOT NULL,
    id_Personaje_fk INT,
    FOREIGN KEY (id_Episodio_fk) REFERENCES Episodio(id_Episodio)
);

CREATE TABLE Personaje(
    id_Personaje INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    lema VARCHAR (100) NOT NULL,
    distintivo VARCHAR(100) NOT NULL,
    rol VARCHAR(100) NOT NULL,
    id_Evento_fk INT NOT NULL,
    FOREIGN KEY (id_Evento_fk) REFERENCES Evento(id_Evento)
);

CREATE TABLE Personaje_Relacion (
    id_personaje1 INT NOT NULL,
    id_personaje2 INT NOT NULL,
    tipo_relacion VARCHAR(50), -- opcional
    PRIMARY KEY (id_personaje1, id_personaje2),
    FOREIGN KEY (id_personaje1) REFERENCES Personaje(id_personaje),
    FOREIGN KEY (id_personaje2) REFERENCES Personaje(id_personaje)
); /*SE CREA UNA TABLA INTERMEDIA POR EL TIPO DE RELACION (Personaje -> Personaje) */

CREATE TABLE Arma(
id_Arma INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
tipo VARCHAR(100) NOT NULL,
id_Personaje_fk INT NOT NULL,
FOREIGN KEY (id_Personaje_fk) REFERENCES Personaje(id_Personaje)
);
CREATE TABLE Titulo(
  id_Titulo INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  rango VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  id_Personaje_fk INT NOT NULL,
  FOREIGN KEY (id_Personaje_fk) REFERENCES Personaje(id_Personaje)
);

CREATE TABLE Reino(
 id_Reino INT IDENTITY(1,1) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 descripcion VARCHAR(100) NOT NULL,
 id_Personaje_fk INT UNIQUE,
 FOREIGN KEY(id_Personaje_fk) REFERENCES Personaje(id_Personaje)
);

CREATE TABLE Casa(
id_Casa INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
lema VARCHAR(100) NOT NULL,
simbolo VARCHAR(100) NOT NULL,
id_Personaje_fk INT NOT NULL,
id_Reino_fk INT UNIQUE,
FOREIGN KEY(id_Personaje_fk) REFERENCES Personaje(id_Personaje),
FOREIGN KEY(id_Reino_fk) REFERENCES Reino(id_Reino)
);

CREATE TABLE Ubicacion(
    id_Ubicacion INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_Evento_fk2 INT NOT NULL,
    id_Reino_fk INT NOT NULL,
    FOREIGN KEY (id_Evento_fk2) REFERENCES Evento(id_Evento),
    FOREIGN KEY(id_Reino_fk) REFERENCES Reino(id_Reino)
);

/*INSERCION DE VALORES EN LAS TABLAS*/

INSERT INTO Temporada (anio_estreno, numero) VALUES
    (2011, 1),
    (2012, 2),
    (2013, 3),
    (2014, 4),
    (2015, 5),
    (2016, 6);

INSERT INTO Episodio (fecha_Emision, titulo_Episodio, id_Temporada_fk) VALUES
    ('2011-04-17', 'Winter Is Coming', 1),
    ('2011-05-22', 'A Golden Crown', 1),
    ('2012-04-01', 'The North Remembers', 2),
    ('2013-06-02', 'The Rains of Castamere', 3),
    ('2014-06-15', 'The Children', 4),
    ('2015-06-14', 'Mother�s Mercy', 5);

INSERT INTO Evento (nombre, descripcion, id_Episodio_fk, id_Personaje_fk) VALUES
    ('Ejecuci�n de Ned Stark', 'Ned es decapitado en Desembarco del Rey', 2, NULL),
    ('Boda Roja', 'Masacre en la boda de Edmure y Roslin', 4, NULL),
    ('Nacimiento de Dragones', 'Daenerys entra en la pira y nacen dragones', 1, NULL),
    ('Batalla de Blackwater', 'Stannis ataca Desembarco del Rey', 3, NULL),
    ('Muerte de Joffrey', 'Joffrey es envenenado en su boda p�rpura', 5, NULL),
    ('Ascenso de Jon Snow', 'Jon es nombrado Lord Comandante', 6, NULL);

INSERT INTO Personaje (nombre, lema, distintivo, rol, id_Evento_fk) VALUES
    ('Eddard Stark', 'Winter is Coming', 'Lobo Huargo', 'Se�or de Invernalia', 1),
    ('Robb Stark', 'Winter is Coming', 'Lobo Huargo', 'Rey en el Norte', 2),
    ('Daenerys Targaryen', 'Fire and Blood', 'Drag�n', 'Madre de Dragones', 3),
    ('Tyrion Lannister', 'Hear Me Roar', 'Le�n', 'Mano del Rey', 4),
    ('Joffrey Baratheon', 'Ours is the Fury', 'Ciervo', 'Rey de los Siete Reinos', 5),
    ('Jon Snow', 'Winter is Coming', 'Lobo Huargo', 'Lord Comandante', 6);

INSERT INTO Personaje_Relacion (id_personaje1, id_personaje2, tipo_relacion) VALUES
    (1, 2, 'Padre-Hijo'),
    (1, 6, 'T�o-Sobrino'),
    (2, 6, 'Medio Hermanos'),
    (3, 6, 'T�a-Sobrino'),
    (4, 5, 'Consejero-Rey'),
    (3, 4, 'Aliados');

INSERT INTO Arma (nombre, tipo, id_Personaje_fk) VALUES
    ('Hielo', 'Espada Valyria', 1),
    ('Garra', 'Espada Valyria', 6),
    ('Aguja', 'Espada', 2),
    ('Arakh', 'Hoja curva', 3),
    ('Ballesta', 'Proyectil', 4),
    ('Espada Real', 'Espada', 5);

INSERT INTO Titulo (nombre, rango, descripcion, id_Personaje_fk) VALUES
    ('Se�or de Invernalia', 'Alto', 'Gobernante del Norte', 1),
    ('Rey en el Norte', 'Alto', 'Rey del Norte', 2),
    ('Madre de Dragones', 'Alto', '�ltima Targaryen', 3),
    ('Mano del Rey', 'Alto', 'Consejero Real', 4),
    ('Rey de los Siete Reinos', 'Alto', 'Monarca absoluto', 5),
    ('Lord Comandante', 'Alto', 'Comandante de la Guardia', 6);

INSERT INTO Reino (nombre, descripcion, id_Personaje_fk) VALUES
    ('El Norte', 'Territorio gobernado por los Stark',1),
    ('Islas del Hierro', 'Territorio de los Greyjoy',2),
    ('Valle de Arryn', 'Territorio de los Arryn',4),
    ('Dorne', 'Territorio de los Martell',3),
    ('Occidente', 'Territorio de los Lannister',5),
    ('Guardia de la Noche', 'Muralla y m�s all�',6);

INSERT INTO Casa (nombre, lema, simbolo, id_Personaje_fk, id_Reino_fk) VALUES
    ('Stark', 'Winter is Coming', 'Lobo Huargo', 1, 1),
    ('Targaryen', 'Fire and Blood', 'Drag�n', 3, 4),
    ('Lannister', 'Hear Me Roar', 'Le�n', 4, 5),
    ('Baratheon', 'Ours is the Fury', 'Ciervo', 5, 2),
    ('Arryn', 'As High as Honor', 'Halc�n', 4, 3),
    ('Guardia de la Noche', 'Night gathers', 'Cuervo', 6, 6);

INSERT INTO Ubicacion (tipo, nombre, descripcion, id_Evento_fk2, id_Reino_fk) VALUES
    ('Ciudad', 'Desembarco del Rey', 'Capital de los Siete Reinos', 1, 5),
    ('Castillo', 'Invernalia', 'Fortaleza Stark', 2, 1),
    ('Castillo', 'El Muro', 'Muralla de hielo', 6, 6),
    ('Ciudad', 'Braavos', 'Ciudad libre', 3, 4),
    ('Castillo', 'Roca Casterly', 'Fortaleza Lannister', 4, 5),
    ('Castillo', 'Pyke', 'Fortaleza Greyjoy', 5, 2);

