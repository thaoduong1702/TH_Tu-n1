Exec sp_addtype 'Mota', 'nvarchar(40)','not null';
Exec sp_addtype 'IDKH', 'char(10)';
Exec sp_addtype 'DT', 'char(12)','not null';

create database Sales
go
use Sales
Create table SanPham
(
MaSp char(6) primary key,
TenSp varchar(20) not null,
NgayNhap date,
DVT char(10) not null,
SoLuongTon int not null,
DonGiaNhap money not null
)
go

Create table HoaDon
(
MaHD char(10) primary key,
NgayLap date not null,
NgayGiao date not null,
MaKH IDKH,
DienGiai Mota 
)
go

Create table KhachHang
(
MaKH IDKH primary key,
TenKH nvarchar(30) not null,
DiaChi nvarchar(40) not null,
DienThoai DT 
)
go

Create table ChiTietHD
(
MaHD char(10) primary key,
MaSp char(6) not null,
SoLuong int not null,
)
go

---Câu 3------
ALTER TABLE HoaDon
ALTER COLUMN DienGiai nvarchar(100)

-----Câu 4----
ALTER TABLE SanPham
ADD TyLeHoaHong float

---Câu 5---
ALTER TABLE SanPham
DROP COLUMN NgayNhap;

---Câu 6 Tạo khóa phụ-------
ALTER TABLE ChiTietHD ADD CONSTRAINT fk_MaSp FOREIGN KEY(MaSp) REFERENCES SanPham(MaSp)
GO

ALTER TABLE HoaDon ADD CONSTRAINT fk_MaKH FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)
GO

----Câu 7
ALTER TABLE HoaDon
ADD CONSTRAINT HoaDon_NgayGiao_NgayLap
Check(NgayGiao >= NgayLap)

ALTER TABLE HoaDon
ADD CHECK (MaHD like'[A-Z][A-Z][0-9][0-9][0-9][0-9]')

ALTER TABLE HoaDon
ADD CONSTRAINT HoaDon_NgayLap_D
Default getdate() for NgayLap

----Câu 8---
ALTER TABLE SanPham
ADD CHECK (SoLuongTon > 0 and SoLuongTon < 50)

ALTER TABLE SanPham
ADD CHECK (DonGiaNhap > 0)

ALTER TABLE SanPham ADD NgayNhap date

ALTER TABLE SanPham
ADD CONSTRAINT SanPham_NgayNhap_D 
default  getdate() for NgayNhap

ALTER TABLE SanPham
ADD CHECK (DVT like 'KG"Thùng"Hộp"Cái')

