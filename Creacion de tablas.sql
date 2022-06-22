CREATE DATABASE tienda_virtual;

USE tienda_virtual;

CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Usuarios` (
  `Id_user` INT NOT NULL AUTO_INCREMENT,
  `Tipo_doc` INT NOT NULL,
  `No_documento` INT NOT NULL,
  `Nombre_user` VARCHAR(50) NOT NULL,
  `Apellido` VARCHAR(50) NOT NULL,
  `Fecha_nacimiento` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Direccion` VARCHAR(50) NOT NULL,
  `Ciudad` VARCHAR(50) NOT NULL,
  `password` VARCHAR(18) NOT NULL,
  `Foto` VARCHAR(225) NULL,
  `Datos_contacto` INT NOT NULL,
  PRIMARY KEY (`Id_user`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Roles_usuarios` (
  `Id_roles_user` INT NOT NULL AUTO_INCREMENT,
  `Usuario` INT NOT NULL,
  `Rol` INT NOT NULL,
  PRIMARY KEY (`Id_roles_user`));
  
  CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Roles` (
  `Id_rol` INT NOT NULL AUTO_INCREMENT,
  `Nombre_rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id_rol`));
  
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Facturas` (
  `ID_Factura` INT NOT NULL AUTO_INCREMENT,
  `Fecha_creacion` TIMESTAMP NOT NULL,
  `Valor_IVA` DECIMAL NOT NULL,
  `Valor_total_compra` DECIMAL NOT NULL,
  `Valor_envio` DECIMAL NOT NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`ID_Factura`));
  
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Tipo_doc` (
  `Id_tipo_doc` INT NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_doc` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`Id_tipo_doc`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Proveedores` (
  `ID_Proveedor` INT NOT NULL AUTO_INCREMENT,
  `Tipo_doc` INT NOT NULL,
  `No_identificacion_prov` INT NOT NULL,
  `Nombre_prov` VARCHAR(50) NOT NULL,
  `Direccion` VARCHAR(50) NOT NULL,
  `Ciudad` VARCHAR(50) NOT NULL,
  `Datos_contacto` INT NOT NULL,
  PRIMARY KEY (`ID_Proveedor`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Contactos` (
  `ID_Cont` INT NOT NULL AUTO_INCREMENT,
  `Celular` VARCHAR(20) NOT NULL,
  `Telefono` VARCHAR(20) NULL,
  `Email` VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (`ID_Cont`));
  
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Ventas` (
  `ID_Venta` INT NOT NULL AUTO_INCREMENT,
  `Fecha_venta` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`ID_Venta`));
  
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Ventas_productos` (
  `Id_ventas_prod` INT NOT NULL AUTO_INCREMENT,
  `Producto_vendido` INT NOT NULL,
  `Registro_venta` INT NOT NULL,
  `Precio_total` DOUBLE NULL,
  `Cantidad` INT NULL,
  PRIMARY KEY (`Id_ventas_prod`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Productos` (
  `ID_Prod` INT NOT NULL AUTO_INCREMENT,
  `Nombre_prod` VARCHAR(50) NOT NULL,
  `Stock` INT NOT NULL,
  `Precio_publico` DECIMAL NOT NULL,
  `Precio_compra` DECIMAL NOT NULL,
  `Categoria_prod` INT NOT NULL,
  `Marca` INT NOT NULL,
  PRIMARY KEY (`ID_Prod`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Categorias` (
  `ID_Cat` INT NOT NULL AUTO_INCREMENT,
  `Nombre_cat` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Cat`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Proveedores_productos` (
  `Id_prov_prod` INT NOT NULL AUTO_INCREMENT,
  `Proveedores` INT NOT NULL,
  `Producto` INT NOT NULL,
  PRIMARY KEY (`Id_prov_prod`));

CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Compra` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_total` DOUBLE NULL,
  PRIMARY KEY (`id_compra`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Fabricante` (
  `id_fabricante` INT NOT NULL AUTO_INCREMENT,
  `nombre_fabricante` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_fabricante`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Modelo` (
  `Id_marca` INT NOT NULL AUTO_INCREMENT,
  `Nombre_modelo` VARCHAR(50) NOT NULL,
  `id_fabricante` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`Id_marca`));
  
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`Tipo_producto` (
  `id_tipo_producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_tipo_prod` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_producto`));
  
CREATE TABLE IF NOT EXISTS `tienda_virtual`.`fabricante_producto` (
  `id_fabricante_producto` INT NOT NULL AUTO_INCREMENT,
  `id_fabricante` INT NOT NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_fabricante_producto`));
  
  SELECT * FROM usuarios;
  
-- Creacion de tabla aparte para alusion a un ejemplo con trigger 
  
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