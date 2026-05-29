create trigger trg_mhs_i
on Mahasiswa
after insert
as
begin
--- mendeklarasikan variable untuk menampung NAMA dari data baru
declare @namamhs varchar(100);

--- mengambil data nama dari table visual inserted
select @namamhs = nama from inserted;

--- memasukan informasi ke table logaktivitas
insert into LogAktivitas (keterangan)
values ('Mhs baru bernama ' + @namamhs + ' berhasil ditambahkan oleh ' + suser_sname());
end;

create trigger trg_mhs_u
on Mahasiswa
after update
as
begin
declare @namalma varchar(100);
declare @namabru varchar(100);

--- mengambil data lama dari table DELETED
select @namalma = nama from deleted;

--- mengambil data baru dari table INSERTED
select @namabru = nama from inserted;

--- memasukan informasi ke table logaktivitas
insert into LogAktivitas (keterangan)
values ('Perubahan data ' + @namalma + ' berhasil diupdate menjadi ' + @namabru + ' oleh user ' + suser_sname());
end;


create trigger trg_mhs_d
on Mahasiswa
after delete
as
begin
declare @namadel varchar(100);

--- mengambil data lama dari table DELETED
select @namadel = nama from deleted;

--- memasukan informasi ke table logaktivitas
insert into LogAktivitas (keterangan)
values ('Perubahan data ' + @namadel + ' berhasil dihapus oleh user ' + suser_sname());
end;


create trigger trg_mhs_ar
on Mahasiswa
after delete
as
begin
-- Langsung pindahkan seluruh kolom dari table virtual DELETED ke table ArsipMahasiswa
insert into ArsipMahasiswa (nim, nama, prodi)
select nim, nama, prodi from deleted;
end;