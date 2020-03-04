USE master

CREATE DATABASE HeThong_QuanLyHocTap

USE HeThong_QuanLyHocTap
GO

 CREATE TABLE TaiKhoan(
	ID_TaiKhoan INT,
	tenTaiKhoan NCHAR(50),
	MatKhau NCHAR(50),
	PRIMARY KEY(ID_TaiKhoan)
 )
 GO

 CREATE TABLE _Admin(
	ID_Admin INT NOT NULL,
	Email NCHAR(50) NOT NULL,
	ID_TaiKhoan INT,
	PRIMARY KEY(ID_Admin),
	FOREIGN KEY(ID_TaiKhoan) REFERENCES TaiKhoan(ID_TaiKhoan)
)
GO

CREATE TABLE GiaoVien(
	ID_GV NCHAR(10) NOT NULL,
	HoTen NVARCHAR(50) NOT NULL,
	GioiTinh NVARCHAR(10),
	NgaySinh DATE,
	QueQuan NVARCHAR(50),
	TrinhDo NVARCHAR(50),
	ChuyenMon NVARCHAR(50),
	SDT INT,
	ID_TaiKhoan INT,
	ID_Admin INT,
	PRIMARY KEY(ID_GV),
	FOREIGN KEY(ID_TaiKhoan) REFERENCES TaiKhoan(ID_TaiKhoan),
	FOREIGN KEY(ID_Admin) REFERENCES _Admin(ID_Admin)
)
GO

CREATE TABLE LopHoc(
	MaLopHoc NCHAR(20) NOT NULL,
	TenLopHoc NVARCHAR(50) NOT NULL,
	ID_Admin INT,
	NamHoc NVARCHAR(10),
	PRIMARY KEY(MaLopHoc),	
)
GO

CREATE TABLE DayHoc(
	MonHoc NVARCHAR(20),
	ID_GV NCHAR(10),
	MaLopHoc NCHAR(20),
	FOREIGN KEY(ID_GV) REFERENCES GiaoVien(ID_GV),
	FOREIGN KEY(MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO

CREATE TABLE HocSinh(
	ID_HS NCHAR(10),
	HoTen NVARCHAR(50),
	GioiTinh NVARCHAR(10),
	NgaySinh DATE,
	QueQuan NVARCHAR(50),
	SDT INT,
	DTB FLOAT,
	XepLoai NVARCHAR(20),
	HanhKiem NVARCHAR(20),
	MaLopHoc NCHAR(20),
	ID_TaiKhoan INT,
	ID_Admin INT,
	PRIMARY KEY(ID_HS),
	FOREIGN KEY(MaLopHoc) REFERENCES LopHoc(MaLopHoc),
	FOREIGN KEY(ID_TaiKhoan) REFERENCES TaiKhoan(ID_TaiKhoan),
	FOREIGN KEY(ID_Admin) REFERENCES _Admin(ID_Admin)
)
GO





