# Servicio Nacional de Aprendizaje Sena
## AP06-AA7-EV02. LENGUAJE ESTRUCTURADO DE CONSULTAS SQL.



### Creado por:

* Estefania Garces Perez
* Leidy Julieth Rojas
* Pedro Alexander Beltran Hernandez

***

## Introduccion:

En el presente documento se realiza las consultas solicitadas en la evidencia a entregar. Estas se realizan con base a la infroamcion que implementa nuestro sistema, el cual se basa en un sistema basico de ventas (carrito de compras), el cual tiene informacion hipotetica que actua como informacion funcional para ser implementada en cada una de las consultas.

Para una mayor claridad, en caso de que el presente documento sea confunso, junto con este archivo .txt, se dejara un enlace de GitHub para poder descargar los archivos, sql de manera directa.

*** 

### Desarrollo:

__HOJA PARA CREACION DE BASE DE DATOS Y DE TABLAS:__

~~~
CREATE DATABASE tienda_virtual;

USE tienda_virtual;

CREATE TABLE IF NOT EXISTS `mydb`.`Roles_usuarios` (
  `Id_roles_user` INT NOT NULL AUTO_INCREMENT,
  `Usuario` INT NOT NULL,
  `Rol` INT NOT NULL,
  PRIMARY KEY (`Id_roles_user`),
  UNIQUE INDEX `Id_user_UNIQUE` (`Usuario` ASC) VISIBLE,
  UNIQUE INDEX `Id_roles_UNIQUE` (`Rol` ASC) VISIBLE,
  CONSTRAINT `Usuario`
    FOREIGN KEY (`Usuario`)
    REFERENCES `mydb`.`Usuarios` (`Id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rol`
    FOREIGN KEY (`Rol`)
    REFERENCES `mydb`.`Roles` (`Id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `mydb`.`Roles_usuarios` (
  `Id_roles_user` INT NOT NULL AUTO_INCREMENT,
  `Usuario` INT NOT NULL,
  `Rol` INT NOT NULL,
  PRIMARY KEY (`Id_roles_user`),
  UNIQUE INDEX `Id_user_UNIQUE` (`Usuario` ASC) VISIBLE,
  UNIQUE INDEX `Id_roles_UNIQUE` (`Rol` ASC) VISIBLE,
  CONSTRAINT `Usuario`
    FOREIGN KEY (`Usuario`)
    REFERENCES `mydb`.`Usuarios` (`Id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rol`
    FOREIGN KEY (`Rol`)
    REFERENCES `mydb`.`Roles` (`Id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `Id_rol` INT NOT NULL AUTO_INCREMENT,
  `Nombre_rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id_rol`));
  
CREATE TABLE IF NOT EXISTS `mydb`.`Contactos` (
  `ID_Cont` INT NOT NULL AUTO_INCREMENT,
  `Celular` VARCHAR(20) NOT NULL,
  `Telefono` VARCHAR(20) NULL,
  `Email` VARCHAR(50) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Cont`),
  UNIQUE INDEX `ID_Cont_UNIQUE` (`ID_Cont` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `ID_Proveedor` INT NOT NULL AUTO_INCREMENT,
  `Tipo_doc` INT NOT NULL,
  `No_identificacion_prov` INT NOT NULL,
  `Nombre_prov` VARCHAR(50) NOT NULL,
  `Direccion` VARCHAR(50) NOT NULL,
  `Ciudad` VARCHAR(50) NOT NULL,
  `id_datos_contact` INT NOT NULL,
  PRIMARY KEY (`ID_Proveedor`),
  UNIQUE INDEX `No_identificacion_prov_UNIQUE` (`No_identificacion_prov` ASC) VISIBLE,
  UNIQUE INDEX `Tipo_doc_UNIQUE` (`Tipo_doc` ASC) VISIBLE,
  INDEX `id_contact_prov_idx` (`id_datos_contact` ASC) VISIBLE,
  CONSTRAINT `Tipo_doc`
    FOREIGN KEY (`Tipo_doc`)
    REFERENCES `mydb`.`Tipo_doc` (`Id_tipo_doc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_contact_prov`
    FOREIGN KEY (`id_datos_contact`)
    REFERENCES `mydb`.`Contactos` (`ID_Cont`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_doc` (
  `Id_tipo_doc` INT NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_doc` VARCHAR(6) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_tipo_doc`),
  UNIQUE INDEX `Id_tipo_doc_UNIQUE` (`Id_tipo_doc` ASC) VISIBLE);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor_producto` (
  `id_proveedor_producto` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_proveedor_producto`),
  INDEX `fk_proveedor_prod_idx` (`id_proveedor` ASC, `id_producto` ASC) VISIBLE,
  INDEX `fk_producto_dist_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_prod`
    FOREIGN KEY (`id_proveedor` , `id_producto`)
    REFERENCES `mydb`.`Proveedores` (`ID_Proveedor` , `ID_Proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_dist`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`Productos` (`ID_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `ID_Prod` INT NOT NULL AUTO_INCREMENT,
  `Descripcion_prod` TEXT NOT NULL,
  `Stock` INT NOT NULL,
  `Precio_publico` DECIMAL NOT NULL,
  `Precio_compra` DECIMAL NOT NULL,
  `No_serie` CHAR(8) NOT NULL,
  `id_modelo` INT NOT NULL,
  `id_tipo_prod` INT NOT NULL,
  PRIMARY KEY (`ID_Prod`),
  INDEX `fk_id_modelo_idx` (`id_modelo` ASC) VISIBLE,
  INDEX `fk_id_tipo_prod_idx` (`id_tipo_prod` ASC) VISIBLE,
  CONSTRAINT `fk_id_modelo`
    FOREIGN KEY (`id_modelo`)
    REFERENCES `mydb`.`Modelo` (`Id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_tipo_prod`
    FOREIGN KEY (`id_tipo_prod`)
    REFERENCES `mydb`.`Tipo_producto` (`id_tipo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Modelo` (
  `Id_marca` INT NOT NULL AUTO_INCREMENT,
  `Nombre_modelo` VARCHAR(50) NOT NULL,
  `id_fabricante` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`Id_marca`),
  UNIQUE INDEX `Id_marca_UNIQUE` (`Id_marca` ASC) VISIBLE,
  INDEX `fk_fabricante_idx` (`id_fabricante` ASC) VISIBLE,
  INDEX `fk_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_fabricante`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `mydb`.`Fabricante` (`id_fabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `mydb`.`Categorias` (`ID_Cat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Categorias` (
  `ID_Cat` INT NOT NULL AUTO_INCREMENT,
  `Nombre_cat` VARCHAR(50) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Cat`));
  
  
CREATE TABLE IF NOT EXISTS `mydb`.`Fabricante` (
  `id_fabricante` INT NOT NULL AUTO_INCREMENT,
  `nombre_fabricante` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_fabricante`));
    
CREATE TABLE IF NOT EXISTS `mydb`.`fabricante_producto` (
  `id_fabricante_producto` INT NOT NULL AUTO_INCREMENT,
  `id_fabricante` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_fabricante_producto`),
  INDEX `fk_fabricante_prod_idx` (`id_fabricante` ASC) VISIBLE,
  INDEX `fk_producto_fab_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_fabricante_prod`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `mydb`.`Fabricante` (`id_fabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_fab`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`Productos` (`ID_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_producto` (
  `id_tipo_producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_prod` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_producto`));
  
  
CREATE TABLE IF NOT EXISTS `mydb`.`Carrito` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_total` DOUBLE NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_producto_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`Productos` (`ID_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `ID_Factura` INT NOT NULL AUTO_INCREMENT,
  `Fecha_creacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Valor_IVA` DECIMAL NOT NULL,
  `Valor_total_compra` DECIMAL NOT NULL,
  `Valor_envio` DECIMAL NOT NULL,
  `Cliente` INT NOT NULL,
  `Comprar` INT NOT NULL,
  PRIMARY KEY (`ID_Factura`),
  UNIQUE INDEX `Id_user_UNIQUE` (`Cliente` ASC) VISIBLE,
  INDEX `fk_compra_idx` (`Comprar` ASC) VISIBLE,
  CONSTRAINT `fk_idCliente_factura`
    FOREIGN KEY (`Cliente`)
    REFERENCES `mydb`.`Usuarios` (`Id_user`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_compra`
    FOREIGN KEY (`Comprar`)
    REFERENCES `mydb`.`Carrito` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `ID_Venta` INT NOT NULL AUTO_INCREMENT,
  `Fecha_venta` DATE NOT NULL,
  `id_factura` INT NOT NULL,
  PRIMARY KEY (`ID_Venta`),
  UNIQUE INDEX `ID_Venta_UNIQUE` (`ID_Venta` ASC) VISIBLE,
  INDEX `fk_factura_idx` (`id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_factura`
    FOREIGN KEY (`id_factura`)
    REFERENCES `mydb`.`Facturas` (`ID_Factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  SELECT * FROM usuarios;
  ~~~
> Creacion de tabla aparte para alusion a un ejemplo con trigger 
  ~~~
CREATE DATABASE ejemplo_trigger;
USE ejemplo_trigger;

CREATE TABLE venta(
	id INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    total DECIMAL(10,2),
    PRIMARY KEY(id)
);

CREATE TABLE concepto(
	id INT NOT NULL AUTO_INCREMENT,
    idVenta INT NOT NULL,
    descripcion VARCHAR(40),
    precio DECIMAL(10,2),
    PRIMARY KEY(id)
);
~~~

***

# Actividades a entregar:

## __1) Crear consultas de inserción y actualización por cada una de las tablas creadas__

* Tabla usuarios
~~~
INSERT INTO usuarios(Tipo_doc,No_documento,Nombre_user, Apellido,Fecha_nacimiento,Direccion,Ciudad,Password,id_datos_contacto)
VALUE (1,1033801048,"Pedro Alexander","Beltran Hernandez","1997-10-09","Cra 17B # 70B 05-SUR","Bogota D.C.","Abc.12345",1);

INSERT INTO usuarios(Tipo_doc,No_documento,Nombre_user, Apellido,Fecha_nacimiento,Direccion,Ciudad,Password)
VALUE (1,1555555555,"Frailejon Hernesto","Perez","1997-10-09","Calle falsa 123","Bogota D.C.","Abc.12345");

INSERT INTO usuarios(Tipo_doc,No_documento,Nombre_user, Apellido,Fecha_nacimiento,Direccion,Ciudad,Password,id_datos_contacto) 
VALUE (1,1033333888,"Pepito","Perez","1990-06-15","Calle falsa 123","Springfield","Abc.12345",2);

UPDATE usuarios SET Password = "Abc.45678" 
WHERE Id_user = 2;

UPDATE usuarios SET id_datos_contacto = 5 
WHERE Id_user = 3;

-- Tabla Tipo documento
INSERT INTO tipo_doc(Nombre_tipo_doc) VALUE ("CxC");
INSERT INTO tipo_doc(Nombre_tipo_doc) VALUE ("CE");
INSERT INTO tipo_doc(Nombre_tipo_doc) VALUE ("PEP");
INSERT INTO tipo_doc(Nombre_tipo_doc) VALUE ("NIT/RUT");

UPDATE Tipo_doc SET Nombre_tipo_doc = "CC" 
WHERE id_tipo_doc = 1;
~~~
* Tabla roles 
~~~
INSERT INTO roles (Nombre_rol) VALUE ("Costumer");
INSERT INTO roles (Nombre_rol) VALUE ("Administrattor");

UPDATE roles SET Nombre_rol = "Cliente" 
WHERE Id_rol = 1;
UPDATE roles SET Nombre_rol = "Administrador" 
WHERE Id_rol = 2;

-- Tabla roles_usuarios

INSERT INTO roles_usuarios (Usuario,Rol) VALUE (2,1);
INSERT INTO roles_usuarios (Usuario,Rol) VALUE (2,3);
INSERT INTO roles_usuarios (Usuario,Rol) VALUE (3,1);

UPDATE roles_usuarios SET Usuario = 1, Rol=1 
WHERE Id_roles_user = 1;
~~~
 
* Tabla Proveedor

~~~
INSERT INTO proveedores (Tipo_doc,No_identificacion_prov,Nombre_prov,Pais) 
VALUE (4,"80000123-0","Samsung","South Korea");

INSERT INTO proveedores (Tipo_doc,No_identificacion_prov,Nombre_prov,Pais) 
VALUE (4,"80000456-0","Lenovo","Japon");

UPDATE proveedores SET Nombre_prov = "Mundo digital" WHERE ID_Proveedor = 1;
UPDATE proveedores SET Nombre_prov = "FamiTech" WHERE ID_Proveedor = 2;
~~~

* Tabla Contactos

~~~
INSERT INTO contactos (Celular,Telefono,Email)
VALUE ("3199997777","(601)3558877","pabeltran@senaedu.edu.co");

INSERT INTO contactos (Celular,Telefono,Email)
VALUE ("3154587977","(601)3447877","correo@correo.com");

INSERT INTO contactos (Celular,Telefono,Email)
VALUE ("3232793333 ","(601)7247329","samsung.com.co");

INSERT INTO contactos (Celular,Telefono,Email)
VALUE ("+5715800360","(601)3819811","www.lenovo.com");

INSERT INTO contactos (Celular,Telefono,Email)
VALUE ("+573135558888","(601)3101010","fraoilejon@gmail.com");

UPDATE contactos SET Email = "mundodigital@gmail.com" WHERE ID_Cont = 3;
UPDATE contactos SET Email = "famitech@gmail.com" WHERE ID_Cont = 4;
~~~

* Tabla Categoria
~~~
INSERT INTO categorias(Nombre_cat) VALUE ("Celulares");
INSERT INTO categorias(Nombre_cat) VALUE ("Televisores");
INSERT INTO categorias(Nombre_cat) VALUE ("Linea blanca");
~~~
* Tabla Fabricante
~~~
INSERT INTO fabricante(nombre_fabricante) VALUE ("Samsung");
INSERT INTO fabricante(nombre_fabricante) VALUE ("LG");
INSERT INTO fabricante(nombre_fabricante) VALUE ("Apple");
~~~
* Tabla modelo
~~~
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("Galaxy S10",1,1);
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("Galaxy A22",1,1);
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("carga frontal",1,3);
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("French Door",2,3);
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("TV Serie 2000k",2,2);
INSERT INTO modelo(Nombre_modelo,id_fabricante,id_categoria) VALUE ("Serie 11",3,1);

UPDATE modelo SET Nombre_modelo = "carga frontal" WHERE Id_marca = 3;
UPDATE modelo SET Nombre_modelo = "LG UHD AI Thinq" WHERE Id_marca = 4;
UPDATE modelo SET Nombre_modelo = "WD11T4046BX" WHERE Id_marca = 3;

ALTER TABLE modelo RENAME COLUMN Id_marca TO Id_modelo;
~~~

* Tabla productos
~~~
ALTER TABLE productos RENAME COLUMN Marca TO Modelo;
ALTER TABLE productos ADD COLUMN No_serie CHAR(6) NOT NULL;

INSERT INTO productos(Nombre_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie) 
VALUE ("Celular",80,4750000,2850000,6,"SCGS1");
INSERT INTO productos(Nombre_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie) 
VALUE ("Celular",50,796700,479000,1,"SCGA22");

ALTER TABLE productos ADD COLUMN id_tipo_prod INT NOT NULL;
ALTER TABLE productos RENAME COLUMN descricion_prod TO descripcion_prod;

UPDATE productos SET descripcion_prod = 'Celular SAMSUNG Galaxy A22 128GB Verde'
WHERE ID_Prod = 2;

UPDATE productos SET id_tipo_prod = 1
WHERE ID_Prod = 2;

UPDATE productos SET descripcion_prod = 'Celular Samsung Galaxy S10+ en color Prism Black, con memoria de 128 GB y cámara triple de hasta 16 MP. Tiene una pantalla Super AMOLED de 6,4" pulgadas y el procesador Octacore.'
WHERE ID_Prod = 1;

UPDATE productos SET id_tipo_prod = 1
WHERE ID_Prod = 1;

INSERT INTO productos(descripcion_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie,id_tipo_prod) 
VALUE ("Televisor LG 55 4K Smart TV",30,2100000,1260000,4,"LGTUAT",2);

INSERT INTO productos(descripcion_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie,id_tipo_prod) 
VALUE ("Nevecón LG French door 618 lt Linear Inverter LM22SGPK",50,5000000,3000000,2,"LGNFD6",3);

INSERT INTO productos(descripcion_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie,id_tipo_prod) 
VALUE ("Nevecón LG French door 618 lt Linear Inverter LM22SGPK",50,5000000,3000000,2,"LGNFD6",3);

INSERT INTO productos(descripcion_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie,id_tipo_prod) 
VALUE ("Lavadora Secadora Samsung 11 Kg Carga Frontal Silver",48,3090000,1854000,3,"SLS1CF",4);

INSERT INTO productos(descripcion_prod,Stock,Precio_publico,Precio_compra,Modelo,No_serie,id_tipo_prod) 
VALUE ("iPhone 11 64 GB 'Negro",30,2380000,1428000,5,"IP116N",1);
~~~

* Tabla Tipo producto
~~~
INSERT INTO tipo_producto(Nombre_tipo_prod) VALUE ("Celular");
INSERT INTO tipo_producto(Nombre_tipo_prod) VALUE ("Televisor");
INSERT INTO tipo_producto(Nombre_tipo_prod) VALUE ("Nevecon");
INSERT INTO tipo_producto(Nombre_tipo_prod) VALUE ("Lavadora");
~~~

* Tabla fabricante_producto

~~~
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (1,1);
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (2,1);
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (3,2);
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (4,2);
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (5,1);
INSERT INTO fabricante_producto(id_producto,id_fabricante) VALUE (6,3);
~~~
* Tabla proveedores_productos
~~~
INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (1,1);
INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (1,2);
INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (1,6);

INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (2,3);
INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (2,4);
INSERT INTO proveedores_productos(Proveedores,Producto) 
VALUE (2,5);
~~~

***

## __2) crear 5 consultas de selección de mas de una tabla__

__Contacto de los proveedores y de ususarios__
~~~
SELECT p.Nombre_prov AS "Proveedor", c.Celular, c.Telefono, c.Email FROM proveedores p INNER JOIN contactos c ON p.id_contacto = ID_Cont;

SELECT  concat(u.Nombre_user," ",u.Apellido) AS "Nombre_ususario", c.Celular, c.Telefono, c.Email FROM usuarios u INNER JOIN contactos c ON u.id_datos_contacto = ID_Cont;
~~~

* __Fabricante del producto__
~~~
SELECT m.Nombre_modelo, f.nombre_fabricante FROM modelo m INNER JOIN fabricante f ON m.id_fabricante = f.id_fabricante;
~~~
* __Roles de usuario__

~~~
SELECT concat(u.Nombre_user," ",u.Apellido) AS "Nombre_ususario", r.Nombre_rol FROM roles_usuarios ru INNER JOIN usuarios u ON ru.Usuario = u.Id_user
INNER JOIN roles r ON ru.rol = r.Id_rol;
~~~

* __Canidad de usuarios registrados por permisos__

~~~
SELECT r.Nombre_rol, COUNT(ru.Rol) AS "Permisos_asignados" FROM roles_usuarios ru INNER JOIN roles r ON ru.Rol = Id_rol
GROUP BY r.Nombre_rol;
~~~

* __Productos con su respectivo fabricante y su precio__

~~~
SELECT p.descripcion_prod as "Descripcion", f.nombre_fabricante as "Fabricante", p.Precio_publico FROM fabricante_producto fp
INNER JOIN productos p ON fp.id_producto = p.ID_Prod
INNER JOIN fabricante f ON fp.id_fabricante = f.id_fabricante;
~~~

***
## __3) Consultas de agrupamiento__

* Cantidad de productos segun su marca __"COUNT()"__

~~~
SELECT f.nombre_fabricante as "Fabricante" , COUNT(p.descripcion_prod) as "Cantidad" FROM fabricante_producto fp
INNER JOIN productos p ON fp.id_producto = p.ID_Prod
INNER JOIN fabricante f ON fp.id_fabricante = f.id_fabricante
GROUP BY f.nombre_fabricante;
~~~

* Producto mas costo por marca __"MAX()"__
~~~
SELECT f.nombre_fabricante as "Fabricante" , p.descripcion_prod as "Descripcion", MAX(p.Precio_publico) AS "Precio" FROM fabricante_producto fp
INNER JOIN productos p ON fp.id_producto = p.ID_Prod
INNER JOIN fabricante f ON fp.id_fabricante = f.id_fabricante
GROUP BY f.nombre_fabricante;
~~~
* Producto mas economico __"MIN()"__
~~~
SELECT p.ID_Prod, p.descripcion_prod, p.Precio_publico FROM productos p 
WHERE Precio_publico = (SELECT MIN(Precio_publico) FROM productos);
~~~
* Suma de produtos en venta __"SUM()"__
~~~
SELECT COUNT(*) AS "Cantidad", SUM(Precio_publico) AS "Precio" FROM productos;
~~~
* Suma de produtos en venta __"AVG()"__
~~~
SELECT AVG(Precio_publico) AS "Promedio de precios" FROM productos;
~~~
***

## __4) 2 subconsultas__

* __Productos cuyo precio es mayor a $1.000.000__
~~~
SELECT ID_Prod, descripcion_prod FROM productos WHERE ID_Prod IN (
	SELECT ID_Prod FROM productos WHERE Precio_publico >= 1000000
);
~~~
* __Mostrando solo los productos cuya categoria son solo "Celulares"__
~~~
SELECT ID_Prod, descripcion_prod FROM productos WHERE id_tipo_prod IN (
	SELECT id_tipo_producto FROM tipo_producto WHERE Nombre_tipo_prod = "Celular"
);
~~~

***

## __5) 3 procedimientos almacenados__

* __Buscar ususarios con la letra "F"__
~~~
DROP PROCEDURE usuario_con_letra;

delimiter //
CREATE PROCEDURE usuario_con_letra (IN letra CHAR)
BEGIN 
	SELECT COUNT(*) as "Cantida " FROM usuarios
    WHERE Nombre_user LIKE CONCAT(letra, "%");
END//
delimiter ;

CALL usuario_con_letra("f");
~~~
* __Buscar ususarios con la letra "F" (Misma operacion anterior pero esta vez guardando el valor en una varaible de salida)__
~~~
DROP PROCEDURE usuario_con_letra_dos;

delimiter //
CREATE PROCEDURE usuario_con_letra_dos (IN letra CHAR,OUT numero INT)
BEGIN 
	SELECT COUNT(*) INTO numero FROM usuarios 
    WHERE Nombre_user LIKE CONCAT(letra, "%");
END//
delimiter ;

CALL usuario_con_letra_dos("p",@cantidad);
SELECT @cantidad; -- Pedro, Pepito
CALL usuario_con_letra_dos("f",@cantidad);
SELECT @cantidad; -- Frailejon
~~~
* __Filtro para devolver cantidad de productos dependiendo del tipo de producto__
~~~
DROP PROCEDURE cantidad_tipo_prducto;

delimiter //
CREATE PROCEDURE cantidad_tipo_prducto (IN tipo VARCHAR(10),OUT numero INT)
BEGIN
SELECT COUNT(*) INTO numero FROM productos WHERE id_tipo_prod IN (
	SELECT id_tipo_producto FROM tipo_producto WHERE Nombre_tipo_prod = tipo
);
END//
delimiter ;

CALL cantidad_tipo_prducto("Celular",@cantidad);
SELECT @cantidad; 
CALL cantidad_tipo_prducto("Televisor",@cantidad);
SELECT @cantidad; 
CALL cantidad_tipo_prducto("Nevecon",@cantidad);
SELECT @cantidad; 
CALL cantidad_tipo_prducto("Lavadora",@cantidad);
SELECT @cantidad; 
~~~

***

## __6) 2 funciones__

* __Operacion de multiplicacion basica__
~~~
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION operaciones_f;

delimiter //
CREATE FUNCTION operaciones_f(numero1 INT,numero2 INT) RETURNS INT
BEGIN
	SET @res_mul=0;
	SELECT numero1*numero2 INTO @res_mul;
    return @res_mul;
END//
delimiter ;

SELECT operaciones_f(3,3);
~~~
* __Calculando el precio de un producto dependiendo de la cantidad__
~~~
CREATE FUNCTION precio_por_cantidad (id INT,cantidad INT) RETURNS INT
BEGIN 
	DECLARE valor INT;
	SET valor  = (SELECT Precio_publico FROM productos WHERE ID_Prod = id);
	RETURN valor*cantidad;
END//
delimiter ;

SELECT precio_por_cantidad(3,2); -- 2 televisores
~~~

## __7) Un trigger__

* __Trigger para actualizacion de precios__

> Este ejemplo se demostrara sobre la DB ejemplo_trigger
~~~
INSERT INTO ejemplo_trigger.concepto (idVenta, descripcion, precio)
VALUE(1,"papitas",10);
UPDATE ejemplo_trigger.concepto SET descripcion = "Papitas" WHERE id = 1;
INSERT INTO ejemplo_trigger.concepto (idVenta, descripcion, precio)
VALUE(1,"Cerveza",40);
INSERT INTO ejemplo_trigger.concepto (idVenta, descripcion, precio)
VALUE(1,"Leche",50);

INSERT INTO ejemplo_trigger.venta (fecha, total)
VALUE("2022-06-22T00:00",(SELECT SUM(precio) FROM ejemplo_trigger.concepto));
~~~
~~~
DROP TRIGGER IF EXISTS RecalcularTrigger;
delimiter //
	CREATE TRIGGER RecalcularTrigger AFTER UPDATE ON ejemplo_trigger.Concepto
    for each ROW
    BEGIN
		UPDATE ejemplo_trigger.venta SET total = 
			(SELECT SUM(precio) FROM ejemplo_trigger.concepto)
            WHERE id = 1;
    END//
delimiter ;
~~~

# MUCHAS GRACIAS POR SU ATENCION 😉
