-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2021 pada 13.21
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah_indo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absen`
--

CREATE TABLE `tb_absen` (
  `id_absen` int(7) NOT NULL,
  `id_user` int(7) NOT NULL,
  `id_stskhd` int(3) NOT NULL,
  `id_seminar` int(7) NOT NULL,
  `tanggal_hadir` date NOT NULL,
  `jam_hadir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_daftar_seminar`
--

CREATE TABLE `tb_daftar_seminar` (
  `id_daftar` int(7) NOT NULL,
  `id_seminar` int(7) NOT NULL,
  `id_user` int(7) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `jam_daftar` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembicara`
--

CREATE TABLE `tb_pembicara` (
  `id_pembicara` int(7) NOT NULL,
  `nama_pembicara` varchar(150) NOT NULL,
  `latarbelakang` varchar(200) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pendidikan`
--

CREATE TABLE `tb_pendidikan` (
  `id_pendidikan` int(3) NOT NULL,
  `pendidikan_terakhir` int(50) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peserta`
--

CREATE TABLE `tb_peserta` (
  `id_peserta` int(7) NOT NULL,
  `id_user` int(7) NOT NULL,
  `id_pendidikan` int(7) NOT NULL,
  `nama_peserta` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telephon` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `tanggal_daftar` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_seminar`
--

CREATE TABLE `tb_seminar` (
  `id_seminar` int(7) NOT NULL,
  `id_pembicara` int(7) NOT NULL,
  `id_kategori` int(3) NOT NULL,
  `nama_seminar` varchar(100) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `jam_pelaksanaan` time NOT NULL,
  `deskripsi` text NOT NULL,
  `syarat` varchar(255) NOT NULL,
  `link_even` varchar(255) NOT NULL,
  `link_group` varchar(255) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_status_kehadiran`
--

CREATE TABLE `tb_status_kehadiran` (
  `id_stskhd` int(11) NOT NULL,
  `nama_stskhd` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tiket`
--

CREATE TABLE `tb_tiket` (
  `id_tiket` int(7) NOT NULL,
  `id_seminar` int(7) NOT NULL,
  `harga_tiket` int(7) NOT NULL,
  `slot_tiket` int(5) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(7) NOT NULL,
  `username` varchar(35) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hak_akses` varchar(8) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_absen`
--
ALTER TABLE `tb_absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_seminar` (`id_seminar`),
  ADD KEY `id_stskhd` (`id_stskhd`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_daftar_seminar`
--
ALTER TABLE `tb_daftar_seminar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD KEY `id_seminar` (`id_seminar`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_pembicara`
--
ALTER TABLE `tb_pembicara`
  ADD PRIMARY KEY (`id_pembicara`);

--
-- Indeks untuk tabel `tb_pendidikan`
--
ALTER TABLE `tb_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indeks untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_pendidikan` (`id_pendidikan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_seminar`
--
ALTER TABLE `tb_seminar`
  ADD PRIMARY KEY (`id_seminar`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_pembicara` (`id_pembicara`);

--
-- Indeks untuk tabel `tb_status_kehadiran`
--
ALTER TABLE `tb_status_kehadiran`
  ADD PRIMARY KEY (`id_stskhd`);

--
-- Indeks untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_absen`
--
ALTER TABLE `tb_absen`
  MODIFY `id_absen` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_daftar_seminar`
--
ALTER TABLE `tb_daftar_seminar`
  MODIFY `id_daftar` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pembicara`
--
ALTER TABLE `tb_pembicara`
  MODIFY `id_pembicara` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pendidikan`
--
ALTER TABLE `tb_pendidikan`
  MODIFY `id_pendidikan` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  MODIFY `id_peserta` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_seminar`
--
ALTER TABLE `tb_seminar`
  MODIFY `id_seminar` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_status_kehadiran`
--
ALTER TABLE `tb_status_kehadiran`
  MODIFY `id_stskhd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  MODIFY `id_tiket` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(7) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_absen`
--
ALTER TABLE `tb_absen`
  ADD CONSTRAINT `tb_absen_ibfk_1` FOREIGN KEY (`id_seminar`) REFERENCES `tb_seminar` (`id_seminar`),
  ADD CONSTRAINT `tb_absen_ibfk_2` FOREIGN KEY (`id_stskhd`) REFERENCES `tb_status_kehadiran` (`id_stskhd`),
  ADD CONSTRAINT `tb_absen_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_daftar_seminar`
--
ALTER TABLE `tb_daftar_seminar`
  ADD CONSTRAINT `tb_daftar_seminar_ibfk_1` FOREIGN KEY (`id_seminar`) REFERENCES `tb_seminar` (`id_seminar`),
  ADD CONSTRAINT `tb_daftar_seminar_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD CONSTRAINT `tb_peserta_ibfk_1` FOREIGN KEY (`id_pendidikan`) REFERENCES `tb_pendidikan` (`id_pendidikan`),
  ADD CONSTRAINT `tb_peserta_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tb_seminar`
--
ALTER TABLE `tb_seminar`
  ADD CONSTRAINT `tb_seminar_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`),
  ADD CONSTRAINT `tb_seminar_ibfk_2` FOREIGN KEY (`id_pembicara`) REFERENCES `tb_pembicara` (`id_pembicara`);

--
-- Ketidakleluasaan untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  ADD CONSTRAINT `tb_tiket_ibfk_1` FOREIGN KEY (`id_seminar`) REFERENCES `tb_seminar` (`id_seminar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
