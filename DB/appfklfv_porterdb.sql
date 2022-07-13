-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2022 at 04:00 AM
-- Server version: 10.3.34-MariaDB-log-cll-lve
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appfklfv_porterdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fcThHYsbQECrkgmxxxC8Qb:APA91bGR3GFG9biEgDkAlUpxqdERMPVl_-wkJqeKNEm5ANhQzH_DUXHquNgjWLLbSDs65aHQRl9n1Ow7_5lexJaefA7DF7MzGC6Shz6AMNJ-eePi2JlU1exfEXkUc5WeUu7lw2mvsnq7\"},\"old\":{\"device_token\":\"d5BOXPVmSmS3zZ9X3BRkDd:APA91bGgVLM-qYYiZ1g_g9erTomxgPBqHo2iPvMxq3eb3T_AwX6gs6rY7rydn4KnpFCFAcoTXazpvOuOLHwNgdJmWmYHOeaVnjC20D9Fb0u9KYEr6q1Tj1jds1Ht5b8wA7DMOnCkAft1\"}}', '2022-05-13 20:19:01', '2022-05-13 20:19:01'),
(2, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"fcThHYsbQECrkgmxxxC8Qb:APA91bGR3GFG9biEgDkAlUpxqdERMPVl_-wkJqeKNEm5ANhQzH_DUXHquNgjWLLbSDs65aHQRl9n1Ow7_5lexJaefA7DF7MzGC6Shz6AMNJ-eePi2JlU1exfEXkUc5WeUu7lw2mvsnq7\"}}', '2022-05-13 20:19:07', '2022-05-13 20:19:07'),
(3, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fcThHYsbQECrkgmxxxC8Qb:APA91bGR3GFG9biEgDkAlUpxqdERMPVl_-wkJqeKNEm5ANhQzH_DUXHquNgjWLLbSDs65aHQRl9n1Ow7_5lexJaefA7DF7MzGC6Shz6AMNJ-eePi2JlU1exfEXkUc5WeUu7lw2mvsnq7\"},\"old\":{\"device_token\":null}}', '2022-05-13 20:19:12', '2022-05-13 20:19:12'),
(4, 'Order', 'created', 'App\\Order', 45, 'App\\User', 29, '{\"attributes\":{\"customer_id\":\"29\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"8\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-13 20:21:26', '2022-05-13 20:21:26'),
(5, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 29, '{\"attributes\":{\"sub_total\":\"200\",\"grand_total\":\"200\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-13 20:21:26', '2022-05-13 20:21:26'),
(6, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-13 20:22:25', '2022-05-13 20:22:25'),
(7, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-13 20:22:28', '2022-05-13 20:22:28'),
(8, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-13 20:22:53', '2022-05-13 20:22:53'),
(9, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-13 20:23:26', '2022-05-13 20:23:26'),
(10, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-13 20:23:38', '2022-05-13 20:23:38'),
(11, 'Order', 'updated', 'App\\Order', 45, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-13 20:24:27', '2022-05-13 20:24:27'),
(12, 'Order', 'created', 'App\\Order', 46, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-13 22:47:33', '2022-05-13 22:47:33'),
(13, 'Order', 'updated', 'App\\Order', 46, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-13 22:47:33', '2022-05-13 22:47:33'),
(14, 'Order', 'created', 'App\\Order', 47, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 00:22:13', '2022-05-14 00:22:13'),
(15, 'Order', 'updated', 'App\\Order', 47, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 00:22:13', '2022-05-14 00:22:13'),
(16, 'Order', 'created', 'App\\Order', 48, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 00:22:15', '2022-05-14 00:22:15'),
(17, 'Order', 'updated', 'App\\Order', 48, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 00:22:15', '2022-05-14 00:22:15'),
(18, 'Order', 'created', 'App\\Order', 49, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"12\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 00:22:27', '2022-05-14 00:22:27'),
(19, 'Order', 'updated', 'App\\Order', 49, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 00:22:27', '2022-05-14 00:22:27'),
(20, 'Order', 'created', 'App\\Order', 50, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"12\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 00:22:28', '2022-05-14 00:22:28'),
(21, 'Order', 'updated', 'App\\Order', 50, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 00:22:28', '2022-05-14 00:22:28'),
(22, 'Order', 'created', 'App\\Order', 51, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 03:41:13', '2022-05-14 03:41:13'),
(23, 'Order', 'updated', 'App\\Order', 51, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 03:41:13', '2022-05-14 03:41:13'),
(24, 'Order', 'created', 'App\\Order', 52, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"12\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 03:41:20', '2022-05-14 03:41:20'),
(25, 'Order', 'updated', 'App\\Order', 52, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 03:41:20', '2022-05-14 03:41:20'),
(26, 'Order', 'created', 'App\\Order', 53, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"13\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 03:41:27', '2022-05-14 03:41:27'),
(27, 'Order', 'updated', 'App\\Order', 53, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 03:41:27', '2022-05-14 03:41:27'),
(28, 'Order', 'created', 'App\\Order', 54, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 03:43:34', '2022-05-14 03:43:34'),
(29, 'Order', 'updated', 'App\\Order', 54, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 03:43:34', '2022-05-14 03:43:34'),
(30, 'Order', 'created', 'App\\Order', 55, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 04:33:59', '2022-05-14 04:33:59'),
(31, 'Order', 'updated', 'App\\Order', 55, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:33:59', '2022-05-14 04:33:59'),
(32, 'Order', 'created', 'App\\Order', 56, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 04:41:19', '2022-05-14 04:41:19'),
(33, 'Order', 'updated', 'App\\Order', 56, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:41:19', '2022-05-14 04:41:19'),
(34, 'Order', 'created', 'App\\Order', 57, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 04:47:18', '2022-05-14 04:47:18'),
(35, 'Order', 'updated', 'App\\Order', 57, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:47:18', '2022-05-14 04:47:18'),
(36, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"},\"old\":{\"device_token\":\"fcThHYsbQECrkgmxxxC8Qb:APA91bGR3GFG9biEgDkAlUpxqdERMPVl_-wkJqeKNEm5ANhQzH_DUXHquNgjWLLbSDs65aHQRl9n1Ow7_5lexJaefA7DF7MzGC6Shz6AMNJ-eePi2JlU1exfEXkUc5WeUu7lw2mvsnq7\"}}', '2022-05-14 04:50:03', '2022-05-14 04:50:03'),
(37, 'Order', 'created', 'App\\Order', 58, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 04:53:51', '2022-05-14 04:53:51'),
(38, 'Order', 'updated', 'App\\Order', 58, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:53:51', '2022-05-14 04:53:51'),
(39, 'Order', 'created', 'App\\Order', 59, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"1\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-14 04:57:43', '2022-05-14 04:57:43'),
(40, 'Order', 'updated', 'App\\Order', 59, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"100\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:57:43', '2022-05-14 04:57:43'),
(41, 'Order', 'created', 'App\\Order', 60, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 04:58:02', '2022-05-14 04:58:02'),
(42, 'Order', 'updated', 'App\\Order', 60, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 04:58:02', '2022-05-14 04:58:02'),
(43, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"0\"},\"old\":{\"onlineStatus\":\"1\"}}', '2022-05-14 04:58:46', '2022-05-14 04:58:46'),
(44, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"1\"},\"old\":{\"onlineStatus\":\"0\"}}', '2022-05-14 04:58:47', '2022-05-14 04:58:47'),
(45, 'Order', 'created', 'App\\Order', 61, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"10\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"16\",\"distance\":null,\"note\":null}}', '2022-05-14 05:00:04', '2022-05-14 05:00:04'),
(46, 'Order', 'updated', 'App\\Order', 61, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"500\",\"grand_total\":\"516\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 05:00:04', '2022-05-14 05:00:04'),
(47, 'Order', 'created', 'App\\Order', 62, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-14 05:03:43', '2022-05-14 05:03:43'),
(48, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"68\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 05:03:43', '2022-05-14 05:03:43'),
(49, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-14 05:04:05', '2022-05-14 05:04:05'),
(50, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 05:04:07', '2022-05-14 05:04:07'),
(51, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-14 05:04:09', '2022-05-14 05:04:09'),
(52, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-14 05:04:25', '2022-05-14 05:04:25'),
(53, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-14 05:06:29', '2022-05-14 05:06:29'),
(54, 'Order', 'updated', 'App\\Order', 62, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-14 05:06:33', '2022-05-14 05:06:33'),
(55, 'Order', 'created', 'App\\Order', 63, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"29\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 05:09:10', '2022-05-14 05:09:10'),
(56, 'Order', 'updated', 'App\\Order', 63, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 05:09:10', '2022-05-14 05:09:10'),
(57, 'Order', 'created', 'App\\Order', 64, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(58, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"2750\",\"grand_total\":\"2768\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(59, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-14 05:12:20', '2022-05-14 05:12:20'),
(60, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 05:16:16', '2022-05-14 05:16:16'),
(61, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-14 05:16:20', '2022-05-14 05:16:20'),
(62, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-14 05:17:29', '2022-05-14 05:17:29'),
(63, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-14 05:18:41', '2022-05-14 05:18:41'),
(64, 'Order', 'updated', 'App\\Order', 64, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-14 05:19:31', '2022-05-14 05:19:31'),
(65, 'Order', 'created', 'App\\Order', 65, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-14 10:08:14', '2022-05-14 10:08:14'),
(66, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"850\",\"grand_total\":\"868\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 10:08:14', '2022-05-14 10:08:14'),
(67, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-14 10:08:33', '2022-05-14 10:08:33'),
(68, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 10:09:00', '2022-05-14 10:09:00'),
(69, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-14 10:09:03', '2022-05-14 10:09:03'),
(70, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-14 10:09:20', '2022-05-14 10:09:20'),
(71, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-14 10:10:08', '2022-05-14 10:10:08'),
(72, 'Order', 'updated', 'App\\Order', 65, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-14 10:10:22', '2022-05-14 10:10:22'),
(73, 'Order', 'created', 'App\\Order', 66, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"40\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 17:24:03', '2022-05-14 17:24:03'),
(74, 'Order', 'updated', 'App\\Order', 66, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 17:24:03', '2022-05-14 17:24:03'),
(75, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"}}', '2022-05-14 17:38:58', '2022-05-14 17:38:58'),
(76, 'Order', 'created', 'App\\Order', 67, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"40\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"12\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-14 18:35:51', '2022-05-14 18:35:51'),
(77, 'Order', 'updated', 'App\\Order', 67, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"750\",\"grand_total\":\"772\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 18:35:51', '2022-05-14 18:35:51'),
(78, 'Order', 'updated', 'App\\Order', 1, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 18:36:28', '2022-05-14 18:36:28'),
(79, 'Order', 'created', 'App\\Order', 68, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"12\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-14 18:50:19', '2022-05-14 18:50:19'),
(80, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"700\",\"grand_total\":\"718\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 18:50:19', '2022-05-14 18:50:19'),
(81, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-14 18:51:28', '2022-05-14 18:51:28'),
(82, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 18:51:39', '2022-05-14 18:51:39'),
(83, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-14 18:51:48', '2022-05-14 18:51:48'),
(84, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"},\"old\":{\"device_token\":null}}', '2022-05-14 18:53:21', '2022-05-14 18:53:21'),
(85, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-14 18:53:54', '2022-05-14 18:53:54'),
(86, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"},\"old\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"}}', '2022-05-14 18:55:44', '2022-05-14 18:55:44'),
(87, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-14 18:56:06', '2022-05-14 18:56:06'),
(88, 'Order', 'updated', 'App\\Order', 68, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-14 18:56:37', '2022-05-14 18:56:37'),
(89, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"},\"old\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"}}', '2022-05-14 18:56:39', '2022-05-14 18:56:39'),
(90, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"},\"old\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"}}', '2022-05-14 19:03:54', '2022-05-14 19:03:54'),
(91, 'Order', 'created', 'App\\Order', 69, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-14 23:54:24', '2022-05-14 23:54:24'),
(92, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"1600\",\"grand_total\":\"1618\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-14 23:54:24', '2022-05-14 23:54:24'),
(93, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-14 23:55:10', '2022-05-14 23:55:10'),
(94, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-14 23:55:15', '2022-05-14 23:55:15'),
(95, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-14 23:55:17', '2022-05-14 23:55:17'),
(96, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"},\"old\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"}}', '2022-05-14 23:55:35', '2022-05-14 23:55:35'),
(97, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-14 23:56:06', '2022-05-14 23:56:06'),
(98, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-14 23:56:41', '2022-05-14 23:56:41'),
(99, 'Order', 'updated', 'App\\Order', 69, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-14 23:56:45', '2022-05-14 23:56:45'),
(100, 'Order', 'created', 'App\\Order', 70, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(101, 'Order', 'updated', 'App\\Order', 70, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"2250\",\"grand_total\":\"2268\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(102, 'Order', 'updated', 'App\\Order', 70, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-15 01:56:01', '2022-05-15 01:56:01'),
(103, 'Order', 'updated', 'App\\Order', 70, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-15 01:58:46', '2022-05-15 01:58:46'),
(104, 'Order', 'updated', 'App\\Order', 70, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-15 01:58:53', '2022-05-15 01:58:53'),
(105, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1631877\",\"longitude\":\"-4.2560543\"},\"old\":{\"latitude\":\"24.9048241\",\"longitude\":\"67.078101\"}}', '2022-05-15 02:11:51', '2022-05-15 02:11:51'),
(106, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"e4bwWssnSPuEvVQYpO9DZ9:APA91bGBODNuPWTUhaHayQFyk4eQ07Eh6K-jqU79pDVGUilAjewlR0QcvqbOG-jficxBTRrsEg9BbWXUYynGC65xni-ABotmrU-Pf4ssKNu2bFWRAI3ln8CMWhpR2i2hN-ALjIFkRvTe\"},\"old\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"}}', '2022-05-15 02:11:58', '2022-05-15 02:11:58'),
(107, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1607283\",\"longitude\":\"-4.2587033\"},\"old\":{\"latitude\":\"11.1631877\",\"longitude\":\"-4.2560543\"}}', '2022-05-15 02:11:59', '2022-05-15 02:11:59'),
(108, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1607286\"},\"old\":{\"latitude\":\"11.1607283\"}}', '2022-05-15 02:12:10', '2022-05-15 02:12:10'),
(109, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1607283\"},\"old\":{\"latitude\":\"11.1607286\"}}', '2022-05-15 02:12:20', '2022-05-15 02:12:20'),
(110, 'Order', 'updated', 'App\\Order', 70, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-15 02:12:50', '2022-05-15 02:12:50'),
(111, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1607971\",\"longitude\":\"-4.2586542\"},\"old\":{\"latitude\":\"11.1607283\",\"longitude\":\"-4.2587033\"}}', '2022-05-15 02:13:02', '2022-05-15 02:13:02'),
(112, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1607984\",\"longitude\":\"-4.2586533\"},\"old\":{\"latitude\":\"11.1607971\",\"longitude\":\"-4.2586542\"}}', '2022-05-15 02:13:14', '2022-05-15 02:13:14'),
(113, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.16087\",\"longitude\":\"-4.2536467\"},\"old\":{\"latitude\":\"11.1607984\",\"longitude\":\"-4.2586533\"}}', '2022-05-15 02:13:21', '2022-05-15 02:13:21'),
(114, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1619857\",\"longitude\":\"-4.2548086\"},\"old\":{\"latitude\":\"11.16087\",\"longitude\":\"-4.2536467\"}}', '2022-05-15 02:13:24', '2022-05-15 02:13:24'),
(115, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.161608\",\"longitude\":\"-4.2563513\"},\"old\":{\"latitude\":\"11.1619857\",\"longitude\":\"-4.2548086\"}}', '2022-05-15 02:13:33', '2022-05-15 02:13:33'),
(116, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1616049\",\"longitude\":\"-4.2563667\"},\"old\":{\"latitude\":\"11.161608\",\"longitude\":\"-4.2563513\"}}', '2022-05-15 02:13:36', '2022-05-15 02:13:36'),
(117, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"11.1615594\",\"longitude\":\"-4.2565123\"},\"old\":{\"latitude\":\"11.1616049\",\"longitude\":\"-4.2563667\"}}', '2022-05-15 02:13:43', '2022-05-15 02:13:43'),
(118, 'Order', 'created', 'App\\Order', 71, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-15 05:51:59', '2022-05-15 05:51:59'),
(119, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"68\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-15 05:51:59', '2022-05-15 05:51:59'),
(120, 'Address', 'created', 'App\\Address', 19, 'App\\User', 73, '{\"attributes\":{\"user_id\":\"73\",\"address\":\"Ouagadougou, Burkina Faso\",\"latitude\":\"12.370465166913\",\"longitude\":\"-1.5143520033213\",\"address_name\":\"Other\"}}', '2022-05-15 16:15:44', '2022-05-15 16:15:44'),
(121, 'Order', 'created', 'App\\Order', 72, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-15 16:16:03', '2022-05-15 16:16:03'),
(122, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"68\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-15 16:16:03', '2022-05-15 16:16:03'),
(123, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-15 16:16:32', '2022-05-15 16:16:32'),
(124, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-15 16:16:37', '2022-05-15 16:16:37'),
(125, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-15 16:16:41', '2022-05-15 16:16:41'),
(126, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"},\"old\":{\"device_token\":\"e4bwWssnSPuEvVQYpO9DZ9:APA91bGBODNuPWTUhaHayQFyk4eQ07Eh6K-jqU79pDVGUilAjewlR0QcvqbOG-jficxBTRrsEg9BbWXUYynGC65xni-ABotmrU-Pf4ssKNu2bFWRAI3ln8CMWhpR2i2hN-ALjIFkRvTe\"}}', '2022-05-15 16:16:50', '2022-05-15 16:16:50'),
(127, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-15 16:17:22', '2022-05-15 16:17:22'),
(128, 'Order', 'created', 'App\\Order', 73, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-16 04:18:53', '2022-05-16 04:18:53'),
(129, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"1200\",\"grand_total\":\"1218\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 04:18:53', '2022-05-16 04:18:53'),
(130, 'Order', 'created', 'App\\Order', 74, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-16 11:31:57', '2022-05-16 11:31:57'),
(131, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"1600\",\"grand_total\":\"1618\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 11:31:57', '2022-05-16 11:31:57'),
(132, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-16 11:32:53', '2022-05-16 11:32:53'),
(133, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-16 11:32:55', '2022-05-16 11:32:55'),
(134, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-16 11:32:58', '2022-05-16 11:32:58'),
(135, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"},\"old\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"}}', '2022-05-16 11:33:43', '2022-05-16 11:33:43'),
(136, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-16 11:34:17', '2022-05-16 11:34:17'),
(137, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-16 11:34:29', '2022-05-16 11:34:29'),
(138, 'Order', 'updated', 'App\\Order', 74, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-16 11:34:40', '2022-05-16 11:34:40'),
(139, 'Order', 'updated', 'App\\Order', 1, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"ready\"}}', '2022-05-16 11:36:26', '2022-05-16 11:36:26'),
(140, 'User', 'created', 'App\\User', 110, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"alex\",\"email\":\"shopper@yopmail.com\",\"phone\":\"946565822\",\"address\":\"london\",\"image\":\"public\\/uploads\\/users\\/img\\/user-avatar.png\",\"password\":\"$2y$10$3zlx4c4ba40J1MOEj.dRDuf5UNGBNxxEMy12H\\/\\/iUgCAYchHFYJSi\",\"otp\":\"9459\",\"device_type\":null,\"latitude\":null,\"longitude\":null,\"br_code\":null,\"age\":null,\"dob\":null,\"country_code\":null,\"country_flag\":null,\"device_token\":null,\"identity\":null,\"id_image\":null,\"description\":null,\"verified_by\":\"email\",\"social_provider\":null,\"social_token\":null,\"social_id\":null,\"onlineStatus\":\"0\",\"min_order\":null,\"order_type\":null}}', '2022-05-16 11:53:58', '2022-05-16 11:53:58'),
(141, 'User', 'updated', 'App\\User', 110, NULL, NULL, '{\"attributes\":{\"otp\":null},\"old\":{\"otp\":\"9459\"}}', '2022-05-16 11:54:20', '2022-05-16 11:54:20'),
(142, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"cbuzV1tcT_a-LaMjEzdowH:APA91bFdG_vaeacWVpqgfY-MDjXFBtJyj2A87kKFoNCs7PA4rad9H61PX_hgf5cu0q94SkUt6hvUX1MWN1PZGlBQNC3uJI-97knlBlWi3c69CO8_f4xBhKQPsVUgZdjAKhW5quEf9wra\"}}', '2022-05-16 12:04:27', '2022-05-16 12:04:27'),
(143, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cbuzV1tcT_a-LaMjEzdowH:APA91bFdG_vaeacWVpqgfY-MDjXFBtJyj2A87kKFoNCs7PA4rad9H61PX_hgf5cu0q94SkUt6hvUX1MWN1PZGlBQNC3uJI-97knlBlWi3c69CO8_f4xBhKQPsVUgZdjAKhW5quEf9wra\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 12:09:53', '2022-05-16 12:09:53'),
(144, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"cbuzV1tcT_a-LaMjEzdowH:APA91bFdG_vaeacWVpqgfY-MDjXFBtJyj2A87kKFoNCs7PA4rad9H61PX_hgf5cu0q94SkUt6hvUX1MWN1PZGlBQNC3uJI-97knlBlWi3c69CO8_f4xBhKQPsVUgZdjAKhW5quEf9wra\"}}', '2022-05-16 12:19:21', '2022-05-16 12:19:21'),
(145, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cbuzV1tcT_a-LaMjEzdowH:APA91bFdG_vaeacWVpqgfY-MDjXFBtJyj2A87kKFoNCs7PA4rad9H61PX_hgf5cu0q94SkUt6hvUX1MWN1PZGlBQNC3uJI-97knlBlWi3c69CO8_f4xBhKQPsVUgZdjAKhW5quEf9wra\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 12:43:59', '2022-05-16 12:43:59'),
(146, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"cbuzV1tcT_a-LaMjEzdowH:APA91bFdG_vaeacWVpqgfY-MDjXFBtJyj2A87kKFoNCs7PA4rad9H61PX_hgf5cu0q94SkUt6hvUX1MWN1PZGlBQNC3uJI-97knlBlWi3c69CO8_f4xBhKQPsVUgZdjAKhW5quEf9wra\"}}', '2022-05-16 13:06:47', '2022-05-16 13:06:47'),
(147, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 13:34:09', '2022-05-16 13:34:09'),
(148, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 14:22:32', '2022-05-16 14:22:32'),
(149, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 14:42:08', '2022-05-16 14:42:08'),
(150, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 14:53:19', '2022-05-16 14:53:19'),
(151, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 14:56:36', '2022-05-16 14:56:36'),
(152, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 14:56:37', '2022-05-16 14:56:37'),
(153, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 14:56:50', '2022-05-16 14:56:50'),
(154, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 14:56:57', '2022-05-16 14:56:57'),
(155, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 14:56:57', '2022-05-16 14:56:57'),
(156, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:04:28', '2022-05-16 15:04:28');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(157, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:05:25', '2022-05-16 15:05:25'),
(158, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:05:36', '2022-05-16 15:05:36'),
(159, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:05:37', '2022-05-16 15:05:37'),
(160, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:06:42', '2022-05-16 15:06:42'),
(161, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:06:53', '2022-05-16 15:06:53'),
(162, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:06:55', '2022-05-16 15:06:55'),
(163, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:06:56', '2022-05-16 15:06:56'),
(164, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:07:46', '2022-05-16 15:07:46'),
(165, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:07:48', '2022-05-16 15:07:48'),
(166, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:07:59', '2022-05-16 15:07:59'),
(167, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:09:09', '2022-05-16 15:09:09'),
(168, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:09:15', '2022-05-16 15:09:15'),
(169, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:09:28', '2022-05-16 15:09:28'),
(170, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:09:28', '2022-05-16 15:09:28'),
(171, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:15:23', '2022-05-16 15:15:23'),
(172, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 15:16:39', '2022-05-16 15:16:39'),
(173, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:16:40', '2022-05-16 15:16:40'),
(174, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:19:24', '2022-05-16 15:19:24'),
(175, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 15:20:02', '2022-05-16 15:20:02'),
(176, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:20:09', '2022-05-16 15:20:09'),
(177, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:20:17', '2022-05-16 15:20:17'),
(178, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 15:35:45', '2022-05-16 15:35:45'),
(179, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:35:46', '2022-05-16 15:35:46'),
(180, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:35:46', '2022-05-16 15:35:46'),
(181, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:38:20', '2022-05-16 15:38:20'),
(182, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:38:27', '2022-05-16 15:38:27'),
(183, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 15:38:30', '2022-05-16 15:38:30'),
(184, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:40:16', '2022-05-16 15:40:16'),
(185, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 15:44:31', '2022-05-16 15:44:31'),
(186, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":null}}', '2022-05-16 15:44:37', '2022-05-16 15:44:37'),
(187, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 15:51:04', '2022-05-16 15:51:04'),
(188, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 15:51:06', '2022-05-16 15:51:06'),
(189, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 16:00:04', '2022-05-16 16:00:04'),
(190, 'User', 'updated', 'App\\User', 59, 'App\\User', 59, '{\"attributes\":{\"onlineStatus\":\"1\"},\"old\":{\"onlineStatus\":\"0\"}}', '2022-05-16 16:04:16', '2022-05-16 16:04:16'),
(191, 'Item', 'created', 'App\\Item', 45, 'App\\User', 59, '{\"attributes\":{\"name\":\"Tapal Tea\",\"restaurant_id\":\"59\",\"category_id\":\"9\",\"rider_id\":null,\"grocery_id\":null,\"shopper_id\":null,\"price\":\"450\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/6282418641bd8.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":null}}', '2022-05-16 16:20:22', '2022-05-16 16:20:22'),
(192, 'Order', 'created', 'App\\Order', 75, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-16 16:21:35', '2022-05-16 16:21:35'),
(193, 'Order', 'updated', 'App\\Order', 75, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"550\",\"grand_total\":\"550\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 16:21:35', '2022-05-16 16:21:35'),
(194, 'Order', 'created', 'App\\Order', 76, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-16 16:22:04', '2022-05-16 16:22:04'),
(195, 'Order', 'updated', 'App\\Order', 76, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"550\",\"grand_total\":\"550\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 16:22:04', '2022-05-16 16:22:04'),
(196, 'Order', 'created', 'App\\Order', 77, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"0\",\"distance\":null,\"note\":null}}', '2022-05-16 16:22:34', '2022-05-16 16:22:34'),
(197, 'Order', 'updated', 'App\\Order', 77, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"550\",\"grand_total\":\"550\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 16:22:34', '2022-05-16 16:22:34'),
(198, 'User', 'created', 'App\\User', 111, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"alex\",\"email\":\"alexss@mail.com\",\"phone\":\"946565822\",\"address\":null,\"image\":\"public\\/uploads\\/users\\/img\\/user-avatar.png\",\"password\":\"$2y$10$dBj98QBISsAeX8Vkwmi3iuP6mR.zQeWvEb\\/HJhKIuAY4ekrHlwgUG\",\"otp\":\"7282\",\"device_type\":null,\"latitude\":null,\"longitude\":null,\"br_code\":\"123\",\"age\":null,\"dob\":null,\"country_code\":null,\"country_flag\":null,\"device_token\":null,\"identity\":null,\"id_image\":null,\"description\":null,\"verified_by\":\"email\",\"social_provider\":null,\"social_token\":null,\"social_id\":null,\"onlineStatus\":\"0\",\"min_order\":null,\"order_type\":null}}', '2022-05-16 17:13:47', '2022-05-16 17:13:47'),
(199, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 17:51:38', '2022-05-16 17:51:38'),
(200, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":null}}', '2022-05-16 17:51:41', '2022-05-16 17:51:41'),
(201, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 17:53:03', '2022-05-16 17:53:03'),
(202, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"etsTnEqCTSug7QcaU5w-3u:APA91bHanUd2kIjdKSviZ2SX8MlANlGMOExePvsSe6Hg6IGx4_UHkFvsmYfk7gEBp6k5kXuFEfbSrv4wp8SsgWcoc8_x4oowErOW9JwjNLsvChDTECcTf_fe6P6psFqDK6eHLA_oQaqF\"}}', '2022-05-16 17:55:08', '2022-05-16 17:55:08'),
(203, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":null}}', '2022-05-16 17:55:14', '2022-05-16 17:55:14'),
(204, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 17:55:17', '2022-05-16 17:55:17'),
(205, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 17:57:55', '2022-05-16 17:57:55'),
(206, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:00:46', '2022-05-16 18:00:46'),
(207, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 18:01:13', '2022-05-16 18:01:13'),
(208, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:01:40', '2022-05-16 18:01:40'),
(209, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fNC7BSLvi0rpvJ0Bpge5GV:APA91bG0lV27i6JbTcpNUicxs_QCLnJDAe7FHJcdedd4AxBLwY_lg9Prv6sDjjV93Y1OV2nxXJuu7uidifS8UZUz0R8Z0Iz4g3Bv_i8Ymxr9BDiSAG2CWoR9ZUha27Yujn-lYZst12yT\"}}', '2022-05-16 18:01:44', '2022-05-16 18:01:44'),
(210, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:01:50', '2022-05-16 18:01:50'),
(211, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fhOYQHgZSqST8KTuhQ4Chu:APA91bHFidVwd4uZ-8lli44RNMHmPB5Eh2zXVdS3jkvg09fUvNgHlIf1oznXbGc7GHC_CQ5J3OKJabZbnB0btVkXEAaBdlAMPP2A16wIkVcK_eXez0lw3et3hd2K8vcpL4Syf3IVywqX\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:02:50', '2022-05-16 18:02:50'),
(212, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"fhOYQHgZSqST8KTuhQ4Chu:APA91bHFidVwd4uZ-8lli44RNMHmPB5Eh2zXVdS3jkvg09fUvNgHlIf1oznXbGc7GHC_CQ5J3OKJabZbnB0btVkXEAaBdlAMPP2A16wIkVcK_eXez0lw3et3hd2K8vcpL4Syf3IVywqX\"}}', '2022-05-16 18:03:03', '2022-05-16 18:03:03'),
(213, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eaavkyZMHkKKrKgsq26b56:APA91bF8ZKz_xdSgdt_QgXb6iFWYtPRB7WSDoaEtoZPHVjyYttGlcUOvz-IR7-YNzipLeR-51RUvPxpwVFP7cBqXLsf-_B71gOwApaDhDndN51HC1n1K_YhsjrLi-G0Vk55__-W74Uad\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:10:04', '2022-05-16 18:10:04'),
(214, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":\"eaavkyZMHkKKrKgsq26b56:APA91bF8ZKz_xdSgdt_QgXb6iFWYtPRB7WSDoaEtoZPHVjyYttGlcUOvz-IR7-YNzipLeR-51RUvPxpwVFP7cBqXLsf-_B71gOwApaDhDndN51HC1n1K_YhsjrLi-G0Vk55__-W74Uad\"}}', '2022-05-16 18:10:06', '2022-05-16 18:10:06'),
(215, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:10:19', '2022-05-16 18:10:19'),
(216, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:11:21', '2022-05-16 18:11:21'),
(217, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"},\"old\":{\"device_token\":\"dklpTB5YQ8eJnWAlB4uBT5:APA91bGj5bwhUmyMAM0oAfNP21tx2b8HVuhpLYKls2o_ICOIWjYkO15eiXii7WI7ZboWAEW3Zhwlj2cHI4ev-1s6aNbEU3BR3Vj8lYIJBZHBT2CjHuskBExrnOawGxLB9FNnv_-LPZQD\"}}', '2022-05-16 18:12:58', '2022-05-16 18:12:58'),
(218, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"}}', '2022-05-16 18:14:40', '2022-05-16 18:14:40'),
(219, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:15:01', '2022-05-16 18:15:01'),
(220, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"}}', '2022-05-16 18:32:21', '2022-05-16 18:32:21'),
(221, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:32:24', '2022-05-16 18:32:24'),
(222, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"}}', '2022-05-16 18:32:32', '2022-05-16 18:32:32'),
(223, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dd82BFQZS4WU9F4hGQP_3Z:APA91bFxcmYBquQuCVUpaLhRtsQITCGTmQ1jetPTrQtLBFtF9lRbvcV1JMsmPHai7-8H40BWdGTjvk_dAixVWKjbVi-XI3foj2dVLaHStK834enjcOe4NhzRQnaJ-zhBwmhjHaMa9M0o\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:40:18', '2022-05-16 18:40:18'),
(224, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dd82BFQZS4WU9F4hGQP_3Z:APA91bFxcmYBquQuCVUpaLhRtsQITCGTmQ1jetPTrQtLBFtF9lRbvcV1JMsmPHai7-8H40BWdGTjvk_dAixVWKjbVi-XI3foj2dVLaHStK834enjcOe4NhzRQnaJ-zhBwmhjHaMa9M0o\"}}', '2022-05-16 18:40:23', '2022-05-16 18:40:23'),
(225, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"dd82BFQZS4WU9F4hGQP_3Z:APA91bFxcmYBquQuCVUpaLhRtsQITCGTmQ1jetPTrQtLBFtF9lRbvcV1JMsmPHai7-8H40BWdGTjvk_dAixVWKjbVi-XI3foj2dVLaHStK834enjcOe4NhzRQnaJ-zhBwmhjHaMa9M0o\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:40:27', '2022-05-16 18:40:27'),
(226, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dd82BFQZS4WU9F4hGQP_3Z:APA91bFxcmYBquQuCVUpaLhRtsQITCGTmQ1jetPTrQtLBFtF9lRbvcV1JMsmPHai7-8H40BWdGTjvk_dAixVWKjbVi-XI3foj2dVLaHStK834enjcOe4NhzRQnaJ-zhBwmhjHaMa9M0o\"}}', '2022-05-16 18:42:05', '2022-05-16 18:42:05'),
(227, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"fhOYQHgZSqST8KTuhQ4Chu:APA91bHFidVwd4uZ-8lli44RNMHmPB5Eh2zXVdS3jkvg09fUvNgHlIf1oznXbGc7GHC_CQ5J3OKJabZbnB0btVkXEAaBdlAMPP2A16wIkVcK_eXez0lw3et3hd2K8vcpL4Syf3IVywqX\"},\"old\":{\"device_token\":null}}', '2022-05-16 18:50:47', '2022-05-16 18:50:47'),
(228, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cXlt38qGRpCx9Hds8iXL8t:APA91bF8UnZRjmmZi8a0QZQD3P0hX3Gue8x5C34qcYVOoawX0phRuykOu16Ilk3O0mYf1EPIMwR3tkm_hGbvqxiGQ0wbaiJz_jvX-LersostB22yzgWece_ddhh752_X29HOrMsbBLfg\"},\"old\":{\"device_token\":\"fhOYQHgZSqST8KTuhQ4Chu:APA91bHFidVwd4uZ-8lli44RNMHmPB5Eh2zXVdS3jkvg09fUvNgHlIf1oznXbGc7GHC_CQ5J3OKJabZbnB0btVkXEAaBdlAMPP2A16wIkVcK_eXez0lw3et3hd2K8vcpL4Syf3IVywqX\"}}', '2022-05-16 19:13:46', '2022-05-16 19:13:46'),
(229, 'Order', 'updated', 'App\\Order', 77, 'App\\User', 109, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-16 19:14:10', '2022-05-16 19:14:10'),
(230, 'Order', 'updated', 'App\\Order', 76, 'App\\User', 109, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-16 19:55:41', '2022-05-16 19:55:41'),
(231, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"f5gDMWvg-0c6gI6l1CZ5aZ:APA91bHsn1IFi1JrHb2hBDttwE7dRjLykq-fY2S7d6wb8EDOhP_OTiNC4nej2bigFn8h3sfeyY2QboBdyFHBS_Aj43a6alWPEU0aDYpLdHnErzz2P8ifTmdwsI0gad3Dt7wYT5n8WIgM\"},\"old\":{\"device_token\":\"fnBDQgdwt06ZvQH3dsbI2V:APA91bHUTEht2ypZZ8OandZFLWH09ZAGsQpx27O3aLhboEyFRDGFvMyiTRDdoGXfz6Sk7ZKWaAVVhKN4dHhUjqZ5Wth7qUltZxRpF67BqgVk4VOJYG7A6lzsb-3uMjnwtuK0PjHG2J6n\"}}', '2022-05-16 20:20:46', '2022-05-16 20:20:46'),
(232, 'Order', 'created', 'App\\Order', 78, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"18\",\"distance\":null,\"note\":null}}', '2022-05-16 20:31:39', '2022-05-16 20:31:39'),
(233, 'Order', 'updated', 'App\\Order', 78, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"68\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-16 20:31:39', '2022-05-16 20:31:39'),
(234, 'Order', 'updated', 'App\\Order', 78, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-16 20:32:43', '2022-05-16 20:32:43'),
(235, 'Order', 'updated', 'App\\Order', 78, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-16 20:32:49', '2022-05-16 20:32:49'),
(236, 'Order', 'updated', 'App\\Order', 75, 'App\\User', 109, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-17 12:28:55', '2022-05-17 12:28:55'),
(237, 'Order', 'updated', 'App\\Order', 76, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-17 12:49:51', '2022-05-17 12:49:51'),
(238, 'Item', 'created', 'App\\Item', 46, 'App\\User', 59, '{\"attributes\":{\"name\":\"Tapal Tea\",\"restaurant_id\":null,\"category_id\":\"10\",\"rider_id\":null,\"grocery_id\":null,\"shopper_id\":null,\"price\":\"475\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/6283823ac3b10.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":null}}', '2022-05-17 15:08:42', '2022-05-17 15:08:42'),
(239, 'Item', 'created', 'App\\Item', 47, 'App\\User', 59, '{\"attributes\":{\"name\":\"Tapal Tea\",\"restaurant_id\":null,\"category_id\":\"10\",\"rider_id\":null,\"grocery_id\":\"59\",\"shopper_id\":null,\"price\":\"475\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/628383decea4d.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":null}}', '2022-05-17 15:15:42', '2022-05-17 15:15:42'),
(240, 'Item', 'created', 'App\\Item', 48, 'App\\User', 59, '{\"attributes\":{\"name\":\"Mango\",\"restaurant_id\":null,\"category_id\":\"7\",\"rider_id\":null,\"grocery_id\":\"59\",\"shopper_id\":null,\"price\":\"35\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/6283878d3c5a5.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":null}}', '2022-05-17 15:31:25', '2022-05-17 15:31:25'),
(241, 'Order', 'created', 'App\\Order', 80, 'App\\User', 29, '{\"attributes\":{\"customer_id\":\"29\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"10\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"26\",\"distance\":null,\"note\":null}}', '2022-05-17 18:45:41', '2022-05-17 18:45:41'),
(242, 'Order', 'updated', 'App\\Order', 80, 'App\\User', 29, '{\"attributes\":{\"sub_total\":\"510\",\"grand_total\":\"536\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-17 18:45:41', '2022-05-17 18:45:41'),
(243, 'Order', 'updated', 'App\\Order', 80, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-17 18:54:06', '2022-05-17 18:54:06'),
(244, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"},\"old\":{\"device_token\":\"cXlt38qGRpCx9Hds8iXL8t:APA91bF8UnZRjmmZi8a0QZQD3P0hX3Gue8x5C34qcYVOoawX0phRuykOu16Ilk3O0mYf1EPIMwR3tkm_hGbvqxiGQ0wbaiJz_jvX-LersostB22yzgWece_ddhh752_X29HOrMsbBLfg\"}}', '2022-05-17 19:03:33', '2022-05-17 19:03:33'),
(245, 'Address', 'created', 'App\\Address', 20, 'App\\User', 104, '{\"attributes\":{\"user_id\":\"104\",\"address\":\"Hasan Square Block 13 A Gulshan-e-Iqbal, Karachi, Pakistan\",\"latitude\":\"24.900946847176\",\"longitude\":\"67.073122914881\",\"address_name\":\"Other\"}}', '2022-05-17 19:19:55', '2022-05-17 19:19:55'),
(246, 'Order', 'created', 'App\\Order', 81, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"20\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"4\",\"distance\":null,\"note\":null}}', '2022-05-17 19:20:18', '2022-05-17 19:20:18'),
(247, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"510\",\"grand_total\":\"514\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-17 19:20:18', '2022-05-17 19:20:18'),
(248, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 109, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-17 19:22:23', '2022-05-17 19:22:23'),
(249, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-17 19:23:10', '2022-05-17 19:23:10'),
(250, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"},\"old\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"}}', '2022-05-18 13:15:18', '2022-05-18 13:15:18'),
(251, 'Order', 'updated', 'App\\Order', 48, 'App\\User', 13, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"rider_accepted\"},\"old\":{\"rider_id\":null,\"order_status\":\"pending\"}}', '2022-05-18 13:35:08', '2022-05-18 13:35:08'),
(252, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"},\"old\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"}}', '2022-05-18 13:37:53', '2022-05-18 13:37:53'),
(253, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"},\"old\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"}}', '2022-05-18 13:49:48', '2022-05-18 13:49:48'),
(254, 'Order', 'updated', 'App\\Order', 80, 'App\\User', 13, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-18 14:11:10', '2022-05-18 14:11:10'),
(255, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"},\"old\":{\"device_token\":\"eqvVAkaHJk29rzxwat_BX7:APA91bFY-0d9BJHBbZ_2x36fXyv81ZlO1FloB5KfeiwtZeZ86lv7m3Qnx9o85Y_WBGqTMH8dpjqlwc5UNda89BCTSoiSZQKfW1Oj4hZu7esywLKp_kd88W8MSqiwDp8EZhN4Lhkk9DmI\"}}', '2022-05-18 14:16:22', '2022-05-18 14:16:22'),
(256, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 59, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-18 14:39:56', '2022-05-18 14:39:56'),
(257, 'Order', 'updated', 'App\\Order', 80, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-18 16:24:54', '2022-05-18 16:24:54'),
(258, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-18 16:28:24', '2022-05-18 16:28:24'),
(259, 'Order', 'updated', 'App\\Order', 80, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-18 17:03:39', '2022-05-18 17:03:39'),
(260, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cgZC8qerSyumbQg25SkWTz:APA91bFXK3q_j1q0cFR6CcnAREBFquoSa4XH88jHbI9JnzvpuF-M7CdIhmh90S43HBFgbqm0V1yLqYzk0Xw07tqBdvs4ndhkWUfhlb1FQoimSAuq2iAJ9JjOPZIdz7SYDWUddPdpBfRj\"},\"old\":{\"device_token\":\"eU8hYVgeSGWBeHfxzp1owM:APA91bE22p7ixxvj7OCXJGm7b9e5T_ipfT9D5WDki6tt8mI0xmJ7ijVoFEZ_NhFvxbAlfPtWwKV_-GfHp_pnVgA3Za4pp4TkIg8sbL7VXzfITS8UF3qApoXOMbT00j8XvrTkkIXhMQnU\"}}', '2022-05-18 19:11:37', '2022-05-18 19:11:37'),
(261, 'Order', 'updated', 'App\\Order', 81, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-18 19:13:31', '2022-05-18 19:13:31'),
(262, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-18 19:24:28', '2022-05-18 19:24:28'),
(263, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-18 19:24:49', '2022-05-18 19:24:49'),
(264, 'Order', 'updated', 'App\\Order', 47, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-05-18 19:25:01', '2022-05-18 19:25:01'),
(265, 'Order', 'created', 'App\\Order', 82, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"6\",\"distance\":null,\"note\":null}}', '2022-05-18 19:32:40', '2022-05-18 19:32:40'),
(266, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"600\",\"grand_total\":\"606\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-18 19:32:40', '2022-05-18 19:32:40'),
(267, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cBnADETFRUGRBIG7ccfW5r:APA91bES1chBYksj4jAz7PiEcM_V6pUvxuf06V1QLCPP4kWIapm1bi6pju0RE3WEZkXW54JLAhPB6yN3EeBCd4PWiXtCUKiHsUYNBpQFMmCoDWWL7dZBNvUGMP2F2TWSUeH6zN0szc9t\"},\"old\":{\"device_token\":\"cgZC8qerSyumbQg25SkWTz:APA91bFXK3q_j1q0cFR6CcnAREBFquoSa4XH88jHbI9JnzvpuF-M7CdIhmh90S43HBFgbqm0V1yLqYzk0Xw07tqBdvs4ndhkWUfhlb1FQoimSAuq2iAJ9JjOPZIdz7SYDWUddPdpBfRj\"}}', '2022-05-19 14:25:55', '2022-05-19 14:25:55'),
(268, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"},\"old\":{\"device_token\":\"cBnADETFRUGRBIG7ccfW5r:APA91bES1chBYksj4jAz7PiEcM_V6pUvxuf06V1QLCPP4kWIapm1bi6pju0RE3WEZkXW54JLAhPB6yN3EeBCd4PWiXtCUKiHsUYNBpQFMmCoDWWL7dZBNvUGMP2F2TWSUeH6zN0szc9t\"}}', '2022-05-19 16:14:53', '2022-05-19 16:14:53'),
(269, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"eS5pmQTJS6-HOYnUdyoW6V:APA91bETOFskibgyTi9p7BiYNgSi09RceZuXmhTbNogm5L67ZGYNqfi_IEucuUShhRYafjl9NxrFiiUBKAF42tsHcE8R5zpgbW6c_2TslstRoFn2krwUi-MOHFkcj3hjUo8D1WDLAMpZ\"},\"old\":{\"device_token\":\"f5gDMWvg-0c6gI6l1CZ5aZ:APA91bHsn1IFi1JrHb2hBDttwE7dRjLykq-fY2S7d6wb8EDOhP_OTiNC4nej2bigFn8h3sfeyY2QboBdyFHBS_Aj43a6alWPEU0aDYpLdHnErzz2P8ifTmdwsI0gad3Dt7wYT5n8WIgM\"}}', '2022-05-19 16:47:44', '2022-05-19 16:47:44'),
(270, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"11.1615594\",\"longitude\":\"-4.2565123\"}}', '2022-05-19 16:47:47', '2022-05-19 16:47:47'),
(271, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 16:47:57', '2022-05-19 16:47:57'),
(272, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.0839981\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 16:48:07', '2022-05-19 16:48:07'),
(273, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219961\",\"longitude\":\"-122.083987\"},\"old\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.0839981\"}}', '2022-05-19 16:48:17', '2022-05-19 16:48:17'),
(274, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219911\",\"longitude\":\"-122.0839571\"},\"old\":{\"latitude\":\"37.4219961\",\"longitude\":\"-122.083987\"}}', '2022-05-19 16:48:27', '2022-05-19 16:48:27'),
(275, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219824\",\"longitude\":\"-122.0839051\"},\"old\":{\"latitude\":\"37.4219911\",\"longitude\":\"-122.0839571\"}}', '2022-05-19 16:48:37', '2022-05-19 16:48:37'),
(276, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219717\",\"longitude\":\"-122.0838412\"},\"old\":{\"latitude\":\"37.4219824\",\"longitude\":\"-122.0839051\"}}', '2022-05-19 16:48:52', '2022-05-19 16:48:52'),
(277, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219616\",\"longitude\":\"-122.0837802\"},\"old\":{\"latitude\":\"37.4219717\",\"longitude\":\"-122.0838412\"}}', '2022-05-19 16:48:58', '2022-05-19 16:48:58'),
(278, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219536\",\"longitude\":\"-122.0837321\"},\"old\":{\"latitude\":\"37.4219616\",\"longitude\":\"-122.0837802\"}}', '2022-05-19 16:49:08', '2022-05-19 16:49:08'),
(279, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219482\",\"longitude\":\"-122.0836995\"},\"old\":{\"latitude\":\"37.4219536\",\"longitude\":\"-122.0837321\"}}', '2022-05-19 16:49:19', '2022-05-19 16:49:19'),
(280, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.08368\"},\"old\":{\"latitude\":\"37.4219482\",\"longitude\":\"-122.0836995\"}}', '2022-05-19 16:49:29', '2022-05-19 16:49:29'),
(281, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836698\"},\"old\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.08368\"}}', '2022-05-19 16:49:39', '2022-05-19 16:49:39'),
(282, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.0836669\"},\"old\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836698\"}}', '2022-05-19 16:49:49', '2022-05-19 16:49:49'),
(283, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"},\"old\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.0836669\"}}', '2022-05-19 16:50:04', '2022-05-19 16:50:04'),
(284, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836738\"},\"old\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"}}', '2022-05-19 16:50:10', '2022-05-19 16:50:10'),
(285, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219451\",\"longitude\":\"-122.0836808\"},\"old\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836738\"}}', '2022-05-19 16:50:20', '2022-05-19 16:50:20'),
(286, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219464\",\"longitude\":\"-122.0836885\"},\"old\":{\"latitude\":\"37.4219451\",\"longitude\":\"-122.0836808\"}}', '2022-05-19 16:50:30', '2022-05-19 16:50:30'),
(287, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836961\"},\"old\":{\"latitude\":\"37.4219464\",\"longitude\":\"-122.0836885\"}}', '2022-05-19 16:50:41', '2022-05-19 16:50:41'),
(288, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219489\",\"longitude\":\"-122.0837031\"},\"old\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836961\"}}', '2022-05-19 16:50:51', '2022-05-19 16:50:51'),
(289, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837093\"},\"old\":{\"latitude\":\"37.4219489\",\"longitude\":\"-122.0837031\"}}', '2022-05-19 16:51:01', '2022-05-19 16:51:01'),
(290, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837145\"},\"old\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837093\"}}', '2022-05-19 16:51:11', '2022-05-19 16:51:11'),
(291, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837187\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837145\"}}', '2022-05-19 16:51:22', '2022-05-19 16:51:22'),
(292, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837219\"},\"old\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837187\"}}', '2022-05-19 16:51:32', '2022-05-19 16:51:32'),
(293, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837242\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837219\"}}', '2022-05-19 16:51:42', '2022-05-19 16:51:42');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(294, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837259\"},\"old\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837242\"}}', '2022-05-19 16:51:52', '2022-05-19 16:51:52'),
(295, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837259\"}}', '2022-05-19 16:52:02', '2022-05-19 16:52:02'),
(296, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"}}', '2022-05-19 16:52:13', '2022-05-19 16:52:13'),
(297, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837274\"}}', '2022-05-19 16:52:23', '2022-05-19 16:52:23'),
(298, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837274\"},\"old\":{\"longitude\":\"-122.0837276\"}}', '2022-05-19 16:52:43', '2022-05-19 16:52:43'),
(299, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837271\"},\"old\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"}}', '2022-05-19 16:52:54', '2022-05-19 16:52:54'),
(300, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837268\"},\"old\":{\"longitude\":\"-122.0837271\"}}', '2022-05-19 16:53:04', '2022-05-19 16:53:04'),
(301, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837264\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837268\"}}', '2022-05-19 16:53:14', '2022-05-19 16:53:14'),
(302, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837261\"},\"old\":{\"longitude\":\"-122.0837264\"}}', '2022-05-19 16:53:24', '2022-05-19 16:53:24'),
(303, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837258\"},\"old\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837261\"}}', '2022-05-19 16:53:34', '2022-05-19 16:53:34'),
(304, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837256\"},\"old\":{\"longitude\":\"-122.0837258\"}}', '2022-05-19 16:53:45', '2022-05-19 16:53:45'),
(305, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837254\"},\"old\":{\"longitude\":\"-122.0837256\"}}', '2022-05-19 16:53:55', '2022-05-19 16:53:55'),
(306, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837253\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837254\"}}', '2022-05-19 16:54:05', '2022-05-19 16:54:05'),
(307, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837252\"},\"old\":{\"longitude\":\"-122.0837253\"}}', '2022-05-19 16:54:15', '2022-05-19 16:54:15'),
(308, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.0837252\"}}', '2022-05-19 16:54:26', '2022-05-19 16:54:26'),
(309, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"-122.0837251\"}}', '2022-05-19 16:54:36', '2022-05-19 16:54:36'),
(310, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.083725\"}}', '2022-05-19 16:55:58', '2022-05-19 16:55:58'),
(311, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 17:57:35', '2022-05-19 17:57:35'),
(312, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.084\"},\"old\":{\"longitude\":\"-122.0839999\"}}', '2022-05-19 17:57:47', '2022-05-19 17:57:47'),
(313, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219977\",\"longitude\":\"-122.0839965\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 17:57:58', '2022-05-19 17:57:58'),
(314, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421995\",\"longitude\":\"-122.0839798\"},\"old\":{\"latitude\":\"37.4219977\",\"longitude\":\"-122.0839965\"}}', '2022-05-19 17:58:10', '2022-05-19 17:58:10'),
(315, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219884\",\"longitude\":\"-122.0839405\"},\"old\":{\"latitude\":\"37.421995\",\"longitude\":\"-122.0839798\"}}', '2022-05-19 17:58:21', '2022-05-19 17:58:21'),
(316, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219784\",\"longitude\":\"-122.0838801\"},\"old\":{\"latitude\":\"37.4219884\",\"longitude\":\"-122.0839405\"}}', '2022-05-19 17:58:33', '2022-05-19 17:58:33'),
(317, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219672\",\"longitude\":\"-122.0838134\"},\"old\":{\"latitude\":\"37.4219784\",\"longitude\":\"-122.0838801\"}}', '2022-05-19 17:58:44', '2022-05-19 17:58:44'),
(318, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219672\",\"longitude\":\"-122.0838134\"},\"old\":{\"latitude\":\"37.4219784\",\"longitude\":\"-122.0838801\"}}', '2022-05-19 17:58:44', '2022-05-19 17:58:44'),
(319, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219576\",\"longitude\":\"-122.0837559\"},\"old\":{\"latitude\":\"37.4219672\",\"longitude\":\"-122.0838134\"}}', '2022-05-19 17:58:55', '2022-05-19 17:58:55'),
(320, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"},\"old\":{\"latitude\":\"37.4219576\",\"longitude\":\"-122.0837559\"}}', '2022-05-19 17:59:06', '2022-05-19 17:59:06'),
(321, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"},\"old\":{\"latitude\":\"37.4219576\",\"longitude\":\"-122.0837559\"}}', '2022-05-19 17:59:06', '2022-05-19 17:59:06'),
(322, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.083688\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"}}', '2022-05-19 17:59:18', '2022-05-19 17:59:18'),
(323, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.083688\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"}}', '2022-05-19 17:59:18', '2022-05-19 17:59:18'),
(324, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836738\"},\"old\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.083688\"}}', '2022-05-19 17:59:29', '2022-05-19 17:59:29'),
(325, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"},\"old\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836738\"}}', '2022-05-19 17:59:40', '2022-05-19 17:59:40'),
(326, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"},\"old\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836738\"}}', '2022-05-19 17:59:40', '2022-05-19 17:59:40'),
(327, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"}}', '2022-05-19 17:59:51', '2022-05-19 17:59:51'),
(328, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"}}', '2022-05-19 17:59:51', '2022-05-19 17:59:51'),
(329, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"},\"old\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"}}', '2022-05-19 18:00:02', '2022-05-19 18:00:02'),
(330, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"},\"old\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"}}', '2022-05-19 18:00:02', '2022-05-19 18:00:02'),
(331, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836801\"},\"old\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"}}', '2022-05-19 18:00:14', '2022-05-19 18:00:14'),
(332, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.0836879\"},\"old\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836801\"}}', '2022-05-19 18:00:25', '2022-05-19 18:00:25'),
(333, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219476\",\"longitude\":\"-122.0836957\"},\"old\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.0836879\"}}', '2022-05-19 18:00:36', '2022-05-19 18:00:36'),
(334, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219476\",\"longitude\":\"-122.0836957\"},\"old\":{\"latitude\":\"37.4219463\",\"longitude\":\"-122.0836879\"}}', '2022-05-19 18:00:36', '2022-05-19 18:00:36'),
(335, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219488\",\"longitude\":\"-122.0837031\"},\"old\":{\"latitude\":\"37.4219476\",\"longitude\":\"-122.0836957\"}}', '2022-05-19 18:00:48', '2022-05-19 18:00:48'),
(336, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219488\",\"longitude\":\"-122.0837031\"},\"old\":{\"latitude\":\"37.4219476\",\"longitude\":\"-122.0836957\"}}', '2022-05-19 18:00:48', '2022-05-19 18:00:48'),
(337, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837095\"},\"old\":{\"latitude\":\"37.4219488\",\"longitude\":\"-122.0837031\"}}', '2022-05-19 18:00:59', '2022-05-19 18:00:59'),
(338, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219508\",\"longitude\":\"-122.0837149\"},\"old\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837095\"}}', '2022-05-19 18:01:10', '2022-05-19 18:01:10'),
(339, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837191\"},\"old\":{\"latitude\":\"37.4219508\",\"longitude\":\"-122.0837149\"}}', '2022-05-19 18:01:22', '2022-05-19 18:01:22'),
(340, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837223\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837191\"}}', '2022-05-19 18:01:33', '2022-05-19 18:01:33'),
(341, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837246\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837223\"}}', '2022-05-19 18:01:44', '2022-05-19 18:01:44'),
(342, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837246\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837223\"}}', '2022-05-19 18:01:44', '2022-05-19 18:01:44'),
(343, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837261\"},\"old\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837246\"}}', '2022-05-19 18:01:55', '2022-05-19 18:01:55'),
(344, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837261\"}}', '2022-05-19 18:02:03', '2022-05-19 18:02:03'),
(345, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:02:18', '2022-05-19 18:02:18'),
(346, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:02:18', '2022-05-19 18:02:18'),
(347, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.083984\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 18:02:29', '2022-05-19 18:02:29'),
(348, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.083984\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 18:02:29', '2022-05-19 18:02:29'),
(349, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.083984\"}}', '2022-05-19 18:04:18', '2022-05-19 18:04:18'),
(350, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.083984\"}}', '2022-05-19 18:04:18', '2022-05-19 18:04:18'),
(351, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.083984\"}}', '2022-05-19 18:04:18', '2022-05-19 18:04:18'),
(352, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 18:04:30', '2022-05-19 18:04:30'),
(353, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839977\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 18:04:40', '2022-05-19 18:04:40'),
(354, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839977\"}}', '2022-05-19 18:04:52', '2022-05-19 18:04:52'),
(355, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839977\"}}', '2022-05-19 18:04:52', '2022-05-19 18:04:52'),
(356, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839977\"}}', '2022-05-19 18:04:52', '2022-05-19 18:04:52'),
(357, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839493\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"}}', '2022-05-19 18:05:03', '2022-05-19 18:05:03'),
(358, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839493\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"}}', '2022-05-19 18:05:03', '2022-05-19 18:05:03'),
(359, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839493\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839843\"}}', '2022-05-19 18:05:03', '2022-05-19 18:05:03'),
(360, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219801\",\"longitude\":\"-122.0838913\"},\"old\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839493\"}}', '2022-05-19 18:05:14', '2022-05-19 18:05:14'),
(361, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-19 18:05:18', '2022-05-19 18:05:18'),
(362, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-19 18:05:22', '2022-05-19 18:05:22'),
(363, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219689\",\"longitude\":\"-122.083824\"},\"old\":{\"latitude\":\"37.4219801\",\"longitude\":\"-122.0838913\"}}', '2022-05-19 18:05:25', '2022-05-19 18:05:25'),
(364, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-19 18:05:26', '2022-05-19 18:05:26'),
(365, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837638\"},\"old\":{\"latitude\":\"37.4219689\",\"longitude\":\"-122.083824\"}}', '2022-05-19 18:05:37', '2022-05-19 18:05:37'),
(366, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837638\"},\"old\":{\"latitude\":\"37.4219689\",\"longitude\":\"-122.083824\"}}', '2022-05-19 18:05:37', '2022-05-19 18:05:37'),
(367, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837194\"},\"old\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837638\"}}', '2022-05-19 18:05:48', '2022-05-19 18:05:48'),
(368, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837194\"},\"old\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837638\"}}', '2022-05-19 18:05:48', '2022-05-19 18:05:48'),
(369, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836908\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837194\"}}', '2022-05-19 18:05:59', '2022-05-19 18:05:59'),
(370, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836908\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837194\"}}', '2022-05-19 18:05:59', '2022-05-19 18:05:59'),
(371, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836908\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837194\"}}', '2022-05-19 18:05:59', '2022-05-19 18:05:59'),
(372, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836744\"},\"old\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836908\"}}', '2022-05-19 18:06:11', '2022-05-19 18:06:11'),
(373, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.083668\"},\"old\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836744\"}}', '2022-05-19 18:06:22', '2022-05-19 18:06:22'),
(374, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.083668\"}}', '2022-05-19 18:06:44', '2022-05-19 18:06:44'),
(375, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.083668\"}}', '2022-05-19 18:06:44', '2022-05-19 18:06:44'),
(376, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.083668\"}}', '2022-05-19 18:06:44', '2022-05-19 18:06:44'),
(377, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"},\"old\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"}}', '2022-05-19 18:06:55', '2022-05-19 18:06:55'),
(378, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"},\"old\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"}}', '2022-05-19 18:06:55', '2022-05-19 18:06:55'),
(379, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"},\"old\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836725\"}}', '2022-05-19 18:06:55', '2022-05-19 18:06:55'),
(380, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"},\"old\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"}}', '2022-05-19 18:07:22', '2022-05-19 18:07:22'),
(381, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"}}', '2022-05-19 18:07:30', '2022-05-19 18:07:30'),
(382, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839972\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:07:42', '2022-05-19 18:07:42'),
(383, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219953\",\"longitude\":\"-122.0839819\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839972\"}}', '2022-05-19 18:07:54', '2022-05-19 18:07:54'),
(384, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.0839478\"},\"old\":{\"latitude\":\"37.4219953\",\"longitude\":\"-122.0839819\"}}', '2022-05-19 18:08:04', '2022-05-19 18:08:04'),
(385, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219807\",\"longitude\":\"-122.0838946\"},\"old\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.0839478\"}}', '2022-05-19 18:08:14', '2022-05-19 18:08:14'),
(386, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219702\",\"longitude\":\"-122.0838318\"},\"old\":{\"latitude\":\"37.4219807\",\"longitude\":\"-122.0838946\"}}', '2022-05-19 18:08:24', '2022-05-19 18:08:24'),
(387, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219605\",\"longitude\":\"-122.0837731\"},\"old\":{\"latitude\":\"37.4219702\",\"longitude\":\"-122.0838318\"}}', '2022-05-19 18:08:35', '2022-05-19 18:08:35'),
(388, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421953\",\"longitude\":\"-122.0837281\"},\"old\":{\"latitude\":\"37.4219605\",\"longitude\":\"-122.0837731\"}}', '2022-05-19 18:08:45', '2022-05-19 18:08:45'),
(389, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421948\",\"longitude\":\"-122.0836982\"},\"old\":{\"latitude\":\"37.421953\",\"longitude\":\"-122.0837281\"}}', '2022-05-19 18:08:55', '2022-05-19 18:08:55'),
(390, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836799\"},\"old\":{\"latitude\":\"37.421948\",\"longitude\":\"-122.0836982\"}}', '2022-05-19 18:09:05', '2022-05-19 18:09:05'),
(391, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836701\"},\"old\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836799\"}}', '2022-05-19 18:09:15', '2022-05-19 18:09:15'),
(392, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836681\"},\"old\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836701\"}}', '2022-05-19 18:09:26', '2022-05-19 18:09:26'),
(393, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836701\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836681\"}}', '2022-05-19 18:09:36', '2022-05-19 18:09:36'),
(394, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219443\",\"longitude\":\"-122.0836757\"},\"old\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836701\"}}', '2022-05-19 18:09:46', '2022-05-19 18:09:46'),
(395, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219454\",\"longitude\":\"-122.0836825\"},\"old\":{\"latitude\":\"37.4219443\",\"longitude\":\"-122.0836757\"}}', '2022-05-19 18:09:56', '2022-05-19 18:09:56'),
(396, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219466\",\"longitude\":\"-122.0836899\"},\"old\":{\"latitude\":\"37.4219454\",\"longitude\":\"-122.0836825\"}}', '2022-05-19 18:10:06', '2022-05-19 18:10:06'),
(397, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219479\",\"longitude\":\"-122.0836973\"},\"old\":{\"latitude\":\"37.4219466\",\"longitude\":\"-122.0836899\"}}', '2022-05-19 18:10:17', '2022-05-19 18:10:17'),
(398, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421949\",\"longitude\":\"-122.0837042\"},\"old\":{\"latitude\":\"37.4219479\",\"longitude\":\"-122.0836973\"}}', '2022-05-19 18:10:27', '2022-05-19 18:10:27'),
(399, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-19 18:10:31', '2022-05-19 18:10:31'),
(400, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.421949\",\"longitude\":\"-122.0837042\"}}', '2022-05-19 18:10:37', '2022-05-19 18:10:37'),
(401, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219981\",\"longitude\":\"-122.0839983\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:10:47', '2022-05-19 18:10:47'),
(402, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219964\",\"longitude\":\"-122.0839882\"},\"old\":{\"latitude\":\"37.4219981\",\"longitude\":\"-122.0839983\"}}', '2022-05-19 18:10:58', '2022-05-19 18:10:58'),
(403, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219916\",\"longitude\":\"-122.0839594\"},\"old\":{\"latitude\":\"37.4219964\",\"longitude\":\"-122.0839882\"}}', '2022-05-19 18:11:08', '2022-05-19 18:11:08'),
(404, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421983\",\"longitude\":\"-122.0839079\"},\"old\":{\"latitude\":\"37.4219916\",\"longitude\":\"-122.0839594\"}}', '2022-05-19 18:11:18', '2022-05-19 18:11:18'),
(405, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219724\",\"longitude\":\"-122.0838443\"},\"old\":{\"latitude\":\"37.421983\",\"longitude\":\"-122.0839079\"}}', '2022-05-19 18:11:28', '2022-05-19 18:11:28'),
(406, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219622\",\"longitude\":\"-122.0837834\"},\"old\":{\"latitude\":\"37.4219724\",\"longitude\":\"-122.0838443\"}}', '2022-05-19 18:11:38', '2022-05-19 18:11:38'),
(407, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219541\",\"longitude\":\"-122.083735\"},\"old\":{\"latitude\":\"37.4219622\",\"longitude\":\"-122.0837834\"}}', '2022-05-19 18:11:49', '2022-05-19 18:11:49'),
(408, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.0837017\"},\"old\":{\"latitude\":\"37.4219541\",\"longitude\":\"-122.083735\"}}', '2022-05-19 18:11:59', '2022-05-19 18:11:59'),
(409, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219452\",\"longitude\":\"-122.0836811\"},\"old\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.0837017\"}}', '2022-05-19 18:12:09', '2022-05-19 18:12:09'),
(410, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219434\",\"longitude\":\"-122.0836704\"},\"old\":{\"latitude\":\"37.4219452\",\"longitude\":\"-122.0836811\"}}', '2022-05-19 18:12:19', '2022-05-19 18:12:19'),
(411, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.0836667\"},\"old\":{\"latitude\":\"37.4219434\",\"longitude\":\"-122.0836704\"}}', '2022-05-19 18:12:29', '2022-05-19 18:12:29'),
(412, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836681\"},\"old\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.0836667\"}}', '2022-05-19 18:12:39', '2022-05-19 18:12:39'),
(413, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219438\",\"longitude\":\"-122.083673\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836681\"}}', '2022-05-19 18:12:49', '2022-05-19 18:12:49'),
(414, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219449\",\"longitude\":\"-122.0836797\"},\"old\":{\"latitude\":\"37.4219438\",\"longitude\":\"-122.083673\"}}', '2022-05-19 18:12:59', '2022-05-19 18:12:59'),
(415, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219462\",\"longitude\":\"-122.0836873\"},\"old\":{\"latitude\":\"37.4219449\",\"longitude\":\"-122.0836797\"}}', '2022-05-19 18:13:09', '2022-05-19 18:13:09'),
(416, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219475\",\"longitude\":\"-122.0836949\"},\"old\":{\"latitude\":\"37.4219462\",\"longitude\":\"-122.0836873\"}}', '2022-05-19 18:13:19', '2022-05-19 18:13:19'),
(417, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219487\",\"longitude\":\"-122.083702\"},\"old\":{\"latitude\":\"37.4219475\",\"longitude\":\"-122.0836949\"}}', '2022-05-19 18:13:29', '2022-05-19 18:13:29'),
(418, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837084\"},\"old\":{\"latitude\":\"37.4219487\",\"longitude\":\"-122.083702\"}}', '2022-05-19 18:13:39', '2022-05-19 18:13:39'),
(419, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219506\",\"longitude\":\"-122.0837137\"},\"old\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837084\"}}', '2022-05-19 18:13:49', '2022-05-19 18:13:49'),
(420, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219513\",\"longitude\":\"-122.0837181\"},\"old\":{\"latitude\":\"37.4219506\",\"longitude\":\"-122.0837137\"}}', '2022-05-19 18:14:00', '2022-05-19 18:14:00'),
(421, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219519\",\"longitude\":\"-122.0837214\"},\"old\":{\"latitude\":\"37.4219513\",\"longitude\":\"-122.0837181\"}}', '2022-05-19 18:14:10', '2022-05-19 18:14:10'),
(422, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219523\",\"longitude\":\"-122.0837239\"},\"old\":{\"latitude\":\"37.4219519\",\"longitude\":\"-122.0837214\"}}', '2022-05-19 18:14:20', '2022-05-19 18:14:20'),
(423, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837256\"},\"old\":{\"latitude\":\"37.4219523\",\"longitude\":\"-122.0837239\"}}', '2022-05-19 18:14:30', '2022-05-19 18:14:30'),
(424, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837267\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837256\"}}', '2022-05-19 18:14:40', '2022-05-19 18:14:40'),
(425, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837273\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837267\"}}', '2022-05-19 18:14:50', '2022-05-19 18:14:50'),
(426, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837273\"}}', '2022-05-19 18:15:01', '2022-05-19 18:15:01'),
(427, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837274\"},\"old\":{\"longitude\":\"-122.0837276\"}}', '2022-05-19 18:15:21', '2022-05-19 18:15:21'),
(428, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837272\"},\"old\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"}}', '2022-05-19 18:15:31', '2022-05-19 18:15:31'),
(429, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837268\"},\"old\":{\"longitude\":\"-122.0837272\"}}', '2022-05-19 18:15:41', '2022-05-19 18:15:41'),
(430, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837265\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837268\"}}', '2022-05-19 18:15:51', '2022-05-19 18:15:51'),
(431, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837262\"},\"old\":{\"longitude\":\"-122.0837265\"}}', '2022-05-19 18:16:01', '2022-05-19 18:16:01'),
(432, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837259\"},\"old\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837262\"}}', '2022-05-19 18:16:11', '2022-05-19 18:16:11'),
(433, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837257\"},\"old\":{\"longitude\":\"-122.0837259\"}}', '2022-05-19 18:16:22', '2022-05-19 18:16:22'),
(434, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837255\"},\"old\":{\"longitude\":\"-122.0837257\"}}', '2022-05-19 18:16:32', '2022-05-19 18:16:32'),
(435, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837253\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837255\"}}', '2022-05-19 18:16:42', '2022-05-19 18:16:42'),
(436, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837252\"},\"old\":{\"longitude\":\"-122.0837253\"}}', '2022-05-19 18:16:52', '2022-05-19 18:16:52'),
(437, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.0837252\"}}', '2022-05-19 18:17:02', '2022-05-19 18:17:02'),
(438, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"-122.0837251\"}}', '2022-05-19 18:17:12', '2022-05-19 18:17:12'),
(439, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.083725\"}}', '2022-05-19 18:18:44', '2022-05-19 18:18:44'),
(440, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 18:35:45', '2022-05-19 18:35:45'),
(441, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839975\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:35:56', '2022-05-19 18:35:56'),
(442, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839975\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 18:35:56', '2022-05-19 18:35:56'),
(443, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839837\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839975\"}}', '2022-05-19 18:36:08', '2022-05-19 18:36:08'),
(444, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839837\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839975\"}}', '2022-05-19 18:36:08', '2022-05-19 18:36:08'),
(445, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.083948\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839837\"}}', '2022-05-19 18:36:19', '2022-05-19 18:36:19'),
(446, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219799\",\"longitude\":\"-122.0838895\"},\"old\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.083948\"}}', '2022-05-19 18:36:31', '2022-05-19 18:36:31'),
(447, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219687\",\"longitude\":\"-122.0838222\"},\"old\":{\"latitude\":\"37.4219799\",\"longitude\":\"-122.0838895\"}}', '2022-05-19 18:36:42', '2022-05-19 18:36:42'),
(448, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219687\",\"longitude\":\"-122.0838222\"},\"old\":{\"latitude\":\"37.4219799\",\"longitude\":\"-122.0838895\"}}', '2022-05-19 18:36:42', '2022-05-19 18:36:42'),
(449, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219587\",\"longitude\":\"-122.0837626\"},\"old\":{\"latitude\":\"37.4219687\",\"longitude\":\"-122.0838222\"}}', '2022-05-19 18:36:53', '2022-05-19 18:36:53'),
(450, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219587\",\"longitude\":\"-122.0837626\"},\"old\":{\"latitude\":\"37.4219687\",\"longitude\":\"-122.0838222\"}}', '2022-05-19 18:36:53', '2022-05-19 18:36:53'),
(451, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837187\"},\"old\":{\"latitude\":\"37.4219587\",\"longitude\":\"-122.0837626\"}}', '2022-05-19 18:37:04', '2022-05-19 18:37:04'),
(452, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836905\"},\"old\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837187\"}}', '2022-05-19 18:37:16', '2022-05-19 18:37:16'),
(453, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836748\"},\"old\":{\"latitude\":\"24.9219297\",\"longitude\":\"67.0896254\"}}', '2022-05-19 18:37:27', '2022-05-19 18:37:27'),
(454, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836748\"},\"old\":{\"latitude\":\"24.9219297\",\"longitude\":\"67.0896254\"}}', '2022-05-19 18:37:27', '2022-05-19 18:37:27'),
(455, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836736\"},\"old\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836748\"}}', '2022-05-19 18:37:39', '2022-05-19 18:37:39'),
(456, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219435\",\"longitude\":\"-122.0836708\"},\"old\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836736\"}}', '2022-05-19 18:37:50', '2022-05-19 18:37:50'),
(457, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836745\"},\"old\":{\"latitude\":\"37.4219435\",\"longitude\":\"-122.0836708\"}}', '2022-05-19 18:38:02', '2022-05-19 18:38:02'),
(458, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"},\"old\":{\"device_token\":\"eS5pmQTJS6-HOYnUdyoW6V:APA91bETOFskibgyTi9p7BiYNgSi09RceZuXmhTbNogm5L67ZGYNqfi_IEucuUShhRYafjl9NxrFiiUBKAF42tsHcE8R5zpgbW6c_2TslstRoFn2krwUi-MOHFkcj3hjUo8D1WDLAMpZ\"}}', '2022-05-19 18:39:09', '2022-05-19 18:39:09'),
(459, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836745\"}}', '2022-05-19 18:39:12', '2022-05-19 18:39:12'),
(460, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"24.9219297\",\"longitude\":\"67.0896254\"}}', '2022-05-19 18:39:23', '2022-05-19 18:39:23'),
(461, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.0839981\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 18:39:33', '2022-05-19 18:39:33'),
(462, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839866\"},\"old\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.0839981\"}}', '2022-05-19 18:39:44', '2022-05-19 18:39:44'),
(463, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219909\",\"longitude\":\"-122.0839559\"},\"old\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839866\"}}', '2022-05-19 18:39:54', '2022-05-19 18:39:54'),
(464, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219821\",\"longitude\":\"-122.0839039\"},\"old\":{\"latitude\":\"37.4219909\",\"longitude\":\"-122.0839559\"}}', '2022-05-19 18:40:04', '2022-05-19 18:40:04'),
(465, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219715\",\"longitude\":\"-122.08384\"},\"old\":{\"latitude\":\"37.4219821\",\"longitude\":\"-122.0839039\"}}', '2022-05-19 18:40:14', '2022-05-19 18:40:14'),
(466, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219613\",\"longitude\":\"-122.0837785\"},\"old\":{\"latitude\":\"37.4219715\",\"longitude\":\"-122.08384\"}}', '2022-05-19 18:40:25', '2022-05-19 18:40:25'),
(467, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219534\",\"longitude\":\"-122.0837311\"},\"old\":{\"latitude\":\"37.4219613\",\"longitude\":\"-122.0837785\"}}', '2022-05-19 18:40:35', '2022-05-19 18:40:35'),
(468, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219481\",\"longitude\":\"-122.0836988\"},\"old\":{\"latitude\":\"37.4219534\",\"longitude\":\"-122.0837311\"}}', '2022-05-19 18:40:46', '2022-05-19 18:40:46'),
(469, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836791\"},\"old\":{\"latitude\":\"37.4219481\",\"longitude\":\"-122.0836988\"}}', '2022-05-19 18:40:56', '2022-05-19 18:40:56'),
(470, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836696\"},\"old\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836791\"}}', '2022-05-19 18:41:06', '2022-05-19 18:41:06'),
(471, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.083667\"},\"old\":{\"latitude\":\"37.4219433\",\"longitude\":\"-122.0836696\"}}', '2022-05-19 18:41:17', '2022-05-19 18:41:17'),
(472, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219432\",\"longitude\":\"-122.0836692\"},\"old\":{\"latitude\":\"37.4219428\",\"longitude\":\"-122.083667\"}}', '2022-05-19 18:41:27', '2022-05-19 18:41:27'),
(473, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836744\"},\"old\":{\"latitude\":\"37.4219432\",\"longitude\":\"-122.0836692\"}}', '2022-05-19 18:41:42', '2022-05-19 18:41:42'),
(474, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219452\",\"longitude\":\"-122.0836813\"},\"old\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836744\"}}', '2022-05-19 18:41:47', '2022-05-19 18:41:47'),
(475, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219465\",\"longitude\":\"-122.0836889\"},\"old\":{\"latitude\":\"37.4219452\",\"longitude\":\"-122.0836813\"}}', '2022-05-19 18:41:57', '2022-05-19 18:41:57'),
(476, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836964\"},\"old\":{\"latitude\":\"37.4219465\",\"longitude\":\"-122.0836889\"}}', '2022-05-19 18:42:08', '2022-05-19 18:42:08'),
(477, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219489\",\"longitude\":\"-122.0837035\"},\"old\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836964\"}}', '2022-05-19 18:42:18', '2022-05-19 18:42:18'),
(478, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837097\"},\"old\":{\"latitude\":\"37.4219489\",\"longitude\":\"-122.0837035\"}}', '2022-05-19 18:42:29', '2022-05-19 18:42:29'),
(479, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219508\",\"longitude\":\"-122.0837148\"},\"old\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837097\"}}', '2022-05-19 18:42:39', '2022-05-19 18:42:39'),
(480, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.083719\"},\"old\":{\"latitude\":\"37.4219508\",\"longitude\":\"-122.0837148\"}}', '2022-05-19 18:42:49', '2022-05-19 18:42:49'),
(481, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837221\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.083719\"}}', '2022-05-19 18:43:00', '2022-05-19 18:43:00'),
(482, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837243\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837221\"}}', '2022-05-19 18:43:10', '2022-05-19 18:43:10'),
(483, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837259\"},\"old\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837243\"}}', '2022-05-19 18:43:20', '2022-05-19 18:43:20'),
(484, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837259\"}}', '2022-05-19 18:43:30', '2022-05-19 18:43:30'),
(485, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"}}', '2022-05-19 18:43:40', '2022-05-19 18:43:40'),
(486, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837274\"}}', '2022-05-19 18:43:51', '2022-05-19 18:43:51'),
(487, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"24.9171068\",\"longitude\":\"67.0859723\"}}', '2022-05-19 18:44:11', '2022-05-19 18:44:11'),
(488, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837271\"},\"old\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"}}', '2022-05-19 18:44:22', '2022-05-19 18:44:22'),
(489, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837267\"},\"old\":{\"longitude\":\"-122.0837271\"}}', '2022-05-19 18:44:32', '2022-05-19 18:44:32'),
(490, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837264\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837267\"}}', '2022-05-19 18:44:42', '2022-05-19 18:44:42'),
(491, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837261\"},\"old\":{\"longitude\":\"-122.0837264\"}}', '2022-05-19 18:44:52', '2022-05-19 18:44:52'),
(492, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837258\"},\"old\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837261\"}}', '2022-05-19 18:45:03', '2022-05-19 18:45:03'),
(493, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837256\"},\"old\":{\"longitude\":\"-122.0837258\"}}', '2022-05-19 18:45:13', '2022-05-19 18:45:13'),
(494, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837254\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837256\"}}', '2022-05-19 18:45:24', '2022-05-19 18:45:24'),
(495, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837253\"},\"old\":{\"longitude\":\"-122.0837254\"}}', '2022-05-19 18:45:34', '2022-05-19 18:45:34');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(496, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837252\"},\"old\":{\"longitude\":\"-122.0837253\"}}', '2022-05-19 18:45:44', '2022-05-19 18:45:44'),
(497, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.0837252\"}}', '2022-05-19 18:45:55', '2022-05-19 18:45:55'),
(498, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"-122.0837251\"}}', '2022-05-19 18:46:05', '2022-05-19 18:46:05'),
(499, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\"},\"old\":{\"latitude\":\"\"}}', '2022-05-19 18:46:36', '2022-05-19 18:46:36'),
(500, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"24.9219249\"}}', '2022-05-19 18:47:07', '2022-05-19 18:47:07'),
(501, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"67.0941101\"}}', '2022-05-19 18:47:17', '2022-05-19 18:47:17'),
(502, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"24.9219249\",\"longitude\":\"-122.083725\"}}', '2022-05-19 18:47:31', '2022-05-19 18:47:31'),
(503, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-19 18:48:51', '2022-05-19 18:48:51'),
(504, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-19 18:48:53', '2022-05-19 18:48:53'),
(505, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"91\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":\"54\",\"order_status\":\"ready\"}}', '2022-05-19 18:48:55', '2022-05-19 18:48:55'),
(506, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"12345\",\"longitude\":\"12345\"}}', '2022-05-19 18:53:04', '2022-05-19 18:53:04'),
(507, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"123456\",\"longitude\":\"123456\"}}', '2022-05-19 18:54:05', '2022-05-19 18:54:05'),
(508, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"12345\",\"longitude\":\"123456\"}}', '2022-05-19 18:55:16', '2022-05-19 18:55:16'),
(509, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"123456\",\"longitude\":\"123456\"}}', '2022-05-19 18:56:27', '2022-05-19 18:56:27'),
(510, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"123456\",\"longitude\":\"123456\"}}', '2022-05-19 18:57:18', '2022-05-19 18:57:18'),
(511, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"24.9237366\",\"longitude\":\"67.0858032\"}}', '2022-05-19 19:05:04', '2022-05-19 19:05:04'),
(512, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"},\"old\":{\"device_token\":null}}', '2022-05-19 19:05:07', '2022-05-19 19:05:07'),
(513, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 19:05:14', '2022-05-19 19:05:14'),
(514, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 19:05:25', '2022-05-19 19:05:25'),
(515, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 19:05:25', '2022-05-19 19:05:25'),
(516, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 19:05:37', '2022-05-19 19:05:37'),
(517, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219897\",\"longitude\":\"-122.0839486\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"}}', '2022-05-19 19:05:48', '2022-05-19 19:05:48'),
(518, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219897\",\"longitude\":\"-122.0839486\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"}}', '2022-05-19 19:05:48', '2022-05-19 19:05:48'),
(519, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"},\"old\":{\"latitude\":\"37.4219897\",\"longitude\":\"-122.0839486\"}}', '2022-05-19 19:05:59', '2022-05-19 19:05:59'),
(520, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"},\"old\":{\"latitude\":\"37.4219897\",\"longitude\":\"-122.0839486\"}}', '2022-05-19 19:05:59', '2022-05-19 19:05:59'),
(521, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219688\",\"longitude\":\"-122.0838234\"},\"old\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"}}', '2022-05-19 19:06:10', '2022-05-19 19:06:10'),
(522, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219588\",\"longitude\":\"-122.0837635\"},\"old\":{\"latitude\":\"37.4219688\",\"longitude\":\"-122.0838234\"}}', '2022-05-19 19:06:22', '2022-05-19 19:06:22'),
(523, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837193\"},\"old\":{\"latitude\":\"37.4219588\",\"longitude\":\"-122.0837635\"}}', '2022-05-19 19:06:33', '2022-05-19 19:06:33'),
(524, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836907\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837193\"}}', '2022-05-19 19:06:44', '2022-05-19 19:06:44'),
(525, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836748\"},\"old\":{\"latitude\":\"37.4219467\",\"longitude\":\"-122.0836907\"}}', '2022-05-19 19:06:55', '2022-05-19 19:06:55'),
(526, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836682\"},\"old\":{\"latitude\":\"37.4219441\",\"longitude\":\"-122.0836748\"}}', '2022-05-19 19:07:07', '2022-05-19 19:07:07'),
(527, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0836681\"},\"old\":{\"longitude\":\"-122.0836682\"}}', '2022-05-19 19:07:18', '2022-05-19 19:07:18'),
(528, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836722\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836681\"}}', '2022-05-19 19:07:29', '2022-05-19 19:07:29'),
(529, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"},\"old\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836722\"}}', '2022-05-19 19:07:40', '2022-05-19 19:07:40'),
(530, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"},\"old\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"}}', '2022-05-19 19:07:52', '2022-05-19 19:07:52'),
(531, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"},\"old\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"}}', '2022-05-19 19:08:03', '2022-05-19 19:08:03'),
(532, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219487\",\"longitude\":\"-122.083702\"},\"old\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"}}', '2022-05-19 19:08:15', '2022-05-19 19:08:15'),
(533, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219498\",\"longitude\":\"-122.0837087\"},\"old\":{\"latitude\":\"37.4219487\",\"longitude\":\"-122.083702\"}}', '2022-05-19 19:08:26', '2022-05-19 19:08:26'),
(534, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219498\",\"longitude\":\"-122.0837087\"},\"old\":{\"latitude\":\"37.4219487\",\"longitude\":\"-122.083702\"}}', '2022-05-19 19:08:26', '2022-05-19 19:08:26'),
(535, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837142\"},\"old\":{\"latitude\":\"37.4219498\",\"longitude\":\"-122.0837087\"}}', '2022-05-19 19:08:38', '2022-05-19 19:08:38'),
(536, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837186\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837142\"}}', '2022-05-19 19:08:49', '2022-05-19 19:08:49'),
(537, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837186\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837142\"}}', '2022-05-19 19:08:49', '2022-05-19 19:08:49'),
(538, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219519\",\"longitude\":\"-122.0837215\"},\"old\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837186\"}}', '2022-05-19 19:08:57', '2022-05-19 19:08:57'),
(539, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219519\",\"longitude\":\"-122.0837215\"}}', '2022-05-19 19:09:02', '2022-05-19 19:09:02'),
(540, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 19:09:19', '2022-05-19 19:09:19'),
(541, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.0839842\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 19:09:30', '2022-05-19 19:09:30'),
(542, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839491\"},\"old\":{\"latitude\":\"37.4219957\",\"longitude\":\"-122.0839842\"}}', '2022-05-19 19:09:41', '2022-05-19 19:09:41'),
(543, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219801\",\"longitude\":\"-122.083891\"},\"old\":{\"latitude\":\"37.4219898\",\"longitude\":\"-122.0839491\"}}', '2022-05-19 19:09:52', '2022-05-19 19:09:52'),
(544, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219689\",\"longitude\":\"-122.0838237\"},\"old\":{\"latitude\":\"37.4219801\",\"longitude\":\"-122.083891\"}}', '2022-05-19 19:10:04', '2022-05-19 19:10:04'),
(545, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837637\"},\"old\":{\"latitude\":\"37.4219689\",\"longitude\":\"-122.0838237\"}}', '2022-05-19 19:10:15', '2022-05-19 19:10:15'),
(546, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837193\"},\"old\":{\"latitude\":\"37.4219589\",\"longitude\":\"-122.0837637\"}}', '2022-05-19 19:10:26', '2022-05-19 19:10:26'),
(547, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219468\",\"longitude\":\"-122.0836908\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837193\"}}', '2022-05-19 19:10:38', '2022-05-19 19:10:38'),
(548, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219468\",\"longitude\":\"-122.0836908\"},\"old\":{\"latitude\":\"37.4219515\",\"longitude\":\"-122.0837193\"}}', '2022-05-19 19:10:38', '2022-05-19 19:10:38'),
(549, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"},\"old\":{\"latitude\":\"37.4219468\",\"longitude\":\"-122.0836908\"}}', '2022-05-19 19:10:49', '2022-05-19 19:10:49'),
(550, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"},\"old\":{\"latitude\":\"37.4219468\",\"longitude\":\"-122.0836908\"}}', '2022-05-19 19:10:49', '2022-05-19 19:10:49'),
(551, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"},\"old\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"}}', '2022-05-19 19:11:00', '2022-05-19 19:11:00'),
(552, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"},\"old\":{\"latitude\":\"37.4219439\",\"longitude\":\"-122.0836734\"}}', '2022-05-19 19:11:00', '2022-05-19 19:11:00'),
(553, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"},\"old\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"}}', '2022-05-19 19:11:12', '2022-05-19 19:11:12'),
(554, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"},\"old\":{\"latitude\":\"37.4219431\",\"longitude\":\"-122.0836688\"}}', '2022-05-19 19:11:12', '2022-05-19 19:11:12'),
(555, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836722\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836683\"}}', '2022-05-19 19:11:23', '2022-05-19 19:11:23'),
(556, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"},\"old\":{\"latitude\":\"37.4219437\",\"longitude\":\"-122.0836722\"}}', '2022-05-19 19:11:34', '2022-05-19 19:11:34'),
(557, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"},\"old\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"}}', '2022-05-19 19:11:45', '2022-05-19 19:11:45'),
(558, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"},\"old\":{\"latitude\":\"37.4219448\",\"longitude\":\"-122.0836787\"}}', '2022-05-19 19:11:45', '2022-05-19 19:11:45'),
(559, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"},\"old\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"}}', '2022-05-19 19:11:57', '2022-05-19 19:11:57'),
(560, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"},\"old\":{\"latitude\":\"37.4219461\",\"longitude\":\"-122.0836865\"}}', '2022-05-19 19:11:57', '2022-05-19 19:11:57'),
(561, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.083702\"},\"old\":{\"latitude\":\"37.4219474\",\"longitude\":\"-122.0836944\"}}', '2022-05-19 19:12:08', '2022-05-19 19:12:08'),
(562, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837086\"},\"old\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.083702\"}}', '2022-05-19 19:12:19', '2022-05-19 19:12:19'),
(563, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837086\"},\"old\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.083702\"}}', '2022-05-19 19:12:19', '2022-05-19 19:12:19'),
(564, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837086\"},\"old\":{\"latitude\":\"37.4219486\",\"longitude\":\"-122.083702\"}}', '2022-05-19 19:12:19', '2022-05-19 19:12:19'),
(565, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837141\"},\"old\":{\"latitude\":\"37.4219497\",\"longitude\":\"-122.0837086\"}}', '2022-05-19 19:12:30', '2022-05-19 19:12:30'),
(566, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837185\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837141\"}}', '2022-05-19 19:12:42', '2022-05-19 19:12:42'),
(567, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837219\"},\"old\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837185\"}}', '2022-05-19 19:12:53', '2022-05-19 19:12:53'),
(568, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837243\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837219\"}}', '2022-05-19 19:13:04', '2022-05-19 19:13:04'),
(569, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.083726\"},\"old\":{\"latitude\":\"24.8840867\",\"longitude\":\"-122.0837243\"}}', '2022-05-19 19:13:16', '2022-05-19 19:13:16'),
(570, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.083726\"}}', '2022-05-19 19:13:27', '2022-05-19 19:13:27'),
(571, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"67.0555824\"}}', '2022-05-19 19:13:38', '2022-05-19 19:13:38'),
(572, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"67.0555824\"}}', '2022-05-19 19:13:38', '2022-05-19 19:13:38'),
(573, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837274\"}}', '2022-05-19 19:13:49', '2022-05-19 19:13:49'),
(574, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837274\"}}', '2022-05-19 19:13:49', '2022-05-19 19:13:49'),
(575, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837275\"},\"old\":{\"longitude\":\"-122.0837276\"}}', '2022-05-19 19:14:01', '2022-05-19 19:14:01'),
(576, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837273\"},\"old\":{\"longitude\":\"-122.0837275\"}}', '2022-05-19 19:14:12', '2022-05-19 19:14:12'),
(577, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837273\"},\"old\":{\"longitude\":\"-122.0837275\"}}', '2022-05-19 19:14:12', '2022-05-19 19:14:12'),
(578, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"},\"old\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837273\"}}', '2022-05-19 19:14:23', '2022-05-19 19:14:23'),
(579, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837266\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837269\"}}', '2022-05-19 19:14:34', '2022-05-19 19:14:34'),
(580, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837263\"},\"old\":{\"longitude\":\"-122.0837266\"}}', '2022-05-19 19:14:46', '2022-05-19 19:14:46'),
(581, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.083726\"},\"old\":{\"latitude\":\"37.4219527\",\"longitude\":\"-122.0837263\"}}', '2022-05-19 19:14:57', '2022-05-19 19:14:57'),
(582, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837257\"},\"old\":{\"longitude\":\"-122.083726\"}}', '2022-05-19 19:15:08', '2022-05-19 19:15:08'),
(583, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837255\"},\"old\":{\"longitude\":\"-122.0837257\"}}', '2022-05-19 19:15:19', '2022-05-19 19:15:19'),
(584, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837253\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837255\"}}', '2022-05-19 19:15:31', '2022-05-19 19:15:31'),
(585, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837252\"},\"old\":{\"longitude\":\"-122.0837253\"}}', '2022-05-19 19:15:42', '2022-05-19 19:15:42'),
(586, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.0837252\"}}', '2022-05-19 19:15:53', '2022-05-19 19:15:53'),
(587, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.083725\"},\"old\":{\"longitude\":\"-122.0837251\"}}', '2022-05-19 19:16:04', '2022-05-19 19:16:04'),
(588, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"longitude\":\"-122.0837251\"},\"old\":{\"longitude\":\"-122.083725\"}}', '2022-05-19 19:17:34', '2022-05-19 19:17:34'),
(589, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 19:19:37', '2022-05-19 19:19:37'),
(590, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"}}', '2022-05-19 19:19:39', '2022-05-19 19:19:39'),
(591, 'User', 'created', 'App\\User', 112, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"John Rider\",\"email\":\"john_rider@gmail.com\",\"phone\":\"123456789\",\"address\":\"Main University Rd, Block 13 A Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan\",\"image\":\"public\\/uploads\\/users\\/img\\/user-avatar.png\",\"password\":\"$2y$10$Nm4gpqIUQctdM0QAmRvNi.Buhk7H9mjCVInJHJYVoKs6KWkORYG0S\",\"otp\":\"6322\",\"device_type\":null,\"latitude\":\"24.9017745\",\"longitude\":\"67.073653\",\"br_code\":null,\"age\":null,\"dob\":null,\"country_code\":\"+1\",\"country_flag\":null,\"device_token\":null,\"identity\":null,\"id_image\":null,\"description\":null,\"verified_by\":\"email\",\"social_provider\":null,\"social_token\":null,\"social_id\":null,\"onlineStatus\":\"0\",\"min_order\":null,\"order_type\":null}}', '2022-05-19 19:22:31', '2022-05-19 19:22:31'),
(592, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"},\"old\":{\"device_token\":null}}', '2022-05-19 19:27:28', '2022-05-19 19:27:28'),
(593, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"},\"old\":{\"latitude\":\"24.9017745\",\"longitude\":\"67.073653\"}}', '2022-05-19 19:27:29', '2022-05-19 19:27:29'),
(594, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219525\",\"longitude\":\"-122.0837251\"}}', '2022-05-19 19:27:39', '2022-05-19 19:27:39'),
(595, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.083998\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 19:27:49', '2022-05-19 19:27:49'),
(596, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219961\",\"longitude\":\"-122.0839869\"},\"old\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.083998\"}}', '2022-05-19 19:27:59', '2022-05-19 19:27:59'),
(597, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219911\",\"longitude\":\"-122.0839572\"},\"old\":{\"latitude\":\"37.4219961\",\"longitude\":\"-122.0839869\"}}', '2022-05-19 19:28:09', '2022-05-19 19:28:09'),
(598, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219825\",\"longitude\":\"-122.0839062\"},\"old\":{\"latitude\":\"37.4219911\",\"longitude\":\"-122.0839572\"}}', '2022-05-19 19:28:19', '2022-05-19 19:28:19'),
(599, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421972\",\"longitude\":\"-122.0838427\"},\"old\":{\"latitude\":\"37.4219825\",\"longitude\":\"-122.0839062\"}}', '2022-05-19 19:28:29', '2022-05-19 19:28:29'),
(600, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219619\",\"longitude\":\"-122.0837821\"},\"old\":{\"latitude\":\"37.421972\",\"longitude\":\"-122.0838427\"}}', '2022-05-19 19:28:39', '2022-05-19 19:28:39'),
(601, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219539\",\"longitude\":\"-122.0837342\"},\"old\":{\"latitude\":\"37.4219619\",\"longitude\":\"-122.0837821\"}}', '2022-05-19 19:28:50', '2022-05-19 19:28:50'),
(602, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219484\",\"longitude\":\"-122.0837009\"},\"old\":{\"latitude\":\"37.4219539\",\"longitude\":\"-122.0837342\"}}', '2022-05-19 19:29:00', '2022-05-19 19:29:00'),
(603, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836802\"},\"old\":{\"latitude\":\"37.4219484\",\"longitude\":\"-122.0837009\"}}', '2022-05-19 19:29:10', '2022-05-19 19:29:10'),
(604, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219432\",\"longitude\":\"-122.0836693\"},\"old\":{\"latitude\":\"37.421945\",\"longitude\":\"-122.0836802\"}}', '2022-05-19 19:29:21', '2022-05-19 19:29:21'),
(605, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219427\",\"longitude\":\"-122.0836663\"},\"old\":{\"latitude\":\"37.4219432\",\"longitude\":\"-122.0836693\"}}', '2022-05-19 19:29:31', '2022-05-19 19:29:31'),
(606, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836679\"},\"old\":{\"latitude\":\"37.4219427\",\"longitude\":\"-122.0836663\"}}', '2022-05-19 19:29:42', '2022-05-19 19:29:42'),
(607, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836737\"},\"old\":{\"latitude\":\"37.421943\",\"longitude\":\"-122.0836679\"}}', '2022-05-19 19:29:52', '2022-05-19 19:29:52'),
(608, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219451\",\"longitude\":\"-122.0836806\"},\"old\":{\"latitude\":\"37.421944\",\"longitude\":\"-122.0836737\"}}', '2022-05-19 19:30:02', '2022-05-19 19:30:02'),
(609, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219464\",\"longitude\":\"-122.0836884\"},\"old\":{\"latitude\":\"37.4219451\",\"longitude\":\"-122.0836806\"}}', '2022-05-19 19:30:13', '2022-05-19 19:30:13'),
(610, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836961\"},\"old\":{\"latitude\":\"37.4219464\",\"longitude\":\"-122.0836884\"}}', '2022-05-19 19:30:23', '2022-05-19 19:30:23'),
(611, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219488\",\"longitude\":\"-122.0837031\"},\"old\":{\"latitude\":\"37.4219477\",\"longitude\":\"-122.0836961\"}}', '2022-05-19 19:30:33', '2022-05-19 19:30:33'),
(612, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837093\"},\"old\":{\"latitude\":\"37.4219488\",\"longitude\":\"-122.0837031\"}}', '2022-05-19 19:30:47', '2022-05-19 19:30:47'),
(613, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"},\"old\":{\"latitude\":\"37.4219499\",\"longitude\":\"-122.0837093\"}}', '2022-05-19 19:30:53', '2022-05-19 19:30:53'),
(614, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837186\"},\"old\":{\"latitude\":\"37.4219507\",\"longitude\":\"-122.0837144\"}}', '2022-05-19 19:31:03', '2022-05-19 19:31:03'),
(615, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837218\"},\"old\":{\"latitude\":\"37.4219514\",\"longitude\":\"-122.0837186\"}}', '2022-05-19 19:31:13', '2022-05-19 19:31:13'),
(616, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837242\"},\"old\":{\"latitude\":\"37.421952\",\"longitude\":\"-122.0837218\"}}', '2022-05-19 19:31:23', '2022-05-19 19:31:23'),
(617, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837258\"},\"old\":{\"latitude\":\"37.4219524\",\"longitude\":\"-122.0837242\"}}', '2022-05-19 19:31:34', '2022-05-19 19:31:34'),
(618, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837268\"},\"old\":{\"latitude\":\"37.4219526\",\"longitude\":\"-122.0837258\"}}', '2022-05-19 19:31:44', '2022-05-19 19:31:44'),
(619, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837268\"}}', '2022-05-19 19:31:54', '2022-05-19 19:31:54'),
(620, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0837276\"},\"old\":{\"longitude\":\"-122.0837274\"}}', '2022-05-19 19:32:04', '2022-05-19 19:32:04'),
(621, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0837274\"},\"old\":{\"longitude\":\"-122.0837276\"}}', '2022-05-19 19:32:24', '2022-05-19 19:32:24'),
(622, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837271\"},\"old\":{\"latitude\":\"37.4219529\",\"longitude\":\"-122.0837274\"}}', '2022-05-19 19:32:35', '2022-05-19 19:32:35'),
(623, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219528\",\"longitude\":\"-122.0837271\"}}', '2022-05-19 19:32:46', '2022-05-19 19:32:46'),
(624, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 19:32:57', '2022-05-19 19:32:57'),
(625, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 19:32:57', '2022-05-19 19:32:57'),
(626, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839857\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 19:33:07', '2022-05-19 19:33:07'),
(627, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839857\"}}', '2022-05-19 19:33:18', '2022-05-19 19:33:18'),
(628, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839857\"}}', '2022-05-19 19:33:18', '2022-05-19 19:33:18'),
(629, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-05-19 19:33:29', '2022-05-19 19:33:29'),
(630, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 19:33:41', '2022-05-19 19:33:41'),
(631, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"},\"old\":{\"latitude\":\"37.4219979\",\"longitude\":\"-122.0839976\"}}', '2022-05-19 19:33:41', '2022-05-19 19:33:41'),
(632, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.0839486\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"}}', '2022-05-19 19:33:52', '2022-05-19 19:33:52'),
(633, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.0839486\"},\"old\":{\"latitude\":\"37.4219956\",\"longitude\":\"-122.0839839\"}}', '2022-05-19 19:33:52', '2022-05-19 19:33:52'),
(634, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"},\"old\":{\"latitude\":\"37.4219896\",\"longitude\":\"-122.0839486\"}}', '2022-05-19 19:34:03', '2022-05-19 19:34:03'),
(635, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219688\",\"longitude\":\"-122.0838233\"},\"old\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"}}', '2022-05-19 19:34:14', '2022-05-19 19:34:14'),
(636, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219688\",\"longitude\":\"-122.0838233\"},\"old\":{\"latitude\":\"37.42198\",\"longitude\":\"-122.0838906\"}}', '2022-05-19 19:34:14', '2022-05-19 19:34:14'),
(637, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219593\",\"longitude\":\"-122.0837664\"},\"old\":{\"latitude\":\"37.4219688\",\"longitude\":\"-122.0838233\"}}', '2022-05-19 19:34:25', '2022-05-19 19:34:25'),
(638, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"},\"old\":{\"latitude\":\"37.4219593\",\"longitude\":\"-122.0837664\"}}', '2022-05-19 19:34:35', '2022-05-19 19:34:35'),
(639, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.083998\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-19 19:34:45', '2022-05-19 19:34:45'),
(640, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839866\"},\"old\":{\"latitude\":\"37.421998\",\"longitude\":\"-122.083998\"}}', '2022-05-19 19:34:56', '2022-05-19 19:34:56'),
(641, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"coCQYEAkQliLgJcMRj0nwk:APA91bFvRiDasdDUSLfwlMsR_-aKj7GBWeeZP1qgSfSd-jYWRM2rCAxQH31o9FcyQMLgq0Cx9BlLbACR-3hR896tM4FoaYE7r33-nFxoUxMo6nXSvu2bsJO9SUd5xdC_svhh93_KZBcx\"},\"old\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"}}', '2022-05-19 19:37:29', '2022-05-19 19:37:29'),
(642, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048159\",\"longitude\":\"67.0780525\"},\"old\":{\"latitude\":\"37.421996\",\"longitude\":\"-122.0839866\"}}', '2022-05-19 19:37:32', '2022-05-19 19:37:32'),
(643, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048071\",\"longitude\":\"67.0780737\"},\"old\":{\"latitude\":\"24.9048159\",\"longitude\":\"67.0780525\"}}', '2022-05-19 19:37:42', '2022-05-19 19:37:42'),
(644, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904797\",\"longitude\":\"67.0780741\"},\"old\":{\"latitude\":\"24.9048071\",\"longitude\":\"67.0780737\"}}', '2022-05-19 19:37:53', '2022-05-19 19:37:53'),
(645, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9047995\",\"longitude\":\"67.0780726\"},\"old\":{\"latitude\":\"24.904797\",\"longitude\":\"67.0780741\"}}', '2022-05-19 19:38:03', '2022-05-19 19:38:03'),
(646, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9047978\",\"longitude\":\"67.0780745\"},\"old\":{\"latitude\":\"24.9047995\",\"longitude\":\"67.0780726\"}}', '2022-05-19 19:38:13', '2022-05-19 19:38:13'),
(647, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048037\",\"longitude\":\"67.078073\"},\"old\":{\"latitude\":\"24.9047978\",\"longitude\":\"67.0780745\"}}', '2022-05-19 19:38:23', '2022-05-19 19:38:23'),
(648, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048067\",\"longitude\":\"67.0780736\"},\"old\":{\"latitude\":\"24.9048037\",\"longitude\":\"67.078073\"}}', '2022-05-19 19:38:34', '2022-05-19 19:38:34'),
(649, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048017\",\"longitude\":\"67.07807\"},\"old\":{\"latitude\":\"24.9048067\",\"longitude\":\"67.0780736\"}}', '2022-05-19 19:38:44', '2022-05-19 19:38:44'),
(650, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048016\",\"longitude\":\"67.0780696\"},\"old\":{\"latitude\":\"24.9048017\",\"longitude\":\"67.07807\"}}', '2022-05-19 19:38:55', '2022-05-19 19:38:55'),
(651, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048077\",\"longitude\":\"67.0780703\"},\"old\":{\"latitude\":\"24.9048016\",\"longitude\":\"67.0780696\"}}', '2022-05-19 19:39:05', '2022-05-19 19:39:05'),
(652, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-19 19:41:57', '2022-05-19 19:41:57'),
(653, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-19 19:42:54', '2022-05-19 19:42:54'),
(654, 'Order', 'updated', 'App\\Order', 82, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-19 19:43:00', '2022-05-19 19:43:00'),
(655, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"},\"old\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"}}', '2022-05-19 19:45:48', '2022-05-19 19:45:48'),
(656, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"}}', '2022-05-19 19:46:04', '2022-05-19 19:46:04'),
(657, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"},\"old\":{\"device_token\":null}}', '2022-05-19 19:47:56', '2022-05-19 19:47:56'),
(658, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"}}', '2022-05-19 19:48:00', '2022-05-19 19:48:00'),
(659, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"df_qNyU3QHC4mX43w4Otu_:APA91bGLw9n_jbD5SoPwbMtY0nb2FHK4jZ_bJqaTGEPnYW6OGYvIPEianK-xClTZalhUBG8Uly7JBDiLkf8tEsgZykzjXWEtdliIaPfoq7uEll6Czyr5oDC_XQtx1u1kxcM0XY21bnZt\"},\"old\":{\"device_token\":\"coCQYEAkQliLgJcMRj0nwk:APA91bFvRiDasdDUSLfwlMsR_-aKj7GBWeeZP1qgSfSd-jYWRM2rCAxQH31o9FcyQMLgq0Cx9BlLbACR-3hR896tM4FoaYE7r33-nFxoUxMo6nXSvu2bsJO9SUd5xdC_svhh93_KZBcx\"}}', '2022-05-19 20:02:23', '2022-05-19 20:02:23'),
(660, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904827\",\"longitude\":\"67.0780538\"},\"old\":{\"latitude\":\"24.9048077\",\"longitude\":\"67.0780703\"}}', '2022-05-19 20:02:26', '2022-05-19 20:02:26'),
(661, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048157\",\"longitude\":\"67.0780721\"},\"old\":{\"latitude\":\"24.904827\",\"longitude\":\"67.0780538\"}}', '2022-05-19 20:02:36', '2022-05-19 20:02:36'),
(662, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048021\",\"longitude\":\"67.0780772\"},\"old\":{\"latitude\":\"24.9048157\",\"longitude\":\"67.0780721\"}}', '2022-05-19 20:02:46', '2022-05-19 20:02:46'),
(663, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048387\",\"longitude\":\"67.0780566\"},\"old\":{\"latitude\":\"24.9048021\",\"longitude\":\"67.0780772\"}}', '2022-05-19 20:02:56', '2022-05-19 20:02:56'),
(664, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048035\",\"longitude\":\"67.0780719\"},\"old\":{\"latitude\":\"24.9048387\",\"longitude\":\"67.0780566\"}}', '2022-05-19 20:03:07', '2022-05-19 20:03:07'),
(665, 'Order', 'updated', 'App\\Order', 1, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-19 20:03:23', '2022-05-19 20:03:23'),
(666, 'Order', 'updated', 'App\\Order', 1, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":\"54\",\"order_status\":\"ready\"}}', '2022-05-19 20:03:25', '2022-05-19 20:03:25'),
(667, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048016\",\"longitude\":\"67.0780723\"},\"old\":{\"latitude\":\"24.9048035\",\"longitude\":\"67.0780719\"}}', '2022-05-19 20:03:30', '2022-05-19 20:03:30'),
(668, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048141\",\"longitude\":\"67.078067\"},\"old\":{\"latitude\":\"24.9048016\",\"longitude\":\"67.0780723\"}}', '2022-05-19 20:03:48', '2022-05-19 20:03:48'),
(669, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904802\",\"longitude\":\"67.0780723\"},\"old\":{\"latitude\":\"24.9048141\",\"longitude\":\"67.078067\"}}', '2022-05-19 20:17:26', '2022-05-19 20:17:26'),
(670, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904808\",\"longitude\":\"67.0780749\"},\"old\":{\"latitude\":\"24.904802\",\"longitude\":\"67.0780723\"}}', '2022-05-19 20:17:36', '2022-05-19 20:17:36'),
(671, 'Order', 'updated', 'App\\Order', 1, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-05-19 20:17:37', '2022-05-19 20:17:37'),
(672, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"df_qNyU3QHC4mX43w4Otu_:APA91bGLw9n_jbD5SoPwbMtY0nb2FHK4jZ_bJqaTGEPnYW6OGYvIPEianK-xClTZalhUBG8Uly7JBDiLkf8tEsgZykzjXWEtdliIaPfoq7uEll6Czyr5oDC_XQtx1u1kxcM0XY21bnZt\"}}', '2022-05-19 20:17:39', '2022-05-19 20:17:39'),
(673, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-19 20:27:37', '2022-05-19 20:27:37'),
(674, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 58, '{\"attributes\":[],\"old\":[]}', '2022-05-19 20:27:37', '2022-05-19 20:27:37'),
(675, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-19 20:27:39', '2022-05-19 20:27:39'),
(676, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":\"54\",\"order_status\":\"ready\"}}', '2022-05-19 20:27:41', '2022-05-19 20:27:41'),
(677, 'Order', 'updated', 'App\\Order', 71, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-05-19 20:36:57', '2022-05-19 20:36:57'),
(678, 'Order', 'created', 'App\\Order', 83, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"10\",\"distance\":null,\"note\":null}}', '2022-05-19 20:38:18', '2022-05-19 20:38:18'),
(679, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"800\",\"grand_total\":\"810\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-19 20:38:18', '2022-05-19 20:38:18'),
(680, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-19 20:39:36', '2022-05-19 20:39:36'),
(681, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-19 20:39:39', '2022-05-19 20:39:39'),
(682, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-19 20:39:41', '2022-05-19 20:39:41'),
(683, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"},\"old\":{\"device_token\":null}}', '2022-05-19 20:49:04', '2022-05-19 20:49:04'),
(684, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cMhteogvEkcmrlcXC7ClBE:APA91bGAT8Gdnd9d00HWwhyidfLlfsAs8THn__AJiQ1Kz-dPxbiPEp54X7Wlm_joVczAXo7huvjGWCEM6ZK67i3bg4TMJbZg3ArHPGIZMfg02vOiPlizD2G5oeW0jGQYXa99Wyu9fl3q\"},\"old\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"}}', '2022-05-19 20:51:51', '2022-05-19 20:51:51'),
(685, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"daugLoYMQY-m4BQG4KNvSE:APA91bHZ0GwkH835orEfJMGlf6U2JOvWWiRPr7PILFhPNanWGYBFFVnSRWhJS8NTcW0Jp46ByrzMQ-m6xiS8_HwgR2XjKscr4GXeI_UkSbQVsYs8BrsClkYQJPeUqJeiV87YOj4Iq7JN\"},\"old\":{\"device_token\":null}}', '2022-05-19 20:59:36', '2022-05-19 20:59:36'),
(686, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048088\",\"longitude\":\"67.0780724\"},\"old\":{\"latitude\":\"24.904808\",\"longitude\":\"67.0780749\"}}', '2022-05-19 20:59:40', '2022-05-19 20:59:40'),
(687, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048453\",\"longitude\":\"67.0780499\"},\"old\":{\"latitude\":\"24.9048088\",\"longitude\":\"67.0780724\"}}', '2022-05-19 21:00:09', '2022-05-19 21:00:09'),
(688, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048048\",\"longitude\":\"67.078074\"},\"old\":{\"latitude\":\"24.9048453\",\"longitude\":\"67.0780499\"}}', '2022-05-19 21:00:10', '2022-05-19 21:00:10'),
(689, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048066\",\"longitude\":\"67.0780735\"},\"old\":{\"latitude\":\"24.9048048\",\"longitude\":\"67.078074\"}}', '2022-05-19 21:00:21', '2022-05-19 21:00:21');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(690, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-19 21:00:24', '2022-05-19 21:00:24'),
(691, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048877\",\"longitude\":\"67.0781913\"},\"old\":{\"latitude\":\"24.9048066\",\"longitude\":\"67.0780735\"}}', '2022-05-19 21:00:30', '2022-05-19 21:00:30'),
(692, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-19 21:00:35', '2022-05-19 21:00:35'),
(693, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048136\",\"longitude\":\"67.0780766\"},\"old\":{\"latitude\":\"24.9048877\",\"longitude\":\"67.0781913\"}}', '2022-05-19 21:00:41', '2022-05-19 21:00:41'),
(694, 'Order', 'updated', 'App\\Order', 83, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-19 21:01:28', '2022-05-19 21:01:28'),
(695, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048127\",\"longitude\":\"67.078068\"},\"old\":{\"latitude\":\"24.9048136\",\"longitude\":\"67.0780766\"}}', '2022-05-19 21:01:29', '2022-05-19 21:01:29'),
(696, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904854\",\"longitude\":\"67.0780517\"},\"old\":{\"latitude\":\"24.9048127\",\"longitude\":\"67.078068\"}}', '2022-05-19 21:01:46', '2022-05-19 21:01:46'),
(697, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"daugLoYMQY-m4BQG4KNvSE:APA91bHZ0GwkH835orEfJMGlf6U2JOvWWiRPr7PILFhPNanWGYBFFVnSRWhJS8NTcW0Jp46ByrzMQ-m6xiS8_HwgR2XjKscr4GXeI_UkSbQVsYs8BrsClkYQJPeUqJeiV87YOj4Iq7JN\"}}', '2022-05-19 21:01:52', '2022-05-19 21:01:52'),
(698, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"},\"old\":{\"device_token\":\"cMhteogvEkcmrlcXC7ClBE:APA91bGAT8Gdnd9d00HWwhyidfLlfsAs8THn__AJiQ1Kz-dPxbiPEp54X7Wlm_joVczAXo7huvjGWCEM6ZK67i3bg4TMJbZg3ArHPGIZMfg02vOiPlizD2G5oeW0jGQYXa99Wyu9fl3q\"}}', '2022-05-19 21:09:39', '2022-05-19 21:09:39'),
(699, 'Order', 'created', 'App\\Order', 84, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"20\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"4\",\"distance\":null,\"note\":null}}', '2022-05-19 21:11:21', '2022-05-19 21:11:21'),
(700, 'Order', 'updated', 'App\\Order', 84, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"105\",\"grand_total\":\"109\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-19 21:11:21', '2022-05-19 21:11:21'),
(701, 'Order', 'updated', 'App\\Order', 84, 'App\\User', 109, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-19 21:12:03', '2022-05-19 21:12:03'),
(702, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cMhteogvEkcmrlcXC7ClBE:APA91bGAT8Gdnd9d00HWwhyidfLlfsAs8THn__AJiQ1Kz-dPxbiPEp54X7Wlm_joVczAXo7huvjGWCEM6ZK67i3bg4TMJbZg3ArHPGIZMfg02vOiPlizD2G5oeW0jGQYXa99Wyu9fl3q\"},\"old\":{\"device_token\":\"cIUle1gPS_myV9tq9_NdF-:APA91bHGkzosw0fCSz4qUN2q-dL05JC09-3bv9PCNPGF6heEKq90KdlRacWUFhXUfvTqNPIfQgs8Aghz6ocSNZuvjV0bkgxbMtMYcXBmkPcj6xFXAe37W4KMR-_Lc26QjThG6Ayxc1BS\"}}', '2022-05-20 14:28:47', '2022-05-20 14:28:47'),
(703, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"cMhteogvEkcmrlcXC7ClBE:APA91bGAT8Gdnd9d00HWwhyidfLlfsAs8THn__AJiQ1Kz-dPxbiPEp54X7Wlm_joVczAXo7huvjGWCEM6ZK67i3bg4TMJbZg3ArHPGIZMfg02vOiPlizD2G5oeW0jGQYXa99Wyu9fl3q\"}}', '2022-05-20 14:30:00', '2022-05-20 14:30:00'),
(704, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"},\"old\":{\"device_token\":null}}', '2022-05-20 15:59:39', '2022-05-20 15:59:39'),
(705, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"},\"old\":{\"device_token\":null}}', '2022-05-20 21:12:07', '2022-05-20 21:12:07'),
(706, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-05-20 21:12:58', '2022-05-20 21:12:58'),
(707, 'Order', 'updated', 'App\\Order', 72, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-05-20 21:13:04', '2022-05-20 21:13:04'),
(708, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"f4K9WKebTs-D-OglHECgij:APA91bGlQeho3fY5Vdt_toVf47hWiMU0_jukO09qwOiWE_lkeFPkYs-1tiNuR6jDHiT4vMJuPLS4zkiHqrOgv99JGtjLn-_FiM3EWeifHa3goxUiQCmH8bUL8r29pq_C4hvIejRgvgAw\"},\"old\":{\"device_token\":\"fRHrmSCWeULzmFa7ys34N_:APA91bERxM0PmoUmyZHmYC4dubaTjwkwJrKTQrHzk2sYGzEsT9P5TuLVhIFWTM8UsQg_yQlFr8P8S3zZmDja3I9EseWLa5_LDuPNYB-SRRtLAP-Zagi3QNpow2zj57fry2tZbe-Vk6C7\"}}', '2022-05-22 15:38:55', '2022-05-22 15:38:55'),
(709, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4167942\",\"longitude\":\"-1.6675096\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0839999\"}}', '2022-05-22 15:38:59', '2022-05-22 15:38:59'),
(710, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 91, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-05-22 15:39:47', '2022-05-22 15:39:47'),
(711, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4166432\",\"longitude\":\"-1.6674937\"},\"old\":{\"latitude\":\"12.4167942\",\"longitude\":\"-1.6675096\"}}', '2022-05-22 15:40:00', '2022-05-22 15:40:00'),
(712, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4166432\",\"longitude\":\"-1.6674937\"}}', '2022-05-22 15:43:59', '2022-05-22 15:43:59'),
(713, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4050971\",\"longitude\":\"-1.6261419\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 15:44:10', '2022-05-22 15:44:10'),
(714, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4088463\",\"longitude\":\"-1.6349278\"},\"old\":{\"latitude\":\"12.4050971\",\"longitude\":\"-1.6261419\"}}', '2022-05-22 15:44:36', '2022-05-22 15:44:36'),
(715, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4088463\",\"longitude\":\"-1.6349278\"}}', '2022-05-22 15:44:51', '2022-05-22 15:44:51'),
(716, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4027388\",\"longitude\":\"-1.625071\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 15:45:13', '2022-05-22 15:45:13'),
(717, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3715539\",\"longitude\":\"-1.6272157\"},\"old\":{\"latitude\":\"12.4027388\",\"longitude\":\"-1.625071\"}}', '2022-05-22 15:45:55', '2022-05-22 15:45:55'),
(718, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"},\"old\":{\"latitude\":\"12.3715539\",\"longitude\":\"-1.6272157\"}}', '2022-05-22 15:46:15', '2022-05-22 15:46:15'),
(719, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3715539\",\"longitude\":\"-1.6272157\"},\"old\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"}}', '2022-05-22 15:46:57', '2022-05-22 15:46:57'),
(720, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.3715539\",\"longitude\":\"-1.6272157\"}}', '2022-05-22 15:47:19', '2022-05-22 15:47:19'),
(721, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 15:48:01', '2022-05-22 15:48:01'),
(722, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"},\"old\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"}}', '2022-05-22 15:48:59', '2022-05-22 15:48:59'),
(723, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"},\"old\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"}}', '2022-05-22 15:48:59', '2022-05-22 15:48:59'),
(724, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"},\"old\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"}}', '2022-05-22 15:48:59', '2022-05-22 15:48:59'),
(725, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"},\"old\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"}}', '2022-05-22 15:49:23', '2022-05-22 15:49:23'),
(726, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"}}', '2022-05-22 15:49:38', '2022-05-22 15:49:38'),
(727, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4168402\",\"longitude\":\"-1.6675809\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 15:50:19', '2022-05-22 15:50:19'),
(728, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3967089\",\"longitude\":\"-1.6161768\"},\"old\":{\"latitude\":\"12.4168402\",\"longitude\":\"-1.6675809\"}}', '2022-05-22 15:54:44', '2022-05-22 15:54:44'),
(729, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4033699\",\"longitude\":\"-1.6285373\"},\"old\":{\"latitude\":\"12.3967089\",\"longitude\":\"-1.6161768\"}}', '2022-05-22 15:56:07', '2022-05-22 15:56:07'),
(730, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4033699\",\"longitude\":\"-1.6285373\"}}', '2022-05-22 15:56:29', '2022-05-22 15:56:29'),
(731, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3989208\",\"longitude\":\"-1.6301144\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 15:56:49', '2022-05-22 15:56:49'),
(732, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4026241\",\"longitude\":\"-1.6337089\"},\"old\":{\"latitude\":\"12.3989208\",\"longitude\":\"-1.6301144\"}}', '2022-05-22 15:57:00', '2022-05-22 15:57:00'),
(733, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3989208\",\"longitude\":\"-1.6301144\"},\"old\":{\"latitude\":\"12.4026241\",\"longitude\":\"-1.6337089\"}}', '2022-05-22 15:57:11', '2022-05-22 15:57:11'),
(734, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.3989208\",\"longitude\":\"-1.6301144\"}}', '2022-05-22 15:57:21', '2022-05-22 15:57:21'),
(735, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 16:03:45', '2022-05-22 16:03:45'),
(736, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"},\"old\":{\"latitude\":\"12.4094085\",\"longitude\":\"-1.6461653\"}}', '2022-05-22 16:04:07', '2022-05-22 16:04:07'),
(737, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"},\"old\":{\"latitude\":\"12.4087861\",\"longitude\":\"-1.6514328\"}}', '2022-05-22 16:04:18', '2022-05-22 16:04:18'),
(738, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3554871\",\"longitude\":\"-1.6018821\"},\"old\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"}}', '2022-05-22 16:04:29', '2022-05-22 16:04:29'),
(739, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.3554871\",\"longitude\":\"-1.6018821\"}}', '2022-05-22 16:04:40', '2022-05-22 16:04:40'),
(740, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 16:05:00', '2022-05-22 16:05:00'),
(741, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3885392\",\"longitude\":\"-1.6384025\"},\"old\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"}}', '2022-05-22 16:05:21', '2022-05-22 16:05:21'),
(742, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.3885392\",\"longitude\":\"-1.6384025\"}}', '2022-05-22 16:05:41', '2022-05-22 16:05:41'),
(743, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3885392\",\"longitude\":\"-1.6384025\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 16:07:27', '2022-05-22 16:07:27'),
(744, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"},\"old\":{\"latitude\":\"12.3885392\",\"longitude\":\"-1.6384025\"}}', '2022-05-22 16:07:48', '2022-05-22 16:07:48'),
(745, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257546\",\"longitude\":\"-1.6443457\"},\"old\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"}}', '2022-05-22 16:09:21', '2022-05-22 16:09:21'),
(746, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257546\",\"longitude\":\"-1.6443457\"},\"old\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"}}', '2022-05-22 16:09:21', '2022-05-22 16:09:21'),
(747, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4410442\",\"longitude\":\"-1.6622536\"},\"old\":{\"latitude\":\"12.4257546\",\"longitude\":\"-1.6443457\"}}', '2022-05-22 16:10:34', '2022-05-22 16:10:34'),
(748, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4410442\",\"longitude\":\"-1.6622536\"}}', '2022-05-22 16:10:53', '2022-05-22 16:10:53'),
(749, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 16:17:19', '2022-05-22 16:17:19'),
(750, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:19:19', '2022-05-22 16:19:19'),
(751, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:19:19', '2022-05-22 16:19:19'),
(752, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 16:20:39', '2022-05-22 16:20:39'),
(753, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:21:19', '2022-05-22 16:21:19'),
(754, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"}}', '2022-05-22 16:21:29', '2022-05-22 16:21:29'),
(755, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:26:56', '2022-05-22 16:26:56'),
(756, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 16:27:12', '2022-05-22 16:27:12'),
(757, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:30:59', '2022-05-22 16:30:59'),
(758, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4100309\",\"longitude\":\"-1.6408979\"}}', '2022-05-22 16:31:15', '2022-05-22 16:31:15'),
(759, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257546\",\"longitude\":\"-1.6443457\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:37:52', '2022-05-22 16:37:52'),
(760, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4257546\",\"longitude\":\"-1.6443457\"}}', '2022-05-22 16:38:42', '2022-05-22 16:38:42'),
(761, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:38:53', '2022-05-22 16:38:53'),
(762, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 16:38:53', '2022-05-22 16:38:53'),
(763, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"},\"old\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"}}', '2022-05-22 16:39:36', '2022-05-22 16:39:36'),
(764, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"},\"old\":{\"latitude\":\"12.4310542\",\"longitude\":\"-1.6561823\"}}', '2022-05-22 16:39:36', '2022-05-22 16:39:36'),
(765, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4167462\",\"longitude\":\"-1.6537541\"},\"old\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"}}', '2022-05-22 16:39:44', '2022-05-22 16:39:44'),
(766, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4167462\",\"longitude\":\"-1.6537541\"},\"old\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"}}', '2022-05-22 16:39:44', '2022-05-22 16:39:44'),
(767, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4285734\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4167462\",\"longitude\":\"-1.6537541\"}}', '2022-05-22 16:39:54', '2022-05-22 16:39:54'),
(768, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4285734\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 16:40:05', '2022-05-22 16:40:05'),
(769, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:05:25', '2022-05-22 17:05:25'),
(770, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4246859\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"}}', '2022-05-22 17:05:35', '2022-05-22 17:05:35'),
(771, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.430373\",\"longitude\":\"-1.6504154\"},\"old\":{\"latitude\":\"12.4246859\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:05:56', '2022-05-22 17:05:56'),
(772, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.430373\",\"longitude\":\"-1.6504154\"},\"old\":{\"latitude\":\"12.4246859\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:05:56', '2022-05-22 17:05:56'),
(773, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.430373\",\"longitude\":\"-1.6504154\"}}', '2022-05-22 17:06:06', '2022-05-22 17:06:06'),
(774, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:07:50', '2022-05-22 17:07:50'),
(775, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:07:50', '2022-05-22 17:07:50'),
(776, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4239716\",\"longitude\":\"-1.6431319\"},\"old\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 17:08:00', '2022-05-22 17:08:00'),
(777, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4239716\",\"longitude\":\"-1.6431319\"}}', '2022-05-22 17:09:42', '2022-05-22 17:09:42'),
(778, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 17:10:02', '2022-05-22 17:10:02'),
(779, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:12:43', '2022-05-22 17:12:43'),
(780, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:12:43', '2022-05-22 17:12:43'),
(781, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(782, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(783, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(784, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(785, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(786, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:13:09', '2022-05-22 17:13:09'),
(787, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:14:41', '2022-05-22 17:14:41'),
(788, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:14:43', '2022-05-22 17:14:43'),
(789, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:14:44', '2022-05-22 17:14:44'),
(790, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:14:44', '2022-05-22 17:14:44'),
(791, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4239331\",\"longitude\":\"-1.6495049\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:14:58', '2022-05-22 17:14:58'),
(792, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.428546\",\"longitude\":\"-1.652399\"},\"old\":{\"latitude\":\"12.4239331\",\"longitude\":\"-1.6495049\"}}', '2022-05-22 17:15:07', '2022-05-22 17:15:07'),
(793, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.428546\",\"longitude\":\"-1.652399\"}}', '2022-05-22 17:34:41', '2022-05-22 17:34:41'),
(794, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4315886\",\"longitude\":\"-1.6534364\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:34:55', '2022-05-22 17:34:55'),
(795, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4315886\",\"longitude\":\"-1.6534364\"}}', '2022-05-22 17:34:56', '2022-05-22 17:34:56'),
(796, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4315886\",\"longitude\":\"-1.6534364\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:34:57', '2022-05-22 17:34:57'),
(797, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.432003\",\"longitude\":\"-1.6506901\"},\"old\":{\"latitude\":\"12.4315886\",\"longitude\":\"-1.6534364\"}}', '2022-05-22 17:34:57', '2022-05-22 17:34:57'),
(798, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4303611\",\"longitude\":\"-1.6463631\"},\"old\":{\"latitude\":\"12.432003\",\"longitude\":\"-1.6506901\"}}', '2022-05-22 17:34:57', '2022-05-22 17:34:57'),
(799, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.432003\",\"longitude\":\"-1.6506901\"},\"old\":{\"latitude\":\"12.4303611\",\"longitude\":\"-1.6463631\"}}', '2022-05-22 17:34:57', '2022-05-22 17:34:57'),
(800, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4303611\",\"longitude\":\"-1.6463631\"},\"old\":{\"latitude\":\"12.432003\",\"longitude\":\"-1.6506901\"}}', '2022-05-22 17:34:58', '2022-05-22 17:34:58'),
(801, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4303611\",\"longitude\":\"-1.6463631\"}}', '2022-05-22 17:34:58', '2022-05-22 17:34:58'),
(802, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:35:00', '2022-05-22 17:35:00'),
(803, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:01', '2022-05-22 17:35:01'),
(804, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:35:01', '2022-05-22 17:35:01'),
(805, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:03', '2022-05-22 17:35:03'),
(806, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:35:06', '2022-05-22 17:35:06'),
(807, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:08', '2022-05-22 17:35:08'),
(808, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:35:08', '2022-05-22 17:35:08'),
(809, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:11', '2022-05-22 17:35:11'),
(810, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:35:12', '2022-05-22 17:35:12'),
(811, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:12', '2022-05-22 17:35:12'),
(812, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:35:12', '2022-05-22 17:35:12'),
(813, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:18', '2022-05-22 17:35:18'),
(814, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:35:22', '2022-05-22 17:35:22'),
(815, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:35:24', '2022-05-22 17:35:24'),
(816, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:24', '2022-05-22 17:35:24'),
(817, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:35:24', '2022-05-22 17:35:24'),
(818, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:26', '2022-05-22 17:35:26'),
(819, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 17:35:30', '2022-05-22 17:35:30'),
(820, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:32', '2022-05-22 17:35:32'),
(821, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:35:32', '2022-05-22 17:35:32'),
(822, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:35:32', '2022-05-22 17:35:32'),
(823, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4281655\",\"longitude\":\"-1.6601286\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:35:33', '2022-05-22 17:35:33'),
(824, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4281655\",\"longitude\":\"-1.6601286\"}}', '2022-05-22 17:35:34', '2022-05-22 17:35:34'),
(825, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4281655\",\"longitude\":\"-1.6601286\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:35:34', '2022-05-22 17:35:34'),
(826, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4281655\",\"longitude\":\"-1.6601286\"}}', '2022-05-22 17:35:34', '2022-05-22 17:35:34'),
(827, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:36:10', '2022-05-22 17:36:10'),
(828, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307109\",\"longitude\":\"-1.6537541\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:39:18', '2022-05-22 17:39:18'),
(829, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.4307109\",\"longitude\":\"-1.6537541\"}}', '2022-05-22 17:39:49', '2022-05-22 17:39:49'),
(830, 'Address', 'created', 'App\\Address', 21, 'App\\User', 73, '{\"attributes\":{\"user_id\":\"73\",\"address\":\"Pakistan\",\"latitude\":\"30.375321\",\"longitude\":\"69.345116\",\"address_name\":\"Other\"}}', '2022-05-22 17:41:24', '2022-05-22 17:41:24'),
(831, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 17:41:41', '2022-05-22 17:41:41'),
(832, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:42:03', '2022-05-22 17:42:03'),
(833, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:43:21', '2022-05-22 17:43:21'),
(834, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:43:34', '2022-05-22 17:43:34'),
(835, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:44:04', '2022-05-22 17:44:04'),
(836, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:44:05', '2022-05-22 17:44:05'),
(837, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 17:44:05', '2022-05-22 17:44:05'),
(838, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4371216\",\"longitude\":\"-1.6595215\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:45:54', '2022-05-22 17:45:54'),
(839, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4371216\",\"longitude\":\"-1.6595215\"}}', '2022-05-22 17:46:04', '2022-05-22 17:46:04'),
(840, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:46:14', '2022-05-22 17:46:14'),
(841, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"}}', '2022-05-22 17:47:45', '2022-05-22 17:47:45'),
(842, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307109\",\"longitude\":\"-1.6537541\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 17:50:19', '2022-05-22 17:50:19'),
(843, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4307109\",\"longitude\":\"-1.6537541\"}}', '2022-05-22 17:51:38', '2022-05-22 17:51:38'),
(844, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 17:54:15', '2022-05-22 17:54:15'),
(845, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4410442\",\"longitude\":\"-1.6622536\"},\"old\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 17:54:57', '2022-05-22 17:54:57'),
(846, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4410442\",\"longitude\":\"-1.6622536\"}}', '2022-05-22 17:55:18', '2022-05-22 17:55:18'),
(847, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:57:16', '2022-05-22 17:57:16'),
(848, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 17:57:16', '2022-05-22 17:57:16'),
(849, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:02:10', '2022-05-22 18:02:10'),
(850, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:02:10', '2022-05-22 18:02:10'),
(851, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:04:30', '2022-05-22 18:04:30'),
(852, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 18:05:10', '2022-05-22 18:05:10'),
(853, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:05:11', '2022-05-22 18:05:11'),
(854, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 18:06:12', '2022-05-22 18:06:12'),
(855, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:08:01', '2022-05-22 18:08:01'),
(856, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 18:09:31', '2022-05-22 18:09:31'),
(857, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4338686\",\"longitude\":\"-1.6603788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:10:52', '2022-05-22 18:10:52'),
(858, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.4338686\",\"longitude\":\"-1.6603788\"}}', '2022-05-22 18:11:12', '2022-05-22 18:11:12'),
(859, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3868142\",\"longitude\":\"-1.6580375\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 18:12:32', '2022-05-22 18:12:32'),
(860, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"},\"old\":{\"latitude\":\"12.3868142\",\"longitude\":\"-1.6580375\"}}', '2022-05-22 18:12:42', '2022-05-22 18:12:42'),
(861, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"},\"old\":{\"latitude\":\"12.3868142\",\"longitude\":\"-1.6580375\"}}', '2022-05-22 18:12:42', '2022-05-22 18:12:42'),
(862, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:13:00', '2022-05-22 18:13:00'),
(863, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:13:02', '2022-05-22 18:13:02'),
(864, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:15:45', '2022-05-22 18:15:45'),
(865, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:15:45', '2022-05-22 18:15:45'),
(866, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:15:45', '2022-05-22 18:15:45'),
(867, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.329627\",\"longitude\":\"-1.6528034\"}}', '2022-05-22 18:15:45', '2022-05-22 18:15:45'),
(868, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:18:06', '2022-05-22 18:18:06'),
(869, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:18:06', '2022-05-22 18:18:06'),
(870, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 18:19:26', '2022-05-22 18:19:26'),
(871, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:20:17', '2022-05-22 18:20:17'),
(872, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:20:26', '2022-05-22 18:20:26'),
(873, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:20:26', '2022-05-22 18:20:26'),
(874, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:20:26', '2022-05-22 18:20:26'),
(875, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 18:20:37', '2022-05-22 18:20:37'),
(876, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4307219\",\"longitude\":\"-1.6519329\"}}', '2022-05-22 18:20:37', '2022-05-22 18:20:37'),
(877, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:23:39', '2022-05-22 18:23:39'),
(878, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.421803\",\"longitude\":\"-1.64647\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:25:39', '2022-05-22 18:25:39'),
(879, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.421803\",\"longitude\":\"-1.64647\"}}', '2022-05-22 18:26:19', '2022-05-22 18:26:19'),
(880, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4181175\",\"longitude\":\"-1.6637716\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:26:30', '2022-05-22 18:26:30'),
(881, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4181175\",\"longitude\":\"-1.6637716\"}}', '2022-05-22 18:28:00', '2022-05-22 18:28:00'),
(882, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:29:18', '2022-05-22 18:29:18'),
(883, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:32:05', '2022-05-22 18:32:05'),
(884, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"}}', '2022-05-22 18:32:59', '2022-05-22 18:32:59');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(885, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:33:49', '2022-05-22 18:33:49'),
(886, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:36:59', '2022-05-22 18:36:59'),
(887, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 18:37:09', '2022-05-22 18:37:09'),
(888, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 18:37:20', '2022-05-22 18:37:20'),
(889, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 18:38:22', '2022-05-22 18:38:22'),
(890, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:40:28', '2022-05-22 18:40:28'),
(891, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:42:04', '2022-05-22 18:42:04'),
(892, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4181175\",\"longitude\":\"-1.6637716\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:51:21', '2022-05-22 18:51:21'),
(893, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4181175\",\"longitude\":\"-1.6637716\"}}', '2022-05-22 18:52:45', '2022-05-22 18:52:45'),
(894, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:55:01', '2022-05-22 18:55:01'),
(895, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 18:55:32', '2022-05-22 18:55:32'),
(896, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 18:58:44', '2022-05-22 18:58:44'),
(897, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:02:06', '2022-05-22 19:02:06'),
(898, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3841819\",\"longitude\":\"-1.6364388\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:02:38', '2022-05-22 19:02:38'),
(899, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"},\"old\":{\"latitude\":\"12.3841819\",\"longitude\":\"-1.6364388\"}}', '2022-05-22 19:02:59', '2022-05-22 19:02:59'),
(900, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.3330769\",\"longitude\":\"-1.6135336\"}}', '2022-05-22 19:26:28', '2022-05-22 19:26:28'),
(901, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 19:57:39', '2022-05-22 19:57:39'),
(902, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 19:58:06', '2022-05-22 19:58:06'),
(903, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:14', '2022-05-22 19:58:14'),
(904, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 19:58:16', '2022-05-22 19:58:16'),
(905, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 19:58:16', '2022-05-22 19:58:16'),
(906, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4349674\",\"longitude\":\"-1.6604322\"}}', '2022-05-22 19:58:17', '2022-05-22 19:58:17'),
(907, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:22', '2022-05-22 19:58:22'),
(908, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:58:24', '2022-05-22 19:58:24'),
(909, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:24', '2022-05-22 19:58:24'),
(910, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4309894\",\"longitude\":\"-1.6668077\"}}', '2022-05-22 19:58:25', '2022-05-22 19:58:25'),
(911, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:25', '2022-05-22 19:58:25'),
(912, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:58:26', '2022-05-22 19:58:26'),
(913, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4371216\",\"longitude\":\"-1.6595215\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:34', '2022-05-22 19:58:34'),
(914, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4371216\",\"longitude\":\"-1.6595215\"}}', '2022-05-22 19:58:35', '2022-05-22 19:58:35'),
(915, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3285298\",\"longitude\":\"-1.6225021\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:39', '2022-05-22 19:58:39'),
(916, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.3285298\",\"longitude\":\"-1.6225021\"}}', '2022-05-22 19:58:42', '2022-05-22 19:58:42'),
(917, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4396442\",\"longitude\":\"-1.6613078\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:58:44', '2022-05-22 19:58:44'),
(918, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.4396442\",\"longitude\":\"-1.6613078\"}}', '2022-05-22 19:58:46', '2022-05-22 19:58:46'),
(919, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4396442\",\"longitude\":\"-1.6613078\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 19:58:46', '2022-05-22 19:58:46'),
(920, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"},\"old\":{\"latitude\":\"12.4396442\",\"longitude\":\"-1.6613078\"}}', '2022-05-22 19:58:46', '2022-05-22 19:58:46'),
(921, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4440014\",\"longitude\":\"-1.6632715\"}}', '2022-05-22 19:58:49', '2022-05-22 19:58:49'),
(922, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:54', '2022-05-22 19:58:54'),
(923, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:58:54', '2022-05-22 19:58:54'),
(924, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:58:56', '2022-05-22 19:58:56'),
(925, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:59:01', '2022-05-22 19:59:01'),
(926, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:04', '2022-05-22 19:59:04'),
(927, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:59:04', '2022-05-22 19:59:04'),
(928, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:04', '2022-05-22 19:59:04'),
(929, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:59:08', '2022-05-22 19:59:08'),
(930, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:08', '2022-05-22 19:59:08'),
(931, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:59:09', '2022-05-22 19:59:09'),
(932, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:12', '2022-05-22 19:59:12'),
(933, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4296458\",\"longitude\":\"-1.6522364\"}}', '2022-05-22 19:59:16', '2022-05-22 19:59:16'),
(934, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4306906\",\"longitude\":\"-1.657093\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:19', '2022-05-22 19:59:19'),
(935, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"},\"old\":{\"latitude\":\"12.4306906\",\"longitude\":\"-1.657093\"}}', '2022-05-22 19:59:23', '2022-05-22 19:59:23'),
(936, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4306906\",\"longitude\":\"-1.657093\"},\"old\":{\"latitude\":\"12.4257216\",\"longitude\":\"-1.6498084\"}}', '2022-05-22 19:59:23', '2022-05-22 19:59:23'),
(937, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4306906\",\"longitude\":\"-1.657093\"}}', '2022-05-22 19:59:23', '2022-05-22 19:59:23'),
(938, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:24', '2022-05-22 19:59:24'),
(939, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 19:59:24', '2022-05-22 19:59:24'),
(940, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 19:59:24', '2022-05-22 19:59:24'),
(941, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"},\"old\":{\"latitude\":\"12.4339208\",\"longitude\":\"-1.6558788\"}}', '2022-05-22 20:00:12', '2022-05-22 20:00:12'),
(942, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"},\"old\":{\"latitude\":\"12.4339097\",\"longitude\":\"-1.6577001\"}}', '2022-05-22 20:01:32', '2022-05-22 20:01:32'),
(943, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3285298\",\"longitude\":\"-1.6225021\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 20:36:15', '2022-05-22 20:36:15'),
(944, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.3285298\",\"longitude\":\"-1.6225021\"},\"old\":{\"latitude\":\"12.4232536\",\"longitude\":\"-1.6434354\"}}', '2022-05-22 20:36:15', '2022-05-22 20:36:15'),
(945, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"},\"old\":{\"latitude\":\"12.3285298\",\"longitude\":\"-1.6225021\"}}', '2022-05-23 09:49:05', '2022-05-23 09:49:05'),
(946, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"f4K9WKebTs-D-OglHECgij:APA91bGlQeho3fY5Vdt_toVf47hWiMU0_jukO09qwOiWE_lkeFPkYs-1tiNuR6jDHiT4vMJuPLS4zkiHqrOgv99JGtjLn-_FiM3EWeifHa3goxUiQCmH8bUL8r29pq_C4hvIejRgvgAw\"}}', '2022-05-23 09:49:40', '2022-05-23 09:49:40'),
(947, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"e31LmeboSgG3XBfxCtvTjT:APA91bFUhVmaU30nNA9cqnWUipLU6nR3iNQl6BtlgcwgAJkkzxQuUfSBN0C8HIs3b0LIbCkdAOcUt6AoUVFQML05I3oxmIZIaS6O79Jh4z9MOOGooMzVjVf-9oZEwEworbxpVfGPZFfe\"},\"old\":{\"device_token\":null}}', '2022-05-25 03:43:02', '2022-05-25 03:43:02'),
(948, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646241\",\"longitude\":\"67.0681895\"},\"old\":{\"latitude\":\"12.4250366\",\"longitude\":\"-1.6446492\"}}', '2022-05-25 03:43:05', '2022-05-25 03:43:05'),
(949, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646273\",\"longitude\":\"67.0681883\"},\"old\":{\"latitude\":\"24.8646241\",\"longitude\":\"67.0681895\"}}', '2022-05-25 03:43:14', '2022-05-25 03:43:14'),
(950, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646289\",\"longitude\":\"67.0681942\"},\"old\":{\"latitude\":\"24.8646273\",\"longitude\":\"67.0681883\"}}', '2022-05-25 03:43:27', '2022-05-25 03:43:27'),
(951, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646258\",\"longitude\":\"67.0681918\"},\"old\":{\"latitude\":\"24.8646289\",\"longitude\":\"67.0681942\"}}', '2022-05-25 03:43:35', '2022-05-25 03:43:35'),
(952, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646272\",\"longitude\":\"67.0681887\"},\"old\":{\"latitude\":\"24.8646258\",\"longitude\":\"67.0681918\"}}', '2022-05-25 03:43:45', '2022-05-25 03:43:45'),
(953, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646277\",\"longitude\":\"67.0681901\"},\"old\":{\"latitude\":\"24.8646272\",\"longitude\":\"67.0681887\"}}', '2022-05-25 03:43:58', '2022-05-25 03:43:58'),
(954, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646266\",\"longitude\":\"67.0681894\"},\"old\":{\"latitude\":\"24.8646277\",\"longitude\":\"67.0681901\"}}', '2022-05-25 03:44:05', '2022-05-25 03:44:05'),
(955, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646286\",\"longitude\":\"67.0681878\"},\"old\":{\"latitude\":\"24.8646266\",\"longitude\":\"67.0681894\"}}', '2022-05-25 03:44:16', '2022-05-25 03:44:16'),
(956, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.864626\",\"longitude\":\"67.06819\"},\"old\":{\"latitude\":\"24.8646286\",\"longitude\":\"67.0681878\"}}', '2022-05-25 03:44:31', '2022-05-25 03:44:31'),
(957, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646257\",\"longitude\":\"67.0681901\"},\"old\":{\"latitude\":\"24.864626\",\"longitude\":\"67.06819\"}}', '2022-05-25 03:44:42', '2022-05-25 03:44:42'),
(958, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646277\",\"longitude\":\"67.0681923\"},\"old\":{\"latitude\":\"24.8646257\",\"longitude\":\"67.0681901\"}}', '2022-05-25 03:44:47', '2022-05-25 03:44:47'),
(959, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646263\",\"longitude\":\"67.068191\"},\"old\":{\"latitude\":\"24.8646277\",\"longitude\":\"67.0681923\"}}', '2022-05-25 03:44:58', '2022-05-25 03:44:58'),
(960, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.864627\",\"longitude\":\"67.0681898\"},\"old\":{\"latitude\":\"24.8646263\",\"longitude\":\"67.068191\"}}', '2022-05-25 03:45:24', '2022-05-25 03:45:24'),
(961, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646279\",\"longitude\":\"67.06819\"},\"old\":{\"latitude\":\"24.864627\",\"longitude\":\"67.0681898\"}}', '2022-05-25 03:45:28', '2022-05-25 03:45:28'),
(962, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.864627\",\"longitude\":\"67.0681898\"},\"old\":{\"latitude\":\"24.8646279\",\"longitude\":\"67.06819\"}}', '2022-05-25 03:45:39', '2022-05-25 03:45:39'),
(963, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646251\",\"longitude\":\"67.0681955\"},\"old\":{\"latitude\":\"24.864627\",\"longitude\":\"67.0681898\"}}', '2022-05-25 03:45:49', '2022-05-25 03:45:49'),
(964, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"latitude\":\"24.8646265\",\"longitude\":\"67.0681942\"},\"old\":{\"latitude\":\"24.8646251\",\"longitude\":\"67.0681955\"}}', '2022-05-25 03:50:53', '2022-05-25 03:50:53'),
(965, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"e31LmeboSgG3XBfxCtvTjT:APA91bFUhVmaU30nNA9cqnWUipLU6nR3iNQl6BtlgcwgAJkkzxQuUfSBN0C8HIs3b0LIbCkdAOcUt6AoUVFQML05I3oxmIZIaS6O79Jh4z9MOOGooMzVjVf-9oZEwEworbxpVfGPZFfe\"}}', '2022-05-25 03:51:01', '2022-05-25 03:51:01'),
(966, 'Order', 'created', 'App\\Order', 85, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"59\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"20\",\"distance\":null,\"note\":null}}', '2022-05-25 03:52:43', '2022-05-25 03:52:43'),
(967, 'Order', 'updated', 'App\\Order', 85, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"35\",\"grand_total\":\"55\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-25 03:52:43', '2022-05-25 03:52:43'),
(968, 'Order', 'updated', 'App\\Order', 85, 'App\\User', 59, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-25 04:00:07', '2022-05-25 04:00:07'),
(969, 'User', 'updated', 'App\\User', 109, 'App\\User', 109, '{\"attributes\":{\"device_token\":\"eEX3Rwz05kRCov9F3daL84:APA91bGKDilhtiHTZiIdEavWig7Vm_id0HB-MJfnE-n1UxfNCnuYcgjkF2NvDBEysuvUp2WdybJX4h1coMEDWKqhUFxa_yoaCYLePxnE0P0XMJ7UQVWdjneDF-rP8iViI3IuXzqZr2uH\"},\"old\":{\"device_token\":\"cFX-6cSCw0EatGAO8wiS1p:APA91bGkQUsDqdFypcvYFTjtFV-aode_Z7HcQ7HjXLWNVUy3cI6cs4jwk-eUn3BGM3a7MhMSgNFaQgV4haxCljwHnODWbHBa9pgRwPU9UOKQOxe3kTDo8r10TCC1cSMd2MU9UZ0plBB9\"}}', '2022-05-25 04:18:58', '2022-05-25 04:18:58'),
(970, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"coWzL7GE0U78j5HM5KG4d0:APA91bHFs3T83G7T-A-l9P9npc2lZaeh-BdWqNne5vi3PYGAsrDOxZcscOm30Hli5ljNThP2is6whdwWMvDKvIXR59Sgu0bR5rNEd5nXUvXoQUU8uJSKBYAec-niCerUbu-ebvwyJAKf\"},\"old\":{\"device_token\":null}}', '2022-05-25 04:23:12', '2022-05-25 04:23:12'),
(971, 'Order', 'created', 'App\\Order', 86, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-25 04:24:47', '2022-05-25 04:24:47'),
(972, 'Order', 'updated', 'App\\Order', 86, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"72\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-25 04:24:47', '2022-05-25 04:24:47'),
(973, 'Order', 'updated', 'App\\Order', 86, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-25 04:26:03', '2022-05-25 04:26:03'),
(974, 'Order', 'updated', 'App\\Order', 86, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-25 04:26:14', '2022-05-25 04:26:14'),
(975, 'Order', 'updated', 'App\\Order', 86, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-25 04:26:16', '2022-05-25 04:26:16'),
(976, 'Order', 'created', 'App\\Order', 87, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-25 04:40:36', '2022-05-25 04:40:36'),
(977, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"1100\",\"grand_total\":\"1122\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-25 04:40:36', '2022-05-25 04:40:36'),
(978, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-25 04:40:46', '2022-05-25 04:40:46'),
(979, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-25 04:41:11', '2022-05-25 04:41:11'),
(980, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-25 04:41:14', '2022-05-25 04:41:14'),
(981, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"0\"},\"old\":{\"onlineStatus\":\"1\"}}', '2022-05-25 05:02:21', '2022-05-25 05:02:21'),
(982, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"1\"},\"old\":{\"onlineStatus\":\"0\"}}', '2022-05-25 05:02:23', '2022-05-25 05:02:23'),
(983, 'Order', 'created', 'App\\Order', 88, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-25 05:11:27', '2022-05-25 05:11:27'),
(984, 'Order', 'updated', 'App\\Order', 88, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"2450\",\"grand_total\":\"2472\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-25 05:11:27', '2022-05-25 05:11:27'),
(985, 'Order', 'updated', 'App\\Order', 88, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-25 05:11:43', '2022-05-25 05:11:43'),
(986, 'Order', 'updated', 'App\\Order', 88, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-25 05:11:46', '2022-05-25 05:11:46'),
(987, 'Order', 'updated', 'App\\Order', 88, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-25 05:11:48', '2022-05-25 05:11:48'),
(988, 'User', 'updated', 'App\\User', 91, 'App\\User', 91, '{\"attributes\":{\"device_token\":\"fYjYCDTne0aojw9vX5IOpK:APA91bHybdRAGcBpmzQxKz_y8su_D0QZ1ONXEvjDTSs6vOijSDMhib3QX9OIYaoY4qIUENqdWr6-f8KLgcnxmxWK9YTEYwNLahaUZZogLGh_rOT6R2mAC0P8ObpmoSOjoUPXvssdEz6f\"},\"old\":{\"device_token\":\"coWzL7GE0U78j5HM5KG4d0:APA91bHFs3T83G7T-A-l9P9npc2lZaeh-BdWqNne5vi3PYGAsrDOxZcscOm30Hli5ljNThP2is6whdwWMvDKvIXR59Sgu0bR5rNEd5nXUvXoQUU8uJSKBYAec-niCerUbu-ebvwyJAKf\"}}', '2022-05-25 05:15:29', '2022-05-25 05:15:29'),
(989, 'Order', 'created', 'App\\Order', 89, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-05-25 06:44:57', '2022-05-25 06:44:57'),
(990, 'Order', 'updated', 'App\\Order', 89, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"72\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-05-25 06:44:57', '2022-05-25 06:44:57'),
(991, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"0\"},\"old\":{\"onlineStatus\":\"1\"}}', '2022-05-25 07:09:32', '2022-05-25 07:09:32'),
(992, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"onlineStatus\":\"1\"},\"old\":{\"onlineStatus\":\"0\"}}', '2022-05-25 18:17:20', '2022-05-25 18:17:20'),
(993, 'Order', 'updated', 'App\\Order', 89, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-05-25 18:17:29', '2022-05-25 18:17:29'),
(994, 'Order', 'updated', 'App\\Order', 89, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-05-25 18:17:37', '2022-05-25 18:17:37'),
(995, 'Order', 'updated', 'App\\Order', 89, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-05-25 18:17:40', '2022-05-25 18:17:40'),
(996, 'Order', 'updated', 'App\\Order', 73, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"dispatch\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-06-01 17:03:20', '2022-06-01 17:03:20'),
(997, 'Order', 'created', 'App\\Order', 90, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-06-01 19:21:21', '2022-06-01 19:21:21'),
(998, 'Order', 'updated', 'App\\Order', 90, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"72\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-01 19:21:21', '2022-06-01 19:21:21'),
(999, 'Order', 'created', 'App\\Order', 91, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"card\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-06-01 19:41:58', '2022-06-01 19:41:58'),
(1000, 'Order', 'updated', 'App\\Order', 91, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"72\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-01 19:41:58', '2022-06-01 19:41:58'),
(1001, 'Order', 'updated', 'App\\Order', 91, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-01 19:42:34', '2022-06-01 19:42:34'),
(1002, 'Order', 'updated', 'App\\Order', 91, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-01 19:42:50', '2022-06-01 19:42:50'),
(1003, 'Order', 'updated', 'App\\Order', 91, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-06-01 19:42:55', '2022-06-01 19:42:55'),
(1004, 'User', 'updated', 'App\\User', 103, NULL, NULL, '{\"attributes\":{\"otp\":\"3015\"},\"old\":{\"otp\":\"6800\"}}', '2022-06-02 13:00:01', '2022-06-02 13:00:01'),
(1005, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219241\",\"longitude\":\"-122.0841481\"},\"old\":{\"latitude\":\"24.904854\",\"longitude\":\"67.0780517\"}}', '2022-06-02 18:08:29', '2022-06-02 18:08:29'),
(1006, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"},\"old\":{\"device_token\":null}}', '2022-06-02 18:08:30', '2022-06-02 18:08:30'),
(1007, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"},\"old\":{\"latitude\":\"37.4219241\",\"longitude\":\"-122.0841481\"}}', '2022-06-02 18:08:39', '2022-06-02 18:08:39'),
(1008, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219978\",\"longitude\":\"-122.084001\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.084\"}}', '2022-06-02 18:08:48', '2022-06-02 18:08:48'),
(1009, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219948\",\"longitude\":\"-122.0840069\"},\"old\":{\"latitude\":\"37.4219978\",\"longitude\":\"-122.084001\"}}', '2022-06-02 18:08:58', '2022-06-02 18:08:58'),
(1010, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219868\",\"longitude\":\"-122.0840227\"},\"old\":{\"latitude\":\"37.4219948\",\"longitude\":\"-122.0840069\"}}', '2022-06-02 18:09:09', '2022-06-02 18:09:09'),
(1011, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219732\",\"longitude\":\"-122.0840499\"},\"old\":{\"latitude\":\"37.4219868\",\"longitude\":\"-122.0840227\"}}', '2022-06-02 18:09:19', '2022-06-02 18:09:19'),
(1012, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219561\",\"longitude\":\"-122.0840838\"},\"old\":{\"latitude\":\"37.4219732\",\"longitude\":\"-122.0840499\"}}', '2022-06-02 18:09:29', '2022-06-02 18:09:29'),
(1013, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219398\",\"longitude\":\"-122.0841165\"},\"old\":{\"latitude\":\"37.4219561\",\"longitude\":\"-122.0840838\"}}', '2022-06-02 18:09:39', '2022-06-02 18:09:39'),
(1014, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219268\",\"longitude\":\"-122.0841424\"},\"old\":{\"latitude\":\"37.4219398\",\"longitude\":\"-122.0841165\"}}', '2022-06-02 18:09:49', '2022-06-02 18:09:49'),
(1015, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219178\",\"longitude\":\"-122.0841605\"},\"old\":{\"latitude\":\"37.4219268\",\"longitude\":\"-122.0841424\"}}', '2022-06-02 18:09:59', '2022-06-02 18:09:59'),
(1016, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219122\",\"longitude\":\"-122.0841717\"},\"old\":{\"latitude\":\"37.4219178\",\"longitude\":\"-122.0841605\"}}', '2022-06-02 18:10:09', '2022-06-02 18:10:09'),
(1017, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219093\",\"longitude\":\"-122.0841775\"},\"old\":{\"latitude\":\"37.4219122\",\"longitude\":\"-122.0841717\"}}', '2022-06-02 18:10:19', '2022-06-02 18:10:19'),
(1018, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219084\",\"longitude\":\"-122.0841795\"},\"old\":{\"latitude\":\"37.4219093\",\"longitude\":\"-122.0841775\"}}', '2022-06-02 18:10:29', '2022-06-02 18:10:29'),
(1019, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219088\",\"longitude\":\"-122.0841787\"},\"old\":{\"latitude\":\"37.4219084\",\"longitude\":\"-122.0841795\"}}', '2022-06-02 18:10:39', '2022-06-02 18:10:39'),
(1020, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.42191\",\"longitude\":\"-122.0841762\"},\"old\":{\"latitude\":\"37.4219088\",\"longitude\":\"-122.0841787\"}}', '2022-06-02 18:10:49', '2022-06-02 18:10:49'),
(1021, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219118\",\"longitude\":\"-122.0841726\"},\"old\":{\"latitude\":\"37.42191\",\"longitude\":\"-122.0841762\"}}', '2022-06-02 18:10:59', '2022-06-02 18:10:59'),
(1022, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219139\",\"longitude\":\"-122.0841686\"},\"old\":{\"latitude\":\"37.4219118\",\"longitude\":\"-122.0841726\"}}', '2022-06-02 18:11:09', '2022-06-02 18:11:09'),
(1023, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219159\",\"longitude\":\"-122.0841645\"},\"old\":{\"latitude\":\"37.4219139\",\"longitude\":\"-122.0841686\"}}', '2022-06-02 18:11:19', '2022-06-02 18:11:19'),
(1024, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219178\",\"longitude\":\"-122.0841606\"},\"old\":{\"latitude\":\"37.4219159\",\"longitude\":\"-122.0841645\"}}', '2022-06-02 18:11:29', '2022-06-02 18:11:29'),
(1025, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219195\",\"longitude\":\"-122.0841572\"},\"old\":{\"latitude\":\"37.4219178\",\"longitude\":\"-122.0841606\"}}', '2022-06-02 18:11:39', '2022-06-02 18:11:39'),
(1026, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.421921\",\"longitude\":\"-122.0841543\"},\"old\":{\"latitude\":\"37.4219195\",\"longitude\":\"-122.0841572\"}}', '2022-06-02 18:11:49', '2022-06-02 18:11:49'),
(1027, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219222\",\"longitude\":\"-122.084152\"},\"old\":{\"latitude\":\"37.421921\",\"longitude\":\"-122.0841543\"}}', '2022-06-02 18:11:59', '2022-06-02 18:11:59'),
(1028, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219231\",\"longitude\":\"-122.0841502\"},\"old\":{\"latitude\":\"37.4219222\",\"longitude\":\"-122.084152\"}}', '2022-06-02 18:12:09', '2022-06-02 18:12:09'),
(1029, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219237\",\"longitude\":\"-122.0841488\"},\"old\":{\"latitude\":\"37.4219231\",\"longitude\":\"-122.0841502\"}}', '2022-06-02 18:12:19', '2022-06-02 18:12:19'),
(1030, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219242\",\"longitude\":\"-122.0841479\"},\"old\":{\"latitude\":\"37.4219237\",\"longitude\":\"-122.0841488\"}}', '2022-06-02 18:12:29', '2022-06-02 18:12:29'),
(1031, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219245\",\"longitude\":\"-122.0841473\"},\"old\":{\"latitude\":\"37.4219242\",\"longitude\":\"-122.0841479\"}}', '2022-06-02 18:12:40', '2022-06-02 18:12:40'),
(1032, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219247\",\"longitude\":\"-122.0841469\"},\"old\":{\"latitude\":\"37.4219245\",\"longitude\":\"-122.0841473\"}}', '2022-06-02 18:12:50', '2022-06-02 18:12:50'),
(1033, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219248\",\"longitude\":\"-122.0841468\"},\"old\":{\"latitude\":\"37.4219247\",\"longitude\":\"-122.0841469\"}}', '2022-06-02 18:13:00', '2022-06-02 18:13:00'),
(1034, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219247\"},\"old\":{\"latitude\":\"37.4219248\"}}', '2022-06-02 18:13:20', '2022-06-02 18:13:20'),
(1035, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.084147\"},\"old\":{\"longitude\":\"-122.0841468\"}}', '2022-06-02 18:13:30', '2022-06-02 18:13:30'),
(1036, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219246\",\"longitude\":\"-122.0841471\"},\"old\":{\"latitude\":\"37.4219247\",\"longitude\":\"-122.084147\"}}', '2022-06-02 18:13:40', '2022-06-02 18:13:40'),
(1037, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219245\",\"longitude\":\"-122.0841473\"},\"old\":{\"latitude\":\"37.4219246\",\"longitude\":\"-122.0841471\"}}', '2022-06-02 18:13:50', '2022-06-02 18:13:50'),
(1038, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219244\",\"longitude\":\"-122.0841475\"},\"old\":{\"latitude\":\"37.4219245\",\"longitude\":\"-122.0841473\"}}', '2022-06-02 18:14:00', '2022-06-02 18:14:00'),
(1039, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219243\",\"longitude\":\"-122.0841477\"},\"old\":{\"latitude\":\"37.4219244\",\"longitude\":\"-122.0841475\"}}', '2022-06-02 18:14:10', '2022-06-02 18:14:10'),
(1040, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0841478\"},\"old\":{\"longitude\":\"-122.0841477\"}}', '2022-06-02 18:14:20', '2022-06-02 18:14:20'),
(1041, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219242\",\"longitude\":\"-122.0841479\"},\"old\":{\"latitude\":\"37.4219243\",\"longitude\":\"-122.0841478\"}}', '2022-06-02 18:14:30', '2022-06-02 18:14:30'),
(1042, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.084148\"},\"old\":{\"longitude\":\"-122.0841479\"}}', '2022-06-02 18:14:40', '2022-06-02 18:14:40'),
(1043, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219241\"},\"old\":{\"latitude\":\"37.4219242\"}}', '2022-06-02 18:14:50', '2022-06-02 18:14:50'),
(1044, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0841481\"},\"old\":{\"longitude\":\"-122.084148\"}}', '2022-06-02 18:15:00', '2022-06-02 18:15:00'),
(1045, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0841482\"},\"old\":{\"longitude\":\"-122.0841481\"}}', '2022-06-02 18:15:30', '2022-06-02 18:15:30'),
(1046, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"-122.0841481\"},\"old\":{\"longitude\":\"-122.0841482\"}}', '2022-06-02 18:16:11', '2022-06-02 18:16:11'),
(1047, 'Order', 'updated', 'App\\Order', 91, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-06-02 18:17:53', '2022-06-02 18:17:53'),
(1048, 'Order', 'updated', 'App\\Order', 89, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-06-02 18:17:58', '2022-06-02 18:17:58'),
(1049, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0840001\"},\"old\":{\"latitude\":\"37.4219241\",\"longitude\":\"-122.0841481\"}}', '2022-06-02 18:18:01', '2022-06-02 18:18:01'),
(1050, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":[],\"old\":[]}', '2022-06-03 15:09:27', '2022-06-03 15:09:27'),
(1051, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":[],\"old\":[]}', '2022-06-03 15:52:12', '2022-06-03 15:52:12'),
(1052, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":[],\"old\":[]}', '2022-06-03 15:52:40', '2022-06-03 15:52:40'),
(1053, 'Order', 'updated', 'App\\Order', 90, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-06-03 15:53:04', '2022-06-03 15:53:04'),
(1054, 'Order', 'created', 'App\\Order', 92, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-06-03 16:31:05', '2022-06-03 16:31:05'),
(1055, 'Order', 'updated', 'App\\Order', 92, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"72\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-03 16:31:05', '2022-06-03 16:31:05'),
(1056, 'Order', 'updated', 'App\\Order', 92, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-03 16:31:46', '2022-06-03 16:31:46'),
(1057, 'Order', 'updated', 'App\\Order', 92, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-03 16:35:18', '2022-06-03 16:35:18'),
(1058, 'Item', 'created', 'App\\Item', 49, 'App\\User', 58, '{\"attributes\":{\"name\":\"Coke\",\"restaurant_id\":\"58\",\"category_id\":\"13\",\"rider_id\":null,\"grocery_id\":null,\"shopper_id\":null,\"price\":\"120\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/629a013128f26.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":\"1.5 Ltr\"}}', '2022-06-03 16:40:17', '2022-06-03 16:40:17'),
(1059, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"},\"old\":{\"device_token\":\"dMxGxwXzRDmMDydQtd0nl8:APA91bGIqdK7lm7Hqg67wRhO0EO0FTXYSDaQZIJGC1o48F1Oxn9-O8v0YitCqeczA5qLdZ7xwadcX6iVvxu125UFb2A9qaE5K4ah3IqkELn8mR_4n65LdKkik6h2HPWS76UU58QnH9JS\"}}', '2022-06-06 15:30:39', '2022-06-06 15:30:39'),
(1060, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4219983\",\"longitude\":\"-122.0840001\"}}', '2022-06-06 15:30:42', '2022-06-06 15:30:42'),
(1061, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-06 15:30:52', '2022-06-06 15:30:52'),
(1062, 'Order', 'updated', 'App\\Order', 88, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-06-06 15:33:39', '2022-06-06 15:33:39'),
(1063, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-06 15:35:39', '2022-06-06 15:35:39'),
(1064, 'Item', 'created', 'App\\Item', 50, 'App\\User', 59, '{\"attributes\":{\"name\":\"Nuggets\",\"restaurant_id\":null,\"category_id\":\"27\",\"rider_id\":null,\"grocery_id\":\"59\",\"shopper_id\":null,\"price\":\"375\",\"ingredients\":null,\"image\":\"public\\/uploads\\/items\\/img\\/629de95b809ca.png\",\"discount\":null,\"start_date\":null,\"end_date\":null,\"status\":\"1\",\"description\":null}}', '2022-06-06 15:47:39', '2022-06-06 15:47:39'),
(1065, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 13:21:16', '2022-06-07 13:21:16'),
(1066, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 13:21:16', '2022-06-07 13:21:16'),
(1067, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-06-07 13:22:03', '2022-06-07 13:22:03'),
(1068, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 13:26:57', '2022-06-07 13:26:57'),
(1069, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 13:33:51', '2022-06-07 13:33:51'),
(1070, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 13:33:51', '2022-06-07 13:33:51'),
(1071, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-06-07 13:40:06', '2022-06-07 13:40:06'),
(1072, 'Order', 'updated', 'App\\Order', 87, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-06-07 13:40:09', '2022-06-07 13:40:09'),
(1073, 'Order', 'updated', 'App\\Order', 86, 'App\\User', 112, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":\"112\"}}', '2022-06-07 13:41:07', '2022-06-07 13:41:07'),
(1074, 'Order', 'created', 'App\\Order', 93, 'App\\User', 73, '{\"attributes\":{\"customer_id\":\"73\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"11\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"22\",\"distance\":null,\"note\":null}}', '2022-06-07 13:42:57', '2022-06-07 13:42:57'),
(1075, 'Order', 'updated', 'App\\Order', 93, 'App\\User', 73, '{\"attributes\":{\"sub_total\":\"390\",\"grand_total\":\"412\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 13:42:57', '2022-06-07 13:42:57'),
(1076, 'Order', 'updated', 'App\\Order', 93, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"54\"},\"old\":{\"rider_id\":null}}', '2022-06-07 13:44:04', '2022-06-07 13:44:04'),
(1077, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 13:45:09', '2022-06-07 13:45:09');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(1078, 'Address', 'created', 'App\\Address', 22, 'App\\User', 58, '{\"attributes\":{\"user_id\":\"58\",\"address\":\"Noor Trade Centre, Main University Road, adjacent Usmania Restaurant, Block 13 A Gulshan-e-Iqbal, Karachi, Pakistan\",\"latitude\":\"24.904725267679\",\"longitude\":\"67.078092880547\",\"address_name\":\"Work\"}}', '2022-06-07 13:46:38', '2022-06-07 13:46:38'),
(1079, 'Order', 'created', 'App\\Order', 94, 'App\\User', 58, '{\"attributes\":{\"customer_id\":\"58\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"22\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"4\",\"distance\":null,\"note\":null}}', '2022-06-07 13:46:55', '2022-06-07 13:46:55'),
(1080, 'Order', 'updated', 'App\\Order', 94, 'App\\User', 58, '{\"attributes\":{\"sub_total\":\"270\",\"grand_total\":\"274\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 13:46:55', '2022-06-07 13:46:55'),
(1081, 'User', 'updated', 'App\\User', 58, 'App\\User', 58, '{\"attributes\":{\"name\":\"Waqas Khan\",\"phone\":\"3121234567\",\"country_code\":\"92\"},\"old\":{\"name\":\"Fast Food Restaurant\",\"phone\":\"25345345\",\"country_code\":null}}', '2022-06-07 14:32:36', '2022-06-07 14:32:36'),
(1082, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"daugLoYMQY-m4BQG4KNvSE:APA91bHZ0GwkH835orEfJMGlf6U2JOvWWiRPr7PILFhPNanWGYBFFVnSRWhJS8NTcW0Jp46ByrzMQ-m6xiS8_HwgR2XjKscr4GXeI_UkSbQVsYs8BrsClkYQJPeUqJeiV87YOj4Iq7JN\"},\"old\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"}}', '2022-06-07 14:42:50', '2022-06-07 14:42:50'),
(1083, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048551\",\"longitude\":\"67.0781345\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 14:42:53', '2022-06-07 14:42:53'),
(1084, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048661\",\"longitude\":\"67.0781329\"},\"old\":{\"latitude\":\"24.9048551\",\"longitude\":\"67.0781345\"}}', '2022-06-07 14:43:02', '2022-06-07 14:43:02'),
(1085, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9049515\",\"longitude\":\"67.0784091\"},\"old\":{\"latitude\":\"24.9048661\",\"longitude\":\"67.0781329\"}}', '2022-06-07 14:43:11', '2022-06-07 14:43:11'),
(1086, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048717\",\"longitude\":\"67.0781215\"},\"old\":{\"latitude\":\"24.9049515\",\"longitude\":\"67.0784091\"}}', '2022-06-07 14:43:23', '2022-06-07 14:43:23'),
(1087, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048714\",\"longitude\":\"67.0781142\"},\"old\":{\"latitude\":\"24.9048717\",\"longitude\":\"67.0781215\"}}', '2022-06-07 14:43:33', '2022-06-07 14:43:33'),
(1088, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048638\",\"longitude\":\"67.0781456\"},\"old\":{\"latitude\":\"24.9048714\",\"longitude\":\"67.0781142\"}}', '2022-06-07 14:43:43', '2022-06-07 14:43:43'),
(1089, 'Order', 'updated', 'App\\Order', 94, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-07 14:43:45', '2022-06-07 14:43:45'),
(1090, 'Order', 'updated', 'App\\Order', 94, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-07 14:43:49', '2022-06-07 14:43:49'),
(1091, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048858\",\"longitude\":\"67.0781071\"},\"old\":{\"latitude\":\"24.9048638\",\"longitude\":\"67.0781456\"}}', '2022-06-07 14:43:54', '2022-06-07 14:43:54'),
(1092, 'Order', 'updated', 'App\\Order', 94, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-06-07 14:43:54', '2022-06-07 14:43:54'),
(1093, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048827\",\"longitude\":\"67.0781136\"},\"old\":{\"latitude\":\"24.9048858\",\"longitude\":\"67.0781071\"}}', '2022-06-07 14:44:04', '2022-06-07 14:44:04'),
(1094, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048579\",\"longitude\":\"67.0781539\"},\"old\":{\"latitude\":\"24.9048827\",\"longitude\":\"67.0781136\"}}', '2022-06-07 14:44:24', '2022-06-07 14:44:24'),
(1095, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048573\",\"longitude\":\"67.0781459\"},\"old\":{\"latitude\":\"24.9048579\",\"longitude\":\"67.0781539\"}}', '2022-06-07 14:44:35', '2022-06-07 14:44:35'),
(1096, 'Order', 'updated', 'App\\Order', 94, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-06-07 14:44:36', '2022-06-07 14:44:36'),
(1097, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.0781506\"},\"old\":{\"latitude\":\"24.9048573\",\"longitude\":\"67.0781459\"}}', '2022-06-07 14:44:45', '2022-06-07 14:44:45'),
(1098, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9046935\",\"longitude\":\"67.0777367\"},\"old\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.0781506\"}}', '2022-06-07 14:44:53', '2022-06-07 14:44:53'),
(1099, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048561\",\"longitude\":\"67.0781401\"},\"old\":{\"latitude\":\"24.9046935\",\"longitude\":\"67.0777367\"}}', '2022-06-07 14:45:05', '2022-06-07 14:45:05'),
(1100, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048616\",\"longitude\":\"67.0781473\"},\"old\":{\"latitude\":\"24.9048561\",\"longitude\":\"67.0781401\"}}', '2022-06-07 14:45:16', '2022-06-07 14:45:16'),
(1101, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048645\",\"longitude\":\"67.0781442\"},\"old\":{\"latitude\":\"24.9048616\",\"longitude\":\"67.0781473\"}}', '2022-06-07 14:45:26', '2022-06-07 14:45:26'),
(1102, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048593\",\"longitude\":\"67.0781482\"},\"old\":{\"latitude\":\"24.9048645\",\"longitude\":\"67.0781442\"}}', '2022-06-07 14:45:36', '2022-06-07 14:45:36'),
(1103, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048608\",\"longitude\":\"67.0781424\"},\"old\":{\"latitude\":\"24.9048593\",\"longitude\":\"67.0781482\"}}', '2022-06-07 14:45:46', '2022-06-07 14:45:46'),
(1104, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048872\",\"longitude\":\"67.0781081\"},\"old\":{\"latitude\":\"24.9048608\",\"longitude\":\"67.0781424\"}}', '2022-06-07 14:45:57', '2022-06-07 14:45:57'),
(1105, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048624\",\"longitude\":\"67.0781444\"},\"old\":{\"latitude\":\"24.9048872\",\"longitude\":\"67.0781081\"}}', '2022-06-07 14:46:07', '2022-06-07 14:46:07'),
(1106, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048564\",\"longitude\":\"67.0781335\"},\"old\":{\"latitude\":\"24.9048624\",\"longitude\":\"67.0781444\"}}', '2022-06-07 14:46:18', '2022-06-07 14:46:18'),
(1107, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048708\",\"longitude\":\"67.078143\"},\"old\":{\"latitude\":\"24.9048564\",\"longitude\":\"67.0781335\"}}', '2022-06-07 14:47:00', '2022-06-07 14:47:00'),
(1108, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"daugLoYMQY-m4BQG4KNvSE:APA91bHZ0GwkH835orEfJMGlf6U2JOvWWiRPr7PILFhPNanWGYBFFVnSRWhJS8NTcW0Jp46ByrzMQ-m6xiS8_HwgR2XjKscr4GXeI_UkSbQVsYs8BrsClkYQJPeUqJeiV87YOj4Iq7JN\"}}', '2022-06-07 14:47:05', '2022-06-07 14:47:05'),
(1109, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"24.9048708\",\"longitude\":\"67.078143\"}}', '2022-06-07 14:49:00', '2022-06-07 14:49:00'),
(1110, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"},\"old\":{\"device_token\":null}}', '2022-06-07 14:49:00', '2022-06-07 14:49:00'),
(1111, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 14:49:13', '2022-06-07 14:49:13'),
(1112, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 14:53:54', '2022-06-07 14:53:54'),
(1113, 'Order', 'created', 'App\\Order', 95, 'App\\User', 58, '{\"attributes\":{\"customer_id\":\"58\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"22\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"4\",\"distance\":null,\"note\":null}}', '2022-06-07 14:58:42', '2022-06-07 14:58:42'),
(1114, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 58, '{\"attributes\":{\"sub_total\":\"100\",\"grand_total\":\"104\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 14:58:42', '2022-06-07 14:58:42'),
(1115, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-07 14:59:51', '2022-06-07 14:59:51'),
(1116, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-07 14:59:53', '2022-06-07 14:59:53'),
(1117, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-06-07 14:59:55', '2022-06-07 14:59:55'),
(1118, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-06-07 15:00:36', '2022-06-07 15:00:36'),
(1119, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 15:00:49', '2022-06-07 15:00:49'),
(1120, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 15:08:27', '2022-06-07 15:08:27'),
(1121, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-06-07 15:19:22', '2022-06-07 15:19:22'),
(1122, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"cS-t04peRvqlALqbLWiIca:APA91bFwVJfCAsp5pDFscZ3IJ4OcqR8xhPs3suqnJ3B8GtkYRBmTyqB_B2leQ2XJ59FtLIB_F7i-9dU0cDsyoI4m7Gqihsnsrr3VlVJdT7ZgM8WHKKn_ijs2XwxOdx4JiQKYh1NKBP3i\"},\"old\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"}}', '2022-06-07 15:34:18', '2022-06-07 15:34:18'),
(1123, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048744\",\"longitude\":\"67.0781361\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 15:34:22', '2022-06-07 15:34:22'),
(1124, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904347\",\"longitude\":\"67.0777926\"},\"old\":{\"latitude\":\"24.9048744\",\"longitude\":\"67.0781361\"}}', '2022-06-07 15:34:32', '2022-06-07 15:34:32'),
(1125, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048563\",\"longitude\":\"67.0781425\"},\"old\":{\"latitude\":\"24.904347\",\"longitude\":\"67.0777926\"}}', '2022-06-07 15:34:42', '2022-06-07 15:34:42'),
(1126, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048596\",\"longitude\":\"67.0781423\"},\"old\":{\"latitude\":\"24.9048563\",\"longitude\":\"67.0781425\"}}', '2022-06-07 15:34:53', '2022-06-07 15:34:53'),
(1127, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048661\",\"longitude\":\"67.0781355\"},\"old\":{\"latitude\":\"24.9048596\",\"longitude\":\"67.0781423\"}}', '2022-06-07 15:35:03', '2022-06-07 15:35:03'),
(1128, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048551\",\"longitude\":\"67.0781467\"},\"old\":{\"latitude\":\"24.9048661\",\"longitude\":\"67.0781355\"}}', '2022-06-07 15:35:13', '2022-06-07 15:35:13'),
(1129, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904852\",\"longitude\":\"67.0781468\"},\"old\":{\"latitude\":\"24.9048551\",\"longitude\":\"67.0781467\"}}', '2022-06-07 15:35:24', '2022-06-07 15:35:24'),
(1130, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048598\",\"longitude\":\"67.0781436\"},\"old\":{\"latitude\":\"24.904852\",\"longitude\":\"67.0781468\"}}', '2022-06-07 15:35:34', '2022-06-07 15:35:34'),
(1131, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048614\",\"longitude\":\"67.0781244\"},\"old\":{\"latitude\":\"24.9048598\",\"longitude\":\"67.0781436\"}}', '2022-06-07 15:35:44', '2022-06-07 15:35:44'),
(1132, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048713\",\"longitude\":\"67.0781141\"},\"old\":{\"latitude\":\"24.9048614\",\"longitude\":\"67.0781244\"}}', '2022-06-07 15:35:55', '2022-06-07 15:35:55'),
(1133, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048529\",\"longitude\":\"67.0781452\"},\"old\":{\"latitude\":\"24.9048713\",\"longitude\":\"67.0781141\"}}', '2022-06-07 15:36:05', '2022-06-07 15:36:05'),
(1134, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048475\",\"longitude\":\"67.0781484\"},\"old\":{\"latitude\":\"24.9048529\",\"longitude\":\"67.0781452\"}}', '2022-06-07 15:36:15', '2022-06-07 15:36:15'),
(1135, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048422\",\"longitude\":\"67.0781301\"},\"old\":{\"latitude\":\"24.9048475\",\"longitude\":\"67.0781484\"}}', '2022-06-07 15:36:25', '2022-06-07 15:36:25'),
(1136, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048584\",\"longitude\":\"67.0781454\"},\"old\":{\"latitude\":\"24.9048422\",\"longitude\":\"67.0781301\"}}', '2022-06-07 15:36:35', '2022-06-07 15:36:35'),
(1137, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048655\",\"longitude\":\"67.0781429\"},\"old\":{\"latitude\":\"24.9048584\",\"longitude\":\"67.0781454\"}}', '2022-06-07 15:36:46', '2022-06-07 15:36:46'),
(1138, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048459\",\"longitude\":\"67.0781553\"},\"old\":{\"latitude\":\"24.9048655\",\"longitude\":\"67.0781429\"}}', '2022-06-07 15:36:56', '2022-06-07 15:36:56'),
(1139, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.078138\"},\"old\":{\"latitude\":\"24.9048459\",\"longitude\":\"67.0781553\"}}', '2022-06-07 15:37:08', '2022-06-07 15:37:08'),
(1140, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904843\",\"longitude\":\"67.0781056\"},\"old\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.078138\"}}', '2022-06-07 15:37:27', '2022-06-07 15:37:27'),
(1141, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048404\",\"longitude\":\"67.078123\"},\"old\":{\"latitude\":\"24.904843\",\"longitude\":\"67.0781056\"}}', '2022-06-07 15:37:37', '2022-06-07 15:37:37'),
(1142, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048567\",\"longitude\":\"67.0781479\"},\"old\":{\"latitude\":\"24.9048404\",\"longitude\":\"67.078123\"}}', '2022-06-07 15:37:48', '2022-06-07 15:37:48'),
(1143, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"longitude\":\"67.0781445\"},\"old\":{\"longitude\":\"67.0781479\"}}', '2022-06-07 15:38:08', '2022-06-07 15:38:08'),
(1144, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9046856\",\"longitude\":\"67.0776709\"},\"old\":{\"latitude\":\"24.9048567\",\"longitude\":\"67.0781445\"}}', '2022-06-07 15:38:20', '2022-06-07 15:38:20'),
(1145, 'User', 'updated', 'App\\User', 103, NULL, NULL, '{\"attributes\":{\"otp\":\"1639\"},\"old\":{\"otp\":\"3015\"}}', '2022-06-07 15:46:46', '2022-06-07 15:46:46'),
(1146, 'Order', 'created', 'App\\Order', 96, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"40\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"10\",\"distance\":null,\"note\":null}}', '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(1147, 'Order', 'updated', 'App\\Order', 96, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"1150\",\"grand_total\":\"1160\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(1148, 'Order', 'created', 'App\\Order', 97, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"10\",\"distance\":null,\"note\":null}}', '2022-06-07 15:49:56', '2022-06-07 15:49:56'),
(1149, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"270\",\"grand_total\":\"280\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 15:49:56', '2022-06-07 15:49:56'),
(1150, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-07 15:50:31', '2022-06-07 15:50:31'),
(1151, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-07 15:50:44', '2022-06-07 15:50:44'),
(1152, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-06-07 15:50:51', '2022-06-07 15:50:51'),
(1153, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048597\",\"longitude\":\"67.0781451\"},\"old\":{\"latitude\":\"24.9046856\",\"longitude\":\"67.0776709\"}}', '2022-06-07 15:51:03', '2022-06-07 15:51:03'),
(1154, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-06-07 15:51:11', '2022-06-07 15:51:11'),
(1155, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048525\",\"longitude\":\"67.0781455\"},\"old\":{\"latitude\":\"24.9048597\",\"longitude\":\"67.0781451\"}}', '2022-06-07 15:51:23', '2022-06-07 15:51:23'),
(1156, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048278\",\"longitude\":\"67.0775212\"},\"old\":{\"latitude\":\"24.9048525\",\"longitude\":\"67.0781455\"}}', '2022-06-07 15:51:34', '2022-06-07 15:51:34'),
(1157, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048516\",\"longitude\":\"67.078135\"},\"old\":{\"latitude\":\"24.9048278\",\"longitude\":\"67.0775212\"}}', '2022-06-07 15:51:43', '2022-06-07 15:51:43'),
(1158, 'Order', 'updated', 'App\\Order', 97, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-06-07 15:51:50', '2022-06-07 15:51:50'),
(1159, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048546\",\"longitude\":\"67.078122\"},\"old\":{\"latitude\":\"24.9048516\",\"longitude\":\"67.078135\"}}', '2022-06-07 15:54:52', '2022-06-07 15:54:52'),
(1160, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048573\",\"longitude\":\"67.0781248\"},\"old\":{\"latitude\":\"24.9048546\",\"longitude\":\"67.078122\"}}', '2022-06-07 15:55:11', '2022-06-07 15:55:11'),
(1161, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048585\",\"longitude\":\"67.0781491\"},\"old\":{\"latitude\":\"24.9048573\",\"longitude\":\"67.0781248\"}}', '2022-06-07 15:55:32', '2022-06-07 15:55:32'),
(1162, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048601\",\"longitude\":\"67.078138\"},\"old\":{\"latitude\":\"24.9048585\",\"longitude\":\"67.0781491\"}}', '2022-06-07 15:55:52', '2022-06-07 15:55:52'),
(1163, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048589\",\"longitude\":\"67.0781469\"},\"old\":{\"latitude\":\"24.9048601\",\"longitude\":\"67.078138\"}}', '2022-06-07 15:56:12', '2022-06-07 15:56:12'),
(1164, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.90487\",\"longitude\":\"67.0781304\"},\"old\":{\"latitude\":\"24.9048589\",\"longitude\":\"67.0781469\"}}', '2022-06-07 15:56:31', '2022-06-07 15:56:31'),
(1165, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048453\",\"longitude\":\"67.0781187\"},\"old\":{\"latitude\":\"24.90487\",\"longitude\":\"67.0781304\"}}', '2022-06-07 15:56:52', '2022-06-07 15:56:52'),
(1166, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904861\",\"longitude\":\"67.0781565\"},\"old\":{\"latitude\":\"24.9048453\",\"longitude\":\"67.0781187\"}}', '2022-06-07 15:57:12', '2022-06-07 15:57:12'),
(1167, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048524\",\"longitude\":\"67.0781472\"},\"old\":{\"latitude\":\"24.904861\",\"longitude\":\"67.0781565\"}}', '2022-06-07 15:57:30', '2022-06-07 15:57:30'),
(1168, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048596\",\"longitude\":\"67.078151\"},\"old\":{\"latitude\":\"24.9048524\",\"longitude\":\"67.0781472\"}}', '2022-06-07 15:57:42', '2022-06-07 15:57:42'),
(1169, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048605\",\"longitude\":\"67.0781525\"},\"old\":{\"latitude\":\"24.9048596\",\"longitude\":\"67.078151\"}}', '2022-06-07 15:58:02', '2022-06-07 15:58:02'),
(1170, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904859\",\"longitude\":\"67.0781481\"},\"old\":{\"latitude\":\"24.9048605\",\"longitude\":\"67.0781525\"}}', '2022-06-07 15:58:22', '2022-06-07 15:58:22'),
(1171, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048549\",\"longitude\":\"67.0781464\"},\"old\":{\"latitude\":\"24.904859\",\"longitude\":\"67.0781481\"}}', '2022-06-07 15:58:42', '2022-06-07 15:58:42'),
(1172, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048586\",\"longitude\":\"67.0781459\"},\"old\":{\"latitude\":\"24.9048549\",\"longitude\":\"67.0781464\"}}', '2022-06-07 15:59:02', '2022-06-07 15:59:02'),
(1173, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048599\",\"longitude\":\"67.0781385\"},\"old\":{\"latitude\":\"24.9048586\",\"longitude\":\"67.0781459\"}}', '2022-06-07 15:59:22', '2022-06-07 15:59:22'),
(1174, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048595\",\"longitude\":\"67.0781442\"},\"old\":{\"latitude\":\"24.9048599\",\"longitude\":\"67.0781385\"}}', '2022-06-07 15:59:42', '2022-06-07 15:59:42'),
(1175, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048813\",\"longitude\":\"67.0781172\"},\"old\":{\"latitude\":\"24.9048595\",\"longitude\":\"67.0781442\"}}', '2022-06-07 16:00:02', '2022-06-07 16:00:02'),
(1176, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.0781454\"},\"old\":{\"latitude\":\"24.9048813\",\"longitude\":\"67.0781172\"}}', '2022-06-07 16:00:23', '2022-06-07 16:00:23'),
(1177, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048668\",\"longitude\":\"67.0781391\"},\"old\":{\"latitude\":\"24.9048539\",\"longitude\":\"67.0781454\"}}', '2022-06-07 16:00:42', '2022-06-07 16:00:42'),
(1178, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904857\",\"longitude\":\"67.0781484\"},\"old\":{\"latitude\":\"24.9048668\",\"longitude\":\"67.0781391\"}}', '2022-06-07 16:01:02', '2022-06-07 16:01:02'),
(1179, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048582\",\"longitude\":\"67.0781437\"},\"old\":{\"latitude\":\"24.904857\",\"longitude\":\"67.0781484\"}}', '2022-06-07 16:01:22', '2022-06-07 16:01:22'),
(1180, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048513\",\"longitude\":\"67.0781463\"},\"old\":{\"latitude\":\"24.9048582\",\"longitude\":\"67.0781437\"}}', '2022-06-07 16:01:43', '2022-06-07 16:01:43'),
(1181, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048671\",\"longitude\":\"67.0781309\"},\"old\":{\"latitude\":\"24.9048513\",\"longitude\":\"67.0781463\"}}', '2022-06-07 16:02:03', '2022-06-07 16:02:03'),
(1182, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.904858\",\"longitude\":\"67.0781455\"},\"old\":{\"latitude\":\"24.9048671\",\"longitude\":\"67.0781309\"}}', '2022-06-07 16:02:22', '2022-06-07 16:02:22'),
(1183, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"24.904858\",\"longitude\":\"67.0781455\"}}', '2022-06-07 16:07:51', '2022-06-07 16:07:51'),
(1184, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"},\"old\":{\"device_token\":\"cS-t04peRvqlALqbLWiIca:APA91bFwVJfCAsp5pDFscZ3IJ4OcqR8xhPs3suqnJ3B8GtkYRBmTyqB_B2leQ2XJ59FtLIB_F7i-9dU0cDsyoI4m7Gqihsnsrr3VlVJdT7ZgM8WHKKn_ijs2XwxOdx4JiQKYh1NKBP3i\"}}', '2022-06-07 16:07:51', '2022-06-07 16:07:51'),
(1185, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"cS-t04peRvqlALqbLWiIca:APA91bFwVJfCAsp5pDFscZ3IJ4OcqR8xhPs3suqnJ3B8GtkYRBmTyqB_B2leQ2XJ59FtLIB_F7i-9dU0cDsyoI4m7Gqihsnsrr3VlVJdT7ZgM8WHKKn_ijs2XwxOdx4JiQKYh1NKBP3i\"},\"old\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"}}', '2022-06-07 16:08:00', '2022-06-07 16:08:00'),
(1186, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"24.9048797\",\"longitude\":\"67.0781185\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 16:08:00', '2022-06-07 16:08:00'),
(1187, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":null},\"old\":{\"device_token\":\"cS-t04peRvqlALqbLWiIca:APA91bFwVJfCAsp5pDFscZ3IJ4OcqR8xhPs3suqnJ3B8GtkYRBmTyqB_B2leQ2XJ59FtLIB_F7i-9dU0cDsyoI4m7Gqihsnsrr3VlVJdT7ZgM8WHKKn_ijs2XwxOdx4JiQKYh1NKBP3i\"}}', '2022-06-07 16:08:07', '2022-06-07 16:08:07'),
(1188, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"24.9048797\",\"longitude\":\"67.0781185\"}}', '2022-06-07 16:08:10', '2022-06-07 16:08:10'),
(1189, 'Order', 'updated', 'App\\Order', 95, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"completed\"},\"old\":{\"order_status\":\"picked\"}}', '2022-06-07 16:08:29', '2022-06-07 16:08:29'),
(1190, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"device_token\":\"eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL\"},\"old\":{\"device_token\":null}}', '2022-06-07 16:08:31', '2022-06-07 16:08:31'),
(1191, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 16:14:35', '2022-06-07 16:14:35'),
(1192, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 16:16:56', '2022-06-07 16:16:56'),
(1193, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 16:20:59', '2022-06-07 16:20:59'),
(1194, 'Order', 'created', 'App\\Order', 98, 'App\\User', 104, '{\"attributes\":{\"customer_id\":\"104\",\"restaurant_id\":\"58\",\"rider_id\":null,\"shopper_id\":null,\"sub_total\":null,\"discount\":\"0\",\"vat\":\"5\",\"grand_total\":\"0\",\"order_status\":\"pending\",\"payment_method\":\"cash\",\"card_id\":null,\"address_id\":\"18\",\"payment_staus\":null,\"commission\":null,\"delivery_cost\":\"10\",\"distance\":null,\"note\":null}}', '2022-06-07 17:21:01', '2022-06-07 17:21:01'),
(1195, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 104, '{\"attributes\":{\"sub_total\":\"50\",\"grand_total\":\"60\"},\"old\":{\"sub_total\":null,\"grand_total\":0}}', '2022-06-07 17:21:01', '2022-06-07 17:21:01'),
(1196, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"preparing\"},\"old\":{\"order_status\":\"pending\"}}', '2022-06-07 17:21:56', '2022-06-07 17:21:56'),
(1197, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 58, '{\"attributes\":{\"order_status\":\"ready\"},\"old\":{\"order_status\":\"preparing\"}}', '2022-06-07 17:22:01', '2022-06-07 17:22:01'),
(1198, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 58, '{\"attributes\":{\"rider_id\":\"112\",\"order_status\":\"finding_rider\"},\"old\":{\"rider_id\":null,\"order_status\":\"ready\"}}', '2022-06-07 17:22:07', '2022-06-07 17:22:07'),
(1199, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"rider_accepted\"},\"old\":{\"order_status\":\"finding_rider\"}}', '2022-06-07 17:22:50', '2022-06-07 17:22:50'),
(1200, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 17:23:04', '2022-06-07 17:23:04'),
(1201, 'Order', 'updated', 'App\\Order', 98, 'App\\User', 112, '{\"attributes\":{\"order_status\":\"picked\"},\"old\":{\"order_status\":\"rider_accepted\"}}', '2022-06-07 17:28:58', '2022-06-07 17:28:58'),
(1202, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 17:31:31', '2022-06-07 17:31:31'),
(1203, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 17:43:38', '2022-06-07 17:43:38'),
(1204, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 17:47:33', '2022-06-07 17:47:33'),
(1205, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 17:53:40', '2022-06-07 17:53:40'),
(1206, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 17:56:45', '2022-06-07 17:56:45'),
(1207, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 18:30:22', '2022-06-07 18:30:22'),
(1208, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 18:51:09', '2022-06-07 18:51:09'),
(1209, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"},\"old\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"}}', '2022-06-07 19:02:55', '2022-06-07 19:02:55'),
(1210, 'User', 'updated', 'App\\User', 112, 'App\\User', 112, '{\"attributes\":{\"latitude\":\"37.4220005\",\"longitude\":\"-122.0839996\"},\"old\":{\"latitude\":\"37.4362683\",\"longitude\":\"-122.1224333\"}}', '2022-06-07 19:22:44', '2022-06-07 19:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `phone` int(50) DEFAULT NULL,
  `phone2` int(50) DEFAULT NULL,
  `address_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `email`, `type`, `phone`, `phone2`, `address_name`, `created_at`, `updated_at`, `latitude`, `longitude`, `address`) VALUES
(7, 29, NULL, NULL, NULL, NULL, 'Work', '2022-04-22 05:47:53', '2022-04-22 05:47:53', '24.884081331533', '67.057771123946', 'Jail Chowrangi Flyover, Modern Society PECHS, Karachi, Pakistan'),
(8, 29, NULL, NULL, NULL, NULL, 'Home', '2022-04-22 06:13:05', '2022-04-22 06:13:05', '24.905106209413', '67.078206371516', 'Bahadurabad Chowrangi, Bahadur Shah Zafar Road, Bahadurabad Bahadur Yar Jang CHS, Karachi, Pakistan'),
(9, 13, NULL, NULL, NULL, NULL, 'Other', '2022-04-22 06:41:20', '2022-04-22 06:41:20', '24.917754290624', '67.097176797688', 'Nipa Chowrangi Bus Stop, Block 10 Gulshan-e-Iqbal, Karachi, Pakistan'),
(10, 29, NULL, NULL, NULL, NULL, 'Other', '2022-04-25 05:03:44', '2022-04-25 05:03:44', '24.8017907', '67.0299438', 'Sea View Road, Block 4 Clifton, Karachi, Pakistan'),
(11, 73, NULL, NULL, NULL, NULL, 'Home', '2022-05-09 21:56:05', '2022-05-09 21:56:05', '24.860733834638', '67.001136112958', 'Karachi, Pakistan'),
(12, 73, NULL, NULL, NULL, NULL, 'Work', '2022-05-09 21:56:25', '2022-05-09 21:56:25', '24.860733834638', '67.001136112958', 'Karachi, Pakistan'),
(13, 73, NULL, NULL, NULL, NULL, 'Other', '2022-05-09 22:03:18', '2022-05-09 22:03:18', '25.395968005675', '68.357775639743', 'Hyderabad, Pakistan'),
(14, 104, NULL, NULL, NULL, NULL, 'Work', '2022-05-10 13:02:02', '2022-05-10 13:02:02', '24.904725267679', '67.078092880547', 'Noor Trade Centre, Main University Road, adjacent Usmania Restaurant, Block 13 A Gulshan-e-Iqbal, Karachi, Pakistan'),
(15, 73, NULL, NULL, NULL, NULL, 'Other', '2022-05-12 04:33:12', '2022-05-12 04:33:12', '12.2850926', '-1.4918235', 'Ouaga 2000, Ouagadougou, Burkina Faso'),
(16, 73, NULL, NULL, NULL, NULL, 'Other', '2022-05-12 20:54:16', '2022-05-12 20:54:16', '40.7444071', '-73.9912593', '770 6th Avenue, New York, NY, USA'),
(17, 73, NULL, NULL, NULL, NULL, 'Home', '2022-05-13 08:53:58', '2022-05-13 08:53:58', '6.1084133225624', '-3.8559816031819', 'Adzope, Côte d\'Ivoire'),
(18, 104, NULL, NULL, NULL, NULL, 'Other', '2022-05-13 16:52:21', '2022-05-13 16:52:21', '24.885069204883', '67.056375201792', 'Jail Chowrangi Flyover, Karachi, Pakistan'),
(19, 73, NULL, NULL, NULL, NULL, 'Other', '2022-05-15 16:15:44', '2022-05-15 16:15:44', '12.370465166913', '-1.5143520033213', 'Ouagadougou, Burkina Faso'),
(20, 104, NULL, NULL, NULL, NULL, 'Other', '2022-05-17 19:19:55', '2022-05-17 19:19:55', '24.900946847176', '67.073122914881', 'Hasan Square Block 13 A Gulshan-e-Iqbal, Karachi, Pakistan'),
(21, 73, NULL, NULL, NULL, NULL, 'Other', '2022-05-22 17:41:24', '2022-05-22 17:41:24', '30.375321', '69.345116', 'Pakistan'),
(22, 58, NULL, NULL, NULL, NULL, 'Work', '2022-06-07 13:46:38', '2022-06-07 13:46:38', '24.904725267679', '67.078092880547', 'Noor Trade Centre, Main University Road, adjacent Usmania Restaurant, Block 13 A Gulshan-e-Iqbal, Karachi, Pakistan');

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE `bank_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`id`, `user_id`, `fullname`, `bank_name`, `acc_no`, `iban`, `branch`, `created_at`, `updated_at`) VALUES
(1, 13, 'robert', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-01-19 09:57:11', '2022-01-19 09:57:11'),
(2, 13, 'robert', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-01-19 09:57:45', '2022-01-19 09:57:45'),
(3, 44, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:05:35', '2022-04-06 02:05:35'),
(4, 48, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:10:03', '2022-04-06 02:10:03'),
(5, 50, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:11:19', '2022-04-06 02:11:19'),
(6, 52, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:12:54', '2022-04-06 02:12:54'),
(7, 54, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:15:14', '2022-04-06 02:15:14'),
(8, 57, 'alex', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-06 02:53:44', '2022-04-06 02:53:44'),
(9, 60, 'rider22', 'ssss', '11111', '12351641695', '113565', '2022-04-07 01:05:02', '2022-04-07 01:05:02'),
(10, 61, 'rider22', 'fffff', 'ffff', 'fff', 'ffff', '2022-04-07 01:09:07', '2022-04-07 01:09:07'),
(11, 62, 'Rider1234', 'aaa', 'sss', 'aaa', 'aaa', '2022-04-07 01:16:51', '2022-04-07 01:16:51'),
(12, 63, 'Riderabcd', 'ggggg', 'ggggg', 'gdfgrhdxfg', 'fghfghfgh', '2022-04-07 01:27:13', '2022-04-07 01:27:13'),
(13, 91, 'Simon James', 'HBL', '009545632110-225', '009545632110-225', 'Saddar', '2022-04-26 05:48:10', '2022-04-26 05:48:10'),
(14, 106, 'Test', 'Alpha', '73899912267899994', 'Pk14MEZN7389925568', 'Joher', '2022-05-12 12:56:47', '2022-05-12 12:56:47'),
(15, 112, 'John Rider', 'Meezan Bank', '3435345345345', '45345324543532454325', 'Abcd', '2022-05-19 19:22:31', '2022-05-19 19:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_orders`
--

CREATE TABLE `cancel_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(20) DEFAULT NULL,
  `cancel_by` int(20) DEFAULT NULL,
  `cancel_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel_orders`
--

INSERT INTO `cancel_orders` (`id`, `order_id`, `cancel_by`, `cancel_at`, `created_at`, `updated_at`) VALUES
(1, 1, 13, '2021-01-18 00:00:00', '2022-01-19 06:40:29', '2022-01-19 06:40:29'),
(9, 90, 13, '2022-01-19 12:02:12', '2022-01-19 07:02:12', '2022-01-19 07:02:12'),
(10, 90, 2, '2022-04-07 06:46:01', '2022-04-07 01:46:01', '2022-04-07 01:46:01'),
(11, 100, 58, '2022-04-07 07:09:49', '2022-04-07 02:09:49', '2022-04-07 02:09:49'),
(12, 102, 58, '2022-04-07 07:26:43', '2022-04-07 02:26:43', '2022-04-07 02:26:43'),
(13, 103, 58, '2022-04-07 09:20:09', '2022-04-07 04:20:09', '2022-04-07 04:20:09'),
(14, 101, 58, '2022-04-07 09:46:48', '2022-04-07 04:46:48', '2022-04-07 04:46:48'),
(15, 105, 58, '2022-04-07 10:17:30', '2022-04-07 05:17:30', '2022-04-07 05:17:30'),
(16, 89, 58, '2022-04-07 10:35:10', '2022-04-07 05:35:10', '2022-04-07 05:35:10'),
(17, 235, 58, '2022-04-25 12:11:55', '2022-04-25 07:11:55', '2022-04-25 07:11:55'),
(18, 290, 54, '2022-04-26 08:09:33', '2022-04-26 03:09:33', '2022-04-26 03:09:33'),
(39, 292, 54, '2022-04-26 09:21:00', '2022-04-26 04:21:00', '2022-04-26 04:21:00'),
(41, 292, 2, '2022-04-26 09:23:11', '2022-04-26 04:23:11', '2022-04-26 04:23:11'),
(42, 292, 2, '2022-04-26 09:29:34', '2022-04-26 04:29:34', '2022-04-26 04:29:34'),
(43, 285, 58, '2022-04-27 13:21:17', '2022-04-27 17:21:17', '2022-04-27 17:21:17'),
(44, 284, 58, '2022-04-27 18:16:55', '2022-04-27 22:16:55', '2022-04-27 22:16:55'),
(45, 234, 40, '2022-04-28 13:22:26', '2022-04-28 17:22:26', '2022-04-28 17:22:26'),
(46, 275, 58, '2022-04-28 21:03:43', '2022-04-29 01:03:43', '2022-04-29 01:03:43'),
(47, 256, 31, '2022-04-29 10:01:46', '2022-04-29 14:01:46', '2022-04-29 14:01:46'),
(48, 196, 29, '2022-05-06 16:45:28', '2022-05-06 20:45:28', '2022-05-06 20:45:28'),
(49, 272, 58, '2022-05-09 07:26:26', '2022-05-09 11:26:26', '2022-05-09 11:26:26'),
(50, 8, 91, '2022-05-09 16:36:51', '2022-05-09 20:36:51', '2022-05-09 20:36:51'),
(51, 19, 91, '2022-05-12 16:38:48', '2022-05-12 20:38:48', '2022-05-12 20:38:48'),
(52, 1, 91, '2022-05-13 08:43:26', '2022-05-13 12:43:26', '2022-05-13 12:43:26'),
(53, 32, 91, '2022-05-13 09:53:25', '2022-05-13 13:53:25', '2022-05-13 13:53:25'),
(54, 30, 91, '2022-05-13 11:30:36', '2022-05-13 15:30:36', '2022-05-13 15:30:36'),
(55, 35, 91, '2022-05-13 11:35:05', '2022-05-13 15:35:05', '2022-05-13 15:35:05'),
(56, 39, 91, '2022-05-13 12:27:08', '2022-05-13 16:27:08', '2022-05-13 16:27:08'),
(57, 39, 91, '2022-05-13 12:27:11', '2022-05-13 16:27:11', '2022-05-13 16:27:11'),
(58, 40, 91, '2022-05-13 12:28:08', '2022-05-13 16:28:08', '2022-05-13 16:28:08'),
(59, 41, 91, '2022-05-13 12:51:32', '2022-05-13 16:51:32', '2022-05-13 16:51:32'),
(60, 76, 59, '2022-05-13 12:51:33', '2022-05-13 16:51:33', '2022-05-13 16:51:33'),
(74, 73, 58, '2022-05-18 15:24:28', '2022-05-18 19:24:28', '2022-05-18 19:24:28'),
(75, 71, 58, '2022-05-18 15:24:49', '2022-05-18 19:24:49', '2022-05-18 19:24:49'),
(76, 47, 58, '2022-05-18 15:25:01', '2022-05-18 19:25:01', '2022-05-18 19:25:01'),
(77, 1, 112, '2022-05-19 16:17:37', '2022-05-19 20:17:37', '2022-05-19 20:17:37'),
(78, 71, 112, '2022-05-19 16:36:57', '2022-05-19 20:36:57', '2022-05-19 20:36:57'),
(79, 91, 112, '2022-06-02 14:17:53', '2022-06-02 18:17:53', '2022-06-02 18:17:53'),
(80, 89, 112, '2022-06-02 14:17:58', '2022-06-02 18:17:58', '2022-06-02 18:17:58'),
(81, 90, 58, '2022-06-03 11:53:04', '2022-06-03 15:53:04', '2022-06-03 15:53:04'),
(82, 88, 112, '2022-06-06 11:33:39', '2022-06-06 15:33:39', '2022-06-06 15:33:39'),
(83, 86, 112, '2022-06-07 09:41:07', '2022-06-07 13:41:07', '2022-06-07 13:41:07'),
(84, 93, 58, '2022-06-07 09:44:04', '2022-06-07 13:44:04', '2022-06-07 13:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cardholder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `default` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `cardholder_name`, `card_number`, `expiry_date`, `cvv`, `stripe_token`, `user_id`, `default`, `created_at`, `updated_at`) VALUES
(1, 'Test', '1423', '0000-00-00', NULL, 'sdf4654s6df4sd6f54', 6, 1, '2021-09-28 08:51:24', '2021-12-01 05:21:59'),
(2, 'Test', '1354', '2022-05-04', NULL, '36s4df56sf46sdf54', 1, 1, '2021-09-28 18:22:39', '2022-04-20 05:27:16'),
(3, 'Test', '1354', '2022-05-04', NULL, '36s4df56sf46sdf54', 1, 0, '2021-09-28 18:23:51', '2021-09-28 18:25:39'),
(4, 'Test', '1354', '2022-05-04', NULL, '36s4df56sf46sdf54', 1, 1, '2021-12-01 05:21:59', '2021-12-01 05:21:59'),
(5, 'Test User', '1354', '2022-05-04', NULL, '36s4df56sf46sdf54', 72, 0, '2021-12-01 05:23:14', '2021-12-01 07:46:37'),
(6, 'Test User', '1478', '2022-12-01', '12345', '36s4df56sf46sdf54', 72, 0, '2021-12-01 07:40:42', '2021-12-01 09:20:25'),
(7, 'Test User', '1478', '2022-12-01', '12345', '36s4df56sf46sdf54', 72, 0, '2021-12-01 09:20:25', '2021-12-01 09:22:28'),
(8, 'Test User', '1414', '2022-12-01', '12345', '36s4df56sf46sdf54', 72, 1, '2021-12-01 09:22:28', '2021-12-01 09:22:29'),
(9, 'Test User', '1414', '2022-12-01', '12345', '36s4df56sf46sdf54', 13, 0, '2022-04-20 05:23:20', '2022-04-20 05:25:32'),
(10, 'Test User', '1414', '2022-12-01', '12345', '36s4df56sf46sdf54', 13, 1, '2022-04-20 05:27:55', '2022-04-20 05:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `value`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'terms_condition_title', 'Terms & Conditions', '1', '2020-05-28 10:06:29', '2022-01-06 05:58:41'),
(2, 'terms_condition_paragraph', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(3, 'question_1', 'Lorem Ipsum is simply dummy text', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(4, 'answer_1', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(5, 'question_2', 'Intellectual Property Rights', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(6, 'answer_2', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(7, 'question_3', 'Readable content of a page when looking at its layout.', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(8, 'answer_3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(9, 'question_4', 'What is Lorem Ipsum?', '16', '2021-03-10 15:35:38', '2021-03-23 02:32:42'),
(10, 'answer_4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here,', '16', NULL, NULL),
(11, 'about_us_title', 'About Us', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(12, 'about_us_paragraph_a', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(13, 'about_us_paragraph_c', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(14, 'about_us_paragraph_b', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '16', '2020-05-28 10:06:30', '2021-03-23 02:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `min_amount` int(11) NOT NULL,
  `exp_date` datetime NOT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `voucher_code`, `discount`, `min_amount`, `exp_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 'we miss you', '654687r5', 10, 100, '2022-03-08 18:37:44', 'This is a coupon', '2022-03-30 08:31:58', '2022-03-30 08:31:58'),
(2, 'we miss you', '654687p5', 10, 100, '2022-03-17 00:00:00', 'This is a coupon', '2022-03-11 04:36:23', '2022-03-30 08:42:39'),
(3, 'we miss you', '654687r5', 10, 100, '2022-03-08 18:37:44', 'This is a coupon', '2022-03-30 08:31:58', '2022-03-30 08:31:58'),
(4, 'we miss you', '654687r5', 10, 100, '2022-03-17 00:00:00', 'This is a coupon', '2022-03-11 04:36:23', '2022-03-30 08:42:39'),
(5, 'we miss you', '654687r5', 10, 100, '2022-04-27 18:37:44', 'This is a coupon', '2022-03-30 08:31:58', '2022-03-30 08:31:58'),
(6, 'we miss you', '654687r5', 10, 100, '2022-04-26 00:00:00', 'This is a coupon', '2022-03-11 04:36:23', '2022-03-30 08:42:39'),
(7, 'we miss you', '654687r5', 10, 100, '2022-05-10 18:37:44', 'This is a coupon', '2022-03-30 08:31:58', '2022-03-30 08:31:58'),
(8, 'we miss you', '654687r7', 10, 100, '2022-04-30 00:00:00', 'This is a coupon', '2022-03-11 04:36:23', '2022-03-30 08:42:39'),
(9, 'we miss you', '657787r7', 10, 100, '2022-05-27 00:00:00', 'This is a coupon', '2022-05-27 03:36:23', '2022-03-08 09:42:39'),
(10, 'we miss you', '657787r8', 10, 100, '2022-05-18 00:00:00', 'This is a coupon', '2022-05-27 03:36:23', '2022-03-08 09:42:39'),
(11, 'we miss you', '657787r9', 10, 100, '2022-05-20 00:00:00', 'This is a coupon', '2022-05-27 03:36:23', '2022-03-08 09:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_types`
--

CREATE TABLE `cuisine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine_types`
--

INSERT INTO `cuisine_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Chinese', '2022-06-03 10:09:13', '2022-06-03 10:09:13'),
(2, 'Italian', '2022-06-03 10:13:16', '2022-06-03 10:13:16'),
(3, 'French', '2022-06-03 10:13:16', '2022-06-03 10:13:16'),
(4, 'Indian', '2022-06-03 10:13:16', '2022-06-03 10:13:16'),
(5, 'Caribbean/ Jamaican', '2022-06-03 10:13:16', '2022-06-03 10:13:16'),
(6, 'African', '2022-06-03 10:13:16', '2022-06-03 10:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `grocery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_type` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) NOT NULL,
  `ingredients` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `vegi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expertise` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `restaurant_id`, `grocery_id`, `category_id`, `course_type`, `price`, `ingredients`, `image`, `discount`, `vegi`, `expertise`, `start_date`, `end_date`, `latitude`, `longitude`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Italian Pizza', 10, NULL, 0, NULL, 500, 'abc', 'public/uploads/items/img/61dbebf761d03.png', 5, NULL, 3, '2022-01-18', '2022-01-20', '', '', 1, 'lorem ipsum', '2022-01-05 10:15:25', '2022-01-05 10:15:25'),
(2, 'Pizza', 10, NULL, 0, NULL, 100, 'xyz', 'public/uploads/items/img/61dbebf761d03.png', 10, NULL, 0, '2021-09-21', '2021-09-30', '', '', 1, NULL, '2022-01-05 10:16:01', '2022-01-10 03:19:03'),
(5, 'Pizza', 1, NULL, 0, NULL, 100, NULL, 'public/uploads/items/img/61dbe444414a3.png', 10, NULL, 1, '2021-09-21', '2021-09-30', '', '', 1, NULL, '2022-01-10 02:46:12', '2022-01-10 02:46:12'),
(7, 'Pizza', 1, NULL, 0, NULL, 100, 'xyz', 'public/uploads/items/img/61dfeb46b8d3e.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, NULL, '2022-01-13 04:05:11', '2022-01-13 04:05:11'),
(8, 'Pizza', 1, NULL, 0, NULL, 100, 'xyz', 'public/uploads/items/img/61dfeb96e4608.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, NULL, '2022-01-13 04:06:31', '2022-01-13 04:06:31'),
(9, 'Pizza', 14, NULL, 0, NULL, 100, 'xyz', 'public/uploads/items/img/61dfebaff1ae4.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, 'lorem ipsum', '2022-01-13 04:06:56', '2022-02-28 06:38:26'),
(10, 'Pizza', 10, 16, 1, NULL, 100, 'xyz', 'public/uploads/items/img/61dfebb8a11b2.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, 'lorem ipsum', '2022-01-13 04:07:04', '2022-02-28 06:36:39'),
(11, 'Pizza', 10, 16, 3, NULL, 100, 'xyz', 'public/uploads/items/img/61e511b5da6a2.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, 'lorem ipsum', '2022-01-17 01:50:30', '2022-03-14 09:09:44'),
(12, 'Pizza', 15, NULL, 1, NULL, 100, 'xyz', 'public/uploads/items/img/61dfebb8a11b2.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', '', '', 1, 'lorem ipsum', '2022-01-13 04:07:04', '2022-02-28 06:36:39'),
(13, 'Pizza', 29, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/61e511b5da6a2.png', 10, 'tomato', 2, '2021-09-21', '2021-09-30', '', '', 1, 'lorem ipsum', '2022-01-17 01:50:30', '2022-03-14 09:09:44'),
(14, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6245a484657df.png', 10, 'tomato', 2, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-03-31 07:54:28', '2022-03-31 07:54:28'),
(15, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246a4a1bf440.png', 10, 'tomato', 3, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:07:14', '2022-04-01 02:07:14'),
(16, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246a8784d2c9.png', 10, 'tomato', 2, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:23:36', '2022-04-01 02:23:36'),
(17, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246a88b0e029.png', 10, 'tomato', 4, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:23:55', '2022-04-01 02:23:55'),
(18, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246a939a2394.png', 10, 'tomato', 5, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:26:49', '2022-04-01 02:26:49'),
(19, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246ac4e76285.png', 10, 'tomato', 6, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:39:58', '2022-04-01 02:39:58'),
(20, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246ac5831670.png', 10, 'tomato', 3, NULL, '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 02:40:08', '2022-04-01 02:40:08'),
(21, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6246cd29d1a26.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 05:00:10', '2022-04-01 05:00:10'),
(22, 'Abcd', 17, NULL, 4, NULL, 100, 'Cheese', 'public/uploads/items/img/6246cdad8f3a1.png', 10, 'Onion', 4, '2022-04-01', '2022-05-05', NULL, NULL, 1, 'No description', '2022-04-01 05:02:21', '2022-04-01 05:02:21'),
(23, 'Abcd', 17, NULL, 1, NULL, 100, 'Cheese', 'public/uploads/items/img/6246ced73484f.png', 10, 'Onion', 6, '2022-04-01', '2022-05-13', NULL, NULL, 1, 'No description', '2022-04-01 05:07:19', '2022-04-01 05:07:19'),
(24, 'Abcd', 17, NULL, 3, NULL, 100, 'Cheese', 'public/uploads/items/img/6246d8c441f10.png', 10, 'Onion', 2, '2022-04-01', '2022-05-05', NULL, NULL, 1, 'No description', '2022-04-01 05:49:40', '2022-04-01 05:49:40'),
(25, 'Pizza', 1, NULL, 1, NULL, 100, 'xyz', 'public/uploads/items/img/62472022cbe00.png', 10, 'tomato', 3, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 10:54:11', '2022-04-01 10:54:11'),
(26, 'Tikka', 40, NULL, 5, NULL, 250, 'Chicken', 'public/uploads/items/img/6247211de22e4.png', 10, 'Tomatoes', 4, '2022-04-01', '2022-05-04', NULL, NULL, 1, 'No desc', '2022-04-01 10:58:21', '2022-04-01 10:58:21'),
(27, 'Pizza', 1, NULL, 1, NULL, 100, 'xyz', 'public/uploads/items/img/62472146b4e80.png', 10, 'tomato', 6, NULL, '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-01 10:59:03', '2022-04-01 10:59:03'),
(28, 'Pizza', 1, NULL, 1, NULL, 100, 'xyz', 'public/uploads/items/img/6247214ed9022.png', NULL, 'tomato', 1, NULL, NULL, NULL, NULL, 1, 'lorem ipsum', '2022-04-01 10:59:11', '2022-04-01 10:59:11'),
(29, 'Fried egg', 40, NULL, 1, NULL, 50, 'Egg', 'public/uploads/items/img/624721e4ce77d.png', NULL, 'Onion', 1, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-01 11:01:40', '2022-04-01 11:01:40'),
(30, 'New Vegi', 40, NULL, 8, NULL, 150, 'Brocolli', 'public/uploads/items/img/624abcf730430.png', NULL, 'Pickles', 3, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-04 04:40:07', '2022-04-04 04:40:07'),
(31, 'Vegi 2', 40, NULL, 8, NULL, 150, 'Brocolli', 'public/uploads/items/img/624abd95e2cbf.png', 10, 'Pickles', 3, '2022-04-04', '2022-04-04', NULL, NULL, 1, NULL, '2022-04-04 04:42:45', '2022-04-04 04:42:45'),
(32, 'New Dessert', 40, NULL, 3, NULL, 250, 'No ingredient', 'public/uploads/items/img/624abe997b2d0.png', 10, 'Onion', 4, '2022-04-04', '2022-05-05', NULL, NULL, 1, NULL, '2022-04-04 04:47:05', '2022-04-04 04:47:05'),
(33, 'Burger', 58, NULL, 5, NULL, 300, 'Cheese', 'public/uploads/items/img/624d82b34ca84.png', NULL, 'Tomatoes', 4, NULL, NULL, NULL, NULL, 1, 'Burger description', '2022-04-06 07:08:19', '2022-04-06 07:08:19'),
(34, 'Sandwiches', 58, NULL, 5, NULL, 300, 'Cheese', 'public/uploads/items/img/624d83115ab09.png', NULL, 'Jalapeno', 4, NULL, NULL, NULL, NULL, 1, 'BBQ flavor sandwich', '2022-04-06 07:09:53', '2022-04-06 07:09:53'),
(35, 'Chocolate Cake', 58, NULL, 3, NULL, 800, 'Choco', 'public/uploads/items/img/624ff6783a5d5.png', NULL, 'Jalapeno', 5, NULL, NULL, NULL, NULL, 1, 'Choco lava cake', '2022-04-08 03:46:48', '2022-04-08 03:46:48'),
(36, 'Pizza', 1, NULL, NULL, NULL, 100, 'xyz', 'public/uploads/items/img/624ff74700575.png', 10, NULL, 4, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-08 03:50:15', '2022-04-08 03:50:15'),
(37, 'Pizza', 1, NULL, NULL, NULL, 100, 'xyz', 'public/uploads/items/img/624ff754443ab.png', 10, NULL, 1, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-08 03:50:28', '2022-04-08 03:50:28'),
(38, 'Pizza', 1, NULL, NULL, NULL, 100, NULL, 'public/uploads/items/img/624ff75b365f9.png', 10, NULL, 1, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-08 03:50:35', '2022-04-08 03:50:35'),
(39, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6253fa49d34d4.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-11 04:52:10', '2022-04-11 04:52:10'),
(42, 'Pizza', 1, NULL, 3, NULL, 100, 'xyz', 'public/uploads/items/img/6256a4cf90919.png', 10, 'tomato', 1, '2021-09-21', '2021-09-30', NULL, NULL, 1, 'lorem ipsum', '2022-04-13 05:24:16', '2022-04-13 05:24:16'),
(43, 'Chicken Karahi', 58, NULL, 5, NULL, 800, NULL, 'public/uploads/items/img/6269432f439ac.png', NULL, 'Tomatoes', 4, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-27 17:20:47', '2022-04-27 17:20:47'),
(44, 'Aloo Paratha', 58, NULL, 1, NULL, 50, 'Ingredients of Aloo Paratha · 2 potato · 1/2 teaspoon red chilli powder · 1 tablespoon coriander leaves · 2 tablespoon onion.', 'public/uploads/items/img/6278c5ca3d600.png', 5, 'Tomatoes', 4, '2022-05-09', '2022-05-10', NULL, NULL, 1, 'Winters are here and it\'s time to indulge in a delicious and crispy Aloo Paratha recipe filled with spicy potato stuffing made with spices and herbs. Paratha is one of the most loved North Indian delicacy, which is prepared in almost every Indian household. If you too are a fan', '2022-05-09 11:42:02', '2022-05-09 11:42:02'),
(47, 'Tapal Tea', NULL, 59, 10, NULL, 475, NULL, 'public/uploads/items/img/628383decea4d.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, '2022-05-17 15:15:42', '2022-05-17 15:15:42'),
(48, 'Mango', NULL, 59, 7, NULL, 35, NULL, 'public/uploads/items/img/6283878d3c5a5.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, '2022-05-17 15:31:25', '2022-05-17 15:31:25'),
(49, 'Coke', 58, NULL, 13, NULL, 120, NULL, 'public/uploads/items/img/629a013128f26.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, '1.5 Ltr', '2022-06-03 16:40:17', '2022-06-03 16:40:17'),
(50, 'Nuggets', NULL, 59, 27, NULL, 375, NULL, 'public/uploads/items/img/629de95b809ca.png', NULL, 'Tomatoes', 1, NULL, NULL, NULL, NULL, 1, NULL, '2022-06-06 15:47:39', '2022-06-06 15:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `use_for` enum('grocery','restaurant','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`, `status`, `use_for`, `created_at`, `updated_at`) VALUES
(1, 'Appetizers', 1, 'restaurant', '2021-05-02 19:00:00', '2022-01-13 09:29:13'),
(3, 'Entrees', 1, 'restaurant', '2021-06-14 04:16:25', '2022-01-13 09:30:23'),
(6, 'Pasta/ Noodles and Rice', 1, 'restaurant', '2022-01-13 09:31:57', '2022-01-13 09:31:57'),
(7, 'Fruits and Veggies', 1, 'grocery', '2022-03-10 04:49:59', '2022-03-10 04:49:59'),
(8, 'Deli/ Meat/ Fish', 1, 'grocery', '2022-03-10 04:50:15', '2022-03-10 04:50:15'),
(9, 'Dairy and Eggs', 1, 'grocery', '2022-03-10 04:50:53', '2022-03-10 04:50:53'),
(10, 'Breakfast', 1, 'grocery', '2022-03-10 04:52:23', '2022-03-10 04:52:23'),
(11, 'Burgers', 1, 'restaurant', '2022-06-02 13:32:01', '2022-06-02 13:32:01'),
(12, 'Pizza ', 1, 'restaurant', NULL, NULL),
(13, 'Beverages/Drinks', 1, 'restaurant', NULL, NULL),
(14, 'Vegetarian', 1, 'restaurant', NULL, NULL),
(15, 'Desserts', 1, 'restaurant', NULL, NULL),
(16, 'Pasta/ Noodles and Rice', 1, 'grocery', NULL, NULL),
(17, 'Herbs and Spices', 1, 'grocery', NULL, NULL),
(18, 'Baked good', 1, 'grocery', NULL, NULL),
(19, 'Beverages', 1, 'grocery', NULL, NULL),
(20, 'Snacks', 1, 'grocery', NULL, NULL),
(21, 'Baking good', 1, 'grocery', NULL, NULL),
(22, 'Baby', 1, 'grocery', NULL, NULL),
(23, 'Personal', 1, 'grocery', NULL, NULL),
(24, 'Pets', 1, 'grocery', NULL, NULL),
(25, 'Households', 1, 'grocery', NULL, NULL),
(26, 'Pantry & Canned goods', 1, 'grocery', NULL, NULL),
(27, 'Frozen Food', 1, 'grocery', '2022-06-02 13:35:48', '2022-06-02 13:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `item_expertise`
--

CREATE TABLE `item_expertise` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_expertise`
--

INSERT INTO `item_expertise` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'chinese', 'public/uploads/expertise/img/119516824.jpg', NULL, '2022-04-11 07:41:08'),
(2, 'italian', 'public/uploads/expertise/img/538791689.jpg', NULL, '2022-04-11 07:42:29'),
(3, 'indian', 'public/uploads/expertise/img/1028819822.jpg', NULL, '2022-04-11 07:43:31'),
(4, 'pakistani', 'public/uploads/expertise/img/636069510.jpg', NULL, '2022-04-11 07:44:22'),
(5, 'maxican', 'public/uploads/expertise/img/269779479.jpg', NULL, '2022-04-11 07:46:07'),
(6, 'sri lankan', 'public/uploads/expertise/img/2122836500.jpg', NULL, '2022-04-11 07:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_08_134026_create_permission_tables', 1),
(5, '2021_01_08_134156_create_products_table', 2),
(6, '2021_01_14_085631_create_categories_table', 3),
(7, '2021_01_14_091152_create_subcategories_table', 3),
(8, '2021_01_14_151600_create_dishes_table', 4),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(12, '2016_06_01_000004_create_oauth_clients_table', 5),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5),
(14, '2021_04_30_100430_create_activity_log_table', 6),
(15, '2021_12_29_155315_create_rider_detail_table', 7),
(16, '2022_01_05_090458_create_items_table', 8),
(17, '2021_05_03_063127_create_content_table', 9),
(18, '2021_05_03_063513_create_settings_table', 10),
(19, '2022_01_10_102106_create_orders_table', 11),
(20, '2022_01_10_105412_create_order_items_table', 12),
(21, '2022_01_13_071548_create_notifications_table', 12),
(23, '2022_01_19_140355_create_bank_info_table', 13),
(24, '2022_01_20_084625_create_vehicles_table', 14),
(26, '2022_03_01_065250_create_addresses_table', 15),
(27, '2022_03_01_092101_create_coupons_table', 16),
(28, '2022_04_11_075151_create_item_expertise_table', 17),
(29, '2021_09_28_134142_create_cards_table', 18),
(30, '2022_04_18_092809_create_cart_items_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 70),
(1, 'App\\User', 71),
(2, 'App\\User', 2),
(2, 'App\\User', 7),
(2, 'App\\User', 13),
(2, 'App\\User', 17),
(2, 'App\\User', 18),
(2, 'App\\User', 19),
(2, 'App\\User', 20),
(2, 'App\\User', 21),
(2, 'App\\User', 22),
(2, 'App\\User', 23),
(2, 'App\\User', 24),
(2, 'App\\User', 25),
(2, 'App\\User', 33),
(2, 'App\\User', 34),
(2, 'App\\User', 35),
(2, 'App\\User', 36),
(2, 'App\\User', 37),
(2, 'App\\User', 65),
(2, 'App\\User', 72),
(2, 'App\\User', 73),
(2, 'App\\User', 97),
(4, 'App\\User', 9),
(4, 'App/User', 31),
(4, 'App\\User', 44),
(4, 'App\\User', 46),
(4, 'App\\User', 48),
(4, 'App\\User', 50),
(4, 'App\\User', 52),
(4, 'App\\User', 54),
(4, 'App\\User', 57),
(4, 'App\\User', 60),
(4, 'App\\User', 61),
(4, 'App\\User', 62),
(4, 'App\\User', 63),
(4, 'App\\User', 91),
(4, 'App\\User', 106),
(4, 'App\\User', 112),
(6, 'App\\User', 10),
(6, 'App\\User', 14),
(6, 'App\\User', 15),
(6, 'App\\User', 29),
(6, 'App\\User', 40),
(6, 'App\\User', 58),
(6, 'App\\User', 92),
(6, 'App\\User', 93),
(6, 'App\\User', 94),
(6, 'App\\User', 111),
(7, 'App\\User', 12),
(7, 'App\\User', 74),
(7, 'App\\User', 78),
(7, 'App\\User', 81),
(7, 'App\\User', 82),
(7, 'App\\User', 83),
(7, 'App\\User', 84),
(7, 'App\\User', 85),
(7, 'App\\User', 86),
(7, 'App\\User', 87),
(7, 'App\\User', 88),
(7, 'App\\User', 89),
(7, 'App\\User', 90),
(7, 'App\\User', 108),
(7, 'App\\User', 109),
(7, 'App\\User', 110),
(8, 'App\\User', 16),
(8, 'App\\User', 27),
(8, 'App\\User', 59);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `trigger_id` int(11) DEFAULT NULL,
  `trigger_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failure` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `receiver_id`, `trigger_id`, `trigger_type`, `title`, `message`, `device_type`, `success`, `failure`, `image`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 30, 31, 0, '1', 'Porter ', 'your job request cancelled by a job creator', NULL, '', '', NULL, NULL, '2021-10-13 07:02:50', '2021-10-13 07:02:50'),
(8, 13, 58, 223, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-20 07:20:43', '2022-04-20 07:20:43'),
(9, 29, 13, 228, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-21 05:25:51', '2022-04-21 05:25:51'),
(10, 29, 13, 229, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-21 05:26:57', '2022-04-21 05:26:57'),
(11, 13, 13, 230, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-22 06:32:39', '2022-04-22 06:32:39'),
(12, 29, 13, 231, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-22 07:17:34', '2022-04-22 07:17:34'),
(13, 29, 13, 232, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-25 05:34:43', '2022-04-25 05:34:43'),
(14, 29, 13, 233, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-25 06:26:06', '2022-04-25 06:26:06'),
(15, 29, 13, 235, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-25 07:05:10', '2022-04-25 07:05:10'),
(16, 13, 13, 236, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:22:37', '2022-04-26 01:22:37'),
(17, 13, 13, 237, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:23:17', '2022-04-26 01:23:17'),
(18, 13, 13, 238, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:24:59', '2022-04-26 01:24:59'),
(19, 13, 13, 239, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:27:44', '2022-04-26 01:27:44'),
(20, 13, 13, 240, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:28:40', '2022-04-26 01:28:40'),
(21, 13, 13, 241, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:29:40', '2022-04-26 01:29:40'),
(22, 13, 13, 242, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:29:57', '2022-04-26 01:29:57'),
(23, 13, 13, 243, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:30:21', '2022-04-26 01:30:21'),
(24, 13, 13, 244, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:30:56', '2022-04-26 01:30:56'),
(25, 13, 13, 245, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:31:07', '2022-04-26 01:31:07'),
(26, 13, 13, 246, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:31:32', '2022-04-26 01:31:32'),
(27, 13, 13, 247, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:33:52', '2022-04-26 01:33:52'),
(28, 13, 13, 248, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:35:10', '2022-04-26 01:35:10'),
(29, 13, 13, 249, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:38:10', '2022-04-26 01:38:10'),
(30, 13, 13, 250, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:38:51', '2022-04-26 01:38:51'),
(31, 13, 13, 251, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 01:40:10', '2022-04-26 01:40:10'),
(80, 13, 13, 290, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 07:16:49', '2022-04-26 07:16:49'),
(81, 13, 58, 290, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 07:21:25', '2022-04-26 07:21:25'),
(82, 13, 58, 290, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-26 07:22:43', '2022-04-26 07:22:43'),
(83, 29, 58, 280, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-27 02:56:45', '2022-04-27 02:56:45'),
(84, 58, 58, 236, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-27 03:16:38', '2022-04-27 03:16:38'),
(85, 29, 29, 300, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-27 17:21:26', '2022-04-27 17:21:26'),
(86, 58, 58, 300, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-27 17:24:18', '2022-04-27 17:24:18'),
(87, 29, 29, 301, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-30 01:45:13', '2022-04-30 01:45:13'),
(88, 29, 29, 302, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-04-30 01:46:25', '2022-04-30 01:46:25'),
(89, 29, 29, 304, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-06 20:47:35', '2022-05-06 20:47:35'),
(90, 29, 29, 304, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-06 20:50:45', '2022-05-06 20:50:45'),
(91, 29, 29, 305, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-06 20:53:37', '2022-05-06 20:53:37'),
(92, 29, 29, 306, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-06 20:54:54', '2022-05-06 20:54:54'),
(93, 13, 13, 308, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-09 10:58:53', '2022-05-09 10:58:53'),
(94, 13, 13, 12, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-09 21:53:40', '2022-05-09 21:53:40'),
(95, 13, 13, 15, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-10 11:42:13', '2022-05-10 11:42:13'),
(96, 13, 13, 16, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-10 11:49:19', '2022-05-10 11:49:19'),
(97, 13, 13, 21, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-10 13:04:28', '2022-05-10 13:04:28'),
(98, 13, 13, 22, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-10 13:04:47', '2022-05-10 13:04:47'),
(99, 13, 13, 43, 'new_order', 'Porter', 'You Have A New Order', NULL, '', '', NULL, NULL, '2022-05-10 13:34:18', '2022-05-10 13:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('009dae539ad84c06c28b89b06dd32592d218172a2817a0ffeed059b6d935b5e1c5c0b25ee0722534', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-15 06:51:41', '2022-04-15 06:51:41', '2023-04-15 11:51:41'),
('00c9eff492be122d2c33f724186aa8945b53df90b4c03b4170928e00b013f44a3994f33341adf4e0', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-19 20:51:47', '2022-05-19 20:51:47', '2023-05-19 16:51:47'),
('01476a441fb8e39152035ee7b343981c8f27b1c595894d7d09aa1074ad4dda08da4fd7c897ae0876', 73, 1, 'Personal Access Token', '[]', 0, '2022-04-07 14:40:09', '2022-04-07 14:40:09', '2023-04-07 19:40:09'),
('0158c58bfcb58605d7576e4390228336998abdd1b0451a10376e4a403bb739ecba6dc96872a2a83c', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-11 16:21:55', '2022-05-11 16:21:55', '2023-05-11 12:21:55'),
('0224206d3044b7d9700c9d5a1742585601720610a581cc2d41ce2de41690e14762945dffc2ebbb25', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 05:34:21', '2022-03-28 05:34:21', '2023-03-28 10:34:21'),
('023846617846d6de3ec3dd4c6eebad65bdb61a0fc31da190257dd49819ee793dfecdcd87d8946d1d', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 05:59:29', '2022-03-23 05:59:29', '2023-03-23 10:59:29'),
('026f1a25ed7df4ef7a189954f39fd1371c8a2feb0e837b10f14590036b60c1f9f835b5aab6daec52', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:18:22', '2022-03-24 06:18:22', '2023-03-24 11:18:22'),
('028e51aec8871c73349ed09622f212604be3f4f120987927087ff0625448da78ea5a111cd377ea06', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 10:35:29', '2022-05-10 10:35:29', '2023-05-10 06:35:29'),
('02d786df36ada1e33d0f42ceee9c5f56c5557a42845d2d23ad5ff138c832e3c9cc4ae8572ad452e5', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:04:23', '2022-05-09 15:04:23', '2023-05-09 11:04:23'),
('034c9a05d35e4dbb6ab611d9366188046c8a298dbd11b11924c8904bc3dbcaca3aca89f146d52613', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:02:48', '2022-05-16 18:02:48', '2023-05-16 14:02:48'),
('036b1dcf07afae0b7954716bf473d03d51667305d5bf0d11d217976ab89bb09fd5df7c8f07db5e38', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:36:45', '2022-05-09 15:36:45', '2023-05-09 11:36:45'),
('03d700791d6ada27c6406b8fb6b8215c5dcdd45c68279d5f9b47eaae6c401a9636da0ea2571dc98c', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 15:38:29', '2022-05-16 15:38:29', '2023-05-16 11:38:29'),
('03e2a17c1ffec07bf40267fc9699577de51540370e02fbf895599fb95bd3dc355e897a56a3fdc5d2', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-06 07:12:21', '2022-04-06 07:12:21', '2023-04-06 12:12:21'),
('03f9c6ca3050c3ac826522e87806fd9c93a2060e124524f1ee75dc04c6609213cee5b7968196610a', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:23:05', '2022-04-05 06:23:05', '2023-04-05 11:23:05'),
('041bcb92b6f6983b357274add461e6721006e75c69d0dafd1b200738b2b8c7eec4be54f268d21f79', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-11 05:19:43', '2022-04-11 05:19:43', '2023-04-11 10:19:43'),
('0434a3a66cbf0cded6bcd08274da570db13e5c89aed31cb8d12f1e16e4b4c3df3964563e9e6dca69', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 06:10:42', '2022-05-12 06:10:42', '2023-05-12 02:10:42'),
('045443b156eda20860f654e2afd315a2a7cf47f28737d9499b724810bb7453a957735deb61b573fd', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 02:25:20', '2022-04-05 02:25:20', '2023-04-05 07:25:20'),
('054e4556d6b7faf13bb1b81367f3c79b6783e96c0fc46d4df09c8f73b9ef19da336009ae6ecb9636', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-07 01:31:06', '2022-04-07 01:31:06', '2023-04-07 06:31:06'),
('0574c426b2a7ac739e08ba5f78f9d5afd4c58f23e3e414f395df334de182edf117171568b7656a30', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:05:23', '2022-05-09 22:05:23', '2023-05-09 18:05:23'),
('05e4413815a42bc17ec331d1823ff27e094c1cbcc47fe603046f45c37f7d965d6cc7ea479bfc13db', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:04:35', '2022-05-09 22:04:35', '2023-05-09 18:04:35'),
('060bd3b90e33994c0d8ab885b62cd1964df904b00e9cab16fd4307b2e26bb5dd27061ef9d00e0d1d', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 06:09:01', '2022-03-24 06:09:01', '2023-03-24 11:09:01'),
('0656fe89353ec9bafb899efafffebb1be309573c77b944e6d5f646a82f724a64b34a197787fa5c97', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 05:50:21', '2022-04-18 05:50:21', '2023-04-18 10:50:21'),
('06ed0e0b809f093514abb2a970765e80018fc78ea610a77c3bf6cf278238aa88864a6b1b28fada9d', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 05:53:45', '2022-03-25 05:53:45', '2023-03-25 10:53:45'),
('0778eb5e8408de547fc6c072f26360647d9a6dadd28a06f5a4bd7913a957866c9d1f3eda4ae13862', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-29 04:13:14', '2022-03-29 04:13:14', '2023-03-29 09:13:14'),
('07e2cba7ae5b7e973dd8697f793fd3984a58fb721c71c4b4991de10dbb88d9fbe86bf8187ca969c5', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-13 14:00:51', '2022-05-13 14:00:51', '2023-05-13 10:00:51'),
('08518f2da541f91785100d1dd42a234a76c91c1815e04fbaa24c4651a0764a4ba143e6f5880240ab', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 05:09:13', '2022-04-19 05:09:13', '2023-04-19 10:09:13'),
('0910a9fa1ad8c98bbfd6c90101f690941e310d1d9fc1c8f47a57f7d8c5d42435059a47a1597a14cc', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 19:22:53', '2022-05-09 19:22:53', '2023-05-09 15:22:53'),
('09bb251d08a662276644238db9e1e9231e341583ff8489a23baab868a8bb76cfd458c85c7569a8cf', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-13 18:41:37', '2022-05-13 18:41:37', '2023-05-13 14:41:37'),
('09c5b105ca652b230dacc91c13849104482ccc44f9c3f68be2c636cf0dc1fe556e9e494f15ee3095', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 14:49:35', '2022-05-09 14:49:35', '2023-05-09 10:49:35'),
('0a52d1dbd037e857c3dc7a4d540680a7b9593ff3c0dcdc31abd0964cba7014b8cdca1ad6c3f751a6', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-29 05:41:48', '2022-03-29 05:41:48', '2023-03-29 10:41:48'),
('0a5c4ab5457fc7f36e0d4fe33d546c16aa8bd0c2cd50416c272f9af758c16737ab866b977b383280', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:44:35', '2022-05-16 15:44:35', '2023-05-16 11:44:35'),
('0a9006fbfe73f689bebef38bb2fdd4772d08d2a0c88a4be625ddcb0216f9ebb8b12cecb5f589a2db', 59, 1, 'Personal Access Token', '[]', 0, '2022-04-11 02:12:15', '2022-04-11 02:12:15', '2023-04-11 07:12:15'),
('0ae613ced59ee7879feed0d32287e9099c780989b910a814d371ddd2cab3df0793b0f9cbcd216dd7', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-03 03:55:45', '2022-05-03 03:55:45', '2023-05-02 23:55:45'),
('0af8f61003255d868583cd39f06b6572baf3520a8362501c3c61d77dd3ab6dd5fa54ae210b20d700', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-14 05:47:00', '2022-04-14 05:47:00', '2023-04-14 10:47:00'),
('0b21c3b76528142a5ad0e3a0110e08ba7421416f15c1f741e67cb08144b0fedfe0a79f6b3573a17c', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:07:50', '2022-04-05 06:07:50', '2023-04-05 11:07:50'),
('0b56b3394d3dd131f192ee2a3ff3e2743d91668f927a499cac4211b50378e47d9db23deef7007416', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 04:59:19', '2022-04-25 04:59:19', '2023-04-25 09:59:19'),
('0be37766cac9b5c1645cbef7f68016135c8f48e83d4ae92f6d214d3d892444e144a0b1c5d40bfe56', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 04:59:36', '2022-03-24 04:59:36', '2023-03-24 09:59:36'),
('0bfc457d99348e315952eb9554331fe21f244e9780f8510d675aed10e7c1874a5eaa4172186910fb', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-04 06:49:45', '2022-04-04 06:49:45', '2023-04-04 11:49:45'),
('0c4fcd738f3bb3cd0f94b3ca2931104c70744632c16bc8f22f2d024f907949d3ac3c51b8cbb32c4a', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:27:59', '2022-04-06 02:27:59', '2023-04-06 07:27:59'),
('0cfe73a694090d60093ae03cac21e33f154b20c307f5a8e12fa3756563756c527b33da8252fa615a', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-25 21:03:32', '2022-05-25 21:03:32', '2023-05-25 17:03:32'),
('0d586906c71249b02e1443878f738a6cbdd030a60a87f53e21ec047ac1ca476b6de4fdd2c7c96257', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 08:00:05', '2022-03-22 08:00:05', '2023-03-22 13:00:05'),
('0dbd3b6cbd52bdb3930008703e8077d364b27764df55a1c694c351075f30b1ecc2e02ff1b29102f5', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:31:42', '2022-03-30 04:31:42', '2023-03-30 09:31:42'),
('0f0417dc2301ee65904776af38cbf59a93cbb9b67ba31e53f496ffb670ebb6968903b93701044462', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-12 17:55:31', '2022-05-12 17:55:31', '2023-05-12 13:55:31'),
('0f8d2955ba90c14877b91e01abc8dc38476156adfb0ed4c2bc5813ee5681c832d426034990de195a', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-13 20:00:39', '2022-05-13 20:00:39', '2023-05-13 16:00:39'),
('0f9c81d58b5786bca753df9b3b10764f8ac1dda9f742ad1db464f92480bd28db4db905f1ccfcdbcc', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 15:06:39', '2022-05-16 15:06:39', '2023-05-16 11:06:39'),
('10783aedeb244622c58ade0e2cb1b764ba95be9ac47afd2253b2dcb56053afa46b61851309b89024', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-26 04:32:12', '2022-04-26 04:32:12', '2023-04-26 09:32:12'),
('10cf72f4966a34bdd976ef0c3bd930a22329d88210f7c22cb84f89be3d72de7bbb1031b6a2c963a5', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:54:28', '2022-05-16 11:54:28', '2023-05-16 07:54:28'),
('10d2d1aeba03f56cc496f5d5f7d57d0919bc3781a43c248a156a74ce71d4b26fdc73993b2da51114', 36, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:20:41', '2022-03-30 05:20:41', '2023-03-30 10:20:41'),
('10d4223cda4a024c29ab4c68cdca2ae3a39b3e339f5f3d582387581332674a95dd78a7bd733a5fb0', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:56:34', '2022-03-24 04:56:34', '2023-03-24 09:56:34'),
('10fb288ed09b7a6d6a8b7f984e25fe76bafaf77604fd5557d6e421b35caccbc681b313b9a45be6f4', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-27 21:23:08', '2022-04-27 21:23:08', '2023-04-27 17:23:08'),
('111061b2c5947cf43c066e75517fba47fa770b4eb7443a9212ae36453293452b0f3ab02c673268da', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 14:42:02', '2022-05-16 14:42:02', '2023-05-16 10:42:02'),
('11115f5d7682270d7b3da70df9cb4baa999f8bfcd2f867bb02e0d8451c98beee3e3fc8801bc47cbc', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 16:39:39', '2022-05-09 16:39:39', '2023-05-09 12:39:39'),
('11b766fee8da651a2f481d72fb4a72234775be1a2e4904a0880b1d28195e4e933e11694b78ae452f', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-17 16:22:03', '2022-05-17 16:22:03', '2023-05-17 12:22:03'),
('11c00a58a3a2211cce824ad43ee9c8000af7225d00d2fd0b5077c6e24050971086a2c21bf3f7e987', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-18 20:44:18', '2022-05-18 20:44:18', '2023-05-18 16:44:18'),
('1220528040bbfce50f53585e09f63429d86f9b481b00b7e46c6de4b45b9c75d185c72dec454533ad', 59, 1, 'Personal Access Token', '[]', 0, '2022-04-06 05:06:08', '2022-04-06 05:06:08', '2023-04-06 10:06:08'),
('127740e0b93f993f4a817f05b7c261cc30a4fa8ff8a672639326edc6defb65af16fdb9010edf8eb1', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:26:25', '2022-05-19 20:26:25', '2023-05-19 16:26:25'),
('1321fc069e8195bcd38ead315a1320131a0df1f5654f4058b9305af7781ffa6d85e50dcad610bcb1', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-27 02:45:01', '2022-04-27 02:45:01', '2023-04-27 07:45:01'),
('133b3f511ef2ca6e8c92a55d42570e84ce8efe8dd145909914db8c9a39cc6d657d839eda3e3e689b', 85, 1, 'Personal Access Token', '[]', 0, '2022-04-14 03:53:16', '2022-04-14 03:53:16', '2023-04-14 08:53:16'),
('13968c5a4b835855162592925d2548d82fbc0c5fa20fb5195f139dea6f1479eddf04a21db9ef188b', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:34:24', '2022-04-05 06:34:24', '2023-04-05 11:34:24'),
('13dc9323e101e42d281ac0d99f80edc54bf7cc0835c4bd14ecf3f852acf67d4cf958854650f1ebdc', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-14 04:46:49', '2022-05-14 04:46:49', '2023-05-14 00:46:49'),
('1465f3886c6b60a517c5d01aef270ad14c9d72b8c14eed73c1f77daaef69c3f121917abb1f32dea9', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 20:19:10', '2022-05-13 20:19:10', '2023-05-13 16:19:10'),
('14c428f6b9d33d121eb68a9b7fc12ea7b59d9d9c4007f5bf41d3927461ce10992de6ddc36fc77725', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:16:51', '2022-04-05 06:16:51', '2023-04-05 11:16:51'),
('1506bc9909c9524bf4ab0b94db5b4cd23269f9da4949fae8ce0c0a480321c54420480f6b45b41973', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:36:16', '2022-05-12 16:36:16', '2023-05-12 12:36:16'),
('153009d9fbd067773ec17b8a1abfb4ef6e6bfd663fb37d1d508ed49613eccc48d8a2155be2099509', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-10 11:44:11', '2022-05-10 11:44:11', '2023-05-10 07:44:11'),
('15452fda863ac789030843ea74f14a3ee3477866ed718a57fe8fd1da53439f843448b02ffeedd83c', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:49:16', '2022-04-05 06:49:16', '2023-04-05 11:49:16'),
('155ab07832087f66025dc35bdd8211782a8e6a63755cfe4189de3bc6e77c7c734bc982887d35dc9f', 73, 1, 'Personal Access Token', '[]', 0, '2022-04-07 13:22:57', '2022-04-07 13:22:57', '2023-04-07 18:22:57'),
('163829a09f6b8f5ec010bf3dbd04c469ced06ed8565b43988789d337aefc4202c60280a53bc59587', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:18:57', '2022-04-18 04:18:57', '2023-04-18 09:18:57'),
('166529e4594ff82dfd2e789ff993ebb772c69a100debcf4c823a8a5f333af6e0780f03a405e561b2', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 05:52:31', '2022-04-18 05:52:31', '2023-04-18 10:52:31'),
('16952dcffa48e7a4947cf208e8937021c2613093a200c616f2453d09aa4e212d47c481442b7b17b7', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:58:24', '2022-05-16 11:58:24', '2023-05-16 07:58:24'),
('16a158a290b326f7aa682714867f4692d15506e37aef2a2b3500fdb3298d63754be681553541bbb2', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:29:48', '2022-04-06 04:29:48', '2023-04-06 09:29:48'),
('16d354725cfb2dca3cd6c7bc34c7a2d4149853fc3cef0478cd5cf5a61af41dbb540585c6cf27cb51', 59, 1, 'Personal Access Token', '[]', 0, '2022-04-06 05:26:00', '2022-04-06 05:26:00', '2023-04-06 10:26:00'),
('176e49add57856a5514c4c7e5663b85c7a279b68aca1d5847574b94bfe24caa04864f6f8d0e75a4b', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-07 18:32:57', '2022-06-07 18:32:57', '2023-06-07 14:32:57'),
('1773f2a08e22c024bf7e6677876f66cfeebefb546b2d8f4b766aca93e01d6ad5bad700e8c05482f6', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:31:29', '2022-05-18 19:31:29', '2023-05-18 15:31:29'),
('17847de60b566696293d47631f4b8919da41ecc014b89f0cf842e0e39ace65ff9ec7d7ef6e090e8b', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-15 02:11:43', '2022-05-15 02:11:43', '2023-05-14 22:11:43'),
('17966dab08e7fed807b340b674d5b62f2e92493e3f3be53510bff6e3f2a559955f13fb228184c307', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 15:46:48', '2022-05-13 15:46:48', '2023-05-13 11:46:48'),
('19b3344d86438a07ec8360a50c17176acc8085b78bc560657221ba4c4003161dc3e9f73b85f0fab9', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-14 18:53:18', '2022-05-14 18:53:18', '2023-05-14 14:53:18'),
('19e14f52b3c9265b40b3f49385ac4e861c2378e847749298c41968efdf87ca60e753ccfcc99f2b82', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:25:40', '2022-04-06 02:25:40', '2023-04-06 07:25:40'),
('1a19f351f1a26ab4d650315d431bbd9b4ee160e0f001fb0b01dcaa745c13d29363640997c3bb3d74', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:01:43', '2022-05-09 22:01:43', '2023-05-09 18:01:43'),
('1a3f8ea3e1d30da41855cd5df396455b100b9d9983f9ce75a76ad9495a4d61db20b9326e10700458', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-10 17:12:00', '2022-05-10 17:12:00', '2023-05-10 13:12:00'),
('1a60cf1a2a655cdca7cb47e0f8754f3eb49b9a8d65fb07a2126e1dc1acfddc58706d5208fe8cde68', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-08 06:07:28', '2022-04-08 06:07:28', '2023-04-08 11:07:28'),
('1a6cd64222333ab6fdc244373ff7be107568902e3deda6205ad9c3fedddc5555dbc67a8337dc2e8b', 59, 1, 'Personal Access Token', '[]', 0, '2022-04-06 05:27:28', '2022-04-06 05:27:28', '2023-04-06 10:27:28'),
('1abc6d02ebf78f8bc56140a801a1fb738449d73f1d075e05b7428f362f226dad6b72c088e4deec18', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-08 03:50:04', '2022-04-08 03:50:04', '2023-04-08 08:50:04'),
('1ad2efff6ee56ef833da16b0b78bb172c13c5871d2f1751ab9ba7f7e4c4bdf0facff73ddf18c27a9', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:42:02', '2022-05-09 21:42:02', '2023-05-09 17:42:02'),
('1ad8c59337894c39566df76f8a27bbd33bc5701c780e7ecb16bef681967d56eb22d679511c921151', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:38:29', '2022-05-16 15:38:29', '2023-05-16 11:38:29'),
('1bca4c74df140b128c14b636d997a0d7f7c57ec33c5b9ed7df44c74dfad6e41f696b830a04e94805', 31, 1, 'Personal Access Token', '[]', 1, '2022-05-05 16:22:25', '2022-05-05 16:22:25', '2023-05-05 12:22:25'),
('1c2ae0ace4d1fb69a4575117acf358d664c0afa4e1400b62ce36d237a5ed336036ef40128d9ec101', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 09:47:55', '2022-04-01 09:47:55', '2023-04-01 14:47:55'),
('1c69ae6a84149e74f8376ce4547b0a94d565ede45abaf04f018b59c233e22a21fb4254d7e99a370f', 62, 1, 'Personal Access Token', '[]', 1, '2022-04-07 01:17:10', '2022-04-07 01:17:10', '2023-04-07 06:17:10'),
('1cb9bf11b7cc8d70b2b6107e3a1150671557802546803bc10bcb3da85a541899c1255723c4166f5e', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:42:36', '2022-03-24 06:42:36', '2023-03-24 11:42:36'),
('1cff5313c747d3c2cd9a19f831923f5914b231cae20e0849c6ed26d613d499b40c0140d661871f14', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:22:41', '2022-05-18 19:22:41', '2023-05-18 15:22:41'),
('1d41c5266ae8cf03c6922c17e0a21fd4a61334d9bf8795ce828f44bab8f02259e88d1a996efb30bc', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 09:48:51', '2022-03-28 09:48:51', '2023-03-28 14:48:51'),
('1d432f2a16738fb8bd323747a281b63848bf0e07e1426fb8ca91b1297b28d8480cbba4592f2e62ca', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:27:24', '2022-05-12 16:27:24', '2023-05-12 12:27:24'),
('1e233113231085829933b3681702e6fe2aa47948182a5c73d1a3bfe42012acb49e4c819aee5e87c5', 59, 1, 'Personal Access Token', '[]', 0, '2022-04-06 05:35:42', '2022-04-06 05:35:42', '2023-04-06 10:35:42'),
('1e2725c2b1231033251c16e41041737d1d30314f9a05644b00dd10f16e8f8ccda3c5469f7f333b44', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 15:46:48', '2022-05-13 15:46:48', '2023-05-13 11:46:48'),
('1e283170422cba985dc82aea7c3ace7c767b93b345b548f6bd8a4a70cc8094bb11c80b107b682c74', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:41:55', '2022-05-09 21:41:55', '2023-05-09 17:41:55'),
('1e63056e05a8c9e546970f4cac1c3619699e712502916c1c4d02728fd189ea65b1be5764dd337914', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 14:07:09', '2022-05-13 14:07:09', '2023-05-13 10:07:09'),
('1e71c3fb7d013b2ef5ef486d2edf3f5a2a40f5a2377388b14bc719761791b587fb1d5c5db2412653', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-19 21:10:58', '2022-05-19 21:10:58', '2023-05-19 17:10:58'),
('1ec50d1971dfd0b7fe7ae949d74293f9c019b44b5bc6fc72b006077165c1f58b2bd77a4df113d6e4', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:45:52', '2022-05-09 21:45:52', '2023-05-09 17:45:52'),
('1f29dc940209aad89a6e39b2c74ad78cf36cbc95255dc583f4c71df9f5c4b7a83dff8a0f9e3faf35', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 13:09:26', '2022-05-13 13:09:26', '2023-05-13 09:09:26'),
('1f7f6feb56f362df8c3d908094d9b7c559250270b68d2c7c570b5edae5b6e3f38d392600cee3b59c', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-01 05:02:47', '2022-04-01 05:02:47', '2023-04-01 10:02:47'),
('1fc7d68169152abd3fdb7657d028edd780aeea46491d1ba4a69194436bf21611926f7d5ffe5f6f91', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-27 17:41:28', '2022-04-27 17:41:28', '2023-04-27 13:41:28'),
('20c56a1b2db132fb75342dff4c92f8c4ba949e5128c6b05cd46f493cb8b8afe6f0298fe21078e1cd', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-31 06:11:50', '2022-03-31 06:11:50', '2023-03-31 11:11:50'),
('21e3df8cb6885830357aad01a70fab25f5dc31a14bb947613d9d81f75ccc010d68d297ec83bef587', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 13:02:26', '2022-05-09 13:02:26', '2023-05-09 09:02:26'),
('223455ed527f777b19d045779e802a7dd4907a4634edaf562d815771e63e55f440c19452bbdb6af6', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 12:08:30', '2022-05-16 12:08:30', '2023-05-16 08:08:30'),
('22801a9143a390769f09cd7cdab73e8df86e759c65eded41eb1844096d4fa1823d96d25082cc6723', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-30 02:42:10', '2022-03-30 02:42:10', '2023-03-30 07:42:10'),
('22a8dd0bcd2f4cc38824051c34a45102e0a8f5a35e1f3d934f565014b4788efa1fd22be26a3d498b', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-25 04:23:07', '2022-05-25 04:23:07', '2023-05-25 00:23:07'),
('22b5908600239519978365aca4932b491437e1177ae80007c035f2b9d19191f67107dc1c3fb7936b', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 05:41:02', '2022-04-19 05:41:02', '2023-04-19 10:41:02'),
('22c4b360d07b943a221103a769693d6e16ee074234acfea60efd9774344055f69a420ee453e58175', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-06 16:15:40', '2022-05-06 16:15:40', '2023-05-06 12:15:40'),
('231a8cfc07ed7e048aa2d8fb5c3672783461e44f665f751ac9364cdfdc3f9addf3b5f36d862a1b59', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:42:13', '2022-04-05 06:42:13', '2023-04-05 11:42:13'),
('24072425ce06afcc001ec52c48531260254f4ed81464efd68008620eb6f18c937a60acafa17d0926', 17, 1, 'Personal Access Token', '[]', 1, '2022-04-01 06:18:16', '2022-04-01 06:18:16', '2023-04-01 11:18:16'),
('245b9c949d3057a8250746f89f89c0264d7af3960692234b3e5f6edd8a83acab35d48ee43d4d17be', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 20:19:10', '2022-05-13 20:19:10', '2023-05-13 16:19:10'),
('24cd5972c57f4843ccc4fcfdc4f1af68229104a2a65cda252e449c98f411d06044e57f115864ef47', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-12 20:37:40', '2022-05-12 20:37:40', '2023-05-12 16:37:40'),
('24e5411753fba76e8616e582ffea357e184bfda59cb3d521224f90767dc716770005f573422550ad', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-19 18:39:06', '2022-05-19 18:39:06', '2023-05-19 14:39:06'),
('25bd06c2c1a68218beb783c0962cc1a2e5e5e24ceb4f63c786b7c5cbb484a77768b40feb5884e838', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-22 15:40:13', '2022-05-22 15:40:13', '2023-05-22 11:40:13'),
('26549ec61555e1d6a7d97456bd8b11e05fb2be3acef5cab8712b87e4132a5912fc6031e09316dc09', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-05 16:44:07', '2022-05-05 16:44:07', '2023-05-05 12:44:07'),
('2665767f3a3bc5be1bba0f52e08007cf4180beee606838b308b711bf80acfc1113715ce033cf86a5', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:42:02', '2022-05-09 21:42:02', '2023-05-09 17:42:02'),
('267e0a41cf77468a6e4d106ba8c4733b48425b1c4c244d6f0e6f5af51f4353d2b7a6326f77a1a9d3', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 06:09:57', '2022-04-18 06:09:57', '2023-04-18 11:09:57'),
('275c46bb89259cb91a38ad56eba7b10caaa71357f5fa4017da69c8550f879444369d4ec1f2c0017e', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-05 04:29:07', '2022-04-05 04:29:07', '2023-04-05 09:29:07'),
('280a2a2ff3b1397415d3e7e75bda0bbde2860ae24c53e2ee61a3a1f2a7ae00e0077b137cc06fc975', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-03 14:00:14', '2022-06-03 14:00:14', '2023-06-03 10:00:14'),
('28941cb8ce0c445f016c1a1aef3a5b5c1427ff41af175e4b97e1228b826bce439d6755797fbba355', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-13 17:17:10', '2022-05-13 17:17:10', '2023-05-13 13:17:10'),
('28d5134f7193b00fc7b117cf39e2c4a7a1dd75f925f74601c16e6759657f3d4afe9e6877ead41ec1', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-06 03:56:35', '2022-04-06 03:56:35', '2023-04-06 08:56:35'),
('297d89587c2c604a8eaf9b1db615238e470d19953c0a91ff68e7c17b9219599aa23aa0b0b528fa72', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 03:58:16', '2022-04-06 03:58:16', '2023-04-06 08:58:16'),
('2a5b359775482d94d1e31ad9954465f1850189f23a8da29427d95370d367c5e365eb43b5e9306b5b', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-20 15:59:37', '2022-05-20 15:59:37', '2023-05-20 11:59:37'),
('2add71229d69aeaa6ddce25f80aed78fafaf8300fa3dea9fc82e39cfc0972ef808d751a4edf37b0f', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:40:15', '2022-05-16 18:40:15', '2023-05-16 14:40:15'),
('2be079442f4fbf969ceffaf47c87463aa265af146a95e1eb9678701735f6c0cfb623a669043d7c9b', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:12:06', '2022-03-28 06:12:06', '2023-03-28 11:12:06'),
('2c1ce5b40d48a866448380cc39ca7e746e56afa33d1412bf50e736705f9d88db2f95fff6175daaa9', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:50:36', '2022-05-10 12:50:36', '2023-05-10 08:50:36'),
('2c239a8c3efec9ae65a74fdac0a3c4e6918472e5927bd8847b5c5367a1d09cdd3c000a2c17fe6c59', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:07:47', '2022-05-16 15:07:47', '2023-05-16 11:07:47'),
('2c572c157a413c8eeb700f2f84a9cb5d145490f663379f3f61d75c395e663ea867e1e513c52a0694', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 12:22:01', '2022-05-12 12:22:01', '2023-05-12 08:22:01'),
('2d832a36dcfa9f11aae74c821cfa9aab4463d1bb4d6ece0d1f9875f7cb65f6fe9d74a61a464455b8', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:25:31', '2022-03-30 04:25:31', '2023-03-30 09:25:31'),
('2e117370e89c8c8e3afc7ba25626ea6ae50927a12bf45f25d295923d23749fc764a326b35b01f2e3', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-27 17:58:04', '2022-04-27 17:58:04', '2023-04-27 13:58:04'),
('2ea23688f775aec0bb09ea0e9f2f196cbe9c61cc408a487b8b3d310d0a942c095f8b406c92185387', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:40:47', '2022-05-09 21:40:47', '2023-05-09 17:40:47'),
('2f39bfed7b5a05c6692f48001205514f12fca808d5c0970919d03bc2540a79662e7d196bdefc8660', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-15 01:54:43', '2022-05-15 01:54:43', '2023-05-14 21:54:43'),
('2fd6dd2567f60a9ee210e315b4f73d63f3307bd1226b6c7a6a97930552d926263b7dfd12ff3bf027', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 01:54:38', '2022-04-19 01:54:38', '2023-04-19 06:54:38'),
('2fe399b919cbc853ae13dfcf206f826485989c67414b077cf96482871b71310ddea09ce7cd708192', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-12 16:33:55', '2022-05-12 16:33:55', '2023-05-12 12:33:55'),
('30217201df463edf2a8f960d0edaec65193d3a671761c3fbd70ae8780e0f852ea47f780f6a700cd5', 84, 1, 'Personal Access Token', '[]', 0, '2022-04-14 03:50:47', '2022-04-14 03:50:47', '2023-04-14 08:50:47'),
('3037f8cb538776da11d96550237dd3f1487a231baef63bb4c5226fd69a42d13ba9a3b494d49f6275', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-12 20:55:21', '2022-05-12 20:55:21', '2023-05-12 16:55:21'),
('310d17a79f39f45e88db3099104b2f252945746bfcb3a6a8f5a4b604e62888def5782998b8f397b5', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:59:35', '2022-05-19 20:59:35', '2023-05-19 16:59:35'),
('31668c654155d99bdcdc7d4cf4cbbd58db46ed49548f163e006383aaddf00f81557045d1dd2a5493', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 05:46:28', '2022-03-25 05:46:28', '2023-03-25 10:46:28'),
('318e84b7e91c182cd7361d27149cd37f6fc960522474f3363f7ca665e3f9975dceef10f333fecaaa', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-07 13:58:32', '2022-06-07 13:58:32', '2023-06-07 09:58:32'),
('3211653d5a8804d80390004fbdac7e834404f570bf741c323f955d9cc46906ddad926a8bd10ecd19', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:40:13', '2022-05-09 21:40:13', '2023-05-09 17:40:13'),
('32637c6e746b81e3474c67b0296521c1775dc5b0a338f21b4d75fa939bbb6cc0fd01a755060dcbd0', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 18:48:06', '2022-05-13 18:48:06', '2023-05-13 14:48:06'),
('32768eb89ee08311336ace61daf17c49d5de67c02ecfa1b40b80a3c0204a5f6f9af62c0865e7c224', 88, 1, 'Personal Access Token', '[]', 0, '2022-04-15 04:30:28', '2022-04-15 04:30:28', '2023-04-15 09:30:28'),
('329fdc8dc71ff6f4790e97292dd39bd89377a2bc124ea9682d9fc6cfd61f38c9eaaf500bf552dd98', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-11 02:59:52', '2022-04-11 02:59:52', '2023-04-11 07:59:52'),
('32eb2beeb8b6c20fe24824b997baf8b9ec19bec9b47b78c2b0d4e0a6d5dbc5bcb141afde0806efbe', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:27:53', '2022-05-12 16:27:53', '2023-05-12 12:27:53'),
('3323aa828881cdf8765b80807998d0190f9c5cd42f6e6da3c7a942bc9bba6397678c91f4bec63130', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:55:36', '2022-05-10 12:55:36', '2023-05-10 08:55:36'),
('337776971169117869053955415156f5fa091a43f05c6ea438cd4cc1124d33293f818581145db7be', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:37:27', '2022-05-19 19:37:27', '2023-05-19 15:37:27'),
('3391374639d95930ac24266518d1a961396a470d258d0ba8164901ddbad2e1905a6bfe129c9699f9', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-07 14:42:48', '2022-06-07 14:42:48', '2023-06-07 10:42:48'),
('33b8af8556e0424203b82b070f249ff9056b925cd47343b093f4def9f26f36b760dc122c24ec4854', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-13 07:11:55', '2022-04-13 07:11:55', '2023-04-13 12:11:55'),
('33ca86c986f6ee777e0c5b2967fdbcac1e370d9b2f043ae37c54d227a8a1919fddef8a129afd62ae', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:57:37', '2022-05-16 11:57:37', '2023-05-16 07:57:37'),
('33d37d823416e8e70a6bd21054db5b4a04504d3ecbd2b204901f83b484da959e06b5bbf4ccfbf697', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-30 09:09:14', '2022-03-30 09:09:14', '2023-03-30 14:09:14'),
('340ed00a36f378be7420a4be55e74dfb8054fb932b848a1046f255d4b52744899aa9eb35f68ffc3e', 34, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:39:14', '2022-03-30 04:39:14', '2023-03-30 09:39:14'),
('343b0c359f735fbd01cc5d47d528156aea5de89f84c0f13f85ca8eee3e40862a8f1b16a96e41acbe', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-11 05:59:55', '2022-04-11 05:59:55', '2023-04-11 10:59:55'),
('348b128d7f181103e7b1d82c25d696006108281e01d76a5c73ee5abb12af363a5a2320278a32217e', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-07 06:29:40', '2022-04-07 06:29:40', '2023-04-07 11:29:40'),
('352f41e2460bf11c1664e293b6df9581afc4edb97cecccabae10f19ecf8d83a346dca3ddd715085b', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-29 05:41:50', '2022-03-29 05:41:50', '2023-03-29 10:41:50'),
('3534addcdb160e9e60ed34a98b407824fe9fff50474ecdbaf47b7ee82aa8ae353c8ef51869b59240', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-13 19:58:02', '2022-05-13 19:58:02', '2023-05-13 15:58:02'),
('35613f3870d44d148a9f7b0e7cf30152dac325daa6b0a5fdc69dc4812fd228cee557d76a4f3173e7', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 03:54:41', '2022-04-06 03:54:41', '2023-04-06 08:54:41'),
('35f547ae151bf0c019c7db7926458194dc8a5ac48082bed5a2908847d77bd93508bf09cb99b04a90', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-20 10:47:28', '2022-05-20 10:47:28', '2023-05-20 06:47:28'),
('369f41032b14eabc30e3a05fc072c5dc62cc532cd3c04a56e11da4131be6f35e6aeac09931a25a0f', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 07:59:09', '2022-03-22 07:59:09', '2023-03-22 12:59:09'),
('37637cceddd346573c154bcb03d1ca69a653cc605f204d89349c5ddd87b10b49ff2576e4bb488d05', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:27:25', '2022-05-19 19:27:25', '2023-05-19 15:27:25'),
('379dc99389bce8c340e22a2543093fd4b46257abc4748818dc45546e698af4beae8ea3b6db87f6a9', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:50:54', '2022-05-10 12:50:54', '2023-05-10 08:50:54'),
('38174c0f083a6c6adb61daef02f58a0a0fa04d63e34f1eb5a19aeb1cdda075050dc6f7effcc64b6c', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-22 15:38:53', '2022-05-22 15:38:53', '2023-05-22 11:38:53'),
('384fd55129863a6f2fb5146119fed2b9848c1a800a7ee240e43eecb8c2f377e9500660f5a87280f1', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 05:47:47', '2022-03-25 05:47:47', '2023-03-25 10:47:47'),
('39db5ea2e072e220064f9045a1a45212cd772c9ca1eb14fb51a9e300baae5f00fb320f5ef9b83bf0', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-13 20:00:39', '2022-05-13 20:00:39', '2023-05-13 16:00:39'),
('39ff9136f862d9177faa1175986899a5b0dafa3c43943c5a06386ba82d22b5a6a831aa57599a2404', 86, 1, 'Personal Access Token', '[]', 0, '2022-04-14 05:06:21', '2022-04-14 05:06:21', '2023-04-14 10:06:21'),
('3a055abeeb1d8ac4d8e6a90f4a8e357a654d659c0e4769778861442493ec42a9e6bda1ebc27d4c04', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:30:41', '2022-03-30 04:30:41', '2023-03-30 09:30:41'),
('3a5eb140c7ad7187a747598c2cd9327371b04117f36e07896e0bb254eb41120ca3ba37f3e8a35d99', 39, 1, 'Personal Access Token', '[]', 1, '2022-03-31 04:57:32', '2022-03-31 04:57:32', '2023-03-31 09:57:32'),
('3aa040ed012d8c0aa9ac6cc3772d615e979def57e8151edd6b3bf013e1cece146b8706d9eafdb2ae', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-17 19:03:01', '2022-05-17 19:03:01', '2023-05-17 15:03:01'),
('3adf6ca58bf6d8d77e30966e38c8ddacd1013c08412affddb6d8cd7c303a985f7d740df0762f2c1b', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 06:45:06', '2022-03-23 06:45:06', '2023-03-23 11:45:06'),
('3af51e2a8f0b093fdaecb6528e12a5f655feea5c3a3cc4503437cc40a880a05be013d79a5483fed9', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:40:21', '2022-05-09 15:40:21', '2023-05-09 11:40:21'),
('3afa499a57138388aa53e4fb23d029d5b2154a6021eefe86f7379e9aaeb6ec259e525f32c25019bd', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-07 05:15:36', '2022-03-07 05:15:36', '2023-03-07 10:15:36'),
('3afdfcd56ef5bcf7c9a92798c99d609f60ae1f1795f44ac1189e5897d361e18def533ff9d7614692', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-14 02:14:30', '2022-04-14 02:14:30', '2023-04-14 07:14:30'),
('3b986a249ac8237c8615806970561ee6c59cffd6dc0dd751c0faa644928c2d2b950dde154b638b7f', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:53:25', '2022-03-28 06:53:25', '2023-03-28 11:53:25'),
('3c0c2a40ff0e91ddc26890527b813ae94a47e2a692a41e5f98cb7613c6ff128b381c9061d78df139', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-11 16:21:55', '2022-05-11 16:21:55', '2023-05-11 12:21:55'),
('3c0e5f41a4f8af5e3ad0c45cc38707494da06ea89d510be872f33d41ef6294546703f228d546ef04', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:15:00', '2022-05-16 18:15:00', '2023-05-16 14:15:00'),
('3c250ce3dad667e1bdf008725e9ba342185eb591582baeed941866caba08deb7aeef8dd6482908ea', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:04:35', '2022-05-09 22:04:35', '2023-05-09 18:04:35'),
('3c5479e9e2e36051c5dffe8bdf787c2367c9a48b8292497961ee94ead2f1ef9eb2201b8271587f80', 104, 1, 'Personal Access Token', '[]', 0, '2022-06-07 15:47:14', '2022-06-07 15:47:14', '2023-06-07 11:47:14'),
('3c5f015a7b333aa1a8306e7355ed247f4f3db2151534122485d5790966cfc2147ce5e49d2bd6b5f1', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-19 20:48:27', '2022-05-19 20:48:27', '2023-05-19 16:48:27'),
('3c9f6436224966b24041c20f1435ee1d4ccdaa35430be5189c4354ca7e1655530400b3bad1485752', 13, 1, 'Personal Access Token', '[]', 0, '2022-01-11 05:54:03', '2022-01-11 05:54:03', '2023-01-11 10:54:03'),
('3d71be57c853e659cfc6d5c84a9123a9229bbad9cd22a42c4232ddf247b9df23057ceb98d698d41f', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:42:14', '2022-05-09 15:42:14', '2023-05-09 11:42:14'),
('3da1bdc9e2501e1e5ccf666f35ae6e8410745be0ade91de986c5b04821a401ed7f352cf298b34dd2', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:10:01', '2022-05-16 18:10:01', '2023-05-16 14:10:01'),
('3da469a8c0a6737e7c5f4ee021437aa8890541bf363e81d150158866b87dac66c8fa295aad93ddbf', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 13:34:06', '2022-05-16 13:34:06', '2023-05-16 09:34:06'),
('3db4dda95d476013a384696d2e7b8b2e8480f1c7e7dc43d40b2e001584c43c1d2e08b6835ca60f7f', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-08 00:58:00', '2022-04-08 00:58:00', '2023-04-08 05:58:00'),
('3e048c528ac66822b2244019ffb0dbbc399fe973257b8dfb1b45efda00e340999e7a93152e37f868', 7, 1, 'Personal Access Token', '[]', 1, '2021-12-29 08:01:13', '2021-12-29 08:01:13', '2022-12-29 13:01:13'),
('3e69ad60f265e180c4b35c2aa1efabc4f41da8cb55796f51d99648ab2698a09413322f9b643e8056', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 17:51:40', '2022-05-16 17:51:40', '2023-05-16 13:51:40'),
('3e6c86dbb59e1b817c71d60a6b2925141034b4dd7e8040737534f3778a7d2bfcf9398f7b965945cf', 34, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:33:40', '2022-03-30 05:33:40', '2023-03-30 10:33:40'),
('3f2289e1d6adb87d347a1eba775c15a42f8dd50f3d07e83d5bdf05060932733195787467b7ef2b73', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:02:48', '2022-05-16 18:02:48', '2023-05-16 14:02:48'),
('3fbd3360bb12a9c0f44977a229a701b7fa16454b91deddb4343412b75a795c1129040e5455a024bf', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-31 06:06:06', '2022-03-31 06:06:06', '2023-03-31 11:06:06'),
('4068d299a7127c0603836843b21e1a29df6e2bed7d4d2856d85007a441b71e16430c0c89804dfa56', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-10 11:44:11', '2022-05-10 11:44:11', '2023-05-10 07:44:11'),
('406a402effcb33301de32edb10b404c73bdf677e833983cfd6ec5f3b323bb916d4f94c51bff69b37', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 07:28:59', '2022-03-23 07:28:59', '2023-03-23 12:28:59'),
('411bb370d4771f8f3f9347de2e68988e4ce685a3f6161cee11d30b35f080116d8e8dc24ffe3f624d', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 14:25:53', '2022-05-19 14:25:53', '2023-05-19 10:25:53'),
('4182d4879a19f2852d7fb7d08fe0733515ce09b0e8521f514dd1076de581dbfe6d9867f0cb295c49', 25, 1, 'Personal Access Token', '[]', 0, '2022-03-25 06:42:17', '2022-03-25 06:42:17', '2023-03-25 11:42:17'),
('4182dafdfc69caf27c8090c513febb7e8917ad9d81430c8696ccb5c80f58c591eabaf6cce6abb749', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 02:00:05', '2022-04-18 02:00:05', '2023-04-18 07:00:05'),
('41d74818d39ded1977087c2d6a7890f8033b811d9ab26a3a4e876ed3b244c7880648a2668babbab5', 112, 1, 'Personal Access Token', '[]', 1, '2022-06-07 14:42:48', '2022-06-07 14:42:48', '2023-06-07 10:42:48'),
('424d56b5c71a3ce28baf83744690e7ff6f5a4cdddfb060f5a96fe0e190639f419f133a1a52f4a3c2', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 01:33:10', '2022-03-24 01:33:10', '2023-03-24 06:33:10'),
('425c85b42997d3fcaf8a385c24756e8618d76af78977b15ea9a1351512a361330268413064a20bfc', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-15 04:59:40', '2022-04-15 04:59:40', '2023-04-15 09:59:40'),
('4305606c4b67426542a8f548c3f12a240dfba67027508f05a0f633d8cc8f5402d5e5b75c900518a6', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:13', '2022-05-09 15:43:13', '2023-05-09 11:43:13'),
('431a395b6b1f6a76deaeb3652fc4405f57bec61a054159756f34f4838d8dd90b8820a2df42211a08', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:19:51', '2022-04-18 04:19:51', '2023-04-18 09:19:51'),
('43290874a98cfa9d18b6aeae574584e27dbb2b52b4885c769a6dcf0ef66dbd8741827b30d599af33', 59, 1, 'Personal Access Token', '[]', 1, '2022-06-06 15:42:59', '2022-06-06 15:42:59', '2023-06-06 11:42:59'),
('438fb32c889d0d29560b95a39a84dee90d3dc2b1817cd58837fff869671f58afba891f17670b8e88', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 12:42:06', '2022-05-13 12:42:06', '2023-05-13 08:42:06'),
('446200488896937b897282679bf81d98d4193c8bf83a69c16aff1e493c4ff8a85b8ef1ec37fb4b43', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-11 16:10:21', '2022-05-11 16:10:21', '2023-05-11 12:10:21'),
('44bbfdf8b42137e9526aea1417c4c8d2ebbce4f577d9f591b9ac5bde73db9c262bc290bc1e7d6c17', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:37:50', '2022-04-06 04:37:50', '2023-04-06 09:37:50'),
('451d6e6fa9c034ead109c25c7fb0e0d69313484bcf0cc97bac4b497efd944f8b84ffb7c5cf9c252a', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-02 18:18:14', '2022-06-02 18:18:14', '2023-06-02 14:18:14'),
('45dbe6074b66dc93589933db8c569ef5aa6880e0518942de14d00e3f2955173f2303701f6f146831', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:21:03', '2022-04-06 02:21:03', '2023-04-06 07:21:03'),
('46266b9c6dcd9fb26966b2b964ada16ce9a0c2364ebfd01d74d69d4fde3de278eeda7a3bc9f84ff7', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-11 03:29:15', '2022-04-11 03:29:15', '2023-04-11 08:29:15'),
('4639a97a99af7821efb79bbe6c2639ca3da36174e8ddb8bc021813cc5c2770615c3172cd0c368e0a', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-12 13:46:24', '2022-05-12 13:46:24', '2023-05-12 09:46:24'),
('464164dd1550e1cf961a7ff9d672c0a8383bca1ae3b318009c0b840b539139a9b61a7f138aeb2158', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 12:04:23', '2022-05-16 12:04:23', '2023-05-16 08:04:23'),
('465e148af70e6b31ef0102b85591bc555ffd149ad89e0169f4806d323ed85d189df777750af4562a', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:17:58', '2022-04-18 04:17:58', '2023-04-18 09:17:58'),
('46a269a930fdcf4263e0abf287b37e2db127cf41999a74c075e33a19c38cb4cada0f378aa56a90e5', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-14 02:32:06', '2022-04-14 02:32:06', '2023-04-14 07:32:06'),
('46b0c33836ee2837de4416258a4d5b4a1da83d7d63296023044d09ac235b31edf218800f843c1fa6', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-06 15:30:37', '2022-06-06 15:30:37', '2023-06-06 11:30:37'),
('4726ca70ae9459f001266bd314f64ff1feef07f9b74cee949489d94a0bef7e256e051181abbf1770', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:05:41', '2022-05-16 15:05:41', '2023-05-16 11:05:41'),
('47304c82096eee806f1cbaaee16c1c72b63cf6498d9cfbcc17b2ec2fa477ee09cafc7ff0f9e99f26', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-07 18:32:57', '2022-06-07 18:32:57', '2023-06-07 14:32:57'),
('473fba024befad53816ae26560e9de997acbbd2ed741468810cf28abe7fa049d3117b72a7786f616', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 14:25:53', '2022-05-19 14:25:53', '2023-05-19 10:25:53'),
('47505a73c48db6ab4f08dbe9bc8d79a83574844d677033cade4dd80c8fd9df956ea0ae85637098c8', 34, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:32:19', '2022-03-30 05:32:19', '2023-03-30 10:32:19'),
('4764260b14ea0d13a5f2d217d13514a39ccc2c710e1220391106a5f06e89c743787fe37ee72293a9', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-25 07:08:45', '2022-03-25 07:08:45', '2023-03-25 12:08:45'),
('48b9b8b128dd47cfb618d924fb6e62c5acf4f47e4c6fc242ba01e38d78068d3a68b6aeca94b7f373', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-29 02:51:53', '2022-03-29 02:51:53', '2023-03-29 07:51:53'),
('48dcf478f9a4748130da88ee25d4d9859a5f42e773efff262aef176ae2f76c9776791655dbe537ec', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:40:15', '2022-05-16 18:40:15', '2023-05-16 14:40:15'),
('49328c2a601216d8527f1fa5c76214df2ec5c1efd29fb7489195eb51e2d997e7e63214ca6dcafd6c', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:19:04', '2022-03-30 05:19:04', '2023-03-30 10:19:04'),
('496f870a24e2c2eed2dc85a8bffc8dc0bb532aa87a755d2e31d083868ddab0ccde96821471b460ed', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-16 04:15:47', '2022-05-16 04:15:47', '2023-05-16 00:15:47'),
('497cb06c71ac9f0275ab424021563fd3e81118a87a3d29c3cd5d903112f310ca2e65651d0b96153f', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:56:26', '2022-05-16 11:56:26', '2023-05-16 07:56:26'),
('499c013a9be0782321c3a4c5cf010afd057b7fd3b9a64007d64f9e51309200772c198ac60e196fdd', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:34:55', '2022-05-09 15:34:55', '2023-05-09 11:34:55'),
('49d3e893814c75a69cae6d85b354dfb27cee23ffc4de30ad0972282774d90a1c78714cad7f7a8f2d', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-18 19:37:29', '2022-05-18 19:37:29', '2023-05-18 15:37:29'),
('4a362934b2e44a48d58d870217a06d9d1f082cc2ee58d8e60098b76e82dfe02ec6bda51c80f08dc3', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-09 20:29:57', '2022-05-09 20:29:57', '2023-05-09 16:29:57'),
('4a431dc10949614e0c9cc8948d6e2aee2679cb3414d10cfbaae6ddb1464cd777338c5fe351ee1534', 29, 1, 'Personal Access Token', '[]', 0, '2022-03-31 06:04:19', '2022-03-31 06:04:19', '2023-03-31 11:04:19'),
('4a7868ff60dbb8fd4aa3deef111a44729eb7ad98e0550025e5da22599fcdb56355e40ca39fb4ae84', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-08 07:06:17', '2022-04-08 07:06:17', '2023-04-08 12:06:17'),
('4aa7d1a26b9b59ca6fd0ac6eb3dd51d99a4e844f96867bb97ca7c8968244a52892d6d323ad00816f', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 11:03:31', '2022-05-09 11:03:31', '2023-05-09 07:03:31'),
('4ae8a0cce328db093f486f4eba8dbe7888a12770411bada27fa7bf372f6ac7c3fe7047147bcd1383', 97, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:43:22', '2022-05-09 21:43:22', '2023-05-09 17:43:22'),
('4ae976d6e1cee26ede25d829d8ec0d3870fa3c47570e217575619bb80a2896cad54147ed7a7f8c49', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:15:21', '2022-04-06 02:15:21', '2023-04-06 07:15:21'),
('4b1bf3cddb1d96e1d1335a82c2bb1bbeda1cb3708fa02e320c34c5120fcf702c94b3fb44a88157f7', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-17 18:58:02', '2022-05-17 18:58:02', '2023-05-17 14:58:02'),
('4b22cb80cb00cbfc8ae192a554adca6d3d45941582da76c1026f6511d38904ba3cf92d8c814c1879', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-21 08:15:12', '2022-04-21 08:15:12', '2023-04-21 13:15:12'),
('4b3049dda42ea5bae32f39f34d585c8f466d718a0f546a6974b3dc25f0a307aa41bfe45d98269167', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-29 00:53:57', '2022-04-29 00:53:57', '2023-04-28 20:53:57'),
('4b3b43cfd852fda48a22029b8897cba13a57ca0e801763f3ff6a89796e82d26ddb24c7e6dd03b568', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-28 18:48:24', '2022-04-28 18:48:24', '2023-04-28 14:48:24'),
('4cbe034fac935f3892d4e28ad612fd557e03dc5b719c5db89c9dddc465e014d07ffd115ac53cb178', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-19 18:05:08', '2022-05-19 18:05:08', '2023-05-19 14:05:08'),
('4d16e36f9b43029958f8c9e349424c918bcf85e365e6d0b3115bcefb17e09046c8e016b1234b6894', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 20:18:52', '2022-05-13 20:18:52', '2023-05-13 16:18:52'),
('4d3ff12120414fd977d90b8e395183ba78cfdc5020f6ca744c35bbc730e2e4d8693bac6ef2572e7b', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-15 06:04:04', '2022-04-15 06:04:04', '2023-04-15 11:04:04'),
('4d985fb802be80032c15302575546fdc48c61cc159ac9277b1d491299e5632d23769696c2be9699b', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:37:11', '2022-05-09 21:37:11', '2023-05-09 17:37:11'),
('4de03be84b207867d88f0721e5a65689322778af58de874529b29984d5626f12595e1f31e61fdfd0', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-20 03:36:47', '2022-04-20 03:36:47', '2023-04-20 08:36:47'),
('4e8dcf609ac293161489630b9c635d652326a1410614b0996adea2024b826f0acb8d41908ae0e0e8', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 06:54:48', '2022-03-28 06:54:48', '2023-03-28 11:54:48'),
('4ea550fe40b0d3e7c002edaafccb207cf3d347f24af00520a8d6ed67009970c969ef18a00a4cefe7', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 16:00:10', '2022-05-13 16:00:10', '2023-05-13 12:00:10'),
('4ed55ad886a6141948a6a39a83ea8ac5cf0cd139b767f53ac4d89d54e0f27193258bc26e21af424f', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-16 20:20:42', '2022-05-16 20:20:42', '2023-05-16 16:20:42'),
('4fce08db21d40e92fc5678f58cf24d3d44c3ede96a197c73af7020e4202f311853819c4adbb5a6f6', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-25 03:43:01', '2022-05-25 03:43:01', '2023-05-24 23:43:01'),
('50001506db23d11157fdb4664202e636b8c7a9e7b72e020411b68ebf4d0ea1dfcff44fe477302dbe', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-19 15:50:48', '2022-05-19 15:50:48', '2023-05-19 11:50:48'),
('5127308b6480a797bc131a48e256519014301b74b1ae66a8deb5064512375f3d86f0d65abeea5575', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-13 08:56:40', '2022-05-13 08:56:40', '2023-05-13 04:56:40'),
('513eb7697fba6e1b14fd1cf2655638992741eca189be2bf3bbfdd785df0d83aa3d4ebc373fb585a6', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-14 18:55:44', '2022-05-14 18:55:44', '2023-05-14 14:55:44'),
('51be471e86b46330bb061ef8ff5f8e378dc0240cda82aa8d9beb3b2d33a28492731b6d6a515ad355', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:00:45', '2022-05-16 18:00:45', '2023-05-16 14:00:45'),
('5245458e6051f48f16fe270c35d4c2447e69d0998efba3aa4e71c86e5285b9e4b3e9f6ccbc13504f', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-20 03:34:48', '2022-04-20 03:34:48', '2023-04-20 08:34:48'),
('5294e4e53ea8db0c2e66a0b0a5b4218a664b064e3c325d88d2f6d366ddd0e2363d48c2c4f962d5a7', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-08 22:45:52', '2022-05-08 22:45:52', '2023-05-08 18:45:52'),
('52d0683e81f4582c5c2b7d90fa050548f12bd6be68b57710fed78d7a574a28d3b6270c8aa7b3ddc9', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-30 06:07:07', '2022-03-30 06:07:07', '2023-03-30 11:07:07'),
('54136b7c26ce635cabd9fa88f11cf1b4f4535bd044eae7b72af0e73e806fc1198ebdc8b5fb9df920', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 12:00:45', '2022-05-16 12:00:45', '2023-05-16 08:00:45'),
('54ae10b696d21a4bba1d6e014b0b8bb616bf451107f4813b8c781abffd899459eb0e7e8ce158f39a', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:54:37', '2022-03-28 06:54:37', '2023-03-28 11:54:37'),
('54b581fef7d0c080f5d045b4bc53b609033c2d5ee6465dfcb10a8763019d08ff246842676416bb45', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-30 03:11:58', '2022-03-30 03:11:58', '2023-03-30 08:11:58'),
('54ef445b55af89d962cf39fb926bc3dbf1a5db7ae1d464588b410d796e450a89fb08a790cd38c346', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-08 05:10:43', '2022-04-08 05:10:43', '2023-04-08 10:10:43'),
('55740ee6c96e51f25e51249fc242ee7e50552b42b5f587677a99a8210dfb04619a0d83145654134e', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:47:54', '2022-05-19 19:47:54', '2023-05-19 15:47:54'),
('570ba89f850852dd8235ab0b050ace724c66c7240387a060986dd60e600161818368475f1945dd11', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:05:33', '2022-05-16 15:05:33', '2023-05-16 11:05:33'),
('5739a204b29edeb8cfab022e3c260b8f81663aad354590f5abfd21e252e1cdd0cf174eac36ca91e3', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-06 06:25:27', '2022-04-06 06:25:27', '2023-04-06 11:25:27'),
('573a76254f9f9406232023545a92ba82a87efc4e6a9ae98b5fdc2bb8f0d1de883dec09b3e14c9650', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:59:41', '2022-05-10 12:59:41', '2023-05-10 08:59:41'),
('578cd90d3d6fc7c3ab60334e7c77ab31fbc1f767b74f672dbd0a23d44b6898fe94a4d819a640ded5', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-07 03:55:37', '2022-04-07 03:55:37', '2023-04-07 08:55:37'),
('579b1e628de84921e541216164bb36f216da7b6a09e1108dcc9f7f67ed44693fb85e0d2ccac63019', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-14 04:49:59', '2022-05-14 04:49:59', '2023-05-14 00:49:59');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('579eec7e4753fca82554e972fd2c38a697bd7ac63c6a2d111e741801958f4ac5db43ec26393ef2ca', 112, 1, 'Personal Access Token', '[]', 1, '2022-05-19 20:59:35', '2022-05-19 20:59:35', '2023-05-19 16:59:35'),
('58982146aac845a7dfa06d8b6d7eab19305450dbaf46b3e31fcfe0cedbb03818f28c197c1c627ed1', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 05:46:04', '2022-04-18 05:46:04', '2023-04-18 10:46:04'),
('59f666cb1f91337c1d126961e81164b98f71086240d313c3a4d8af9c525de6d750d727adf902117b', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-18 19:11:35', '2022-05-18 19:11:35', '2023-05-18 15:11:35'),
('5a10265b0402a896d2534f196ffb774b16446b636783b68374e1cc2ae15018d1bbea157ffcd27358', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:50:41', '2022-04-05 06:50:41', '2023-04-05 11:50:41'),
('5a1f512b1316385f99fbaf55d31e08c3023f45dc00c00cc5cacf47a2d253e9c1205da9ef3c9c51c2', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 04:27:46', '2022-05-12 04:27:46', '2023-05-12 00:27:46'),
('5a55db1093a29b7fd3a72640ea2ed64bb0301d874a383d9aaa52d0b75dada685f08ac58e5952fe0c', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 15:26:56', '2022-05-13 15:26:56', '2023-05-13 11:26:56'),
('5abec7db10dd1261aa499aafcf75323fcc5ba354bf792a4113391e39f0ef9ccef218a41915c7c7ea', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 18:48:06', '2022-05-13 18:48:06', '2023-05-13 14:48:06'),
('5ac2e2b046ccc0f5f1ceed5c2ebf0a51db3ea46a96d3e4a8e5060e7e50a60c36a8d1bba1ede9f1a5', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:06:21', '2022-04-05 06:06:21', '2023-04-05 11:06:21'),
('5af054b8c545c4a7ee2bf8461e8447f2c0fbd5c058bc57246a5f5b009cb8be833c1675a260027099', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 05:26:54', '2022-04-25 05:26:54', '2023-04-25 10:26:54'),
('5b31755f6cb63dbc3a29dafbbda59074cf991e26a348155adabdb6bd617e97ee8a87b222318cc4bc', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-12 12:58:32', '2022-05-12 12:58:32', '2023-05-12 08:58:32'),
('5bbcabc460283cd262347ff8c34feb039b48be8a5707623d104349bfca32be1af49571369a29676a', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:15:00', '2022-05-16 18:15:00', '2023-05-16 14:15:00'),
('5bf44578422daacfb63ead579295583e85f2985b30ba645bd74ecb959d96dc2a8dd1b79bb2d47b85', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:26:25', '2022-03-28 06:26:25', '2023-03-28 11:26:25'),
('5c056dbede166a424dc954e73d9ed9c9cc72ae3a89af877ae4536abc03acd8fbaf7699e32a7c7efc', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:57:51', '2022-03-24 06:57:51', '2023-03-24 11:57:51'),
('5cc88262fd5fc7c5272f6168944319b4f033bf520a466e65f7d1373b30ad21ff556ac85c5a1b277d', 17, 1, 'Personal Access Token', '[]', 0, '2022-04-01 04:37:18', '2022-04-01 04:37:18', '2023-04-01 09:37:18'),
('5cd76ddc2e76a3d74ef042dd6a6513df122cf97da2d5065369211617b82aafcd6e2ad35a2b91cba7', 23, 1, 'Personal Access Token', '[]', 0, '2022-03-25 05:43:34', '2022-03-25 05:43:34', '2023-03-25 10:43:34'),
('5d50d12a03134c927f7b0490237b2b7db711e6664b4277e3274a3a244f09bec6526183eddf0528d9', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 01:49:16', '2022-04-18 01:49:16', '2023-04-18 06:49:16'),
('5e103d1c77c99b5209163331e918a1e0ce461e6db685e4b7c3d828c54cf24c09705ebc3f6aa8aabc', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:40:53', '2022-05-09 21:40:53', '2023-05-09 17:40:53'),
('5e3fcb67cc2ed5114bdfc077d44cb3983681a6c27c01833cbbca87b88e249d8556c84d9db4ea6160', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-13 04:38:56', '2022-04-13 04:38:56', '2023-04-13 09:38:56'),
('5ed728becfec677c82674b506ae0effffb915a37efb4687b76e9f7f57c64d60a6bdfec4a6ac78532', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-19 14:13:46', '2022-05-19 14:13:46', '2023-05-19 10:13:46'),
('5f23087d94e72c84a141be38c5e49ed94a0ecfa69816ef2ac4078c7f4f9b373029389ee351860d06', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:42:35', '2022-05-09 15:42:35', '2023-05-09 11:42:35'),
('5f9f2b5e7a01710686f312b091e77320b6d5515c1e771e90acf974eb306e28ae8ef60fa11a2250f3', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:43:29', '2022-04-06 04:43:29', '2023-04-06 09:43:29'),
('5ffa364b6553ba54a4afbbd5395b43818a8a209fbee91413d053886df4c441aae6774a087d4c43d9', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-06 04:48:15', '2022-04-06 04:48:15', '2023-04-06 09:48:15'),
('6082028f3799462003076b092f249ac271335382f83664c21697ec6eb2740bbc74fb1e9fd2aee7c7', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-07 13:53:03', '2022-06-07 13:53:03', '2023-06-07 09:53:03'),
('60ac24933d326c09e35657bb1c22909f4148b484ddf251596a7f2aa8de78b9610825fe4f0468ba72', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-25 09:46:30', '2022-03-25 09:46:30', '2023-03-25 14:46:30'),
('6106d9d948a32e4259e603d6abb9146440bf73e42030d8c8fec6e3ed51ae432b126ca89c36904a63', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 03:26:17', '2022-03-22 03:26:17', '2023-03-22 08:26:17'),
('611839b9cb6545642c58a35c295c21697e9dee6763fbd16bac94dea4676f1390391ce7244acb882b', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 19:23:15', '2022-05-09 19:23:15', '2023-05-09 15:23:15'),
('61776962cf9cdfbd8c0744c8ff71747394117a0716fea179f67ba9d8d25ad896b00b8c9cd39f0f32', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-11 02:14:02', '2022-04-11 02:14:02', '2023-04-11 07:14:02'),
('61b66094f53061b0f323b2e687759387fc7e7425f91cbbc142720ded7247943275cfb9ba3c189129', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-07 13:03:07', '2022-04-07 13:03:07', '2023-04-07 18:03:07'),
('61f529432c2f0a8c39a338f551e3a6a8a2088df666deaca34cbb474773b34cb8616b4e5e7c84c9b1', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-01 10:08:20', '2022-04-01 10:08:20', '2023-04-01 15:08:20'),
('62474bbf5dd8fa2971a0238823aebdc816a08eeb77c721c5be0b98ad7e5499a1892d104752d94701', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:55:05', '2022-05-16 11:55:05', '2023-05-16 07:55:05'),
('63bf1866ccdba17b40af6d10b283702929e8cac1463e7bb5c3c73bbcdee9a939b19b81782bb6b4a2', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 06:36:58', '2022-03-23 06:36:58', '2023-03-23 11:36:58'),
('63f059e259fb501ffda593e698ff5b2c18b00bfcf9700587b9c4d0793fef8313cc2e8be6e249d1e5', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-29 04:35:55', '2022-03-29 04:35:55', '2023-03-29 09:35:55'),
('648e9ffa560d8c016b2fbdc4fd2061db7d20f6d77b3ef05fb2a12eb807800108013a901ba61d39ea', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-21 02:29:35', '2022-04-21 02:29:35', '2023-04-21 07:29:35'),
('64936cbdfd0e1a2e47c7bd90345e14aa07c0319a79540e3cd3094c16f6155e44a899089ef89b1237', 73, 1, 'Personal Access Token', '[]', 0, '2022-04-07 14:43:19', '2022-04-07 14:43:19', '2023-04-07 19:43:19'),
('64953fe4e5fe86a0af31e0f2f644940c4e2309222bbd90d756fef4629838fc4ad92da5661639916e', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:38:25', '2022-05-16 15:38:25', '2023-05-16 11:38:25'),
('654b142f9e0c035797f384f07004f1cddb00d1c6c3eb607c1a8547ca69208ce248a75b59dc2b8c4f', 89, 1, 'Personal Access Token', '[]', 0, '2022-04-18 05:03:56', '2022-04-18 05:03:56', '2023-04-18 10:03:56'),
('6557de7e113871d700477d2dbe4609e3f934099d4605f53e08b3cba7d997c93d3d4b46bd706f3cf9', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 16:00:10', '2022-05-13 16:00:10', '2023-05-13 12:00:10'),
('655ada0f2d7798b1331332d1334641c643096d515d3f47d0ac53835b751f038657f25fda70ce14a9', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-29 02:12:39', '2022-03-29 02:12:39', '2023-03-29 07:12:39'),
('65a93b3d34f97f8ced5939611fc45a18b2e4cbd4ae4997e0093801742dbeeafd5a44af99ef23ea04', 17, 1, 'Personal Access Token', '[]', 0, '2022-04-01 04:36:59', '2022-04-01 04:36:59', '2023-04-01 09:36:59'),
('65c198275e79ba6dce8f5e9843935475d730735f4843f1d16f95f54d2847bc9de1f685d3889a8c9d', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-09 14:53:03', '2022-05-09 14:53:03', '2023-05-09 10:53:03'),
('65d3cdd2711725a7d71e701d795a75d0a739a08d67b96dc133d3e0ba911963daf786f3c923a20c6e', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 07:32:20', '2022-03-25 07:32:20', '2023-03-25 12:32:20'),
('678bd908266b0b3915d3e6f43890dd9e949b5ca0652f0ece726b8cc8d39f9d560fdc63421cc27b85', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:38:27', '2022-05-09 21:38:27', '2023-05-09 17:38:27'),
('67c2b136cb62f918ca06798ee04fabc2e5d937a1dd8f021e11ac73194ac9fbceface051904bc0568', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:03:48', '2022-04-05 06:03:48', '2023-04-05 11:03:48'),
('67e62cebd94427fa3d2ae3d718c311ac17dd66320573ab057bfc5a848e907294d5cfe83fb56db4c7', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-06 05:36:06', '2022-04-06 05:36:06', '2023-04-06 10:36:06'),
('6839ac439726217c8e71889644000131b25f6672f949af4e6b97c9b023fc3414639f7b3ef2425279', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:42:25', '2022-05-09 21:42:25', '2023-05-09 17:42:25'),
('684c6f1445c6eadfc7e7256e7509f6935113e7c316cc340e4526e6e79bd91cc4525358757cf58658', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:39:33', '2022-05-09 21:39:33', '2023-05-09 17:39:33'),
('68bfb1174f1023db7015a5feca8fabb980cfac8d1083890b49430cf5400b5a37cf067bd75e6180d3', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-25 08:11:25', '2022-03-25 08:11:25', '2023-03-25 13:11:25'),
('691dca966a664f9309b08acd6bfe98eef349f145b8ab9d495430a5c556de5cacdf56206bc5b2d098', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:12:54', '2022-05-16 18:12:54', '2023-05-16 14:12:54'),
('6a6fcafc274d5590298c4cdaa830e0c8c09ff01d4d65987447b680a831b029db1dbb90f852685890', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-05 06:50:47', '2022-04-05 06:50:47', '2023-04-05 11:50:47'),
('6a9972776facadc85057b3265d8f4f72e069879369527d4c1c2120601ed286cb2c89120ee0d61991', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:44:43', '2022-05-09 21:44:43', '2023-05-09 17:44:43'),
('6b826f54c10dabe9d8de098970611efb57e061ff7b2cbd6d69d2b35b1919467553e9e603c321bae6', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:04:35', '2022-04-05 06:04:35', '2023-04-05 11:04:35'),
('6ba523546fa852ffc1f7170191cb2e21e4257ea6671714e74357517105b3df66888d9ad13869a34a', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-04 02:47:56', '2022-04-04 02:47:56', '2023-04-04 07:47:56'),
('6bb95a62adea1126ffcc86b3c15700b0538f88b6f5eec0092b6a67037674d830d8e551ed54233ebe', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:23:48', '2022-03-22 06:23:48', '2023-03-22 11:23:48'),
('6c234ac2cd096b0b4ae3966a369a222fb785482b68633fcd734776101943eb2c1c6b3d2cf6c8f962', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 01:34:55', '2022-03-24 01:34:55', '2023-03-24 06:34:55'),
('6cd329201e9ac4c4d411609cff22a274fae6ea6855bd6f2009eef0e462212f15d6b03f055ab510d2', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 00:32:10', '2022-04-18 00:32:10', '2023-04-18 05:32:10'),
('6d129e4662461fcee900ee2fd3d10aae7868d3dab1fdb91d30dec324b9c167ade4fa63602e5b0d26', 33, 1, 'Personal Access Token', '[]', 0, '2022-03-29 07:20:06', '2022-03-29 07:20:06', '2023-03-29 12:20:06'),
('6d488890ab849b9d293d1fc6314917a363055b5229fc046d3aeb1137c3c99be251c1f58aa5aec77c', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:57:45', '2022-05-09 21:57:45', '2023-05-09 17:57:45'),
('6da66ecb27010ba9b5ab4f0210b5580a7185f8e220fbc7e5299462f655b8fc50160fa754e09c72c3', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:36:41', '2022-05-12 16:36:41', '2023-05-12 12:36:41'),
('6e038df87f8b0c682b9cc07df1ab6c8c74059823134392f28c8b4a64cf1c266606f68f5151617e46', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:54:20', '2022-05-16 11:54:20', '2023-05-16 07:54:20'),
('6e675e441094dd339bf0dae7ed04fddc184f218080dfe2e74cfdf5aaab521b8f61284b640e0637b6', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 19:23:26', '2022-05-09 19:23:26', '2023-05-09 15:23:26'),
('6e852b4e052da8f119bd63c58ebe3d6f96f9ac6c4e4d29368b7d50724607bca7c3389e8840bdcaed', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-28 23:22:59', '2022-04-28 23:22:59', '2023-04-28 19:22:59'),
('6e8db64c83a849f351281186cde53fa3a3cdc45e46339c7737f0c1bb272ca3bf303da12d057b556f', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-12 01:23:01', '2022-04-12 01:23:01', '2023-04-12 06:23:01'),
('6eb74bd96152d6efda3fa89f538f2dd97838778055cd2f2db71631b318df9adf6d3d2f2db910db2f', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:56:26', '2022-05-16 11:56:26', '2023-05-16 07:56:26'),
('6ef12bb56b76889bbc779102ccd1a1cefa557f9836046d27a009fcfd6469261cc1906e9d269c9968', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-12 12:58:32', '2022-05-12 12:58:32', '2023-05-12 08:58:32'),
('6faf2004cb2b1c846929dd46724cdaa70a78894ad8b2aad20e97cd297a3a661965c457370705759f', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-19 15:50:00', '2022-05-19 15:50:00', '2023-05-19 11:50:00'),
('6fc0ec55842c2b2f64bb19a666650d82c762aa8e3847797128b2b78a66b93afa2aea62a0a95a1079', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:01', '2022-05-09 15:43:01', '2023-05-09 11:43:01'),
('6fd2711c71e29e7c3f8b3961c199d8119aab6a1bdcd2c2e50b812c045425155b99433978b220306a', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-30 02:26:38', '2022-03-30 02:26:38', '2023-03-30 07:26:38'),
('7027d42512d8309ad616e75abab816eb5bc7826477c4026cc8f72a720d6f0b31b462baaa5a8307b7', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-22 01:37:27', '2022-04-22 01:37:27', '2023-04-22 06:37:27'),
('703bd443b5198c1a5d69fa8cbddbb861c753fe29785be0768115b3254bd5114f96a87b67d0309c07', 112, 1, 'Personal Access Token', '[]', 1, '2022-06-07 15:34:17', '2022-06-07 15:34:17', '2023-06-07 11:34:17'),
('7057e7202d6db62b200f9169418d9336e55eacd50c9ea734f85e19f6de0ad5be31aed7b33f07cace', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:38:25', '2022-05-16 15:38:25', '2023-05-16 11:38:25'),
('709002dcbb06e4a5614e979698298037bae86071bc176707fce78f4f2c50dc284a0f3bcce98d667c', 29, 1, 'Personal Access Token', '[]', 1, '2022-05-06 20:44:14', '2022-05-06 20:44:14', '2023-05-06 16:44:14'),
('71132d907be30e6a73bc62494b04633a2fed7b71c172c704b5a00a58939af9ce2bcb636d46bb83a2', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:29:29', '2022-04-05 06:29:29', '2023-04-05 11:29:29'),
('7241621aa69c24fd50a15157a9c8b9d9220719cf0c8f1f3e72485b5169474e0ed8eaf6837a260757', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:48:45', '2022-03-30 04:48:45', '2023-03-30 09:48:45'),
('7242474ac26cd09ef25a50bfe7bf7c509b05a0e8dcf8370c7fa05d793edc634c227cd653e58acd20', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:35:49', '2022-03-30 04:35:49', '2023-03-30 09:35:49'),
('7250fa9dc557ce64c16d216cf01453ef70f616e364baa355d0e0faf4e513519d0b3dd461d4a11679', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-12 04:29:15', '2022-05-12 04:29:15', '2023-05-12 00:29:15'),
('727527c14399f7fa6a27cc399883d3d6142079b65d1c60eac3449b92d57bdd96808b232f37d9272c', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-25 02:51:52', '2022-04-25 02:51:52', '2023-04-25 07:51:52'),
('72b764b0ebdf4592736575e478dff6a027c338c7a99d9509ae04ee7b498d607ea48ca67999f02f08', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-19 19:45:43', '2022-05-19 19:45:43', '2023-05-19 15:45:43'),
('73316d9347f8bc6746f928da7bb7f61f693a67483efb64d3c78aed3d29cf838582f270d9dfe9cae8', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 15:07:47', '2022-05-16 15:07:47', '2023-05-16 11:07:47'),
('738a8d3f1c9b2114b1cd4a03c22618d2d5f42ad4fdf69ba9b5af3fca62dae92bce2f8778eda2a8e8', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:14:15', '2022-04-06 02:14:15', '2023-04-06 07:14:15'),
('73f3a758238c274fbf4aa4793d1e0006ea860cb0d623467a1acbaf116308aad6b9aa9bc4f0bbaf48', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-15 06:40:37', '2022-04-15 06:40:37', '2023-04-15 11:40:37'),
('74106e63b36ecd9206e8438eb9717a7159b32f3379c2f264b008d210747c04b40de0dffdb6e14b4b', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:47:45', '2022-04-05 06:47:45', '2023-04-05 11:47:45'),
('74208a996e0031892fd4083067e78e0c1d707316d07d40f8f354952109b291859029643367f69b33', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:02:21', '2022-05-19 20:02:21', '2023-05-19 16:02:21'),
('747e39f0fcfccd201d3865dd74c2d1b56b894423e7e8d82b5a2523de8f6f6378a8771891ada3dcac', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-25 04:23:07', '2022-05-25 04:23:07', '2023-05-25 00:23:07'),
('74d2e84bfdcc795d29e35e2cd8f3b57afb66ad245c67272bd3cbdb762a2cb78c2fa7b9cd1c81fa4a', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-06 03:19:04', '2022-04-06 03:19:04', '2023-04-06 08:19:04'),
('753cdfe86f1f7f4ca41f89879e0dd5af0969ed9f4a95f19d65f2435212a598547985f70c6549a483', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 09:37:10', '2022-04-01 09:37:10', '2023-04-01 14:37:10'),
('7583bd5bc6a4a9400118816cae6d8e306cfe1e2b5438e95c9b48d04514ace5068630359a057155eb', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:04:56', '2022-04-05 06:04:56', '2023-04-05 11:04:56'),
('76763f093bf048572f14c62bda1850c58350c95cbea35be05b9f332ddbf35be31bb3c212a37d6724', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-28 03:03:35', '2022-03-28 03:03:35', '2023-03-28 08:03:35'),
('76d23048e35777b8b796aae927fd248794070fe4d3a102229adb389672bc8be956165084b04234a7', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:27:49', '2022-04-06 02:27:49', '2023-04-06 07:27:49'),
('76f2227105bf4f85b7cd46150c7eda5857967022c17e86e6354d946c084a65ff947f0d12575723a1', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 14:07:09', '2022-05-13 14:07:09', '2023-05-13 10:07:09'),
('78604a2d20977473af70fa42551778e1d1574566cfe39661ced103d99ff4b5607627f8641c4b6bb2', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-14 02:28:37', '2022-04-14 02:28:37', '2023-04-14 07:28:37'),
('786e11fcb9371d3e91f0a4c6e5def9ae13f19fe2f05aac07abcc6ff689d4149ddc6c29ed7b25c336', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:51:47', '2022-05-19 20:51:47', '2023-05-19 16:51:47'),
('7884e633b2ef75af92b959a749c9d4b73b5dd9a11c1401894e35713f814763feb853db686c9acb5d', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-14 05:37:32', '2022-04-14 05:37:32', '2023-04-14 10:37:32'),
('78c9c7717803dc11f222282dd62b1f95090139707e887646b4ccf3d83c9db8aab387697067cd1f84', 65, 1, 'Personal Access Token', '[]', 0, '2022-04-07 01:40:07', '2022-04-07 01:40:07', '2023-04-07 06:40:07'),
('79442f1fc2f3f41eabee1532cbcbd5ad60c57bd1a41d832877f862af6230ff8c9425ab24ce46dbdc', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:44:35', '2022-05-16 15:44:35', '2023-05-16 11:44:35'),
('797610f62a98b2b6b201a47094701c096c550f9dab58be5c3cd391f1c261c42e9c600d2e3cbd2cb4', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:51:04', '2022-05-19 20:51:04', '2023-05-19 16:51:04'),
('797ecf0cff2f8d9d8097bb3baaf6a55ed4e17899126575e7a38e74e7040db75f7beb5c51cd806e44', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 10:01:22', '2022-03-23 10:01:22', '2023-03-23 15:01:22'),
('7a5730c3384bd1658968403a21cceff904288539a83399f7396eafe6436b300a18e16a2861809a41', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-14 18:55:44', '2022-05-14 18:55:44', '2023-05-14 14:55:44'),
('7a68e4ed1a2e31efab0982a943158bbe76caf12013f1687e687c178b5b4f87c98b1546b8152d53b9', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:46:09', '2022-03-30 04:46:09', '2023-03-30 09:46:09'),
('7b1c70534d0ffd87c144e85e385766c3ffc55978ae171c98d6d754cbee21906569ca89554c31167b', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:13', '2022-05-09 15:43:13', '2023-05-09 11:43:13'),
('7b5b2c4f4b19b3d125ddb889bd821bee6363660dc9158da630e06a592bea18b681dba33cfdad0ad9', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:39:20', '2022-04-06 04:39:20', '2023-04-06 09:39:20'),
('7b5e81f69fdde406256c59bd3c0275cd72485747f3549ee12c5f213c02c625ae2d8eda8b1753b5d6', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:22:20', '2022-05-18 19:22:20', '2023-05-18 15:22:20'),
('7b5f527e79b5e954bd7bd8897b2ae70a67f166773b853784ea89c3fcaef4cb125f0755d12f5de962', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 05:48:55', '2022-03-23 05:48:55', '2023-03-23 10:48:55'),
('7bb73139f6e407d70934c9050c80bac40ba0651968f308695cdd7bdc939a2352b8a758a0d2ac7c99', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 05:21:26', '2022-04-25 05:21:26', '2023-04-25 10:21:26'),
('7c8caac87572c642e668f95b77e56fd1a432c2b30cd8218c36f493af9f1623392b5c135f1748ef68', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-16 16:47:26', '2022-05-16 16:47:26', '2023-05-16 12:47:26'),
('7c9c791616fb78e761af4a6b7297ff80998e455424e5af57cc84d7f0cbf2384732784ba328fe5fcf', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 19:13:43', '2022-05-16 19:13:43', '2023-05-16 15:13:43'),
('7cbd6d3934654590e2459d0b8146e17e1c52a6459682a49f91398ee6388889bfb477e59de78bf572', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-08 04:08:41', '2022-04-08 04:08:41', '2023-04-08 09:08:41'),
('7ccb5500c5d51b9fd0364d5da85aaf38e9c663d3eadb8697d6d346f064c1d59591729bacd324e5ea', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-15 05:50:49', '2022-05-15 05:50:49', '2023-05-15 01:50:49'),
('7d4f6d71bceaa2042f2142bbb7e29ed82c60a1a93dbbd0103f8333e650bb02276ff0e1426e15c6b3', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:27:15', '2022-03-24 04:27:15', '2023-03-24 09:27:15'),
('7d77d31a6a3b87fae3d77c8d4ab3bd9ad68a0abdf35b730e5b902226bda9ed1f2e260138a6f1ec1a', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-28 22:56:09', '2022-04-28 22:56:09', '2023-04-28 18:56:09'),
('7db4c6e2f9ac17f15e89e8cae3003c8d3a29a69fe5bc02e1171a41a836191b126a24fa0f2247060a', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-04 02:02:30', '2022-04-04 02:02:30', '2023-04-04 07:02:30'),
('7dbd9b2fa5634d898fb6b8fbce5e10a3e8fe38bf0a78508f77fd641e1e26aa26a3147023a68bc1e2', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 17:37:43', '2022-05-10 17:37:43', '2023-05-10 13:37:43'),
('7dc6354cb58f077d9dfea5e36aff293befd0d3ce1c9c3508307f76627875d4169bc78cba686e6019', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 03:39:25', '2022-03-24 03:39:25', '2023-03-24 08:39:25'),
('7dc781961dd33c8ee81326f36f1fc59439ac08c7cca6b67981d2aa46e85ee95e81b12aaa1176604d', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-31 07:43:32', '2022-03-31 07:43:32', '2023-03-31 12:43:32'),
('7e584ab77970f7059e1f641783c76a02b645abfef61a1314aef86f9ccc073f4a20a3dd944367e6e5', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:42:14', '2022-05-09 15:42:14', '2023-05-09 11:42:14'),
('7e7da74d373ace130486cf054b85b2c6344da5dbeb7d99b971dd06c6c6a8b7bcbd11001b78502db9', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-28 17:00:35', '2022-04-28 17:00:35', '2023-04-28 13:00:35'),
('7f10596d8facad0add0dc10eafb57c23226365730e6289f975f456cad2275b0de4d617a060a6f490', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-11 20:52:06', '2022-05-11 20:52:06', '2023-05-11 16:52:06'),
('7f45a120bb34260b7db549e5215ac6476bd9b4de8920ebd4b3df0a37e2228bc7967c62cc7dad723f', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-28 22:04:23', '2022-04-28 22:04:23', '2023-04-28 18:04:23'),
('7f68d1ea70ba3c987321f66642de1960485c2ddab41eac6fa8ae56b1b2f6515c8c1d300ce5aab293', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:25:23', '2022-04-06 02:25:23', '2023-04-06 07:25:23'),
('7ffbae99f453cdaa149d6c2959a737b4e25a1a23ddd82aba97aa5c363c07816899cfbebac7a12cd0', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:36:41', '2022-03-30 04:36:41', '2023-03-30 09:36:41'),
('8022bb72abadff399e09961ddf2a7e2842d01610ad7d6ca998ca1f5a140c685a28cea759f47524b6', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:38:30', '2022-05-09 21:38:30', '2023-05-09 17:38:30'),
('8072f426e8c45935ddc250d8f5bd506ffece20d9c2d7bb7d88fef22fe8438fe5bf273bfb612f9eff', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 06:57:05', '2022-04-18 06:57:05', '2023-04-18 11:57:05'),
('80b7407aa630018848ae748612dbe5ab33500f4614d33eb14a6fe6c2147f2ddd68089d46e5cd2a91', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-10 13:00:07', '2022-05-10 13:00:07', '2023-05-10 09:00:07'),
('80bb10f2032e713a3145336298d2a428e9ed5ac4e4c2ef4656ce503440fe51db1435af6a04a2d7c2', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-31 06:05:13', '2022-03-31 06:05:13', '2023-03-31 11:05:13'),
('80bfafb0d7299645a58b6ff6ac696314c1154b763f18bd8660e4ee17ee650ef186176d9b7834c44c', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-24 03:33:29', '2022-05-24 03:33:29', '2023-05-23 23:33:29'),
('8109af4811453ee72c3bcfbf9a81e5e124f44d6cb717f8ec167ccbdca2fe8fb5d4248461fa479d72', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-11 01:40:53', '2022-04-11 01:40:53', '2023-04-11 06:40:53'),
('8145c763f55f90790d48ae2ba0684f27c35de217ff7716e25df8fa3734f643d6378284510ab473eb', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-17 15:34:14', '2022-05-17 15:34:14', '2023-05-17 11:34:14'),
('81abf7b881e53366637be57a3f728ae5731a1a0a87576bdc0277055c517c9956747c7666c24f8d7d', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-29 00:02:05', '2022-04-29 00:02:05', '2023-04-28 20:02:05'),
('81b3633a78e8fc83d2269d421b110664bdd63f165d3f7fcd4440d8d056205623081b74086fb5331e', 112, 1, 'Personal Access Token', '[]', 1, '2022-05-19 20:02:21', '2022-05-19 20:02:21', '2023-05-19 16:02:21'),
('824c3d4a96ffee29e9144522f31912cb88be510d70a14f303887ada90ddb0ae8f3f111268ae03729', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 14:42:03', '2022-05-16 14:42:03', '2023-05-16 10:42:03'),
('826bce3c5f6df353ae956e0452e90ef97d16d76b17c239a59597c5943cbe873facee574b881a5f3c', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:59:03', '2022-03-24 04:59:03', '2023-03-24 09:59:03'),
('82825bc8b951913338bb3a065f237d237b5f4ac4b72b331cf6dd484fd994cc4f1af57e3855ce4cf8', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:55:05', '2022-05-16 11:55:05', '2023-05-16 07:55:05'),
('828cee1456b8d930e7669a432df96e1d3a9ba21dc5da19ccb39c2dfebcba3bdf51593524183d9cc3', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 06:35:19', '2022-03-23 06:35:19', '2023-03-23 11:35:19'),
('82907819ea1fc062cdf253d49a8cf3714a96c013f7aaf42b32a8840ee8db03adc1b39adcc3ad7903', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:10:01', '2022-05-16 18:10:01', '2023-05-16 14:10:01'),
('82c92556c3f83907c7f6458a522e77e25bc01117dc3e1380843d07e3495beeaaf6727bd50f6ab29e', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:34:09', '2022-04-06 04:34:09', '2023-04-06 09:34:09'),
('8333cebaca3d6ed2d15e95cb3046074534ed4c30dc71a1b842e36f9774909787d7bd165af8bec518', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-28 23:23:35', '2022-04-28 23:23:35', '2023-04-28 19:23:35'),
('8360e5202a989362222d03b71f17ee7666d055ebdfd56f8182d16c66033c3f7a2f417f01152f0f50', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 02:20:05', '2022-04-25 02:20:05', '2023-04-25 07:20:05'),
('83613391625f63c11efa4f7700dd4f57ec27336e903f163e35599d821ebe2af0ab6f147fb0151a55', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:24:11', '2022-03-30 04:24:11', '2023-03-30 09:24:11'),
('838d6b14e5dc0e87d0ef2811be609763e856f956f5cdc11ec9dab693f505d4c4ddad0193a38ff716', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:47:18', '2022-05-10 12:47:18', '2023-05-10 08:47:18'),
('83bb5e1008b3d65058f28793d13fdd749ae128fbd6024d6786b392e739c7906095a9857996b07bb9', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-25 03:51:07', '2022-05-25 03:51:07', '2023-05-24 23:51:07'),
('83cac89341d1a6854222b40e91b59540f02e7169aee40d77d861d607c530b759e04f7caa90854f1e', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:58:09', '2022-05-12 16:58:09', '2023-05-12 12:58:09'),
('8429b8518053ef396a76229c0b7dd52a3d23d151a8f01adbef2b72894c4d46ccdefbd4023b07c6d2', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-12 01:01:54', '2022-04-12 01:01:54', '2023-04-12 06:01:54'),
('84ea561e2461695c9a9b8262d1249853b35a73196c4b9c85332018c0baa4ad38312da8f7fc09d562', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-19 15:52:03', '2022-05-19 15:52:03', '2023-05-19 11:52:03'),
('8534eb4a4767a53efee0c1f1f4b04e3605d92d9f718b3d158bde62982768e87ff5e53b8804cbe5b0', 73, 1, 'Personal Access Token', '[]', 0, '2022-06-02 13:26:58', '2022-06-02 13:26:58', '2023-06-02 09:26:58'),
('85462584f2d1843403497d5453012b3da1d9c3fc5c6bff40f9bfe6ed39c7dcf30323723786eda858', 17, 1, 'Personal Access Token', '[]', 0, '2022-04-01 02:10:51', '2022-04-01 02:10:51', '2023-04-01 07:10:51'),
('857b445aac59f227d862a011f220a7d284720c62e990cdca6d1e6ea34bed2507d639350c265d431e', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 07:08:09', '2022-03-23 07:08:09', '2023-03-23 12:08:09'),
('85c233dbe7b4059533310914641cdd88d91d4e26e059fefcbb4128f0f71e9a00d49ef466ede215f9', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-13 13:53:50', '2022-05-13 13:53:50', '2023-05-13 09:53:50'),
('85d81a445d6ac165f46239ee494165e6b8d31e79c973e5c689e22e36614f4a5aa2e654123947fe67', 6, 1, 'Personal Access Token', '[]', 1, '2021-04-30 05:37:49', '2021-04-30 05:37:49', '2022-04-30 10:37:49'),
('862086fa285dffd16c0df4d0fcbfa0533769015bb95c41da72b0203ca3ff283303ba2a93e3af90b0', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:05:23', '2022-05-09 22:05:23', '2023-05-09 18:05:23'),
('8627c84a1e3792f0fa3006bc3a2b8974a4f04c7c1e6da7d597f23fd86e520e6d01878cb9aa8c84b7', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-27 18:17:34', '2022-04-27 18:17:34', '2023-04-27 14:17:34'),
('867b2e1ebdc5476abc5269ef6e8f0928bf60787b8948ba82def8bcd8843a6dad879c6fe5b16624bd', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:51:33', '2022-03-24 06:51:33', '2023-03-24 11:51:33'),
('86ad2ec1802eb2f8d9e93e6914f9cfdd541426cbe1fa8072465b1d141884ea88b92c27d1829fc5ad', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:50:10', '2022-04-05 06:50:10', '2023-04-05 11:50:10'),
('86f9a339e49d35a881d59fd2048e796355fe8b7d8bb95bf13da6de1f5675e23abfc1c63b74f2e9bc', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-29 10:47:06', '2022-03-29 10:47:06', '2023-03-29 15:47:06'),
('872bb5c65c085adc77bb6e6f85c7e8892c0dd037217e5662d047d7d76d8fafe3ea003e077148df1b', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 15:44:48', '2022-05-13 15:44:48', '2023-05-13 11:44:48'),
('875d881abcfa02946d912bbdc640b3df879d2c7a5c76ee9265dbb3fc957f5a0f5d24b2b96de1d781', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:27', '2022-05-09 15:43:27', '2023-05-09 11:43:27'),
('87d8603e75452461251d3dc4cafd09c0a7961d6c7b1ceed8a21d2759e9ce3a7baf386a3efa0f77f7', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:32:35', '2022-04-05 06:32:35', '2023-04-05 11:32:35'),
('8805a8b29b558ba2e80123d68530f10570c7ce7544bbf739e4db80c6f23367edf5081d62aaff9d26', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 13:08:25', '2022-05-10 13:08:25', '2023-05-10 09:08:25'),
('88293ae2a15fef70c214b2425f49326be2aa233a5c11355964a9a86f63c6a99da12b212f4bafba82', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 01:55:06', '2022-04-19 01:55:06', '2023-04-19 06:55:06'),
('8867b9d97fc18403a7c0b53dba227e27a3c2818a15c31746c3bcbe92b2977c9d0175db1b9ae7b247', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-20 15:59:37', '2022-05-20 15:59:37', '2023-05-20 11:59:37'),
('8871e47fbdf2e0c6f690d91acb76b4a8831df58808bfccea19a56a3c83f38f79a29b095d71567b9b', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:40:50', '2022-05-09 21:40:50', '2023-05-09 17:40:50'),
('889249be18739a047f2abcd4c05e73bdebbacd6e00548fba86804b30ec75a1d285dacc294dd6e888', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-18 19:11:35', '2022-05-18 19:11:35', '2023-05-18 15:11:35'),
('88a1de354ea07d4213443c16e9b4784eadda0fe677e3bc9f0a7e0786a28abfb7285a27a5b2454f7b', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:28:09', '2022-04-06 02:28:09', '2023-04-06 07:28:09'),
('88c2b5ec3ee3ce6ab29d92573da8a97c6742647d6c1ffa80767ea9dc2472f3b023526c46ead430e7', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 13:09:26', '2022-05-13 13:09:26', '2023-05-13 09:09:26'),
('8921b2bc0d7a0b14359c23192876561155eb0382947c2563807d22ab8863e365494fde32ef8fc1f8', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-22 07:14:28', '2022-04-22 07:14:28', '2023-04-22 12:14:28'),
('8978acce84230c561886b5db078b4997c6003d648a2e5a4634e893cb91fbb611fed3550b051c6d79', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-15 06:50:35', '2022-04-15 06:50:35', '2023-04-15 11:50:35'),
('8a153068555ded6bb325ed7edd7a9165e27687b73431ef99a2a26b8713b180a36467611dfc72d1c3', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 17:14:53', '2022-05-12 17:14:53', '2023-05-12 13:14:53'),
('8aa0fa463b35992cee208e2c63cdad599e2e7f07d6d2267bda3597defe33394cdbdd293d04a2ebdb', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:36:19', '2022-05-09 15:36:19', '2023-05-09 11:36:19'),
('8ad25d162499f1e4abf4b39ac5d6d918d61f5283fda471487ad5d8e5cbb15130eba1f03dd4d8fa37', 22, 1, 'Personal Access Token', '[]', 0, '2022-03-25 05:17:37', '2022-03-25 05:17:37', '2023-03-25 10:17:37'),
('8ae6272e963f3ff1264c771d933ed019f263c6b7a507fa8071c59979732b1c1fe04893c50a038795', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-25 04:25:48', '2022-05-25 04:25:48', '2023-05-25 00:25:48'),
('8af5e30877f6cc9cfa23f1f3ec51e4ae2232fd70dcc93c561d5aea51f701c02da6b9d42a3e62f694', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-14 18:53:18', '2022-05-14 18:53:18', '2023-05-14 14:53:18'),
('8b0c5eb3f56b0e9ead52ce994669f83dd2863fdd771581ac099c7ed27d082b67f742a92f670f0a8d', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-19 16:47:42', '2022-05-19 16:47:42', '2023-05-19 12:47:42'),
('8b2f6f120661d3506324e6f81b3b3b88e8b873a7e9a34af3d251100a3678cee4d547f44dc779312e', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-18 13:15:16', '2022-05-18 13:15:16', '2023-05-18 09:15:16'),
('8b4be9f57ae8fa33c1a964b30ef49a7cd4ac1153d632fd823c910e7e6934848b5e5df57d3d384af6', 24, 1, 'Personal Access Token', '[]', 1, '2022-03-25 07:51:55', '2022-03-25 07:51:55', '2023-03-25 12:51:55'),
('8b84af4d3bfc1d166267af2dbba86795f770955ea3b2b6f243284f8ad7a617f7fda1cee3d7375d53', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-13 15:01:58', '2022-05-13 15:01:58', '2023-05-13 11:01:58'),
('8b96198ba5544d0f9707121910a5c7fd641bfc5228f802513db1b74a50b949be6d847a2811c3f0ca', 37, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:44:46', '2022-03-30 05:44:46', '2023-03-30 10:44:46'),
('8c3ebdc158664b8e1d7540b119423af84823274e04623027147f69cf47724c82bd90ee8640fdce5e', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-01 10:30:17', '2022-04-01 10:30:17', '2023-04-01 15:30:17'),
('8c652817f4add268f81a6a0c6ec5ecb11a6ae2e89e8a798646420201d99d88d4a0886e7e77e93060', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:38:42', '2022-05-09 21:38:42', '2023-05-09 17:38:42'),
('8c66f196079bfcff158a3611fcee2ee57de1efde243e539ea8844de9782c0b5c0e68e274da0fc4d4', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:37:38', '2022-03-24 04:37:38', '2023-03-24 09:37:38'),
('8c8c6a977d6105ee7944fa432131411f6e945e67e388aaa23254bb2f4647cdf369f414fa5b18c0d0', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-04 05:40:00', '2022-04-04 05:40:00', '2023-04-04 10:40:00'),
('8cb74714767a1fa4b7a23b4438227a9109d5b9957a1fde96fc778aa3d84b6a48daae2d917bfc2367', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-11 01:49:49', '2022-04-11 01:49:49', '2023-04-11 06:49:49'),
('8cf35b1422c74daf5911099c3b94a246cc81ba62df7aaf24084bda8ae9936a37420b16c87e575898', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:38:52', '2022-05-09 15:38:52', '2023-05-09 11:38:52'),
('8cfba3783bb0438d273676cb4752f48c90fd9793b9fce03a8877e234d0ed10a1453a73c4dedf770d', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:59:05', '2022-03-28 06:59:05', '2023-03-28 11:59:05'),
('8daa258763889a0e7fc092be3ae872b9b5fe0c1d3dbcf0b53d9cfcda82d21660f54bd14e2ec7085c', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 02:51:54', '2022-04-19 02:51:54', '2023-04-19 07:51:54'),
('8dab9b514d048a2962b539b6d894d054f18c98173c0ca6ea4d7f30fb72d1a44fe7111951a1def5d4', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-04 01:23:00', '2022-04-04 01:23:00', '2023-04-04 06:23:00'),
('8e06f26c62c74a0a09abab2a6594e3c79781fe7ac50b3d6001d4322f7ce4a9ec4b594556260564fa', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:44:11', '2022-05-09 21:44:11', '2023-05-09 17:44:11'),
('8e37b2dc516f5e9afbcd234a8d044b4d3ec7ce044a8894f5cdc8d386d297d926b8538ee099af38a9', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:40:25', '2022-05-16 18:40:25', '2023-05-16 14:40:25'),
('8e73c2704bff5cffc59cf339ffea83c426f3a5ff92cb4542757094c18180ce110626b05fbd977015', 86, 1, 'Personal Access Token', '[]', 0, '2022-04-14 07:17:16', '2022-04-14 07:17:16', '2023-04-14 12:17:16'),
('8ed151e02cac05a0a445c77b2e5f4abf5473aa96719786abc04baafe9e1a1636751734c569cb34ac', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-08 22:45:36', '2022-05-08 22:45:36', '2023-05-08 18:45:36'),
('8f6cad0ebcaeaf9206152641cfd6062465932d987c9db395345514ea46980116ff6b2be968a77e7a', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:01:43', '2022-05-09 22:01:43', '2023-05-09 18:01:43'),
('9015f9cfa742415b537d86c446cc8fb09104d5be14292b3e3a253b2b2dbae3e5e7be2ff97238be17', 31, 1, 'Personal Access Token', '[]', 1, '2022-05-06 19:56:46', '2022-05-06 19:56:46', '2023-05-06 15:56:46'),
('90b7d2ce7b2b7ffecea2583d465b847cbda073cad4255cc2cf9359874f1034cd1e9f2402f2e567c0', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:18:41', '2022-05-18 19:18:41', '2023-05-18 15:18:41'),
('90be5890dfe37ef08f2b84658c583f775c8e430281c8159b3828e5a38bf9c32744206f68aa897884', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:32:23', '2022-05-16 18:32:23', '2023-05-16 14:32:23'),
('9155e762b46fbd6ea1d6452362112ffbf51850a0b85690aca95d01dc73029ece3888ea61a106bf83', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:13:38', '2022-03-24 06:13:38', '2023-03-24 11:13:38'),
('91b9217c8e2b3b9a7604ebf173360a66144a38279ab2de9e89d8853d8e3e72b5199a09da759b007d', 58, 1, 'Personal Access Token', '[]', 1, '2022-06-03 13:40:02', '2022-06-03 13:40:02', '2023-06-03 09:40:02'),
('91bb9d42b5391c1a484f5358ed15aed674bf06b464143398d6ceb338cee65c04385a29bd7251d3fb', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-13 07:06:15', '2022-04-13 07:06:15', '2023-04-13 12:06:15'),
('91d40626ed47e27f1a6d815cb2e7dd86f20b8a92e8ddc5b28d3daaeed034da4e230573d88829ee39', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:43:56', '2022-03-30 04:43:56', '2023-03-30 09:43:56'),
('9294edcd391d921ae5c679d44a3d06a019725f6eb9257598caef15d14cdef3fe652fbf7bab25e2ff', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:20:29', '2022-05-18 19:20:29', '2023-05-18 15:20:29'),
('92acddbc269ff14e203db2cba24e22a232abd235b3e8d3cc50fe466131ff1ad06f957a659669883d', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-17 14:57:45', '2022-05-17 14:57:45', '2023-05-17 10:57:45'),
('92b4b6101e0c1a5f32889d741a1adbb7e3b7becb83d4f1156277c84d0adaed076ab811fa8326f157', 24, 1, 'Personal Access Token', '[]', 0, '2022-03-25 06:02:19', '2022-03-25 06:02:19', '2023-03-25 11:02:19'),
('92dae873dcc8fc8d1f5ec8b36b8ef5991a410992416ae8778343a60a7d57e6d262298ef0d5294077', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-07 01:43:37', '2022-04-07 01:43:37', '2023-04-07 06:43:37'),
('940842a740b6875cd1a7d806a15a24af54a623d935218fc0d8bd8d9e81230a64f82aef3ed2a3565d', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 01:39:56', '2022-04-25 01:39:56', '2023-04-25 06:39:56'),
('94144b757de7b3e07b43cfc2e946fc1a7251a8b24b3e603ce18613e94b8f3d07b76aabdfbe6cdefb', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 12:42:06', '2022-05-13 12:42:06', '2023-05-13 08:42:06'),
('9471c9de0c4edf5ea549753a9ac0c2ec4906f64cd476c809c22047364c5dd23fe58b3f57395990fc', 59, 1, 'Personal Access Token', '[]', 1, '2022-06-02 17:01:49', '2022-06-02 17:01:49', '2023-06-02 13:01:49'),
('947a4072092bc2f9fa9eb004e0c1a66e805bd919662cd740535e64b56c089d8ba89450985f015b8e', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-06 06:36:43', '2022-04-06 06:36:43', '2023-04-06 11:36:43'),
('94d892e7239d3dd964d67c939adff81a9a0c816fd24f435d8e620bbfaa7af0d387799f801a877771', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-29 00:00:07', '2022-04-29 00:00:07', '2023-04-28 20:00:07'),
('95312e43c58b42edf00535133b01a9b813a1df694feb0abc85ff4da2884b4ecf180d8cf8f50d0d36', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-29 10:59:43', '2022-03-29 10:59:43', '2023-03-29 15:59:43'),
('957712e3b15e14023353c0c2ff688c87ddc41390be220045f9074e74d1ffe329f745649743d28fe2', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:46:58', '2022-05-10 12:46:58', '2023-05-10 08:46:58'),
('95b603bf08f473f90c49e383ccfd4aed914e8686a71611fe84c3210a1bc045b0e626a2088bf65c64', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-06 14:57:06', '2022-05-06 14:57:06', '2023-05-06 10:57:06'),
('95dd5443832ce485649da364e935472d33ae7a7e4c805a1131034bc434d8c969cac2e7228a80b3db', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:57:08', '2022-05-09 21:57:08', '2023-05-09 17:57:08'),
('9637cd6a4f62370972cf56eaac2babd37b12ef5e1ca218cd4857b4aed98a26e684b025d8ddcb17d1', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-13 03:06:17', '2022-04-13 03:06:17', '2023-04-13 08:06:17'),
('96666547c3f58c6fe3540457c8e4990150cfb6134942f04bda862825b1439bc817295369be0fc191', 104, 1, 'Personal Access Token', '[]', 0, '2022-06-02 13:00:22', '2022-06-02 13:00:22', '2023-06-02 09:00:22'),
('96db5e207fd242c2931514ff2d7f6bdc181f8b48c7b51d7c139ecf36a0c7191e3a0837b57c057715', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 07:57:47', '2022-03-22 07:57:47', '2023-03-22 12:57:47'),
('96e3200f27fa1876185b64543a2663accc10d7d45a5db74f0e96f8f3a206aa6c03f04a4bae7f3051', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-06 02:51:02', '2022-04-06 02:51:02', '2023-04-06 07:51:02'),
('97239452ba994536c8e06a3f44582addb7dd109e84990ea1bdf46e4b0e58093b388bb8db05dbdca5', 53, 1, 'Personal Access Token', '[]', 1, '2022-04-06 02:16:21', '2022-04-06 02:16:21', '2023-04-06 07:16:21'),
('972873d22c46441177781817ed8fd4ead83adb59de95ffeb7585ddfe52eb45fb510beda7819d4b95', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 17:28:06', '2022-05-12 17:28:06', '2023-05-12 13:28:06'),
('974895b9a69aa174bc451c3cd64b26ed49fb03f2bb052bbb4960640f3ce0027bb0507cbd1a1a2ac5', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:51:39', '2022-05-09 21:51:39', '2023-05-09 17:51:39'),
('975b9c8df5fdf9bd37ba27209d46c79b014b59ee81f23f87adaa0b93b549dc17d918da9a756a9bca', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:23:11', '2022-03-24 06:23:11', '2023-03-24 11:23:11'),
('97b9ea6d876a24c5dcb5393ddb745b3416b4135111a7230aa5c5ddadfc76ce02bc9e3bc79b36d24e', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 17:51:40', '2022-05-16 17:51:40', '2023-05-16 13:51:40'),
('97bc5907f3057320686b92e70533bb7e5958066be8ab7a4b81c8a6397facdf44f4e7e7c0b2bfcfb3', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 19:13:43', '2022-05-16 19:13:43', '2023-05-16 15:13:43'),
('9809a0752c8bc90341ef9f49dd078bebec400ec338f83d9b49e0517a68fed3f9c7ef983eae15e773', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-15 04:44:23', '2022-04-15 04:44:23', '2023-04-15 09:44:23'),
('98c87252aa64c7638458c5b8245bb6b4fd5ce1158b35b1e628d75e74514f60389885d7930962c7e6', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-01 19:23:50', '2022-06-01 19:23:50', '2023-06-01 15:23:50'),
('98c94d72292c428d9098556d15c582dcfc67e8a3db21e811dcbd77b9711409a5fb0cf707512ac065', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-15 04:24:49', '2022-04-15 04:24:49', '2023-04-15 09:24:49'),
('9a43d5d49b602c7e7f8fde452335181d2a7fcf3cc264513ede665f43dd02665e3fbfc66f26578c1f', 13, 1, 'Personal Access Token', '[]', 0, '2022-01-07 05:14:50', '2022-01-07 05:14:50', '2023-01-07 10:14:50'),
('9ab58ab3fb7175c5d0e64de8f398d91261ce42c653731fa103ab9d9c21e082fad49ecdc8568c486a', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:31:38', '2022-03-30 04:31:38', '2023-03-30 09:31:38'),
('9ae03a996e56a8a6c18b091598daec519ee224685796754dc250cedd539da44c14e8eca385a6224b', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 10:28:50', '2022-05-10 10:28:50', '2023-05-10 06:28:50'),
('9ba2c52802368ccf9b13814236cb984ba6640d6ef951a6d1c533d062aed90a83be8565f961877046', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:57:50', '2022-03-24 04:57:50', '2023-03-24 09:57:50'),
('9c0359f5c4b859e9dbe1bfb7de917e883351dec952e207304c150bb597020f1541d79ab255e1c1e5', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 05:48:52', '2022-04-19 05:48:52', '2023-04-19 10:48:52'),
('9ccb3e4bb05d5d8ca589d885f45b037cc00a6066af0f2b83652662a76de56239cefff6bc02b9db65', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-06 16:07:36', '2022-05-06 16:07:36', '2023-05-06 12:07:36'),
('9cf76b4cb827687f6985d11e754ad1c3072bbba2f04247e11ce0b9554877c530ad66740282b4574c', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:39:46', '2022-03-24 04:39:46', '2023-03-24 09:39:46'),
('9cfb7988c0b43dc9f6caa85b0da17e07a07f67a5c98ac15714e2cfa822cc9b1d4de4065bfd1df534', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:08:25', '2022-04-05 06:08:25', '2023-04-05 11:08:25'),
('9d009d21b1ebf149fc188a5c8c8691580e660f50e5247686639de6a003f201d6cf82dad22ef1a9ee', 90, 1, 'Personal Access Token', '[]', 0, '2022-04-20 06:36:47', '2022-04-20 06:36:47', '2023-04-20 11:36:47'),
('9d7c7237dd63cec8068b25d6813bf18bb59ca2d39e66ff1aef9c60ab4e4b6746ea6e0599c3089893', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 07:49:43', '2022-03-24 07:49:43', '2023-03-24 12:49:43'),
('9d90bb077639c1b4945030d6489ce7c90c7b70ab89602c634b7511edb5f79a94fdd0d99ef8088200', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:25:50', '2022-03-22 06:25:50', '2023-03-22 11:25:50'),
('9df3f674e4f9107e3964928ff9c28392a1216ead9d8bcd2606fe76d8551b3e03b357e6710eff4bf3', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-27 17:05:59', '2022-04-27 17:05:59', '2023-04-27 13:05:59'),
('9e7203aa96af94838662e3c94b53de8aa71e1d94aea9b57be36c2ef97865d27a7844e8675e17c17b', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 05:52:32', '2022-03-23 05:52:32', '2023-03-23 10:52:32'),
('9e8fa92740be6496a4fec1a3bdf8277565e71b86dda23484a53a4438c6800f7637f939f00a2fecc1', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:05:43', '2022-05-10 12:05:43', '2023-05-10 08:05:43'),
('9ebea819796a80b22c457b42a940f0dc8e0f8c04fad4e18ad6413bfe60e66a6f0083eecd95b6f2fb', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-30 01:44:16', '2022-04-30 01:44:16', '2023-04-29 21:44:16'),
('9f42275c92f8fcc0967a3e93c7c269fb2183c72cca5022001bd1fe19edffd1196a9a894853db0720', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-14 06:19:34', '2022-04-14 06:19:34', '2023-04-14 11:19:34'),
('9f74d6d2cdd5c3159326b3d59ae3ccc010f1198b8825a5e4063468e9cbdd2d3b5f123b459da33987', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 12:49:22', '2022-05-09 12:49:22', '2023-05-09 08:49:22'),
('9f78f17ac422ef8777b8ddcacb29d4d0e52fcd83b0283edb691bc1ed395760a550503aa6b0c434ad', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-19 16:47:42', '2022-05-19 16:47:42', '2023-05-19 12:47:42'),
('9fcf12c8b2e9170eeb19d14072d940ae3b237d2e85c917223887db633915c95443a894890a2eee96', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 17:27:50', '2022-05-12 17:27:50', '2023-05-12 13:27:50'),
('a02727a9544bef0e54a54d55d74de1d71236ee876f8acd0e976fd3dc46defb112a3b9074906dd4ff', 88, 1, 'Personal Access Token', '[]', 0, '2022-04-15 02:17:35', '2022-04-15 02:17:35', '2023-04-15 07:17:35'),
('a04a33bffb933bb20698d0f2441df02319086e8ae7406a2c4744a1fadddda26dee01634209aeab73', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-30 03:57:15', '2022-04-30 03:57:15', '2023-04-29 23:57:15'),
('a073d8460b4d671b32b67aa7703747cc7845dee4b834c2369c765771e5853ac4290c3b06b3c11dfc', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-14 05:04:34', '2022-04-14 05:04:34', '2023-04-14 10:04:34'),
('a15981f6753cb0c1eed1e2ef33eadc50130e8634d487b5da53f293bbc233bff37c49468174557dbc', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-31 07:09:24', '2022-03-31 07:09:24', '2023-03-31 12:09:24'),
('a1827a65e484eae29bcce3a751f12396cfd0cca44c69c8eb9d1b14cb004eafccc2e63bfebd2343e3', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-06 05:57:36', '2022-04-06 05:57:36', '2023-04-06 10:57:36'),
('a18b4b3fc95182768a8d849b6ae35e944420d400ed6889a8674a2bc7a00e02dda9e9c83c4bf4155a', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 06:17:10', '2022-04-18 06:17:10', '2023-04-18 11:17:10'),
('a213271bb7e916ff4ee2698b040f974162d492ddc3beecabb5df176c0a5587a61b2db1dcd04ffbec', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:09:31', '2022-04-05 06:09:31', '2023-04-05 11:09:31'),
('a221e28514265730b0da09171d5abcf637896f7bdf11df86935133b7119abf3588ae3313cfe6d626', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 13:09:27', '2022-05-10 13:09:27', '2023-05-10 09:09:27'),
('a28ffe113399298141a9129f0ff6cc740a725e89aebbcf5c5c3efe37592cd7d39edc239f17c2b41b', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-12 09:18:00', '2022-05-12 09:18:00', '2023-05-12 05:18:00'),
('a31b7c6fd9bc4bc2cf0e6c3642200e35cba706d2fb26a9277a309f35bbeae7f12c5ddc1bcb4650de', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-19 16:13:28', '2022-05-19 16:13:28', '2023-05-19 12:13:28'),
('a33e8d273640aacc2e74651b310755f0b3f085eda3e9c7bf4f18c3dd697b1c298d146f02e51ed4f3', 40, 1, 'Personal Access Token', '[]', 1, '2022-05-13 14:09:38', '2022-05-13 14:09:38', '2023-05-13 10:09:38'),
('a373d9a2f1faad6c5d5f9947b49b0888f40471121f997d4c395ced81611279d5d2c2f5ee354d9d08', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 05:45:50', '2022-03-28 05:45:50', '2023-03-28 10:45:50'),
('a3ac7bbd6e8a05e31e5825acdfb5e45f900c7a5f0fe260cd3c3885ceadc47c1a93b0b07c87b4fc34', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:03:42', '2022-04-05 06:03:42', '2023-04-05 11:03:42'),
('a42918a00eaa39a2c4ae3addd0f932798a4f84d31be0a643a9e559ccca224eac9879b59b2bf96b46', 59, 1, 'Personal Access Token', '[]', 1, '2022-04-11 03:28:08', '2022-04-11 03:28:08', '2023-04-11 08:28:08'),
('a50e192df950ecdbba12b3188afa3007a4f15b55a4043c7d93abcad0252de52e97ab8ec644a0998d', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-14 04:55:11', '2022-05-14 04:55:11', '2023-05-14 00:55:11'),
('a54ed031910b915f0b4933278807b3588f3742cfeea206ab3d9c2c09bde58240689290e0da02b0c8', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-22 15:37:56', '2022-05-22 15:37:56', '2023-05-22 11:37:56');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('a5b48dfde57cd384b3707a7466e552f3c6ebe8cb098486b0c93b1f72f90592660921db23977cbcf1', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 04:08:46', '2022-03-28 04:08:46', '2023-03-28 09:08:46'),
('a5e9f8bbfd5c88a41c1a896d80156c33d91d7d1e85fcc2520347ef3cc2a0ab914e14187d58a52406', 13, 1, 'Personal Access Token', '[]', 0, '2022-01-11 05:54:33', '2022-01-11 05:54:33', '2023-01-11 10:54:33'),
('a61e92416ddf35f7fafaad4f5fe77ae8fb42288fa219e8530ee6e195b25381b1e4265d8e7b869aa5', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-15 06:48:02', '2022-04-15 06:48:02', '2023-04-15 11:48:02'),
('a63f0580942d4b57254d3b9b905b032ba7f7c7ca857d96584bc7fb467664385ca8cffe67d964ce0e', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:38:52', '2022-05-09 15:38:52', '2023-05-09 11:38:52'),
('a64da64d6acc8319da1cfdb1c186bb9c29920a883aa27c2b4a0bb804c15b7d20154ee5c9db38f0b2', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-25 09:52:57', '2022-03-25 09:52:57', '2023-03-25 14:52:57'),
('a671bdd9a707de81af6c38ca6c42ff311936b085bec50e2866df5edf02ab272b32d955b0857cf961', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-04 02:58:21', '2022-04-04 02:58:21', '2023-04-04 07:58:21'),
('a6afcbe53ad9c6c3eebf5030b836463723d0ccb6c403b84e654d2706f4871efbce49a09a5ba2d890', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:54:28', '2022-05-16 11:54:28', '2023-05-16 07:54:28'),
('a7db6bbcc160f3a4d169e1ef93d8ebb0d562a290c3995b8bba0b6f0a3c21d38b29b12fa11063c58c', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:34:20', '2022-04-05 06:34:20', '2023-04-05 11:34:20'),
('a841cc0ae902daec6bde1411b11164a07cc08c756f435162d4e99c1cc603cc47b0c0261531530aa6', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-19 13:32:03', '2022-05-19 13:32:03', '2023-05-19 09:32:03'),
('a980635ab15c80d73add426fc31eb58b7385f0c14becd2d6d6e4a967428246439434af805facb65d', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-14 05:00:38', '2022-05-14 05:00:38', '2023-05-14 01:00:38'),
('aa018b9dff869187a51d1047f58b2d26008c5386ac1a5bce902118999a2a30983984abe0a56a48d2', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-10 13:00:17', '2022-05-10 13:00:17', '2023-05-10 09:00:17'),
('aa82666c22a039467dd500d54c03a869a17115e6bd1d43317340fa9b8088f8516ad8836a35f6eb9f', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-29 01:05:36', '2022-04-29 01:05:36', '2023-04-28 21:05:36'),
('ab54cba74bfedc4fc49225613534cceef644c6fe4baf6ecff81ba1afe9d3672c13a574790ffba002', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-10 16:38:08', '2022-05-10 16:38:08', '2023-05-10 12:38:08'),
('abc924ee79bc2bfb2f4620796a314e8f75436efa250b1ecc281ba90596c1318e071767ffa0c320eb', 31, 1, 'Personal Access Token', '[]', 1, '2022-05-05 16:21:26', '2022-05-05 16:21:26', '2023-05-05 12:21:26'),
('ac3ac2a5896c5f6f0705c7997cff647812494370835c07ae67b8e96c0c02f519b27f2f0687788908', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:31:11', '2022-05-09 21:31:11', '2023-05-09 17:31:11'),
('ac3d9db5aa3fe6eccf107a853067126cc9c65a607f68c306b5593b00446a2b66281e63eabf11e56a', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-07 01:36:12', '2022-04-07 01:36:12', '2023-04-07 06:36:12'),
('ac8538e06af2b8642f151e622b3b79114be962fb8aa26ab2d26f0de4ef656be0abe4f10521a6c399', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:41:52', '2022-05-12 16:41:52', '2023-05-12 12:41:52'),
('aca0a14ffa5fea5bf5ab5b34194c23a5d46cd40aa7a554bce019e641e5e24a7e659d94ec33144eb0', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-16 20:32:18', '2022-05-16 20:32:18', '2023-05-16 16:32:18'),
('ace4331d5ad3b52a441015bb6787d890e394745c2823bc6ac078c7556f06192ffb8e82c8f7bc2e99', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 08:45:31', '2022-03-28 08:45:31', '2023-03-28 13:45:31'),
('ad1a395d6496f14a084cf24336b9ca2f36824a1edcb9dc3f76548ea03dc23f7fcb0aea67858e403d', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-14 05:09:34', '2022-05-14 05:09:34', '2023-05-14 01:09:34'),
('adb952f3ceb4a830819e89ed91e1eb629a8d842f64f0a70d07fc92a3dccef4e25127a8de83e930cf', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 08:47:29', '2022-03-28 08:47:29', '2023-03-28 13:47:29'),
('add22b18346c203fb11cddac0362d22c65988f7ce8a571706de8cf2aa9ebbdef422f0632a0906ede', 40, 1, 'Personal Access Token', '[]', 0, '2022-05-06 20:56:56', '2022-05-06 20:56:56', '2023-05-06 16:56:56'),
('ae006ab2882190f9084c2015d8f4769cf4e0c265592d4facef4630a44dc5ca57e915b489293a7e67', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-07 15:34:17', '2022-06-07 15:34:17', '2023-06-07 11:34:17'),
('ae8cdedf1a1184fc774efd7cb1e150ef996949f49dd0011734a74411dcc5db1047b5f40364b909c3', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 06:38:48', '2022-03-24 06:38:48', '2023-03-24 11:38:48'),
('ae944898294512954f3c19eee35c63162feba16432fcf10c786957d3343caba364d1f11f3c7fb72f', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-01 04:05:03', '2022-04-01 04:05:03', '2023-04-01 09:05:03'),
('aed5739ce3968f58f3650f7c385184a0f54278e65c1bdb6d335fec5d063e6b84cf45c153ed2dddbb', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-04 06:19:41', '2022-04-04 06:19:41', '2023-04-04 11:19:41'),
('af9fe5f7e33f7813cd7eb921af1e8684b58a485448a4d54d743cc7c87574f274a2a1cd4b30f08dd4', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:21', '2022-05-09 15:43:21', '2023-05-09 11:43:21'),
('afb92b2ca5c4cb5f514bc0eea5d3765d53d61592396cf2bf72a912bc312e0ceeb5c8acded798ccaf', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:44:43', '2022-03-22 06:44:43', '2023-03-22 11:44:43'),
('afbc6ef3f768fca894b777b3fbe33b606956c78e3b7a68bfd20720f27690c859e1571f00a013c784', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-18 13:15:16', '2022-05-18 13:15:16', '2023-05-18 09:15:16'),
('b0a0679e3da5be6cb132ab7b076748366d97cbac7b7bbe8c1d97abdaf38dab2d8b984453adb61da4', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-15 04:54:25', '2022-04-15 04:54:25', '2023-04-15 09:54:25'),
('b16cbe2456b03accf8de721735ae815d6ee1be40d55d3e252e48ed8df613a8ab8dbb7b116dcbca0a', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:04:42', '2022-05-09 15:04:42', '2023-05-09 11:04:42'),
('b18f263c21fd023e69cbc58b9cc24b844ddcc6d9836d87b12ae09193df7f27fb063c307683626d6a', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-15 01:38:31', '2022-05-15 01:38:31', '2023-05-14 21:38:31'),
('b1b85ffc81acbf1dffc982515b31e358f7bca78a53a1f5e1c449f9575894493a58e3709d94521fdf', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 05:49:09', '2022-03-25 05:49:09', '2023-03-25 10:49:09'),
('b2460270477d1c31b81b8ac3575412c29663d5bbd4c13e2e666365e7cc12f6ca921d28f4d88ebf64', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:01:14', '2022-05-16 15:01:14', '2023-05-16 11:01:14'),
('b246398b7a7e50f61b1b25cfeaf87bd40a12f10afc5b04cad2a17560445e87fd471d767b022c3caa', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-18 19:25:50', '2022-05-18 19:25:50', '2023-05-18 15:25:50'),
('b2bafbe0b06d2bc5f820598343c3e369a441a0c0fdccb79dbe6e13588cea92c491c139d12d9869c2', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-06 06:26:55', '2022-04-06 06:26:55', '2023-04-06 11:26:55'),
('b2f75e030955779a7ec209bd61bb91c50c94db8cb0b8b6d188b86e66311e108120ab3af849f13b6e', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 17:12:00', '2022-05-10 17:12:00', '2023-05-10 13:12:00'),
('b3059a8c857ec539c2b6e102dcee69856283e5b1f5ced15f3b9e97c88db682317186a241e8c6d4ef', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-19 14:43:52', '2022-05-19 14:43:52', '2023-05-19 10:43:52'),
('b3e958c76831ff64046fd3d6ec3380a27972c914a38e0782e17e0ada1b9a489cf70312d99087b7fa', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 07:58:41', '2022-03-22 07:58:41', '2023-03-22 12:58:41'),
('b43b6b5ae4c47922d1c9b3f5863cada1065583a71b572f27b11597ca1caadc7eff33189fe796ad8a', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-25 05:15:23', '2022-05-25 05:15:23', '2023-05-25 01:15:23'),
('b4615f11f68d749c10daf93775fb2be4a17f700555e80c40936d65614e1dbdbd886fc74d9c18435b', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 03:44:07', '2022-04-19 03:44:07', '2023-04-19 08:44:07'),
('b474f276f287ca4548d06f78562d66384e37d10b4f110b7b8b7e92ef3784496fc8788d75d0ab8017', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:22:41', '2022-03-24 06:22:41', '2023-03-24 11:22:41'),
('b51390936b5ed0de6a047273cd458a21c3dd539d492ade4a6eafb74e0f7789facd8b320a23e44819', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:23:25', '2022-03-24 06:23:25', '2023-03-24 11:23:25'),
('b5330a252f7409f665feb1d73953c3ec77fbc38ded6ace6989553ad46417e745a2e963269dc68260', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-27 01:52:05', '2022-04-27 01:52:05', '2023-04-27 06:52:05'),
('b5584dec068179136f1687e082993c7e1ffc6c5678f8fe69286039457d2be850ccf1ac7da160c50b', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:39:13', '2022-05-09 15:39:13', '2023-05-09 11:39:13'),
('b55e9d0c1efe5cc499cb939874724ef5aa84615ae8d93602c3cbca9aac60ca8094afec03f389a675', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:12:54', '2022-05-16 18:12:54', '2023-05-16 14:12:54'),
('b5682656839e168cc7242eecdfe4fab01183dcb07bad25ce4d7d115f10ce3b5d11c067fb676577c9', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 04:40:47', '2022-03-24 04:40:47', '2023-03-24 09:40:47'),
('b5bba2504a7ae128c55cd479df088b657a85a92b816b047fe462647f3ba9120d2c5855873d8ff44b', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 13:36:51', '2022-05-12 13:36:51', '2023-05-12 09:36:51'),
('b60c3e631919afec38ddb822c3f753ff71c178d9fc9a20510673b6a984af145f0859f01c41ef5083', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-29 00:31:41', '2022-04-29 00:31:41', '2023-04-28 20:31:41'),
('b72a0bebcc807be448fa6bd9fd33bdc4eee740b038d2d4f0be866b19c303016e6b54992156738142', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-07 03:26:47', '2022-04-07 03:26:47', '2023-04-07 08:26:47'),
('b74e8aae635a6fcd8a94e16292e9046d1cd31b9639cf21b5c7264a75c2cf0d924b32e758a88bebdb', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:58:23', '2022-05-16 11:58:23', '2023-05-16 07:58:23'),
('b7bfb81c23cb77f48759bb9f4bd16da44223320da22087f4f8d6e0ef72ae0c3836aacf168b2287b5', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-05 13:48:18', '2022-05-05 13:48:18', '2023-05-05 09:48:18'),
('b7eb285a691262fd2df91dc78e9aa14af2266e5db511dbb177f8eaeb6bb4c25861283a8cf68e9fcf', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-17 19:17:01', '2022-05-17 19:17:01', '2023-05-17 15:17:01'),
('b80268d8b8bd156a58d6ff8fa23651c5cc5fa6d00e260005fa011101d2874cdc5a65797289db9c98', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 07:21:21', '2022-03-24 07:21:21', '2023-03-24 12:21:21'),
('b8dee8950c2f482d1f377f112a4f41a790f557fcb5af4a5bf2c85c6f4ec78ebf39af02650f2ca555', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:01:13', '2022-05-09 22:01:13', '2023-05-09 18:01:13'),
('b8ea2e4bb2ddc4f9164095c00988d960c6054591ffea29aae3edfc8b3718ab314d6c905b9e59295b', 5, 1, 'Personal Access Token', '[]', 0, '2021-04-30 05:40:03', '2021-04-30 05:40:03', '2022-04-30 10:40:03'),
('b903b3f76b564eac7239d5a449151fabfdcddb9fcacd89c708bfaf0915b124568f935fc7bcd8ece1', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-06 02:10:10', '2022-04-06 02:10:10', '2023-04-06 07:10:10'),
('b92705247e002a4714a2a90b26ff154c465a76bd0827fc4baa351fc3652bcaae01c4c5cb510859d1', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 18:00:45', '2022-05-16 18:00:45', '2023-05-16 14:00:45'),
('b93612474acd7670034413dfe943f5de630b8c733339fca6ec4b872e10312e558d06fcc00c4d97d3', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:31:27', '2022-04-05 06:31:27', '2023-04-05 11:31:27'),
('b970f38f6ce2a0313d7623e6a052106c7d3eb8213a08c9e1f2d7359e437b0471e463ba60b7d3af04', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-17 19:09:17', '2022-05-17 19:09:17', '2023-05-17 15:09:17'),
('b9b4f6f49b7b91fbfa2d48e624b9bfbf2825498a5a56989c24a62b3331a22f8ede8d5c584a6cefb7', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 07:54:43', '2022-03-28 07:54:43', '2023-03-28 12:54:43'),
('ba7899260c2fbcb8b5886235b9ce56cfe310addb9dead349c89ce9e6b497e198a7a7f63a915e7577', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:30:28', '2022-03-28 06:30:28', '2023-03-28 11:30:28'),
('bac91a14f350ee2daa33a06be95bef71369590141909fc49167afc2ccc54137a2657bac9d5698cd0', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-06 07:12:52', '2022-04-06 07:12:52', '2023-04-06 12:12:52'),
('bb3eb241499dbf6d70839c072869bc2b30e1f98733fea0aeee80df61e7d08411089fd9f9623d7a86', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-13 16:29:39', '2022-05-13 16:29:39', '2023-05-13 12:29:39'),
('bc6987267408084479a3ea1de8acfa8f1a376533de1699a3be49500a6d05cebeefd8de587e613054', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:54:09', '2022-03-24 04:54:09', '2023-03-24 09:54:09'),
('bcd7727a54abf4f063956ed585b564bf880ee8226bd45046bc7a371ff58c99e42f0116911ac5329e', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:04:05', '2022-03-24 06:04:05', '2023-03-24 11:04:05'),
('bd13acda1a69b66cd67f3dcaf5c285981fac17ecc021acbf06343197a054329e787eae1f7092ca38', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:29:47', '2022-03-24 06:29:47', '2023-03-24 11:29:47'),
('bd1afc0a451e6ca6fc354d6c01aec6a75734beaac83b31f3d37af1626b0111e80404dd2d2dfa431d', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-07 01:31:35', '2022-04-07 01:31:35', '2023-04-07 06:31:35'),
('bd77ae08c8e3961ca89c644f42fcfb1b3b915f514688ee9af18239555c71d52e09573deebe30a282', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-18 16:59:51', '2022-05-18 16:59:51', '2023-05-18 12:59:51'),
('bda03f619974cd5c528528400754db67c9e64d83ca7dbff888b245e151d01435e9af165f10d1b1c3', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 20:29:57', '2022-05-09 20:29:57', '2023-05-09 16:29:57'),
('bdc97fd9b7332f3f4296f0b5334c044c25bce166145d5b2f7e1d2c731b36d01c1d58094d58e5c64e', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-19 12:52:05', '2022-05-19 12:52:05', '2023-05-19 08:52:05'),
('be1b5e513135a47fbbe41b5f8ba8b77bf934ca63045b4250222729abf2e1f980e5f9c62351a7d896', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 17:55:13', '2022-05-16 17:55:13', '2023-05-16 13:55:13'),
('beb18785a71f75613983e1d7b0afb0eeb375691c1a7e7556e2270d4259c2d89defe24e7925756b89', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:54:57', '2022-03-28 06:54:57', '2023-03-28 11:54:57'),
('bfa9e131c97e37da71efad73695a09fa48463cf79c10b9555ac85b18b1ddbb29415a72b364918dd2', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-03 13:30:30', '2022-06-03 13:30:30', '2023-06-03 09:30:30'),
('c022e107615d7a67a33910136df8d4ec4a97657a612397ace31d8ecf679109fe189d666394311983', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-16 04:15:40', '2022-05-16 04:15:40', '2023-05-16 00:15:40'),
('c04b9d24cc4d1248d292fb08439b0d871b271e9a89941d837ca24c4c70dbfc2ef289d95edb9803e5', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:43:27', '2022-05-09 15:43:27', '2023-05-09 11:43:27'),
('c0cbdf9dbb64098cccfe6412de0471b79e9842854f2e4f1aa9a89a17475f8c5d246537adce8fbbd8', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 02:22:45', '2022-04-25 02:22:45', '2023-04-25 07:22:45'),
('c0d96dfc68c59cad62d82c578c24eb918f208dbf8e51c8963e71b9fbe696a22f10a9904e81fdae33', 91, 1, 'Personal Access Token', '[]', 0, '2022-04-28 17:50:35', '2022-04-28 17:50:35', '2023-04-28 13:50:35'),
('c1410eebbb23e993666ce12a1b60b2d9c4cf99f87944116b64a92c4980054446108915c1e2f7a28a', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-19 04:36:21', '2022-04-19 04:36:21', '2023-04-19 09:36:21'),
('c1935c05244f9474f6eebef4c05ef2c7c5a33fbbbbd80cc6eaaad06484807f8b6649d46cc2496302', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 08:14:17', '2022-04-01 08:14:17', '2023-04-01 13:14:17'),
('c198f21045583ad111bfecf1e25a69f69c3c404356acc9c8e64cba7aaaabf231b061532b19a539ef', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-27 22:13:55', '2022-04-27 22:13:55', '2023-04-27 18:13:55'),
('c23f4204af6134652286432db85f0d65d9820c1e4adf81005f22fbf816fc8ef3a61e5369f7fccaf8', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-25 03:57:07', '2022-05-25 03:57:07', '2023-05-24 23:57:07'),
('c2801827c724fec6549bbf37f1cf1520d424d4ab55ab0f7433d5f41dcbf1171949bab86901053bad', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 15:06:39', '2022-05-16 15:06:39', '2023-05-16 11:06:39'),
('c2f1c7cde5a58ff876c85453a6aa105eaf817ea84b0cf6b21454a8d668b96474ec087dbd35634db5', 29, 1, 'Personal Access Token', '[]', 1, '2022-03-31 06:02:45', '2022-03-31 06:02:45', '2023-03-31 11:02:45'),
('c2f96709e7ff6c6bd0d0b85eb3fb51fd6feee660aa715278f7ac4e7514dfd5cc53ab43653b2ca24d', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:34:53', '2022-03-22 06:34:53', '2023-03-22 11:34:53'),
('c3bb37c4c63d20357a9077402529ccd13effbf7e70c49bfdaba5d01c5c7d284d1158bdc2ee9c4fc0', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:02:26', '2022-05-09 22:02:26', '2023-05-09 18:02:26'),
('c416c4b83c8110e76e236c3c5a49bd7b0ca75e2caf9d3dc2b56dca3f0d97290ad0271091a19ca4cd', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-29 14:00:05', '2022-04-29 14:00:05', '2023-04-29 10:00:05'),
('c44628924d65b443908613a41ab12239c2fe4f29fbcff72498de123c755e037e2bc9e6276ee63ae1', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-06 07:10:17', '2022-04-06 07:10:17', '2023-04-06 12:10:17'),
('c4504b4ff3a368b15fde3386c0d71e8c77c3533af6d0cd6146199f2a697f260a66bb402c3b823128', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:31:11', '2022-05-09 21:31:11', '2023-05-09 17:31:11'),
('c48ce3dbf18163eedbbe283b322f17f843f0ebd428227f5fadac634046c60bc39a987fe49ab4ab29', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 12:47:16', '2022-05-09 12:47:16', '2023-05-09 08:47:16'),
('c4c8012922e15ef2e3c0543a85385225a2791cf3daff52fca418ac6ce962db81f4e3d88ebd111a63', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 07:59:45', '2022-03-28 07:59:45', '2023-03-28 12:59:45'),
('c4ccc6b14c0acf23c20f169ec9965003aad3cb270bbf39f95e70663366edc73206efe2f75c50c218', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-12 20:37:40', '2022-05-12 20:37:40', '2023-05-12 16:37:40'),
('c4d664671214e30d8d5f6e29f3d92fef85c7e815a239e84797bb97d3326c1941e0899d75689e662f', 89, 1, 'Personal Access Token', '[]', 0, '2022-04-18 06:40:59', '2022-04-18 06:40:59', '2023-04-18 11:40:59'),
('c4f5372191ba2cea85d4b8bd6cf3d84a1b0821fba146a4680aa1d1f682868aacadb31b05efcc0f90', 73, 1, 'Personal Access Token', '[]', 0, '2022-06-02 18:48:57', '2022-06-02 18:48:57', '2023-06-02 14:48:57'),
('c4f57610eec68006677467980525e49bb846391c128e8723cba2c2939ff437dc84d9cc42955da6fb', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:58:16', '2022-03-24 06:58:16', '2023-03-24 11:58:16'),
('c5ebd8052dba3caf7a17a77460585e6e223b7e6f5685b65ce24a95a62cb86e5decfe229db2293ea0', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-29 04:19:11', '2022-03-29 04:19:11', '2023-03-29 09:19:11'),
('c5f3d55f9c42b514c7c6e3fb1b3e55609da343b74da64246b6de56e415a44f0a73df2fed89011595', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:39:45', '2022-03-24 06:39:45', '2023-03-24 11:39:45'),
('c62d7fb16943a63a67c1ace30e8139138a6d657379a457fbe91b08ff8b2f1e669f6803f632e7ac9a', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-20 07:08:22', '2022-04-20 07:08:22', '2023-04-20 12:08:22'),
('c71baf54268140c1b38aeadf9033bbc36ab4b066cde53128f781e8192238985b0a2e109f28f1227e', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 05:55:53', '2022-05-12 05:55:53', '2023-05-12 01:55:53'),
('c764012790b90138781c11f918fd41938b57fde0e2f61b4cf4a9f6050cbab842d5e7b158e04326ee', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-17 19:03:01', '2022-05-17 19:03:01', '2023-05-17 15:03:01'),
('c7f65b3ec8b71e336b06de70ff1c2f9c96d7449a58f3d279468b4ff09e18ca4497745b8a07335e5e', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-06 20:39:14', '2022-05-06 20:39:14', '2023-05-06 16:39:14'),
('c83d4a48ed4aa8b3fcb4462924ff0cd0564bc07ca1c0f5469628adfbfd09e89eef2103741beafb80', 53, 1, 'Personal Access Token', '[]', 0, '2022-04-06 03:31:53', '2022-04-06 03:31:53', '2023-04-06 08:31:53'),
('c916a5e839c68e118c1d842b5b2afd4d01e08fa7ae4bd96e43cd0b7bdce58caa043ac886c5def994', 59, 1, 'Personal Access Token', '[]', 1, '2022-06-03 13:48:49', '2022-06-03 13:48:49', '2023-06-03 09:48:49'),
('c95d057eedd4386be07b5fd402f063ccf9155e3fe0e6d8c80184b0c21a38678154959273b25caa3d', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-11 15:05:25', '2022-05-11 15:05:25', '2023-05-11 11:05:25'),
('ca06c172b841683502cbe2513e1c477ee03648311681862b86e0e09f3d75ea1c3ccaf4ef8856f86b', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-06 01:58:39', '2022-04-06 01:58:39', '2023-04-06 06:58:39'),
('ca79120cf2978ce7002ecb179680cad873ee09ebd9bf2b824f15b848716399ae86f7dfefacfd81a4', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 09:48:22', '2022-03-28 09:48:22', '2023-03-28 14:48:22'),
('cb4db35143527ae7f7933a290420090af74f72fc8bfad85c23498f5d0696da25e285bc2b4a5f7292', 13, 1, 'Personal Access Token', '[]', 0, '2022-01-07 05:06:11', '2022-01-07 05:06:11', '2023-01-07 10:06:11'),
('cb5bafccebc990201a9d6f33543d291229bc9f0ff5c10e4b33c37154c21f1185104f230362fd9e6f', 112, 1, 'Personal Access Token', '[]', 0, '2022-06-06 15:30:37', '2022-06-06 15:30:37', '2023-06-06 11:30:37'),
('cbf0f75957c92c46aada3bd5c191ca203037630dc9693847d1e6f0caf5457c151b3cccad0c304b16', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:40:21', '2022-05-09 15:40:21', '2023-05-09 11:40:21'),
('cc3552079eb78d7b74a293d346e3d4a241bb5c53999804ec8522f53069b9bfe934805e1e669709d4', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:29:49', '2022-04-05 06:29:49', '2023-04-05 11:29:49'),
('cc5f1bc45a2a01b34da3cd871c7dedafb0148ef68030fe276957e2236e27eeea71048c5b19fdeb50', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:44:13', '2022-03-22 06:44:13', '2023-03-22 11:44:13'),
('ccc577be04a3289f70d8c7d029d97c02eda6c2d498ae2607866d79552929b9c956cc3abee2034854', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:37:24', '2022-05-09 21:37:24', '2023-05-09 17:37:24'),
('cd61c873e04b39b314f66673bf7c0267bd6719f6d6e28b8e5e050dad127576a1d4691cf3263f533b', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:42:13', '2022-05-12 16:42:13', '2023-05-12 12:42:13'),
('cdcc57cbfea04b50feb70e1d061c3c41503822685eda0009471c8bdb3e5995fd02b9cae8b2aa1e08', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:34:12', '2022-05-19 20:34:12', '2023-05-19 16:34:12'),
('ce172d4480a5c974d2cb720ba34f3803d2e8366048e0543364458a722ad039bea7f3f30bd5d5784d', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 05:51:28', '2022-03-23 05:51:28', '2023-03-23 10:51:28'),
('ce62af16d828bb11f891eeb822fa148024be5541d9bf98d7d079be3968e0ef8dd71d8234bf60aa3b', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 02:22:33', '2022-03-28 02:22:33', '2023-03-28 07:22:33'),
('ced35d5c3ef12a0491b9f62196e01d139131bdbf7e92fe14a205f8937f2a4e1505177bf939923681', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:49:04', '2022-05-09 21:49:04', '2023-05-09 17:49:04'),
('cf6e37025799db0a8a63811c9a4a30358354c35a94ec31a36309276cec2068d9af6db1e4e8cab056', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:34:42', '2022-05-09 21:34:42', '2023-05-09 17:34:42'),
('cf70e3a826718675ca78cc6cfd6fe03efe26ce771f815672bdb1e14b7a50270ac81038319dd73a18', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-10 17:37:43', '2022-05-10 17:37:43', '2023-05-10 13:37:43'),
('cfb94c60799c549b08f05c66837d21a59fa242caf51d8a072ffa3329673038a91793f1e754821a07', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-12 12:18:39', '2022-05-12 12:18:39', '2023-05-12 08:18:39'),
('cfe41260795e29ab8dab77a47cb0baa2787a20a55b58dd7990409b9ef84060f24c3ab14a023879c3', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-24 14:54:31', '2022-05-24 14:54:31', '2023-05-24 10:54:31'),
('d063d0a295e1e49a901277978d9e9d9156cf52eaabf150568b1b2b10467505885b0510aabb2e16c5', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-18 14:39:02', '2022-05-18 14:39:02', '2023-05-18 10:39:02'),
('d07cd1eaf955a15ae8887d6de2d12c973df9bf4d8e0ee8c2f9f1bad6287a9a5bfa18db11f94a9c64', 35, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:29:29', '2022-03-30 04:29:29', '2023-03-30 09:29:29'),
('d15d902004b0e72e6c1d75aea1b4488ed27dd3826e0949c97b79a54a9b2a9ebaf2c12e150333c818', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-10 10:28:50', '2022-05-10 10:28:50', '2023-05-10 06:28:50'),
('d188b248910903e253fdd0daddcb2fb423cca6f4f8e3edf0684ce786f417bb7821ba9734c4a07768', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-13 20:20:11', '2022-05-13 20:20:11', '2023-05-13 16:20:11'),
('d21bf56800c09209b1e6ddffdea2e3673a604d541b56b6deb6f2726191b4a1f50b952fb7a519120a', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:37:36', '2022-05-09 21:37:36', '2023-05-09 17:37:36'),
('d24460a3abeeb26fb586270622212cfa84293ab2ead1d1ceed4626ea142354473446c32056637e6b', 5, 1, 'Personal Access Token', '[]', 1, '2021-04-30 05:39:09', '2021-04-30 05:39:09', '2022-04-30 10:39:09'),
('d271c06c9b71cd8b81ae42ecb58c52165fd7e048d4390caab5ad7d49d5c60b545d1ce6cf532678a2', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-13 16:39:17', '2022-05-13 16:39:17', '2023-05-13 12:39:17'),
('d2d5fff59c68f7730c2da51283a94c009970b6b24f3a4bd581a847065f19de21194cc90af3a91998', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-20 04:43:48', '2022-04-20 04:43:48', '2023-04-20 09:43:48'),
('d2e55c3a459cf245ad5250c304cd6281e851d37e318fa361277d9fc745fbc869b2d5b64f0e408ae0', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-16 20:20:42', '2022-05-16 20:20:42', '2023-05-16 16:20:42'),
('d43ba06b4b7725b1163236154ed9046ba295d8b8a5fdc57b704a87f989b705bdb477d09b8beb9d93', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 05:54:50', '2022-03-23 05:54:50', '2023-03-23 10:54:50'),
('d480db252c61de2df75dd601b6178302f9f22e9cd64443f09b2d36d5802fe4a371ee0ac88a397fd0', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 12:04:24', '2022-05-16 12:04:24', '2023-05-16 08:04:24'),
('d4a2e9fdf84e5e47ea2ac871f8bf1cee7f68d1c5780f74a1eab7efbbd7664ba12939cd2225b683d9', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:20:21', '2022-04-18 04:20:21', '2023-04-18 09:20:21'),
('d4dbef91e84f83ad43f3b1eee7d4cafaf0f65a9dfdf67f89f671f2d3409f86b20fed03b3309e976f', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-05 06:18:09', '2022-04-05 06:18:09', '2023-04-05 11:18:09'),
('d570e921cffab106c2cb60da79d536753457d6604eb4e8970405c4bf3b6141babdaa6ab250c9cbca', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-04 03:10:47', '2022-04-04 03:10:47', '2023-04-04 08:10:47'),
('d61072f6f82640aca8336ac040b03319c9055b994b42d86be281c5775cb56251273a204614ade6e9', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 01:32:21', '2022-03-24 01:32:21', '2023-03-24 06:32:21'),
('d6776e1d93c92d7adcd26b07f95594b8f9beaf4fdb7b1fdeb480e217c4c0910a36ed60605cae6521', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:54:26', '2022-04-05 06:54:26', '2023-04-05 11:54:26'),
('d689ae32586fa88b36d52e586f7b2d7b14ed641239a464fdb111f3e4243787fd753537a8f4c547d9', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:17:28', '2022-04-05 06:17:28', '2023-04-05 11:17:28'),
('d72ee01d6f2447e6cfb32f9e69df0b214d7711b25a1a1b7039b65b45cbf56fb98130cb817e870be0', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 12:00:45', '2022-05-16 12:00:45', '2023-05-16 08:00:45'),
('d79f274eb8891d484138a4d06a08fb7d5dea3c7d49474bc7a33d685f61b9fb3199da7c02c592aa29', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 10:54:02', '2022-04-01 10:54:02', '2023-04-01 15:54:02'),
('d8127a3b81c3dfe8692f1dbf4c2265c127b2aae51f7cbd733c53ca3c3f70eb75a043623f0c365d73', 73, 1, 'Personal Access Token', '[]', 0, '2022-04-07 13:23:13', '2022-04-07 13:23:13', '2023-04-07 18:23:13'),
('d8299ba9c27cfeccff9f78364462a09b81849e6051275409621e609423ebef39a6fc418e54856540', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-19 19:47:55', '2022-05-19 19:47:55', '2023-05-19 15:47:55'),
('d836217d26533ff70a7f650518fdaee477d0b132e993e439551cfb0aa78a125f86eb93f922b45f4b', 41, 1, 'Personal Access Token', '[]', 1, '2022-04-05 06:59:56', '2022-04-05 06:59:56', '2023-04-05 11:59:56'),
('d8a3b2ddfdae9e370749aaaf3c5f72ac77693c894277af0081dca5e2456faca3c69ebb6e8a7beb7b', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-17 16:54:08', '2022-05-17 16:54:08', '2023-05-17 12:54:08'),
('d8ce8e0914428def1f212ad835f880a7370727ebdb64052740566df77e3ab4c74328d505d7b78801', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:18:07', '2022-04-18 04:18:07', '2023-04-18 09:18:07'),
('d8d2ee6ef0f0c8949171684deea7b08dd2619b8be103cba0a02dc78d410621537bbe9d9490fe6345', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-13 04:40:18', '2022-04-13 04:40:18', '2023-04-13 09:40:18'),
('d957b0ba8c38128df8dc7a9a881df1c674f348161c46ded290675bc734739e446329424a7f384fb2', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:56:20', '2022-05-10 12:56:20', '2023-05-10 08:56:20'),
('d9d2cc2369c66c33a0026aab50991899df53d1f57306180dc90fc8e50443e3669eb2c1596eb57589', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-29 13:01:12', '2022-04-29 13:01:12', '2023-04-29 09:01:12'),
('d9e2f7db0d20484fed4471c595fd1b179099e01302863e4d9e2c44839f0430d01a609b8c804cdaca', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:47:10', '2022-05-10 12:47:10', '2023-05-10 08:47:10'),
('d9fdbbb282ed64d5d1f179c679330c103bf58d8860662db4f98d4d59b5ccc6932afce0cb0faa1952', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-12 13:15:16', '2022-05-12 13:15:16', '2023-05-12 09:15:16'),
('da425fc01bb74ce6c633f1eaef896e95c8c8dccaae7d4b056b83bb89b1a43e88b94d1196b1dfae10', 63, 1, 'Personal Access Token', '[]', 1, '2022-04-07 01:27:43', '2022-04-07 01:27:43', '2023-04-07 06:27:43'),
('da446bb0d29b5bca4d0e6567b278dd6771ae64f5ad963550d0dc29820eab5cc6327fc63233d0b06a', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-07 13:02:04', '2022-04-07 13:02:04', '2023-04-07 18:02:04'),
('da88209b74a29f372e2104310ab96f3b1e4394482e5b11030df7784cb873b97baadce0d96f8f94ae', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:21:49', '2022-03-24 06:21:49', '2023-03-24 11:21:49'),
('dab0bb83fd4f2b110980d0680541331aa5bf2edc1322808a72f15ec7839d63ac912cc3742a4e3629', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-24 06:20:13', '2022-03-24 06:20:13', '2023-03-24 11:20:13'),
('dade03061ef17f8602ff5bfb5a3fbd948690115eff05b259b1c075e5f06742f9427f07ea0821ddcc', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-31 06:06:02', '2022-03-31 06:06:02', '2023-03-31 11:06:02'),
('dafa89781e3d63298625157199e3fbef9ade9c665db3e6fe5785055ebd84cb9bde68aa8d2f2cad44', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 06:35:33', '2022-03-23 06:35:33', '2023-03-23 11:35:33'),
('db313816eb179c5040457f4900b328b1427ca23079c77b8cfc8e568985277ba6a41bb516141ba2e1', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-15 02:11:43', '2022-05-15 02:11:43', '2023-05-14 22:11:43'),
('db9c1286b58841bcc3d60bb44276affcf8c896d90ced360e931cb17b115e198380a748fad8593183', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:37:27', '2022-05-19 19:37:27', '2023-05-19 15:37:27'),
('dbb166e07ae62fcd48f46f3f2e80122877887b8204d7fa4b65460b3f062d1ecf16330164c94ba767', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-21 05:12:16', '2022-04-21 05:12:16', '2023-04-21 10:12:16'),
('dc0967fae4b106f61c697a2f92f712dc04f767ee52f88b4d7d30a0c18c9646a6d7247e66268271e5', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-30 02:17:26', '2022-04-30 02:17:26', '2023-04-29 22:17:26'),
('dcefa4b9cdf997c969a215339766ad515bfd92d0f612e5199cc645817eddce1fd29d8a717dbe7e7a', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:53:29', '2022-05-16 11:53:29', '2023-05-16 07:53:29'),
('dd793d31f19651ea604d9345938d1bd5e4a44a2e58890831119e2dff271f0d1fbf04d597ceb59c04', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-07 03:13:47', '2022-04-07 03:13:47', '2023-04-07 08:13:47'),
('ddab32067e079fe23ee20fbe81e968fa85184df5721bb672485ca60640339409538cd8a5a729b8c3', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:30:08', '2022-03-30 04:30:08', '2023-03-30 09:30:08'),
('ddb37dcd8ced06d96a71b9e161ce7e26004df8b9d40e3e9808adec6b82cee17fecf1cd5161a17214', 34, 1, 'Personal Access Token', '[]', 0, '2022-03-29 07:28:53', '2022-03-29 07:28:53', '2023-03-29 12:28:53'),
('ddb57d2355ebcc2f927273ee6754a52523a34d79fa6abc770a0eeb92f334312019137029c314fcc2', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:23:15', '2022-03-22 06:23:15', '2023-03-22 11:23:15'),
('ddc003e0611c3a65a3828c226e49d5a2a54bfdd96474055603981b65e6174b47156722e243281eca', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 04:53:30', '2022-03-24 04:53:30', '2023-03-24 09:53:30'),
('ddfdbb5ad3e0926d67d39b0ba7fdb8e8acbd6a3362ce0fc8c648c6e0073eda13fefb2dfed0be3a2d', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-12 13:15:16', '2022-05-12 13:15:16', '2023-05-12 09:15:16'),
('de4391219050e640cb9e822fc0fb88eb68ef5847390460feb2b330bc9edcb3bf798404906e4b04ca', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 02:42:38', '2022-04-05 02:42:38', '2023-04-05 07:42:38'),
('de72d2292b03241157d757d2fcd823dd912e360f0f238710617b6f9ea362a0e8ec2fe3168ee9e082', 109, 1, 'Personal Access Token', '[]', 1, '2022-05-16 15:05:33', '2022-05-16 15:05:33', '2023-05-16 11:05:33'),
('dec532729f19e11afa3a91be3eac1601150df49640fcc406855f615c578a533e302f600ca1120689', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-06 20:38:50', '2022-05-06 20:38:50', '2023-05-06 16:38:50'),
('dee77d6caea0d62612b99ff209996f6ae784a0dd16eab8369d283876ff6ccb472ba4334fa414a0cc', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-25 05:15:23', '2022-05-25 05:15:23', '2023-05-25 01:15:23'),
('df15512893930746080f6b8747485bd153b1fce901c1d271dc59ae2b15a3d25dafe8b1e9d593b630', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 16:14:50', '2022-05-19 16:14:50', '2023-05-19 12:14:50'),
('df434e159e43174dd8dceface35ba3f2203416cbb62114308c23bf989a1125224b2e3280038d9bab', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-04 03:13:51', '2022-04-04 03:13:51', '2023-04-04 08:13:51'),
('dfbc459d3e7672c8ba540004382c659f17684e10384986b1fc52be96f504073b613ee2707099485f', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 17:11:15', '2022-05-10 17:11:15', '2023-05-10 13:11:15'),
('e01f0c43047024fb363d3c06a4280272db3b1ca11c75da2499a02b7659fa99f347de6172998a2673', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-10 17:11:15', '2022-05-10 17:11:15', '2023-05-10 13:11:15'),
('e03228908aedeccce5c5922820dc984563dd596ac0bc72677d03879f06e14b892982b0a5df9655a9', 31, 1, 'Personal Access Token', '[]', 1, '2022-03-29 03:08:00', '2022-03-29 03:08:00', '2023-03-29 08:08:00'),
('e089856c460c58279d8f27e4e3ef0b514a991620c7c94bd96138976a159b517b5f3c18f5ddec6b72', 37, 1, 'Personal Access Token', '[]', 0, '2022-03-30 05:45:33', '2022-03-30 05:45:33', '2023-03-30 10:45:33'),
('e150511948e7827f4bf66558f9853c81da2a3fa5d13eaf43b37619b1351d406dee88fdd0f5e212d4', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 09:21:32', '2022-05-12 09:21:32', '2023-05-12 05:21:32'),
('e1f8e76c136177e43a41650cb52a575a8ff6b6e64aa5f8d131b1a9b4becd29c41de5064e54e1a357', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 03:03:47', '2022-03-28 03:03:47', '2023-03-28 08:03:47'),
('e25282e4a6c1329f58ee8b053ca9e8975d3cbbe2d211015611560ce8cf5502cfafe597c3f01fd414', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:40:47', '2022-05-09 21:40:47', '2023-05-09 17:40:47'),
('e2734bb69f760787177709d6ec6f1cc6362211716a620bfa5e33f53219af0e1d796eccf2751c484b', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 16:39:39', '2022-05-09 16:39:39', '2023-05-09 12:39:39'),
('e2a04ecc3ad9d8aece790f294f20488a87bafa5fea7ae6e0f981a892e11162021dd6473009009082', 24, 1, 'Personal Access Token', '[]', 0, '2022-05-09 15:39:13', '2022-05-09 15:39:13', '2023-05-09 11:39:13'),
('e2abec324b125d5c90c7fe69882f00817885b214311f576abf98f4054edd70f763dcb8d16abed044', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-25 03:43:01', '2022-05-25 03:43:01', '2023-05-24 23:43:01'),
('e2f66f8e4049c7d242ea1342ac03df931f0c428657353e5fb385719aacfed9055bfd004916939376', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 09:57:24', '2022-04-01 09:57:24', '2023-04-01 14:57:24'),
('e33aa5a959761c80a490a4f15eb9ab8f97cb9212d8f300d91fef2dceb9de4a2ff60599a67c2bd166', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 15:26:57', '2022-05-13 15:26:57', '2023-05-13 11:26:57'),
('e3b63028fa34f2e2357afc3b9f28271c38460b8eceeadbd872a2baf7dc9b8c0e9576a518ff65bab9', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-17 20:19:54', '2022-05-17 20:19:54', '2023-05-17 16:19:54'),
('e3cb173c8a9c5d96611840d9d2a35118f43ec53ba169e2730d29f5603a9527fff4b7e6851dffb3fe', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-13 01:36:32', '2022-04-13 01:36:32', '2023-04-13 06:36:32'),
('e41b48ff35cfe121ec6f88a3e6f17f7f31e0cf4345d337d33a1435bb3977921b52ea362381b39d7c', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-27 17:41:11', '2022-04-27 17:41:11', '2023-04-27 13:41:11'),
('e4908fb4055cf1436472a5034e9e5219e70e4f4c79d00e31d79209349a83d8843e8cf26851d2b442', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-06 18:33:44', '2022-05-06 18:33:44', '2023-05-06 14:33:44'),
('e55f4a1d134c469cc8c5e877e001bb6a85a2bb63eeb1ebf3abd2ee22482bc53be3e9f48025183261', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-25 04:18:55', '2022-05-25 04:18:55', '2023-05-25 00:18:55'),
('e5fb5cf03b53e431e7bfff4c36cae447dfa1c098d86ade2359503cdc45a1cd38ed7cbceea2428503', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 12:08:30', '2022-05-16 12:08:30', '2023-05-16 08:08:30'),
('e629234e636ce2671ba06565dfa43766182b33024c5534ac7b41939f282818397abc3a5ec2168ca9', 31, 1, 'Personal Access Token', '[]', 0, '2022-05-20 10:47:28', '2022-05-20 10:47:28', '2023-05-20 06:47:28'),
('e64672fa509d3d64304675e25a482b1dff7565c61c2b57855fe167bd369adcb0107b70704d9b0b8a', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:57:45', '2022-05-09 21:57:45', '2023-05-09 17:57:45'),
('e6f218aec7221a58fee5a7e75afe228eb020b6da7cd86406f259fe122b9cb9cb4bb6c0ba562739ce', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-27 18:00:17', '2022-04-27 18:00:17', '2023-04-27 14:00:17'),
('e74fe4447d5119fef9f0cfeb3675c95cbf9c468912998c06d96a3ccb89dd7f5e9ac95c938d843a86', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-12 15:09:32', '2022-05-12 15:09:32', '2023-05-12 11:09:32'),
('e7666cad9528de45051f512d1905a577b1cf19fd88d180d26148587e15a4d3e7e58a3840386dc8bf', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:51:39', '2022-05-09 21:51:39', '2023-05-09 17:51:39'),
('e7b616c5103081ba745604eb6c53a26e04571a41d242ec93bcd0892c893df5beda080327b86b8ae5', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:34:42', '2022-05-09 21:34:42', '2023-05-09 17:34:42'),
('e7b7a586f6ad3beda7bc34fc98eed4dd20a49f2017919aa48d7b3be1741f0ecf1acc56fc597302fc', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 22:02:26', '2022-05-09 22:02:26', '2023-05-09 18:02:26'),
('e811543347efe7ac6bb3fa02bd7c7b6e0b8ad578b1c59acd96f2304227ab4bac919563e79de52614', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 10:25:38', '2022-04-01 10:25:38', '2023-04-01 15:25:38'),
('e8252c6ae0991e1f022e7a80fe5540e9d523cc1320ed33356ca28106cdab9a4ee1cba6b016949ebe', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-06 21:03:07', '2022-05-06 21:03:07', '2023-05-06 17:03:07'),
('e95589b7f47112584743f6ece73b858f9d42cdbbf2dff6c5366708887e033e0560ab0eeefc614dfb', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-22 13:17:55', '2022-04-22 13:17:55', '2023-04-22 18:17:55'),
('e97094e2cbabbcdb813fffc6f59712bc3c60e30b62b1b58a608bcb5705fa85c58241f224dd46e63e', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-12 16:26:13', '2022-05-12 16:26:13', '2023-05-12 12:26:13'),
('e978c74998c8383f6d8e07defae5eb59bbf6cb29f960772cbdd25c3e90138fe72ac680cddc412752', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-10 10:35:29', '2022-05-10 10:35:29', '2023-05-10 06:35:29'),
('e9a25067999f66296362c50e87be29504fcfee27fe1f11dccd8ea1ca4aa37b41f63f9f768e5ab218', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-10 12:47:46', '2022-05-10 12:47:46', '2023-05-10 08:47:46'),
('e9c625565c39a1a34b799d3a1dddbf568c4bd32f0fd9f4849d72124a821bc5641edd761d8815851a', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:40:25', '2022-05-16 18:40:25', '2023-05-16 14:40:25'),
('ea185d96a8ffe8e9cb766b7194f983a97356afd39e59213eb83c5f10c8bd51ceac49b102579421f6', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-14 04:49:59', '2022-05-14 04:49:59', '2023-05-14 00:49:59'),
('ea444f93072c56e117dbcd50537a5725757c9ea71bef109b75dabdcf010f1b0a59987c76ad5d0466', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-19 15:39:28', '2022-05-19 15:39:28', '2023-05-19 11:39:28'),
('ea4546d34413d8e43af7da6d6e8fb4fe7ddfccfe0e44bc18477f3254f34673bc7820755c154e973c', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 17:55:13', '2022-05-16 17:55:13', '2023-05-16 13:55:13'),
('ea83862181f71a0e5edbc348fff1b6ecd7cd16447fc8720108490a14de6655668f51e8b6de1fdd24', 86, 1, 'Personal Access Token', '[]', 0, '2022-04-14 03:57:11', '2022-04-14 03:57:11', '2023-04-14 08:57:11'),
('eaeb6a0fd423bbaf85eef8afc406dae00a67baa585fa73fe6858b9d1bd0850863be712e4daa3df75', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-16 16:04:11', '2022-05-16 16:04:11', '2023-05-16 12:04:11'),
('eb082cd43d956393904f29c8b85a6a89da1c2c0644b3fe3478707e492ac766766660b7559d030714', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:27:25', '2022-05-19 19:27:25', '2023-05-19 15:27:25'),
('eb18753c1029b2fb8343ab371bac0cfd7dc4906f9815ed7695ef8536a5e941de6d54363f271554e9', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 13:34:06', '2022-05-16 13:34:06', '2023-05-16 09:34:06'),
('eb339de06d431cb91cd707c14cf6a4b276a5b216a5169bda080469e3dd4e5e370a2329fb8445e394', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-25 10:06:34', '2022-03-25 10:06:34', '2023-03-25 15:06:34'),
('eb3a500ba4342e060b8e5d74bfed165bc8517bbab6b01c0c207d611dbba3ca55d9007875bb07346b', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-28 02:21:32', '2022-03-28 02:21:32', '2023-03-28 07:21:32'),
('eb6f2466478542210b90be832cbc5a569a3796477416d13146d2282a8592b207f304ca76449b756e', 104, 1, 'Personal Access Token', '[]', 0, '2022-05-18 19:32:15', '2022-05-18 19:32:15', '2023-05-18 15:32:15'),
('eb904c564ad82657d9893ded48f8241afce796dfa5eb86b617bf8877e24871e59090285eca900536', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-09 13:06:13', '2022-05-09 13:06:13', '2023-05-09 09:06:13'),
('eb9b9d7af26afe1f0f87c2632db8911493cb5e8751570bf7c2a637d1a54b08ce4e30cb65ac08fcc1', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-10 18:38:04', '2022-05-10 18:38:04', '2023-05-10 14:38:04'),
('ec9a353591e90bf627c8097055b591392052812985428847664f0b96e9fca05b8fff8a1a8b05b568', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-25 02:05:50', '2022-03-25 02:05:50', '2023-03-25 07:05:50'),
('ecb644f96846ac072f9cd4be27967c934bbf1076bd6707c9332d2c6e70f9e73776c88bf36c646827', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 06:36:19', '2022-03-23 06:36:19', '2023-03-23 11:36:19'),
('ece8ce10d867ea4526f09d23a01ff9cb8acbba24f39d42be344c4116ab05d49eeb1bf57b2239123a', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-25 07:00:53', '2022-04-25 07:00:53', '2023-04-25 12:00:53'),
('ed016d4cbcc0f686aa584d42fd122c6879758eb97d095c32e8e273421df09e10f802f0a802291d1e', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 16:14:50', '2022-05-19 16:14:50', '2023-05-19 12:14:50'),
('ed650f8498a9044fd4842fcbf24ef256d2244dabb39b4c4e6a87c548990c0aef9e9c07243d65bfb4', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-12 15:09:32', '2022-05-12 15:09:32', '2023-05-12 11:09:32'),
('eeebcf862c9b5087b666d38f64cc330da0ef5a28eba208731f193be2773727f86721f2849de78668', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-06 04:42:37', '2022-04-06 04:42:37', '2023-04-06 09:42:37'),
('ef261cf745a672ff4bab643a033ed739b7178e56cf7ae288d9e272184b9cd01397e92ebebf2920f0', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-30 05:40:17', '2022-03-30 05:40:17', '2023-03-30 10:40:17'),
('f0177b35b6b5be43904515545b4a37d46a6fe9d6bec189c5ef67585ac09ed980499bca2cec1f42f4', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-13 20:18:52', '2022-05-13 20:18:52', '2023-05-13 16:18:52'),
('f01b9b75e3a6a1f178833b6fe7e45fd266850beaec716a53ac02a3c8716fcf65cc17e5d027e1295a', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-29 14:10:01', '2022-04-29 14:10:01', '2023-04-29 10:10:01'),
('f0326f412ae63585df7de90da59a2c8e2613bb9151af986c238b4600516b3dc866ebdf1347a944b7', 91, 1, 'Personal Access Token', '[]', 0, '2022-05-22 15:38:52', '2022-05-22 15:38:52', '2023-05-22 11:38:52'),
('f0878d445c3d449277b1d21f4706e5adb13687e017ea6142d50df50e2aa404b67bad7f331c0c76b1', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-07 13:44:27', '2022-06-07 13:44:27', '2023-06-07 09:44:27'),
('f0fcd91a1a641dd05b696bf4e4c1390f301527cdc34e1fa84bad3c403d96c4fd644b63fdcab0b030', 59, 1, 'Personal Access Token', '[]', 1, '2022-05-17 15:35:07', '2022-05-17 15:35:07', '2023-05-17 11:35:07'),
('f15feea6393a949f09c49290582ff10219411d5456bf8323e04ddefffac45ba843b65f2648a8c5a9', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-19 18:39:06', '2022-05-19 18:39:06', '2023-05-19 14:39:06'),
('f19d998ccfa0cf9918279e1c5322124a0d31dc1267672e58e25dcb0068402b5b7eee906c42cb9f2d', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-09 21:38:27', '2022-05-09 21:38:27', '2023-05-09 17:38:27'),
('f2ba0eaa1e2698e034637166cc9f2f83b7c07305d3041b223d1626b242b9c6e6b957a61b887420f6', 58, 1, 'Personal Access Token', '[]', 1, '2022-04-15 06:51:26', '2022-04-15 06:51:26', '2023-04-15 11:51:26'),
('f31a0186fc5ead3c7dc55055c286a331c44efa95423a1ef13628cf2a83ad5b332c5e2c62dc87ca6b', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-19 18:28:43', '2022-05-19 18:28:43', '2023-05-19 14:28:43'),
('f31e262e639c42c97cb21c73e0e32ae35f6682568683d4a70ab01ce1f3071c4cde0942056c3500c3', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-13 15:44:48', '2022-05-13 15:44:48', '2023-05-13 11:44:48'),
('f3e1ed9439e5fd677e8bf0ad35c3a7735f69013bf082ae13808697bc7ec459489b7adcbf25e148be', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:21:20', '2022-03-30 04:21:20', '2023-03-30 09:21:20'),
('f439b12cb5ac588d563d069ad15b9c8cf6acc1d7caeaaaa0408d208dab76decfffb6efe148c6bc79', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-09 12:24:38', '2022-05-09 12:24:38', '2023-05-09 08:24:38'),
('f4722dfe97956af0e58f4552b20bbef93c1cf8aea161a3f98d978dd1e534a926302a39bdb1c01301', 17, 1, 'Personal Access Token', '[]', 1, '2022-03-30 05:42:00', '2022-03-30 05:42:00', '2023-03-30 10:42:00'),
('f4804f6ac9dd5102d7ec34ba3047502a52943b8e71c26a959d639e03ce53c1d6f07af0ee0bfbb9a5', 31, 1, 'Personal Access Token', '[]', 0, '2022-04-27 03:16:49', '2022-04-27 03:16:49', '2023-04-27 08:16:49'),
('f4e4a9457ace1d349b34a3576ec5c197963e7b0fa49700d87742ae801cbf43ab28ec5f63911c99cc', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-16 18:32:23', '2022-05-16 18:32:23', '2023-05-16 14:32:23'),
('f50fee302430ea61c7f9a8918040f3d1c1045c09a08b652803ba98580c710748f112036774900d46', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-14 05:01:00', '2022-05-14 05:01:00', '2023-05-14 01:01:00'),
('f5a230359a7576f9ef9d142c1edc51e92c5a647d6f32d8388d5882977e5dc0ab5b0377ee9f204307', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:23:34', '2022-03-22 06:23:34', '2023-03-22 11:23:34'),
('f6c78b3539be62dd78b9291e88ced698049b0cc20dbf83596d0aa6d9fc742d67cd1f7f6b93356cbe', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 05:52:18', '2022-03-24 05:52:18', '2023-03-24 10:52:18'),
('f7061f81d63f39a068ad6e27ba14fb1256c2be2f6ed0f06dc76d055562f637783e3389fba0fd1ccf', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-25 04:18:55', '2022-05-25 04:18:55', '2023-05-25 00:18:55'),
('f71a74cb0b47746f3d39d0031aebdb30793bf19aaf0c5da1282b047a6aa0eae647a6ed666239259c', 110, 1, 'Personal Access Token', '[]', 0, '2022-05-16 11:57:37', '2022-05-16 11:57:37', '2023-05-16 07:57:37'),
('f7554dfef0b751dc5d9851085986cc11ec63ebd94d8c73baa10a4f7baaaec751fb1d4fafdf47f242', 109, 1, 'Personal Access Token', '[]', 0, '2022-05-19 19:45:43', '2022-05-19 19:45:43', '2023-05-19 15:45:43'),
('f78ff2ed45cd798147a6c3c9deafede635bc9f15fbf21067f24d2e3430070e1c9a56ad661a8753f9', 58, 1, 'Personal Access Token', '[]', 0, '2022-04-11 03:19:51', '2022-04-11 03:19:51', '2023-04-11 08:19:51'),
('f7bf2a793f4327716a7a74023a1328c19d01befb2651955fd1b191d02da4010a52ae739eec29ed01', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-14 04:50:35', '2022-04-14 04:50:35', '2023-04-14 09:50:35'),
('f7c739a40d031b6836b49b9d25976d1052a22afb39205a7d52b14a08c4dc1d57215e33ef08a7a7a9', 58, 1, 'Personal Access Token', '[]', 1, '2022-05-09 12:17:44', '2022-05-09 12:17:44', '2023-05-09 08:17:44'),
('f925670694ab63a044d9a9615532847a76e4fabc6bd6b42ba81a6264d1a6d221ffb91d3b59d6cd13', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-12 00:57:43', '2022-04-12 00:57:43', '2023-04-12 05:57:43'),
('f964cecc6b8a165b2bcf9d1622373a771062e91f8ddbbbcf31a6192575232fcc72572ef14758a3e3', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-05 06:15:27', '2022-04-05 06:15:27', '2023-04-05 11:15:27'),
('f9827309bb4f52a75ba8393232c013cbf3d65e11fab507a07cf883f3711a6e1cfef63e94b4ef7140', 112, 1, 'Personal Access Token', '[]', 0, '2022-05-19 20:26:25', '2022-05-19 20:26:25', '2023-05-19 16:26:25'),
('f99773243c379d0d3f4f0d61c66f15bafd2bf3be0e6db2ca5849c28cad9ee7dcb6b9173f1be31a49', 31, 1, 'Personal Access Token', '[]', 1, '2022-04-18 06:12:19', '2022-04-18 06:12:19', '2023-04-18 11:12:19'),
('fa5c537b8f64339c8b1b233f646d64c41010e892f8db0c45addace0aaf48e65d0d067ccdcda78374', 58, 1, 'Personal Access Token', '[]', 0, '2022-05-14 05:12:08', '2022-05-14 05:12:08', '2023-05-14 01:12:08'),
('fae9b30f1b6d10009c6cea672117cd6307baee7e5c0233cf19bba3f4564a9a9644729705bf424a7b', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-01 08:14:56', '2022-04-01 08:14:56', '2023-04-01 13:14:56'),
('fb5fcef8dc7cfbf58dbb3b5d5089a040375ec9e2fb29ebcb083f25987282497865cbc8849ec3044c', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-24 01:35:59', '2022-03-24 01:35:59', '2023-03-24 06:35:59'),
('fbc10ee0059cc012914a157ecd2c5fdc33e3cee45dc8985d706b34e4db5ac5bc5dc74876e25006db', 91, 1, 'Personal Access Token', '[]', 1, '2022-05-09 21:38:42', '2022-05-09 21:38:42', '2023-05-09 17:38:42');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('fce8349bb532fb06830b6e270e4534ae1d6a15d137dd05a1b339448da7c539c3342043ec75f22977', 7, 1, 'Personal Access Token', '[]', 0, '2022-03-22 06:22:41', '2022-03-22 06:22:41', '2023-03-22 11:22:41'),
('fd1d5ab57cca05532b238e25d3d526c332abbd42e0746212fa62fd6029a2853bd13f6481e3744927', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-28 06:53:04', '2022-03-28 06:53:04', '2023-03-28 11:53:04'),
('fd6ed6cc9bcddaecaf1b30d9c614d1b24f3c2bffd450fedf7e73390b7afbb80a3c88c5257ceade00', 40, 1, 'Personal Access Token', '[]', 1, '2022-04-06 02:51:39', '2022-04-06 02:51:39', '2023-04-06 07:51:39'),
('fd9eb20437fced0224c15a4506e1b1faee028f9ac9a326627b1520cec4aaa08497907c4eabbc090d', 31, 1, 'Personal Access Token', '[]', 0, '2022-03-30 04:33:43', '2022-03-30 04:33:43', '2023-03-30 09:33:43'),
('fda3b777eba67e0e036efc28cf6a369a5a27b89e37c009d44811030669cc207361e81a65a67d1308', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-18 04:20:01', '2022-04-18 04:20:01', '2023-04-18 09:20:01'),
('fe9dd99184e8ec0f7ae4c6472c6174447bce2fc72038a20282088b4d64295a8e37de39c719684946', 73, 1, 'Personal Access Token', '[]', 0, '2022-05-09 21:49:04', '2022-05-09 21:49:04', '2023-05-09 17:49:04'),
('fea9456cf4ba77520180eff854af040486a2cbcbfa3f44835680bd7c0b500c72b34ca13f35368f23', 17, 1, 'Personal Access Token', '[]', 0, '2022-03-23 10:12:17', '2022-03-23 10:12:17', '2023-03-23 15:12:17'),
('ff058d9450697cc0146b3d78643dba4667a091d126739f2c475a0eb0780b4c4d255c4a669076568c', 29, 1, 'Personal Access Token', '[]', 0, '2022-05-05 15:19:47', '2022-05-05 15:19:47', '2023-05-05 11:19:47'),
('ff393157044fab505f3b4090a876b30245ab9358482884a66f1757a7e6922acd7f0e483c9ad39502', 59, 1, 'Personal Access Token', '[]', 0, '2022-05-18 15:05:30', '2022-05-18 15:05:30', '2023-05-18 11:05:30'),
('ff63868e01b97d7a0e0ca5e18b8807668d83b7198c79b06bfa1c7eab659d5d8d049c974f0f4cc634', 40, 1, 'Personal Access Token', '[]', 0, '2022-04-04 06:19:09', '2022-04-04 06:19:09', '2023-04-04 11:19:09'),
('ff88c09cd311eb7b4b27f73ca2d523ea13926e2a9983d1ffd3f52b777dd39c654b2524989bb07764', 58, 1, 'Personal Access Token', '[]', 0, '2022-06-07 13:43:33', '2022-06-07 13:43:33', '2023-06-07 09:43:33'),
('ff9df0a679c4d1ba0ed1986586e0ba32c0026dda8853b4b8eb7a705df0f72b385390b3606a7ddacb', 29, 1, 'Personal Access Token', '[]', 0, '2022-04-12 01:45:50', '2022-04-12 01:45:50', '2023-04-12 06:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'RlQ7c4CcKOPp6dYjTEKSjTfpBBbgSTcqYyqJ4yoi', NULL, 'http://localhost', 1, 0, 0, '2021-04-30 04:57:59', '2021-04-30 04:57:59'),
(2, NULL, 'Laravel Password Grant Client', 'MOowX7Lbacke91syF0S5bGHTEmVfe5xtw76mtbCv', 'users', 'http://localhost', 0, 1, 0, '2021-04-30 04:57:59', '2021-04-30 04:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-30 04:57:59', '2021-04-30 04:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `grocery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shopper_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `discount` int(20) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `order_status` enum('completed','pending','cancelled','preparing','ready','rider_accepted','finding_rider','dispatch','picked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `payment_status` int(11) DEFAULT 0,
  `commission` int(20) DEFAULT NULL,
  `delivery_cost` int(50) DEFAULT NULL,
  `distance` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_at_vendor` datetime DEFAULT NULL,
  `completed_at_vendor` datetime DEFAULT NULL,
  `accepted_at_rider` datetime DEFAULT NULL,
  `completed_at_rider` datetime DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `restaurant_id`, `rider_id`, `grocery_id`, `shopper_id`, `sub_total`, `discount`, `vat`, `grand_total`, `order_status`, `payment_method`, `card_id`, `address_id`, `payment_status`, `commission`, `delivery_cost`, `distance`, `accepted_at_vendor`, `completed_at_vendor`, `accepted_at_rider`, `completed_at_rider`, `note`, `created_at`, `updated_at`) VALUES
(1, 104, 58, 54, NULL, 29, 2650, 0, 5, 2652, 'finding_rider', 'cash', NULL, 14, 0, NULL, 1, NULL, '2022-05-12 12:17:49', '2022-05-19 16:03:23', '2022-05-12 12:17:49', NULL, NULL, '2022-05-12 13:47:12', '2022-05-19 20:17:37'),
(2, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:05', '2022-05-12 16:56:05'),
(3, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:20', '2022-05-12 16:56:20'),
(4, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:30', '2022-05-12 16:56:30'),
(5, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:36', '2022-05-12 16:56:36'),
(6, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:46', '2022-05-12 16:56:46'),
(7, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:56:57', '2022-05-12 16:56:57'),
(8, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'card', NULL, 15, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:57:06', '2022-05-12 16:57:06'),
(9, 73, 40, NULL, NULL, NULL, 300, 0, 5, 300, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:57:09', '2022-05-12 16:57:09'),
(10, 73, 40, NULL, NULL, NULL, 300, 0, 5, 300, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 16:57:21', '2022-05-12 16:57:21'),
(11, 73, 40, NULL, NULL, NULL, 300, 0, 5, 300, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:14:33', '2022-05-12 17:14:33'),
(12, 73, 40, NULL, NULL, NULL, 300, 0, 5, 300, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:29:49', '2022-05-12 17:29:49'),
(13, 73, 40, NULL, NULL, NULL, 300, 0, 5, 300, 'pending', 'cash', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:30:42', '2022-05-12 17:30:42'),
(14, 73, 10, NULL, NULL, NULL, 500, 0, 5, 500, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:42:44', '2022-05-12 17:42:44'),
(15, 73, 10, NULL, NULL, NULL, 500, 0, 5, 500, 'pending', 'card', NULL, 15, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:42:46', '2022-05-12 17:42:46'),
(16, 73, 10, NULL, NULL, NULL, 500, 0, 5, 516, 'pending', 'card', NULL, 11, 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:42:54', '2022-05-12 17:42:54'),
(17, 73, 40, NULL, NULL, NULL, 300, 0, 5, 322, 'pending', 'cash', NULL, 12, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 17:48:33', '2022-05-12 17:48:33'),
(18, 73, 40, 29, NULL, NULL, 300, 0, 5, 322, 'completed', 'cash', NULL, 12, 0, NULL, 22, NULL, NULL, NULL, NULL, '2022-05-12 14:45:17', NULL, '2022-05-12 17:54:17', '2022-05-12 18:45:17'),
(19, 73, 58, 54, NULL, NULL, 2850, 0, 5, 2868, 'finding_rider', 'card', NULL, 11, 0, NULL, 17, NULL, '2022-05-12 15:49:20', '2022-05-12 15:49:48', '2022-05-12 15:49:20', NULL, NULL, '2022-05-12 19:48:50', '2022-05-12 20:38:48'),
(20, 73, 40, NULL, NULL, NULL, 550, 0, 5, 572, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:36:14', '2022-05-12 20:36:14'),
(21, 73, 40, NULL, NULL, NULL, 50, 0, 5, 72, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:37:14', '2022-05-12 20:37:14'),
(22, 73, 17, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'cash', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:51:33', '2022-05-12 20:51:33'),
(23, 73, 17, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:51:43', '2022-05-12 20:51:43'),
(24, 73, 17, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:51:46', '2022-05-12 20:51:46'),
(25, 73, 10, NULL, NULL, NULL, 100, 0, 5, 116, 'pending', 'card', NULL, 16, 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:54:23', '2022-05-12 20:54:23'),
(26, 73, 10, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'cash', NULL, 16, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:54:38', '2022-05-12 20:54:38'),
(27, 73, 10, NULL, NULL, NULL, 100, 0, 5, 116, 'pending', 'cash', NULL, 11, 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-12 20:54:45', '2022-05-12 20:54:45'),
(28, 73, 40, NULL, NULL, NULL, 200, 0, 5, 222, 'pending', 'cash', NULL, 12, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 01:16:58', '2022-05-13 01:16:58'),
(29, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 04:35:53', '2022-05-13 04:35:53'),
(30, 73, 40, 54, NULL, NULL, 900, 0, 5, 922, 'finding_rider', 'cash', NULL, 12, 0, NULL, 22, NULL, '2022-05-13 10:33:10', '2022-05-13 10:33:11', '2022-05-13 10:33:10', NULL, NULL, '2022-05-13 08:55:24', '2022-05-13 15:30:36'),
(31, 104, 58, 91, NULL, NULL, 850, 0, 5, 852, 'completed', 'cash', NULL, 14, 0, NULL, 10, NULL, '2022-05-13 08:46:01', '2022-05-13 08:46:58', '2022-05-13 08:46:01', '2022-05-13 08:49:48', NULL, '2022-05-13 12:44:21', '2022-05-13 12:49:48'),
(32, 104, 58, 54, NULL, NULL, 200, 0, 5, 202, 'finding_rider', 'cash', NULL, 14, 0, NULL, 1, NULL, '2022-05-13 09:12:53', '2022-05-13 09:12:55', '2022-05-13 09:12:53', NULL, NULL, '2022-05-13 13:11:30', '2022-05-13 13:53:25'),
(33, 29, 58, 91, NULL, NULL, 1600, 0, 5, 1602, 'completed', 'cash', NULL, 8, 0, NULL, 3, NULL, '2022-05-13 09:48:17', '2022-05-13 09:48:19', '2022-05-13 09:48:17', '2022-05-13 09:49:34', NULL, '2022-05-13 13:45:56', '2022-05-13 13:49:34'),
(34, 29, 58, 91, NULL, NULL, 1600, 0, 5, 1602, 'completed', 'cash', NULL, 8, 0, NULL, 5, NULL, '2022-05-13 09:48:17', '2022-05-13 09:48:19', '2022-05-13 09:48:17', '2022-05-13 09:49:34', NULL, '2022-05-13 13:45:56', '2022-05-13 13:49:34'),
(35, 29, 58, 54, NULL, NULL, 2000, 0, 5, 2015, 'finding_rider', 'card', 8, 10, 0, NULL, 15, NULL, '2022-05-13 11:31:21', '2022-05-13 11:31:23', '2022-05-13 11:31:21', NULL, 'lorem ipsum', '2022-05-13 14:01:01', '2022-05-13 15:35:05'),
(36, 29, 58, NULL, NULL, NULL, 150, 0, 5, 152, 'completed', 'cash', NULL, 8, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 14:04:18', '2022-05-13 14:04:18'),
(37, 29, 40, 91, NULL, NULL, 100, 0, 5, 104, 'completed', 'cash', NULL, 8, 0, NULL, 4, NULL, '2022-05-13 10:16:41', '2022-05-13 10:16:45', '2022-05-13 10:16:41', '2022-05-13 10:16:58', NULL, '2022-05-13 14:06:55', '2022-05-13 14:16:58'),
(38, 73, 40, NULL, NULL, NULL, 400, 0, 5, 422, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 15:41:47', '2022-05-13 15:41:47'),
(39, 104, 58, 54, NULL, NULL, 250, 0, 5, 252, 'finding_rider', 'cash', NULL, 14, 0, NULL, 2, NULL, '2022-05-13 11:50:38', '2022-05-13 11:50:40', '2022-05-13 11:50:38', NULL, NULL, '2022-05-13 15:46:16', '2022-05-13 16:27:09'),
(40, 104, 58, 54, NULL, NULL, 50, 0, 5, 52, 'finding_rider', 'cash', NULL, 14, 0, NULL, 2, NULL, '2022-05-13 12:27:52', '2022-05-13 12:27:54', '2022-05-13 12:27:52', NULL, NULL, '2022-05-13 16:27:36', '2022-05-13 16:28:08'),
(41, 104, 58, 54, NULL, NULL, 100, 0, 5, 102, 'finding_rider', 'cash', NULL, 14, 0, NULL, 2, NULL, '2022-05-13 12:47:35', '2022-05-13 12:47:37', '2022-05-13 12:47:35', NULL, NULL, '2022-05-13 16:32:19', '2022-05-13 16:51:32'),
(42, 104, 58, 91, NULL, NULL, 800, 0, 5, 806, 'completed', 'cash', NULL, 18, 0, NULL, 6, NULL, '2022-05-13 12:52:49', '2022-05-13 12:52:51', '2022-05-13 12:52:49', '2022-05-13 13:07:35', NULL, '2022-05-13 16:52:26', '2022-05-13 17:07:35'),
(43, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 19:25:04', '2022-05-13 19:25:04'),
(44, 29, 58, 91, NULL, NULL, 100, 0, 5, 102, 'completed', 'cash', NULL, 8, 0, NULL, 2, NULL, '2022-05-13 16:09:42', '2022-05-13 16:09:55', '2022-05-13 16:09:42', '2022-05-13 16:15:20', NULL, '2022-05-13 20:08:46', '2022-05-13 20:15:20'),
(45, 29, 58, 91, NULL, NULL, 200, 0, 5, 200, 'completed', 'cash', NULL, 8, 0, NULL, 0, NULL, '2022-05-13 16:22:25', '2022-05-13 16:22:28', '2022-05-13 16:22:25', '2022-05-13 16:24:27', NULL, '2022-05-13 20:21:26', '2022-05-13 20:24:27'),
(46, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-13 22:47:33', '2022-05-13 22:47:33'),
(47, 73, 58, 54, NULL, NULL, 100, 0, 5, 100, 'pending', 'cash', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 00:22:13', '2022-05-18 19:25:01'),
(48, 73, 58, 91, NULL, NULL, 100, 0, 5, 100, 'rider_accepted', 'cash', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 00:22:15', '2022-05-18 13:35:08'),
(49, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 12, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 00:22:27', '2022-05-14 00:22:27'),
(50, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 12, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 00:22:28', '2022-05-14 00:22:28'),
(51, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 03:41:13', '2022-05-14 03:41:13'),
(52, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 12, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 03:41:20', '2022-05-14 03:41:20'),
(53, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 13, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 03:41:27', '2022-05-14 03:41:27'),
(54, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 03:43:34', '2022-05-14 03:43:34'),
(55, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:33:59', '2022-05-14 04:33:59'),
(56, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:41:19', '2022-05-14 04:41:19'),
(57, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:47:18', '2022-05-14 04:47:18'),
(58, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:53:51', '2022-05-14 04:53:51'),
(59, 73, 1, NULL, NULL, NULL, 100, 0, 5, 100, 'pending', 'card', NULL, 11, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:57:43', '2022-05-14 04:57:43'),
(60, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 04:58:02', '2022-05-14 04:58:02'),
(61, 73, 10, NULL, NULL, NULL, 500, 0, 5, 516, 'pending', 'card', NULL, 11, 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 05:00:04', '2022-05-14 05:00:04'),
(62, 73, 58, 91, NULL, NULL, 50, 0, 5, 68, 'completed', 'card', NULL, 11, 0, NULL, 18, NULL, '2022-05-14 01:04:05', '2022-05-14 01:04:07', '2022-05-14 01:04:05', '2022-05-14 01:06:33', NULL, '2022-05-14 05:03:43', '2022-05-14 05:06:33'),
(63, 73, 29, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 05:09:10', '2022-05-14 05:09:10'),
(64, 73, 58, 91, NULL, NULL, 2750, 0, 5, 2768, 'completed', 'card', NULL, 11, 0, NULL, 18, NULL, '2022-05-14 01:12:20', '2022-05-14 01:16:16', '2022-05-14 01:12:20', '2022-05-14 01:19:31', NULL, '2022-05-14 05:11:56', '2022-05-14 05:19:31'),
(65, 73, 58, 91, NULL, NULL, 850, 0, 5, 868, 'completed', 'card', NULL, 11, 0, NULL, 18, NULL, '2022-05-14 06:08:33', '2022-05-14 06:09:00', '2022-05-14 06:08:33', '2022-05-14 06:10:22', NULL, '2022-05-14 10:08:14', '2022-05-14 10:10:22'),
(66, 73, 40, NULL, NULL, NULL, 100, 0, 5, 122, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 17:24:03', '2022-05-14 17:24:03'),
(67, 73, 40, NULL, NULL, NULL, 750, 0, 5, 772, 'pending', 'cash', NULL, 12, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-14 18:35:51', '2022-05-14 18:35:51'),
(68, 73, 58, 91, NULL, NULL, 700, 0, 5, 718, 'completed', 'cash', NULL, 12, 0, NULL, 18, NULL, '2022-05-14 14:51:28', '2022-05-14 14:51:39', '2022-05-14 14:51:28', '2022-05-14 14:56:37', NULL, '2022-05-14 18:50:19', '2022-05-14 18:56:37'),
(69, 73, 58, 91, NULL, NULL, 1600, 0, 5, 1618, 'completed', 'cash', NULL, 11, 0, NULL, 18, NULL, '2022-05-14 19:55:10', '2022-05-14 19:55:15', '2022-05-14 19:55:10', '2022-05-14 19:56:45', NULL, '2022-05-14 23:54:24', '2022-05-14 23:56:45'),
(70, 73, 58, 91, NULL, NULL, 2250, 0, 5, 2268, 'rider_accepted', 'card', NULL, 11, 0, NULL, 18, NULL, '2022-05-14 21:56:01', '2022-05-14 21:58:46', '2022-05-14 21:56:01', NULL, NULL, '2022-05-15 01:52:04', '2022-05-15 02:12:50'),
(71, 73, 58, 54, NULL, NULL, 50, 0, 5, 68, 'finding_rider', 'cash', NULL, 11, 0, NULL, 18, NULL, '2022-05-19 16:27:37', '2022-05-19 16:27:39', '2022-05-19 16:27:37', NULL, NULL, '2022-05-15 05:51:59', '2022-05-19 20:36:57'),
(72, 73, 58, 91, NULL, NULL, 50, 0, 5, 68, 'completed', 'card', NULL, 11, 0, NULL, 18, NULL, '2022-05-15 12:16:32', '2022-05-15 12:16:37', '2022-05-15 12:16:32', '2022-05-20 17:13:04', NULL, '2022-05-15 16:16:03', '2022-05-20 21:13:04'),
(73, 73, 58, 91, NULL, NULL, 1200, 0, 5, 1218, 'dispatch', 'cash', NULL, 11, 0, NULL, 18, NULL, '2022-05-19 14:48:51', '2022-06-01 13:03:20', '2022-05-19 14:48:51', NULL, NULL, '2022-05-16 04:18:53', '2022-06-01 17:03:20'),
(74, 73, 58, 91, NULL, NULL, 1600, 0, 5, 1618, 'completed', 'cash', NULL, 11, 0, NULL, 18, NULL, '2022-05-16 07:32:53', '2022-05-16 07:32:55', '2022-05-16 07:32:53', '2022-05-16 07:34:40', NULL, '2022-05-16 11:31:57', '2022-05-16 11:34:40'),
(80, 29, 59, NULL, 59, NULL, 510, 0, 5, 536, 'ready', 'cash', NULL, 20, 0, NULL, 26, NULL, NULL, '2022-05-18 13:03:39', NULL, NULL, NULL, '2022-05-17 18:45:41', '2022-05-18 17:03:39'),
(81, 104, 59, 54, 59, NULL, 510, 0, 5, 514, 'preparing', 'cash', NULL, 20, 0, NULL, 4, NULL, NULL, '2022-05-18 12:28:24', NULL, NULL, NULL, '2022-05-17 19:20:18', '2022-05-18 19:13:31'),
(82, 104, 58, 112, NULL, NULL, 600, 0, 5, 606, 'completed', 'cash', NULL, 18, 0, NULL, 6, NULL, '2022-05-19 14:05:18', '2022-05-19 14:05:22', '2022-05-19 14:05:18', '2022-05-19 15:43:00', NULL, '2022-05-18 19:32:40', '2022-05-19 19:43:00'),
(83, 104, 58, 112, NULL, NULL, 800, 0, 5, 810, 'completed', 'cash', NULL, 18, 0, NULL, 10, NULL, '2022-05-19 16:39:36', '2022-05-19 16:39:39', '2022-05-19 16:39:36', '2022-05-19 17:01:28', NULL, '2022-05-19 20:38:18', '2022-05-19 21:01:28'),
(84, 104, 59, NULL, 59, NULL, 105, 0, 5, 109, 'preparing', 'cash', NULL, 20, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-19 21:11:21', '2022-05-19 21:12:03'),
(85, 73, 59, NULL, NULL, NULL, 35, 0, 5, 55, 'preparing', 'card', NULL, 11, 0, NULL, 20, NULL, '2022-05-25 00:00:07', NULL, '2022-05-25 00:00:07', NULL, NULL, '2022-05-25 03:52:43', '2022-05-25 04:00:07'),
(86, 73, 58, 54, NULL, NULL, 50, 0, 5, 72, 'finding_rider', 'card', NULL, 11, 0, NULL, 22, NULL, '2022-05-25 00:26:03', '2022-05-25 00:26:14', '2022-05-25 00:26:03', NULL, NULL, '2022-05-25 04:24:47', '2022-06-07 13:41:07'),
(87, 73, 58, 112, NULL, NULL, 1100, 0, 5, 1122, 'completed', 'card', NULL, 11, 0, NULL, 22, NULL, '2022-05-25 00:40:46', '2022-05-25 00:41:11', '2022-05-25 00:40:46', '2022-06-07 09:40:09', NULL, '2022-05-25 04:40:36', '2022-06-07 13:40:09'),
(88, 73, 58, 54, NULL, NULL, 2450, 0, 5, 2472, 'finding_rider', 'card', NULL, 11, 0, NULL, 22, NULL, '2022-05-25 01:11:43', '2022-05-25 01:11:46', '2022-05-25 01:11:43', NULL, NULL, '2022-05-25 05:11:27', '2022-06-06 15:33:39'),
(89, 73, 58, 54, NULL, NULL, 50, 0, 5, 72, 'finding_rider', 'cash', NULL, 11, 0, NULL, 22, NULL, '2022-05-25 14:17:29', '2022-05-25 14:17:37', '2022-05-25 14:17:29', NULL, NULL, '2022-05-25 06:44:57', '2022-06-02 18:17:58'),
(90, 73, 58, 54, NULL, NULL, 50, 0, 5, 72, 'pending', 'card', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01 19:21:21', '2022-06-03 15:53:04'),
(91, 73, 58, 54, NULL, NULL, 50, 0, 5, 72, 'finding_rider', 'card', NULL, 11, 0, NULL, 22, NULL, '2022-06-01 15:42:34', '2022-06-01 15:42:50', '2022-06-01 15:42:34', NULL, NULL, '2022-06-01 19:41:58', '2022-06-02 18:17:53'),
(92, 73, 58, NULL, NULL, NULL, 50, 0, 5, 72, 'ready', 'cash', NULL, 11, 0, NULL, 22, NULL, '2022-06-03 12:31:46', '2022-06-03 12:35:18', '2022-06-03 12:31:46', NULL, NULL, '2022-06-03 16:31:05', '2022-06-03 16:35:18'),
(93, 73, 58, 54, NULL, NULL, 390, 0, 5, 412, 'pending', 'cash', NULL, 11, 0, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07 13:42:57', '2022-06-07 13:44:04'),
(94, 58, 58, 112, NULL, NULL, 270, 0, 5, 274, 'rider_accepted', 'cash', NULL, 22, 0, NULL, 4, NULL, '2022-06-07 10:43:45', '2022-06-07 10:43:49', '2022-06-07 10:43:45', NULL, NULL, '2022-06-07 13:46:55', '2022-06-07 14:44:36'),
(95, 58, 58, 112, NULL, NULL, 100, 0, 5, 104, 'completed', 'cash', NULL, 22, 0, NULL, 4, NULL, '2022-06-07 10:59:51', '2022-06-07 10:59:53', '2022-06-07 10:59:51', '2022-06-07 12:08:29', NULL, '2022-06-07 14:58:41', '2022-06-07 16:08:29'),
(96, 104, 40, NULL, NULL, NULL, 1150, 0, 5, 1160, 'pending', 'cash', NULL, 18, 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(97, 104, 58, 112, NULL, NULL, 270, 0, 5, 280, 'picked', 'cash', NULL, 18, 0, NULL, 10, NULL, '2022-06-07 11:50:31', '2022-06-07 11:50:44', '2022-06-07 11:50:31', NULL, NULL, '2022-06-07 15:49:56', '2022-06-07 15:51:50'),
(98, 104, 58, 112, NULL, NULL, 50, 0, 5, 60, 'picked', 'cash', NULL, 18, 0, NULL, 10, NULL, '2022-06-07 13:21:56', '2022-06-07 13:22:01', '2022-06-07 13:21:56', NULL, NULL, '2022-06-07 17:21:01', '2022-06-07 17:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `sub_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `qty`, `price`, `sub_total`, `created_at`, `updated_at`) VALUES
(79, 47, 44, 42, 50, 2100, '2022-05-10 16:45:33', '2022-05-10 16:45:33'),
(80, 48, 44, 5, 50, 250, '2022-05-10 18:28:12', '2022-05-10 18:28:12'),
(81, 49, 1, 3, 500, 1500, '2022-05-11 15:06:05', '2022-05-11 15:06:05'),
(82, 49, 2, 5, 100, 500, '2022-05-11 15:06:05', '2022-05-11 15:06:05'),
(83, 50, 1, 3, 500, 1500, '2022-05-11 16:06:27', '2022-05-11 16:06:27'),
(84, 50, 2, 5, 100, 500, '2022-05-11 16:06:27', '2022-05-11 16:06:27'),
(85, 51, 1, 3, 500, 1500, '2022-05-11 16:07:27', '2022-05-11 16:07:27'),
(86, 51, 2, 5, 100, 500, '2022-05-11 16:07:27', '2022-05-11 16:07:27'),
(87, 52, 43, 1, 800, 800, '2022-05-11 20:25:39', '2022-05-11 20:25:39'),
(88, 52, 34, 1, 300, 300, '2022-05-11 20:25:39', '2022-05-11 20:25:39'),
(89, 53, 33, 2, 300, 600, '2022-05-11 20:28:17', '2022-05-11 20:28:17'),
(90, 54, 35, 1, 800, 800, '2022-05-11 20:37:36', '2022-05-11 20:37:36'),
(91, 55, 29, 3, 50, 150, '2022-05-11 20:38:00', '2022-05-11 20:38:00'),
(92, 56, 43, 1, 800, 800, '2022-05-11 20:55:17', '2022-05-11 20:55:17'),
(93, 57, 40, 1, 50, 50, '2022-05-12 04:31:20', '2022-05-12 04:31:20'),
(94, 58, 40, 1, 50, 50, '2022-05-12 04:31:27', '2022-05-12 04:31:27'),
(95, 59, 32, 1, 250, 250, '2022-05-12 04:33:17', '2022-05-12 04:33:17'),
(96, 60, 32, 1, 250, 250, '2022-05-12 04:33:30', '2022-05-12 04:33:30'),
(97, 61, 32, 1, 250, 250, '2022-05-12 05:41:26', '2022-05-12 05:41:26'),
(98, 62, 32, 1, 250, 250, '2022-05-12 05:42:02', '2022-05-12 05:42:02'),
(99, 63, 32, 1, 250, 250, '2022-05-12 05:42:04', '2022-05-12 05:42:04'),
(100, 64, 44, 3, 50, 150, '2022-05-12 06:14:19', '2022-05-12 06:14:19'),
(101, 65, 44, 3, 50, 150, '2022-05-12 06:14:21', '2022-05-12 06:14:21'),
(102, 66, 44, 3, 50, 150, '2022-05-12 06:19:40', '2022-05-12 06:19:40'),
(103, 67, 44, 3, 50, 150, '2022-05-12 09:18:25', '2022-05-12 09:18:25'),
(104, 68, 29, 1, 50, 50, '2022-05-12 09:20:05', '2022-05-12 09:20:05'),
(105, 1, 44, 3, 50, 150, '2022-05-12 13:47:12', '2022-05-12 13:47:12'),
(106, 1, 33, 1, 300, 300, '2022-05-12 13:47:12', '2022-05-12 13:47:12'),
(107, 1, 34, 2, 300, 600, '2022-05-12 13:47:12', '2022-05-12 13:47:12'),
(108, 1, 43, 1, 800, 800, '2022-05-12 13:47:12', '2022-05-12 13:47:12'),
(109, 1, 35, 1, 800, 800, '2022-05-12 13:47:12', '2022-05-12 13:47:12'),
(110, 2, 29, 1, 50, 50, '2022-05-12 16:56:05', '2022-05-12 16:56:05'),
(111, 2, 32, 1, 250, 250, '2022-05-12 16:56:05', '2022-05-12 16:56:05'),
(112, 3, 29, 1, 50, 50, '2022-05-12 16:56:20', '2022-05-12 16:56:20'),
(113, 3, 32, 1, 250, 250, '2022-05-12 16:56:20', '2022-05-12 16:56:20'),
(114, 4, 29, 1, 50, 50, '2022-05-12 16:56:30', '2022-05-12 16:56:30'),
(115, 4, 32, 1, 250, 250, '2022-05-12 16:56:30', '2022-05-12 16:56:30'),
(116, 5, 29, 1, 50, 50, '2022-05-12 16:56:36', '2022-05-12 16:56:36'),
(117, 5, 32, 1, 250, 250, '2022-05-12 16:56:36', '2022-05-12 16:56:36'),
(118, 6, 29, 1, 50, 50, '2022-05-12 16:56:46', '2022-05-12 16:56:46'),
(119, 6, 32, 1, 250, 250, '2022-05-12 16:56:46', '2022-05-12 16:56:46'),
(120, 7, 29, 1, 50, 50, '2022-05-12 16:56:57', '2022-05-12 16:56:57'),
(121, 7, 32, 1, 250, 250, '2022-05-12 16:56:57', '2022-05-12 16:56:57'),
(122, 8, 29, 1, 50, 50, '2022-05-12 16:57:06', '2022-05-12 16:57:06'),
(123, 8, 32, 1, 250, 250, '2022-05-12 16:57:06', '2022-05-12 16:57:06'),
(124, 9, 29, 1, 50, 50, '2022-05-12 16:57:09', '2022-05-12 16:57:09'),
(125, 9, 32, 1, 250, 250, '2022-05-12 16:57:09', '2022-05-12 16:57:09'),
(126, 10, 29, 1, 50, 50, '2022-05-12 16:57:21', '2022-05-12 16:57:21'),
(127, 10, 32, 1, 250, 250, '2022-05-12 16:57:21', '2022-05-12 16:57:21'),
(128, 11, 29, 1, 50, 50, '2022-05-12 17:14:33', '2022-05-12 17:14:33'),
(129, 11, 32, 1, 250, 250, '2022-05-12 17:14:33', '2022-05-12 17:14:33'),
(130, 12, 29, 1, 50, 50, '2022-05-12 17:29:49', '2022-05-12 17:29:49'),
(131, 12, 32, 1, 250, 250, '2022-05-12 17:29:49', '2022-05-12 17:29:49'),
(132, 13, 29, 1, 50, 50, '2022-05-12 17:30:42', '2022-05-12 17:30:42'),
(133, 13, 32, 1, 250, 250, '2022-05-12 17:30:42', '2022-05-12 17:30:42'),
(134, 14, 1, 1, 500, 500, '2022-05-12 17:42:44', '2022-05-12 17:42:44'),
(135, 15, 1, 1, 500, 500, '2022-05-12 17:42:46', '2022-05-12 17:42:46'),
(136, 16, 1, 1, 500, 500, '2022-05-12 17:42:54', '2022-05-12 17:42:54'),
(137, 17, 29, 1, 50, 50, '2022-05-12 17:48:33', '2022-05-12 17:48:33'),
(138, 17, 26, 1, 250, 250, '2022-05-12 17:48:33', '2022-05-12 17:48:33'),
(139, 18, 29, 1, 50, 50, '2022-05-12 17:54:17', '2022-05-12 17:54:17'),
(140, 18, 26, 1, 250, 250, '2022-05-12 17:54:17', '2022-05-12 17:54:17'),
(141, 19, 44, 1, 50, 50, '2022-05-12 19:48:50', '2022-05-12 19:48:50'),
(142, 19, 35, 2, 800, 1600, '2022-05-12 19:48:50', '2022-05-12 19:48:50'),
(143, 19, 34, 4, 300, 1200, '2022-05-12 19:48:50', '2022-05-12 19:48:50'),
(144, 20, 29, 1, 50, 50, '2022-05-12 20:36:14', '2022-05-12 20:36:14'),
(145, 20, 32, 1, 250, 250, '2022-05-12 20:36:14', '2022-05-12 20:36:14'),
(146, 20, 26, 1, 250, 250, '2022-05-12 20:36:14', '2022-05-12 20:36:14'),
(147, 21, 29, 1, 50, 50, '2022-05-12 20:37:14', '2022-05-12 20:37:14'),
(148, 22, 23, 1, 100, 100, '2022-05-12 20:51:33', '2022-05-12 20:51:33'),
(149, 23, 23, 1, 100, 100, '2022-05-12 20:51:43', '2022-05-12 20:51:43'),
(150, 24, 23, 1, 100, 100, '2022-05-12 20:51:46', '2022-05-12 20:51:46'),
(151, 25, 11, 1, 100, 100, '2022-05-12 20:54:23', '2022-05-12 20:54:23'),
(152, 26, 11, 1, 100, 100, '2022-05-12 20:54:38', '2022-05-12 20:54:38'),
(153, 27, 11, 1, 100, 100, '2022-05-12 20:54:45', '2022-05-12 20:54:45'),
(154, 28, 29, 4, 50, 200, '2022-05-13 01:16:58', '2022-05-13 01:16:58'),
(155, 29, 13, 1, 100, 100, '2022-05-13 04:35:53', '2022-05-13 04:35:53'),
(156, 30, 29, 3, 50, 150, '2022-05-13 08:55:24', '2022-05-13 08:55:24'),
(157, 30, 26, 3, 250, 750, '2022-05-13 08:55:24', '2022-05-13 08:55:24'),
(158, 31, 44, 1, 50, 50, '2022-05-13 12:44:21', '2022-05-13 12:44:21'),
(159, 31, 35, 1, 800, 800, '2022-05-13 12:44:21', '2022-05-13 12:44:21'),
(160, 32, 44, 4, 50, 200, '2022-05-13 13:11:30', '2022-05-13 13:11:30'),
(161, 33, 43, 2, 800, 1600, '2022-05-13 13:45:56', '2022-05-13 13:45:56'),
(162, 35, 1, 3, 500, 1500, '2022-05-13 14:01:01', '2022-05-13 14:01:01'),
(163, 35, 2, 5, 100, 500, '2022-05-13 14:01:01', '2022-05-13 14:01:01'),
(164, 36, 44, 3, 50, 150, '2022-05-13 14:04:18', '2022-05-13 14:04:18'),
(165, 37, 29, 2, 50, 100, '2022-05-13 14:06:55', '2022-05-13 14:06:55'),
(166, 38, 29, 3, 50, 150, '2022-05-13 15:41:47', '2022-05-13 15:41:47'),
(167, 38, 26, 1, 250, 250, '2022-05-13 15:41:47', '2022-05-13 15:41:47'),
(168, 39, 44, 5, 50, 250, '2022-05-13 15:46:16', '2022-05-13 15:46:16'),
(169, 40, 44, 1, 50, 50, '2022-05-13 16:27:36', '2022-05-13 16:27:36'),
(170, 41, 44, 2, 50, 100, '2022-05-13 16:32:19', '2022-05-13 16:32:19'),
(171, 42, 35, 1, 800, 800, '2022-05-13 16:52:26', '2022-05-13 16:52:26'),
(172, 43, 19, 1, 100, 100, '2022-05-13 19:25:04', '2022-05-13 19:25:04'),
(173, 44, 44, 2, 50, 100, '2022-05-13 20:08:46', '2022-05-13 20:08:46'),
(174, 45, 44, 4, 50, 200, '2022-05-13 20:21:26', '2022-05-13 20:21:26'),
(175, 46, 19, 1, 100, 100, '2022-05-13 22:47:33', '2022-05-13 22:47:33'),
(176, 47, 19, 1, 100, 100, '2022-05-14 00:22:13', '2022-05-14 00:22:13'),
(177, 48, 19, 1, 100, 100, '2022-05-14 00:22:15', '2022-05-14 00:22:15'),
(178, 49, 19, 1, 100, 100, '2022-05-14 00:22:27', '2022-05-14 00:22:27'),
(179, 50, 19, 1, 100, 100, '2022-05-14 00:22:28', '2022-05-14 00:22:28'),
(180, 51, 19, 1, 100, 100, '2022-05-14 03:41:13', '2022-05-14 03:41:13'),
(181, 52, 19, 1, 100, 100, '2022-05-14 03:41:20', '2022-05-14 03:41:20'),
(182, 53, 19, 1, 100, 100, '2022-05-14 03:41:27', '2022-05-14 03:41:27'),
(183, 54, 13, 1, 100, 100, '2022-05-14 03:43:34', '2022-05-14 03:43:34'),
(184, 55, 13, 1, 100, 100, '2022-05-14 04:33:59', '2022-05-14 04:33:59'),
(185, 56, 13, 1, 100, 100, '2022-05-14 04:41:19', '2022-05-14 04:41:19'),
(186, 57, 13, 1, 100, 100, '2022-05-14 04:47:18', '2022-05-14 04:47:18'),
(187, 58, 13, 1, 100, 100, '2022-05-14 04:53:51', '2022-05-14 04:53:51'),
(188, 59, 5, 1, 100, 100, '2022-05-14 04:57:43', '2022-05-14 04:57:43'),
(189, 60, 13, 1, 100, 100, '2022-05-14 04:58:02', '2022-05-14 04:58:02'),
(190, 61, 1, 1, 500, 500, '2022-05-14 05:00:04', '2022-05-14 05:00:04'),
(191, 62, 44, 1, 50, 50, '2022-05-14 05:03:43', '2022-05-14 05:03:43'),
(192, 63, 13, 1, 100, 100, '2022-05-14 05:09:10', '2022-05-14 05:09:10'),
(193, 64, 44, 1, 50, 50, '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(194, 64, 35, 1, 800, 800, '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(195, 64, 43, 2, 800, 1600, '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(196, 64, 33, 1, 300, 300, '2022-05-14 05:11:56', '2022-05-14 05:11:56'),
(197, 65, 44, 1, 50, 50, '2022-05-14 10:08:14', '2022-05-14 10:08:14'),
(198, 65, 35, 1, 800, 800, '2022-05-14 10:08:14', '2022-05-14 10:08:14'),
(199, 66, 29, 2, 50, 100, '2022-05-14 17:24:03', '2022-05-14 17:24:03'),
(200, 67, 32, 3, 250, 750, '2022-05-14 18:35:51', '2022-05-14 18:35:51'),
(201, 68, 44, 2, 50, 100, '2022-05-14 18:50:19', '2022-05-14 18:50:19'),
(202, 68, 33, 2, 300, 600, '2022-05-14 18:50:19', '2022-05-14 18:50:19'),
(203, 69, 43, 2, 800, 1600, '2022-05-14 23:54:24', '2022-05-14 23:54:24'),
(204, 70, 44, 1, 50, 50, '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(205, 70, 35, 1, 800, 800, '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(206, 70, 33, 1, 300, 300, '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(207, 70, 34, 1, 300, 300, '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(208, 70, 43, 1, 800, 800, '2022-05-15 01:52:04', '2022-05-15 01:52:04'),
(209, 71, 44, 1, 50, 50, '2022-05-15 05:51:59', '2022-05-15 05:51:59'),
(210, 72, 44, 1, 50, 50, '2022-05-15 16:16:03', '2022-05-15 16:16:03'),
(211, 73, 34, 1, 300, 300, '2022-05-16 04:18:53', '2022-05-16 04:18:53'),
(212, 73, 33, 3, 300, 900, '2022-05-16 04:18:53', '2022-05-16 04:18:53'),
(213, 74, 35, 2, 800, 1600, '2022-05-16 11:31:57', '2022-05-16 11:31:57'),
(221, 80, 48, 1, 35, 35, '2022-05-17 18:45:41', '2022-05-17 18:45:41'),
(222, 80, 47, 1, 475, 475, '2022-05-17 18:45:41', '2022-05-17 18:45:41'),
(223, 81, 48, 1, 35, 35, '2022-05-17 19:20:18', '2022-05-17 19:20:18'),
(224, 81, 47, 1, 475, 475, '2022-05-17 19:20:18', '2022-05-17 19:20:18'),
(225, 82, 33, 1, 300, 300, '2022-05-18 19:32:40', '2022-05-18 19:32:40'),
(226, 82, 34, 1, 300, 300, '2022-05-18 19:32:40', '2022-05-18 19:32:40'),
(227, 83, 35, 1, 800, 800, '2022-05-19 20:38:18', '2022-05-19 20:38:18'),
(228, 84, 48, 3, 35, 105, '2022-05-19 21:11:21', '2022-05-19 21:11:21'),
(229, 85, 48, 1, 35, 35, '2022-05-25 03:52:43', '2022-05-25 03:52:43'),
(230, 86, 44, 1, 50, 50, '2022-05-25 04:24:47', '2022-05-25 04:24:47'),
(231, 87, 35, 1, 800, 800, '2022-05-25 04:40:36', '2022-05-25 04:40:36'),
(232, 87, 33, 1, 300, 300, '2022-05-25 04:40:36', '2022-05-25 04:40:36'),
(233, 88, 44, 1, 50, 50, '2022-05-25 05:11:27', '2022-05-25 05:11:27'),
(234, 88, 35, 3, 800, 2400, '2022-05-25 05:11:27', '2022-05-25 05:11:27'),
(235, 89, 44, 1, 50, 50, '2022-05-25 06:44:57', '2022-05-25 06:44:57'),
(236, 90, 44, 1, 50, 50, '2022-06-01 19:21:21', '2022-06-01 19:21:21'),
(237, 91, 44, 1, 50, 50, '2022-06-01 19:41:58', '2022-06-01 19:41:58'),
(238, 92, 44, 1, 50, 50, '2022-06-03 16:31:05', '2022-06-03 16:31:05'),
(239, 93, 49, 2, 120, 240, '2022-06-07 13:42:57', '2022-06-07 13:42:57'),
(240, 93, 44, 3, 50, 150, '2022-06-07 13:42:57', '2022-06-07 13:42:57'),
(241, 94, 44, 3, 50, 150, '2022-06-07 13:46:55', '2022-06-07 13:46:55'),
(242, 94, 49, 1, 120, 120, '2022-06-07 13:46:55', '2022-06-07 13:46:55'),
(243, 95, 44, 2, 50, 100, '2022-06-07 14:58:42', '2022-06-07 14:58:42'),
(244, 96, 29, 3, 50, 150, '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(245, 96, 32, 2, 250, 500, '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(246, 96, 26, 2, 250, 500, '2022-06-07 15:48:25', '2022-06-07 15:48:25'),
(247, 97, 44, 3, 50, 150, '2022-06-07 15:49:56', '2022-06-07 15:49:56'),
(248, 97, 49, 1, 120, 120, '2022-06-07 15:49:56', '2022-06-07 15:49:56'),
(249, 98, 44, 1, 50, 50, '2022-06-07 17:21:01', '2022-06-07 17:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `added_by`, `updated_by`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'role-list', 'web', '2021-01-08 09:14:08', '2021-01-11 03:27:49'),
(2, NULL, 1, 'role-create', 'web', '2021-01-08 09:14:08', '2021-01-11 03:47:49'),
(3, NULL, NULL, 'role-edit', 'web', '2021-01-08 09:14:08', '2021-01-09 08:00:49'),
(4, NULL, NULL, 'role-delete', 'web', '2021-01-08 09:14:08', '2021-01-09 08:00:45'),
(9, NULL, NULL, 'user-list', 'web', '2021-01-08 09:43:31', '2021-01-09 07:59:26'),
(10, NULL, NULL, 'user-create', 'web', '2021-01-08 09:43:31', '2021-01-09 07:59:21'),
(11, NULL, NULL, 'user-edit', 'web', '2021-01-08 09:43:31', '2021-01-09 07:59:14'),
(12, NULL, NULL, 'user-delete', 'web', '2021-01-08 09:43:31', '2021-01-09 07:59:09'),
(13, NULL, NULL, 'permission-list', 'web', '2021-01-09 05:55:14', '2021-01-09 07:58:46'),
(14, NULL, NULL, 'permission-create', 'web', '2021-01-09 05:55:14', '2021-01-09 07:58:42'),
(15, NULL, NULL, 'permission-edit', 'web', '2021-01-09 05:55:14', '2021-01-09 07:58:38'),
(16, NULL, NULL, 'permission-delete', 'web', '2021-01-09 05:55:15', '2021-01-09 07:57:50'),
(25, 1, NULL, 'customer-delete', 'web', '2021-12-29 09:39:00', '2021-12-29 09:39:00'),
(26, 1, NULL, 'customer-create', 'web', '2021-12-29 09:39:10', '2021-12-29 09:39:10'),
(27, 1, NULL, 'customer-edit', 'web', '2021-12-29 09:39:22', '2021-12-29 09:39:22'),
(28, 1, NULL, 'customer-list', 'web', '2021-12-29 09:39:41', '2021-12-29 09:39:41'),
(29, 1, NULL, 'rider-list', 'web', '2021-12-29 10:43:12', '2021-12-29 10:43:12'),
(30, 1, NULL, 'rider-edit', 'web', '2021-12-29 10:43:24', '2021-12-29 10:43:24'),
(31, 1, NULL, 'rider-delete', 'web', '2021-12-29 10:43:38', '2021-12-29 10:43:38'),
(32, 1, NULL, 'rider-create', 'web', '2021-12-29 10:43:57', '2021-12-29 10:43:57'),
(33, 1, NULL, 'rider-detail-list', 'web', '2021-12-29 11:34:13', '2021-12-29 11:34:13'),
(34, 1, NULL, 'rider-detail-view', 'web', '2021-12-29 11:34:21', '2021-12-29 11:34:21'),
(35, 1, NULL, 'restaurant-list', 'web', '2022-01-05 04:36:15', '2022-01-05 04:36:15'),
(36, 1, NULL, 'restaurant-create', 'web', '2022-01-05 04:36:29', '2022-01-05 04:36:29'),
(37, 1, NULL, 'restaurant-edit', 'web', '2022-01-05 04:36:41', '2022-01-05 04:36:41'),
(38, 1, NULL, 'restaurant-delete', 'web', '2022-01-05 04:36:55', '2022-01-05 04:36:55'),
(39, 1, NULL, 'item-list', 'web', '2022-01-05 06:52:29', '2022-01-05 06:52:29'),
(40, 1, NULL, 'item-create', 'web', '2022-01-05 06:52:43', '2022-01-05 06:52:43'),
(41, 1, NULL, 'item-edit', 'web', '2022-01-05 06:52:57', '2022-01-05 06:52:57'),
(42, 1, NULL, 'item-delete', 'web', '2022-01-05 06:53:09', '2022-01-05 06:53:09'),
(43, 1, NULL, 'shopper-list', 'web', '2022-01-06 02:02:49', '2022-01-06 02:02:49'),
(44, 1, NULL, 'shopper-create', 'web', '2022-01-06 02:03:02', '2022-01-06 02:03:02'),
(45, 1, NULL, 'shopper-edit', 'web', '2022-01-06 02:03:13', '2022-01-06 02:03:13'),
(46, 1, NULL, 'shopper-delete', 'web', '2022-01-06 02:03:25', '2022-01-06 02:03:25'),
(47, 1, NULL, 'setting-list', 'web', '2022-01-06 05:21:38', '2022-01-06 05:21:38'),
(48, 1, NULL, 'content-list', 'web', '2022-01-06 05:21:52', '2022-01-06 05:21:52'),
(49, 1, NULL, 'log-list', 'web', '2022-01-06 05:22:10', '2022-01-06 05:22:10'),
(50, 1, NULL, 'content-update', 'web', '2022-01-06 05:46:29', '2022-01-06 05:46:29'),
(51, 1, 1, 'dashboard-list', 'web', '2022-01-06 06:44:42', '2022-01-06 06:49:34'),
(52, 1, NULL, 'grocery-list', 'web', '2022-01-11 07:07:15', '2022-01-11 07:07:15'),
(53, 1, NULL, 'grocery-edit', 'web', '2022-01-11 07:07:31', '2022-01-11 07:07:31'),
(54, 1, NULL, 'grocery-create', 'web', '2022-01-11 07:07:49', '2022-01-11 07:07:49'),
(55, 1, NULL, 'grocery-delete', 'web', '2022-01-11 07:08:08', '2022-01-11 07:08:08'),
(56, 1, NULL, 'category-list', 'web', '2022-01-13 08:17:10', '2022-01-13 08:17:10'),
(57, 1, NULL, 'category-create', 'web', '2022-01-13 08:17:24', '2022-01-13 08:17:24'),
(58, 1, NULL, 'category-edit', 'web', '2022-01-13 08:19:55', '2022-01-13 08:19:55'),
(59, 1, NULL, 'category-delete', 'web', '2022-01-13 08:20:13', '2022-01-13 08:20:13'),
(60, 1, NULL, 'coupon-list', 'web', '2022-03-03 06:01:28', '2022-03-03 06:01:28'),
(61, 1, NULL, 'coupon-create', 'web', '2022-03-03 06:02:08', '2022-03-03 06:02:08'),
(62, 1, NULL, 'coupon-edit', 'web', '2022-03-03 06:02:25', '2022-03-03 06:02:25'),
(63, 1, NULL, 'coupon-delete', 'web', '2022-03-03 06:03:08', '2022-03-03 06:03:08'),
(64, 1, NULL, 'expertise-list', 'web', '2022-04-11 06:17:03', '2022-04-11 06:17:03'),
(65, 1, NULL, 'expertise-create', 'web', '2022-04-11 06:17:22', '2022-04-11 06:17:22'),
(66, 1, NULL, 'expertise-edit', 'web', '2022-04-11 06:17:35', '2022-04-11 06:17:35'),
(67, 1, NULL, 'expertise-delete', 'web', '2022-04-11 06:17:46', '2022-04-11 06:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `serviceProvider_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `customer_id`, `serviceProvider_id`, `item_id`, `rating`, `comments`, `created_at`, `updated_at`) VALUES
(23, 7, NULL, 2, 5, 'lorem ipsum', NULL, NULL),
(24, 2, NULL, 7, 4, 'lorem ipsum', NULL, NULL),
(25, 9, NULL, 8, 3, 'lorem ipsum', NULL, NULL),
(26, 10, NULL, 10, 2, 'lorem ipsum', NULL, NULL),
(27, 14, NULL, 10, 3, 'lorem ipsum', NULL, NULL),
(28, 15, NULL, 10, 4, 'lorem ipsum', NULL, NULL),
(29, 10, 29, 10, 2, 'lorem ipsum', NULL, NULL),
(30, 29, 58, 10, 3, 'lorem ipsum', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rider_detail`
--

CREATE TABLE `rider_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` int(11) NOT NULL,
  `vehicle_brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_manufacterer_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_plate_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_identification_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_detail`
--

INSERT INTO `rider_detail` (`id`, `rider_id`, `vehicle_brand`, `vehicle_model`, `vehicle_manufacterer_year`, `vehicle_plate_no`, `vehicle_image`, `rider_identification_image`, `created_at`, `updated_at`) VALUES
(1, 9, '1', '1', '2012', '435-02A', '/uploads/rider-detail/779b7513263ef185b6d094af290ef5401632913064.png', '/uploads/rider-detail/779b7513263ef185b6d094af290ef5401632913064.png', '2021-12-29 16:59:28', '2021-12-29 16:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `rider_sessions`
--

CREATE TABLE `rider_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider_sessions`
--

INSERT INTO `rider_sessions` (`id`, `rider_id`, `start_date_time`, `end_date_time`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-03 19:13:33', '2022-01-03 19:53:33', NULL, NULL),
(2, 1, '2022-01-03 19:13:33', '2022-01-03 20:13:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `added_by`, `updated_by`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Admin', 'web', '2021-01-08 09:15:51', '2021-01-11 03:45:55'),
(2, NULL, NULL, 'Customer', 'web', '2021-01-08 09:29:42', '2021-01-08 09:29:42'),
(4, NULL, 1, 'Rider', 'web', '2021-01-09 05:03:16', '2021-04-01 07:04:52'),
(6, 1, 1, 'Restaurant', 'web', '2022-01-05 04:24:21', '2022-01-05 04:24:35'),
(7, 1, NULL, 'Shopper', 'web', '2022-01-06 02:15:33', '2022-01-06 02:15:33'),
(8, 1, NULL, 'Grocery', 'web', '2022-01-11 06:52:58', '2022-01-11 06:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(28, 4),
(28, 6),
(28, 7),
(28, 8),
(29, 1),
(29, 4),
(29, 6),
(29, 8),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(33, 6),
(33, 8),
(34, 1),
(34, 6),
(35, 1),
(35, 4),
(35, 7),
(35, 8),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(39, 4),
(39, 7),
(39, 8),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(43, 7),
(43, 8),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(51, 1),
(51, 8),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'favicon', 'http://pet-pal.test/assets/admin/img/favicon.ico', '1', '2020-05-28 10:06:29', '2021-03-23 02:32:42'),
(2, 'logo', 'http://pet-pal.test/assets/admin/img/logo.png', '1', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(3, 'email', 'support@porter.com', '1', '2020-05-28 10:06:30', '2022-01-06 06:03:33'),
(4, 'secondary_email', 'test@porter.com', '1', '2020-05-28 10:06:30', '2022-01-06 06:03:33'),
(5, 'contact_number', '123456789', '1', '2020-05-28 10:06:30', '2022-01-06 06:03:33'),
(6, 'secondary_contact_number', '987654321', '1', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(7, 'whatsapp_number', '147852369', '1', '2020-05-28 10:06:30', '2022-01-06 06:03:33'),
(8, 'country', 'Pakistan', '1', '2020-05-28 10:06:30', '2021-03-23 02:32:42'),
(9, 'city', 'Karachi', '1', '2021-03-10 15:35:38', '2021-03-23 02:32:42'),
(10, 'address', 'xyz', '1', '2021-05-02 19:00:00', '2022-01-06 06:03:33'),
(11, 'company_name', 'Porter', '1', '2021-06-16 03:54:13', '2022-01-06 06:03:33'),
(12, 'vat', '5', '1', '2021-06-16 03:54:13', '2022-01-06 06:03:33'),
(13, 'commission ', '5', '1', '2021-06-16 03:54:13', '2022-01-06 06:03:33'),
(14, 'delivery_cost', '2', '1', '2021-06-16 03:54:13', '2022-01-06 06:03:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `br_code` int(20) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_grocery` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuisine_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_order` int(20) DEFAULT NULL,
  `serv_distance` float DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_by` enum('email','facebook','google','apple') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_provider` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onlineStatus` tinyint(4) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `social_id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `image`, `br_code`, `address`, `assigned_grocery`, `remember_token`, `otp`, `zip_code`, `latitude`, `longitude`, `age`, `dob`, `country_code`, `country_flag`, `cuisine_type`, `delivery_time`, `discount`, `order_type`, `min_order`, `serv_distance`, `device_type`, `device_token`, `verified_by`, `social_provider`, `social_token`, `identity`, `id_image`, `description`, `onlineStatus`, `added_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, NULL, 'Admin', 'admin@porter.com', NULL, NULL, '$2y$10$3TWU8LoWfDo9RuTnyC.mqecOXH.tec3.2XuNWQuBm1v3kA9RJKiOu', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, '\"\"', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, '2021-01-08 09:15:51', 1, '2022-03-01 10:09:57'),
(2, NULL, 'User', 'user@master.com', NULL, NULL, '$2y$10$y7IpMVBSluFe3Te.RKfDdO6hiao1Zu5FXdYfbvrAcJ6RHoTKcvw1q', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, 4566, '', '24.9047306', '67.0759041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, NULL, '2021-01-08 09:30:13', 1, '2022-05-09 22:03:57'),
(7, NULL, 'User Update', 'user@yopmail.com', '2147483647', '2021-12-29 08:01:13', '$2y$10$5zoQYX1KFdd/R83aaZ3TvuVkZugN0FdYNsaAY1bJWaPp83VzrMGAe', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, '', NULL, 0, NULL, '2021-12-29 07:59:33', NULL, '2022-03-23 05:16:10'),
(9, NULL, 'John', 'john@gmail.com', NULL, NULL, '$2y$10$AJqlZQJxs5fQyT44mURDaeMnaaA3O8k7eWopuaGM6zH8VOLXZJ3Ni', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, 1, '2021-12-29 10:46:14', NULL, '2021-12-29 10:46:14'),
(10, NULL, 'Darbar Restaurant', 'd@email.com', NULL, NULL, '$2y$10$ngsg/CM4CkkAUABoY8UMVOPSUosK/EB6b6EZxncsqeUQGnl8K2dqW', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, '', '24.9035975', '67.0701009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, 1, '2022-01-05 05:26:34', NULL, '2022-01-05 06:03:53'),
(12, NULL, 'test user', 'shopper@gmail.com', '12345678', NULL, '$2y$10$P2kJhjN.M.1HKyrw3KbsV.B9Snf0Pr1Ekh0coSPehoNv4IQrLPP9e', 'public/uploads/users/img/user-avatar.png', NULL, '123', 0, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0, 1, '2022-01-06 03:23:05', NULL, '2022-01-06 03:23:05'),
(13, NULL, 'robert', 'robert@gmail.com', '023146567', '2022-01-07 05:06:10', '$2y$10$SDHTZb4hkMbp7Cdm701fg.rdaFW03eHQatdG50U31kGYE.H9O1Pme', 'public/uploads/users/img/1435976706.jpg', NULL, 'address', 0, NULL, NULL, '99105', '24.9177598', '67.0949881', 21, '2000-01-01', '1', NULL, 'Chinese', '00:00:20', 5, '', 20, 5, NULL, '12345678', 'email', NULL, NULL, 'passport', 'public/uploads/users/img/1485787762.png', 'lorem ipsum', 0, NULL, '2022-01-07 05:03:26', NULL, '2022-05-09 16:08:43'),
(14, NULL, 'Karachi Restaurant', 'mr.daniel111@yahoo.com', '123456', NULL, '$2y$10$Th3pGTvf3gy0aJlqoK9T6u5rR7/5OEWFud2rAQLpOvw06t3kbCohq', 'public/uploads/users/img/user-avatar.png', NULL, 'karachi', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2022-02-28 06:38:03', NULL, '2022-02-28 06:38:03'),
(15, NULL, 'Ghazi Restaurant', 'atif@gmail.com', '12', NULL, '$2y$10$hJN128d6Zo3WAeXGBQqFa.zOQfQdN7ZoKN36xWJC7dQ3r077taUje', 'public/uploads/users/img/user-avatar.png', NULL, '1154 fb area', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2022-02-28 07:16:37', NULL, '2022-02-28 07:16:37'),
(16, NULL, 'Hamza Grocery Wala  ', 'atif1@gmail.com', '1', NULL, '$2y$10$sSODUaQZAi3yAmum4oaBu.h/ySDdnRvvOmvJ5xnR6Yz6Js4Wxy0.C', 'public/uploads/users/img/user-avatar.png', NULL, '1154 fb area', 0, NULL, 2730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2022-02-28 07:17:31', NULL, '2022-04-27 17:05:30'),
(17, NULL, 'Test User', 'restaurent1@gmail.com', '03043167149', '2022-03-23 05:52:32', '$2y$10$MpzFaP8MwrVnkD2snDxIku939Bg9aMXfVHc5PedpldnlrdRWxcHda', 'public/uploads/users/img/user-avatar.png', NULL, 'new york, usa', 0, NULL, NULL, '99105', NULL, NULL, NULL, NULL, '+1', NULL, NULL, '00:00:20', 5, '', NULL, 5, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-23 05:25:03', NULL, '2022-04-07 14:31:57'),
(18, NULL, 'alex', 'alex@gmail.com', '946565822', NULL, '$2y$10$j5WKdWiwKSmBXHfkHAeRwusrJizWQC4N9DWIiZhR0z1deAB5m9DTW', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 2017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-24 08:38:55', NULL, '2022-05-09 21:50:10'),
(19, NULL, 'Abc Restaurant', 'alex1@gmail.com', '03121234567', NULL, '$2y$10$Q/p6yA107MTvIntWqnOaA.Uf9yh4zGSD3WSOGBsVoMrFfcICP7RIi', 'public/uploads/users/img/user-avatar.png', NULL, 'street 12, house # 111', 0, NULL, 2073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 02:20:50', NULL, '2022-03-25 02:20:50'),
(20, NULL, 'xyz restaurant', 'alex2@gmail.com', '252345345', NULL, '$2y$10$zQC57ZNmEDuh547bS3TYc.Vxx02JJxCY3Tj5m/VJ2UvNLZ5Hthf62', 'public/uploads/users/img/user-avatar.png', NULL, 'dsfdsfdsf', 0, NULL, 1840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 03:51:53', NULL, '2022-03-25 03:51:53'),
(21, NULL, 'xyz restaurant', 'alex3@gmail.com', '252345345', NULL, '$2y$10$aip1nikxVCdDUPVjc37d/.pNriT3KB7Hmi6LMeVUotCd5Vvpr2Rjy', 'public/uploads/users/img/user-avatar.png', 321, 'dsfdsfdsf', 0, NULL, 7771, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 03:54:22', NULL, '2022-03-25 03:54:22'),
(22, NULL, 'gdfgdsf', 'alex4@gmail.com', '345345', '2022-03-25 05:17:37', '$2y$10$HCPbEDwmmqB5PYcWKVaj6.XEgLeLd366rhn3XgQkTxxrcc4rWL1X.', 'public/uploads/users/img/user-avatar.png', 345, 'fdsfdsf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 05:16:38', NULL, '2022-03-25 05:17:37'),
(23, NULL, 'Testing Restaurant', 'alex5@gmail.com', '0978786324', '2022-03-25 05:43:33', '$2y$10$r6dumQTQgRp3Al9ODwdiKeTZJtZgrJ8rK6w3UJCst1bk6tnpZdrFG', 'public/uploads/users/img/user-avatar.png', 1234, 'dsferrgrg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 05:42:57', NULL, '2022-03-25 07:38:39'),
(24, NULL, 'The Restaurant', 'alex6@gmail.com', '8904234', '2022-03-25 06:02:19', '$2y$10$Pwmwcb2LKDu/86GKbNU0.uyekioO2VwG6EKmH8XTFofwY3vN7pMh6', 'public/uploads/users/img/user-avatar.png', 123, 'fdsfdsf', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 06:01:54', NULL, '2022-03-25 07:51:41'),
(25, NULL, 'dggdfgd', 'alex7@gmail.com', '456456456', '2022-03-25 06:42:17', '$2y$10$HJD2Jf.KaGwGSDzXsfxnCe/ObXSpQVC1eTXM039WxjJM5ps43eUg.', 'public/uploads/users/img/user-avatar.png', 34565, 'fgdfg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-25 06:36:04', NULL, '2022-03-25 06:42:17'),
(29, NULL, 'Alex', 'alex@mail.com', '946565822', '2022-03-31 06:02:44', '$2y$10$FgTDCV/hIC0CvZP9iB0A8uOdSEabzs2Gk1hJnN9qUcWGRGtDGSIim', 'public/uploads/users/img/553173971.jpg', 123, 'Karachi Pakistan', 0, NULL, NULL, NULL, '24.9175745', '67.0948217', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-03-28 08:28:09', NULL, '2022-05-09 14:21:55'),
(30, NULL, 'Rider', 'Rider@gmail.com', '123451234', NULL, '$2y$10$W.epNuNUFY.KkqE529kwEeEJf08ss8maEq1XUD1qES8wO5YnV1O3O', 'public/uploads/users/img/user-avatar.png', NULL, 'Times Square', 0, NULL, 2365, NULL, NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-29 02:05:07', NULL, '2022-03-29 02:05:07'),
(31, NULL, 'Rider', 'testrider@gmail.com', '123321123', '2022-03-29 02:12:39', '$2y$10$eODYyooY2cVOE8Pi8DcCPOOgFpmfEOFvcfJ0uUhSO/r5RO69.RT0m', 'public/uploads/users/img/303344678.jpg', NULL, 'San Francisco International Airport (SFO), San Francisco, CA, USA', 0, '', NULL, '123456', '24.904725', '67.0780917', 21, '2000-01-01', '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, 'Passport', 'public/uploads/users/img/2031001542.jpg', 'lorem ipsum', 0, NULL, '2022-03-29 02:09:26', NULL, '2022-05-09 12:46:44'),
(32, NULL, 'alex', 'alex@gmail.co', '946565822', NULL, '$2y$10$dmDrTCvtn3kVUC6P6RX0RemCrC4Thif.Hg7uXXsWifEikFdZLeQhC', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 7974, NULL, NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-29 05:52:26', NULL, '2022-03-29 05:52:26'),
(33, 'JyeT6bC5b89VbfE9ynUaYiCdDij8', 'Google Sign In 2', 'googlerole@golocalcoffee.com', NULL, '2022-03-29 07:20:06', '$2y$10$MW4gMbGSELp2tUYk8dktNOG3iu.Txrbslpt64z63Qi/L463BGt566', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'google', 'google', 'JyeT6bC5b89VbfE9ynUaYiCdDij8', NULL, NULL, NULL, 0, NULL, '2022-03-29 07:20:06', NULL, '2022-03-29 07:20:06'),
(34, 'O6zXsOkcNf9cq8TKVkbWU', 'Google Sign', 'google@gmail.com', NULL, '2022-03-29 07:28:53', '$2y$10$xcqDasuSF2UOzpMkSbnuwOGG2ntK3.dDJOT/aS6sZPaSNz9X/yW9W', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'google', 'google', 'O6zXsOkcNf9cq8TKVkbWU', NULL, NULL, NULL, 0, NULL, '2022-03-29 07:28:53', NULL, '2022-03-29 07:28:53'),
(37, 'JO6zXsOkcNf9cq8TKVkbWUFr1N52', 'Babar Ali', 'babarali735@yahoo.com', NULL, '2022-03-30 05:44:46', '$2y$10$TA7P8tvXc0tHNFoe40u4kewYyvo5kaz05ocGihpDSVOYkfHGJIDUm', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'facebook', 'facebook', 'JO6zXsOkcNf9cq8TKVkbWUFr1N52', NULL, NULL, NULL, 0, NULL, '2022-03-30 05:44:46', NULL, '2022-03-30 05:44:46'),
(38, NULL, 'Jam', 'jam@yopmail.com', '123456789', NULL, '$2y$10$lS9fBogyr0OX8XGiz7zDZenO/EeOvbM9EtV60r2PXazJvz1m3yx.W', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 1212, NULL, NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-31 04:46:51', NULL, '2022-03-31 04:46:51'),
(39, NULL, 'Jam', 'jam1@yopmail.com', '123456789', '2022-03-31 04:57:32', '$2y$10$YrsDNo2p459kv8YtbbySyuuZVRMIPi0HNbJyc1F.rHA9caMVm2eC2', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-03-31 04:57:22', NULL, '2022-03-31 04:57:32'),
(40, NULL, 'Alex Restaurant', 'alex_restaurant@gmail.com', '946565822', '2022-04-01 08:14:17', '$2y$10$gTbg5lBucQp/KVrmosXNBOb6TQVRXqKk2LyVu1phwkU901in08tiq', 'public/uploads/users/img/user-avatar.png', 123, 'Plot # 123, Defence Area', 0, NULL, NULL, '99105', '24.9155696', '67.0899306', NULL, NULL, NULL, NULL, 'Korean', '00:01:20', 5, '', 300, 10, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-01 08:12:51', NULL, '2022-04-06 02:51:10'),
(41, NULL, 'abc', 'abc@yopmail.com', '123456789', '2022-04-05 06:59:56', '$2y$10$NIvBxikGAifFUxglCH.Hrub08w2ZQnzRyOjzSWMyr9RrE.fm2JFGK', 'public/uploads/users/img/user-avatar.png', NULL, 'abcdefgh', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-05 06:59:45', NULL, '2022-04-05 06:59:56'),
(46, NULL, 'alex', 'alex2@mail.com', '946565822', NULL, '$2y$10$zC0amb0Dn.DmFPWRKWwMXu.h6WGM2VVBsrpDqRjojYVkItms.JbD.', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 1708, NULL, '2.4567', '2.3456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-06 02:08:32', NULL, '2022-04-06 02:08:32'),
(48, NULL, 'alex', 'alex3@mail.com', '946565822', NULL, '$2y$10$pXAJzz61RfUCHw32GPmKeevW1qmkJfTC2db8hfiJ//dwmiwQnxwFa', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 4260, NULL, '2.4567', '2.3456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-06 02:10:03', NULL, '2022-04-06 02:10:03'),
(53, NULL, 'Alex Grocery', 'alex_grocery@gmail.com', '0987654321', '2022-04-06 02:14:15', '$2y$10$kqOZ53zGJdjiJE9Ts7B76.68LmlTkmtUucFsIYZ0VezipFU4y572i', 'public/uploads/users/img/user-avatar.png', 321, '123 Park Lane', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-06 02:13:24', NULL, '2022-04-06 02:14:15'),
(54, NULL, 'alex', 'alex1@mail.com', '946565822', '2022-04-13 07:01:22', '$2y$10$gk5liFcwJP4fNnU096egAeXj6G8PR2uCqEv0MgJ37mnmqez8j1BeS', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 0, NULL, '24.9003955', '67.0735117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-06 02:15:13', NULL, '2022-04-06 02:15:13'),
(57, NULL, 'alex', 'alex1234@yopmail.com', '946565822', NULL, '$2y$10$YLFrwpokW3QjJdX96BWFf.zq5MGGOE9wd2BAtN7fq9VGHGpvqTAse', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 4373, NULL, '2.4567', '2.3456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-06 02:53:44', NULL, '2022-04-06 02:53:44'),
(58, NULL, 'Waqas Khan', 'waqas_res@gmail.com', '3121234567', '2022-04-06 04:42:37', '$2y$10$ViElzWLWENAO7LepJNoR0u1EGcrNZT/sb05ajQ82vaSQ5BJ1I/euK', 'public/uploads/users/img/user-avatar.png', 345, 'Noor trade center', 0, NULL, NULL, '76200', '24.9171068', '67.0859723', NULL, NULL, '92', NULL, 'French', '00:00:10', 10, 'Test', 1, 10, NULL, NULL, 'email', NULL, '', NULL, NULL, NULL, 1, NULL, '2022-04-06 04:42:10', NULL, '2022-06-07 14:32:36'),
(59, NULL, 'KK Mart', 'waqas_grocery@gmail.com', '6456456', '2022-04-06 05:27:28', '$2y$10$rjLtXToTndzimoExto8KGe4VmSyQ58qijkD0XIqN0yB.BFqdyMz0u', 'public/uploads/users/img/user-avatar.png', 789, '123 Street', 0, NULL, NULL, NULL, '24.9115613', '67.086409', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-06 05:05:51', NULL, '2022-05-16 16:04:16'),
(60, NULL, 'rider22', 'rider23@yopmail.com', '134567789', NULL, '$2y$10$1wni6qyRZv8kvc4GX72XuuslDo/NyTtJNHcr5gGuq6idjJsbqWRT2', 'public/uploads/users/img/user-avatar.png', NULL, 'Karl-Liebknecht-Str. 1, 10178 Berlin, Germany', 0, NULL, 8234, NULL, '52.5196077', '13.4027331', NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 01:05:02', NULL, '2022-04-07 01:05:02'),
(61, NULL, 'rider22', 'rider234@yopmail.com', '134567789', NULL, '$2y$10$/UWrjau530YXmgin.23V0.qSgm5GbtCsFNs05SFnpVlPOGz50Fkle', 'public/uploads/users/img/user-avatar.png', NULL, 'Karl-Liebknecht-Str. 1, 10178 Berlin, Germany', 0, NULL, 3910, NULL, '52.5196077', '13.4027331', NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 01:09:07', NULL, '2022-04-07 01:09:07'),
(62, NULL, 'Rider1234', 'Rider1234@yopmail.com', '123456789', '2022-04-07 01:17:10', '$2y$10$ZA0d.3AIkDHEv1odRfJxjeSN/.ePfTR0IETeaDQXdRWH/9I/8Ndna', 'public/uploads/users/img/user-avatar.png', NULL, '3700 Central Ave, Riverside, CA 92506, USA', 0, NULL, NULL, NULL, '24.9021881\r\n', '67.0716933', NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2022-04-07 01:16:51', NULL, '2022-04-07 01:17:10'),
(63, NULL, 'Riderabcd', 'Riderabcd@yopmail.com', '123456789', '2022-04-07 01:27:42', '$2y$10$c3FOYU5ieG5WpiCCfXbYm.L5/7nvInU2oso2/uLhMQ/oclGZi4IJq', 'public/uploads/users/img/user-avatar.png', NULL, '56 P. Linh Đ., Hoàng Liệt, Hoàng Mai, Hà Nội, Vietnam', 0, NULL, NULL, NULL, '20.96430609999999', '105.8259604', NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 01:27:12', NULL, '2022-04-07 01:27:42'),
(64, NULL, 'John', 'john_doe@gmail.com', '946565822', NULL, '$2y$10$AtnYmgec0J2NWYls2cmuAuuuDuhFN0h5duUQ/TP2BqhkiWWhrmSNC', 'public/uploads/users/img/user-avatar.png', NULL, 'New York', 0, NULL, 3739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 01:38:17', NULL, '2022-04-07 01:38:17'),
(65, NULL, 'John', 'james@gmail.com', '946565822', '2022-04-07 01:40:07', '$2y$10$JVkfbuKU.D1sSYwW2hNbPuW.uzqDAcpZ4cdEjtCgNfnzpM6kPKKzO', 'public/uploads/users/img/user-avatar.png', NULL, 'New York', 0, NULL, NULL, NULL, '24.9177598', '67.0949881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 01:39:27', NULL, '2022-04-07 01:40:07'),
(66, NULL, 'alex', 'customer@yopmail.com', '946565822', NULL, '$2y$10$TbxSjaQLpXKyPdtiyRNJSe9e8.eoNDANxOkWkKEB3LcXPaUdEkdD6', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 9209, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:14:21', NULL, '2022-04-07 13:14:21'),
(67, NULL, 'Barry Allen', 'customer2@yopmail.com', '946565822', NULL, '$2y$10$Odj/KE4HrmPQC3XAl0k0...PJFg071ccjXtG35aDH1BxBWKhcIzNG', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 6957, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:14:50', NULL, '2022-04-07 13:15:24'),
(68, NULL, 'Barry Allen', 'customer3@yopmail.com', '946565822', NULL, '$2y$10$dlS2lUw02y1U9qW6cXEHKeRoOWOdFhe.t9CmbA/KHncGOX.NAJI5a', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 1220, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:15:42', NULL, '2022-04-07 13:15:42'),
(69, NULL, 'alex', 'alex99@mail.com', '946565822', NULL, '$2y$10$aMRPuYo3jJJfnWidvlvmZeII9EUG06WJSsXDW4/2J9016mjzgotde', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 2684, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:18:07', NULL, '2022-04-07 13:18:07'),
(70, NULL, 'alex', 'b@mail.com', '946565822', NULL, '$2y$10$9hDU5lA7MOa/gUimusOQGu/Pfg5IDXTQoT3h5T7dZlY1tAajl1qm2', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 9797, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:18:44', NULL, '2022-04-07 13:18:44'),
(71, NULL, 'alex', 'bss@mail.com', '946565822', NULL, '$2y$10$fbBv42bZIsbtBKdP/KqH3.mJkYj.PWQvlN9SGhWpOZ3psx5nV0nZa', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 6963, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:19:06', NULL, '2022-04-07 13:19:06'),
(72, NULL, 'alex', 'bsssss@mail.com', '946565822', NULL, '$2y$10$X.zBEL.pGy9b1r2d5PJIyeT4fy3pfuKzyXVLNt87hcSonUqYc2Su.', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 7761, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:19:23', NULL, '2022-05-09 22:04:23'),
(73, NULL, 'Barry Allen', 'cust@yopmail.com', '946565822', '2022-04-07 13:22:57', '$2y$10$fHFK2X2vNCaOfyCMQN2BFOsG.PzECjQQP4CdT1iXtWvTdCJMkmhie', 'public/uploads/users/img/19000272.jpg', NULL, '221B Baker Street, London', 0, NULL, NULL, NULL, '24.9003907', '67.0757004', NULL, NULL, '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-07 13:19:57', NULL, '2022-05-10 16:06:50'),
(74, NULL, 'alex', 'jamee@yopmail.com.com', '946565822', NULL, '$2y$10$AvwkYQaUD5PHy.ImlPTp6e8nsOUFnivEeHeYpBdXrW.fBO1Qq59eK', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 5838, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 02:38:03', NULL, '2022-04-14 02:38:03'),
(75, NULL, 'shoper', 'shoper@yopmail.com', '123456789', NULL, '$2y$10$HErf7Ao4Nk1WZr/fau0znOn2Uzp/yohzbDyk6EqTVh78c.7J117A6', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 9916, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 02:46:24', NULL, '2022-04-14 02:46:24'),
(76, NULL, 'shoper', 'shoper2@yopmail.com', '123456789', NULL, '$2y$10$Vc.qpvE2EArHCX9q1vT35.KhzvHV2/0esaG5GHbXCQ9vqq1HMnnHu', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 9562, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:01:32', NULL, '2022-04-14 03:01:32'),
(77, NULL, 'shoper', 'shoper233@yopmail.com', '123456789', NULL, '$2y$10$B/dQgEi5HGtwzMNnGKF3LuGpuHcGTmo2RrKnfZZCHt6xvQXLh4ivK', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 1640, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:01:49', NULL, '2022-04-14 03:01:49'),
(78, NULL, 'alex', 'jamee@yopmail.com.come', '946565822', NULL, '$2y$10$VpSQwQgPGD.mkVMOgbhRfuKEcoZpSvtBl8rkJ.nQ6jtW65OOnAzbi', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 4661, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:13:17', NULL, '2022-04-14 03:13:17'),
(79, NULL, 'shoper', 'abcd@yopmail.com', '123456789', NULL, '$2y$10$C/3TTOKLCE75LO32UAvafeKVwr4FXyuKJRjCmNImPyLTJpY7W9Hsy', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 4181, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:14:55', NULL, '2022-05-12 14:32:49'),
(80, NULL, 'abcd', 'abcdef@yopmail.com', '123456789', NULL, '$2y$10$mcPNMuU.Z6yisYi9lVRy8.D5MiQemlKGTW7Cwj5xtZl3AWjd1ppO.', 'public/uploads/users/img/user-avatar.png', NULL, 'abcdefg', 0, NULL, 5651, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:27:14', NULL, '2022-04-14 03:27:14'),
(81, NULL, 'alex', 'jameeee@yopmail.com.come', '946565822', NULL, '$2y$10$58wfxDNAsithwo3Z1koY5OYf9e8DFMTpTzoxa6SUHDxkL1hrOCdFW', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 7035, '', NULL, NULL, NULL, NULL, '+2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:32:16', NULL, '2022-04-14 03:32:16'),
(82, NULL, 'abcd', 'abcdedd@yopmail.com', '123456789', NULL, '$2y$10$9s95NPvYhDb4jfAjJJeFV.XSExgH6H0I.dH4Co06JLYxyLeETaWuK', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 6110, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:39:13', NULL, '2022-04-14 03:39:13'),
(83, NULL, 'abcd', 'newshoper@yopmail.com', '123456789', NULL, '$2y$10$K9fdX8.Io2RHA1Ux/eg6JeQ2kHljwe2CHSWzbWvKNSlthKowODJGu', 'public/uploads/users/img/user-avatar.png', NULL, 'abcdefg', 0, NULL, 6477, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:47:42', NULL, '2022-04-14 03:47:42'),
(84, NULL, 'abcd', 'NewShope@yopmail.com', '123456789', '2022-04-14 03:50:46', '$2y$10$c.KXfwK8Y.dvjZIXFB02b.d1Mt1SXxbrTpLCtdbASci0C.bNKO0Fa', 'public/uploads/users/img/user-avatar.png', NULL, 'abcdefg', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:48:24', NULL, '2022-04-14 03:50:46'),
(85, NULL, 'NewShoper', 'newShoper11@yopmail.com', '123456789', '2022-04-14 03:53:16', '$2y$10$znJTA7wAFf9kZUdpNHTIPeZpIMPF8AR8TQT0r1agwQ90RbDwYioYy', 'public/uploads/users/img/user-avatar.png', NULL, 'aaaaa', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:53:01', NULL, '2022-04-14 03:53:16'),
(86, NULL, 'shoper1', 'shoper1@yopmai.com', '123456789', '2022-04-14 07:17:16', '$2y$10$TepyfPq6ndu9TJLHpN5s5ucprKs1R4UtQVzT9cWMfYp12ETVu0iXC', 'public/uploads/users/img/user-avatar.png', NULL, 'ssss', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-14 03:56:58', NULL, '2022-04-15 01:15:33'),
(87, NULL, 'Shoper23', 'shoper23@yopmail.com', '123456789', NULL, '$2y$10$O3d00bgD1QWqAhAMWVcdMuwVokly/HikeGTT21TtEbWSRrV./q.ZG', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, 8224, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-15 01:17:56', NULL, '2022-04-15 01:19:11'),
(88, NULL, 'shoperabc', 'shoperabc@yopmail.com', '123456789', '2022-04-15 02:17:35', '$2y$10$XsDeuX3HXDgi8yNdSkdfqO13xsStk9ZtpK4KLWg/CEW6JWVxGpBh2', 'public/uploads/users/img/user-avatar.png', NULL, 'abcd', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-15 02:08:05', NULL, '2022-04-15 02:17:35'),
(89, NULL, 'alex', 'alexx@mail.com', '946565822', '2022-04-17 10:03:35', '$2y$10$1AhgUrlhB43.mcn5ZbNfHeFOqNHUJjxl0RVocc5NX4SDb1ju8bJqG', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, NULL, '', '24.9237366', '67.0858032', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-15 04:23:43', NULL, '2022-04-18 05:00:50'),
(90, NULL, 'Shoperabcd', 'Shoperabcd@yopmail.com', '123456789', '2022-04-20 06:36:47', '$2y$10$OBmg6A81BK0txpI4cDeZU.Y95PH57QqGIupc1wxWoWbTzjJ3jhxMW', 'public/uploads/users/img/user-avatar.png', NULL, 'Abcd', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dVzSpv4J1UMyts8NPM1Svu:APA91bFAucKsGtO1TQg4CLHoRjgIDteb4Wyehj5iIsdKdQc-MJgx3LWLzO9uANEgUByAgy0-XiMyzSXLV4qUabVeGH_Nd2Z1Pv54Ml7J5AqwEeTtwCgDzya8D-BkGwquTRvw7KMJnPKK', 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-20 06:35:50', NULL, '2022-04-22 02:20:11'),
(91, NULL, 'Simon John', 'rider@yopmail.com', '946565822', '2022-05-16 11:54:20', '$2y$10$3zlx4c4ba40J1MOEj.dRDuf5UNGBNxxEMy12H//iUgCAYchHFYJSi', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, NULL, '', '24.8646265', '67.0681942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fYjYCDTne0aojw9vX5IOpK:APA91bHybdRAGcBpmzQxKz_y8su_D0QZ1ONXEvjDTSs6vOijSDMhib3QX9OIYaoY4qIUENqdWr6-f8KLgcnxmxWK9YTEYwNLahaUZZogLGh_rOT6R2mAC0P8ObpmoSOjoUPXvssdEz6f', 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-16 11:53:58', NULL, '2022-05-25 05:15:29'),
(92, NULL, 'Fast Food', 'mahoudraogo@gmail.com', '002267058533', NULL, '$2y$10$VpQk9yaWqsp89vi/AjMHYunpc392E50HSEBoInAwZrSu3QSVmILYi', 'public/uploads/users/img/user-avatar.png', 1, 'Ouaga 200', 0, NULL, 2981, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-29 00:50:41', NULL, '2022-05-12 06:33:01'),
(93, NULL, 'Fast Food', 'Mahoudraogo93@gmail.com', '6463210293', NULL, '$2y$10$HiqMziEC8jnGVF90sDZce.OFOdG0z3nb.D2N/udbvcVo5p2/4VcJe', 'public/uploads/users/img/user-avatar.png', 1, 'Ouaga 2000', 0, NULL, 2053, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-29 00:53:00', NULL, '2022-04-29 00:53:00'),
(94, NULL, 'Kereem', 'Karimkindo52@gmail.com', '0142624765', NULL, '$2y$10$6UpXY2GK9bLyryJe.e9ZPeqQpt0eWg7dpVoVg.rOvmxPr/qJoVOaS', 'public/uploads/users/img/user-avatar.png', NULL, 'karimkindo52@gmail.com', 0, NULL, 3370, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-29 01:37:07', NULL, '2022-04-29 01:37:07'),
(95, NULL, 'Micheal', 'Micheal@yahoo.com', '1222233344', NULL, '$2y$10$LNOromojQ8rhilf0J15cFO1xO1xWY4tbp8YRLsh5LQEhKAuge54cm', 'public/uploads/users/img/user-avatar.png', NULL, 'Asdfggjj', 0, NULL, 4585, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-30 02:16:08', NULL, '2022-04-30 02:16:08'),
(96, NULL, 'Micheal', 'Micheal1@yahoo.com', '2817637089', NULL, '$2y$10$imwSb7Iqh0HAij1QmRUPNer1cb375rumktElluWz2hKSQ0/Mw8oXG', 'public/uploads/users/img/user-avatar.png', NULL, 'Asdfggjj', 0, NULL, 6565, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-04-30 02:17:14', NULL, '2022-04-30 02:17:14'),
(97, 'JyY1hlJF5yNI107p7gGnMLMhAV22', 'Shohab Ahmed Korejo', 'shohabahmedk@gmail.com', NULL, '2022-05-09 21:43:22', '$2y$10$tmjKjwvaNcWuB4bOGWgJlejvZ9QLCwkLIO28srnoJ6ap36il1Fpnu', 'public/uploads/users/img/user-avatar.png', NULL, NULL, 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'google', 'google', 'JyY1hlJF5yNI107p7gGnMLMhAV22', NULL, NULL, NULL, 0, NULL, '2022-05-09 21:43:22', NULL, '2022-05-09 21:43:22'),
(103, NULL, 'Waqas Khan', 'waqas@gmail.com', '123456789', NULL, '$2y$10$JY0glassLUnd3dtu24qHB.Ttr6uLMRDovLfWA7v8vwJVArWBtr3WO', 'public/uploads/users/img/user-avatar.png', NULL, 'Street #12, Plot #55, Abcd Town', 0, NULL, 1639, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-10 12:02:38', NULL, '2022-06-07 15:46:46'),
(104, NULL, 'Waqas Khan', 'waqas123@gmail.com', '123456789', '2022-05-10 12:05:43', '$2y$10$IIeVgZuj83EZ3VNUL5n1QeSyGKNjFgiOrs6JO4cf1oEcX3r9OIAaO', 'public/uploads/users/img/user-avatar.png', NULL, 'Street #12, Plot #55, Abcd Town', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-10 12:05:25', NULL, '2022-05-10 12:05:43'),
(105, NULL, 'Mohamed', 'Mohamed@porterdelivery.app', '6463210293', NULL, '$2y$10$i1dpVITJuyTQR/3UMYZ7cO/2qNt3Rzny9nAI/GN/8/lN6ZEyuIZcW', 'public/uploads/users/img/user-avatar.png', NULL, '943 east 179th street, Bronx New York, NY 10460 #8', 0, NULL, 8429, '', NULL, NULL, NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-12 06:25:11', NULL, '2022-05-12 06:25:11'),
(106, NULL, 'Test', 'test@gmail.com', '555334666', NULL, '$2y$10$97DuzQkbMtRvcmJAgaoqoeQ7lqUSPG9hXOWQMrVH3rmpJ1DZMlPZm', 'public/uploads/users/img/user-avatar.png', NULL, 'M2QM+8QW, Mangla Road, G-9 Markaz G 9 Markaz G-9, Islamabad, Islamabad Capital Territory, Pakistan', 0, NULL, 6223, '', '33.6883709', '73.0344406', NULL, NULL, '+92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-12 12:56:47', NULL, '2022-05-12 12:56:47'),
(107, NULL, 'alex', 'atif.ahmed@mail.com', '946565822', NULL, '$2y$10$FKcu3BT31O1Usbu/Svd3N.u3haSfRdQXaL801Dhq1xKx6AQZSosgW', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 5731, '', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-12 14:43:05', NULL, '2022-05-13 14:00:33'),
(108, NULL, 'alex', 'alex33@mail.com', '3212282733', NULL, '$2y$10$vI8wgLtzRuy20fQuZ6PvROb9WgAuVSXJLN5rPjGX8/LRelAZf7FjC', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, 7205, '', NULL, NULL, NULL, NULL, '+92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-13 18:13:16', NULL, '2022-05-13 18:13:16'),
(109, NULL, 'John Willie', 'john_shopper@gmail.com', '3129876543', '2022-05-13 19:58:02', '$2y$10$ikSy9bFAN0lJax/EFxG9ge7dTLP3SuNcgzwU4CSzlUEgEdK5g3VWS', 'public/uploads/users/img/user-avatar.png', NULL, 'Street # 112, New Town', 59, NULL, NULL, '', NULL, NULL, NULL, NULL, '+92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eEX3Rwz05kRCov9F3daL84:APA91bGKDilhtiHTZiIdEavWig7Vm_id0HB-MJfnE-n1UxfNCnuYcgjkF2NvDBEysuvUp2WdybJX4h1coMEDWKqhUFxa_yoaCYLePxnE0P0XMJ7UQVWdjneDF-rP8iViI3IuXzqZr2uH', 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-13 19:51:42', NULL, '2022-05-25 04:18:58'),
(110, NULL, 'alex', 'shopper@yopmail.com', '946565822', '2022-05-16 11:54:20', '$2y$10$3zlx4c4ba40J1MOEj.dRDuf5UNGBNxxEMy12H//iUgCAYchHFYJSi', 'public/uploads/users/img/user-avatar.png', NULL, 'london', 0, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-16 11:53:58', NULL, '2022-05-16 11:54:20'),
(112, NULL, 'John Rider', 'john_rider@gmail.com', '123456789', '2022-05-20 00:23:44', '$2y$10$Nm4gpqIUQctdM0QAmRvNi.Buhk7H9mjCVInJHJYVoKs6KWkORYG0S', 'public/uploads/users/img/user-avatar.png', NULL, 'Main University Rd, Block 13 A Gulshan-e-Iqbal, Karachi, Karachi City, Sindh, Pakistan', NULL, NULL, NULL, '', '37.4220005', '-122.0839996', NULL, NULL, '+1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eZIdUWPTQrmRazN8fm6f1E:APA91bFOsp2z6RzOZtT0kcp1uQYB0A07z86xDK0TXiEyc4kebCXjg8d12eeJr-R9MCTTS2X6Eb78wgdP-eZLqY28mpDZmnD49gAaW1qoxP_IzTS7qDhxgMNFJuHa0FAcjAo1eKVN_RLL', 'email', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-05-19 19:22:31', NULL, '2022-06-07 19:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `vehicle_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `rider_id`, `brand`, `model`, `year`, `vehicle_no`, `license`, `vehicle_image`, `created_at`, `updated_at`) VALUES
(1, 13, 'robert', '1456546456', 21, 'robert@gmail.com', '24', '', '2022-01-20 04:44:13', '2022-01-20 04:44:13'),
(2, 13, 'robert', '1456546456', 21, 'robert@gmail.com', '61e930b9f3f37.png', '61e930b9ed7df.png', '2022-01-20 04:51:54', '2022-01-20 04:51:54'),
(3, 13, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/61e930f3802db.png', 'public/uploads/vehicles/61e930f37a49d.png', '2022-01-20 04:52:51', '2022-01-20 04:52:51'),
(4, 13, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d397891a0c.png', 'public/uploads/vehicles/624d39787e269.png', '2022-04-06 01:55:52', '2022-04-06 01:55:52'),
(5, 48, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d3ccbe576f.png', 'public/uploads/vehicles/624d3ccbe1080.png', '2022-04-06 02:10:03', '2022-04-06 02:10:03'),
(6, 50, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d3d17f069e.png', 'public/uploads/vehicles/624d3d17ea943.png', '2022-04-06 02:11:20', '2022-04-06 02:11:20'),
(7, 52, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d3d76c343d.png', 'public/uploads/vehicles/624d3d76bfa18.png', '2022-04-06 02:12:54', '2022-04-06 02:12:54'),
(8, 54, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d3e022f2e1.png', 'public/uploads/vehicles/624d3e0229227.png', '2022-04-06 02:15:14', '2022-04-06 02:15:14'),
(9, 57, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/624d4708bda9d.png', 'public/uploads/vehicles/624d4708b761e.png', '2022-04-06 02:53:44', '2022-04-06 02:53:44'),
(10, 60, '1550', 'sswws', 0, 'ddd', 'public/uploads/vehicles/624e7f0f1504e.png', 'public/uploads/vehicles/624e7f0f07e33.png', '2022-04-07 01:05:03', '2022-04-07 01:05:03'),
(11, 61, 'fff', 'ffff', 0, 'fff', 'public/uploads/vehicles/624e80033c1d2.png', 'public/uploads/vehicles/624e800337961.png', '2022-04-07 01:09:07', '2022-04-07 01:09:07'),
(12, 62, 'ddfr', 'rrrr', 0, 'eeee', 'public/uploads/vehicles/624e81d3c3ba2.png', 'public/uploads/vehicles/624e81d3bf389.png', '2022-04-07 01:16:51', '2022-04-07 01:16:51'),
(13, 63, 'fff', 'ggg', 0, 'ggg', 'public/uploads/vehicles/624e8441155c1.png', 'public/uploads/vehicles/624e84410e6eb.png', '2022-04-07 01:27:13', '2022-04-07 01:27:13'),
(14, 91, 'robert', '1456546456', 21, 'robert@gmail.com', 'public/uploads/vehicles/6267cdeae39e3.png', 'public/uploads/vehicles/6267cdead9be7.png', '2022-04-26 05:48:10', '2022-04-26 05:48:10'),
(15, 106, 'Test', 'Test', 0, '77399', 'public/uploads/vehicles/627ccbcfcfa37.png', 'public/uploads/vehicles/627ccbcfcd102.png', '2022-05-12 12:56:47', '2022-05-12 12:56:47'),
(16, 112, 'Yamaha', '125', 2017, '1234', 'public/uploads/vehicles/628660b7e0500.png', 'public/uploads/vehicles/628660b7de1a4.png', '2022-05-19 19:22:31', '2022-05-19 19:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rider_id` int(11) NOT NULL,
  `balance` float NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `rider_id`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 91, 152.95, 0, '2022-05-13 12:49:48', '2022-06-01 17:03:20'),
(2, 112, 39.9, 0, '2022-05-19 19:43:00', '2022-06-07 16:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `withdraw_amount` float NOT NULL,
  `date` datetime NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_deliveryCost` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_history`
--

INSERT INTO `wallet_history` (`id`, `wallet_id`, `rider_id`, `withdraw_amount`, `date`, `payment_method`, `order_deliveryCost`, `status`, `created_at`, `updated_at`) VALUES
(1, 23, 29, 0.85, '2022-05-16 08:08:50', '', NULL, 0, '2022-05-16 03:08:50', '2022-05-16 03:08:50'),
(2, 23, 29, 0.85, '2022-05-16 08:09:54', '', NULL, 0, '2022-05-16 03:09:54', '2022-05-16 03:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_items`
--

CREATE TABLE `wallet_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `commission` float NOT NULL,
  `order_amount` int(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_items`
--

INSERT INTO `wallet_items` (`id`, `wallet_id`, `order_id`, `commission`, `order_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 31, 0.95, 852, '2022-05-13 12:49:48', '2022-05-13 12:49:48'),
(2, 1, 33, 0.95, 1602, '2022-05-13 13:49:34', '2022-05-13 13:49:34'),
(3, 1, 37, 2.85, 104, '2022-05-13 14:12:18', '2022-05-13 14:12:18'),
(4, 1, 37, 3.8, 104, '2022-05-13 14:16:58', '2022-05-13 14:16:58'),
(5, 1, 42, 5.7, 806, '2022-05-13 17:07:35', '2022-05-13 17:07:35'),
(6, 1, 44, 1.9, 102, '2022-05-13 20:15:20', '2022-05-13 20:15:20'),
(7, 1, 45, 0, 200, '2022-05-13 20:24:27', '2022-05-13 20:24:27'),
(8, 1, 62, 17.1, 68, '2022-05-14 05:06:33', '2022-05-14 05:06:33'),
(9, 1, 64, 17.1, 2768, '2022-05-14 05:19:31', '2022-05-14 05:19:31'),
(10, 1, 65, 17.1, 868, '2022-05-14 10:10:22', '2022-05-14 10:10:22'),
(11, 1, 68, 17.1, 718, '2022-05-14 18:56:37', '2022-05-14 18:56:37'),
(12, 1, 69, 17.1, 1618, '2022-05-14 23:56:45', '2022-05-14 23:56:45'),
(13, 1, 74, 17.1, 1618, '2022-05-16 11:34:40', '2022-05-16 11:34:40'),
(14, 2, 82, 5.7, 606, '2022-05-19 19:43:00', '2022-05-19 19:43:00'),
(15, 2, 83, 9.5, 810, '2022-05-19 21:01:28', '2022-05-19 21:01:28'),
(16, 1, 72, 17.1, 68, '2022-05-20 21:13:04', '2022-05-20 21:13:04'),
(17, 1, 73, 17.1, 1218, '2022-06-01 17:03:20', '2022-06-01 17:03:20'),
(18, 2, 87, 20.9, 1122, '2022-06-07 13:40:09', '2022-06-07 13:40:09'),
(19, 2, 95, 3.8, 104, '2022-06-07 16:08:29', '2022-06-07 16:08:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel_orders`
--
ALTER TABLE `cancel_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisine_types`
--
ALTER TABLE `cuisine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurent` (`restaurant_id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_expertise`
--
ALTER TABLE `item_expertise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants` (`restaurant_id`),
  ADD KEY `customers` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pet_id` (`item_id`),
  ADD KEY `user_id` (`customer_id`);

--
-- Indexes for table `rider_detail`
--
ALTER TABLE `rider_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_sessions`
--
ALTER TABLE `rider_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_items`
--
ALTER TABLE `wallet_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1211;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cancel_orders`
--
ALTER TABLE `cancel_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cuisine_types`
--
ALTER TABLE `cuisine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `item_expertise`
--
ALTER TABLE `item_expertise`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rider_detail`
--
ALTER TABLE `rider_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rider_sessions`
--
ALTER TABLE `rider_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_items`
--
ALTER TABLE `wallet_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customers` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `restaurants` FOREIGN KEY (`restaurant_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `items` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
