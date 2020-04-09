USE TTN_QLNHANSU_01

---Th? t?c c?n thi?t cho bai quanlynhansu


CREATE PROC DEL_HoSoNV @MaNV NCHAR(20) AS
BEGIN
  DELETE FROM dbo.TTNhanVienCoBan WHERE MaNV=@MaNV
  DELETE FROM dbo.CDBaoHiemXaHoi WHERE MaNV=@MaNV
  DELETE FROM dbo.CDThaiSan WHERE MaNV=@MaNV
  UPDATE dbo.PhongBan SET MaTruongPhong=NULL WHERE MaTruongPhong=@MaNV
  DELETE FROM dbo.HoSoNV WHERE MaNV=@MaNV
   
END

--EXEC dbo.DEL_HoSoNV @MaNV =N''
