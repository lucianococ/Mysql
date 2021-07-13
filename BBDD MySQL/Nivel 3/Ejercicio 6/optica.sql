create database optica2;
use optica2;
create table provedor(
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
	direccion varchar(200) not null,
    tel INT not null,
    fax INT,
	NIF varchar(50) not null
);
create table marcas(
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
    idProvedor INT,
    foreign key (idProvedor) references provedor(id) on delete cascade on update cascade
    
);

create table ulleres(
	id int not null auto_increment primary key,
    marca INT not null,
    lenteI decimal(10,2) not null,
    lenteD decimal (10,2) not null,
    montura varchar (50) not null,
    colorVidre varchar (50) not null,
    preu INT NOT NULL,
    foreign key (marca)references marcas(id) on delete cascade on update cascade
);

create table clients (
	id int not null auto_increment primary key,
    nombre varchar(50) not null,
    direccion varchar(200) not null,
	tel int not null,
    email  varchar(200) not null,
    fecha date,
    recomendacion INT,
    foreign key (recomendacion) references clients(id)on delete cascade on update cascade
);
create table vendedores(
	id int not null auto_increment primary key,
    nombre varchar(50) not null
);
create table ventas(
	id int not null auto_increment primary key,
    idVendedor int not null,
    idUlleres int,
    idClient int,
	foreign key (idUlleres) references ulleres (id) on delete cascade on update cascade ,
    foreign key (idClient) references clients (id) on delete cascade on update cascade
);
alter table ventas add constraint fk_vendedor foreign key (idVendedor) references vendedores (id) on delete cascade on update cascade;

insert into provedor (nombre, direccion, tel, fax, NIF)
values ( "Ojitos", "Numamcia 7 A Barcelona cp00180 España",9311111, 9311111, "B12345"), 
("Lentes", "Montalban 230 bajos Barcelona cp00184 España",9311112, 934444,"Y67890"), 
("Sunglasses", "Plaça Espanya 45 Tarragona cp00340 España",9311113, 9311123, "G45678"), 
("Pupilas", "Eduardo Marquina 7 3B Madrid cp24012 España",9122222, 9222221, "A10009");
select * from provedor;

insert into marcas ( nombre ,idProvedor)
values ("Armani", 2), ("Polaroind", 3), ("Raybam", 3),("Ferrari", 1), ("Sunset", 4);
select * from ulleres;

insert into ulleres (marca, lenteI, lenteD, montura, colorVidre, preu)
values (3, 10.5, 7.8, "pasta", "negro", 20),(4, 0, 0, "metalica","verde", 50),
(1, 0.5, 9.8, "pasta", "trasparente", 60);

insert into clients (nombre, direccion, tel, email, fecha)
values ("Jorge Lopez","Girona 37 A Barcelona", 9344456,"jp@gmail.com", "2021-11-13" ) , 
("Enzo Perez","Princesa 10 bajos Barcelona", 9365769, "ep@gmail.com", "2020-05-23"); 
insert into clients (nombre, direccion, tel, email, fecha, recomendacion)
values ("Alberto Fernandez","Balcarce 3 4-1 Barcelona", 9311111,"af@gmail.com", "2021-11-13",2 );

insert into vendedores (nombre) values ("Pablo Milanes"), ("Silvio Rodriguez");
insert into ventas (idvendedor, idUlleres, idClient)
values (1, 2,1), (1,3,3), (2,1, 2);
select * from ventas;