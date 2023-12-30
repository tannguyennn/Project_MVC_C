CREATE DATABASE Project_63132204
GO
USE Project_63132204
GO
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY IDENTITY(1,1),
    HoNV NVARCHAR(50) NOT NULL,
    TenNV NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
	GioiTinh NVARCHAR(3) NOT NULL,
    DiaChi NVARCHAR(255) NOT NULL,
    SDT VARCHAR(10) NOT NULL,
	Luong INT NOT NULL,
	TKNV VARCHAR(50),
	MKNV VARCHAR(20),
);
GO
CREATE TABLE KhachHang (
	MaKH INT PRIMARY KEY IDENTITY(1,1),
	HoKH NVARCHAR(50) NOT NULL,
	TenKH NVARCHAR(50) NOT NULL,
	CCCD VARCHAR(12) NOT NULL,
	GioiTinh NVARCHAR(3) NOT NULL,
	SDT VARCHAR(10) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	TKKH VARCHAR(50) ,
	MKKH VARCHAR(30),
)
GO
CREATE TABLE LoaiPhong (
	MaLoaiPhong INT PRIMARY KEY IDENTITY(1,1),
	TenLoaiPhong NVARCHAR(50) NOT NULL,
	Gia INT NOT NULL,
	Anh NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE Phong (
	MaPhong INT PRIMARY KEY IDENTITY(1,1),
	TenPhong NVARCHAR(20) NOT NULL,
	MaLoaiPhong INT FOREIGN KEY REFERENCES LOAIPHONG(MaLoaiPhong),
	TrangThai BIT NOT NULL,
)
GO
CREATE TABLE LoaiDichVu(
	MaLDV INT PRIMARY KEY IDENTITY(1,1),
	TenLDV NVARCHAR(30) NOT NULL,		
)
GO
CREATE TABLE DichVu (
	MaDV INT PRIMARY KEY IDENTITY(1,1),
	TenDV NVARCHAR(50) NOT NULL,
	MaLDV INT FOREIGN KEY REFERENCES LoaiDichVu(MaLDV),
	Gia INT NOT NULL,
	TonKho INT NOT NULL,
	DonVi NVARCHAR(50) NOT NULL,
	Anh NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE HoaDonDichVu(
	MaHDDV INT IDENTITY(1,1),
	MaPhong INT FOREIGN KEY REFERENCES Phong(MaPhong),			
    MaKH INT FOREIGN KEY REFERENCES KhachHang(MaKH),
	MaDV INT FOREIGN KEY REFERENCES DichVu(MaDV),
	NgayDat DATE NOT NULL,
	SoLuong INT NOT NULL,
	PRIMARY KEY(MaHDDV)
)
GO
CREATE TABLE HoaDonDatPhong (
	MaDatPhong INT  IDENTITY(1,1),
    MaKH INT FOREIGN KEY REFERENCES KhachHang(MaKH),
	MaPhong INT FOREIGN KEY REFERENCES Phong(MaPhong),
    NgayDat DATE NOT NULL,
    NgayVao DATE NOT NULL,
    NgayRa DATE NOT NULL,
	ThanhToan BIT NOT NULL,
	PRIMARY KEY(MaDatPhong)
);

INSERT INTO NhanVien(HoNV, TenNV, NgaySinh, GioiTinh, DiaChi,SDT,Luong,TKNV,MKNV) VALUES
(N'Nguyễn',N'Thị Huệ','1999-01-10',N'Nữ',N'Nha Trang, Khánh Hòa','0956271621',6000000,'nhanvien1','nv111'),
(N'Huỳnh',N'Thu Liễu','1999-01-10',N'Nữ',N'Vạn Ninh, Khánh Hòa','0987617265',6000000,'nhanvien2','nv222'),
(N'Trần',N'Anh Quốc','1999-01-10',N'Nam',N'Nha Trang, Khánh Hòa','0998327265',6200000,'nhanvien3','nv333'),
(N'Trần',N'Thu Trang','1999-01-10',N'Nữ',N'Cam Ranh, Khánh Hòa','0118217265',6100000,null,null),
(N'Nguyễn',N'Bảo Việt','1999-01-10',N'Nam',N'Nha Trang, Khánh Hòa','0987675415',6500000,null,null)

INSERT INTO KhachHang(HoKH,TenKH,CCCD,GioiTinh,SDT,Email,TKKH,MKKH) VALUES
(N'Ngô',N'Xuân Huy',     '056209187361',N'Nam','0975615463','xuanhuy123@gmail.com','khachhang1','kh111'),
(N'Cao',N'Anh Tiến',     '056267465351',N'Nam','0398762465','anhtien123@gmail.com','khachhang2','kh222'),
(N'Huỳnh',N'Hoa Mai',    '056213265742',N'Nữ', '0308654236','hoamai123@gmail.com','khachhang3','kh333'),
(N'Lương',N'Quỳnh Trâm', '056245341454',N'Nữ', '0908865623','quanhtram123@gmail.com',null,null),
(N'Lương',N'Văn Linh',   '056264645644',N'Nam','0964976137','vanlinh123@gmail.com',null,null),
(N'Huỷnh',N'Thủy Tiên',  '056273156443',N'Nữ', '0363458675','thuytien123@gmail.com',null,null),
(N'Lê',N'Anh Phú',       '056287689445',N'Nam','0365987312','anhphu123@gmail.com',null,null),
(N'Nguyễn',N'Xuân Quỳnh','056265344547',N'Nữ', '0953647631','xuanquynh123@gmail.com',null,null),
(N'Phùng',N'Anh Tú',     '056278614654',N'Nam','0975897566','anhtu123@gmail.com',null,null),
(N'Ngô',N'Mai Trinh',    '056212475625',N'Nữ', '0979463446','maitrinh123@gmail.com',null,null),
(N'Nguyễn',N'Thành Vinh','056298364544',N'Nam','0979876468','thanhvinh123@gmail.com',null,null),
(N'Nguyễn',N'Văn Thành', '056286545625',N'Nam','0975615463','vanthanh123@gmail.com',null,null),
(N'Ngô',N'Xuân Huy',     '056209187361',N'Nam','0320979382','xuanhuy123@gmail.com',null,null),
(N'Cao',N'Anh Tiến',     '056272133212',N'Nam','0827382173','anhtien123@gmail.com',null,null),
(N'Huỳnh',N'Đan Thi',    '056243242324',N'Nữ', '0923023322','danthi123@gmail.com',null,null),
(N'Lương',N'Thanh thư', '056291283072',N'Nữ', '0392016322','thanhthu123@gmail.com',null,null),
(N'Lương',N'Văn Nhân',   '056921830918',N'Nam','0931023822','vannhan123@gmail.com',null,null),
(N'Huỳnh',N'Thúy Nhi',  '056398127391',N'Nữ', '0387216832','thuynhi123@gmail.com',null,null),
(N'Lê',N'Anh Huy',       '056231023612',N'Nam','0920391233','anhuy123@gmail.com',null,null),
(N'Nguyễn',N'Xuân Huy','056333392835',N'Nữ', '0812731212','xuanqhuy123@gmail.com',null,null),
(N'Phùng',N'Anh Quân',     '056232195321',N'Nam','0832713781','anhquan123@gmail.com',null,null),
(N'Ngô',N'Mai Tuyết',    '056123791232',N'Nữ', '0981273121','maituyet123@gmail.com',null,null),
(N'Nguyễn',N'Thành Quang','056391203721',N'Nam','0318238123','thanhQuang123@gmail.com',null,null),
(N'Nguyễn',N'Văn Nhân', '056290127312',N'Nam','0538214312','vannhan123@gmail.com',null,null),
(N'Ngô',N'Xuân Lâm',     '056398023223',N'Nam','0039210191','xuanlam123@gmail.com',null,null),
(N'Nguyễn',N'Anh Tiến',  '056333283223',N'Nam','0082721233','anhtien123@gmail.com',null,null),
(N'Huỳnh',N'Hoa Liễu',   '056982132332',N'Nữ', '0353722911','hoalieu123@gmail.com',null,null),
(N'Lương',N'Quỳnh Mai',  '056983794327',N'Nữ', '0943043223','quanhmai123@gmail.com',null,null),
(N'Lương',N'Văn Lâm',    '056264645644',N'Nam','0612372117','vanlam123@gmail.com',null,null)

INSERT INTO LoaiPhong(TenLoaiPhong, Gia, Anh) VALUES
(N'Phòng Đơn',200000,'phongdon.jpg'),
(N'Phòng Đôi',300000,'phongdoi.jpg'),
(N'Phòng VIP',500000,'phongvip.jpg')

INSERT INTO Phong VALUES
(N'Phòng 101',1,0),
(N'Phòng 102',1,0),
(N'Phòng 103',1,1),
(N'Phòng 104',1,1),
(N'Phòng 105',1,0),
(N'Phòng 106',1,0),
(N'Phòng 201',2,1),
(N'Phòng 202',2,1),
(N'Phòng 203',2,1),
(N'Phòng 204',2,1),
(N'Phòng 206',2,0),
(N'Phòng 207',2,0),
(N'Phòng 301',3,1),
(N'Phòng 302',3,1),
(N'Phòng 304',3,1),
(N'Phòng 305',3,0),
(N'Phòng 306',3,0),
(N'Phòng 401',2,0),
(N'Phòng 402',2,0),
(N'Phòng 403',2,0),
(N'Phòng 404',2,0),
(N'Phòng 405',2,0),
(N'Phòng 406',2,0),
(N'Phòng 501',1,0),
(N'Phòng 502',1,0),
(N'Phòng 503',1,0),
(N'Phòng 504',1,0),
(N'Phòng 505',1,0),
(N'Phòng 506',1,0)

INSERT INTO LoaiDichVu(TenLDV) VALUES
(N'Thức Ăn'),
(N'Thức uống')

INSERT INTO DichVu(TenDV,MaLDV,Gia,TonKho,DonVi,Anh) VALUES
(N'Pizza chay',   1,100000,10,N'Cái','pizzachay.jpg'),
(N'Pizza Hải Sản',1,150000,12,N'Cái','pizzahaisan.jpg'),
(N'Bia',          2,30000, 100,N'Lon','bia.jpg'),
(N'Cocacola',     2,10000, 10,N'Lon', 'cocacola.jpg'),
(N'Rượu',         2,200000,10,N'Chai','ruou.jpg')

INSERT INTO HoaDonDichVu(MaPhong,MaKH,MaDV,NgayDat,SoLuong) VALUES
(1,1,1,'2023-10-11',2),
(7,2,1,'2023-10-13',2),
(7,4,3,'2023-10-13',2),
(2,9,4,'2023-10-27',2),
(6,18,5,'2023-10-08',2),
(18,5,3,'2023-09-11',2)

INSERT INTO HoaDonDatPhong(MaKH,MaPhong,NgayDat,NgayVao,NgayRa,ThanhToan) VALUES
(1,1,'2023-10-13','2023-10-13','2023-10-15',0),
(14,2,'2023-10-13','2023-10-13','2023-10-15',0),
(3,4,'2023-10-13','2023-10-13','2023-10-18',1),
(5,7,'2023-11-13','2023-11-13','2023-11-15',1),
(5,10,'2023-11-13','2023-11-13','2023-11-15',1),
(4,13,'2023-10-18','2023-10-18','2023-10-20',1),
(1,5,'2023-12-10','2023-12-13','2023-12-20',1),
(6,14,'2023-11-27','2023-11-27','2023-11-28',1),
(7,14,'2023-11-27','2023-11-27','2023-11-28',1),
(4,18,'2023-10-18','2023-10-18','2023-10-20',1),
(18,19,'2023-12-10','2023-12-13','2023-12-20',1),
(28,23,'2023-11-27','2023-11-27','2023-11-28',1),
(27,20,'2023-11-27','2023-11-27','2023-11-28',1),
(13,26,'2023-10-18','2023-10-18','2023-10-20',1),
(23,12,'2023-12-10','2023-12-13','2023-12-20',1),
(16,29,'2023-11-27','2023-11-27','2023-11-28',1),
(12,27,'2023-11-27','2023-11-27','2023-11-28',1)

--drop database Project_63132204

GO
CREATE PROCEDURE NhanVien_TimKiem
	@HoTen NVARCHAR(100)=NULL,
	@GioiTinh NVARCHAR(3)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM NhanVien
       WHERE  (1=1)
       '
IF @HoTen IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoNV+'' ''+TenNV LIKE N''%'+@HoTen+'%'')
              '
IF @GioiTinh IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (GioiTinh like N''%'+@GioiTinh+'%'')
             '
	EXEC SP_EXECUTESQL @SqlStr
END

GO
CREATE PROCEDURE KhachHang_TimKiem
	@HoTenKH NVARCHAR(100)=NULL,
	@GioiTinh NVARCHAR(3)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM KhachHang
       WHERE  (1=1)
       '
IF @HoTenKH IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoKH+'' ''+TenKH LIKE N''%'+@HoTenKH+'%'')
              '
IF @GioiTinh IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
             AND (GioiTinh LIKE N''%'+@GioiTinh+'%'')
             '
	EXEC SP_EXECUTESQL @SqlStr
END


GO
CREATE PROCEDURE ThongKe_Dichvu
    @NgayDau DATE=NULL,
	@NgayCuoi DATE=NULL
AS
BEGIN
	SELECT *
	FROM HoaDonDichVu
	WHERE DATEDIFF(dd,@NgayDau,NgayDat) > 1
	UNION
	SELECT *
	FROM HoaDonDichVu
	WHERE DATEDIFF(mm,NgayDat,@NgayCuoi) > 1
END



GO
CREATE PROCEDURE ThongKe_HoaDon
    @NgayDau DATE=NULL,
	@NgayCuoi DATE=NULL
AS
BEGIN
SELECT *
	FROM HoaDonDatPhong
	WHERE DATEDIFF(dd,@NgayDau,NgayDat) > 1
	UNION
	SELECT *
	FROM HoaDonDatPhong
	WHERE DATEDIFF(mm,NgayDat,@NgayCuoi) > 1
END

--exec ThongKe_HoaDon '2023-10-01', '2023-12-31'