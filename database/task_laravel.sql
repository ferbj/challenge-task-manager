-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-06-2023 a las 03:48:46
-- Versión del servidor: 10.6.3-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `task_laravel`
--
CREATE DATABASE IF NOT EXISTS `task_laravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `task_laravel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(34, '2014_10_12_000000_create_users_table', 1),
(35, '2014_10_12_100000_create_password_resets_table', 1),
(36, '2019_08_19_000000_create_failed_jobs_table', 1),
(37, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(38, '2023_06_19_210357_create_tasks_table', 1),
(39, '2023_06_20_190815_create_notifications_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01479d04-57a3-42b1-b09b-e249a7fef288', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:33:36', '2023-06-21 05:08:56'),
('035ef45c-f152-472e-8b2b-6c7fc235b530', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"completed\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : completed\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:42:55', '2023-06-21 05:42:04', '2023-06-21 05:42:55'),
('037f830e-dc35-4314-8b8f-3e66b23d237a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"status\":\"in progress\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta The status has been updated to :in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:52:44', '2023-06-21 04:52:43', '2023-06-21 04:52:44'),
('04e7954f-8537-429f-98f2-0cfdd969443a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"id\":5,\"task\":\"Task 5\",\"status\":\"not started\",\"message\":\"Fernando Balta The status has been updated to :not started\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:46:33', '2023-06-21 04:46:33', '2023-06-21 04:46:33'),
('0829b56c-6650-49e3-bcc2-c818fa48779b', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:25:08', '2023-06-21 05:08:56'),
('096e7100-ae33-49dc-a6f8-e1c73b217f2a', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":3,\"task_title\":\"Task 3\",\"task_description\":\"this is description of task n \\u00b0 3\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\"}', '2023-06-21 05:05:02', '2023-06-21 05:05:02', '2023-06-21 05:05:02'),
('0c094cb6-8b43-44de-b865-2db24414c200', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:33:30', '2023-06-21 05:08:56'),
('103cbeaa-110b-4f8a-9590-a04ce6743f47', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:41:39', '2023-06-21 04:41:38', '2023-06-21 04:41:39'),
('19b16b15-5817-4fe6-a4e8-cd15755b4fb8', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:14:49', '2023-06-21 03:59:04', '2023-06-21 04:14:49'),
('1de20750-6ada-4a47-a147-15a9f65f9d7b', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:20:01', '2023-06-21 04:20:01', '2023-06-21 04:20:01'),
('20513db7-3a5d-4c3e-ad66-4abf964b0d70', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 06:02:55', '2023-06-21 06:02:39', '2023-06-21 06:02:55'),
('23e8ffc5-d936-48a0-9860-cb287d776fad', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"JuanA task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:19:41', '2023-06-21 04:19:40', '2023-06-21 04:19:41'),
('2531e4e7-50ca-49f2-9349-7145ae6e623e', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:57:44', '2023-06-21 04:57:44', '2023-06-21 04:57:44'),
('2fb7d23a-579c-4de3-8f54-439e64d0d4b4', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":2,\"task_title\":\"task n\\u00b0 2\",\"task_description\":\"This is the task work for present this wednesday.\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\"}', '2023-06-21 05:06:02', '2023-06-21 05:06:01', '2023-06-21 05:06:02'),
('32ec5f34-886b-4907-8de9-a132b6f48932', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:09:09', '2023-06-21 05:09:08', '2023-06-21 05:09:09'),
('3859cf76-3cc6-465f-b81f-52c54b4a5451', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:06:46', '2023-06-21 04:36:34', '2023-06-21 05:06:46'),
('3b45a617-2d13-4e1a-80ed-65000ccbcb5e', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:25:16', '2023-06-21 05:08:56'),
('3e335cda-c79d-4aed-a3d9-e3f1c46d5db8', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":6,\"task_title\":\"Task n\\u00b0 6\",\"task_description\":\"this is the task n\\u00b0 6\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/6\"}', '2023-06-21 05:10:08', '2023-06-21 05:10:08', '2023-06-21 05:10:08'),
('404dbb5c-79d6-4079-aeb3-00b6b32e9b21', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"id\":4,\"task\":\"Task 4\",\"status\":\"in progress\",\"message\":\"Fernando Balta The status has been updated to :in progress\"}', '2023-06-21 05:08:56', '2023-06-21 04:33:30', '2023-06-21 05:08:56'),
('433536ea-c95d-4442-bfde-7d035ab8a3b6', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:20:57', '2023-06-21 05:20:57', '2023-06-21 05:20:57'),
('4367fbeb-c7ff-4eed-befb-03f4517af149', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"id\":4,\"task\":\"Task 4\",\"status\":\"not started\",\"message\":\"Fernando Balta The status has been updated to :not started\"}', '2023-06-21 05:08:56', '2023-06-21 04:33:36', '2023-06-21 05:08:56'),
('445ed293-60d3-42a2-a115-283ccdf8e525', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:22:59', '2023-06-21 05:22:22', '2023-06-21 05:22:59'),
('46583c79-288a-4126-9a1c-e972c278c9c5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":3,\"task_title\":\"Task 3\",\"status\":\"in progress\",\"task_description\":\"this is description of task n \\u00b0 3\",\"message\":\"Fernando Balta The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\"}', '2023-06-21 05:06:12', '2023-06-21 05:06:12', '2023-06-21 05:06:12'),
('4716f577-8602-4515-920e-b41ea00b6c2d', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:04:45', '2023-06-21 05:04:44', '2023-06-21 05:04:45'),
('4a6fa3a0-893f-4be8-b9fc-4790944df90f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"id\":4,\"task\":\"Task 4\",\"status\":\"in progress\",\"message\":\"Fernando Balta The status has been updated to :in progress\"}', '2023-06-21 05:08:56', '2023-06-21 04:34:47', '2023-06-21 05:08:56'),
('4bfd4621-9fad-4b9b-b8ad-9a6c92311701', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:46:33', '2023-06-21 04:46:33', '2023-06-21 04:46:33'),
('5cc57272-1be6-4625-b6eb-fb071754394a', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:36:18', '2023-06-21 05:08:56'),
('6523b3ae-66fe-4943-a7fb-a253bff96608', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:15:11', '2023-06-21 05:15:11', '2023-06-21 05:15:11'),
('6879c380-53e2-40cb-a1f6-871c12f5e95c', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":2,\"task_title\":\"Task n\\u00b0 2\",\"status\":\"completed\",\"task_description\":\"This is the task work for present this wednesday.\",\"message\":\"Fernando Balta The status has been updated to : completed\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\"}', '2023-06-21 08:40:56', '2023-06-21 08:40:53', '2023-06-21 08:40:56'),
('6dc31600-1d04-4c38-9e23-c77387c9c799', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:24:14', '2023-06-21 04:19:55', '2023-06-21 04:24:14'),
('70d15fbc-a315-4fa0-8056-6e3c0aa37e4b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"status\":\"in progress\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta The status has been updated to :in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:53:21', '2023-06-21 04:53:21', '2023-06-21 04:53:21'),
('71c80e71-2111-454a-9f47-4e7161c6c47d', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:33:00', '2023-06-21 05:08:56'),
('73272956-4aef-4222-b260-ee9547cb35b7', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:45:37', '2023-06-21 04:45:37', '2023-06-21 04:45:37'),
('741939fe-0304-42bb-b3da-80008f34b44d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":3,\"task_title\":\"Task 3\",\"status\":\"not started\",\"task_description\":\"this is description of task n \\u00b0 3\",\"message\":\"Fernando Balta The status has been updated to : not started\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\"}', '2023-06-21 05:06:20', '2023-06-21 05:06:20', '2023-06-21 05:06:20'),
('74c13281-fc1d-4794-95a7-f528116e1813', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:09:48', '2023-06-21 05:09:29', '2023-06-21 05:09:48'),
('74cee3b9-94c8-4105-acea-1841e9298c2d', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:06:46', '2023-06-21 05:06:26', '2023-06-21 05:06:46'),
('771278ad-ec5d-43da-aee9-05b195dba10b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"status\":\"not started\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta The status has been updated to :not started\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:57:44', '2023-06-21 04:57:44', '2023-06-21 04:57:44'),
('7804e38f-4d43-4312-aff5-5eaf29bb6f2d', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 6, '{\"task_id\":6,\"task title\":\"Task n\\u00b0 5\",\"task description\":\"this is the task n\\u00b0 5\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/6\"}', NULL, '2023-06-21 02:58:42', '2023-06-21 02:58:42'),
('7edd3e26-4440-49b8-bec3-c637a788e43b', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:22:29', '2023-06-21 05:22:29', '2023-06-21 05:22:29'),
('84f02c14-18cc-487a-ac5b-8132e1a47439', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:42:00', '2023-06-21 04:42:00', '2023-06-21 04:42:00'),
('8528b568-3ade-45e2-a73b-cdb0409e19c6', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:42:12', '2023-06-21 04:42:12', '2023-06-21 04:42:12'),
('85767b02-914d-4e08-86ad-413e67015494', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:52:22', '2023-06-21 04:52:22', '2023-06-21 04:52:22'),
('8659b3ff-bfb9-40c9-80a9-a37a53c1ffc5', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:05:29', '2023-06-21 05:05:29', '2023-06-21 05:05:29'),
('86e09120-c800-4f87-8286-2de47eb3f6d9', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:12:19', '2023-06-21 05:11:53', '2023-06-21 05:12:19'),
('88c18be9-5a66-48ac-8500-c497eedf0c3a', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:05:43', '2023-06-21 05:05:43', '2023-06-21 05:05:43'),
('9055bef6-79b8-41fd-9388-d00c9fb03d07', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 05:21:47', '2023-06-21 05:21:47', '2023-06-21 05:21:47'),
('90776c83-8245-4d9e-833d-2a43fd748642', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":9,\"task_title\":\"Task N\\u00b0 8\",\"task_description\":\"this is the description of task N\\u00b0 8\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/9\"}', '2023-06-21 07:43:44', '2023-06-21 05:51:11', '2023-06-21 07:43:44'),
('9693deeb-5578-4893-b66d-dbc6a1e26f13', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:03:15', '2023-06-21 05:03:15', '2023-06-21 05:03:15'),
('a3a7a74a-5c58-450f-a6fd-eea3a3adec20', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:08:56', '2023-06-21 04:34:47', '2023-06-21 05:08:56'),
('a6365732-58cc-4b1a-9fa0-b1fa69684361', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 5, '{\"task_id\":5,\"task title\":\"Task 5\",\"task description\":\"this is the task n\\u00b0 5\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', NULL, '2023-06-21 03:27:05', '2023-06-21 03:27:05'),
('a69a6307-860d-43ba-ae8f-2b661e94e381', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":7,\"task_title\":\"Task 7\",\"status\":\"in progress\",\"task_description\":\"This is my task priority 3\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/7\"}', '2023-06-21 05:12:38', '2023-06-21 05:12:37', '2023-06-21 05:12:38'),
('a9393c8a-d3b2-4365-8559-2f124ba2173c', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 5, '{\"task_id\":5,\"task title\":\"Task 5\",\"task description\":\"this is the task n\\u00b0 5\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', NULL, '2023-06-21 03:27:29', '2023-06-21 03:27:29'),
('aa78498c-b7ad-4c8d-8364-9ff6387d90b2', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":7,\"task_title\":\"Task 7\",\"status\":\"completed\",\"task_description\":\"This is my task priority 3\",\"message\":\"Juan The status has been updated to : completed\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/7\"}', '2023-06-21 05:25:12', '2023-06-21 05:25:12', '2023-06-21 05:25:12'),
('b1690e58-75a2-4b68-9a0c-4ea3b91e4835', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:59:15', '2023-06-21 05:59:05', '2023-06-21 05:59:15'),
('b339a802-de60-46a5-9b24-4003ffeb7829', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:24:21', '2023-06-21 04:24:21', '2023-06-21 04:24:21'),
('b6f98a36-d9bc-40eb-91ea-772f6cb9cc36', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:43:53', '2023-06-21 04:43:52', '2023-06-21 04:43:53'),
('bc81a7fb-607d-447d-82d6-a40ae10f4dfe', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:03:15', '2023-06-21 05:03:15', '2023-06-21 05:03:15'),
('bd8d0a58-fea3-4291-8b58-7af4b36f2099', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:21:26', '2023-06-21 05:21:06', '2023-06-21 05:21:26'),
('c1eb7c42-3db2-424e-a9c9-dfa8e79ae9e9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"id\":4,\"task\":\"Task 4\",\"status\":\"in progress\",\"message\":\"Fernando Balta The status has been updated to :in progress\"}', '2023-06-21 05:08:56', '2023-06-21 04:36:34', '2023-06-21 05:08:56'),
('cab2f9d4-08a0-46ca-a36e-d31c5dd1e415', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:53:00', '2023-06-21 04:53:00', '2023-06-21 04:53:00'),
('caead1d5-cf8f-4c0f-bcf5-4f87992d3a56', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"completed\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : completed\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:54:34', '2023-06-21 05:54:18', '2023-06-21 05:54:34'),
('cb6fe5b8-e02b-4bdf-8c33-c10da3e0a08c', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"status\":\"not started\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta The status has been updated to :not started\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:53:00', '2023-06-21 04:53:00', '2023-06-21 04:53:00'),
('cef5a320-fbd4-40ae-9995-f6348a48ebaf', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:24:14', '2023-06-21 04:23:58', '2023-06-21 04:24:14'),
('cf8e4dfa-aab3-42a1-8fd9-53eda3cfdbd2', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:52:44', '2023-06-21 04:52:43', '2023-06-21 04:52:44'),
('d2cf8c78-dbc1-4c26-9e9a-b7e7b5969ffb', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:21:26', '2023-06-21 05:15:04', '2023-06-21 05:21:26'),
('d6b325f6-9d33-4813-a60d-b4b148cad11c', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 04:15:25', '2023-06-21 04:15:25', '2023-06-21 04:15:25'),
('d6ff107d-982a-4d45-9d92-ddbc9db936fc', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"id\":5,\"task\":\"Task 5\",\"status\":\"in progress\",\"message\":\"Fernando Balta The status has been updated to :in progress\"}', '2023-06-21 04:52:36', '2023-06-21 04:45:37', '2023-06-21 04:52:36'),
('da795177-d86b-4516-bd54-9561e4f1e662', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 5, '{\"task_id\":5,\"task title\":\"Task 5\",\"task description\":\"this is the task n\\u00b0 5\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', NULL, '2023-06-21 03:27:15', '2023-06-21 03:27:15'),
('dafbfbd7-1547-400c-9969-931c4b566307', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 7, '{\"task_id\":7,\"task title\":\"Task 7\",\"task description\":\"This is my task priority 3\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/7\"}', NULL, '2023-06-21 03:10:47', '2023-06-21 03:10:47'),
('dcdf6f0d-52ea-43fd-bcf0-2038f5433d71', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:22:59', '2023-06-21 05:22:35', '2023-06-21 05:22:59'),
('de3da514-614d-4a40-a6c9-bc54a9d338ea', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"status\":\"in progress\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 05:11:39', '2023-06-21 05:11:39', '2023-06-21 05:11:39'),
('e0e732c5-ec2a-4ac3-8180-90070303dfb7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"task_id\":3,\"task_title\":\"Task 3\",\"status\":\"in progress\",\"task_description\":\"this is description of task n \\u00b0 3\",\"message\":\"Fernando Balta The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\"}', '2023-06-21 08:42:54', '2023-06-21 08:42:50', '2023-06-21 08:42:54'),
('e515f364-692d-4306-9b94-366917ac54e3', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 4, '{\"task_id\":4,\"task_title\":\"Task 4\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', NULL, '2023-06-21 03:58:05', '2023-06-21 03:58:05'),
('e56e137a-1ebd-41f8-b4e8-b5baa4a756c7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"in progress\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : in progress\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:49:27', '2023-06-21 05:49:09', '2023-06-21 05:49:27'),
('ec3617cc-2355-4ca9-a797-1916560544d6', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 1, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 04:53:21', '2023-06-21 04:53:21', '2023-06-21 04:53:21'),
('ef45f194-7eef-40c2-806c-1ab204160565', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"not started\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : not started\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 05:57:49', '2023-06-21 05:57:41', '2023-06-21 05:57:49'),
('ef61de69-c8e5-4304-ada7-7592a5662e53', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\User', 2, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"Fernando Balta A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', '2023-06-21 05:22:59', '2023-06-21 05:21:43', '2023-06-21 05:22:59'),
('f56d00f7-54ff-40b1-a056-a9baed5f5657', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 2, '{\"task_id\":4,\"task_title\":\"Task 4\",\"status\":\"completed\",\"task_description\":\"This is the task n\\u00b0 4\",\"message\":\"Juan The status has been updated to : completed\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\"}', '2023-06-21 06:00:12', '2023-06-21 05:59:59', '2023-06-21 06:00:12'),
('fbe8de41-00ae-4157-bd62-74898dcf68f1', 'App\\Notifications\\TaskAssignedNotification', 'App\\Models\\Task', 5, '{\"task_id\":5,\"task_title\":\"Task 5\",\"task_description\":\"this is the task n\\u00b0 5\",\"message\":\"A task has been assigned to you.\",\"task_link\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\"}', NULL, '2023-06-21 03:57:54', '2023-06-21 03:57:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('not started','in progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Task n° 1', 'This task is the number 1, should present before wednesday.', 'not started', 1, '2023-06-20 23:01:13', '2023-06-20 23:54:42'),
(2, 'Task n° 2', 'This is the task work for present this wednesday.', 'completed', 1, '2023-06-20 23:55:17', '2023-06-21 08:40:53'),
(3, 'Task 3', 'this is description of task n ° 3', 'in progress', 1, '2023-06-21 00:20:04', '2023-06-21 08:42:50'),
(4, 'Task 4', 'This is the task n° 4', 'in progress', 2, '2023-06-21 02:55:15', '2023-06-21 06:02:39'),
(5, 'Task 5', 'this is the task n° 5', 'in progress', 1, '2023-06-21 02:57:47', '2023-06-21 05:21:47'),
(6, 'Task n° 6', 'this is the task n° 6', 'in progress', 1, '2023-06-21 02:58:42', '2023-06-21 05:10:08'),
(7, 'Task 7', 'This is my task priority 3', 'completed', 2, '2023-06-21 03:10:47', '2023-06-21 05:25:12'),
(8, 'Task N° 8', 'this is the description of task N° 8', 'not started', 1, '2023-06-21 05:50:27', '2023-06-21 05:50:27'),
(9, 'Task N° 8', 'this is the description of task N° 8', 'not started', 1, '2023-06-21 05:51:11', '2023-06-21 05:51:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Fernando Balta', 'ferbj200@gmail.com', NULL, '$2y$10$kWFQ8Lbc9HYPn0NvKS.jWe2tUGV8Apb.SdjFPLXUF0NOtQmMFOe9y', NULL, '2023-06-20 23:00:38', '2023-06-20 23:00:38'),
(2, 'Juan', 'juan@gmail.com', NULL, '$2y$10$lx7QAMcTp/hYN5KJl8eujOn.81FAgqmt29Maslor9BRcm1UqaEU8.', NULL, '2023-06-20 23:46:32', '2023-06-20 23:46:32');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
