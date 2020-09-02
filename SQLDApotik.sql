--1
SELECT id_obat, CONVERT(CHAR(20),kadaluarsa,101) 'Kadaluarsa', nama FROM OBAT
WHERE kadaluarsa<'06/01/2009'

--2
SELECT id_obat, CONVERT(CHAR(20),kadaluarsa,100) 'Kadaluarsa', nama FROM OBAT
WHERE kadaluarsa > '04/01/2009' AND jumlah_stok > 200

--3
EXEC sp_maxstok

--4
CREATE VIEW Vrincian AS 
SELECT P.id_pembelian, O.nama, P.jumlah 
FROM RINCIANPEMBELIAN P, OBAT O
WHERE p.id_obat=o.id_obat AND P.jumlah>=100

SELECT nama, jumlah FROM Vrincian

--6
CREATE TRIGGER TrigTambah
ON RINCIANPEMBELIAN
AFTER INSERT 
AS 
DECLARE @T int
SET @T=(SELECT jumlah FROM inserted)
PRINT @T
UPDATE OBAT SET OBAT.jumlah_stok=OBAT.jumlah_stok+@T
FROM OBAT, inserted
WHERE OBAT.id_obat=inserted.id_obat

