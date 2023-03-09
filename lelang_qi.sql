-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Mar 2023 pada 04.31
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelang_qi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga_awal` double(15,2) NOT NULL,
  `status` enum('New','Process','Sold') NOT NULL DEFAULT 'New'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_barang` (
`id_barang` int(11)
,`nama_barang` varchar(200)
,`deskripsi` text
,`harga_awal` double(15,2)
,`gambar` varchar(100)
,`status` enum('New','Process','Sold')
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_lelang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_lelang` (
`id_lelang` int(11)
,`id_barang` int(11)
,`tgl_mulai` date
,`tgl_akhir` date
,`nama_barang` varchar(200)
,`gambar` varchar(100)
,`deskripsi` text
,`harga_awal` double(15,2)
,`harga_akhir` double(15,2)
,`status` enum('Open','Closed','Cancel','Confirmed')
,`confirm_date` datetime
,`confirm_by` int(11)
,`confirm_by_name` varchar(100)
,`created_by` int(11)
,`penanggungjawab` varchar(100)
,`created_date` datetime
,`id_masyarakat` int(11)
,`pemenang` varchar(100)
,`email` varchar(100)
,`nik` char(16)
,`jk` enum('Perempuan','Laki-laki')
,`no_hp` varchar(15)
,`alamat` varchar(250)
,`allow_edit` varchar(1)
,`update_by` int(11)
,`update_by_name` varchar(100)
,`update_date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_penawaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_penawaran` (
`id_penawaran` int(11)
,`id_masyarakat` int(11)
,`nama_penawar` varchar(100)
,`email_penawar` varchar(100)
,`no_hp` varchar(15)
,`status_penawar` tinyint(1)
,`id_lelang` int(11)
,`status_lelang` enum('Open','Closed','Cancel','Confirmed')
,`tgl_penawaran` datetime
,`id_barang` int(11)
,`nama_barang` varchar(200)
,`deskripsi` text
,`gambar` varchar(100)
,`harga_awal` double(15,2)
,`harga_penawaran` double(15,2)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gambar`
--

CREATE TABLE `gambar` (
  `id_gambar` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `nama_gambar` varchar(100) NOT NULL,
  `utama` tinyint(1) DEFAULT NULL,
  `urutan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `gambar`
--
DELIMITER $$
CREATE TRIGGER `update urutan` BEFORE INSERT ON `gambar` FOR EACH ROW set new.urutan = (select ifnull((max(g.urutan)+1),0)FROM gambar g WHERE g.id_barang = NEW.id_barang)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lelang`
--

CREATE TABLE `lelang` (
  `id_lelang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `harga_awal` double(15,2) NOT NULL,
  `status` enum('Open','Closed','Cancel','Confirmed') DEFAULT 'Open',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp(),
  `id_masyarakat` int(11) DEFAULT NULL,
  `harga_akhir` double(15,2) DEFAULT NULL,
  `confirm_by` int(11) NOT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `update_by` int(11) NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `lelang`
--
DELIMITER $$
CREATE TRIGGER `insert harga awal` BEFORE INSERT ON `lelang` FOR EACH ROW set NEW.harga_awal = (select harga_awal from barang where id_barang = NEW.id_barang)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update barang` AFTER INSERT ON `lelang` FOR EACH ROW update barang 
set status = 'Process'
where id_barang = NEW.id_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `lelang_berlangsung`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `lelang_berlangsung` (
`id_lelang` int(11)
,`id_barang` int(11)
,`nama_barang` varchar(200)
,`gambar` varchar(100)
,`deskripsi` text
,`tgl_mulai` date
,`tgl_akhir` date
,`harga_awal` double(15,2)
,`total_penawaran` bigint(21)
,`harga_tertinggi` double(15,2)
,`Keterangan` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id_masyarakat` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` enum('Perempuan','Laki-laki') DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `tgl_join` datetime DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `max_penawaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `max_penawaran` (
`id_lelang` int(11)
,`id_masyarakat` int(11)
,`harga_penawaran` double(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `pemenang_lelang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pemenang_lelang` (
`id_lelang` int(11)
,`tgl_mulai` date
,`tgl_akhir` date
,`id_masyarakat` int(11)
,`pemenang` varchar(100)
,`nik` char(16)
,`jk` enum('Perempuan','Laki-laki')
,`email` varchar(100)
,`no_hp` varchar(15)
,`alamat` varchar(250)
,`id_barang` int(11)
,`nama_barang` varchar(200)
,`deskripsi` text
,`harga_awal` double(15,2)
,`harga_akhir` double(15,2)
,`status` varchar(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penawaran`
--

CREATE TABLE `penawaran` (
  `id_penawaran` int(11) NOT NULL,
  `id_masyarakat` int(11) NOT NULL,
  `id_lelang` int(11) NOT NULL,
  `tgl_penawaran` datetime DEFAULT current_timestamp(),
  `harga_penawaran` double(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_kontak` varchar(50) NOT NULL,
  `level` enum('Admin','Petugas') DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_barang`
--
DROP TABLE IF EXISTS `detail_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_barang`  AS SELECT `b`.`id_barang` AS `id_barang`, `b`.`nama_barang` AS `nama_barang`, `b`.`deskripsi` AS `deskripsi`, `b`.`harga_awal` AS `harga_awal`, `g`.`gambar` AS `gambar`, `b`.`status` AS `status` FROM (`barang` `b` left join `gambar` `g` on(`b`.`id_barang` = `g`.`id_barang` and `g`.`utama` = 1))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_lelang`
--
DROP TABLE IF EXISTS `detail_lelang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_lelang`  AS SELECT `a`.`id_lelang` AS `id_lelang`, `a`.`id_barang` AS `id_barang`, `a`.`tgl_mulai` AS `tgl_mulai`, `a`.`tgl_akhir` AS `tgl_akhir`, `b`.`nama_barang` AS `nama_barang`, `g`.`gambar` AS `gambar`, `b`.`deskripsi` AS `deskripsi`, `a`.`harga_awal` AS `harga_awal`, `a`.`harga_akhir` AS `harga_akhir`, `a`.`status` AS `status`, `a`.`confirm_date` AS `confirm_date`, `a`.`confirm_by` AS `confirm_by`, `f`.`nama` AS `confirm_by_name`, `a`.`created_by` AS `created_by`, `c`.`nama` AS `penanggungjawab`, `a`.`created_date` AS `created_date`, `a`.`id_masyarakat` AS `id_masyarakat`, `d`.`nama` AS `pemenang`, `d`.`email` AS `email`, `d`.`nik` AS `nik`, `d`.`jk` AS `jk`, `d`.`no_hp` AS `no_hp`, `d`.`alamat` AS `alamat`, CASE WHEN curdate() between `a`.`tgl_mulai` and `a`.`tgl_akhir` THEN '0' ELSE '1' END AS `allow_edit`, `a`.`update_by` AS `update_by`, `e`.`nama` AS `update_by_name`, `a`.`update_date` AS `update_date` FROM ((((((`lelang` `a` join `barang` `b` on(`a`.`id_barang` = `b`.`id_barang`)) left join `gambar` `g` on(`g`.`id_barang` = `b`.`id_barang` and `g`.`utama` = 1)) join `users` `c` on(`a`.`created_by` = `c`.`id_user`)) left join `masyarakat` `d` on(`a`.`id_masyarakat` = `d`.`id_masyarakat`)) left join `users` `e` on(`a`.`update_by` = `e`.`id_user`)) left join `users` `f` on(`a`.`confirm_by` = `f`.`id_user`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_penawaran`
--
DROP TABLE IF EXISTS `detail_penawaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_penawaran`  AS SELECT `a`.`id_penawaran` AS `id_penawaran`, `a`.`id_masyarakat` AS `id_masyarakat`, `m`.`nama` AS `nama_penawar`, `m`.`email` AS `email_penawar`, `m`.`no_hp` AS `no_hp`, `m`.`status` AS `status_penawar`, `a`.`id_lelang` AS `id_lelang`, `b`.`status` AS `status_lelang`, `a`.`tgl_penawaran` AS `tgl_penawaran`, `b`.`id_barang` AS `id_barang`, `c`.`nama_barang` AS `nama_barang`, `c`.`deskripsi` AS `deskripsi`, `d`.`gambar` AS `gambar`, `b`.`harga_awal` AS `harga_awal`, `a`.`harga_penawaran` AS `harga_penawaran` FROM ((((`penawaran` `a` join `lelang` `b` on(`a`.`id_lelang` = `b`.`id_lelang`)) join `barang` `c` on(`b`.`id_barang` = `c`.`id_barang`)) left join `gambar` `d` on(`c`.`id_barang` = `d`.`id_barang` and `d`.`utama` = 1)) join `masyarakat` `m` on(`a`.`id_masyarakat` = `m`.`id_masyarakat`))  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `lelang_berlangsung`
--
DROP TABLE IF EXISTS `lelang_berlangsung`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lelang_berlangsung`  AS SELECT `a`.`id_lelang` AS `id_lelang`, `a`.`id_barang` AS `id_barang`, `c`.`nama_barang` AS `nama_barang`, `d`.`gambar` AS `gambar`, `c`.`deskripsi` AS `deskripsi`, `a`.`tgl_mulai` AS `tgl_mulai`, `a`.`tgl_akhir` AS `tgl_akhir`, `a`.`harga_awal` AS `harga_awal`, ifnull(`b`.`total_penawaran`,0) AS `total_penawaran`, ifnull(`b`.`harga_tertinggi`,0) AS `harga_tertinggi`, CASE WHEN to_days(`a`.`tgl_akhir`) - to_days(curdate()) = 0 THEN 'Hari Terakhir!' ELSE concat(to_days(`a`.`tgl_akhir`) - to_days(curdate()),' hari tersisa') END AS `Keterangan` FROM (((`lelang` `a` left join (select `p`.`id_lelang` AS `id_lelang`,max(`p`.`harga_penawaran`) AS `harga_tertinggi`,count(`p`.`id_penawaran`) AS `total_penawaran` from `penawaran` `p` group by `p`.`id_lelang`) `b` on(`a`.`id_lelang` = `b`.`id_lelang`)) join `barang` `c` on(`a`.`id_barang` = `c`.`id_barang`)) left join `gambar` `d` on(`c`.`id_barang` = `d`.`id_barang` and `d`.`utama` = 1)) WHERE `a`.`status` = 'open' AND curdate() between `a`.`tgl_mulai` and `a`.`tgl_akhir``tgl_akhir`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `max_penawaran`
--
DROP TABLE IF EXISTS `max_penawaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `max_penawaran`  AS SELECT `penawaran`.`id_lelang` AS `id_lelang`, `penawaran`.`id_masyarakat` AS `id_masyarakat`, max(`penawaran`.`harga_penawaran`) AS `harga_penawaran` FROM `penawaran` GROUP BY `penawaran`.`id_lelang`, `penawaran`.`id_masyarakat` ORDER BY max(`penawaran`.`harga_penawaran`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pemenang_lelang`
--
DROP TABLE IF EXISTS `pemenang_lelang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pemenang_lelang`  AS SELECT `a`.`id_lelang` AS `id_lelang`, `a`.`tgl_mulai` AS `tgl_mulai`, `a`.`tgl_akhir` AS `tgl_akhir`, `a`.`id_masyarakat` AS `id_masyarakat`, `b`.`nama` AS `pemenang`, `b`.`nik` AS `nik`, `b`.`jk` AS `jk`, `b`.`email` AS `email`, `b`.`no_hp` AS `no_hp`, `b`.`alamat` AS `alamat`, `a`.`id_barang` AS `id_barang`, `c`.`nama_barang` AS `nama_barang`, `c`.`deskripsi` AS `deskripsi`, `a`.`harga_awal` AS `harga_awal`, `a`.`harga_akhir` AS `harga_akhir`, CASE WHEN `a`.`status` <> 'confirmed' THEN 'Unconfirmed' ELSE 'Confirmed' END AS `status` FROM ((`lelang` `a` join `masyarakat` `b` on(`a`.`id_masyarakat` = `b`.`id_masyarakat`)) join `barang` `c` on(`a`.`id_barang` = `c`.`id_barang`))  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
