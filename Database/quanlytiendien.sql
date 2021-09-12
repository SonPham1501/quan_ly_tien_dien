-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 02, 2020 lúc 04:05 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlytiendien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chisodiencu`
--

CREATE TABLE `chisodiencu` (
  `MaKH` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã khách hàng',
  `chisocu` int(11) NOT NULL COMMENT 'Chỉ số điện cũ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chisodiencu`
--

INSERT INTO `chisodiencu` (`MaKH`, `chisocu`) VALUES
('duong', 50),
('son', 600);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã hóa đơn',
  `MaKH` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã khách hàng',
  `NgayPhaiThanhToan` date NOT NULL COMMENT 'Ngày phải thanh toán',
  `NgayThanhToan` date NOT NULL COMMENT 'Ngày thanh toán',
  `ChiSoCu` int(11) NOT NULL COMMENT 'Chỉ số cũ',
  `ChiSoMoi` int(11) NOT NULL COMMENT 'Chỉ số mới',
  `SoKwh` int(11) NOT NULL COMMENT 'Số kwh',
  `SoTien/Kwh` int(11) NOT NULL COMMENT 'Số tiền trên 1 Kwh',
  `TongTien` bigint(11) NOT NULL COMMENT 'Tổng tiền cần thanh toán',
  `TrangThai` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Trạng thái đã thanh toán hay chưa thanh toán'
) ;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaKH`, `NgayPhaiThanhToan`, `NgayThanhToan`, `ChiSoCu`, `ChiSoMoi`, `SoKwh`, `SoTien/Kwh`, `TongTien`, `TrangThai`) VALUES
('1', 'duong', '2020-05-01', '2020-04-30', 0, 30, 30, 3000, 90000, 'Đã đóng'),
('10', 'son', '2020-03-01', '2020-04-27', 325, 400, 75, 3000, 225000, 'Đã đóng'),
('11', 'son', '2020-04-01', '2020-05-01', 400, 450, 50, 3000, 150000, 'Đã đóng'),
('12', 'son', '2020-05-01', '0000-00-00', 450, 600, 150, 3000, 450000, 'Chưa đóng'),
('2', 'duong', '2020-06-01', '2020-04-30', 30, 50, 20, 3000, 60000, 'Đã đóng'),
('3', 'son', '2019-08-01', '2020-04-27', 0, 50, 50, 3000, 150000, 'Đã đóng'),
('4', 'son', '2019-09-01', '2020-04-27', 50, 100, 50, 3000, 150000, 'Đã đóng'),
('5', 'son', '2019-10-01', '2020-04-27', 100, 120, 20, 3000, 60000, 'Đã đóng'),
('6', 'son', '2019-11-01', '2020-04-27', 120, 150, 30, 3000, 90000, 'Đã đóng'),
('7', 'son', '2019-12-01', '2020-04-27', 150, 250, 100, 3000, 300000, 'Đã đóng'),
('8', 'son', '2020-01-01', '2020-04-27', 250, 300, 50, 3000, 150000, 'Đã đóng'),
('9', 'son', '2020-02-01', '2020-04-27', 300, 325, 25, 3000, 75000, 'Đã đóng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã khách hàng',
  `TenKH` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên khách hàng',
  `NgaySinh` date NOT NULL COMMENT 'Ngày sinh',
  `Email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ',
  `SDT` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại',
  `MaThe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã thẻ ngân hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `NgaySinh`, `Email`, `DiaChi`, `SDT`, `MaThe`) VALUES
('duong', 'Đỗ Cảnh Dương', '1995-02-15', 'duonghanu789@gmail.com', 'Nam Định', '1312312312', '123'),
('son', 'Phạm Thế Sơn', '1999-01-15', 'bomditimvk02@gmail.com', 'Nam Định', '1312313', '23');

--
-- Bẫy `khachhang`
--
DELIMITER $$
CREATE TRIGGER `delete_kh_user` AFTER DELETE ON `khachhang` FOR EACH ROW DELETE FROM user WHERE userID = OLD.MaKH
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_Thongtinthe_kh` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO thongtinthe VALUES(NEW.MaThe,NEW.TenKH,NEW.NgaySinh,NEW.DiaChi, NEW.SDT)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_kh_Chisodiencu` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO chisodiencu VALUES(NEW.MaKH,0)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_kh_user` AFTER INSERT ON `khachhang` FOR EACH ROW INSERT INTO user VALUES(NEW.MaKH,NEW.MaKH,NEW.TenKH,'KH')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_kh_user` AFTER UPDATE ON `khachhang` FOR EACH ROW UPDATE user SET userID = NEW.MaKH, PASSWORD = NEW.MaKH , name = NEW.TenKH WHERE userID = OLD.MaKH
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quanly`
--

CREATE TABLE `quanly` (
  `MaQL` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã quản lý',
  `TenQL` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên quản lý',
  `NgaySinh` date NOT NULL COMMENT 'Ngày sinh',
  `DiaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ',
  `SDT` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `quanly`
--

INSERT INTO `quanly` (`MaQL`, `TenQL`, `NgaySinh`, `DiaChi`, `SDT`) VALUES
('ADMIN', 'Phạm Thế Sơn', '1999-01-15', 'Nam Định', '2312234234');

--
-- Bẫy `quanly`
--
DELIMITER $$
CREATE TRIGGER `delete_ql_user` AFTER DELETE ON `quanly` FOR EACH ROW DELETE FROM user WHERE userID=OLD.MaQL
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_ql_user` AFTER INSERT ON `quanly` FOR EACH ROW INSERT INTO user VALUES(NEW.MaQL,NEW.MaQL,NEW.TenQL,'QL')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_ql_user` AFTER UPDATE ON `quanly` FOR EACH ROW UPDATE user set userID = NEW.MaQL, PASSWORD = NEW.MaQL WHERE userID = OLD.MaQL
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoannganhang`
--

CREATE TABLE `taikhoannganhang` (
  `MaThe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã thẻ',
  `MatKhau` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu',
  `TenChuThe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chủ thẻ',
  `TongTien` int(11) NOT NULL COMMENT 'Tổng số tiền trong thẻ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoannganhang`
--

INSERT INTO `taikhoannganhang` (`MaThe`, `MatKhau`, `TenChuThe`, `TongTien`) VALUES
('123', '123', 'Đỗ Cảnh Dương', 550008),
('23', '23', 'Phạm Thế Sơn', 550008);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtinthe`
--

CREATE TABLE `thongtinthe` (
  `MaThe` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã thẻ ngân hàng',
  `TenChuThe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chủ thẻ',
  `NgaySinh` date NOT NULL COMMENT 'Ngày sinh',
  `DiaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ',
  `SDT` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongtinthe`
--

INSERT INTO `thongtinthe` (`MaThe`, `TenChuThe`, `NgaySinh`, `DiaChi`, `SDT`) VALUES
('123', 'Đỗ Cảnh Dương', '1995-02-15', 'Nam Định', '1312312312'),
('23', 'Phạm Thế Sơn', '1999-01-15', 'Nam Định', '1312313');

--
-- Bẫy `thongtinthe`
--
DELIMITER $$
CREATE TRIGGER `insert_TaikhoanNganKhang_thongtin` AFTER INSERT ON `thongtinthe` FOR EACH ROW INSERT INTO taikhoannganhang VALUES(NEW.MaThe,NEW.MaThe,NEW.TenChuThe,0)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthaisodien`
--

CREATE TABLE `trangthaisodien` (
  `SoTien/Kwh` int(11) NOT NULL COMMENT 'Só tiền trên 1 kwwh'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trangthaisodien`
--

INSERT INTO `trangthaisodien` (`SoTien/Kwh`) VALUES
(3000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên tài khoản',
  `passWord` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phân quyền'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userID`, `passWord`, `name`, `role`) VALUES
('ADMIN', '$2y$10$i2ZWSavm2T6D7zm8PI3Aj.8f1Zs.3kE.YXfqNhaGxIDswg0eEKtsW', 'Phạm Thế Sơn', 'QL'),
('duong', '$2y$10$T1UEX9BI0JoiHkRQUtHUveNRfTYTNZlatrE3sfIjaS2bAX6ZEMI0i', 'Đỗ Cảnh Dương', 'KH'),
('son', '$2y$10$jvaAS0cudA0x4WVOmrkHtu.e8JtC4MH8zNmRD6KuaGkV0IesgFV0K', 'Phạm Thế Sơn', 'KH');

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
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `Số tiền/ Kwh` (`SoTien/Kwh`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `MaThe_2` (`MaThe`),
  ADD KEY `MaThe` (`MaThe`);

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
-- Chỉ mục cho bảng `thongtinthe`
--
ALTER TABLE `thongtinthe`
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
  ADD PRIMARY KEY (`userID`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chisodiencu`
--
ALTER TABLE `chisodiencu`
  ADD CONSTRAINT `chisodiencu_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `taikhoannganhang`
--
ALTER TABLE `taikhoannganhang`
  ADD CONSTRAINT `taikhoannganhang_ibfk_1` FOREIGN KEY (`MaThe`) REFERENCES `thongtinthe` (`MaThe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thongtinthe`
--
ALTER TABLE `thongtinthe`
  ADD CONSTRAINT `thongtinthe_ibfk_1` FOREIGN KEY (`MaThe`) REFERENCES `khachhang` (`MaThe`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
