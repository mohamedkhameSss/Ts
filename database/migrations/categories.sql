-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Nov 30, 2024 at 05:42 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_catalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(256) NOT NULL,
  `parent` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent`) VALUES
('0c1d2e3f-4a5b-6c7d-8e9f-0a1b2c3d4e5f', 'Destinations', '9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e'),
('0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b', 'Arts & Entertainment', NULL),
('1c2a3b4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'Technology', NULL),
('1d2e3f4a-5b6c-7d8e-9f0a-1b2c3d4e5f6a', 'Travel Tips', '9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e'),
('1f2a3b4c-5d6e-7f8a-9b0c-1d2e3f4a5b6c', 'Visual Arts', '0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b'),
('2a3b4c5d-6e7f-8a9b-0c1d-2e3f4a5b6c7d', 'Performing Arts', '0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b'),
('2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 'Software Development', '1c2a3b4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d'),
('3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e', 'Science & Nature', NULL),
('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f82', 'Hardware Engineering 3', '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a'),
('3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a', 'Hardware Engineering 2', '2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f'),
('4c5d6e7f-8a9b-0c1d-2e3f-4a5b6c7d8e9f', 'Biology', '3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e'),
('4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b', 'Education', NULL),
('5d6e7f8a-9b0c-1d2e-3f4a-5b6c7d8e9f0a', 'Physics', '3b4c5d6e-7f8a-9b0c-1d2e-3f4a5b6c7d8e'),
('5f6a7b8c-9d0e-1f2a-3b4c-5d6e7f8a9b0c', 'Higher Education', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b'),
('6a7b8c9d-0e1f-2a3b-4c5d-6e7f8a9b0c1d', 'K-12 Education', '4e5f6a7b-8c9d-0e1f-2a3b-4c5d6e7f8a9b'),
('6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b', 'Food & Cooking', NULL),
('7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e', 'Health & Wellness', NULL),
('7f8a9b0c-1d2e-3f4a-5b6c-7d8e9f0a1b2c', 'Recipes', '6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b'),
('8a9b0c1d-2e3f-4a5b-6c7d-8e9f0a1b2c3d', 'Culinary Techniques', '6e7f8a9b-0c1d-2e3f-4a5b-6c7d8e9f0a1b'),
('8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f', 'Fitness & Nutrition', '7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e'),
('9b0c1d2e-3f4a-5b6c-7d8e-9f0a1b2c3d4e', 'Travel & Tourism', NULL),
('9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a', 'Mental Health', '7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
