create table tp_base_datos_horarios.cliente
(
	id int auto_increment
		primary key,
	nombre varchar(255) null,
	apellido varchar(255) null
);

create table tp_base_datos_horarios.empleado
(
	id int,
	nombre varchar(200) null,
	apellido varchar(200) null,
	legajo int not null
		primary key,
	dni int null
);

create index empleado_id_legajo_index
	on tp_base_datos_horarios.empleado (id, legajo);

alter table tp_base_datos_horarios.empleado modify id int auto_increment;

create table tp_base_datos_horarios.proyecto
(
	proyecto_id int not null
		primary key,
	descripcion varchar(255) null,
	cliente_id int null,
	constraint proyecto_cliente_id_fk
		foreign key (cliente_id) references tp_base_datos_horarios.cliente (id)
);

create table tp_base_datos_horarios.liquidacion_mensual
(
	id int auto_increment
		primary key,
	cliente_id int null,
	proyecto_id int null,
	descripcion varchar(255) null,
	constraint liquidacion_mensual_clientes_id_fk
		foreign key (cliente_id) references tp_base_datos_horarios.cliente (id),
	constraint liquidacion_mensual_proyecto_proyecto_id_fk
		foreign key (id) references tp_base_datos_horarios.proyecto (proyecto_id)
);

create table tp_base_datos_horarios.roles
(
	id int auto_increment
		primary key,
	descripcion_rol varchar(255) null
);

create table tp_base_datos_horarios.roles_empleados
(
	id_rol int null,
	legajo_empleado int null,
	constraint roles_empleados_empleado_legajo_fk
		foreign key (legajo_empleado) references tp_base_datos_horarios.empleado (legajo),
	constraint roles_empleados_roles_id_fk
		foreign key (id_rol) references tp_base_datos_horarios.roles (id)
);

create table tp_base_datos_horarios.tareas
(
	id int auto_increment
		primary key,
	descripcion varchar(255) null,
	id_rendicion int null,
	legajo_id int null,
	constraint tareas_empleado_legajo_fk
		foreign key (legajo_id) references tp_base_datos_horarios.empleado (legajo)
);

create table tp_base_datos_horarios.proyecto_tareas
(
	id_proyecto int null,
	id_tarea int null,
	constraint proyecto_tareas_proyecto_proyecto_id_fk
		foreign key (id_proyecto) references tp_base_datos_horarios.proyecto (proyecto_id),
	constraint proyecto_tareas_tareas_id_fk
		foreign key (id_tarea) references tp_base_datos_horarios.tareas (id)
);

create table tp_base_datos_horarios.rendicion
(
	id int auto_increment
		primary key,
	horas decimal null,
	tipo_rendicion char null,
	tarea_id int null,
	constraint rendicion_tareas_id_fk
		foreign key (tarea_id) references tp_base_datos_horarios.tareas (id)
);

