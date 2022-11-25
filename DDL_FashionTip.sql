create database FashionTip
use FashionTip

create TABLE Personas(
    id int primary key,
    nombre varchar(32) not null ,
    apellido varchar(32) not null ,
    telefono varchar(12) not null ,
)

CREATE TABLE Usuarios(
    id int primary key,
    apodo varchar(32) not null,
    correo varchar(64) not null,
    contrasenia varchar(32) not null,
    Personas_id int NOT NULL FOREIGN KEY REFERENCES Personas(id),
)

CREATE TABLE Tallas(
    id int primary key,
    nombre varchar(5) NOT NULL
)

CREATE TABLE Marcas(
    id int primary key,
    nombre varchar(32) not null
)

CREATE TABLE TiposPrendas(
     id int primary key,
    nombre varchar(32) not null
)
CREATE TABLE Ropas(
    id int primary key,
    Tallas_id int not null foreign key references Tallas(id),
    Usuarios_id int not null foreign key references Usuarios(id),
    Marcas_id int not null foreign key references Marcas(id),
    TiposPrendas_id int not null foreign key references TiposPrendas(id),
)

CREATE TABLE Outfits(
    id int primary key,
    nombre varchar(32) not null
)

CREATE TABLE RopasOutfits(
    Outfits_id int not null ,
    Ropas_id int not null ,
    CONSTRAINT RopasOutfits_pk PRIMARY KEY (Outfits_id,Ropas_id),
    FOREIGN KEY (Outfits_id) REFERENCES Outfits(id),
    FOREIGN KEY (Ropas_id) REFERENCES Ropas(id)
)

CREATE TABLE Categorias(
    id int primary key,
    nombre varchar(32)
)

CREATE TABLE OutfitsCategorias(
    Categorias_id int not null ,
    Outfits_id int not null,

    CONSTRAINT OutfitsCategorias_pk PRIMARY KEY (Categorias_id,Outfits_id),
    FOREIGN KEY (Categorias_id)references Categorias(id),
    FOREIGN KEY (Outfits_id) references Outfits(id)
)
