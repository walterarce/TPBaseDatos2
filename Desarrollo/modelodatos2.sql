create table clientes
(
    id       int auto_increment
        primary key,
    nombre   varchar(255) null,
    apellido varchar(255) null
);
create table empleado
(
    id       int          null,
    nombre   varchar(200) null,
    apellido varchar(200) null,
    legajo   int          not null
        primary key,
    dni      int          null
);

create table liquidacion_mensual
(
    id          int auto_increment
        primary key,
    cliente_id  int          null,
    proyecto_id int          null,
    descripcion varchar(255) null,
    constraint liquidacion_mensual_clientes_id_fk
        foreign key (cliente_id) references clientes (id),
    constraint liquidacion_mensual_proyecto_proyecto_id_fk
        foreign key (id) references proyecto (proyecto_id)
);

