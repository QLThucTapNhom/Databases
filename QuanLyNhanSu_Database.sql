USE master

CREATE DATABASE TTN_QLNHANSU_01

USE TTN_QLNHANSU_01

CREATE TABLE HoSoNV
(
   MaNV NCHAR(20) PRIMARY KEY NOT NULL,
   TenNV NVARCHAR(50),
   HoDemNV NVARCHAR(50),
   ChucVu NVARCHAR(50),
   MaPB NCHAR(20),
   NgayVaoLam DATE,
   NgayChinhThuc DATE,
   NgayHetHanHD DATE,
   MaLuong NCHAR(20)

)
GO 
CREATE TABLE TTNhanVienCoBan
(
   MaNV NCHAR(20),
   TenNV NVARCHAR(50),
   HoDemNV NVARCHAR(50),
   GioiTinh NVARCHAR(20),
   NgaySinh DATE,
   QuocTich NVARCHAR(50),
   NguyenQuan NVARCHAR(100),
   DiaChi NVARCHAR(100),
   SDT_Email NCHAR(20),
   NgoaiNgu NVARCHAR(50),
   HocVan NVARCHAR(50),
   GhiChu NVARCHAR(100)
)
GO 

CREATE TABLE PhongBan
(
   MaPB NCHAR(20) PRIMARY KEY NOT NULL,
   TenPB NVARCHAR(50),
   ChucNang NVARCHAR(50),
   NgayThanhLap DATE,
   SDT_Fax NCHAR(20),
   DiaChiPB NVARCHAR(20),
   GhiChu NVARCHAR(50),
   MaTruongPhong NCHAR(20) 
)
GO 

CREATE TABLE Luong
(
   MaLuong NCHAR(20) PRIMARY KEY NOT NULL,
   LuongCB DECIMAL(18,3),
   HSLuong FLOAT,
   HSPhuCap FLOAT,
)
GO 


CREATE TABLE CDBaoHiemXaHoi
(
   MaNV NCHAR(20),
   TenNV NVARCHAR(50),
   HoDemNV NVARCHAR(50),
   MaLuong NCHAR(20),
   MaBHXH NCHAR(20) PRIMARY KEY NOT NULL,
   NgayCapSo DATE,
   GhiChu NVARCHAR(100)
)
GO 


CREATE TABLE CDThaiSan
(
   MaNV NCHAR(20),
   TenNV NVARCHAR(50),
   HoDemNV NVARCHAR(50),
   MaPB NCHAR(20),
   NgayBDNghi DATE,
   NgayTroLai DATE,
   GhiChu NVARCHAR(100)
)
GO 
CREATE TABLE TaiKhoan
(
   Username CHAR(10) PRIMARY KEY,
   MatKhau CHAR(10),
   SDT_Email NCHAR(50),
   QuyenTruyCap int
)
-- Khóa ngoại, liên kết dữ liệu
ALTER TABLE dbo.HoSoNV ADD CONSTRAINT FK_HoSoNV_PB FOREIGN KEY(MaPB) REFERENCES dbo.PhongBan(MaPB)
ALTER TABLE dbo.HoSoNV ADD CONSTRAINT FK_HoSoNV_Luong FOREIGN KEY(MaLuong) REFERENCES dbo.Luong(MaLuong)
ALTER TABLE dbo.TTNhanVienCoBan ADD CONSTRAINT FK_TTNhanVienCoBan_HoSoNV FOREIGN KEY(MaNV) REFERENCES dbo.HoSoNV(MaNV)

ALTER TABLE dbo.PhongBan ADD CONSTRAINT FK_PhongBan_HSNV FOREIGN KEY(MaTruongPhong) REFERENCES dbo.HoSoNV(MaNV)
ALTER TABLE dbo.CDBaoHiemXaHoi ADD CONSTRAINT FK_BHXH_NV FOREIGN KEY(MaNV) REFERENCES dbo.HoSoNV(MaNV)
ALTER TABLE dbo.CDThaiSan ADD CONSTRAINT FK_ThaiSan_NV FOREIGN KEY(MaNV) REFERENCES dbo.HoSoNV(MaNV)



INSERT dbo.TaiKhoan
        ( Username ,MatKhau ,SDT_Email ,QuyenTruyCap)
VALUES  ( 'admin' , '123' , N'tata.dongvanhung@gmail.com' , 1 )

INSERT dbo.Luong
        ( MaLuong, LuongCB, HSLuong, HSPhuCap )
VALUES  ( N'L1', -- MaLuong - nchar(20)
          4000000, -- LuongCB - decimal
          2.5, -- HSLuong - float
          0.5  -- HSPhuCap - float
          )

INSERT dbo.PhongBan( MaPB ,TenPB ,ChucNang ,NgayThanhLap ,SDT_Fax ,DiaChiPB ,GhiChu ,MaTruongPhong)
VALUES  ( N'Phong01' ,  N'Phòng Nhân sự' , N'QL Nhân sự' ,GETDATE() , N'0320129876' , N'P0604' ,  N'' ,Null )
INSERT dbo.PhongBan( MaPB ,TenPB ,ChucNang ,NgayThanhLap ,SDT_Fax ,DiaChiPB ,GhiChu ,MaTruongPhong)
VALUES  ( N'PB01' ,  N'Phòng Nhân sự' , N'QL Nhân sự' ,GETDATE() , N'0320129876' , N'P0604' ,  N'' ,Null )


INSERT dbo.HoSoNV( MaNV ,TenNV , HoDemNV ,ChucVu ,MaPB ,NgayVaoLam ,NgayChinhThuc ,NgayHetHanHD ,MaLuong )
VALUES  ( N'NV01' ,N'Lâm' ,N'Hoàng Mạnh' ,N'Trưởng Phòng' , N'PB01' , GETDATE() ,GETDATE() , GETDATE() , N'L1' )
