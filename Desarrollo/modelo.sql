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

create table proyecto
(
    proyecto_id int          not null
        primary key,
    descripcion varchar(255) null,
    legajo_id   int          null,
    constraint proyecto_empleado_legajo_fk
        foreign key (proyecto_id) references empleado (legajo)
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

create table tareas
(
    id           int auto_increment
        primary key,
    descripcion  varchar(255) null,
    id_rendicion int          null
);

create table rendicion
(
    id             int auto_increment
        primary key,
    horas          decimal null,
    tipo_rendicion char    null,
    tarea_id       int     null,
    constraint rendicion_tareas_id_fk
        foreign key (tarea_id) references tareas (id)
);

