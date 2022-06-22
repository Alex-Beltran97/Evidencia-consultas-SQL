SELECT * FROM Tipo_doc;

SELECT * FROM usuarios;

SELECT * FROM roles;

-- SELECT Concat(u.Nombre_user," ",u.Apellido) AS "Usuario" FROM usuarios u INNER JOIN roles_usuarios ru ON ru.Usuario =u.Id_user

-- SELECT r.Nombre_rol FROM roles r INNER JOIN roles_usuarios ru ON ru.Rol = r.Id_rol;

SELECT * FROM roles_usuarios;

SELECT * FROM proveedores;

SELECT p.Nombre_prov AS "Proveedor", c.* FROM proveedores p INNER JOIN contactos c ON p.id_contacto = ID_Cont;

SELECT Concat(u.Nombre_user," ",u.Apellido) AS "Usuario",u.Fecha_nacimiento,u.Direccion,u.Ciudad , c.* FROM usuarios u INNER JOIN contactos c ON u.id_datos_contacto = ID_Cont;

SELECT * FROM contactos;

SELECT * FROM categorias;

SELECT * FROM fabricante;

SELECT p.ID_Prod, p.descripcion_prod, t.Nombre_tipo_prod FROM productos p INNER JOIN tipo_producto t ON id_tipo_prod = id_tipo_producto;

SELECT m.*, f.nombre_fabricante FROM modelo m INNER JOIN fabricante f ON m.id_fabricante = f.id_fabricante;

SELECT * FROM modelo;

SELECT * FROM tipo_producto;

SELECT * FROM proveedores_productos;

SELECT * FROM productos;

-- DB trigger

SELECT * FROM ejemplo_trigger.venta;
SELECT * FROM ejemplo_trigger.concepto;

SELECT SUM(precio) FROM ejemplo_trigger.concepto;



