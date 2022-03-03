-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2021 at 02:15 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masterdb`
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
(1, 'User', 'created', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"PetPal\",\"email\":\"petpal@reignsol.net\",\"phone\":\"03043167149\",\"password\":\"$2y$10$YcFmKf0q6t9x8PXcu\\/U68.TwtH4lBjVUOiCePwekYTjfj\\/heuOS0.\",\"otp\":3990,\"device_type\":null,\"device_token\":null,\"verified_by\":\"email\",\"social_provider\":null,\"social_token\":null,\"social_id\":null}}', '2021-04-30 05:35:05', '2021-04-30 05:35:05'),
(2, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"otp\":7799},\"old\":{\"otp\":3990}}', '2021-04-30 05:36:09', '2021-04-30 05:36:09'),
(3, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"otp\":5085},\"old\":{\"otp\":7799}}', '2021-04-30 05:36:11', '2021-04-30 05:36:11'),
(4, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"otp\":null},\"old\":{\"otp\":5085}}', '2021-04-30 05:36:41', '2021-04-30 05:36:41'),
(5, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"otp\":3757},\"old\":{\"otp\":null}}', '2021-04-30 05:37:02', '2021-04-30 05:37:02'),
(6, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"otp\":null},\"old\":{\"otp\":3757}}', '2021-04-30 05:37:27', '2021-04-30 05:37:27'),
(7, 'User', 'updated', 'App\\User', 5, NULL, NULL, '{\"attributes\":{\"password\":\"$2y$10$F1i43lAYl.9EuurZmjfU1.t2b4TUyhKnXC6sOW1z3e2GO99vp0sOW\"},\"old\":{\"password\":\"$2y$10$YcFmKf0q6t9x8PXcu\\/U68.TwtH4lBjVUOiCePwekYTjfj\\/heuOS0.\"}}', '2021-04-30 05:37:38', '2021-04-30 05:37:38'),
(8, 'User', 'created', 'App\\User', 6, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"Muhammad Yasir\",\"email\":\"yasir.bookitnow@gmail.com\",\"phone\":null,\"password\":\"$2y$10$5zUl26NO\\/Z6g3LL7GVXppu7dq7HXnEd30lPcw\\/\\/GmaIyaxQ0TAEu2\",\"otp\":null,\"device_type\":null,\"device_token\":null,\"verified_by\":\"facebook\",\"social_provider\":\"facebook\",\"social_token\":\"147258369\",\"social_id\":\"147258369\"}}', '2021-04-30 05:37:48', '2021-04-30 05:37:48'),
(9, 'User', 'updated', 'App\\User', 6, 'App\\User', 6, '{\"attributes\":{\"name\":\"Yasir Bookitnow\"},\"old\":{\"name\":\"Muhammad Yasir\"}}', '2021-04-30 05:38:47', '2021-04-30 05:38:47'),
(10, 'User', 'updated', 'App\\User', 5, 'App\\User', 5, '{\"attributes\":{\"name\":\"Yasir Bookitnow\"},\"old\":{\"name\":\"PetPal\"}}', '2021-04-30 05:39:34', '2021-04-30 05:39:34'),
(11, 'User', 'updated', 'App\\User', 5, 'App\\User', 5, '{\"attributes\":{\"name\":\"PetPal\"},\"old\":{\"name\":\"Yasir Bookitnow\"}}', '2021-04-30 05:39:46', '2021-04-30 05:39:46'),
(12, 'User', 'deleted', 'App\\User', 4, 'App\\User', 1, '{\"attributes\":{\"added_by\":1,\"updated_by\":1,\"name\":\"Manager\",\"email\":\"manager@master.com\",\"phone\":null,\"password\":\"$2y$10$G4VvdmeO8bgetdVYdlHjauaWfTKFcpipeaBSTuNPgJVmE3Nu8R7ES\",\"otp\":null,\"device_type\":null,\"device_token\":null,\"verified_by\":null,\"social_provider\":null,\"social_token\":null,\"social_id\":null}}', '2021-12-29 07:46:07', '2021-12-29 07:46:07'),
(13, 'User', 'created', 'App\\User', 7, NULL, NULL, '{\"attributes\":{\"added_by\":null,\"updated_by\":null,\"name\":\"User\",\"email\":\"user@yopmail.com\",\"phone\":null,\"password\":\"$2y$10$pACh0s9.ka5lRLdt5PZq7.ODQNWIneqcfWkrjpA1R\\/2KM3i5otpeS\",\"otp\":2187,\"device_type\":null,\"device_token\":null,\"verified_by\":\"email\",\"social_provider\":null,\"social_token\":null,\"social_id\":null}}', '2021-12-29 07:59:33', '2021-12-29 07:59:33'),
(14, 'User', 'updated', 'App\\User', 7, NULL, NULL, '{\"attributes\":{\"otp\":null},\"old\":{\"otp\":2187}}', '2021-12-29 08:01:13', '2021-12-29 08:01:13'),
(15, 'User', 'updated', 'App\\User', 7, 'App\\User', 7, '{\"attributes\":{\"name\":\"User Update\",\"phone\":\"03043167149\"},\"old\":{\"name\":\"User\",\"phone\":null}}', '2021-12-29 08:01:35', '2021-12-29 08:01:35');

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
(14, '2021_04_30_100430_create_activity_log_table', 6);

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
(2, 'App\\User', 2),
(2, 'App\\User', 7),
(4, 'App\\User', 3);

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
('3e048c528ac66822b2244019ffb0dbbc399fe973257b8dfb1b45efda00e340999e7a93152e37f868', 7, 1, 'Personal Access Token', '[]', 1, '2021-12-29 08:01:13', '2021-12-29 08:01:13', '2022-12-29 13:01:13'),
('85d81a445d6ac165f46239ee494165e6b8d31e79c973e5c689e22e36614f4a5aa2e654123947fe67', 6, 1, 'Personal Access Token', '[]', 1, '2021-04-30 05:37:49', '2021-04-30 05:37:49', '2022-04-30 10:37:49'),
('b8ea2e4bb2ddc4f9164095c00988d960c6054591ffea29aae3edfc8b3718ab314d6c905b9e59295b', 5, 1, 'Personal Access Token', '[]', 0, '2021-04-30 05:40:03', '2021-04-30 05:40:03', '2022-04-30 10:40:03'),
('d24460a3abeeb26fb586270622212cfa84293ab2ead1d1ceed4626ea142354473446c32056637e6b', 5, 1, 'Personal Access Token', '[]', 1, '2021-04-30 05:39:09', '2021-04-30 05:39:09', '2022-04-30 10:39:09');

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
(16, NULL, NULL, 'permission-delete', 'web', '2021-01-09 05:55:15', '2021-01-09 07:57:50');

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
(2, NULL, NULL, 'User', 'web', '2021-01-08 09:29:42', '2021-01-08 09:29:42'),
(4, NULL, 1, 'Vendor', 'web', '2021-01-09 05:03:16', '2021-04-01 07:04:52');

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
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_by` enum('email','facebook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_provider` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `added_by`, `updated_by`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `otp`, `device_type`, `device_token`, `verified_by`, `social_provider`, `social_token`, `social_id`) VALUES
(1, NULL, 1, 'Admin', 'admin@master.com', NULL, NULL, '$2y$10$3TWU8LoWfDo9RuTnyC.mqecOXH.tec3.2XuNWQuBm1v3kA9RJKiOu', NULL, '2021-01-08 09:15:51', '2021-04-01 07:05:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 1, 'User', 'user@master.com', NULL, NULL, '$2y$10$y7IpMVBSluFe3Te.RKfDdO6hiao1Zu5FXdYfbvrAcJ6RHoTKcvw1q', NULL, '2021-01-08 09:30:13', '2021-04-01 07:05:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 1, 'Vendor', 'vendor@master.com', NULL, NULL, '$2y$10$gQCo7oTKD.MZ41bCn4zY0u5X6o3iXep3Waand5LMibFMHxpTZ/C0q', NULL, '2021-01-09 05:07:09', '2021-04-01 07:04:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'User Update', 'user@yopmail.com', '03043167149', '2021-12-29 08:01:13', '$2y$10$pACh0s9.ka5lRLdt5PZq7.ODQNWIneqcfWkrjpA1R/2KM3i5otpeS', NULL, '2021-12-29 07:59:33', '2021-12-29 08:01:35', NULL, NULL, NULL, 'email', NULL, NULL, NULL);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
