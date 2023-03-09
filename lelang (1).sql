-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2023 pada 07.14
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
-- Database: `lelang`
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

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `deskripsi`, `harga_awal`, `status`) VALUES
(35, 'Lidah mertua ', '<p><strong>Sansevieria atau lidah mertua adalah marga tanaman hias yang cukup populer sebagai penghias bagian dalam rumah karena tanaman ini dapat tumbuh dalam kondisi yang sedikit air dan cahaya matahari. Sansevieria memiliki daun keras, sukulen, tegak, dengan ujung meruncing.</strong></p>', 45000.00, 'Sold'),
(36, 'Monstera', 'tanaman monstera memiliki daun yang penuh dengan lubang lubang namun indah serta sangat memiliki aura yang tajam ', 3000000.00, 'Process'),
(37, 'Iki', 'hebat', 2000.00, 'Process'),
(38, 'aglonema', 'aglonema', 120000.00, 'Process');

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
-- Dumping data untuk tabel `gambar`
--

INSERT INTO `gambar` (`id_gambar`, `id_barang`, `gambar`, `nama_gambar`, `utama`, `urutan`) VALUES
(109, 31, '6403104aade3d984720711.jpg', 'air2.jpg', 0, 1),
(110, 31, '6403104d89950394131009.jpg', 'air3.jpg', 0, 2),
(111, 32, '640310b672f63357306590.jpg', 'kul1.jpg', 1, 0),
(112, 32, '640310bc10f25698711893.jpg', 'kul2.jpg', 0, 1),
(113, 32, '640310be7fc47297908687.jpg', 'kul3.jpg', 0, 2),
(114, 32, '640310c1156ce442866765.jpg', 'kul4.jpg', 0, 3),
(115, 32, '640310c37c770131516222.jpg', 'kul5.jpg', 0, 4),
(116, 32, '640310c742e3d539129973.jpg', 'kul6.jpg', 0, 5),
(117, 33, '640311343ff57267635851.jpg', 'ble1.jpg', 1, 0),
(118, 33, '6403114248811839003860.jpg', 'ble2.jpg', 0, 1),
(119, 33, '64031144976b7033418698.jpg', 'ble3.jpg', 0, 2),
(120, 33, '6403114b77751642944428.jpg', 'ble4.jpg', 0, 3),
(121, 34, '640311c295f9d559471461.jpg', 'pro1.jpg', 1, 0),
(122, 34, '640311d2f243c211281248.jpg', 'pro3.jpg', 0, 1),
(123, 34, '640311dc6c566769773025.jpg', 'pro4.jpg', 0, 2),
(124, 34, '640311e18c9fb716449349.jpg', 'pro5.jpg', 0, 3),
(125, 34, '640311e7bcd09606601005.jpg', 'pro6.jpg', 0, 4),
(126, 35, '6407e1fee6d46360543538.jpg', 'lidah buaya.jpg', 1, 0),
(127, 36, '6407e4d31c51f674810850.jpg', 'monstera.jpg', 1, 0),
(128, 35, '6407e617710bb549104581.jpeg', 'jendela.jpeg', 0, 1),
(130, 37, '6407f2253f171038237786.jpg', 'monstera.jpg', 1, 0),
(131, 38, '6408240e0ceba861145254.jpg', 'aglonema.jpg', 1, 0);

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
-- Dumping data untuk tabel `lelang`
--

INSERT INTO `lelang` (`id_lelang`, `id_barang`, `tgl_mulai`, `tgl_akhir`, `harga_awal`, `status`, `created_by`, `created_date`, `id_masyarakat`, `harga_akhir`, `confirm_by`, `confirm_date`, `update_by`, `update_date`) VALUES
(30, 35, '2023-03-08', '2023-04-08', 45000.00, 'Confirmed', 9, '2023-03-08 08:17:41', 8, 50000.00, 0, '2023-03-08 09:20:47', 9, '2023-03-08 09:10:40'),
(31, 36, '2023-03-08', '2023-03-23', 3000000.00, 'Open', 9, '2023-03-08 08:29:08', NULL, NULL, 0, NULL, 9, '2023-03-08 08:29:55'),
(32, 37, '2023-03-10', '2023-03-16', 2000.00, 'Cancel', 9, '2023-03-08 09:26:02', NULL, NULL, 0, NULL, 9, '2023-03-08 09:26:21'),
(33, 37, '2023-03-08', '2023-04-01', 2000.00, 'Open', 9, '2023-03-08 12:58:55', NULL, NULL, 0, NULL, 9, '2023-03-08 12:58:55'),
(34, 38, '2023-03-08', '2023-04-01', 120000.00, 'Open', 9, '2023-03-08 12:59:22', NULL, NULL, 0, NULL, 9, '2023-03-08 12:59:22');

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

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`id_masyarakat`, `email`, `password`, `nik`, `nama`, `jk`, `no_hp`, `alamat`, `tgl_join`, `status`, `update_by`, `update_date`) VALUES
(7, 'nofi.sagita@mail.com', '$2y$10$63kqmHlpuDaPPwxh67qsZeE1XsgRwKPy0a2jc/7Qw6Svw1/acrTA.', '98119281019', 'Nofi Sagita', 'Perempuan', '08111118270', 'Sindangsari, Bogor Timur', '2023-03-04 15:54:08', 1, 6, '2023-03-08 03:28:24'),
(8, 'mrizki@gmail.com', '$2y$10$bmkNBZLe8MJ4yrebcnnUkesrv2TUjylepsHBFxkLbgy.TpQEthciO', '16471987', 'muhammad rizki sabida', 'Laki-laki', '089632469866', 'pd hasan jalan raya tajur bogor timur, Bogor Jawa Barat Indonesia', '2023-03-08 08:32:22', 1, 6, '2023-03-08 03:30:45');

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

--
-- Dumping data untuk tabel `penawaran`
--

INSERT INTO `penawaran` (`id_penawaran`, `id_masyarakat`, `id_lelang`, `tgl_penawaran`, `harga_penawaran`) VALUES
(21, 8, 30, '2023-03-08 09:09:51', 50000.00),
(22, 8, 31, '2023-03-08 09:17:53', 4000000.00);

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

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nip`, `nama`, `email`, `no_kontak`, `level`, `status`) VALUES
(1, 'iqi', '$2y$10$LkP7dybhyizrhjSyroz1Te39nQcWz.WEaej267nTmoCOgt4fwuPgS', '5762890', 'Rizki', 'rizki@gmail.com', '085231919832', 'Petugas', 1),
(6, 'sival', '$2y$10$8H4.zexsORLMSxv.UYxJHOYOCGkVRrIDENvc74E7ch3CtZnj8M0rm', '778121', 'Sival Mukaromah', 'sival@gmail.com', '08981263181', 'Admin', 1),
(7, 'maya', '$2y$10$P4HzRyF5TQ8seDljGGbol.9A3KoeJUCU4qMBXfzZQxqhxIBCuKmWG', '88212190', 'Maya ', 'maya@gmail.com', '343898', 'Admin', 0),
(8, 'nofi', '$2y$10$0pqAxuqXePrTYP7D7A9gvuORUJ8qCDbreiDkwPsU8sTqp1b8g7O9i', '82319781', 'Nofi', 'nofi@mail.com', '12331412', 'Petugas', 0),
(9, 'alex', '$2y$10$670uihUG8e5eNhDkJn63augbPy8t8fKYL8GzYk1aXyETECGcDOLpq', '123', 'alex', 'muhammad@gmail.com', '3434565', 'Petugas', 1);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lelang_berlangsung`  AS SELECT `a`.`id_lelang` AS `id_lelang`, `a`.`id_barang` AS `id_barang`, `c`.`nama_barang` AS `nama_barang`, `d`.`gambar` AS `gambar`, `c`.`deskripsi` AS `deskripsi`, `a`.`tgl_mulai` AS `tgl_mulai`, `a`.`tgl_akhir` AS `tgl_akhir`, `a`.`harga_awal` AS `harga_awal`, ifnull(`b`.`total_penawaran`,0) AS `total_penawaran`, ifnull(`b`.`harga_tertinggi`,0) AS `harga_tertinggi` FROM (((`lelang` `a` left join (select `p`.`id_lelang` AS `id_lelang`,max(`p`.`harga_penawaran`) AS `harga_tertinggi`,count(`p`.`id_penawaran`) AS `total_penawaran` from `penawaran` `p` group by `p`.`id_lelang`) `b` on(`a`.`id_lelang` = `b`.`id_lelang`)) join `barang` `c` on(`a`.`id_barang` = `c`.`id_barang`)) left join `gambar` `d` on(`c`.`id_barang` = `d`.`id_barang` and `d`.`utama` = 1)) WHERE `a`.`status` = 'open' AND curdate() between `a`.`tgl_mulai` and `a`.`tgl_akhir``tgl_akhir`  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `max_penawaran`
--
DROP TABLE IF EXISTS `max_penawaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `max_penawaran`  AS SELECT `p`.`id_lelang` AS `id_lelang`, `p`.`id_masyarakat` AS `id_masyarakat`, max(`p`.`harga_penawaran`) AS `harga_penawaran` FROM `penawaran` AS `p` GROUP BY `p`.`id_lelang`, `p`.`id_masyarakat` ORDER BY max(`p`.`harga_penawaran`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pemenang_lelang`
--
DROP TABLE IF EXISTS `pemenang_lelang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pemenang_lelang`  AS SELECT `a`.`id_lelang` AS `id_lelang`, `a`.`tgl_mulai` AS `tgl_mulai`, `a`.`tgl_akhir` AS `tgl_akhir`, `a`.`id_masyarakat` AS `id_masyarakat`, `b`.`nama` AS `pemenang`, `b`.`nik` AS `nik`, `b`.`jk` AS `jk`, `b`.`email` AS `email`, `b`.`no_hp` AS `no_hp`, `b`.`alamat` AS `alamat`, `a`.`id_barang` AS `id_barang`, `c`.`nama_barang` AS `nama_barang`, `c`.`deskripsi` AS `deskripsi`, `a`.`harga_awal` AS `harga_awal`, `a`.`harga_akhir` AS `harga_akhir`, CASE WHEN `a`.`status` <> 'confirmed' THEN 'Unconfirmed' ELSE 'Confirmed' END AS `status` FROM ((`lelang` `a` join `masyarakat` `b` on(`a`.`id_masyarakat` = `b`.`id_masyarakat`)) join `barang` `c` on(`a`.`id_barang` = `c`.`id_barang`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `lelang`
--
ALTER TABLE `lelang`
  ADD PRIMARY KEY (`id_lelang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `id_masyarakat` (`id_masyarakat`),
  ADD KEY `lelang_ibfk_4` (`update_by`);

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id_masyarakat`),
  ADD KEY `update_by` (`update_by`);

--
-- Indeks untuk tabel `penawaran`
--
ALTER TABLE `penawaran`
  ADD PRIMARY KEY (`id_penawaran`),
  ADD KEY `id_masyarakat` (`id_masyarakat`),
  ADD KEY `id_lelang` (`id_lelang`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT untuk tabel `lelang`
--
ALTER TABLE `lelang`
  MODIFY `id_lelang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  MODIFY `id_masyarakat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `penawaran`
--
ALTER TABLE `penawaran`
  MODIFY `id_penawaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
