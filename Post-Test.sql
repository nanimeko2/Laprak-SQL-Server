create table TBLMahasiswa (
	NPM varchar(10) primary key,
	namaMhs varchar(30),
	alamatMhs varchar(40),
	telepon varchar(12)
	);

INSERT INTO TBLMahasiswa(NPM, namaMhs, alamatMhs, telepon)
VALUES
('2511123456', 'Budi', 'Bogor', '12345678'),
('3214326578', 'Rangga', 'Jakarta', '0022113345'),
('4567389210', 'Bagas', 'Bandung', '12346438'),
('6543217680', 'Kristen', 'Semarang', '151245678'),
('5678943210', 'Trump', 'Bali', '12334455'),
('20230006', 'MK006', 'Bogor', '12345678'),
('20230007', 'MK007', 'Bogor', '12345678'),
('20230008', 'MK008', 'Bogor', '12345678'),
('20230009', 'MK009', 'Bogor', '12345678'),
('20230010', 'MK010', 'Bogor', '12345678');

create table TBLMatakuliah (
	KodeMk varchar(6) primary key,
	NmMk varchar(15),
	SKS int
	);

INSERT INTO TBLMatakuliah (KodeMk, NmMk, SKS)
VALUES
('INDO', 'B Indonesia', '2'),
('WEB', 'Jaringan', '1'),
('PPKN', 'PPKN', '2'),
('CPLUS', 'Bahasa C', '1'),
('PY', 'Python', '2'),
('MK006', 'Bogor', '12345678'),
('MK007', 'Bogor', '12345678'),
('MK008', 'Bogor', '12345678'),
('MK009', 'Bogor', '12345678'),
('MK010', 'Bogor', '12345678');


create table TBLTransNilai (
	NPM varchar(10),
	KodeMk varchar(6),
	nilaiKh int,
	nilaiQz float,
	nilaiTg float,
	nilaiUTS float,
	nilaiUAS float,
	primary key (NPM, KodeMk),
	foreign key (NPM) references TBLMahasiswa(NPM),
	foreign key (KodeMk) references TBLMatakuliah(KodeMk)
	);

drop table TBLTransNilai

INSERT INTO TBLTransNilai (NPM, KodeMk, nilaiKh, nilaiQz, nilaiTg, nilaiUTS, nilaiUAS)
VALUES 
('2511123456', 'INDO', 85, 80.5, 90.0, 75.5, 88.0),
('3214326578', 'WEB', 90, 88.0, 85.5, 82.0, 80.0),
('4567389210', 'PPKN', 75, 70.0, 80.5, 65.0, 72.5),
('6543217680', 'CPLUS', 95, 92.5, 95.0, 90.0, 94.0),
('5678943210', 'PY', 80, 75.0, 78.5, 80.0, 85.0),
('20230006', 'MK006', 20, 20.5, 90.0, 45.5, 48.0),
('20230007', 'MK007', 40, 38.0, 55.5, 32.0, 80.0),
('20230008', 'MK008', 75, 60.0, 60.5, 45.0, 42.5),
('20230009', 'MK009', 95, 62.5, 95.0, 90.0, 34.0),
('20230010', 'MK010', 90, 75.0, 18.5, 50.0, 85.0);


--SOAL 2
select
	NPM,
	KodeMk,
	(0.30 * nilaiKh) +
	(0.05 * nilaiQz) +
	(0.15 * nilaiTg) +
	(0.20 * nilaiUTS) +
	(0.30 * nilaiUAS) as Nilai_Akhir
	from TBLTransNilai;


--SOAL 3
select
	NPM,
	KodeMk,
	(0.30 * nilaiKh) +
	(0.05 * nilaiQz) +
	(0.15 * nilaiTg) +
	(0.20 * nilaiUTS) +
	(0.30 * nilaiUAS) as Nilai_Akhir,
	case
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 80 then 'A'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 70 then 'B'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 60 then 'C'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 50 then 'D'
	else 'E'
	end as Huruf_Mutu
	from TBLTransNilai;


--SOAL 5
select * from (
select
	NPM,
	KodeMk,
	case
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 80 then 'A'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 70 then 'B'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 60 then 'C'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 50 then 'D'
	else 'E'
	end as Huruf_Mutu
	from TBLTransNilai
	) as hasil where Huruf_Mutu = 'E';

--SOAL 6
select * from (
select
	NPM,
	KodeMk,
	case
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 80 then 'A'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 70 then 'B'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 60 then 'C'
	when (0.30 * nilaiKh + 0.05 * nilaiQz + 0.15 * nilaiTg + 0.20 * nilaiUTS + 0.30 * nilaiUAS) >= 50 then 'D'
	else 'E'
	end as Huruf_Mutu
	from TBLTransNilai
	) as hasil where Huruf_Mutu = 'A'
	and KodeMk = 'PY';
