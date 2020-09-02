--No 1
INSERT INTO Pelanggan(Kode_Pelanggan,Nama,Alamat_Jalan,Alamat_Kota,Kode_Pos)
VALUES ('C106','Adit','Jl. Jawa','Tulungagung','60999')

--No 2
UPDATE Kategori
SET Nama_Kategori='Sepeda Mini'
WHERE Kode_Kategori='A01'

--No 3
DELETE FROM Produk
WHERE Kode_Produk='B108'

--No 4
SELECT Nama_Produk, Keluaran_Tahun, Stok, Harga_Satuan FROM Produk
WHERE Harga_Satuan>1000000

--No 5
SELECT Nama_Produk, Keluaran_Tahun, Stok, Harga_Satuan FROM Produk
WHERE Harga_Satuan<1000000 AND NOT(Keluaran_Tahun='2017')

--No 6
SELECT Nama_Produk, Keluaran_Tahun, Stok, Harga_Satuan FROM Produk
WHERE Stok=(SELECT MAX(Stok) FROM Produk)

--No 7
SELECT Alamat_Kota, COUNT(*) 'Jumlah Pelanggan' FROM Pelanggan
GROUP BY Alamat_Kota

--No 8
SELECT Tanggal, AVG(Jumlah) 'Rata-rata Penjualan' FROM Penjualan
GROUP BY Tanggal
HAVING AVG(Jumlah)>20

--No 9
SELECT i.Kode_Penjualan, i.Tanggal, i.Jumlah, i.Total_Harga
FROM Penjualan i, Pelanggan j
WHERE i.Kode_Pelanggan=j.Kode_Pelanggan AND j.Nama='Yusuf'

--No 10
SELECT i.Nama, j.Nama_Produk, k.Tanggal
FROM Pelanggan i, Produk j, Penjualan k
WHERE i.Kode_Pelanggan=k.Kode_Pelanggan AND j.Kode_Produk=k.Kode_Produk