USE master
--drop database QLThuVien
create database QuanLiThuVien2

 ON  PRIMARY 
( NAME = N'QuanLiThuVien2', FILENAME = N'C:\CSDL\QuanLiThuVien2.mdf' , SIZE = 100 , MAXSIZE = 2GB, FILEGROWTH = 10 )
 LOG ON 
( NAME = N'QuanLiThuVien2_log', FILENAME = N'C:\CSDL\QuanLiThuVien2_log.ldf' , SIZE = 200 , MAXSIZE = UNLIMITED , FILEGROWTH = 20)
go
use QuanLiThuVien2
go

-----
--drop table NguoiMuon
create table NguoiMuon
(
	MaDG nchar(10),
	TenDG nchar(30),
	GioiTinh nchar(5),
	NgayMuon datetime,
	DiaChi nchar(100),
	PRIMARY KEY (MaDG),
)

create table TacGia
(
	MaTG nchar(10),
	TenTG nchar(50),
	DiaChi nchar(30),
	PRIMARY KEY (MaTG),
)
create table Loaisach
(
	MaLoaiSach nchar(10),
	TenLoai nchar(50),
	KieuSach nchar(30),
	PRIMARY KEY (MaLoaiSach),
)

create table Sach
(
	MaSach nchar(10),
	TenSach nchar(50),
	MaLoaiSach nchar(10),
	SoLuong int,
	MaTG nchar(10),
	PRIMARY KEY (MaSach),
)
--drop table MuonTraSach
create table MuonTraSach
(
	MaDG nchar(10),
	MaSach nchar(10),
	SoLuong INT,
	NgayMuon datetime,
	NgayHenTra datetime,
	NgayTra DATETIME,
	
)

alter table MuonTraSach add
	constraint FK_MuonTraSach_DOCGIA foreign key (MaDG) references NguoiMuon (MaDG),
	constraint FK_MuonTraSach_SACH foreign key (MaSach) references Sach (MaSach)

alter table Sach add
	constraint FK_Sach_TACGIA foreign key (MaTG) references TacGia (MaTG),
	constraint FK_Sach_LOAISACH foreign key (MaLoaiSach) references LoaiSach (MaLoaiSach)

