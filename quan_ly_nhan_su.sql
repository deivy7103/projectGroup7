-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2025 lúc 07:52 PM
-- Phiên bản máy phục vụ: 11.7.2-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quan_ly_nhan_su`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_chamcong`
--
-- new DatA
CREATE TABLE `qlnv_chamcong` (
  `id` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `Ngay` date NOT NULL,
  `GioVao` time NOT NULL,
  `GioRa` time NOT NULL,
  `OT` tinyint(1) NOT NULL,
  `ThoiGianLamViec` time NOT NULL,
  `ThoiGian_thap_phan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_chamcong`
--

INSERT INTO `qlnv_chamcong` (`id`, `MaNV`, `Ngay`, `GioVao`, `GioRa`, `OT`, `ThoiGianLamViec`, `ThoiGian_thap_phan`) VALUES
(77, 'NV004', '2025-03-29', '16:57:35', '16:57:49', 0, '00:00:14', 0),
(78, 'NV001', '2025-04-03', '20:33:43', '20:54:58', 0, '00:21:15', 0.4),
(79, 'NV004', '2025-04-03', '21:21:01', '21:34:33', 0, '00:13:32', 0.2),
(80, 'NV004', '2025-04-10', '13:59:50', '13:59:52', 0, '00:00:02', 0);

--
-- Bẫy `qlnv_chamcong`
--
DELIMITER $$
CREATE TRIGGER `before_insert_to_cham_cong` BEFORE INSERT ON `qlnv_chamcong` FOR EACH ROW BEGIN
       		IF (NEW.GioRa > NEW.GioVao) THEN
           		SET NEW.ThoiGianLamViec = TIMEDIFF(NEW.GioRa,NEW.GioVao);
                SET NEW.ThoiGian_thap_phan =   ROUND(CAST(LEFT(NEW.ThoiGianLamViec, 2) AS int) +
    CAST(SUBSTRING(NEW.ThoiGianLamViec, 4, 2) AS int) / 60.0 +
    CAST(SUBSTRING(NEW.ThoiGianLamViec, 7, 2) AS int) / (60.0*60.0),1);
            ELSE
            	SET NEW.ThoiGianLamViec = 0;
                SET NEW.ThoiGian_thap_phan = 0;
            END IF;
       END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_to_cham_cong` BEFORE UPDATE ON `qlnv_chamcong` FOR EACH ROW BEGIN
       		IF (NEW.GioRa > NEW.GioVao) THEN
           		SET NEW.ThoiGianLamViec = TIMEDIFF(NEW.GioRa,NEW.GioVao);
                SET NEW.ThoiGian_thap_phan =   ROUND(CAST(LEFT(NEW.ThoiGianLamViec, 2) AS int) +
    CAST(SUBSTRING(NEW.ThoiGianLamViec, 4, 2) AS int) / 60.0 +
    CAST(SUBSTRING(NEW.ThoiGianLamViec, 7, 2) AS int) / (60.0*60.0),1);
            ELSE
            	SET NEW.ThoiGianLamViec = 0;
                SET NEW.ThoiGian_thap_phan = 0;
            END IF;
       END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_chamcongngay`
--

CREATE TABLE `qlnv_chamcongngay` (
  `MaChamCong` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `Nam` year(4) NOT NULL DEFAULT current_timestamp(),
  `Thang` int(11) NOT NULL,
  `SoNgayThang` int(11) NOT NULL,
  `Ngay1` float NOT NULL DEFAULT -1,
  `Ngay2` float NOT NULL DEFAULT -1,
  `Ngay3` float NOT NULL DEFAULT -1,
  `Ngay4` float NOT NULL DEFAULT -1,
  `Ngay5` float NOT NULL DEFAULT -1,
  `Ngay6` float NOT NULL DEFAULT -1,
  `Ngay7` float NOT NULL DEFAULT -1,
  `Ngay8` float NOT NULL DEFAULT -1,
  `Ngay9` float NOT NULL DEFAULT -1,
  `Ngay10` float NOT NULL DEFAULT -1,
  `Ngay11` float NOT NULL DEFAULT -1,
  `Ngay12` float NOT NULL DEFAULT -1,
  `Ngay13` float NOT NULL DEFAULT -1,
  `Ngay14` float NOT NULL DEFAULT -1,
  `Ngay15` float NOT NULL DEFAULT -1,
  `Ngay16` float NOT NULL DEFAULT -1,
  `Ngay17` float NOT NULL DEFAULT -1,
  `Ngay18` float NOT NULL DEFAULT -1,
  `Ngay19` float NOT NULL DEFAULT -1,
  `Ngay20` float NOT NULL DEFAULT -1,
  `Ngay21` float NOT NULL DEFAULT -1,
  `Ngay22` float NOT NULL DEFAULT -1,
  `Ngay23` float NOT NULL DEFAULT -1,
  `Ngay24` float NOT NULL DEFAULT -1,
  `Ngay25` float NOT NULL DEFAULT -1,
  `Ngay26` float NOT NULL DEFAULT -1,
  `Ngay27` float NOT NULL DEFAULT -1,
  `Ngay28` float NOT NULL DEFAULT -1,
  `Ngay29` float NOT NULL DEFAULT -1,
  `Ngay30` float NOT NULL DEFAULT -1,
  `Ngay31` float NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_chamcongngay`
--

INSERT INTO `qlnv_chamcongngay` (`MaChamCong`, `MaNV`, `Nam`, `Thang`, `SoNgayThang`, `Ngay1`, `Ngay2`, `Ngay3`, `Ngay4`, `Ngay5`, `Ngay6`, `Ngay7`, `Ngay8`, `Ngay9`, `Ngay10`, `Ngay11`, `Ngay12`, `Ngay13`, `Ngay14`, `Ngay15`, `Ngay16`, `Ngay17`, `Ngay18`, `Ngay19`, `Ngay20`, `Ngay21`, `Ngay22`, `Ngay23`, `Ngay24`, `Ngay25`, `Ngay26`, `Ngay27`, `Ngay28`, `Ngay29`, `Ngay30`, `Ngay31`) VALUES
(52, 'NV004', '2025', 3, 31, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1),
(53, 'NV001', '2025', 4, 30, -1, -1, 0.4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
(54, 'NV004', '2025', 4, 30, -1, -1, 0.2, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_chamcongthang`
--

CREATE TABLE `qlnv_chamcongthang` (
  `id` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `Nam` year(4) NOT NULL DEFAULT current_timestamp(),
  `T1` float NOT NULL DEFAULT -1,
  `T2` float NOT NULL DEFAULT -1,
  `T3` float NOT NULL DEFAULT -1,
  `T4` float NOT NULL DEFAULT -1,
  `T5` float NOT NULL DEFAULT -1,
  `T6` float NOT NULL DEFAULT -1,
  `T7` float NOT NULL DEFAULT -1,
  `T8` float NOT NULL DEFAULT -1,
  `T9` float NOT NULL DEFAULT -1,
  `T10` float NOT NULL DEFAULT -1,
  `T11` float NOT NULL DEFAULT -1,
  `T12` float NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_chamcongthang`
--

INSERT INTO `qlnv_chamcongthang` (`id`, `MaNV`, `Nam`, `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7`, `T8`, `T9`, `T10`, `T11`, `T12`) VALUES
(28, 'NV004', '2025', -1, -1, 0, 0.2, -1, -1, -1, -1, -1, -1, -1, -1),
(29, 'NV001', '2025', -1, -1, -1, 0.4, -1, -1, -1, -1, -1, -1, -1, -1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_chamcongtongketthang`
--

CREATE TABLE `qlnv_chamcongtongketthang` (
  `Id` int(11) NOT NULL,
  `MaNhanVien` varchar(8) NOT NULL,
  `Nam` year(4) NOT NULL,
  `Thang` int(11) NOT NULL,
  `SoNgayDiLam` int(11) NOT NULL DEFAULT 0,
  `SoNgayDiVang` int(11) NOT NULL DEFAULT 0,
  `SoNgayTangCa` int(11) NOT NULL DEFAULT 0,
  `TongSoNgay` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_chamcongtongketthang`
--

INSERT INTO `qlnv_chamcongtongketthang` (`Id`, `MaNhanVien`, `Nam`, `Thang`, `SoNgayDiLam`, `SoNgayDiVang`, `SoNgayTangCa`, `TongSoNgay`) VALUES
(29, 'NV004', '2025', 3, 1, 25, 0, 1),
(30, 'NV001', '2025', 4, 1, 25, 0, 1),
(31, 'NV004', '2025', 4, 2, 24, 0, 2);

--
-- Bẫy `qlnv_chamcongtongketthang`
--
DELIMITER $$
CREATE TRIGGER `delete_tongket_luong` BEFORE DELETE ON `qlnv_chamcongtongketthang` FOR EACH ROW BEGIN
    DELETE FROM `qlnv_luong`
    WHERE MaNV = OLD.MaNhanVien AND Nam = OLD.Nam AND Thang = OLD.Thang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_data_tongket_tinh_luong` BEFORE INSERT ON `qlnv_chamcongtongketthang` FOR EACH ROW BEGIN
	DECLARE tongthoigian integer;
    DECLARE luongDuocNhan double;
    DECLARE tongsogiophailam integer;
    DECLARE sotienphat double;
     DECLARE sotienthuong double;
     DECLARE luongCoDinh double;
     DECLARE luongchamcong double;
    SET tongsogiophailam = (NEW.SoNgayDiLam + NEW.SoNgayDiVang) * 8;
    
    IF (NEW.Thang = 1) THEN
    	SET tongthoigian = (SELECT cct.T1 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
    ELSEIF (NEW.Thang = 2) THEN
    	SET tongthoigian = (SELECT cct.T2 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 3) THEN
    	SET tongthoigian = (SELECT cct.T3 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 4) THEN
    	SET tongthoigian = (SELECT cct.T4 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 5) THEN
    	SET tongthoigian = (SELECT cct.T5 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 6) THEN
    	SET tongthoigian = (SELECT cct.T6 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 7) THEN
    	SET tongthoigian = (SELECT cct.T7 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 8) THEN
    	SET tongthoigian = (SELECT cct.T8 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 9) THEN
    	SET tongthoigian = (SELECT cct.T9 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 10) THEN
    	SET tongthoigian = (SELECT cct.T10 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 11) THEN
    	SET tongthoigian = (SELECT cct.T11 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSE
    	SET tongthoigian = (SELECT cct.T12 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	END IF;
    
    
    SET luongCoDinh = (SELECT nv.Luong FROM qlnv_nhanvien nv WHERE nv.MaNhanVien = NEW.MaNhanVien);
    
    
    IF (tongthoigian >= 0.85 * tongsogiophailam) THEN
    	SET luongchamcong = luongCoDinh;
    ELSE 
    	SET luongchamcong = ROUND((tongthoigian * luongCoDinh)/(0.85 * tongsogiophailam),-3);
    END IF;
    
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNhanVien AND MONTH(tp.Ngay) = NEW.Thang
                     AND YEAR(tp.Ngay) = NEW.Nam AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
   
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNhanVien AND MONTH(tp.Ngay) = NEW.Thang
                     AND YEAR(tp.Ngay) = NEW.Nam AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
    
    INSERT INTO `qlnv_luong` (`id`, `MaNV`, `Nam`, `Thang`, `LuongCoDinh`, `LuongChamCong`, `SoTienThuong`, `SoTienPhat`, `TongSoTien`) 
    VALUES (NULL, NEW.MaNhanVien, NEW.Nam, New.Thang, luongCoDinh, luongchamcong, sotienthuong, sotienphat, luongDuocNhan);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_tongketthang_luong` AFTER UPDATE ON `qlnv_chamcongtongketthang` FOR EACH ROW BEGIN
	DECLARE tongthoigian integer;
    DECLARE luongCoDinh double;
    DECLARE tongsogiophailam integer;
    DECLARE sotienphat double;
    DECLARE luongchamcong double;
    DECLARE luongDuocNhan double;
    DECLARE sotienthuong double;
    
    SET tongsogiophailam = (NEW.SoNgayDiLam + NEW.SoNgayDiVang) * 8;
    
    IF (NEW.Thang = 1) THEN
    	SET tongthoigian = (SELECT cct.T1 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
    ELSEIF (NEW.Thang = 2) THEN
    	SET tongthoigian = (SELECT cct.T2 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 3) THEN
    	SET tongthoigian = (SELECT cct.T3 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 4) THEN
    	SET tongthoigian = (SELECT cct.T4 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 5) THEN
    	SET tongthoigian = (SELECT cct.T5 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 6) THEN
    	SET tongthoigian = (SELECT cct.T6 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 7) THEN
    	SET tongthoigian = (SELECT cct.T7 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 8) THEN
    	SET tongthoigian = (SELECT cct.T8 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 9) THEN
    	SET tongthoigian = (SELECT cct.T9 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 10) THEN
    	SET tongthoigian = (SELECT cct.T10 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSEIF (NEW.Thang = 11) THEN
    	SET tongthoigian = (SELECT cct.T11 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	ELSE
    	SET tongthoigian = (SELECT cct.T12 FROM qlnv_chamcongthang cct WHERE cct.Nam = NEW.Nam AND NEW.MaNhanVien = cct.MaNV);
	END IF;
    
    
    SET luongCoDinh = (SELECT l.LuongCoDinh FROM qlnv_luong l WHERE NEW.MaNhanVien = l.MaNV AND NEW.Nam = l.Nam AND New.Thang = l.Thang);
    
    
    IF (tongthoigian >= 0.85 * tongsogiophailam) THEN
    	SET luongchamcong = luongCoDinh;
    ELSE 
    	SET luongchamcong = ROUND((tongthoigian * luongCoDinh)/(0.85 * tongsogiophailam),-3);
    END IF;
    
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNhanVien AND MONTH(tp.Ngay) = NEW.Thang
                     AND YEAR(tp.Ngay) = NEW.Nam AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
  
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNhanVien AND MONTH(tp.Ngay) = NEW.Thang
                     AND YEAR(tp.Ngay) = NEW.Nam AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
    
    UPDATE `qlnv_luong`
    SET `LuongChamCong`= luongchamcong, `SoTienThuong` = sotienthuong, `SoTienPhat` = sotienphat, `TongSoTien` = luongDuocNhan
    WHERE MaNV = NEW.MaNhanVien AND Nam = NEW.Nam AND Thang = New.Thang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_chucvu`
--

CREATE TABLE `qlnv_chucvu` (
  `MaCV` varchar(8) NOT NULL,
  `TenCV` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_chucvu`
--

INSERT INTO `qlnv_chucvu` (`MaCV`, `TenCV`) VALUES
('GD', 'Giám đốc'),
('NV', 'Nhân viên'),
('TP', 'Trưởng phòng'),
('TTS', 'Thực tập sinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_congty`
--

CREATE TABLE `qlnv_congty` (
  `ID` int(11) NOT NULL,
  `TenCongTy` varchar(100) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `LogoPath` varchar(100) NOT NULL,
  `SoDienThoai` varchar(11) NOT NULL,
  `MaSoDoanhNghiep` varchar(20) NOT NULL,
  `NgayThanhLap` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_congty`
--

INSERT INTO `qlnv_congty` (`ID`, `TenCongTy`, `DiaChi`, `LogoPath`, `SoDienThoai`, `MaSoDoanhNghiep`, `NgayThanhLap`) VALUES
(1, 'Công ty đa ngành PTIT', 'Km10 Đ. Nguyễn Trãi, P. Mộ Lao, Hà Đông, Hà Nội', 'web/img/favicon.png', '0123456789', '01234543210', '2025-03-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_hopdong`
--

CREATE TABLE `qlnv_hopdong` (
  `id` int(11) NOT NULL,
  `MaHopDong` varchar(8) NOT NULL,
  `LoaiHopDong` varchar(30) NOT NULL,
  `NgayBatDau` date NOT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `GhiChu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_imagedata`
--

CREATE TABLE `qlnv_imagedata` (
  `ID_image` varchar(40) NOT NULL,
  `PathToImage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_imagedata`
--

INSERT INTO `qlnv_imagedata` (`ID_image`, `PathToImage`) VALUES
('Image_Profile_NV000', 'web/img/Image_Profile_NV000.jpg'),
('Image_Profile_NV001', 'web/img/Image_Profile_NV001.jpg'),
('Image_Profile_NV002', 'web/img/Image_Profile_NV002.jpg'),
('Image_Profile_NV003', 'web/img/Image_Profile_NV003.jpg'),
('logo_web', 'web/img/favicon.png'),
('none_image_profile', 'web/img/No_Image.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_luong`
--

CREATE TABLE `qlnv_luong` (
  `id` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `Nam` year(4) NOT NULL,
  `Thang` int(11) NOT NULL,
  `LuongCoDinh` double NOT NULL,
  `LuongChamCong` double NOT NULL,
  `SoTienThuong` double NOT NULL DEFAULT 0,
  `SoTienPhat` double NOT NULL DEFAULT 0,
  `TongSoTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_luong`
--

INSERT INTO `qlnv_luong` (`id`, `MaNV`, `Nam`, `Thang`, `LuongCoDinh`, `LuongChamCong`, `SoTienThuong`, `SoTienPhat`, `TongSoTien`) VALUES
(13, 'NV004', '2025', 3, 5000000, 0, 0, 0, 0),
(14, 'NV001', '2025', 4, 15000000, 0, 0, 0, 0),
(15, 'NV004', '2025', 4, 5000000, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_nhanvien`
--

CREATE TABLE `qlnv_nhanvien` (
  `MaNhanVien` varchar(8) NOT NULL,
  `MaChucVu` varchar(8) NOT NULL,
  `MaPhongBan` varchar(8) NOT NULL,
  `Luong` double NOT NULL,
  `GioiTinh` varchar(4) NOT NULL DEFAULT 'Nam',
  `MaHD` varchar(8) NOT NULL,
  `TenNV` varchar(50) NOT NULL,
  `NgaySinh` date NOT NULL,
  `NoiSinh` varchar(100) NOT NULL,
  `SoCMT` varchar(20) NOT NULL,
  `DienThoai` varchar(20) NOT NULL,
  `DiaChi` varchar(250) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `TTHonNhan` varchar(20) NOT NULL DEFAULT 'Độc thân',
  `DanToc` varchar(10) DEFAULT 'Kinh',
  `MATDHV` varchar(8) DEFAULT NULL,
  `NgayCMND` date DEFAULT NULL,
  `NoiCMND` varchar(50) DEFAULT NULL,
  `BHYT` varchar(15) NOT NULL,
  `BHXH` varchar(15) NOT NULL,
  `ID_profile_image` varchar(40) NOT NULL DEFAULT 'none_image_profile'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_nhanvien`
--

INSERT INTO `qlnv_nhanvien` (`MaNhanVien`, `MaChucVu`, `MaPhongBan`, `Luong`, `GioiTinh`, `MaHD`, `TenNV`, `NgaySinh`, `NoiSinh`, `SoCMT`, `DienThoai`, `DiaChi`, `Email`, `TTHonNhan`, `DanToc`, `MATDHV`, `NgayCMND`, `NoiCMND`, `BHYT`, `BHXH`, `ID_profile_image`) VALUES
('NV000', 'GD', 'PBGD', 50000000, 'Nam', 'HD000', 'Trần Chủ Tịch', '1999-12-12', 'Phú Lạc - Đại Từ - Thái Nguyên', '019204555442', '0336258741', 'Hà Đông - Hà Nội', 'Tichct@gmail.com', 'Độc thân', 'Kinh', 'TS001', '2021-05-21', 'Hà Đông', '0123456445', '01122556998', 'Image_Profile_NV000'),
('NV001', 'NV', 'MPB02', 15000000, 'Nam', 'HD001', 'Hoàng Huy Phong', '2001-03-31', 'Phú Xuyên - Đại Từ - Thái Nguyên', '019204011999', '0333986331', 'Yên Xá - Tân Triều - Thanh Trì - Hà Nội', 'PhongHH@gmail.com', 'Đã kết hôn', 'Kinh', 'TNKHMTTT', '2022-05-14', 'Đại Từ', '0123456789', '01122334455', 'Image_Profile_NV001'),
('NV002', 'GD', 'PBGD', 25000000, 'Nữ', 'HD002', 'Vũ Thanh Vân', '1996-05-12', 'Nguyễn Trãi - Hà Đông - Hà Nội', '019996336552', '0333986442', 'tp Hồ Chí Minh', 'VanVT@gmail.com', 'Độc thân', 'Kinh', 'TS001', '2021-05-14', 'Hà Đông', '0123456798', '01122336622', 'Image_Profile_NV002'),
('NV003', 'NV', 'MPB05', 20000000, 'Nam', 'HD003', 'Nguyễn Đức Cường', '1989-11-12', 'Uông Bí - Quảng Ninh', '019989369852', '0334568923', 'Hạ Long - Quang Ninh', 'denVau@gmail.com', 'Đã kết hôn', 'Tày', 'TNKHMTTT', '2021-06-05', 'Uông Bí', '0123456546', '01122556623', 'Image_Profile_NV003'),
('NV004', 'TTS', 'MPB02', 5000000, 'Nam', 'HD004', 'Nguyễn Quang Huy', '2004-01-07', 'Phú Lạc - Đại Từ - Thái Nguyên', '0192055211999', '0334568745', 'Hà Đông - Hà Nội', 'nguyenquanghuy@gmail.com', 'Độc thân', 'Kinh', 'SV001', '2022-05-21', 'Hà Đông', '0563456445', '01141256623', 'none_image_profile'),
('NV005', 'NV', 'MPB03', 20000000, 'Nữ', 'HD005', 'Nguyễn Minh Ngọc', '2000-06-23', 'Văn Quán - Hà Đông', '019200555685', '0333444555', 'Văn Quán - Hà Đông', 'ngocnm@gmail.com', 'Độc thân', 'Kinh', 'TS001', '2021-05-14', 'Hà Đông', '2255669854', '124587963', 'none_image_profile'),
('NV006', 'NV', 'MPB02', 20000000, 'Nam', 'HD006', 'Nguyễn Minh Nam', '2004-08-12', 'Phú Lạc - Đại Từ - Thái Nguyên', '019274711999', '0385668923', 'Yên Xá - Tân Triều - Thanh Trì - Hà Nội', 'nguyenminhnam@gmail.com', 'Đã kết hôn', 'Kinh', 'SV001', '2021-04-21', 'Đại Từ', '0185456546', '01145636622', 'none_image_profile'),
('NV007', 'TP', 'MPB02', 50000000, 'Nam', 'HD007', 'Hoàng Anh Khoa', '2004-05-14', 'Hoàng Hóa - Thanh Hóa', '019204258963', '0125478963', 'Hà Đông - Hà Nội', 'khoangha@gmail.com', 'Đã kết hôn', 'Kinh', 'TNKHMTTT', '2021-04-21', 'Thanh Hóa', '32145698752', '2541652554', 'none_image_profile');

--
-- Bẫy `qlnv_nhanvien`
--
DELIMITER $$
CREATE TRIGGER `befor_update_nhanvien` BEFORE UPDATE ON `qlnv_nhanvien` FOR EACH ROW BEGIN
    IF NEW.MaChucVu != OLD.MaChucVu THEN
    	UPDATE qlnv_thoigiancongtac tg SET tg.DuongNhiem = 0, tg.NgayKetThuc = CURRENT_DATE() WHERE tg.MaNV = OLD.MaNhanVien AND tg.DuongNhiem = 1;
        INSERT INTO qlnv_thoigiancongtac(MaNV, MaCV, NgayNhanChuc, NgayKetThuc, DuongNhiem) VALUES (OLD.MaNhanVien, NEW.MaChucVu, CURRENT_DATE(), NULL, '1');   	
        
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_phanquyenuser`
--

CREATE TABLE `qlnv_phanquyenuser` (
  `id_user` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_phanquyenuser`
--

INSERT INTO `qlnv_phanquyenuser` (`id_user`, `role_id`) VALUES
(13, 1),
(14, 3),
(17, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_phongban`
--

CREATE TABLE `qlnv_phongban` (
  `MaPB` varchar(8) NOT NULL,
  `TenPB` varchar(50) NOT NULL,
  `diachi` varchar(50) DEFAULT NULL,
  `sodt` varchar(10) DEFAULT NULL,
  `MaTruongPhong` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_phongban`
--

INSERT INTO `qlnv_phongban` (`MaPB`, `TenPB`, `diachi`, `sodt`, `MaTruongPhong`) VALUES
('MPB01', 'Marketing', 'Thanh Xuân - Hà Nội', '096358469', 'MNV10'),
('MPB02', 'Công nghệ thông tin', 'HCM', '096358465', 'MNV24'),
('MPB03', 'Kế toán', 'Hà Nội', '096358461', 'MNV36'),
('MPB04', 'Kiểm toán', 'Hà Nội', '096358467', 'MNN01'),
('MPB05', 'Hành chính', 'Hà Nội', '096358468', 'MNV12'),
('PBGD', 'Quản lý', '502T5 Trường Đại học Khoa học Tự nhiên', '0978836792', 'MNV04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_role`
--

CREATE TABLE `qlnv_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `role_folder` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_role`
--

INSERT INTO `qlnv_role` (`role_id`, `role_name`, `role_folder`) VALUES
(1, 'Admin', ''),
(2, 'Trưởng Phòng', 'tp/'),
(3, 'Nhân Viên', 'user/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_thoigiancongtac`
--

CREATE TABLE `qlnv_thoigiancongtac` (
  `id` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `MaCV` varchar(8) NOT NULL,
  `NgayNhanChuc` date NOT NULL DEFAULT current_timestamp(),
  `NgayKetThuc` date DEFAULT NULL,
  `DuongNhiem` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_thoigiancongtac`
--

INSERT INTO `qlnv_thoigiancongtac` (`id`, `MaNV`, `MaCV`, `NgayNhanChuc`, `NgayKetThuc`, `DuongNhiem`) VALUES
(20, 'NV001', 'NV', '2025-03-29', NULL, 1),
(21, 'NV002', 'GD', '2025-03-29', NULL, 1),
(22, 'NV003', 'NV', '2025-03-29', NULL, 1),
(23, 'NV000', 'GD', '2025-03-29', NULL, 1),
(24, 'NV004', 'TTS', '2025-03-29', NULL, 1),
(25, 'NV005', 'NV', '2025-04-03', NULL, 1),
(26, 'NV006', 'NV', '2025-04-05', NULL, 1),
(27, 'NV007', 'TP', '2025-04-10', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_thuongphat`
--

CREATE TABLE `qlnv_thuongphat` (
  `id` int(11) NOT NULL,
  `MaNV` varchar(8) NOT NULL,
  `Loai` tinyint(1) DEFAULT 0,
  `LyDo` varchar(100) NOT NULL,
  `Tien` double NOT NULL,
  `Ngay` date NOT NULL,
  `GhiChu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Bẫy `qlnv_thuongphat`
--
DELIMITER $$
CREATE TRIGGER `delete_thuongphat_luong` AFTER DELETE ON `qlnv_thuongphat` FOR EACH ROW BEGIN
    DECLARE sotienphat double;
    DECLARE luongchamcong double;
    DECLARE luongDuocNhan double;
    DECLARE sotienthuong double;
    
    SET luongchamcong = (SELECT l.LuongChamCong
                        FROM qlnv_luong l
                        WHERE l.Nam = YEAR(OLD.Ngay) 
                         AND l.Thang = MONTH(OLD.Ngay) 
                         AND l.MaNV = OLD.MaNV);
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = OLD.MaNV AND MONTH(tp.Ngay) = MONTH(OLD.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(OLD.Ngay) AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
  
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = OLD.MaNV AND MONTH(tp.Ngay) = MONTH(OLD.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(OLD.Ngay) AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
   
    UPDATE `qlnv_luong`
    SET `SoTienThuong` = sotienthuong, `SoTienPhat` = sotienphat, `TongSoTien` = luongDuocNhan
    WHERE Nam = YEAR(OLD.Ngay) AND Thang = MONTH(OLD.Ngay) AND MaNV = OLD.MaNV;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_thuongphat_luong` AFTER INSERT ON `qlnv_thuongphat` FOR EACH ROW BEGIN
    DECLARE sotienphat double;
    DECLARE luongchamcong double;
    DECLARE luongDuocNhan double;
    DECLARE sotienthuong double;
    
    SET luongchamcong = (SELECT l.LuongChamCong
                        FROM qlnv_luong l
                        WHERE l.Nam = YEAR(NEW.Ngay) 
                         AND l.Thang = MONTH(NEW.Ngay) 
                         AND l.MaNV = NEW.MaNV);
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNV AND MONTH(tp.Ngay) = MONTH(NEW.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(NEW.Ngay) AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
  
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNV AND MONTH(tp.Ngay) = MONTH(NEW.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(NEW.Ngay) AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
   
    UPDATE `qlnv_luong`
    SET `SoTienThuong` = sotienthuong, `SoTienPhat` = sotienphat, `TongSoTien` = luongDuocNhan
    WHERE Nam = YEAR(NEW.Ngay) AND Thang = MONTH(NEW.Ngay) AND MaNV = NEW.MaNV;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_thuongphat_luong` AFTER UPDATE ON `qlnv_thuongphat` FOR EACH ROW BEGIN
    DECLARE sotienphat double;
    DECLARE luongchamcong double;
    DECLARE luongDuocNhan double;
    DECLARE sotienthuong double;
    
    SET luongchamcong = (SELECT l.LuongChamCong
                        FROM qlnv_luong l
                        WHERE l.Nam = YEAR(OLD.Ngay) 
                         AND l.Thang = MONTH(OLD.Ngay) 
                         AND l.MaNV = OLD.MaNV);
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = OLD.MaNV AND MONTH(tp.Ngay) = MONTH(OLD.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(OLD.Ngay) AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
  
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = OLD.MaNV AND MONTH(tp.Ngay) = MONTH(OLD.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(OLD.Ngay) AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
   
    UPDATE `qlnv_luong`
    SET `SoTienThuong` = sotienthuong, `SoTienPhat` = sotienphat, `TongSoTien` = luongDuocNhan
    WHERE Nam = YEAR(OLD.Ngay) AND Thang = MONTH(OLD.Ngay) AND MaNV = OLD.MaNV;
    
    SET luongchamcong = (SELECT l.LuongChamCong
                        FROM qlnv_luong l
                        WHERE l.Nam = YEAR(NEW.Ngay) 
                         AND l.Thang = MONTH(NEW.Ngay) 
                         AND l.MaNV = NEW.MaNV);
    
    SET sotienphat = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNV AND MONTH(tp.Ngay) = MONTH(NEW.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(NEW.Ngay) AND tp.Loai = 1);
    
    IF sotienphat IS NULL THEN
    	SET sotienphat = 0;
     END IF;
    
  
    set sotienthuong = (SELECT SUM(tp.Tien) 
                      FROM qlnv_thuongphat tp 
                      WHERE tp.MaNV = NEW.MaNV AND MONTH(tp.Ngay) = MONTH(NEW.Ngay)
                     AND YEAR(tp.Ngay) = YEAR(NEW.Ngay) AND tp.Loai = 0);
                     
    IF sotienthuong IS NULL THEN
    	SET sotienthuong = 0;
     END IF;
    
    SET luongDuocNhan = ROUND(luongchamcong - sotienphat + sotienthuong, -3);
   
    UPDATE `qlnv_luong`
    SET `SoTienThuong` = sotienthuong, `SoTienPhat` = sotienphat, `TongSoTien` = luongDuocNhan
    WHERE Nam = YEAR(NEW.Ngay) AND Thang = MONTH(NEW.Ngay) AND MaNV = NEW.MaNV;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_trinhdohocvan`
--

CREATE TABLE `qlnv_trinhdohocvan` (
  `MATDHV` varchar(8) NOT NULL,
  `TenTDHV` varchar(50) NOT NULL,
  `ChuyenNganh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_trinhdohocvan`
--

INSERT INTO `qlnv_trinhdohocvan` (`MATDHV`, `TenTDHV`, `ChuyenNganh`) VALUES
('SV001', 'Chưa tốt nghiệp', 'Khoa học dữ liệu'),
('SV002', 'Chưa tốt nghiệp', 'Hóa Dược'),
('SV003', 'Chưa tốt nghiệp', 'Vật Lý'),
('TNKHMTTT', 'Tốt Nghiệp', 'Khoa học máy tính và thông tin'),
('TS001', 'Thạc Sĩ', 'Khoa học dữ liệu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qlnv_user`
--

CREATE TABLE `qlnv_user` (
  `Id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tennguoidung` varchar(50) NOT NULL,
  `MaNhanVien` varchar(8) NOT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `register` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `qlnv_user`
--

INSERT INTO `qlnv_user` (`Id_user`, `username`, `password`, `tennguoidung`, `MaNhanVien`, `LastLogin`, `register`) VALUES
(13, 'admin', '202cb962ac59075b964b07152d234b70', 'Trần Chủ Tịch', 'NV000', '2025-04-12 00:36:31', '2025-03-29 10:06:11'),
(14, 'huynq', '202cb962ac59075b964b07152d234b70', 'Nguyễn Quang Huy', 'NV004', '2025-04-12 00:35:46', '2025-03-29 16:32:20'),
(17, 'khoaha', 'c4ca4238a0b923820dcc509a6f75849b', 'Hoàng Anh Khoa', 'NV007', '2025-04-12 00:34:12', '2025-04-10 14:16:11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `qlnv_chamcong`
--
ALTER TABLE `qlnv_chamcong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_chamcongngay`
--
ALTER TABLE `qlnv_chamcongngay`
  ADD PRIMARY KEY (`MaChamCong`);

--
-- Chỉ mục cho bảng `qlnv_chamcongthang`
--
ALTER TABLE `qlnv_chamcongthang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_chamcongtongketthang`
--
ALTER TABLE `qlnv_chamcongtongketthang`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `qlnv_chucvu`
--
ALTER TABLE `qlnv_chucvu`
  ADD PRIMARY KEY (`MaCV`);

--
-- Chỉ mục cho bảng `qlnv_congty`
--
ALTER TABLE `qlnv_congty`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `qlnv_hopdong`
--
ALTER TABLE `qlnv_hopdong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_imagedata`
--
ALTER TABLE `qlnv_imagedata`
  ADD PRIMARY KEY (`ID_image`);

--
-- Chỉ mục cho bảng `qlnv_luong`
--
ALTER TABLE `qlnv_luong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_nhanvien`
--
ALTER TABLE `qlnv_nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Chỉ mục cho bảng `qlnv_phanquyenuser`
--
ALTER TABLE `qlnv_phanquyenuser`
  ADD PRIMARY KEY (`id_user`,`role_id`);

--
-- Chỉ mục cho bảng `qlnv_phongban`
--
ALTER TABLE `qlnv_phongban`
  ADD PRIMARY KEY (`MaPB`);

--
-- Chỉ mục cho bảng `qlnv_thoigiancongtac`
--
ALTER TABLE `qlnv_thoigiancongtac`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_thuongphat`
--
ALTER TABLE `qlnv_thuongphat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `qlnv_trinhdohocvan`
--
ALTER TABLE `qlnv_trinhdohocvan`
  ADD PRIMARY KEY (`MATDHV`);

--
-- Chỉ mục cho bảng `qlnv_user`
--
ALTER TABLE `qlnv_user`
  ADD PRIMARY KEY (`Id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `qlnv_chamcong`
--
ALTER TABLE `qlnv_chamcong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `qlnv_chamcongngay`
--
ALTER TABLE `qlnv_chamcongngay`
  MODIFY `MaChamCong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `qlnv_chamcongthang`
--
ALTER TABLE `qlnv_chamcongthang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `qlnv_chamcongtongketthang`
--
ALTER TABLE `qlnv_chamcongtongketthang`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `qlnv_congty`
--
ALTER TABLE `qlnv_congty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `qlnv_hopdong`
--
ALTER TABLE `qlnv_hopdong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `qlnv_luong`
--
ALTER TABLE `qlnv_luong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `qlnv_thoigiancongtac`
--
ALTER TABLE `qlnv_thoigiancongtac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `qlnv_thuongphat`
--
ALTER TABLE `qlnv_thuongphat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `qlnv_user`
--
ALTER TABLE `qlnv_user`
  MODIFY `Id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
