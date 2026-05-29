-- 1. Tabel Utama Mahasiswa
CREATE TABLE Mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100),
    prodi VARCHAR(50)
);

-- 2. Tabel Log Aktivitas
CREATE TABLE LogAktivitas (
    logid INT IDENTITY(1,1) PRIMARY KEY,
    keterangan VARCHAR(500),
    waktu DATETIME DEFAULT GETDATE()
);

-- 3. Tabel Arsip Mahasiswa
CREATE TABLE ArsipMahasiswa (
    nim VARCHAR(15),
    nama VARCHAR(100),
    prodi VARCHAR(50),
    waktuhapus DATETIME DEFAULT GETDATE()
);

INSERT INTO Mahasiswa (nim, nama, prodi) 
VALUES 
('2026001', 'Budi Santoso', 'Teknik Informatika'),
('2026002', 'Siti Aminah', 'Sistem Informasi'),
('2026003', 'Rian Hidayat', 'Manajemen Informatika'),
('2026004', 'Masakan Padang', 'Teknik Mesin'),
('2026005', 'Budi Doremi', 'Bahasa Inggris');

INSERT INTO Mahasiswa (nim, nama, prodi) 
VALUES 
('2026006', 'Mie Ayam', 'Makanan Tepung'),
('2026007', 'Labkom UIKA', 'Bahasa Komputer');

DELETE FROM Mahasiswa WHERE nim = 2026007;

UPDATE Mahasiswa
SET nama = 'Budi Santoso'
WHERE nim = 2026001;

DROP TABLE LogAktivitas;


SELECT * FROM Mahasiswa
SELECT * FROM LogAktivitas
SELECT * FROM ArsipMahasiswa


