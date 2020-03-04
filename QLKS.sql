use master
go 
create database QLKS
go
use QLKS
go

create table chucvu
(
macv nvarchar(10) primary key,
tencv nvarchar(20) ,
luongcb money ,
heso float ,
) 

create table nhanvien
(
manv nvarchar(10) primary key,
macv nvarchar(10)  ,
hotennv nvarchar(30)  ,
gioitinh nvarchar(3) ,
ngaysinh date ,
diachi nvarchar(50),
sdt char(10) ,
luong money,
constraint fk_nhanvien_chucvu foreign key(macv) references chucvu(macv)
)


create table khachhang
(
makh nvarchar(10) primary key,
tenkh nvarchar(30) ,
diachi nvarchar(50),
gioitinh nvarchar(3) ,
cmnd char(20)   ,
sdt char(10)  ,
quoctich nvarchar(20) ,
)

create table loaiphong
(
maloaiphong nvarchar(10) primary key,
tenloaiphong nvarchar(10) ,
heso float ,
giaphongcb money,
)

create table phong
(
maphong nvarchar(10) primary key,
maloaiphong nvarchar(10),
tenphong nvarchar(20) ,
tinhtrang nvarchar(10) ,
giaphong money,
constraint fk_phong_loaiphong foreign key(maloaiphong) references loaiphong(maloaiphong)
)

create table phieudangky 
(
maphieudk nvarchar(10) primary key,
makh nvarchar(10) ,
manv nvarchar(10) ,
maphong nvarchar(10) ,
ngaylap date ,
ngaydi date ,
tientratruoc money ,
constraint fk_phieudangky_khachhang foreign key(makh) references khachhang(makh),
constraint fk_phieudangky_nhanvien foreign key(manv) references nhanvien(manv),
constraint fk_phieudangky_phong foreign key(maphong) references phong(maphong)
)

create table danhmucdv
(
madv nvarchar(10) primary key,
tendv nvarchar(20) ,
giadv money ,
)

create table sudungdv
(
maphieudk nvarchar(10) foreign key references phieudangky(maphieudk),
madv nvarchar(10) ,
soluong int ,
thanhtien money,
constraint fk_sudungdv_danhmucdv foreign key(madv) references danhmucdv(madv)
)

create table hoadon
(
mahd nvarchar(10) primary key,
maphieudk nvarchar(10) ,
manv nvarchar(10) ,
ngaythanhtoan date ,
tientratruoc money,
tongtientt money,
constraint fk_hoadon_phieudangky foreign key(maphieudk) references phieudangky(maphieudk),
constraint fk_hoadon_nhanvien foreign key(manv) references nhanvien(manv),

)

