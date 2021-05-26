drop database if exists PCShopjp24;
create database PCShopjp24;
use PCShopjp24;

create table vlasnik(
  sifra int not null primary key auto_increment,
  ime varchar(50) not null,
  prezime varchar(50) not null,
  iban varchar(50),
  email varchar(50) not null,
  PCshop int 
);

create table PCshop(
  sifra int not null primary key auto_increment,
  naziv varchar(30) not null,
  oib varchar(40) not null,
  djelatnik int not null
);

create table djelatnik(
  sifra int not null primary key auto_increment,
  ime varchar(50) not null,
  prezime varchar(50) not null,
  proizvod int 
);

create table proizvod(
  sifra int not null primary key auto_increment,
  naziv varchar(30) not null,
  cijena decimal(14,6) not null,
  garancija datetime not null
);

create table korisnik(
  sifra int not null primary key auto_increment,
  ime varchar(50) not null,
  prezime varchar(50) not null
);

create table usluga(
  sifra int not null primary key auto_increment,
  djelatnik int not null,
  korisnik int not null
);

alter table vlasnik add foreign key(PCshop) references PCshop(sifra);
alter table PCshop add foreign key(djelatnik) references djelatnik(sifra);
alter table djelatnik add foreign key(proizvod) references proizvod(sifra);

alter table usluga add foreign key(djelatnik) references djelatnik(sifra);
alter table usluga add foreign key(korisnik) references korisnik(sifra);

select * from proizvod;
insert into proizvod(naziv,cijena,garancija)
values  ('Nvidia graficka',1999.99,'2025-03-23'),
        ('AMD graficka',1599.99,'2026-04-13'),
        ('Razer mis',599.99,'2027-11-03'),
        ('Logitech mis',499.99,'2023-01-30'),
        ('Corsair tipkovnika',1199.99,'2024-12-03');
        
select * from djelatnik;
insert into djelatnik(ime,prezime,proizvod)
values  ('Marko','Markovic',1),
        ('Ivo','Ivic',2),
        ('Pero','Peric',3),
        ('Mia','Mijic',4),
        ('Karlo','Karlovic',5);
        
select * from PCshop;
insert into PCshop(naziv,oib,djelatnik)
values  ('Links',12345678910,1),
        ('Instar',12345678911,2),
        ('Mikronis',12345678912,3),
        ('HGshop',12345678913,4),
        ('FuturaIT',12345678914,5);
        
select * from vlasnik;
insert into vlasnik(ime,prezime,email,PCshop)
values  ('Tin','Tinic','tin@gmail.com',1),
        ('Maja','Majic','maja@gmail.com',2),
        ('Iva','Ivic','iva@gmail.com',3),
        ('Tena','Tenic','tena@gmail.com',4),
        ('Matea','mateic','mate@gmail.com',5);
        
select * from korisnik;
insert into korisnik(ime,prezime)
values  ('Marko','Markovic'),
        ('Frano','Franjic'),
        ('Marina','Marinic'),
        ('Ivan','Ivanovic'),
        ('Darko','Darkovic');
        
select * from usluga;
insert into usluga(djelatnik,korisnik)
values  (1,5),(2,4),(3,3),(4,2),(5,1);