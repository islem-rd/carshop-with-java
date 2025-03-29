-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2025 at 11:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `is_rented` tinyint(1) NOT NULL DEFAULT 0,
  `rented_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `model`, `age`, `prix`, `marque`, `is_rented`, `rented_by`) VALUES
(1, 'Civic LX', 2, 22000.50, 'Honda', 0, NULL),
(2, 'Model S', 1, 75000.00, 'Tesla', 0, NULL),
(3, 'Corolla', 3, 18000.00, 'Toyota', 1, 2),
(4, 'Mustang GT', 5, 55000.00, 'Ford', 0, NULL),
(5, 'A4', 4, 40000.00, 'Audi', 1, 3),
(6, 'Accord', 6, 25000.00, 'Honda', 0, NULL),
(7, 'Rav4', 3, 27000.00, 'Toyota', 1, 1),
(8, 'X5', 7, 60000.00, 'BMW', 1, 4),
(9, 'Camry', 4, 24000.00, 'Toyota', 0, NULL),
(10, 'CX-5', 2, 30000.00, 'Mazda', 0, NULL),
(11, 'Altima', 3, 23000.00, 'Nissan', 1, 5),
(12, 'Charger', 5, 35000.00, 'Dodge', 0, NULL),
(13, 'Explorer', 6, 40000.00, 'Ford', 0, NULL),
(14, 'Q5', 3, 45000.00, 'Audi', 0, NULL),
(15, 'Golf', 4, 20000.00, 'Volkswagen', 0, NULL),
(16, 'Wrangler', 5, 35000.00, 'Jeep', 0, NULL),
(17, 'Elantra', 2, 21000.00, 'Hyundai', 0, NULL),
(18, 'Sienna', 8, 28000.00, 'Toyota', 0, NULL),
(19, 'C-Class', 6, 42000.00, 'Mercedes-Benz', 0, NULL),
(20, 'Impala', 5, 25000.00, 'Chevrolet', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client') NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `city`) VALUES
(1, 'ahmed', 'ahmedbenyaflah42@gmail.com', '123456', 'client', 'Tunis'),
(2, 'jane_smith', 'jane.smith@example.com', 'password123', 'client', 'Sfax'),
(3, 'ahmed_ben', 'ahmed.ben@example.com', 'password123', 'client', 'Tunis'),
(4, 'sam_ali', 'sam.ali@example.com', 'password123', 'client', 'Sousse'),
(5, 'nour_ham', 'nour.ham@example.com', 'password123', 'client', 'Gabes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rented_by` (`rented_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_rented_by` FOREIGN KEY (`rented_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
