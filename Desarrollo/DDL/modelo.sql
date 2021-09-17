create table tp_base_datos_horarios.centro_costos
(
	id_CC int auto_increment
		primary key,
	CC_Descripcion varchar(255) null
);

create table tp_base_datos_horarios.centro_facturacion
(
	id_CF int auto_increment
		primary key,
	CF_Descripcion varchar(255) null
);

create table tp_base_datos_horarios.cliente
(
	id int auto_increment
		primary key,
	nombre varchar(255) null,
	apellido varchar(255) null,
	id_cc int null,
	id_cf int null,
	constraint cliente_centro_costos_id_CC_fk
		foreign key (id_cc) references tp_base_datos_horarios.centro_costos (id_CC),
	constraint cliente_centro_facturacion_id_CF_fk
		foreign key (id_cf) references tp_base_datos_horarios.centro_facturacion (id_CF)
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

create table tp_base_datos_horarios.liquidacion_mensual
(
	id int auto_increment
		primary key,
	cliente_id int null,
	proyecto_id int null,
	descripcion varchar(255) null
);

create index liquidacion_mensual_clientes_id_fk
	on tp_base_datos_horarios.liquidacion_mensual (cliente_id);

create table tp_base_datos_horarios.proyecto
(
	proyecto_id int auto_increment
		primary key,
	descripcion varchar(255) null,
	cliente_id int null,
	estado char default 'A' null,
	constraint proyecto_cliente_id_fk
		foreign key (cliente_id) references tp_base_datos_horarios.cliente (id)
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
	estado char default 'A' null,
	proyecto_id int null,
	constraint tareas_empleado_legajo_fk
		foreign key (legajo_id) references tp_base_datos_horarios.empleado (legajo),
	constraint tareas_proyecto_proyecto_id_fk
		foreign key (proyecto_id) references tp_base_datos_horarios.proyecto (proyecto_id)
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

