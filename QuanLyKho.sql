create database QLKho
go
use QLKho
go
create table Kho
(
    IdKho int identity(1,1) primary key,
	TenKho nvarchar(max)

)
go
create table NhaCungCap
(
	NhaCungCapID int identity(1,1) primary key,
	TenNhaCungCap nvarchar(50)null,
	DiaChi nvarchar(100)null,
	SoDienThoai nvarchar(15)null,
	Email nvarchar(50)null,
	MoreInfo nvarchar(max),
	TGHopDong DateTime,

)
go

go
create table SanPham
(
    SanPhamID nvarchar(128) primary key,
	NhaCungCapID int not null,
	IdKho int not null,
	TenSanPham nvarchar(max)null,
	Hang nvarchar(50)null,
	XuatXu nvarchar(50)null,
	MauSac nvarchar(50)null,
	SoLuongTon int null,
	DonGiaSanPham int null,
	NgaySanXuat date null,
	foreign key(NhaCungCapID) references NhaCungCap(NhaCungCapID),
	foreign key(IdKho) references Kho(IdKho),


)
go

create table  PhanQuyen
(
   IdPQ int identity(1,1) primary key,
   NameHienT nvarchar(max),
)
go

create table  users
(
   IdUsers int identity(1,1) primary key,
   NameHienT nvarchar(max),
   UsersName nvarchar(100),
   password nvarchar(max),
   IdPQ int not null,
   foreign key(IdPQ) references PhanQuyen(IdPQ),
)
go
create table HoaDonNhap
(
   IdNhap nvarchar(128) primary key,
   NgayHD DateTime,
   Tong int ,
)
go
create table NhapChiTiet
(
	SanPhamID nvarchar(128) foreign key references SanPham(SanPhamID),
	IdNhap nvarchar(128) foreign key references HoaDonNhap(IdNhap),
	Tong int,
	TrangThai nvarchar(max),
	NhapVao float default 0,
	XuatRa float default 0,
	
	 primary key(IDNhap,SanPhamID),
)
go
create table HoaDonXuat
(
   IdXuat nvarchar(128) primary key,
   NgayHD DateTime,
   Tong int ,
)
go
create table XuatChiTiet
(
	SanPhamID nvarchar(128) foreign key references SanPham(SanPhamID),
	IdXuat nvarchar(128) foreign key references HoaDonXuat(IdXuat),
	Tong int,
	TrangThai nvarchar(max),
	 primary key(IDXuat,SanPhamID),

)
go
