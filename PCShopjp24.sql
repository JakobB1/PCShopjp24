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
  cijena decimal(12,10) not null,
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
