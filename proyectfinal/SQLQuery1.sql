
CREATE DATABASE Hospital

GO

USE Hospital
GO
CREATE TABLE Dept (Dept_No INT NOT NULL, DNombre VARCHAR(50) NULL, Loc VARCHAR(50) NULL, CONSTRAINT PK_Dept PRIMARY KEY(Dept_No))
GO
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','POLANCO') 
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACIÓN','INSURGENTES') 
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','ROMA NORTE') 
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCIÓN','CONDESA')
GO

SELECT * FROM Dept
GO
CREATE TABLE Emp
(Emp_No INT NOT NULL,Apellido VARCHAR(50) NULL,Oficio VARCHAR(50) NULL,Dir INT NULL,Fecha_Alt INT NULL,Salario NUMERIC(9,2) NULL,Comision NUMERIC(9,2) NULL,Dept_No INT NULLCONSTRAINT PK_Emp PRIMARY KEY(Emp_No),CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No))
GO

INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7369,'SANCHEZ','EMPLEADO',7902,'17122004',10400,0,20)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No) VALUES(7499,'ARROYO','VENDEDOR',7698,'22022010',208000,39000,30)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7521,'SALA','VENDEDOR',689,'22022011',162500,65000,30)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7566,'JIMENEZ','DIRECTOR',7839,'02042011',386750,0,20)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7654,'MARTIN','VENDEDOR',7698,'28092015',182000,182000,30)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7698,'NEGRO','DIRECTOR',7839,'01052016',370500,0,30)
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)VALUES(7782,'CEREZO','DIRECTOR',7839,'09062015',318500,0,10)

GO

SELECT * FROM Emp


GO
CREATE TABLE Hospital (Hospital_Cod INT NOT NULL,Nombre VARCHAR(50) NULL,Direccion VARCHAR(50) NULL,Telefono VARCHAR(50) NULL,Num_Cama INT NULL,CONSTRAINT PK_Hospital PRIMARY KEY(Hospital_Cod))
GO
--Insertar datos en la tabla Hospital
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(19,'Provincial','O Donell 50','5964-4256',502)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(18,'General','Atocha s/n','5595-3111',987)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(22,'La Paz','Castellana 1000','5923-5411',412)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(45,'San Carlos','Ciudad Universitaria','5597-1500',845)
GO

SELECT * FROM Hospital
GO
CREATE TABLE Doctor(Doctor_No INT NOT NULL,Hospital_Cod INT NOT NULL,Apellido VARCHAR(50) NULL,Especialidad VARCHAR(50) NULL CONSTRAINT PK_Doctor PRIMARY KEY(Doctor_No),CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod))
GO

INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,386,'Cabeza D.','Psiquiatría')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,398,'Best D.','Urología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(19,435,'López A.','Cardiología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,453,'Galo D.','Pediatría')

GO

SELECT * FROM Doctor
GO



/*CONSULTAS*/

--2. Mostrar el apellido, oficio, salario, salario anual, con las dos extras para aquellos empleados con comisión mayor de 100000.
SELECT APELLIDO, OFICIO, SALARIO, SALARIO * 14 AS 'SALARIO ANUAL' FROM EMP WHERE COMISION > 100000
--3. Idéntico del anterior, pero para aquellos empleados que su salario anual con extras supere los 2200000
SELECT APELLIDO, OFICIO,SALARIO, SALARIO * 14 AS 'SALARIO ANUAL' FROM EMPWHERE SALARIO * 14 > 2200000

--5. Mostrar todos los datos de empleados ordenados por departamento y dentro de este por oficio para tener una visión jerárquica.
SELECT * FROM EMP ORDER BY DEPT_NO, OFICIO
--51. Calcular el salario medio, Diferencia, Máximo y Mínimo de cada oficio. Indicando el oficio y el número de empleados de cada oficio.
SELECT OFICIO, COUNT(*) AS [Nº DE EMPLEADOS], MIN(SALARIO) AS [SALARIO MÍNIMO], MAX(SALARIO) AS [SALARIO MÁXIMO], MAX(SALARIO) - MIN(SALARIO) AS [DIFERENCIA], AVG(SALARIO) AS [MEDIA] FROM EMP GROUP BY OFICIO

