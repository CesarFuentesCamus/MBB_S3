DESCRIBE ESCUELA;

INSERT INTO ESCUELA (ID_ESC, NOMBRE, TIPO_ESCUELA, UBICACION, CONTACTO)
VALUES (1, 'Futbol Norte', 'Fútbol', 'Santiago', 987654321),
       (2, 'Basquet Sur', 'Básquetbol', 'Valparaíso', 987123456),
       (3, 'Tenis Andes', 'Tenis', 'La Serena', 987789456);

INSERT INTO ESCUELA (ID_ESC, NOMBRE, TIPO_ESCUELA, UBICACION, CONTACTO)
VALUES (4, 'kayac Centro', 'Natación', 'Concepción', 987654987);

CREATE SEQUENCE escuela_seq
START WITH 5 -- Comienza con 5 ya que los registros 1-4 ya existen
INCREMENT BY 1; -- Incremento de uno en uno

CREATE OR REPLACE TRIGGER escuela_autoinc
BEFORE INSERT ON ESCUELA
FOR EACH ROW
WHEN (NEW.ID_ESC IS NULL)
BEGIN
  SELECT escuela_seq.NEXTVAL INTO :NEW.ID_ESC FROM dual;
END;
/

INSERT INTO ESCUELA (NOMBRE, TIPO_ESCUELA, UBICACION, CONTACTO)
VALUES ('Escuela padel', 'Voleibol', 'Temuco', 987456321);

SELECT * FROM ESCUELA;

CREATE SEQUENCE personal_seq
START WITH 1 -- Iniciar en 1, o en el número que corresponda si ya tienes registros
INCREMENT BY 1; -- Incremento de uno en uno

CREATE OR REPLACE TRIGGER personal_autoinc
BEFORE INSERT ON PERSONAL
FOR EACH ROW
WHEN (NEW.ID_PERSONAL IS NULL)
BEGIN
  SELECT personal_seq.NEXTVAL INTO :NEW.ID_PERSONAL FROM dual;
END;
/

DESCRIBE PERSONAL;

CREATE OR REPLACE TRIGGER personal_autoinc
BEFORE INSERT ON PERSONAL
FOR EACH ROW
WHEN (NEW.ID_PER IS NULL)
BEGIN
  SELECT personal_seq.NEXTVAL INTO :NEW.ID_PER FROM dual;
END;
/

INSERT INTO PERSONAL (NOMBRE, PROFESION, NACIONALIDAD, CORREO, TELEFONO, ESCUELA_ID_ESC)
VALUES ('Ana Gómez', 'Entrenadora', 'Chilena', 'agomez@correo.com', 987654321, 1),
       ('Isa Pérez', 'Kinesiólogo', 'Chileno', 'cperez@correo.com', 987123456, 2),
       ('Cesar camus', 'Nutricionista', 'Argentina', 'lmartinez@correo.com', 987456789, 3),
       ('Joe Sánchez', 'Enfermero', 'Peruano', 'psanchez@correo.com', 987789123, 1);

SELECT * FROM PERSONAL;

DELETE FROM PERSONAL;

DROP SEQUENCE personal_seq;

CREATE SEQUENCE personal_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO PERSONAL (NOMBRE, PROFESION, NACIONALIDAD, CORREO, TELEFONO, ESCUELA_ID_ESC)
VALUES ('Ana Gómez', 'Entrenadora', 'Chilena', 'agomez@correo.com', 987654321, 1),
       ('Isa Pérez', 'Kinesiólogo', 'Chileno', 'cperez@correo.com', 987123456, 2),
       ('Cesar Camus', 'Nutricionista', 'Argentina', 'lmartinez@correo.com', 987456789, 3),
       ('Joe Sánchez', 'Enfermero', 'Peruano', 'psanchez@correo.com', 987789123, 1);

SELECT * FROM PERSONAL;

DESCRIBE COSTO_OPERACIONALES;

CREATE SEQUENCE costo_operaciones_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER costo_operaciones_autoinc
BEFORE INSERT ON COSTO_OPERACIONALES
FOR EACH ROW
WHEN (NEW.ID_COS IS NULL)
BEGIN
  SELECT costo_operaciones_seq.NEXTVAL INTO :NEW.ID_COS FROM dual;
END;
/

INSERT INTO COSTO_OPERACIONALES (DESCRIPCION_COSTO, MONTO, ESCUELA_ID_ESC)
VALUES ('Compra de balones', 50000, 1),
       ('Mantenimiento de cancha', 150000, 2),
       ('Pago a entrenadores', 200000, 1),
       ('Compra de uniformes', 75000, 3);

SELECT * FROM COSTO_OPERACIONALES;

DESCRIBE INSTALACIONES;

CREATE SEQUENCE instalaciones_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER instalaciones_autoinc
BEFORE INSERT ON INSTALACIONES
FOR EACH ROW
WHEN (NEW.ID_INS IS NULL)
BEGIN
  SELECT instalaciones_seq.NEXTVAL INTO :NEW.ID_INS FROM dual;
END;
/

INSERT INTO INSTALACIONES (NOMBRE_INSTALACION, TIPO_INSTALACION, CAPACIDAD, ESCUELA_ID_ESC)
VALUES ('Cancha a3', 'Fútbol', 1000, 1),
       ('Gimnasio b2', 'Básquetbol', 500, 2),
       ('Piscina c1', 'Natación', 200, 3),
       ('Cancha a2', 'Tenis', 150, 1);

SELECT * FROM INSTALACIONES;

DESCRIBE SOLICITUDES_FONDOS;

CREATE SEQUENCE solicitudes_fondos_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER solicitudes_fondos_autoinc
BEFORE INSERT ON SOLICITUDES_FONDOS
FOR EACH ROW
WHEN (NEW.ID_SOL IS NULL)
BEGIN
  SELECT solicitudes_fondos_seq.NEXTVAL INTO :NEW.ID_SOL FROM dual;
END;
/

INSERT INTO SOLICITUDES_FONDOS (MONTO_SOLICITADO, FECHA_SOLICITUD, ESCUELA_ID_ESC)
VALUES (150000, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1),
       (300000, TO_DATE('2024-09-25', 'YYYY-MM-DD'), 2),
       (100000, TO_DATE('2024-09-30', 'YYYY-MM-DD'), 3),
       (200000, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 1);
       
SELECT * FROM ESCUELA;
SELECT * FROM PERSONAL;
SELECT * FROM INSTALACIONES;
SELECT * FROM COSTO_OPERACIONALES;
SELECT * FROM SOLICITUDES_FONDOS;
