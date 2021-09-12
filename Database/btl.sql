-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2020 lúc 04:58 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `btl`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chisodiencu`
--

CREATE TABLE `chisodiencu` (
  `MaKH` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ChiSoCu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chisodiencu`
--

INSERT INTO `chisodiencu` (`MaKH`, `ChiSoCu`) VALUES
('1', 290),
('2', 900);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `MaKH` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NgayPhaiThanhToan` date NOT NULL,
  `NgayThanhToan` date DEFAULT NULL,
  `ChiSoCu` int(11) NOT NULL,
  `ChiSoMoi` int(11) NOT NULL,
  `SoKwh` int(11) NOT NULL,
  `SoTien/Kwh` int(11) NOT NULL,
  `TongTien` bigint(20) NOT NULL,
  `TrangThai` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaKH`, `NgayPhaiThanhToan`, `NgayThanhToan`, `ChiSoCu`, `ChiSoMoi`, `SoKwh`, `SoTien/Kwh`, `TongTien`, `TrangThai`) VALUES
('11', '1', '2020-12-14', '0000-00-00', 200, 200, 0, 6000, 0, 'Chưa đóng'),
('12', '1', '2020-12-15', '0000-00-00', 200, 220, 20, 6000, 120000, 'Chưa đóng'),
('13', '1', '2020-12-15', '0000-00-00', 220, 290, 70, 6400, 448000, 'Chưa đóng'),
('2', '1', '2020-12-14', '2020-12-14', 50, 120, 70, 6500, 455000, 'Đã đóng'),
('25', '1', '2020-12-14', '0000-00-00', 170, 200, 30, 6500, 195000, 'Chưa đóng'),
('3', '1', '2020-12-14', '0000-00-00', 120, 130, 10, 6500, 65000, 'Chưa đóng'),
('4', '1', '2020-12-14', '0000-00-00', 130, 140, 10, 6500, 65000, 'Chưa đóng'),
('5', '1', '2020-12-14', '0000-00-00', 140, 150, 10, 6500, 65000, 'Chưa đóng'),
('6', '1', '2020-12-14', '0000-00-00', 150, 170, 20, 6500, 130000, 'Chưa đóng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã khách hàng',
  `TenKH` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `MaThe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `NgheNgiep` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `NgaySinh`, `Email`, `DiaChi`, `SDT`, `MaThe`, `NgheNgiep`) VALUES
('1', 'Phạm Thế Sơn', '1999-01-15', 'bomditimvk02@gmail.com', 'Nam Định', 'SV', '123', 'SV'),
('2', 'Đỗ Cảnh Dương', '1995-12-12', 'duonghanu789@gmail.com', 'Nam Định', '0886417564', '12', 'Công chức');

--
-- Bẫy `khachhang`
--
DELIMITER $$
CREATE TRIGGER `delete_kh_user` AFTER DELETE ON `khachhang` FOR EACH ROW DELETE FROM User WHERE UserID = OLD.MaKH
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_Thongtinthe_kh` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO TaiKhoanNganHang VALUES(NEW.MaThe,NEW.MaThe,NEW.TenKH,0)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_kh_Chisodiencu` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO ChiSoDienCu VALUES(NEW.MaKH,0)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_kh_user` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO User VALUES(NEW.MaKH,NEW.MaKH,NEW.TenKH,'KH')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_kh_user` AFTER UPDATE ON `khachhang` FOR EACH ROW UPDATE User SET UserID = NEW.MaKH, PassWord = NEW.MaKH , Name = NEW.TenKH WHERE UserID = OLD.MaKH
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maxsodien`
--

CREATE TABLE `maxsodien` (
  `NgheNghiep` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maxsodien` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quangcao`
--

CREATE TABLE `quangcao` (
  `ID` int(11) NOT NULL,
  `HinhAnh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NoiDung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quangcao`
--

INSERT INTO `quangcao` (`ID`, `HinhAnh`, `NoiDung`) VALUES
(1, 'https://baitapcnw.000webhostapp.com/HinhAnh/QuangCao/hinhfacebook.jpg', 'Bạn trải nghiệm thử facebook chưa'),
(2, 'https://baitapcnw.000webhostapp.com/HinhAnh/QuangCao/Lamborghini19.jpg', 'Sang trọng quyến rũ và đầy tinh tế'),
(3, 'https://baitapcnw.000webhostapp.com/HinhAnh/QuangCao/hoanghon', 'Youtube nơi giải trí cuối ngày');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quanly`
--

CREATE TABLE `quanly` (
  `MaQL` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `TenQL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SDT` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quanly`
--

INSERT INTO `quanly` (`MaQL`, `TenQL`, `NgaySinh`, `DiaChi`, `SDT`) VALUES
('ADMIN', 'ADMIN', '1999-01-15', 'Nam Định', '22656644');

--
-- Bẫy `quanly`
--
DELIMITER $$
CREATE TRIGGER `delete_ql_user` AFTER DELETE ON `quanly` FOR EACH ROW DELETE FROM User WHERE UserID=OLD.MaQL
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_ql_user` AFTER INSERT ON `quanly` FOR EACH ROW INSERT INTO User VALUES(NEW.MaQL,NEW.MaQL,NEW.TenQL,'QL')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_ql_user` AFTER UPDATE ON `quanly` FOR EACH ROW UPDATE User set UserID = NEW.MaQL, PassWord = NEW.MaQL WHERE UserID = OLD.MaQL
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoannganhang`
--

CREATE TABLE `taikhoannganhang` (
  `MaThe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TenChuThe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TongTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoannganhang`
--

INSERT INTO `taikhoannganhang` (`MaThe`, `MatKhau`, `TenChuThe`, `TongTien`) VALUES
('12', '12', 'Đỗ Cảnh Dương', 991946500),
('123', '123', 'Phạm Thế Sơn', 991946500);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthaisodien`
--

CREATE TABLE `trangthaisodien` (
  `SoTien/Kwh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trangthaisodien`
--

INSERT INTO `trangthaisodien` (`SoTien/Kwh`) VALUES
(6000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `UserID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `PassWord` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Role` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`UserID`, `PassWord`, `Name`, `Role`) VALUES
('1', '1', 'Phạm Thế Sơn', 'KH'),
('2', '2', 'Đỗ Cảnh Dương', 'KH'),
('ADMIN', '1', 'ADMIN', 'QL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `uudai`
--

CREATE TABLE `uudai` (
  `ID` int(11) NOT NULL,
  `HinhAnh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NoiDung` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `uudai`
--

INSERT INTO `uudai` (`ID`, `HinhAnh`, `NoiDung`) VALUES
(1, 'https://baitapcnw.000webhostapp.com/HinhAnh/UuDai/macbookpro.jpg', 'Trúng thưởng MacBook Pro 2020'),
(2, 'https://baitapcnw.000webhostapp.com/HinhAnh/UuDai/trungtamthuongmai.jpg', 'Giảm 20% khi sử dụng dịch vụ tại Pamson Plaza'),
(3, 'https://baitapcnw.000webhostapp.com/HinhAnh/UuDai/pizza.jpg', 'Giảm 50.000 tại PIZZA KingDom'),
(4, 'https://baitapcnw.000webhostapp.com/HinhAnh/UuDai/monan.jpg', 'Tặng món chính tại Bản sắc dân tộc Việt Nam');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chisodiencu`
--
ALTER TABLE `chisodiencu`
  ADD PRIMARY KEY (`MaKH`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD KEY `MaThe` (`MaThe`);

--
-- Chỉ mục cho bảng `maxsodien`
--
ALTER TABLE `maxsodien`
  ADD PRIMARY KEY (`NgheNghiep`);

--
-- Chỉ mục cho bảng `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `quanly`
--
ALTER TABLE `quanly`
  ADD PRIMARY KEY (`MaQL`);

--
-- Chỉ mục cho bảng `taikhoannganhang`
--
ALTER TABLE `taikhoannganhang`
  ADD PRIMARY KEY (`MaThe`);

--
-- Chỉ mục cho bảng `trangthaisodien`
--
ALTER TABLE `trangthaisodien`
  ADD PRIMARY KEY (`SoTien/Kwh`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Chỉ mục cho bảng `uudai`
--
ALTER TABLE `uudai`
  ADD PRIMARY KEY (`ID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chisodiencu`
--
ALTER TABLE `chisodiencu`
  ADD CONSTRAINT `ChiSoDienCu_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `HoaDon_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `taikhoannganhang`
--
ALTER TABLE `taikhoannganhang`
  ADD CONSTRAINT `TaiKhoanNganHang_ibfk_1` FOREIGN KEY (`MaThe`) REFERENCES `khachhang` (`MaThe`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
