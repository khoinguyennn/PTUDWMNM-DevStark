-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Dec 21, 2025 at 05:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coursemanagment`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL,
  `instructor_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `learning_outcomes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`learning_outcomes`)),
  `price` decimal(10,2) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `instructor_id`, `title`, `description`, `learning_outcomes`, `price`, `thumbnail`, `created_at`) VALUES
(1, 2, 'Javascript Pro', 'Khóa học JavaScript Pro được thiết kế để đưa người học từ việc hiểu biết cơ bản về JavaScript lên một tầm cao mới, tập trung vào việc áp dụng JavaScript một cách chuyên nghiệp và thực chiến.\r\nMục tiêu chính là giúp học viên hiểu sâu sắc cách thức hoạt động của JavaScript, làm chủ DOM, xử lý các tác vụ bất đồng bộ và xây dựng các ứng dụng web phức tạp, có tính tương tác cao. Khóa học này là nền tảng cực kỳ quan trọng trước khi chuyển sang học các thư viện/framework như ReactJS.', '[\"Bi\\u1ebfn (var, let, const)\",\"H\\u00e0m v\\u00e0 c\\u00e1c lo\\u1ea1i h\\u00e0m\",\"Kh\\u00e1i ni\\u1ec7m Hoisting\",\"N\\u1ed1i chu\\u1ed7i v\\u00e0 n\\u1ed9i suy\",\"C\\u00e2u l\\u1ec7nh \\u0111i\\u1ec1u ki\\u1ec7n\",\"K\\u1ef9 thu\\u1eadt Fallthrough\",\"T\\u00ecm hi\\u1ec3u to\\u00e1n t\\u1eed Logical\",\"To\\u00e1n t\\u1eed Nullish Coalescing\",\"\\u0110\\u1ed9 \\u01b0u ti\\u00ean c\\u1ee7a to\\u00e1n t\\u1eed\",\"T\\u01b0 duy \\u1ee9ng d\\u1ee5ng v\\u00f2ng l\\u1eb7p\",\"Hi\\u1ec3u r\\u00f5 v\\u1ec1 to\\u00e1n t\\u1eed ++, --\",\"Kh\\u00e1i ni\\u1ec7m c\\u01a1 b\\u1ea3n v\\u1ec1 Object\",\"Thu\\u1ed9c t\\u00ednh v\\u00e0 ph\\u01b0\\u01a1ng th\\u1ee9c\",\"Hi\\u1ec3u r\\u00f5 v\\u1ec1 t\\u1eeb kh\\u00f3a this\"]', 1399000.00, 'thumbnails/smIdMMcDJZHbPBdnuJA6CbceEvy4cNBNNtSVbqHp.png', '2025-10-03 00:18:13'),
(2, 2, 'Test 2', 'Đây là test asd asoidj asoidj oiasjdoijasod asdiojasdjaso asdjaosijd aasdijasd oijas áoidjaosijdas sdj sdifj sdfijsdoif sdfioj sdfoipjsd sodifj sdfoij sdfiojsdoifjsd dsfiojsdoifj soidfis odjfsdjfsd fsiudhfiusdh fusdh fushd fushdfiu', '[\"test 1\",\"test 2\",\"test 3\"]', 5000.00, 'thumbnails/3sbYJeZJI2waLsWLB0wgHTb4JHS9n6Guig2RfHVQ.png', '2025-10-03 01:01:10'),
(3, 2, 'HTML CSS từ Zero đến Hero', 'Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band & Shopee..', '[\"Bi\\u1ebft c\\u00e1ch x\\u00e2y d\\u1ef1ng giao di\\u1ec7n web v\\u1edbi HTML, CSS\",\"Bi\\u1ebft c\\u00e1ch \\u0111\\u1eb7t t\\u00ean class CSS theo chu\\u1ea9n BEM\",\"L\\u00e0m ch\\u1ee7 Flexbox khi d\\u1ef1ng b\\u1ed1 c\\u1ee5c website\",\"Bi\\u1ebft c\\u00e1ch t\\u1ef1 t\\u1ea1o \\u0111\\u1ed9ng l\\u1ef1c cho b\\u1ea3n th\\u00e2n\"]', 0.00, 'thumbnails/65CvOEt6mh2rWhBKR9xWsPyY4kuFinkuS6kIzr8q.png', '2025-10-03 02:09:18'),
(4, 11, 'HTML CSS Pro', 'Đây là một khóa học chuyên sâu được thiết kế để giúp người học làm chủ hoàn toàn HTML5 và CSS3, từ những kiến thức cơ bản nhất đến các kỹ thuật phức tạp và nâng cao. Mục tiêu lớn nhất của khóa học là giúp học viên có thể tự tin xây dựng giao diện (front-end) cho bất kỳ trang web nào từ file thiết kế.', '[\"Hi\\u1ec3u c\\u1ea5u tr\\u00fac chu\\u1ea9n HTML\",\"Hi\\u1ec3u r\\u00f5 v\\u1ec1 c\\u00e1c th\\u1ebb Meta\",\"Thu\\u1ed9c t\\u00ednh, thu\\u1ed9c t\\u00ednh to\\u00e0n c\\u1ee5c\",\"S\\u1eed d\\u1ee5ng li\\u00ean k\\u1ebft chuy\\u00ean s\\u00e2u\",\"S\\u1eed d\\u1ee5ng Emmet c\\u01a1 b\\u1ea3n\",\"Hi\\u1ec3u r\\u00f5 t\\u00ednh k\\u1ebf th\\u1eeba trong CSS\",\"Ph\\u00e2n bi\\u1ec7t th\\u1ebb inline v\\u00e0 block\",\"Hi\\u1ec3u Box-model c\\u1ee7a m\\u1ed7i ph\\u1ea7n t\\u1eed\"]', 1299000.00, 'thumbnails/9Dc2yZj4vHwjVds1VZn1MPkroDpNBKUilSxK4YdR.png', '2025-10-17 22:54:15'),
(5, 2, 'Kiến Thức Nhập Môn IT', 'Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên xem các videos tại khóa này trước nhé.', '[\"C\\u00e1c ki\\u1ebfn th\\u1ee9c c\\u01a1 b\\u1ea3n, n\\u1ec1n m\\u00f3ng c\\u1ee7a ng\\u00e0nh IT\",\"C\\u00e1c m\\u00f4 h\\u00ecnh, ki\\u1ebfn tr\\u00fac c\\u01a1 b\\u1ea3n khi tri\\u1ec3n khai \\u1ee9ng d\\u1ee5ng\",\"C\\u00e1c kh\\u00e1i ni\\u1ec7m, thu\\u1eadt ng\\u1eef c\\u1ed1t l\\u00f5i khi tri\\u1ec3n khai \\u1ee9ng d\\u1ee5ng\",\"Hi\\u1ec3u h\\u01a1n v\\u1ec1 c\\u00e1ch internet v\\u00e0 m\\u00e1y vi t\\u00ednh ho\\u1ea1t \\u0111\\u1ed9ng\"]', 0.00, 'thumbnails/VWeTM4ikmjUieOWolHAVpSV9PJg7Jfag7UueBbDw.png', '2025-10-18 21:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollments`
--

CREATE TABLE `course_enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_enrollments`
--

INSERT INTO `course_enrollments` (`id`, `user_id`, `course_id`, `enrolled_at`, `created_at`) VALUES
(4, 4, 3, '2025-10-06 21:12:43', '2025-10-06 21:12:43'),
(8, 4, 2, '2025-10-08 05:53:34', '2025-10-08 05:53:34'),
(9, 5, 2, '2025-10-08 08:37:18', '2025-10-08 08:37:18'),
(10, 6, 2, '2025-10-08 08:43:46', '2025-10-08 08:43:46'),
(11, 6, 3, '2025-10-08 08:44:12', '2025-10-08 08:44:12'),
(12, 7, 2, '2025-10-08 17:07:22', '2025-10-08 17:07:22'),
(13, 8, 3, '2025-10-09 19:49:48', '2025-10-09 19:49:48'),
(14, 8, 2, '2025-10-09 19:50:38', '2025-10-09 19:50:38'),
(15, 10, 2, '2025-10-13 21:16:42', '2025-10-13 21:16:42'),
(26, 13, 2, '2025-11-17 09:35:46', '2025-11-17 09:35:46'),
(28, 4, 5, '2025-11-17 09:46:01', '2025-11-17 09:46:01'),
(32, 13, 3, '2025-11-18 00:20:11', '2025-11-18 00:20:11'),
(35, 4, 1, '2025-12-02 06:28:42', '2025-12-02 06:28:42'),
(36, 14, 2, '2025-12-02 06:32:04', '2025-12-02 06:32:04'),
(37, 14, 5, '2025-12-02 06:34:26', '2025-12-02 06:34:26'),
(38, 15, 2, '2025-12-02 13:36:18', '2025-12-02 13:36:18'),
(39, 16, 2, '2025-12-16 05:01:14', '2025-12-16 05:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `section_id`, `title`, `youtube_url`, `duration`, `position`) VALUES
(1, 1, 'Test', 'https://www.youtube.com/watch?v=eJcCDt_Dnjw&list=RDMMeJcCDt_Dnjw&start_radio=1', 5, 1),
(2, 2, 'Test link video', 'https://www.youtube.com/watch?v=z2f7RHgvddc', 8, 1),
(3, 2, 'Test link 2', 'https://www.youtube.com/watch?v=SdcdneSdoV4', 15, 2),
(4, 3, 'Test nè', 'https://www.youtube.com/watch?v=azNNUTIbKH0', 20, 1),
(5, 3, 'Test....', 'https://www.youtube.com/watch?v=JNl1_hRwpXE', 10, 2),
(6, 4, 'hihi', 'https://www.youtube.com/watch?v=yMuBSxSIS04&t=615s', 30, 1),
(7, 5, 'Tổng quan về khóa học HTML CSS', 'https://www.youtube.com/watch?v=R6plN3FvzFY', 4, 1),
(8, 6, 'HTML CSS là gì?', 'https://www.youtube.com/watch?v=zwsPND378OQ', 3, 1),
(9, 6, 'Làm quen với Dev tools', 'https://www.youtube.com/watch?v=7BJiPyN4zZ0', 4, 2),
(10, 6, 'Cài đặt môi trường, công cụ cần thiết để bắt đầu học HTML CSS', 'https://www.youtube.com/watch?v=ZotVkQDC6mU', 3, 3),
(11, 6, 'Cài đặt môi trường, công cụ cần thiết để bắt đầu học HTML CSS', 'https://www.youtube.com/watch?v=ZotVkQDC6mU', 3, 3),
(12, 6, 'Cài đặt môi trường, công cụ cần thiết để bắt đầu học HTML CSS', 'https://www.youtube.com/watch?v=ZotVkQDC6mU', 3, 3),
(13, 6, 'Cấu trúc file HTML | Khởi tạo folder dự án trong HTML', 'https://www.youtube.com/watch?v=LYnrFSGLCl8', 7, 6),
(14, 6, 'Comments trong HTML | Cú pháp mở và đóng Comments', 'https://www.youtube.com/watch?v=JG0pdfdKjgQ', 3, 7),
(15, 7, 'Những thẻ HTML thông dụng', 'https://www.youtube.com/watch?v=AzmdwZ6e_aM', 11, 1),
(16, 8, 'Attributes trong HTML | Thêm thuộc tính (Attributes) vào thẻ', 'https://www.youtube.com/watch?v=UYpIh5pIkSA', 2, 1),
(17, 9, 'ID và Class trong CSS selectors', 'https://www.youtube.com/watch?v=4J6d8cr0X48', 4, 1),
(18, 10, 'Thuộc tính Padding trong CSS | CSS Padding', 'https://www.youtube.com/watch?v=aj-lD4XXr8A', 7, 1),
(19, 11, 'Cách sử dụng CSS trong HTML | Hướng dẫn chi tiết của từng cách', 'https://www.youtube.com/watch?v=NsSsJTg29oE', 7, 1),
(20, 11, 'Mức độ ưu tiên trong CSS', 'https://www.youtube.com/watch?v=AgZ0PX28bnA', 11, 2),
(21, 11, 'CSS Units là gì? | Các đơn vị trong CSS', 'https://www.youtube.com/watch?v=pcUiTt6eBk0', 11, 3),
(22, 11, 'Thuộc tính Border trong CSS | CSS Border', 'https://www.youtube.com/watch?v=VbzOimNAOxE', 6, 4),
(23, 12, 'Mô hình Client - Server là gì?', 'https://www.youtube.com/watch?v=zoELAirXMJY', 12, 1),
(24, 12, 'Domain là gì?', 'https://www.youtube.com/watch?v=M62l1xA5Eu8', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(5, '0001_01_01_000002_create_jobs_table', 2),
(6, '2025_10_08_121730_add_order_code_to_orders_table', 3),
(7, '2025_10_08_122130_update_payments_method_enum', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `total_amount`, `status`, `created_at`) VALUES
(13, '875706', 4, 20000.00, 'cancelled', '2025-10-08 05:39:47'),
(14, '642728', 4, 20000.00, 'cancelled', '2025-10-08 05:41:04'),
(15, '563061', 4, 20000.00, 'cancelled', '2025-10-08 05:42:36'),
(16, '312942', 4, 20000.00, 'cancelled', '2025-10-08 05:43:51'),
(17, '848612', 4, 20000.00, 'cancelled', '2025-10-08 05:44:44'),
(18, '514509', 4, 20000.00, 'cancelled', '2025-10-08 05:45:51'),
(19, '542058', 4, 5000.00, 'pending', '2025-10-08 05:49:14'),
(20, '855585', 4, 5000.00, 'paid', '2025-10-08 05:53:05'),
(21, '926383', 4, 500000.00, 'cancelled', '2025-10-08 05:58:12'),
(22, '287154', 5, 5000.00, 'cancelled', '2025-10-08 08:30:28'),
(23, '698689', 5, 5000.00, 'cancelled', '2025-10-08 08:34:29'),
(24, '272059', 5, 5000.00, 'cancelled', '2025-10-08 08:35:27'),
(25, '845526', 5, 5000.00, 'paid', '2025-10-08 08:36:24'),
(26, '965929', 6, 5000.00, 'paid', '2025-10-08 08:43:16'),
(27, '632888', 7, 5000.00, 'cancelled', '2025-10-08 16:57:43'),
(28, '95685', 7, 5000.00, 'paid', '2025-10-08 17:05:09'),
(29, '10914', 8, 5000.00, 'paid', '2025-10-09 19:50:01'),
(30, '78510', 9, 5000.00, 'cancelled', '2025-10-09 20:05:07'),
(31, '519375', 5, 500000.00, 'cancelled', '2025-10-11 21:27:31'),
(32, '273140', 10, 5000.00, 'paid', '2025-10-13 21:15:27'),
(33, '114353', 5, 500000.00, 'cancelled', '2025-10-14 06:56:51'),
(34, '403344', 5, 500000.00, 'cancelled', '2025-10-14 21:27:20'),
(35, '497345', 5, 500000.00, 'cancelled', '2025-10-14 21:50:49'),
(36, '269587', 4, 500000.00, 'cancelled', '2025-10-17 02:55:26'),
(37, '757568', 4, 500000.00, 'cancelled', '2025-10-17 22:29:35'),
(38, '540052', 5, 500000.00, 'cancelled', '2025-10-17 22:45:54'),
(39, '336622', 4, 1299000.00, 'cancelled', '2025-10-19 00:37:13'),
(40, '191292', 4, 1399000.00, 'cancelled', '2025-10-19 20:03:39'),
(41, '968628', 4, 1399000.00, 'cancelled', '2025-10-19 20:51:36'),
(42, '563112', 4, 1399000.00, 'cancelled', '2025-10-19 21:44:16'),
(43, '600043', 4, 1299000.00, 'cancelled', '2025-10-22 16:54:20'),
(44, '425745', 4, 1299000.00, 'cancelled', '2025-10-29 18:19:02'),
(45, '251280', 4, 1399000.00, 'cancelled', '2025-11-09 18:52:05'),
(46, '825885', 1, 1399000.00, 'cancelled', '2025-11-09 18:56:22'),
(47, '958879', 4, 1299000.00, 'cancelled', '2025-11-11 01:08:15'),
(48, '492121', 12, 5000.00, 'cancelled', '2025-11-11 01:12:29'),
(51, '400656', 4, 1299000.00, 'cancelled', '2025-11-17 09:20:40'),
(52, '671387', 4, 1299000.00, 'cancelled', '2025-11-17 09:29:27'),
(53, '639839', 4, 1299000.00, 'cancelled', '2025-11-17 09:34:23'),
(54, '105230', 13, 5000.00, 'paid', '2025-11-17 09:35:10'),
(55, '507750', 4, 1299000.00, 'cancelled', '2025-11-17 21:20:50'),
(56, '958731', 4, 1399000.00, 'cancelled', '2025-11-17 21:23:15'),
(57, '632689', 13, 1299000.00, 'cancelled', '2025-11-18 00:17:43'),
(58, '940846', 4, 1399000.00, 'paid', '2025-11-18 00:53:14'),
(59, '751632', 4, 1299000.00, 'cancelled', '2025-11-19 02:04:35'),
(60, '267600', 4, 1299000.00, 'cancelled', '2025-12-02 06:18:46'),
(61, '750633', 14, 5000.00, 'paid', '2025-12-02 06:31:15'),
(62, '315935', 15, 5000.00, 'paid', '2025-12-02 13:35:31'),
(63, '9514', 15, 1299000.00, 'cancelled', '2025-12-02 13:36:40'),
(64, '765583', 4, 1299000.00, 'cancelled', '2025-12-16 04:57:56'),
(65, '707959', 4, 1299000.00, 'cancelled', '2025-12-16 04:59:30'),
(66, '254191', 16, 5000.00, 'paid', '2025-12-16 05:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `course_id`, `price`) VALUES
(13, 13, 2, 20000.00),
(14, 14, 2, 20000.00),
(15, 15, 2, 20000.00),
(16, 16, 2, 20000.00),
(17, 17, 2, 20000.00),
(18, 18, 2, 20000.00),
(19, 19, 2, 5000.00),
(20, 20, 2, 5000.00),
(21, 21, 1, 500000.00),
(22, 22, 2, 5000.00),
(23, 23, 2, 5000.00),
(24, 24, 2, 5000.00),
(25, 25, 2, 5000.00),
(26, 26, 2, 5000.00),
(27, 27, 2, 5000.00),
(28, 28, 2, 5000.00),
(29, 29, 2, 5000.00),
(30, 30, 2, 5000.00),
(31, 31, 1, 500000.00),
(32, 32, 2, 5000.00),
(33, 33, 1, 500000.00),
(34, 34, 1, 500000.00),
(35, 35, 1, 500000.00),
(36, 36, 1, 500000.00),
(37, 37, 1, 500000.00),
(38, 38, 1, 500000.00),
(39, 39, 4, 1299000.00),
(40, 40, 1, 1399000.00),
(41, 41, 1, 1399000.00),
(42, 42, 1, 1399000.00),
(43, 43, 4, 1299000.00),
(44, 44, 4, 1299000.00),
(45, 45, 1, 1399000.00),
(46, 46, 1, 1399000.00),
(47, 47, 4, 1299000.00),
(48, 48, 2, 5000.00),
(51, 51, 4, 1299000.00),
(52, 52, 4, 1299000.00),
(53, 53, 4, 1299000.00),
(54, 54, 2, 5000.00),
(55, 55, 4, 1299000.00),
(56, 56, 1, 1399000.00),
(57, 57, 4, 1299000.00),
(58, 58, 1, 1399000.00),
(59, 59, 4, 1299000.00),
(60, 60, 4, 1299000.00),
(61, 61, 2, 5000.00),
(62, 62, 2, 5000.00),
(63, 63, 4, 1299000.00),
(64, 64, 4, 1299000.00),
(65, 65, 4, 1299000.00),
(66, 66, 2, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `method` enum('vnpay','momo','paypal','stripe','payos') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course_id`, `title`, `position`) VALUES
(1, 1, 'ABC', 1),
(2, 3, 'Chương 1. Test', 1),
(3, 2, 'Test 1', 1),
(4, 2, 'Test 2', 2),
(5, 4, 'Bắt đầu', 1),
(6, 4, 'Làm quen với HTML', 2),
(7, 4, 'Các thẻ tiêu đề', 3),
(8, 4, 'Thẻ đoạn văn', 4),
(9, 4, 'Chữ đậm, chữ nghiêng', 5),
(10, 4, 'HTML semantic', 6),
(11, 4, 'Làm quen với CSS', 7),
(12, 5, 'Khái niệm kỹ thuật cần biết', 1),
(13, 5, 'Môi trường, con người IT', 2),
(14, 5, 'Phương pháp, định hướng', 3),
(15, 5, 'Hoàn thành khóa học', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('q393b8Rh3qaffSsciS6VOfJyWSQH7BGD7YBU6Fbf', 16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiakxENXZ5OEtDQTJpYkZnRExReFFFcnVBdWFCODVDeUl5aWZQQTZrMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTY7fQ==', 1765861301);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','instructor','student') DEFAULT 'student',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Quản trị viên', 'admin@example.com', '$2y$12$XvRtJbqmRf/7Fl/goW..guV3IwYy3QCVWyHWZ1AYJ8fjWDs2EbUSe', 'admin', '2025-10-03 00:07:10'),
(2, 'Nguyễn Văn Hùng', 'instructor@example.com', '$2y$12$/L1RxZ4hNBMT3AXNK0x5LuOCoGBw8bugeqJs4NCWNDfs176M9dDjO', 'instructor', '2025-10-03 00:07:10'),
(3, 'Trần Thị Lan', 'student@example.com', '$2y$12$h6UOETGJKQqT0OpoUk0tL.nf.jdTAfkrgFTlbos9nVi9Z7j5973OG', 'student', '2025-10-03 00:07:10'),
(4, 'Trầm Khôi Nguyên', 'tramkhoinguyen27122@gmail.com', '$2y$12$3uLhgbIjpkJhyFTNN3ZLeeGWN47l8.2KzB.8ttz8p2yJRi8gui6u.', 'student', '2025-10-03 02:43:34'),
(5, 'Test', 'test@test.com', '$2y$12$jpJcLO597Mqy99U0zV4B/uQY0sNSqv7dT4Hzbyrcpdd57Om5hWykC', 'student', '2025-10-08 08:30:05'),
(6, 'Test 2', 'test2@test.com', '$2y$12$T3xoZ1FeY.jqm8nVJAIfEutUe8MPFqd0of0YAhVry/hHAB.mTD6Mm', 'student', '2025-10-08 08:39:49'),
(7, 'Test nè', 'testne@gmail.com', '$2y$12$3UBIBBKbkjtDCy68kHEYIuJrhRL4Jxi3X9gOmBJpH6a/eBN12Wiuq', 'student', '2025-10-08 16:57:10'),
(8, 'Nguyễn Thúy An', 'nguyenthuyan@gmail.com', '$2y$12$v9FcRDHcdjhxE8j63O.CjupKxA1sDrJAL6MpUZCB3dFgRJakXdU4q', 'student', '2025-10-09 19:14:33'),
(9, 'Nguyễn Bình An', 'nguyenbinhan@gmail.com', '$2y$12$42fDmUqZX1VRdz0Zx1Mk1e99f5361cr7u1PDgQ2Vq7hOCvqLF3Dke', 'student', '2025-10-09 20:04:36'),
(10, 'Nguyễn Văn Nhân', 'nguyenvannhan@gmail.com', '$2y$12$IWho9OdryLnwWzz20YO.4uuGmr8e/SvW1GUmRuWQm8nz1eMayulk.', 'student', '2025-10-13 21:15:13'),
(11, 'Trần Văn Tiến', 'tranvantien@gmail.com', '$2y$12$M4h5kPAEObQgR5TeiROLD.v7Zc4pSJULZx4Qv3DvrNicQo1Rlx6RO', 'instructor', '2025-10-18 20:49:36'),
(12, 'Hồ Hoàng Long', 'hoanglong@gmail.com', '$2y$12$RzTGDKiW3HR1UFv8fdegLOtIAZHYs5dD4MfPOaV9UxonUyzhOVYbu', 'student', '2025-11-11 01:12:04'),
(13, 'Trần Thị Yến Nhi', '110122133@st.tvu.edu.vn', '$2y$12$C8OYTt7BCVKKQPpnkDbKIeE7sgfO8tVIkBfU9QttvNUye/bD/DRvW', 'student', '2025-11-17 09:35:01'),
(14, 'Nguyễn Trang', 'nguyentrang@gmail.com', '$2y$12$rfylkerkPK0hbM9mYEcZ4OogxwC1WWSkcEz3KYWLd0HH6WVRzCqh6', 'student', '2025-12-02 06:31:08'),
(15, 'Minh Nguyễn', 'nguyenminh@gmail.com', '$2y$12$XRm5khj2qmu8/3jFQV6ZWu/WO1vLNAem1Q8LPDBA.khnbSFjzYxlC', 'student', '2025-12-02 13:35:24'),
(16, 'Nguyễn An', 'nguyenan@gmail.com', '$2y$12$4h4i6Ef7Jss9RprOyom1WO2CqiCL7HjSAzQJuxyMY5UDuwcay7X3O', 'student', '2025-12-16 05:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_progress`
--

INSERT INTO `user_progress` (`id`, `user_id`, `lesson_id`, `is_completed`, `completed_at`) VALUES
(1, 4, 2, 1, '2025-10-08 04:38:14'),
(2, 4, 3, 1, '2025-10-08 04:38:29'),
(4, 4, 4, 1, '2025-10-17 00:05:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`lesson_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
