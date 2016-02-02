--
-- Database: `db_absensi2014`
--
CREATE DATABASE IF NOT EXISTS `db_absensi2014` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_absensi2014`;

--
-- Table structure for table `kelas`
--
CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` varchar(2) NOT NULL,
  `kelas` varchar(32) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `semester`
--
CREATE TABLE IF NOT EXISTS `semester` (
  `id_semester` int(1) NOT NULL,
  `status` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--
INSERT INTO `semester` (`id_semester`, `status`) VALUES
(1, 'Y'),
(2, 'N');

--
-- Table structure for table `user`
--
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(1) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--
INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Table structure for table `siswa`
--
CREATE TABLE IF NOT EXISTS `siswa` (
  `nis` varchar(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` varchar(2) NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `id_kelas` (`id_kelas`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `absen`
--
CREATE TABLE IF NOT EXISTS `absen` (
  `id_absen` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(4) NOT NULL,
  `id_semester` int(1) NOT NULL,
  `tanggal` date NOT NULL,
  `absen` varchar(1) NOT NULL,
  PRIMARY KEY (`id_absen`),
  KEY `id_semester` (`id_semester`) USING BTREE,
  KEY `nis` (`nis`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `fk_absen_semester` FOREIGN KEY (`id_semester`) REFERENCES `semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_absen_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;