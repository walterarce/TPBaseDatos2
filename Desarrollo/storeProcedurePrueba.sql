create
    definer = root@localhost procedure prueba(IN idusuario int, OUT salida varchar(255))
begin
        select name from usuario.users;
  end;
