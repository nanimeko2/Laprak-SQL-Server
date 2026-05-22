create database store_procedure;

create table customer (
nama varchar(15),
negara varchar(15)
);

insert into customer values ('budi', 'india');

create table pelanggan (
nama varchar(15),
email varchar(15)
);

drop table pelanggan

-- 1
insert into pelanggan values ('malik', 'email@gmail.com'), ('suki', 'suki@gmail.com');

create table pesanan (
nama varchar(15)
);

-- 2
insert into pesanan values ('baso'), ('mie ayam');


-- delete
create procedure del_pelanggan
@nama varchar(15)
as
begin
delete from pelanggan where nama = @nama
end

-- panggil procedure yang telah dibuat
exec del_pelanggan 'baso'

-- update
create procedure up_pelanggan
@nama varchar(15),
@email varchar(15)
as
begin
update pelanggan set email = @email where nama = @nama
end

-- panggil procedure yang telah dibuat
exec up_pelanggan 'suki', 'suki@gmail.com'

-- store procedure tanpa parameter
create procedure pelanggan_cek
as
begin
select * from pelanggan
end

-- panggil procedure yang telah dibuat
exec pelanggan_cek;


-- store procedure tanpa parameter
create procedure store_procedure
as
begin
select * from customer
end

-- panggil procedure yang telah dibuat
exec store_procedure;

-- store procedure dengan parameter
create procedure store_procedure_by_country
@negara varchar(15)
as
begin
select * from customer where negara = @negara
end

-- panggil procedure yang telah dibuat
exec store_procedure_by_country @negara = 'indonesia'

-- procedure untuk insert data
create procedure ins_custumer
@nama varchar(15),
@negara varchar(15)
as
begin
insert into customer (nama, negara) values (@nama, @negara);
end

-- panggil procedure yang telah dibuat
exec ins_custumer 'citra','indonesia'

-- procedure untuk delete data
create procedure del_custumer
@nama varchar(15)
as
begin
delete from customer where nama = @nama
end

-- panggil procedure yang telah dibuat
exec del_custumer 'citra'

-- procedure untuk update data
create procedure up_custumer
@nama varchar(15),
@negara varchar(15)
as
begin
update customer set negara = @negara where nama = @nama
end

-- panggil procedure yang telah dibuat
exec up_custumer 'citra', 'jepang'
