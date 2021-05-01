-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2021 at 04:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr11_petadoption_szabo`
--
CREATE DATABASE IF NOT EXISTS `cr11_petadoption_szabo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr11_petadoption_szabo`;

-- --------------------------------------------------------

--
-- Table structure for table `petadoption`
--

CREATE TABLE `petadoption` (
  `id` int(11) NOT NULL,
  `fk_products_id` int(11) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

-- the Table products is the table animals
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `fk_supplierId` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `hobbies` varchar(55) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `petSize` varchar(55) DEFAULT NULL,
  `breed` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `picture`, `fk_supplierId`, `description`, `address`, `hobbies`, `age`, `petSize`, `breed`) VALUES
(6, 'Maxi', '0.00', '608c1d8f1bb1b.jpeg', 1, 'a yellow cat', 'Obigasse 210, 1100 Wien', 'Playing with Lulu', 6, 'small', 'Perserkatze'),
(7, 'Baba', '0.00', '608c1e39eac6c.jpeg', 1, 'a grey cat', 'tassestrasse 1, 1070 Wien', 'Laying all the time on the bed', 2, 'Small', 'Siamkatze'),
(8, 'Peter', '0.00', '608c1ea065eb1.jpeg', 1, 'a little parrot', 'franitzkygasse 2, 1070 Wien', 'Imitation peoples voices all the time', 3, 'Small', 'Agapornieden'),
(9, 'Lachsi', '0.00', '608c1ec2c740e.jpeg', 1, 'a tiny mouse', 'Teboostrasse 4, 1080 Wien', 'Eating chees all the time', 4, 'Small', 'Housemouse'),
(10, 'Bubi', '0.00', '608c1eff650a3.jpeg', 1, 'a big dog', 'Schwarzenbergplatz 10, 1070 Wien', 'Licking his masters body', 2, 'Large', 'Labrador'),
(11, 'Lalu', '0.00', '608c1f6b8f915.jpeg', 1, 'a large monkey', 'histrasse 5, 1070 Wien', 'Eating Bananas', 7, 'Large', 'Siamkatze'),
(12, 'Fritzi', '0.00', '608c1f969798b.jpeg', 1, 'a big bear', 'dogasse 14, 1070 Wien', 'Having fun', 2, 'Large', 'Bigbear'),
(13, 'Heyho', '0.00', '608c1fc156673.jpeg', 1, 'a white panda', 'am alpern 29, 1170 Wien', 'Enyoing life', 5, 'Large', 'Bigpanda'),
(14, 'Stuberl', '0.00', '608c1ff1839f3.jpeg', 1, 'a sweet turtle', 'hei bagern 39, 1230 Wien', 'Loving his turtle family', 10, 'Senior', 'Landschildkröte'),
(15, 'Gaga', '0.00', '608c2022dc867.jpeg', 1, 'a red tiny fish', 'sofiagasse 1, 1070 Wien', 'Swimming all the time', 9, 'Senior', 'Flossenfisch'),
(16, 'Pappi', '0.00', '608c205a9e696.jpeg', 1, 'sweet guinea pig', 'Laborstr. 8', 'playing around', 12, 'Senior', 'Texel'),
(17, 'Fabri', '0.00', '608c208f1b12a.jpeg', 1, 'a lazy monkey', 'peterstrasse 1, 1150 Wien', 'laying all the time', 15, 'Senior', 'Schimpanse');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `sup_email` varchar(50) DEFAULT NULL,
  `sup_website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierId`, `sup_name`, `sup_email`, `sup_website`) VALUES
(1, 'Shopy International LLC', 'shopy@mail.com', 'shopy.international.com'),
(2, 'Amazon INC', 'amazon@mail.com', 'amazon.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `picture`, `first_name`, `last_name`, `password`, `date_of_birth`, `email`, `image`, `status`) VALUES
(2, NULL, 'Ariel Photo_1.jpg', 'Ariel', 'Szabo', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2021-04-01', 'ariel@gmail.com', '', 'adm'),
(4, NULL, 'avatar.png', 'Tamas', 'Szabo', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2021-04-20', 'tamas@gmail.com', NULL, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `petadoption`
--
ALTER TABLE `petadoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_id` (`fk_products_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplierId` (`fk_supplierId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petadoption`
--
ALTER TABLE `petadoption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `petadoption`
--
ALTER TABLE `petadoption`
  ADD CONSTRAINT `petadoption_ibfk_1` FOREIGN KEY (`fk_products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `petadoption_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_supplierId`) REFERENCES `supplier` (`supplierId`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
