-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 05:00 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastlearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Id_administrator` int(10) NOT NULL,
  `Nama_administrator` varchar(32) NOT NULL,
  `Id_center` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Id` int(10) NOT NULL,
  `feedback_teks` varchar(100) NOT NULL,
  `tgl_feedback` date DEFAULT NULL,
  `Id_siswa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `Id_guru` int(10) NOT NULL,
  `Nama_guru` varchar(32) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `No_tlpon` varchar(12) NOT NULL,
  `Alamat` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `Id_materi` int(10) NOT NULL,
  `Jdl_materi` varchar(100) NOT NULL,
  `isi_materi` varchar(100) NOT NULL,
  `Id_guru` int(10) NOT NULL,
  `Id_siswa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `Id_tanya` int(10) NOT NULL,
  `pertanyaan` varchar(100) NOT NULL,
  `tgl_tanya` date DEFAULT NULL,
  `tgl_jawab` date DEFAULT NULL,
  `Id_siswa` int(10) NOT NULL,
  `Id_guru` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `Id_siswa` int(10) NOT NULL,
  `Nama_siswa` varchar(32) NOT NULL,
  `Telepon` varchar(13) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Alamat` varchar(64) NOT NULL,
  `Ortu` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `study_center`
--

CREATE TABLE `study_center` (
  `Id_center` int(10) NOT NULL,
  `Nama` varchar(32) NOT NULL,
  `Lokasi` varchar(100) NOT NULL,
  `Id_siswa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Id_administrator`),
  ADD KEY `Id_center` (`Id_center`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_siswa` (`Id_siswa`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`Id_guru`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`Id_materi`),
  ADD KEY `Id_guru` (`Id_guru`),
  ADD KEY `Id_siswa` (`Id_siswa`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`Id_tanya`),
  ADD KEY `Id_siswa` (`Id_siswa`),
  ADD KEY `Id_guru` (`Id_guru`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`Id_siswa`);

--
-- Indexes for table `study_center`
--
ALTER TABLE `study_center`
  ADD PRIMARY KEY (`Id_center`),
  ADD KEY `Id_siswa` (`Id_siswa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`Id_center`) REFERENCES `study_center` (`Id_center`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`Id_guru`) REFERENCES `guru` (`Id_guru`),
  ADD CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);

--
-- Constraints for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `pertanyaan_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`),
  ADD CONSTRAINT `pertanyaan_ibfk_2` FOREIGN KEY (`Id_guru`) REFERENCES `guru` (`Id_guru`);

--
-- Constraints for table `study_center`
--
ALTER TABLE `study_center`
  ADD CONSTRAINT `study_center_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `siswa` (`Id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
