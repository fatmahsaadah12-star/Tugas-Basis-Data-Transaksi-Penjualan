-- ======================================================================================
-- 1. SYNTAX PEMBUATAN TABLE (DIBUAT BERTAHAP DARI MEMBER_PEMBELI KE TRANSAKSI_PENJUALAN_DETAIL)
-- ======================================================================================
CREATE TABLE Master_Barang (
	Kode_Barang SERIAL PRIMARY KEY,
	Nama_Barang VARCHAR(255),
	Harga_Satuan INT
);

CREATE TABLE Member_Pembeli (
	Id_Member SERIAL PRIMARY KEY,
	Nama_Member VARCHAR(100) NOT NULL,
	Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Transaksi_Penjualan (
	Id_Transaksi SERIAL PRIMARY KEY,
	Id_Member INT,
	Tanggal_Transaksi DATE NOT NULL,
	FOREIGN KEY (Id_Member) REFERENCES Member_Pembeli(Id_Member)
);

CREATE TABLE Transaksi_Penjualan_Detail (
	Id_d_Transaksi SERIAL PRIMARY KEY,
	Id_Transaksi INT,
	Kode_Barang INT,
	Harga INT,
	Qty INT,
	FOREIGN KEY (Id_Transaksi) REFERENCES Transaksi_Penjualan(Id_Transaksi),
	FOREIGN KEY (Kode_Barang) REFERENCES Master_Barang(Kode_Barang)
);