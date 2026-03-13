use kuliah2;

create database kuliah2;

create table jurusan(
id_jurusan int primary key identity(1,1),
nama_jurusan varchar(50)
);

insert into jurusan
values ('sistem informasi'), ('teknik informatika'), ('teknik elektro');

select * from jurusan

create table mahasiswa(
NIM int primary key,
NAMA varchar(100),
id_jurusan int,
constraint FK_Mhs_Jurusan foreign key (id_jurusan)
references jurusan(id_jurusan)
);

create table KTM(
NIM int primary key,
NO_KIM varchar(20) UNIQUE,
TGL_TERBIT DATE,
FOREIGN KEY (NIM) REFERENCES mahasiswa (NIM)
);

INSERT INTO mahasiswa
values ('111', 'a', '2'), ('222', 'b', '2'),('333', 'c', '1'), ('444', 'd', '1');

INSERT INTO KTM (NIM, NO_KIM, TGL_TERBIT)
values ('111', 'andi', '10-11-2026'), ('222', 'ando', '10-11-2026'), ('333', 'andu', '10-11-2026'), ('444', 'anda', '10-11-2026');

select * from mahasiswa
select * from KTM
