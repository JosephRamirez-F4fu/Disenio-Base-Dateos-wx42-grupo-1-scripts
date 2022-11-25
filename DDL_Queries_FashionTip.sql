create database FashionTip
use FashionTip

-- DDL

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

-- Ingresando valores en las tablas
insert into Personas
values (1,'persona1', 'apellido1', '912345680')
insert into Personas
values (2,'persona2', 'apellido2', '912345681')
insert into Personas
values (3,'persona3', 'apellido3', '912345682')
insert into Personas
values (4,'persona4', 'apellido4', '912345683')
insert into Personas
values (5,'persona5', 'apellido5', '912345684')
insert into Personas
values (6,'persona6', 'apellido6', '912345685')
insert into Personas
values (7,'persona7', 'apellido7', '912345686')
insert into Personas
values (8,'persona8', 'apellido8', '912345688')
insert into Personas
values (9,'persona9', 'apellido9', '912345689')
insert into Usuarios
values (1,'Usuario1', 'correo1@gmail.com', 'contrasenia1',1)
insert into Usuarios
values (2,'Usuario2', 'correo2@gmail.com', 'contrasenia2',2)
insert into Usuarios
values (3,'Usuario3', 'correo3@gmail.com', 'contrasenia3',3)
insert into Usuarios
values (4,'Usuario4', 'correo4@gmail.com', 'contrasenia4',4)
insert into Usuarios
values (5,'Usuario5', 'correo5@gmail.com', 'contrasenia5',5)
insert into Usuarios
values (6,'Usuario6', 'correo6@gmail.com', 'contrasenia6',6)
insert into Usuarios
values (7,'Usuario7', 'correo7@gmail.com', 'contrasenia7',7)
insert into Usuarios
values (8,'Usuario8', 'correo8@gmail.com', 'contrasenia8',8)
insert into Usuarios
values (9,'Usuario9', 'correo9@gmail.com', 'contrasenia9',9)
insert into Tallas values (1,'XL')
insert into Tallas values (2,'L')
insert into Tallas values (3,'44')
insert into Tallas values (4,'40')
insert into Tallas values (5,'L')
insert into Tallas values (6,'L')
insert into Tallas values (7,'S')
insert into Tallas values (8,'M')
insert into Tallas values (9,'M')
insert into Marcas values (1,'adidas')
insert into Marcas values (2,'Gucci')
insert into Marcas values (3,'Tom_Tailor')
insert into Marcas values (4,'Nike')
insert into Marcas values (5,'Puma')
insert into Marcas values (6,'CAT')
insert into Marcas values (7,'Nike')
insert into Marcas values (8,'Puma')
insert into Marcas values (9,'CAT')
insert into TiposPrendas values (1,'polo')
insert into TiposPrendas values (2,'pantalon')
insert into TiposPrendas values (3,'camisa')
insert into TiposPrendas values (4,'zapatillas')
insert into TiposPrendas values (5,'polera')
insert into TiposPrendas values (6,'casaca')
insert into TiposPrendas values (7,'polo')
insert into TiposPrendas values (8,'gorra')
insert into TiposPrendas values (9,'short')
insert into Ropas values (1, 1, 1, 1, 1)
insert into Ropas values (7, 2, 1, 2, 2)
insert into Ropas values (8, 3, 1, 3, 3)
insert into Ropas values (2, 2, 2, 2, 2)
insert into Ropas values (9, 1, 2, 1, 1)
insert into Ropas values (3, 3, 3, 3, 3)
insert into Ropas values (4, 4, 4, 4, 4)
insert into Ropas values (5, 5, 5, 5, 5)
insert into Ropas values (6, 6, 6, 6, 6)
insert into Ropas values (7, 7, 7, 7, 7)
insert into Ropas values (8, 8, 8, 8, 8)
insert into Ropas values (9, 9, 9, 9, 9)
insert into Outfits values(1,'Outfit_Navidenio')
insert into Outfits values(2,'Fin_de_Anio')
insert into Outfits values(7,'Veranero')
insert into Outfits values(8,'Casual')
insert into Outfits values(9,'Formal')
insert into RopasOutfits values(1,1)
insert into RopasOutfits values(1,2)
insert into RopasOutfits values(1,3)
insert into RopasOutfits values(1,4)
insert into RopasOutfits values(2,5)
insert into RopasOutfits values(2,6)
insert into RopasOutfits values(7,7)
insert into RopasOutfits values(7,8)
insert into RopasOutfits values(7,9)
insert into Categorias values(7,'Informal')
insert into Categorias values(8,'Informal')
insert into Categorias values(9,'Informal')
insert into OutfitsCategorias values(7,7)
insert into OutfitsCategorias values(8,8)
insert into OutfitsCategorias values(9,9)


-- Queries

SELECT P.id,nombre, count(R2.id) quantity from Personas P
   join Usuarios U on P.id = U.Personas_id
   join Ropas R2 on U.id = R2.Usuarios_id
GROUP BY P.id,nombre,apellido

select U.id, M.nombre , count(R2.id) cantidad from Usuarios U
    join Ropas R2 on U.id = R2.Usuarios_id
    join Marcas M on M.id = R2.Marcas_id
GROUP BY U.id, M.nombre


create function f_ropa_per_cliente()
   returns table
   return
   select  U.id,U.apodo ,M.nombre , count(R2.id) cantidad
   from Usuarios U
           join Ropas R2 on U.id = R2.Usuarios_id
           join Marcas M on M.id = R2.Marcas_id
       GROUP BY U.id,U.apodo ,M.nombre


create function f_max_clothes_per_clients() returns table
   return
   select id,max(cantidad) max_clothes
   from dbo.f_ropa_per_cliente()
   group by id

select apodo,nombre
from dbo.f_ropa_per_cliente() f_PC
   join dbo.f_max_clothes_per_clients() f_PC_max on f_PC.id=f_PC_max.id
where f_PC.cantidad=f_PC_max.max_clothes


Select correo, apodo, nombre, count(Marcas_id) cantidad_marcas
    from Marcas m
        join Ropas r on m.id = r.Marcas_id
        join Usuarios u on r.Usuarios_id = u.id
        group by correo, apodo, nombre

Select correo, apodo, nombre, count(Marcas_id) cantidad_marcas
    from Marcas m
    join Ropas r on m.id = r.Marcas_id
    join Usuarios u on r.Usuarios_id = u.id
    group by correo, apodo, nombre

select nombre, Nº_de_usuarios_que_lo_utilizan
    from  (select nombre, count(o.id) Nº_de_usuarios_que_lo_utilizan
           from Outfits o
              join RopasOutfits r on o.id = r.Outfits_id
              group by nombre) outfit_mas_utlizado  
    where Nº_de_usuarios_que_lo_utilizan =
        (select max (Nº_de_usuarios_que_lo_utilizan) Maximo
        from
            (select nombre, count(o.id) Nº_de_usuarios_que_lo_utilizan
                from Outfits o
                    join RopasOutfits r on o.id = r.Outfits_id
                    group by nombre) outfit_mas_utlizado)

SELECT M.nombre,count(Outfits.id) Cantidad 
    FROM Outfits
        JOIN RopasOutfits RO on Outfits.id = RO.Outfits_id
        JOIN Ropas R2 on RO.Ropas_id = R2.id
        join Marcas M on M.id = R2.Marcas_id
        group by M.nombre 
        ORDER BY Cantidad ASC

SELECT C.nombre,TP.nombre,count(Ropas_id) CANTIDAD FROM Categorias C
   JOIN OutfitsCategorias OC on C.id = OC.Categorias_id
   JOIN Outfits O on O.id = OC.Outfits_id
   JOIN RopasOutfits RO on O.id = RO.Outfits_id
   JOIN Ropas R2 on R2.id = RO.Ropas_id
   JOIN TiposPrendas TP on R2.TiposPrendas_id = TP.id
GROUP BY C.nombre, TP.nombre ORDER BY CANTIDAD ASC

SELECT C.nombre,TP.nombre,count(Ropas_id) CANTIDAD FROM Categorias C
   JOIN OutfitsCategorias OC on C.id = OC.Categorias_id
   JOIN Outfits O on O.id = OC.Outfits_id
   JOIN RopasOutfits RO on O.id = RO.Outfits_id
   JOIN Ropas R2 on R2.id = RO.Ropas_id
   JOIN TiposPrendas TP on R2.TiposPrendas_id = TP.id
GROUP BY C.nombre, TP.nombre ORDER BY CANTIDAD ASC

SELECT U.apodo,COUNT(R2.id) FROM Usuarios U
JOIN Ropas R2 on U.id = R2.Usuarios_id
JOIN TiposPrendas TP on TP.id = R2.TiposPrendas_id
WHERE TP.nombre='Zapatos'
group by U.apodo


create function f_user_quantity()
returns int
begin
   declare @quantity int
   select @quantity = count (id) from Usuarios
   return @quantity
end;

print dbo.f_user_quantity();


select nombre,count(O.id) Cantidad
from Outfits O
join RopasOutfits RO on O.id = RO.Outfits_id
join Ropas R2 on RO.Ropas_id = R2.id
join Usuarios U on R2.Usuarios_id = U.id
group by nombre

select nombre, Cantidad
from(select nombre,count(T.nombre) Cantidad
from Tallas T
join Ropas R2 on T.id = R2.Tallas_id
join Usuarios U on R2.Usuarios_id = U.id
group by nombre) mayor_tallas
where Cantidad = (select max(Cantidad) Total
from (select nombre,count(T.nombre) Cantidad
from Tallas T
join Ropas R2 on T.id = R2.Tallas_id
join Usuarios U on R2.Usuarios_id = U.id
group by nombre) mayor_tallas)
