Create database ONESCS
use ONESCS

create table usuario
(
id_usuario int not null primary key identity,clave varchar(50)not null, nombre varchar (50) not null,
apellido varchar(50) null, privilegiouser varchar (100)
)

INSERT INTO usuario (nombre, clave, apellido, privilegiouser) VALUES ('Shamir','12345','Cueto','Administrador')
Select * from usuario


create table privilegios
(
Privilegio varchar(50) null,Inventarios varchar(50) null, Ventass varchar(50) null, Compras varchar(50) null, Reportes varchar(50) null, Transaccion varchar(50)null, 
Finanzas varchar(50) null, Registro_Mencacias varchar(50) null, Registro_Empleados varchar(50) null, Salida_mercancìa varchar(50) null, Proveedores varchar(50) null
)

insert into privilegios (Privilegio) values ('Administrador')
insert into privilegios (Privilegio) values ('Secretaria')

select * from  privilegios

create table categoria
(
categoriaID int identity (1,1)not null, nomb_categoria varchar(20)not null,
Description ntext null, foto image null
)

select * from categoria

create table empleador
(
emp_usuario varchar not null primary key,
nombre varchar(200) not null,
clave int not null,
apellido varchar null,
Privilegio varchar(100) not null,
edad int not null,
Direccion int null,
Telefono int null,
)
select * from empleador

create table producto
(
codigo_producto int not null primary key,
Nomb_producto varchar(100) not null,
Precio smallmoney not null,
foto image null,
Unidad_medida varchar(20) not null,
cantidad int not null,
total int not null,
categoriaID int null,
)
/*multiplica la cantidad por el precio y reflejalo en el total de la tabla producto*/
SELECT sum(cantidad*Precio) as total FROM producto

select * from producto


create table cliente
(
clienteID int identity (1,1), Nombre_cliente Varchar(30) not null, apellido varchar(20) null,edad varchar(5)null, 
Teléfono varchar(50) null, dirección_del_cliente varchar(60) null, sexo_cliente varchar(1) not null,
constraint pk_cliente primary key (clienteID),constraint ch_cliente check (sexo_cliente in('M','F'))
)

create table pedido
(
pedidoID varchar(20) not null,
nomb_contacto varchar(50) not null,
ciudad varchar (50) null,
direccion varchar (50) null,
telefono varchar(24) null,
cod_postal varchar(10) null,
fecha_pedido datetime,
cantidad int,
descuento varchar(20) null,
precio smallmoney not null,
total int not null,
id_cliente int foreign key references cliente (clienteID),
id_usuario int foreign key references usuario (id_usuario),
constraint pk_pedido primary key clustered (pedidoID)
)
create table inventario
(
Num_articulo int not null,Descripción_del_artículo int not null, Unidad_medida int not null, stock int not null,
precio int not null ,Total int not null, constraint pk_inventario primary key (Num_articulo)
)
create table Ventas
( 
Factura_Numero int not null,Num_cliente int not null, Num_artículo int not null, Cantidad int not null,Unidad_medida int not null,
precio smallmoney not null,descuento int null, Indicador_impuestos int null, total int not null
)

IF OBJECT_ID('Ventas','U') IS NOT NULL DROP TABLE Ventas
create table Ventas
(
Factura_Numero INT NOT NULL PRIMARY KEY,codigo_producto INT NOT NULL,Precio numeric(19,6) NOT NULL CHECK (Precio>0), Unidad_medida INT NOT NULL
)
IF OBJECT_ID('Ventas','U') IS NOT NULL DROP TABLE inventario
create table inventario
(
Num_articulo INT NOT NULL,Descripción_del_artículo INT NOT NULL,Unidad_medida INT NOT NULL, stock int not null,
CONSTRAINT PK_inventario PRIMARY KEY (Num_articulo)
)