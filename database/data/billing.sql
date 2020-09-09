-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 09, 2020 at 02:56 PM
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

INSERT INTO `country` (`id`, `name`, `currency`, `date`, `created_at`, `updated_at`) VALUES
('nl', 'Netherlands', 'eur', 3, NULL, NULL);

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`code`, `symbol`, `fraction`, `format`, `thousands_separator`, `decimal_point`, `decimals`, `created_at`, `updated_at`) VALUES
('eur', '€', 'ct.', '{VALUE} {SYMBOL}', '.', ',', 2, NULL, NULL),
('USD', '$', 'cent', '{SYMBOL}{VALUE}', ',', '.', 2, NULL, NULL);

--
-- Dumping data for table `date`
--

INSERT INTO `date` (`id`, `format`, `created_at`, `updated_at`) VALUES
(1, 'Y-m-d', NULL, NULL),
(2, 'm/d/Y', NULL, NULL),
(3, 'd-m-Y', NULL, NULL);

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `created_at`, `updated_at`) VALUES
('cd7636a7-b30e-4131-b465-d52a6c635756', NULL, NULL);

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `invoice_id`, `area`, `date`, `amount`, `tax_amount`, `customer`, `code`, `order_nr`, `remark`, `pay_before`, `tenant`, `created_at`, `updated_at`) VALUES
(1, 'cd7636a7-b30e-4131-b465-d52a6c635756', NULL, '', '', '', 7, '', '', '', '', 6, NULL, NULL);

--
-- Dumping data for table `invoice_item_detail`
--

INSERT INTO `invoice_item_detail` (`id`, `invoice_id`, `description`, `tax`, `tax_amount`, `qty`, `unit`, `price`, `item_total`, `created_at`, `updated_at`) VALUES
(1, 'cd7636a7-b30e-4131-b465-d52a6c635756', 23, 0, '', '16', 2, '', '', NULL, NULL),
(2, 'cd7636a7-b30e-4131-b465-d52a6c635756', 24, 0, '', '1', 1, '', '', NULL, NULL);

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `address_id`, `email`, `legal_name`, `location_id`, `telephone`, `thing_id`, `contact`, `mobile`, `vat`, `kvk`, `bank_number`, `bank_name`, `swift`, `pin`, `tin`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'Towne, Smith and Ebert', NULL, '760-355-3930', NULL, '', '', '123456789', '', '', '', 'BANK101', '', '', NULL, NULL),
(2, NULL, '', 'John Doe', NULL, '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL),
(3, NULL, 'test@example.com', 'John Doe', NULL, '', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL),
(4, NULL, '', 'Roosevelt Lloyd', NULL, '(520) 318-9486', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL),
(5, 2, '', 'Ashley Medina', NULL, '(520) 318-9486', NULL, '', '', '', '', '', '', '', '', '', NULL, NULL),
(6, 3, 'noud4@home.nl', 'Secure Code', 0, '+31 (0)6 1987 3003', 0, '', '', 'NL003331926895', '783999505', 'NL64RABO0116846267', 'Rabobank', 'RABONL2U', '', '', NULL, NULL),
(7, NULL, '', 'Smartshore Ability', 0, '030 320 0977', 0, '', '', '', '', '', '', '', '', '', NULL, NULL);

--
-- Dumping data for table `postal_address`
--

INSERT INTO `postal_address` (`id`, `address_country`, `address_locality`, `address_region`, `postal_code`, `street_address`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Damianstad', 'CO', '66972-8160', '89982 Pfeffer Falls', NULL, NULL),
(2, NULL, '', '', '', 'The Green Street 12', NULL, NULL),
(3, 'nl', 'Goirle', 'NB', '', 'Voldijkje 13', NULL, NULL);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `tax`, `tax_amount`, `quantity`, `category`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Your service or product title', '9.99', 3, '', '', NULL, NULL, NULL, NULL),
(2, 'Service 1', '2', 3, '', '', NULL, NULL, NULL, NULL),
(3, 'Service 1', '47.79', 3, '', '', NULL, NULL, NULL, NULL),
(4, 'Service 2', '', 3, '', '', NULL, NULL, NULL, NULL),
(5, 'Service 3', '', 3, '', '', NULL, NULL, NULL, NULL),
(6, 'Service 4', '', 3, '', '', NULL, NULL, NULL, NULL),
(7, 'Service 5', '', 3, '', '', NULL, NULL, NULL, NULL),
(8, 'Service 6', '', 3, '', '', NULL, NULL, NULL, NULL),
(9, 'Service 7', '', 3, '', '', NULL, NULL, NULL, NULL),
(10, 'Service 8', '', 3, '', '', NULL, NULL, NULL, NULL),
(11, 'Service 9', '', 3, '', '', NULL, NULL, NULL, NULL),
(12, 'Service 10', '', 3, '', '', NULL, NULL, NULL, NULL),
(13, 'Service 11', '', 3, '', '', NULL, NULL, NULL, NULL),
(14, 'Service 12', '', 3, '', '', NULL, NULL, NULL, NULL),
(15, 'Service 13', '', 3, '', '', NULL, NULL, NULL, NULL),
(16, 'Service 14', '', 3, '', '', NULL, NULL, NULL, NULL),
(17, 'Service 15', '', 3, '', '', NULL, NULL, NULL, NULL),
(18, 'Service 16', '', 3, '', '', NULL, NULL, NULL, NULL),
(19, 'Service 17', '', 3, '', '', NULL, NULL, NULL, NULL),
(20, 'Service 18', '', 3, '', '', NULL, NULL, NULL, NULL),
(21, 'Service 19', '', 3, '', '', NULL, NULL, NULL, NULL),
(22, 'Service 20', '', 3, '', '', NULL, NULL, NULL, NULL),
(23, 'programmeren', '60', 1, '', '', 0, 1, NULL, NULL),
(24, 'OV', '24', 3, '', '', 0, 1, NULL, NULL);

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `name`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'hoog', '21', NULL, NULL),
(2, 'laag', '9', NULL, NULL),
(3, 'geen', '0', NULL, NULL),
(4, '15', '15', NULL, NULL);

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'kg', NULL, NULL),
(2, 'm2', NULL, NULL),
(3, 'hours', NULL, NULL),
(4, 'single item', NULL, NULL),
(5, 'uur', NULL, NULL);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
