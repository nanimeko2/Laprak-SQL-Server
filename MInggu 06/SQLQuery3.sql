CREATE TABLE Siswa2 (
	NIS INT PRIMARY KEY,
	NamaSiswa VARCHAR (50),
	Kelas VARCHAR (50),
	JenisKelamin VARCHAR (1)
);

INSERT INTO Siswa2 (NIS, NamaSiswa, Kelas, JenisKelamin)
VALUES
('1', 'BUDI1', 'XII', 'P'),
('2', 'BUDI2', 'XII', 'P'),
('3', 'BUDI3', 'XII', 'P'),
('4', 'BUDI4', 'XII', 'P')

DROP TABLE Siswa2

CREATE TABLE Matapelajaran2 (
	KodeMapel VARCHAR (3) PRIMARY KEY,
	NamaMapel VARCHAR (50),
	KKM INT,
);

INSERT INTO Matapelajaran2 (KodeMapel, NamaMapel, KKM)
VALUES
('S', 'Sunda', '80'),
('J', 'Jawa', '60'),
('H', 'Jepang', '90'),
('I', 'Indonesia', '70')

DROP TABLE Matapelajaran2

CREATE TABLE N2 (
	NIS INT,
	KodeMapelN VARCHAR (3),
	kehadiran INT,
	tugas INT,
	uts INT,
	uas INT,
	CONSTRAINT FK_NIS FOREIGN KEY (NIS)
        REFERENCES Siswa2(NIS),
	CONSTRAINT FK_MAPEL FOREIGN KEY (KodeMapelN)
        REFERENCES Matapelajaran2(KodeMapel)
);

INSERT INTO N2 (NIS, KodeMapelN, kehadiran, tugas, uts, uas)
VALUES 
(1, 'S', 95, 80, 75, 85),
(2, 'I', 100, 90, 88, 92),
(3, 'H', 90, 85, 80, 80),
(4, 'J', 70, 80, 80, 80);

DROP TABLE N2

SELECT Siswa2.NamaSiswa, N2.uts
FROM Siswa2, N2
WHERE Siswa2.NIS = N2.NIS

SELECT Siswa2.NamaSiswa, N2.uts
FROM Siswa2, N2
WHERE Siswa2.NIS = N2.NIS
and Siswa2.NIS = '1'

SELECT Siswa2.NamaSiswa, N2.uts, N2.uas, N2.tugas, N2.kehadiran, Matapelajaran2.NamaMapel
FROM Siswa2, N2, Matapelajaran2
WHERE Siswa2.NIS = N2.NIS
and N2.KodeMapelN = Matapelajaran2.KodeMapel

SELECT * FROM Siswa2
SELECT * FROM Matapelajaran2
SELECT * FROM N2
