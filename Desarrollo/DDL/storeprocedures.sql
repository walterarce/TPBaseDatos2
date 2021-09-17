create or replace definer = root@localhost procedure alta_empleado(IN in_nombre varchar(200), IN in_apellido varchar(200), IN in_legajo int, IN in_dni int)
begin
    INSERT INTO empleado(nombre,apellido, legajo,dni) values (in_nombre,in_apellido,in_legajo,in_dni);
end;

create or replace definer = root@localhost procedure alta_empleado_rol(IN in_legajo int, IN in_idrol int)
begin
    INSERT INTO roles_empleados(id_rol,legajo_empleado) values (in_idrol,in_legajo);
end;

create or replace definer = root@localhost procedure alta_rol(IN in_descripcion_rol varchar(255))
begin
    INSERT INTO roles(descripcion_rol) values (in_descripcion_rol);
end;