-- MODULE V
-- BEKERJA DENGAN MULTI TABLE
create database sekolah_1;
 
CREATE TABLE Guru (
    NIP CHAR(4) PRIMARY KEY,
    NamaGuru VARCHAR(50),
    MataPelajaran VARCHAR(30),
    NoHP VARCHAR(15)
);

INSERT INTO Guru Values
('G001', 'Yami', 'Dark', '08123456789'),
('G002', 'Luffy', 'GomuGomu', '08123456789'),
('G003', 'Zoro', 'Sword', '08123456789');
 
CREATE TABLE Kelas (
    Kelas CHAR(3) PRIMARY KEY,
    Walikelas VARCHAR(50),
    Ruangan CHAR(4),
    NIPGuru CHAR(4),
    CONSTRAINT FK_Kelas_Guru FOREIGN KEY (NIPGuru)
        REFERENCES Guru(NIP)
);

INSERT INTO Kelas Values
('X-A', 'Yami', 'R101', 'G001'),
('X-B', 'Luffy', 'R102', 'G002'),
('X-C', 'Zoro', 'R103', 'G003');
 
CREATE TABLE Siswa (
    NIS CHAR(4) PRIMARY KEY,
    NamaSiswa VARCHAR(50),
    Kelas CHAR(3),
    JenisKelamin CHAR(1),
    CONSTRAINT FK_Siswa_Kelas FOREIGN KEY (Kelas)
        REFERENCES Kelas(Kelas)
);

INSERT INTO Siswa VALUES
('S001', 'Kamal', 'X-A', 'L'),
('S002', 'Bima', 'X-B', 'P'),
('S003', 'Furry', 'X-C', 'S');

select * from Kelas;
select * from Guru;
select * from Siswa;

-- MENAMPILKAN DATA GABUNGAN
select Siswa.NIS, Siswa.NamaSiswa, Kelas.WaliKelas 
from Siswa, Kelas 
where Siswa.Kelas = Kelas.Kelas

-- MENAMPILKAN SISWA DI KELAS TERTENTU
select * from Siswa
where  kelas = 'X-C'

-- GABUNGAN
select Siswa.NIS, Siswa.NamaSiswa, Kelas.WaliKelas, Kelas.Kelas 
from Siswa, Kelas 
where Siswa.Kelas = Kelas.Kelas
and Siswa.Kelas = 'X-C'

