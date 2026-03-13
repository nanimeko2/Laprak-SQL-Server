create database domisili;
use domisili

create table tb_provinsi (
id_provinsi int primary key,
nama_provinsi varchar(50)
);

create table tb_kota (
id_kota int primary key,
nama_kota varchar(50),
id_provinsi int);

insert into tb_provinsi values
(1,'jawa barat'), (2,'jawa tengah'), (3,'bali');

insert into tb_kota values
(105,'solo',5),
(100,'bandung',1),
(101,'bogor',1),
(102,'semarang',2),
(103,'surabaya',4),
(104,'bali',3);


select K.nama_kota, P.nama_provinsi
from tb_kota K
inner join tb_provinsi P on k.id_provinsi = P.id_provinsi;

select * from tb_provinsi
select * from tb_kota
select * from tb_provinsi P left join tb_kota K ON P.id_provinsi = K.id_provinsi
select * from tb_provinsi P right join tb_kota K ON P.id_provinsi = K.id_provinsi




-- delete from tb_kota where id_kota
