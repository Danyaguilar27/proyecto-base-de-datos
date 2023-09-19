biblioteca_escuelaCREATE DATABASE BIBLIOTECA_ESCUELA
USE BIBLIOTECA_ESCUELA 
CREATE TABLE autor
(
	ID_Autor VARCHAR (3),
	Nombre_Au VARCHAR (50),
	Pais VARCHAR (50),
	CONSTRAINT pk_auto PRIMARY KEY (ID_Autor)
	
)
CREATE TABLE EDITORIAL 
(
	Cve_Editorial VARCHAR (3),
	Nom_Editorial VARCHAR (50),
	Cantidad VARCHAR (50),
	CONSTRAINT pk_ce PRIMARY KEY (Cve_Editorial)
)

CREATE TABLE LECTOR
(
	Cod_Lector VARCHAR (3),
	Nombre VARCHAR (50),
	Telefono VARCHAR (10),
	Direccion VARCHAR (50),
	CONSTRAINT pk_cer PRIMARY KEY (Cod_Lector)
)
CREATE TABLE CATEGORIA
(
	Cod_Categoria VARCHAR (3),
	Nom_Categoria VARCHAR (50),
	Cantidad_Categoria VARCHAR (50),
	CONSTRAINT pk_ca PRIMARY KEY (Cod_Categoria) 
) 
CREATE TABLE LIBRO 
(
	Num_Inventario VARCHAR (3),
	Titulo VARCHAR (50),
	Num_Edicion VARCHAR (50),
	Estado VARCHAR (50),
	Cod_Categoria1 VARCHAR (3),
	Cve_Editorial2 VARCHAR (3),
	ID_Autor3 VARCHAR (3),
	CONSTRAINT pk_ni PRIMARY KEY (Num_Inventario),
	CONSTRAINT fk_coca FOREIGN KEY (Cod_Categoria1) REFERENCES categoria (Cod_Categoria),
	CONSTRAINT fk_edi FOREIGN KEY (Cve_Editorial2) REFERENCES editorial (Cve_Editorial),
	CONSTRAINT fk_au FOREIGN KEY (ID_Autor3) REFERENCES autor (ID_Autor) 
)
CREATE TABLE PRESTAMO
(
	Cve_Prestamo VARCHAR (3),
	Num_Inventario1 VARCHAR (3),
	Cod_Lector2 VARCHAR (3),
	CONSTRAINT pk_pre PRIMARY KEY (Cve_Prestamo),
	CONSTRAINT fk_tario FOREIGN KEY (Num_Inventario1) REFERENCES libro (Num_Inventario),
	CONSTRAINT fk_tor FOREIGN KEY (Cod_Lector2) REFERENCES lector (Cod_Lector) 
)


INSERT INTO autor VALUES 
('A01', 'Gabriel Marquez', 'Colombia'),
('A02', 'Leopoldo Marechal', 'Argentina'),
('A03', 'Maria Vargas', 'Peru'),
('A04', 'Isabel Allende', 'Chile'),
('A05', 'Jose Ledezma', 'Cuba'),
('A06', 'Octavio Paz', 'Mexico'),
('A07', 'Miguel Asturias', 'Guatemala'),
('A08', 'Miguel Silba', 'Venezuela'),
('A09', 'Jorge Adoum', 'Ecuador'),
('A10', 'Augusto Roa', 'Paraguay')
SELECT * FROM autor

INSERT INTO editorial VALUES 
('E52', 'Almadia', '450'),
('E65', 'Antilope', '752'),
('E78', 'Caja Negra', '632'),
('E43', 'Cuneta', '102'),
('E87', 'Alias', '659'),
('E27', 'Impronta', '471'),
('E31', 'Sexto Piso', '150'),
('E28', 'Simoro', '962'),
('E13', 'Alacraña', '525'),
('E56', 'Lierup', '654')
SELECT * FROM editorial 

INSERT INTO lector VALUES 
('L40', 'Carlos', '441 131 1364', 'Pinal'),
('L41', 'Gustavo', '441 456 1232', 'Peñamiller'),
('L42', 'Axel', '441 987 9878', 'Landa'),
('L43', 'Fatima', '441 212 4714', 'Vizarron'),
('L44', 'Rodrigo', '441 852 3298', 'Cadereyta'),
('L45', 'Francisco', '441 741 5487', 'Jalpan'),
('L46', 'Alvaro', '441 852 3289', 'Toliman'),
('L47', 'Diego', '441 951 4586', 'Bucareli'),
('L48', 'Dael', '441 753 2532', 'Escanelilla'),
('L49', 'Victor', '441 357 4163', 'Colon')
SELECT * FROM lector 


INSERT INTO categoria VALUES 
('C90','Consulta','20'),  
('C91','Informativo','50'), 
('C92','Sagas','30'), 
('C93','Literatura','10'), 
('C94','Historia','90'), 
('C95','Cultura','60'), 
('C96','Complementario','40'), 
('C97','Recreativos','80'), 
('C98','Cientificos','70'), 
('C99','Instructivos','100')  


INSERT INTO libro VALUES 
('123', 'Diccionario', '1998', 'Perdido', 'C90', 'E52', 'A01'),  
('789', 'Cuerpo Humano', '1875', 'Regresado', 'C91', 'E65', 'A02'),
('456', 'Crepusculo', '1995', 'Garantia', 'C92', 'E78', 'A03'),
('963', 'Un final perfecto', '2010', 'Pagado', 'C93', 'E43', 'A04'),
('852', 'Quijote de la mancha', '1885', 'Multa', 'C94', 'E87', 'A05'),
('741', 'Multiculturalidad', '1974', 'Prestado', 'C95', 'E27', 'A06'),
('321', 'Figuras Geometricas', '1965', 'Pagado', 'C96', 'E31', 'A07'),
('654', 'El pastor mentiroso', '1999', 'Perdido', 'C97', 'E28', 'A08'),
('753', 'Quimica', '1900', 'Garantia', 'C98', 'E13', 'A09'),
('951', 'Cocina', '1950', 'Multa', 'C99', 'E56', 'A10')                    }


INSERT INTO prestamo VALUES
('P11', '123', 'L40'),  
('P12', '789', 'L41'), 
('P13', '456', 'L42'), 
('P14', '963', 'L43'), 
('P15', '852', 'L44'), 
('P16', '741', 'L45'), 
('P17', '321', 'L46'), 
('P18', '654', 'L47'), 
('P19', '753', 'L48'), 
('P20', '951', 'L49')   




/*QUEREMOS SABER A QUE CATEGORIA PERTENECE EL LIBRO SELECCIONAO*/        
SELECT Nom_Categoria, Titulo
FROM libro INNER JOIN categoria
ON Cod_Categoria1 = categoria.Cod_Categoria
WHERE Titulo = 'Crepusculo'




/*queremos saber todos los libros que pertenecen a una determinada editorial*/
SELECT Nom_Editorial, Titulo
FROM libro INNER JOIN editorial 
ON Cve_Editorial2 = editorial.Cve_Editorial
WHERE Titulo = 'Cocina'





/*queremos ver que libros ha escrito determinado autor*/
SELECT Nombre_Au, Titulo
FROM libro INNER JOIN autor
ON ID_Autor3 = autor.ID_Autor
WHERE Titulo = 'Un final perfecto'




/*queremos saber que libros estan prestados*/
SELECT Titulo, Estado
FROM libro
WHERE Estado = 'Prestado'




/*quremos saber que perosnas tienen los libros prestados*/
SELECT Nombre, Estado
FROM prestamo INNER JOIN lector
ON Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON Num_Inventario1 = libro.Num_Inventario
WHERE Estado = 'Prestado'




/*queremos saber personas que deben libros*/
SELECT Nombre, Estado 
FROM prestamo INNER JOIN lector 
ON Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro 
ON Num_Inventario1 = libro.Num_Inventario
WHERE Estado = 'Perdido' 



/*queremos saber que personas tienen multas por n enregar libros*/
SELECT Nombre, Estado
FROM prestamo INNER JOIN lector
ON Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON Num_Inventario1 = libro.Num_Inventario
WHERE Estado = 'Multa'




/*queremos saber cuantos libros son de cada categoria*/
SELECT Nom_Categoria, Cantidad_Categoria
FROM categoria 




/*queremos saber cuantos libros son de cada editorial*/

SELECT Nom_Editorial, Cantidad
FROM editorial



/*queremos saber que personas, de que autores y de que editoriales tienenlibros prestados*/
SELECT  Nombre,  Nombre_Au, Nom_Editorial, Estado 
FROM prestamo INNER JOIN lector
ON prestamo.Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
INNER JOIN autor
ON libro.ID_Autor3 = autor.ID_Autor
INNER JOIN editorial
ON libro.Cve_Editorial2 = editorial.Cve_Editorial
WHERE Estado = 'Prestado' 




/*Queremos ver las personas que estan en garantia*/
SELECT nombre, Estado
FROM prestamo INNER JOIN lector 
ON prestamo.Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
WHERE Estado = 'Garantia'





/*queremos ver los libros que se perdieron y no se han repuesto*/
SELECT Titulo, Estado
FROM libro
WHERE Estado = 'Perdido'


/*cual es el  libro, quien lo tiene, con clave de prestamo esta el numero de inventario 741*/
SELECT Titulo, Nombre, Cve_Prestamo 
FROM prestamo INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
INNER JOIN lector
ON prestamo.Cod_Lector2 = lector.Cod_Lector
WHERE Num_Inventario = '741'



/*queremos ver todos los datos de el libro un final perfecto y quien lo tiene*/
SELECT Num_Inventario, Titulo, Num_Edicion, Estado, Cod_Categoria1, Cve_Editorial2, ID_Autor3, Nombre
FROM lector INNER JOIN prestamo
ON prestamo.Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
WHERE LIBRO.Titulo = 'Un final perfecto'

/*QUEREMOS SABER CUAL ES LA CLAVE DEL PRESTAMO DEL LIBRO CON LA EDICION 1999*/
SELECT Cve_Prestamo, Titulo,Num_Edicion
FROM prestamo INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
WHERE libro.Num_Edicion = '1999'



/*que autor escribe los libros de la categoria informatica*/
SELECT Nombre_Au, Titulo, Nom_Categoria
FROM libro INNER JOIN autor
ON libro.ID_Autor3 = autor.ID_Autor
INNER JOIN categoria 
ON libro.Cod_Categoria1 = categoria.Cod_Categoria
WHERE categoria.Nom_Categoria = 'Informativo'


/*que lector esta leyendo el libro con la categoria historia y con que clave de prestamo lo tiene*/
SELECT Nombre, Titulo, Nom_Categoria, Cve_Prestamo
FROM prestamo INNER JOIN lector
ON prestamo.Cod_Lector2 = lector.Cod_Lector
INNER JOIN libro
ON prestamo.Num_Inventario1 = libro.Num_Inventario
INNER JOIN categoria
ON libro.Cod_Categoria1 = categoria.Cod_Categoria
WHERE categoria.Nom_Categoria = 'Historia'





