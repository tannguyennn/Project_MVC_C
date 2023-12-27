CREATE DATABASE Project_63132204
GO
USE Project_63132204
GO
CREATE TABLE NhanVien (
    MaNV VARCHAR(10) PRIMARY KEY,
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
	MaKH VARCHAR(10) PRIMARY KEY,
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
	MaLoaiPhong VARCHAR(10) PRIMARY KEY,
	TenLoaiPhong NVARCHAR(50) NOT NULL,
	Gia INT NOT NULL,
	Anh NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE Phong (
	MaPhong VARCHAR(10) PRIMARY KEY,
	TenPhong NVARCHAR(20) NOT NULL,
	MaLoaiPhong VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES LOAIPHONG(MaLoaiPhong),
	TrangThai BIT NOT NULL,
)
GO
CREATE TABLE LoaiDichVu(
	MaLDV VARCHAR(10) PRIMARY KEY,
	TenLDV NVARCHAR(30) NOT NULL,		
)
GO
CREATE TABLE DichVu (
	MaDV VARCHAR(10) PRIMARY KEY,
	TenDV NVARCHAR(50) NOT NULL,
	MaLDV VARCHAR(10) FOREIGN KEY REFERENCES LoaiDichVu(MaLDV),
	Gia INT NOT NULL,
	TonKho INT NOT NULL,
	DonVi NVARCHAR(50) NOT NULL,
	Anh NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE HoaDonDichVu(
	MaHDDV VARCHAR(10)NOT NULL,
	MaPhong VARCHAR(10) FOREIGN KEY REFERENCES Phong(MaPhong),
	MaNV VARCHAR(10) FOREIGN KEY REFERENCES NhanVien(MaNV),			
    MaKH VARCHAR(10) FOREIGN KEY REFERENCES KhachHang(MaKH),
	MaDV VARCHAR(10) FOREIGN KEY REFERENCES DichVu(MaDV),
	NgayDat DATE NOT NULL,
	SoLuong INT NOT NULL,
	PRIMARY KEY(MaHDDV,MaDV)
)
GO
CREATE TABLE HoaDonDatPhong (
	MaDatPhong VARCHAR(10) NOT NULL,
	MaNV VARCHAR(10) FOREIGN KEY REFERENCES NhanVien(MaNV),
    MaKH VARCHAR(10) FOREIGN KEY REFERENCES KhachHang(MaKH),
	MaPhong VARCHAR(10) FOREIGN KEY REFERENCES Phong(MaPhong),
    NgayDat DATE NOT NULL,
    NgayVao DATE NOT NULL,
    NgayRa DATE NOT NULL,
	ThanhToan BIT NOT NULL,
	PRIMARY KEY(MaDatPhong,MaPhong)
);

INSERT INTO NhanVien VALUES
('NV001',N'Nguyễn',N'Thị Huệ','1999-01-10',N'Nữ',N'Nha Trang, Khánh Hòa','0956271621',6000000,'nhanvien1','nv111'),
('NV002',N'Huỳnh',N'Thu Liễu','1999-01-10',N'Nữ',N'Vạn Ninh, Khánh Hòa','0987617265',6000000,null,null),
('NV003',N'Trần',N'Anh Quốc','1999-01-10',N'Nam',N'Nha Trang, Khánh Hòa','0998327265',6200000,null,null),
('NV004',N'Trần',N'Thu Trang','1999-01-10',N'Nữ',N'Cam Ranh, Khánh Hòa','0118217265',6100000,null,null),
('NV005',N'Nguyễn',N'Bảo Việt','1999-01-10',N'Nam',N'Nha Trang, Khánh Hòa','0987675415',6500000,null,null)

INSERT INTO KhachHang VALUES
('KH001',N'Ngô',N'Xuân Huy',     '056209187361',N'Nam','0975615463','xuanhuy123@gmail.com','khachhang1','kh111'),
('KH002',N'Cao',N'Anh Tiến',     '056267465351',N'Nam','0398762465','anhtien123@gmail.com',null,null),
('KH003',N'Huỳnh',N'Hoa Mai',    '056213265742',N'Nữ', '0308654236','hoamai123@gmail.com',null,null),
('KH004',N'Lương',N'Quỳnh Trâm', '056245341454',N'Nữ', '0908865623','quanhtram123@gmail.com',null,null),
('KH005',N'Lương',N'Văn Linh',   '056264645644',N'Nam','0964976137','vanlinh123@gmail.com',null,null),
('KH006',N'Huỷnh',N'Thủy Tiên',  '056273156443',N'Nữ', '0363458675','thuytien123@gmail.com',null,null),
('KH007',N'Lê',N'Anh Phú',       '056287689445',N'Nam','0365987312','anhphu123@gmail.com',null,null),
('KH008',N'Nguyễn',N'Xuân Quỳnh','056265344547',N'Nữ', '0953647631','xuanquynh123@gmail.com',null,null),
('KH009',N'Phùng',N'Anh Tú',     '056278614654',N'Nam','0975897566','anhtu123@gmail.com',null,null),
('KH010',N'Ngô',N'Mai Trinh',    '056212475625',N'Nữ', '0979463446','maitrinh123@gmail.com',null,null),
('KH011',N'Nguyễn',N'Thành Vinh','056298364544',N'Nam','0979876468','thanhvinh123@gmail.com',null,null),
('KH012',N'Nguyễn',N'Văn Thành', '056286545625',N'Nam','0975615463','vanthanh123@gmail.com',null,null),
('KH013',N'Ngô',N'Xuân Huy',     '056209187361',N'Nam','0320979382','xuanhuy123@gmail.com',null,null),
('KH014',N'Cao',N'Anh Tiến',     '056272133212',N'Nam','0827382173','anhtien123@gmail.com',null,null),
('KH015',N'Huỳnh',N'Đan Thi',    '056243242324',N'Nữ', '0923023322','danthi123@gmail.com',null,null),
('KH016',N'Lương',N'Thanh thư', '056291283072',N'Nữ', '0392016322','thanhthu123@gmail.com',null,null),
('KH017',N'Lương',N'Văn Nhân',   '056921830918',N'Nam','0931023822','vannhan123@gmail.com',null,null),
('KH018',N'Huỳnh',N'Thúy Nhi',  '056398127391',N'Nữ', '0387216832','thuynhi123@gmail.com',null,null),
('KH019',N'Lê',N'Anh Huy',       '056231023612',N'Nam','0920391233','anhuy123@gmail.com',null,null),
('KH020',N'Nguyễn',N'Xuân Huy','056333392835',N'Nữ', '0812731212','xuanqhuy123@gmail.com',null,null),
('KH021',N'Phùng',N'Anh Quân',     '056232195321',N'Nam','0832713781','anhquan123@gmail.com',null,null),
('KH022',N'Ngô',N'Mai Tuyết',    '056123791232',N'Nữ', '0981273121','maituyet123@gmail.com',null,null),
('KH023',N'Nguyễn',N'Thành Quang','056391203721',N'Nam','0318238123','thanhQuang123@gmail.com',null,null),
('KH024',N'Nguyễn',N'Văn Nhân', '056290127312',N'Nam','0538214312','vannhan123@gmail.com',null,null),
('KH026',N'Ngô',N'Xuân Lâm',     '056398023223',N'Nam','0039210191','xuanlam123@gmail.com',null,null),
('KH027',N'Nguyễn',N'Anh Tiến',  '056333283223',N'Nam','0082721233','anhtien123@gmail.com',null,null),
('KH028',N'Huỳnh',N'Hoa Liễu',   '056982132332',N'Nữ', '0353722911','hoalieu123@gmail.com',null,null),
('KH029',N'Lương',N'Quỳnh Mai',  '056983794327',N'Nữ', '0943043223','quanhmai123@gmail.com',null,null),
('KH030',N'Lương',N'Văn Lâm',    '056264645644',N'Nam','0612372117','vanlam123@gmail.com',null,null)

INSERT INTO LoaiPhong VALUES
('LP001',N'Phòng Đơn',200000,'phongdon.jpg'),
('LP002',N'Phòng Đôi',300000,'phongdoi.jpg'),
('LP003',N'Phòng VIP',500000,'phongvip.jpg')

INSERT INTO Phong VALUES
('P101',N'Phòng 101','LP001',0),
('P102',N'Phòng 102','LP001',0),
('P103',N'Phòng 103','LP001',1),
('P104',N'Phòng 104','LP001',1),
('P105',N'Phòng 105','LP001',0),
('P106',N'Phòng 106','LP001',0),
('P201',N'Phòng 201','LP002',1),
('P202',N'Phòng 202','LP002',1),
('P203',N'Phòng 203','LP002',1),
('P204',N'Phòng 204','LP002',1),
('P205',N'Phòng 206','LP002',0),
('P206',N'Phòng 207','LP002',0),
('P301',N'Phòng 301','LP003',1),
('P302',N'Phòng 302','LP003',1),
('P303',N'Phòng 303','LP003',0),
('P304',N'Phòng 304','LP003',1),
('P305',N'Phòng 305','LP003',0),
('P306',N'Phòng 306','LP003',0),
('P401',N'Phòng 401','LP002',0),
('P402',N'Phòng 402','LP002',0),
('P403',N'Phòng 403','LP002',0),
('P404',N'Phòng 404','LP002',0),
('P405',N'Phòng 405','LP002',0),
('P406',N'Phòng 406','LP002',0),
('P501',N'Phòng 501','LP001',0),
('P502',N'Phòng 502','LP001',0),
('P503',N'Phòng 503','LP001',0),
('P504',N'Phòng 504','LP001',0),
('P505',N'Phòng 505','LP001',0),
('P506',N'Phòng 506','LP001',0)

INSERT INTO LoaiDichVu VALUES
('LDV001',N'Thức Ăn'),
('LDV002',N'Thức uống')

INSERT INTO DichVu VALUES
('DV001',N'Pizza chay',   'LDV001',100000,10,N'Cái','pizzachay.jpg'),
('DV002',N'Pizza Hải Sản','LDV001',150000,12,N'Cái','pizzahaisan.jpg'),
('DV003',N'Bia',          'LDV002',30000, 100,N'Lon','bia.jpg'),
('DV004',N'Cocacola',     'LDV002',10000, 10,N'Lon', 'cocacola.jpg'),
('DV005',N'Rượu',         'LDV002',200000,10,N'Chai','ruou.jpg')

INSERT INTO HoaDonDichVu VALUES
('HDDV001','P101','NV002','KH004','DV001','2023-10-11',2),
('HDDV002','P301','NV001','KH001','DV001','2023-10-13',2),
('HDDV002','P301','NV001','KH001','DV002','2023-10-13',2),
('HDDV004','P101','NV005','KH005','DV002','2023-10-27',2),
('HDDV005','P101','NV002','KH002','DV005','2023-10-08',2),
('HDDV006','P101','NV003','KH003','DV003','2023-09-11',2)

INSERT INTO HoaDonDatPhong VALUES
('HDDP001','NV001','KH001','P101','2023-10-13','2023-10-13','2023-10-15',0),
('HDDP001','NV001','KH001','P102','2023-10-13','2023-10-13','2023-10-15',0),
('HDDP002','NV002','KH003','P104','2023-10-13','2023-10-13','2023-10-18',1),
('HDDP003','NV002','KH005','P201','2023-11-13','2023-11-13','2023-11-15',1),
('HDDP003','NV002','KH005','P304','2023-11-13','2023-11-13','2023-11-15',1),
('HDDP004','NV003','KH004','P301','2023-10-18','2023-10-18','2023-10-20',1),
('HDDP005','NV004','KH001','P101','2023-12-10','2023-12-13','2023-12-20',1),
('HDDP006','NV005','KH006','P301','2023-11-27','2023-11-27','2023-11-28',1),
('HDDP006','NV005','KH006','P302','2023-11-27','2023-11-27','2023-11-28',1),
('HDDP007','NV003','KH004','P306','2023-10-18','2023-10-18','2023-10-20',1),
('HDDP008','NV004','KH030','P401','2023-12-10','2023-12-13','2023-12-20',1),
('HDDP009','NV005','KH028','P501','2023-11-27','2023-11-27','2023-11-28',1),
('HDDP010','NV005','KH029','P402','2023-11-27','2023-11-27','2023-11-28',1),
('HDDP011','NV003','KH004','P306','2023-10-18','2023-10-18','2023-10-20',1),
('HDDP012','NV004','KH030','P401','2023-12-10','2023-12-13','2023-12-20',1),
('HDDP013','NV001','KH013','P506','2023-11-27','2023-11-27','2023-11-28',1),
('HDDP014','NV001','KH012','P403','2023-11-27','2023-11-27','2023-11-28',1)

--drop database Project_63132204

GO
CREATE PROCEDURE NhanVien_TimKiem
    @MaNV VARCHAR(10)=NULL,
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
IF @MaNV IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaNV LIKE ''%'+@MaNV+'%'')
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
    @MaKH VARCHAR(10)=NULL,
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
IF @MaKH IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaKH LIKE ''%'+@MaKH+'%'')
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