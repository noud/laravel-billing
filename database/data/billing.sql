-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 08, 2020 at 08:38 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing`
--

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `created_at`, `updated_at`) VALUES
('nl', 'Netherlands', NULL, NULL);

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `created_at`, `updated_at`) VALUES
('cd7636a7-b30e-4131-b465-d52a6c635756', NULL, NULL);

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `invoice_id`, `area`, `date`, `amount`, `tax_amount`, `customer`, `code`, `order_nr`, `remark`, `pay_before`, `tenant`, `created_at`, `updated_at`) VALUES
(1, 'cd7636a7-b30e-4131-b465-d52a6c635756', NULL, '', '', '', 2, '', '', '', '', 1, NULL, NULL);

--
-- Dumping data for table `invoice_item_detail`
--

INSERT INTO `invoice_item_detail` (`id`, `invoice_id`, `description`, `tax`, `tax_amount`, `qty`, `unit`, `price`, `item_total`, `created_at`, `updated_at`) VALUES
(1, 'cd7636a7-b30e-4131-b465-d52a6c635756', 1, '', '', '16', 2, '', '', NULL, NULL),
(2, 'cd7636a7-b30e-4131-b465-d52a6c635756', 2, '', '', '1', 1, '', '', NULL, NULL);

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `address_id`, `email`, `legal_name`, `location_id`, `telephone`, `thing_id`, `contact`, `mobile`, `vat`, `kvk`, `bank_number`, `bank_name`, `swift`, `pin`, `tin`, `created_at`, `updated_at`) VALUES
(1, 1, 'noud4@home.nl', 'Secure Code', NULL, '+31 (0)6 1987 3003', NULL, '', '', 'NL003331926895', '', '', '', '', '', '', NULL, NULL),
(2, NULL, '', 'Smartshore Ability', NULL, '030 320 0977', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL);

--
-- Dumping data for table `postal_address`
--

INSERT INTO `postal_address` (`id`, `address_country`, `address_locality`, `address_region`, `postal_code`, `street_address`, `created_at`, `updated_at`) VALUES
(1, 'nl', 'Goirle', 'NB', '', 'Voldijkje 13', NULL, NULL);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `tax`, `tax_amount`, `quantity`, `category`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'programmeren', '60', 1, '', '', NULL, 1, NULL, NULL),
(2, 'OV', '24', 3, '', '', NULL, 1, NULL, NULL);

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `name`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'hoog', '21', NULL, NULL),
(2, 'laag', '9', NULL, NULL),
(3, 'geen', '0', NULL, NULL);

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'single item', NULL, NULL),
(2, 'hour', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
