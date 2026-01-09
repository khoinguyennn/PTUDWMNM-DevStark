-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 09, 2026 at 09:47 AM
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
(2, 2, 'Ngôn ngữ Sass', 'SASS giúp bạn code CSS nhanh hơn, chuyên nghiệp hơn, dễ maintain hơn. Nếu bạn đang làm dự án lớn hoặc muốn code CSS chuyên nghiệp hơn, SASS là công cụ không thể thiếu. Khóa học này sẽ giúp bạn từ người biết CSS thuần trở thành người code CSS chuyên nghiệp với SASS.', '[\"T\\u00ecm hi\\u1ec3u v\\u00e0 c\\u00e0i \\u0111\\u1eb7t Sass\",\"Sass l\\u00e0 ng\\u00f4n ng\\u1eef g\\u00ec?\",\"Ph\\u00e2n bi\\u1ec7t ph\\u1ea7n m\\u1edf r\\u1ed9ng khi s\\u1eed d\\u1ee5ng Sass\",\"C\\u00e1ch s\\u1eed d\\u1ee5ng Sass trong d\\u1ef1 \\u00e1n\",\"C\\u00e1c l\\u1ec7nh bi\\u00ean d\\u1ecbch Sass c\\u01a1 b\\u1ea3n\",\"Nested rules - L\\u1ed3ng gh\\u00e9p selector\",\"Variables - Bi\\u1ebfn trong Sass\",\"V\\u00ed d\\u1ee5 s\\u1eed d\\u1ee5ng Nested rules v\\u00e0 variables\",\"Tr\\u01b0\\u1eddng h\\u1ee3p s\\u1eed d\\u1ee5ng Nested rules ph\\u1ed5 bi\\u1ebfn\",\"Extend - K\\u1ebf th\\u1eeba styles\",\"Placeholder selector trong Sass\",\"V\\u00ed d\\u1ee5 s\\u1eed d\\u1ee5ng Extend v\\u00e0 Placeholder\"]', 299000.00, 'thumbnails/v61Z9Rl82HI9K8d6YRGrBHBy9qXeNfHlgv9UeTR3.png', '2025-10-03 01:01:10'),
(3, 2, 'HTML CSS từ Zero đến Hero', 'Trong khóa này chúng ta sẽ cùng nhau xây dựng giao diện 2 trang web là The Band & Shopee..', '[\"Bi\\u1ebft c\\u00e1ch x\\u00e2y d\\u1ef1ng giao di\\u1ec7n web v\\u1edbi HTML, CSS\",\"Bi\\u1ebft c\\u00e1ch \\u0111\\u1eb7t t\\u00ean class CSS theo chu\\u1ea9n BEM\",\"L\\u00e0m ch\\u1ee7 Flexbox khi d\\u1ef1ng b\\u1ed1 c\\u1ee5c website\",\"Bi\\u1ebft c\\u00e1ch t\\u1ef1 t\\u1ea1o \\u0111\\u1ed9ng l\\u1ef1c cho b\\u1ea3n th\\u00e2n\"]', 0.00, 'thumbnails/65CvOEt6mh2rWhBKR9xWsPyY4kuFinkuS6kIzr8q.png', '2025-10-03 02:09:18'),
(4, 11, 'HTML CSS Pro', 'Đây là một khóa học chuyên sâu được thiết kế để giúp người học làm chủ hoàn toàn HTML5 và CSS3, từ những kiến thức cơ bản nhất đến các kỹ thuật phức tạp và nâng cao. Mục tiêu lớn nhất của khóa học là giúp học viên có thể tự tin xây dựng giao diện (front-end) cho bất kỳ trang web nào từ file thiết kế.', '[\"Hi\\u1ec3u c\\u1ea5u tr\\u00fac chu\\u1ea9n HTML\",\"Hi\\u1ec3u r\\u00f5 v\\u1ec1 c\\u00e1c th\\u1ebb Meta\",\"Thu\\u1ed9c t\\u00ednh, thu\\u1ed9c t\\u00ednh to\\u00e0n c\\u1ee5c\",\"S\\u1eed d\\u1ee5ng li\\u00ean k\\u1ebft chuy\\u00ean s\\u00e2u\",\"S\\u1eed d\\u1ee5ng Emmet c\\u01a1 b\\u1ea3n\",\"Hi\\u1ec3u r\\u00f5 t\\u00ednh k\\u1ebf th\\u1eeba trong CSS\",\"Ph\\u00e2n bi\\u1ec7t th\\u1ebb inline v\\u00e0 block\",\"Hi\\u1ec3u Box-model c\\u1ee7a m\\u1ed7i ph\\u1ea7n t\\u1eed\"]', 1299000.00, 'thumbnails/9Dc2yZj4vHwjVds1VZn1MPkroDpNBKUilSxK4YdR.png', '2025-10-17 22:54:15'),
(5, 2, 'Kiến Thức Nhập Môn IT', 'Để có cái nhìn tổng quan về ngành IT - Lập trình web các bạn nên xem các videos tại khóa này trước nhé.', '[\"C\\u00e1c ki\\u1ebfn th\\u1ee9c c\\u01a1 b\\u1ea3n, n\\u1ec1n m\\u00f3ng c\\u1ee7a ng\\u00e0nh IT\",\"C\\u00e1c m\\u00f4 h\\u00ecnh, ki\\u1ebfn tr\\u00fac c\\u01a1 b\\u1ea3n khi tri\\u1ec3n khai \\u1ee9ng d\\u1ee5ng\",\"C\\u00e1c kh\\u00e1i ni\\u1ec7m, thu\\u1eadt ng\\u1eef c\\u1ed1t l\\u00f5i khi tri\\u1ec3n khai \\u1ee9ng d\\u1ee5ng\",\"Hi\\u1ec3u h\\u01a1n v\\u1ec1 c\\u00e1ch internet v\\u00e0 m\\u00e1y vi t\\u00ednh ho\\u1ea1t \\u0111\\u1ed9ng\"]', 0.00, 'thumbnails/VWeTM4ikmjUieOWolHAVpSV9PJg7Jfag7UueBbDw.png', '2025-10-18 21:21:05'),
(6, 20, 'Xây Dựng Website với ReactJS', 'Khóa học ReactJS từ cơ bản tới nâng cao, kết quả của khóa học này là bạn có thể làm hầu hết các dự án thường gặp với ReactJS. Cuối khóa học này bạn sẽ sở hữu một dự án giống Tiktok.com, bạn có thể tự tin đi xin việc khi nắm chắc các kiến thức được chia sẻ trong khóa học này.', '[\"Hi\\u1ec3u v\\u1ec1 kh\\u00e1i ni\\u1ec7m SPA\\/MPA\",\"Hi\\u1ec3u c\\u00e1ch ReactJS ho\\u1ea1t \\u0111\\u1ed9ng\",\"Bi\\u1ebft c\\u00e1ch t\\u1ed1i \\u01b0u hi\\u1ec7u n\\u0103ng \\u1ee9ng d\\u1ee5ng\",\"Hi\\u1ec3u r\\u00f5 r\\u00e0ng Redux workflow\",\"Bi\\u1ebft s\\u1eed d\\u1ee5ng redux-thunk middleware\",\"Tri\\u1ec3n khai d\\u1ef1 \\u00e1n React ra Internet\",\"Bi\\u1ebft c\\u00e1ch Deploy l\\u00ean Github\\/Gitlab page\",\"Hi\\u1ec3u v\\u1ec1 kh\\u00e1i ni\\u1ec7m hooks\",\"Hi\\u1ec3u v\\u1ec1 function\\/class component\",\"Th\\u00e0nh th\\u1ea1o l\\u00e0m vi\\u1ec7c v\\u1edbi RESTful API\"]', 0.00, 'thumbnails/k23hkeBUADrsFq2yi96wv4e94HO2EUOa6O9tECEl.png', '2026-01-02 07:01:41'),
(7, 20, 'Node & ExpressJS', 'Học Back-end với Node & ExpressJS framework, hiểu các khái niệm khi làm Back-end và xây dựng RESTful API cho trang web.', '[\"N\\u1eafm ch\\u1eafc l\\u00fd thuy\\u1ebft chung trong vi\\u1ec7c x\\u00e2y d\\u1ef1ng web\",\"X\\u00e2y d\\u1ef1ng web v\\u1edbi Express b\\u1eb1ng ki\\u1ebfn th\\u1ee9c th\\u1ef1c t\\u1ebf\",\"N\\u1eafm ch\\u1eafc l\\u00fd thuy\\u1ebft v\\u1ec1 API v\\u00e0 RESTful API\",\"N\\u1eafm ch\\u1eafc kh\\u00e1i ni\\u1ec7m v\\u1ec1 giao th\\u1ee9c HTTP\",\"H\\u1ecdc \\u0111\\u01b0\\u1ee3c c\\u00e1ch t\\u1ed5 ch\\u1ee9c code trong th\\u1ef1c t\\u1ebf\",\"Bi\\u1ebft c\\u00e1ch l\\u00e0m vi\\u1ec7c v\\u1edbi Mongoose, MongoDB trong NodeJS\",\"Bi\\u1ebft c\\u00e1ch x\\u00e2y d\\u1ef1ng API theo chu\\u1ea9n RESTful API\",\"\\u0110\\u01b0\\u1ee3c chia s\\u1ebb l\\u1ea1i kinh nghi\\u1ec7m l\\u00e0m vi\\u1ec7c th\\u1ef1c t\\u1ebf\",\"Hi\\u1ec3u r\\u00f5 t\\u01b0 t\\u01b0\\u1edfng v\\u00e0 c\\u00e1ch ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a m\\u00f4 h\\u00ecnh MVC\",\"Bi\\u1ebft c\\u00e1ch deploy (tri\\u1ec3n khai) website l\\u00ean internet\"]', 1599000.00, 'thumbnails/2CBZ85xYzB1abh8U1rBVGZIfeBqsEkhhrlCB12pK.png', '2026-01-02 10:52:13'),
(8, 21, 'Lập Trình JavaScript Nâng Cao', 'Hiểu sâu hơn về cách Javascript hoạt động, tìm hiểu về IIFE, closure, reference types, this keyword, bind, call, apply, prototype, ...', '[\"\\u0110\\u01b0\\u1ee3c h\\u1ecdc ki\\u1ebfn th\\u1ee9c v\\u1edbi n\\u1ed9i dung ch\\u1ea5t l\\u01b0\\u1ee3ng\",\"Hi\\u1ec3u \\u0111\\u01b0\\u1ee3c c\\u00e1ch t\\u01b0 duy n\\u00e2ng cao c\\u1ee7a c\\u00e1c l\\u1eadp tr\\u00ecnh vi\\u00ean c\\u00f3 kinh nghi\\u1ec7m\",\"C\\u00f3 n\\u1ec1n t\\u1ea3ng Javascript v\\u1eefng ch\\u1eafc \\u0111\\u1ec3 l\\u00e0m vi\\u1ec7c v\\u1edbi m\\u1ecdi th\\u01b0 vi\\u1ec7n, framework vi\\u1ebft b\\u1edfi Javascript\",\"C\\u00e1c ki\\u1ebfn th\\u1ee9c n\\u00e2ng cao c\\u1ee7a Javascript gi\\u00fap code tr\\u1edf n\\u00ean t\\u1ed1i \\u01b0u h\\u01a1n\",\"Hi\\u1ec3u \\u0111\\u01b0\\u1ee3c c\\u00e1c kh\\u00e1i ni\\u1ec7m kh\\u00f3 nh\\u01b0 t\\u1eeb kh\\u00f3a this, ph\\u01b0\\u01a1ng th\\u1ee9c bind, call, apply & x\\u1eed l\\u00fd b\\u1ea5t \\u0111\\u1ed3ng b\\u1ed9\",\"N\\u00e2ng cao c\\u01a1 h\\u1ed9i th\\u00e0nh c\\u00f4ng khi ph\\u1ecfng v\\u1ea5n xin vi\\u1ec7c nh\\u1edd ki\\u1ebfn th\\u1ee9c chuy\\u00ean m\\u00f4n v\\u1eefng ch\\u1eafc\"]', 2499000.00, 'thumbnails/6qsiF4UPpDPHvqYmEPbCgBY78xm8YhdMmaeM9TQN.png', '2026-01-02 10:57:38'),
(9, 20, 'Responsive Với Grid System', 'Trong khóa này chúng ta sẽ học về cách xây dựng giao diện web responsive với Grid System, tương tự Bootstrap 4.', '[\"Bi\\u1ebft c\\u00e1ch x\\u00e2y d\\u1ef1ng website Responsive\",\"T\\u1ef1 tay x\\u00e2y d\\u1ef1ng \\u0111\\u01b0\\u1ee3c th\\u01b0 vi\\u1ec7n CSS Grid\",\"Hi\\u1ec3u \\u0111\\u01b0\\u1ee3c t\\u01b0 t\\u01b0\\u1edfng thi\\u1ebft k\\u1ebf v\\u1edbi Grid system\",\"T\\u1ef1 hi\\u1ec3u \\u0111\\u01b0\\u1ee3c Grid layout trong bootstrap\"]', 199000.00, 'thumbnails/fL7af8prIQSKtLNMmcipyv3sQpL8t45rb5gx4xp9.png', '2026-01-02 11:15:30'),
(10, 21, 'Làm việc với Terminal & Ubuntu', 'Sở hữu một Terminal hiện đại, mạnh mẽ trong tùy biến và học cách làm việc với Ubuntu là một bước quan trọng trên con đường trở thành một Web Developer.', '[\"Bi\\u1ebft c\\u00e1ch c\\u00e0i \\u0111\\u1eb7t v\\u00e0 t\\u00f9y bi\\u1ebfn Windows Terminal\",\"Th\\u00e0nh th\\u1ea1o s\\u1eed d\\u1ee5ng c\\u00e1c l\\u1ec7nh Linux\\/Ubuntu\",\"Bi\\u1ebft c\\u00e0i \\u0111\\u1eb7t PHP 7.4 v\\u00e0 MariaDB tr\\u00ean Ubuntu 20.04\",\"Bi\\u1ebft s\\u1eed d\\u1ee5ng Windows Subsystem for Linux\",\"Bi\\u1ebft c\\u00e0i \\u0111\\u1eb7t Node v\\u00e0 t\\u1ea1o d\\u1ef1 \\u00e1n ReactJS\\/ExpressJS\",\"Hi\\u1ec3u v\\u1ec1 Ubuntu v\\u00e0 bi\\u1ebft t\\u1ef1 c\\u00e0i \\u0111\\u1eb7t c\\u00e1c ph\\u1ea7n m\\u1ec1m kh\\u00e1c\"]', 0.00, 'thumbnails/ABBgRxUIdxWYyK6MiGtkeJL8m8LnFe5sbeJVzdQ5.png', '2026-01-02 13:08:49'),
(11, 11, 'Lập Trình JavaScript Cơ Bản', 'Học Javascript cơ bản phù hợp cho người chưa từng học lập trình. Với hơn 100 bài học và có bài tập thực hành sau mỗi bài học.', '[\"Hi\\u1ec3u chi ti\\u1ebft v\\u1ec1 c\\u00e1c kh\\u00e1i ni\\u1ec7m c\\u01a1 b\\u1ea3n trong JS\",\"T\\u1ef1 tin khi ph\\u1ecfng v\\u1ea5n v\\u1edbi ki\\u1ebfn th\\u1ee9c v\\u1eefng ch\\u1eafc\",\"N\\u1eafm ch\\u1eafc c\\u00e1c t\\u00ednh n\\u0103ng trong phi\\u00ean b\\u1ea3n ES6\",\"Ghi nh\\u1edb c\\u00e1c kh\\u00e1i ni\\u1ec7m nh\\u1edd b\\u00e0i t\\u1eadp tr\\u1eafc nghi\\u1ec7m\",\"C\\u00e1c b\\u00e0i th\\u1ef1c h\\u00e0nh nh\\u01b0 Tabs, Music Player\",\"X\\u00e2y d\\u1ef1ng \\u0111\\u01b0\\u1ee3c website \\u0111\\u1ea7u ti\\u00ean k\\u1ebft h\\u1ee3p v\\u1edbi JS\",\"C\\u00f3 n\\u1ec1n t\\u1ea3ng \\u0111\\u1ec3 h\\u1ecdc c\\u00e1c th\\u01b0 vi\\u1ec7n v\\u00e0 framework JS\",\"Th\\u00e0nh th\\u1ea1o DOM APIs \\u0111\\u1ec3 t\\u01b0\\u01a1ng t\\u00e1c v\\u1edbi trang web\",\"N\\u00e2ng cao t\\u01b0 duy v\\u1edbi c\\u00e1c b\\u00e0i ki\\u1ec3m tra v\\u1edbi testcases\"]', 0.00, 'thumbnails/TUN40q7y42dbJYTVDXt8BWhch3ZKdcC9v9N0ngDK.png', '2026-01-02 13:10:53'),
(12, 20, 'Lập trình C++ cơ bản, nâng cao', 'Khóa học lập trình C++ từ cơ bản tới nâng cao dành cho người mới bắt đầu. Mục tiêu của khóa học này nhằm giúp các bạn nắm được các khái niệm căn cơ của lập trình, giúp các bạn có nền tảng vững chắc để chinh phục con đường trở thành một lập trình viên.', '[\"Bi\\u1ebfn v\\u00e0 ki\\u1ec3u d\\u1eef li\\u1ec7u\",\"C\\u1ea5u tr\\u00fac \\u0111i\\u1ec1u khi\\u1ec3n v\\u00e0 v\\u00f2ng l\\u1eb7p\",\"M\\u1ea3ng\",\"String\",\"H\\u00e0m\",\"Con tr\\u1ecf\",\"Struct\",\"L\\u00e0m vi\\u1ec7c v\\u1edbi file\",\"H\\u01b0\\u1edbng \\u0111\\u1ed1i t\\u01b0\\u1ee3ng (OOP)\"]', 0.00, 'thumbnails/wORneB2haSrOiao30r4RwwfpqdkU0bGFr3aU7yVk.png', '2026-01-02 13:13:52');

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
(39, 16, 2, '2025-12-16 05:01:14', '2025-12-16 05:01:14'),
(42, 18, 5, '2026-01-01 10:13:48', '2026-01-01 10:13:48'),
(43, 17, 2, '2026-01-01 10:25:33', '2026-01-01 10:25:33'),
(44, 19, 2, '2026-01-01 10:33:34', '2026-01-01 10:33:34'),
(45, 4, 4, '2026-01-02 07:07:58', '2026-01-02 07:07:58'),
(46, 4, 6, '2026-01-02 10:38:56', '2026-01-02 10:38:56'),
(47, 3, 2, '2026-01-02 12:48:30', '2026-01-02 12:48:30'),
(48, 1, 5, '2026-01-02 12:50:02', '2026-01-02 12:50:02'),
(49, 4, 9, '2026-01-03 07:40:01', '2026-01-03 07:40:01'),
(50, 23, 9, '2026-01-09 01:17:25', '2026-01-09 01:17:25');

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
(2, 2, 'Bạn sẽ làm được gì sau khóa học?', 'https://www.youtube.com/watch?v=R6plN3FvzFY&t=1s', 3, 1),
(3, 2, 'Tìm hiểu về HTML, CSS', 'https://www.youtube.com/watch?v=zwsPND378OQ&t=1s', 2, 2),
(4, 3, 'Tìm hiểu SASS', 'https://www.youtube.com/watch?v=pXbA0Nab9UE&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=1', 8, 1),
(5, 3, 'Who Are You', 'https://www.youtube.com/watch?v=OEusDadSH70&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=6', 8, 2),
(6, 4, 'Môi trường học tập - Enviroments', 'https://www.youtube.com/watch?v=_l_Q1UAHEb0&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=2', 15, 1),
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
(24, 12, 'Domain là gì?', 'https://www.youtube.com/watch?v=M62l1xA5Eu8', 11, 2),
(25, 4, 'Môi trường học tập - Setting', 'https://www.youtube.com/watch?v=Df8rw4BHeyc&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=4', 2, 2),
(26, 4, 'Môi trường học tập - Output', 'https://www.youtube.com/watch?v=HOAjfTu_bGA&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=3', 7, 3),
(27, 16, 'CSS Extensions', 'https://www.youtube.com/watch?v=Omkd-Go9VqE&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=5', 11, 1),
(28, 16, 'CSS Extensions Phần 1', 'https://www.youtube.com/watch?v=dbgYzbN_eJc&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=10', 11, 2),
(29, 16, 'CSS Extensions Phần 2', 'https://www.youtube.com/watch?v=9MW6oFk8xQE&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=11', 3, 3),
(30, 16, 'CSS Extensions Phần 3', 'https://www.youtube.com/watch?v=wxnI6j2U9SE&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=12', 3, 4),
(31, 17, 'Variable & Data Type - Use', 'https://www.youtube.com/watch?v=uF515fCRg3Q&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=13', 6, 1),
(32, 17, 'Variable & Data Type - Global', 'https://www.youtube.com/watch?v=_dgsKdhzj38&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=14', 3, 2),
(33, 17, 'Variable & Data Type - Data Type', 'https://www.youtube.com/watch?v=s5V05GjhAn4&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=15', 9, 3),
(34, 17, 'Variable & Data Type - Interpolation', 'https://www.youtube.com/watch?v=gimYvgs4j6Y&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=16', 3, 4),
(35, 17, 'Variable & Data Type - Google Font', 'https://www.youtube.com/watch?v=-ntvXtulbm0&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=17', 6, 5),
(36, 18, 'Control Directive & Expressions - IF', 'https://www.youtube.com/watch?v=62EWD46fia4&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=18', 4, 2),
(37, 18, 'Control Directive & Expressions - For Phần 1', 'https://www.youtube.com/watch?v=IA2mW6Wd88I&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=19', 3, 1),
(38, 19, 'Function - Create & Use', 'https://www.youtube.com/watch?v=CinjLzKFpvY&list=PLv6GftO355AtWld1EE7SBAH-OkKKt23Bb&index=23', 10, 1),
(40, 13, 'Học IT cần tố chất gì? Góc nhìn khác từ chuyên gia định hướng giáo dục', 'https://www.youtube.com/watch?v=CyZ_O7v62h4&t=1s', 24, 1),
(41, 13, 'Sinh viên IT đi thực tập tại doanh nghiệp cần biết những gì?', 'https://www.youtube.com/watch?v=YH-E4Y3EaT4&t=3s', 34, 2),
(42, 13, 'Trải nghiệm thực tế sau 2 tháng làm việc tại doanh nghiệp của học viên DevStark?', 'https://www.youtube.com/watch?v=2sg1yNl1WvE', 47, 3),
(43, 14, 'Phương pháp học lập trình của Admin DevStark?', 'https://www.youtube.com/watch?v=hzg7gKJ-pZs', 13, 1),
(44, 14, 'Làm sao để có thu nhập cao và đi xa hơn trong ngành IT?', 'https://www.youtube.com/watch?v=YshuedtTWyI', 16, 2),
(45, 14, '8 lời khuyên giúp học lập trình tại DevStark hiệu quả hơn!', 'https://www.youtube.com/watch?v=-jV06pqjUUc', 4, 3),
(46, 1, 'Làm quen với JavaScript', 'https://www.youtube.com/watch?v=-sMbAvgg7mY&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=1', 20, 1),
(47, 21, 'Sử dụng biến', 'https://www.youtube.com/watch?v=FjPNtRRyd2E&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=2', 12, 1),
(48, 21, 'Kiểu dữ liệu', 'https://www.youtube.com/watch?v=SrqmsJLIc7g&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=3', 12, 2),
(49, 21, 'Xác định kiểu dữ liệu', 'https://www.youtube.com/watch?v=5_ALsxmhKME&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=8', 6, 3),
(50, 22, 'Toán tử trong JavaScript – Phần 1', 'https://www.youtube.com/watch?v=o5QMg94hovU&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=5', 15, 1),
(51, 22, 'Toán tử trong JavaScript – Phần 2', 'https://www.youtube.com/watch?v=a-XMkzagw2w&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=6', 16, 2),
(52, 23, 'Phát biểu điều kiện', 'https://www.youtube.com/watch?v=Ai7p996YaAA&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=7', 17, 1),
(53, 23, 'Vòng lặp for', 'https://www.youtube.com/watch?v=TQ3L_yBbDdk&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=9', 8, 2),
(54, 23, 'Vòng lặp while', 'https://www.youtube.com/watch?v=EL29sqE8pII&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=10', 9, 3),
(55, 23, 'Do…while, break, continue', 'https://www.youtube.com/watch?v=o3a8vyGR3es&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=11', 6, 4),
(56, 23, 'Vòng lặp – Bài tập tổng hợp', 'https://www.youtube.com/watch?v=hHmO53Chy9w&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=12', 17, 5),
(57, 23, 'Hàm (function)', 'https://www.youtube.com/watch?v=Ccspp-lV9Iw&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=4', 22, 6),
(58, 24, 'JavaScript error', 'https://www.youtube.com/watch?v=lSOieF5lDAY&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=13', 8, 1),
(59, 25, 'Number – Giới thiệu', 'https://www.youtube.com/watch?v=UTx2A0NgCEU&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=14', 6, 1),
(60, 25, 'Number – Thuộc tính', 'https://www.youtube.com/watch?v=hfNp0z5wLdc&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=15', 18, 2),
(61, 25, 'Number – Phương thức', 'https://www.youtube.com/watch?v=JCbfznuosJQ&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=16', 10, 3),
(62, 25, 'Number – Bài tập', 'https://www.youtube.com/watch?v=Nyf6Gn6j9GY&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=17', 12, 4),
(63, 26, 'Array – Thuộc tính', 'https://www.youtube.com/watch?v=x2PhZc4qVfI&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=18', 12, 1),
(64, 26, 'Array – Phương thức – Phần 1', 'https://www.youtube.com/watch?v=PVsLwoEcW_Y&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=19', 11, 2),
(65, 26, 'Array – Phương thức – Phần 2', 'https://www.youtube.com/watch?v=4_mxZzl7HF4&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=20', 6, 3),
(66, 26, 'Array – Phương thức – Phần 3', 'https://www.youtube.com/watch?v=LfFDFXspvL4&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=21', 20, 4),
(67, 26, 'Array – Bài tập', 'https://www.youtube.com/watch?v=LfFDFXspvL4&list=PLv6GftO355AvAl13CUVcVvWu0hOZnpfW8&index=21', 20, 5),
(68, 2, 'Làm quen với Dev tools', 'https://www.youtube.com/watch?v=7BJiPyN4zZ0', 3, 3),
(69, 2, 'Cài đặt VS Code, Page Ruler extension', 'https://www.youtube.com/watch?v=ZotVkQDC6mU&t=8s', 2, 4),
(70, 27, 'Cấu trúc của 1 file HTML', 'https://www.youtube.com/watch?v=LYnrFSGLCl8', 6, 1),
(71, 27, 'Comments trong HTML', 'https://www.youtube.com/watch?v=JG0pdfdKjgQ', 2, 2),
(72, 27, 'Attribute trong HTML là gì?', 'https://www.youtube.com/watch?v=UYpIh5pIkSA', 1, 3),
(73, 27, 'Cách quản lý thư mục dự án', 'https://www.youtube.com/watch?v=TkPppGzB9ZA', 11, 4),
(74, 28, 'Sử dụng CSS trong HTML', 'https://www.youtube.com/watch?v=NsSsJTg29oE', 7, 1),
(75, 33, 'ReactJS là gì? Tại sao nên học ReactJS?', 'https://www.youtube.com/watch?v=x0fSBAgBrOQ', 10, 1),
(76, 33, 'SPA/MPA là gì?', 'https://www.youtube.com/watch?v=30sMCciFIAM&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=2', 22, 2),
(77, 34, 'Arrow function', 'https://www.youtube.com/watch?v=9QeNLypIiZs&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=3', 8, 1),
(78, 34, 'Enhanced object literals', 'https://www.youtube.com/watch?v=WB6FQdp41hs&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=5', 5, 2),
(79, 34, 'Destructuring, Rest', 'https://www.youtube.com/watch?v=J1m4vLDUhEI&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=7', 13, 3),
(80, 34, 'Spread operator', 'https://www.youtube.com/watch?v=MJZICS7nQk8&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=6', 13, 4),
(81, 34, 'JS modules', 'https://www.youtube.com/watch?v=08lWi4T2Bfg&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=4', 14, 5),
(82, 35, 'document.createElement() để làm gì?', 'https://www.youtube.com/watch?v=Nno-r1Cz_-I&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=9', 10, 1),
(83, 35, 'Lưu ý: React đã có phiên bản 18', 'https://www.youtube.com/watch?v=5KfoXHWzcLw&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=9', 2, 2),
(84, 35, 'Cách thêm React vào Website', 'https://www.youtube.com/watch?v=SdphnMywCbo&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=10', 14, 3),
(85, 35, 'React.createElement() nữa là sao?', 'https://www.youtube.com/watch?v=JN_SxpAujDw&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=11', 14, 4),
(86, 35, 'ReactDOM là gì? Tại sao phải sử dụng?', 'https://www.youtube.com/watch?v=zWOREJxiRVY&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=12', 11, 5),
(87, 35, 'Sử dụng ReactDOM phiên bản 18', 'https://www.youtube.com/watch?v=AJ8j6_L94Bc&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=13', 7, 6),
(88, 36, 'JSX là gì? Tại sao cần JSX?', 'https://www.youtube.com/watch?v=samx2yC15Pg&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=14', 15, 1),
(89, 36, 'JSX render Arrays | JSX FQA', 'https://www.youtube.com/watch?v=i1cjVyIZCKs&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=15', 13, 2),
(90, 36, 'React element types', 'https://www.youtube.com/watch?v=uGopxH14kYA&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=16', 14, 3),
(91, 36, 'Props là gì? Dùng props khi nào?', 'https://www.youtube.com/watch?v=TvE2FuYiuXo&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=17', 25, 4),
(92, 36, 'DOM events?', 'https://www.youtube.com/watch?v=7jQrn1KjcEw&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=18', 13, 5),
(93, 36, 'Quy ước đặt tên components?', 'https://www.youtube.com/watch?v=5SU6P-cqoJw&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=19', 26, 6),
(94, 36, 'Children props? Render props?', 'https://www.youtube.com/watch?v=1Bse4Lx5CP8&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=20', 22, 7),
(95, 37, 'NodeJS là gì? Tại sao phải sử dụng NodeJS?', 'https://www.youtube.com/watch?v=ysjJlvQ3FFc&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=21', 11, 1),
(96, 37, 'Lưu ý: Sử dụng React & React-DOM 17 ở bài sau', 'https://www.youtube.com/watch?v=6qRyEeCDJ2g&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=22', 2, 2),
(97, 37, 'Tạo dự án với React + Webpack', 'https://www.youtube.com/watch?v=1EBe-l1E3pM&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=23', 31, 3),
(98, 38, 'Hooks là gì?', 'https://www.youtube.com/watch?v=5ismRwx4ebM&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=28', 12, 1),
(99, 38, 'useState hook', 'https://www.youtube.com/watch?v=rIaFc5MLCcs&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=29', 19, 2),
(100, 38, 'Two-way binding trong React?', 'https://www.youtube.com/watch?v=CVaEWBFpxhc&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=30', 28, 3),
(101, 39, 'Sử dụng CSS', 'https://www.youtube.com/watch?v=s-vzXxTG9pQ&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=50', 12, 1),
(102, 39, 'CSS module', 'https://www.youtube.com/watch?v=U6pZ5uf2oLM&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=51', 14, 2),
(103, 39, 'Thư viện clsx và classnames', 'https://www.youtube.com/watch?v=T1NogjaceIo&list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q&index=52', 12, 3),
(104, 40, 'Lời khuyên trước khóa học', 'https://www.youtube.com/watch?v=z2f7RHgvddc', 8, 1),
(105, 40, 'HTTP protocol', 'https://www.youtube.com/watch?v=SdcdneSdoV4&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=2', 15, 2),
(106, 40, 'SSR & CSR', 'https://www.youtube.com/watch?v=HLEu57iLrRo&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=3', 12, 3),
(107, 40, 'Install Node', 'https://www.youtube.com/watch?v=CcSuYLjKW3g&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=4', 1, 4),
(108, 40, 'Install ExpressJS', 'https://www.youtube.com/watch?v=tfQXZ8jES6A&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=5', 18, 5),
(109, 40, 'Install Nodemon & inspector', 'https://www.youtube.com/watch?v=zCFOn4YXr00&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=6', 10, 6),
(110, 40, 'Add git repo', 'https://www.youtube.com/watch?v=f0C9kTOf6IY&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=7', 2, 7),
(111, 40, 'Install Morgan', 'https://www.youtube.com/watch?v=seI--u0hSeg&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=8', 5, 8),
(112, 41, 'Template engine (handlebars)', 'https://www.youtube.com/watch?v=lpbl2qQXbDo&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=9', 27, 1),
(113, 41, 'Static file & SCSS', 'https://www.youtube.com/watch?v=BxZNiLo-OA0&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=10', 21, 2),
(114, 41, 'Use Bootstrap', 'https://www.youtube.com/watch?v=zNLXsTu_kUA&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=11', 9, 3),
(115, 41, 'Basic routing', 'https://www.youtube.com/watch?v=Wz6WghmEmFk&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=12', 11, 4),
(116, 41, 'GET method', 'https://www.youtube.com/watch?v=BbBagzvrSto&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=13', 2, 5),
(117, 41, 'Query parameters', 'https://www.youtube.com/watch?v=6LdwSrTCmo4&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=14', 11, 6),
(118, 41, 'Form default behavior', 'https://www.youtube.com/watch?v=wCF8pIbOOpo&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=15', 13, 7),
(119, 41, 'POST method', 'https://www.youtube.com/watch?v=LlfdqnK28Cg&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=16', 17, 8),
(120, 42, 'Mô hình MVC', 'https://www.youtube.com/watch?v=N8GhaR7K3tI&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=17', 5, 1),
(121, 42, '[MVC] Routes & Controllers', 'https://www.youtube.com/watch?v=Pd_ZIpCVZPc&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=18', 44, 2),
(122, 42, '[Windows] Install MongoDB', 'https://www.youtube.com/watch?v=5Odp8lcAvyA&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=19', 7, 3),
(123, 42, '[Ubuntu] Install MongoDB', 'https://www.youtube.com/watch?v=2AWBtOvYOXI&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=20', 8, 4),
(124, 42, '[MacOS] Install MongoDB', 'https://www.youtube.com/watch?v=gcbMx8owYTg&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=21', 21, 5),
(125, 42, 'Prettier - Code formatter', 'https://www.youtube.com/watch?v=kyNyMfRCavg&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=22', 25, 6),
(126, 42, '[MVC] Model', 'https://www.youtube.com/watch?v=uAXpEmTZhfA&list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3&index=23', 31, 7),
(127, 43, 'Lời khuyên trước khóa học', 'https://www.youtube.com/watch?v=-jV06pqjUUc&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=2', 4, 1),
(128, 43, 'Cài đặt môi trường', 'https://www.youtube.com/watch?v=efI98nT8Ffo&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=3', 2, 2),
(130, 44, 'Sử dụng JavaScript với HTML', 'https://www.youtube.com/watch?v=W0vEUmyvthQ&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=4', 4, 1),
(131, 44, 'Khái niệm biến và cách sử dụng', 'https://www.youtube.com/watch?v=CLbx37dqYEI&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=5', 4, 2),
(132, 44, 'Cú pháp comments là gì?', 'https://www.youtube.com/watch?v=xRpXBEq6TOY&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=6', 5, 3),
(133, 44, 'Thuật ngữ Built-in là gì?', 'https://www.youtube.com/watch?v=rSV33HGotgE&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=7', 7, 4),
(134, 45, 'Làm quen với toán tử', 'https://www.youtube.com/watch?v=SZb-N7TfPlw&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=8', 5, 1),
(135, 45, 'Toán tử số học', 'https://www.youtube.com/watch?v=m_h7-dgKnMU&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=9', 5, 2),
(136, 45, 'Toán tử gán', 'https://www.youtube.com/watch?v=ncRmjazgsE8&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=11', 5, 3),
(137, 45, 'Toán tử ++ và --', 'https://www.youtube.com/watch?v=aM-DUx6Qnc8&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=10', 11, 4),
(138, 45, 'Toán tử nối chuỗi', 'https://www.youtube.com/watch?v=QCLVU6cZU_E&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=12', 4, 5),
(139, 45, 'Toán tử so sánh', 'https://www.youtube.com/watch?v=rWM2lXtS-d8&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=13', 4, 6),
(140, 46, 'Khái niệm hàm (function)', 'https://www.youtube.com/watch?v=4g9ENVc2KLA&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=25', 7, 1),
(141, 46, 'Tham số trong hàm', 'https://www.youtube.com/watch?v=jE6UPl17Nvo&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=26', 16, 2),
(142, 46, 'Hiểu hơn về hàm', 'https://www.youtube.com/watch?v=aTQojRq0N4c&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=28', 5, 3),
(143, 46, 'Các loại hàm', 'https://www.youtube.com/watch?v=scwab9DMNtM&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=29', 6, 4),
(144, 47, 'Kiểu dữ liệu chuỗi (string)', 'https://www.youtube.com/watch?v=6F_dajRCC9Q&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=20', 10, 1),
(145, 47, 'Làm việc với chuỗi', 'https://www.youtube.com/watch?v=b4YivuRmcEw&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=21', 18, 2),
(146, 48, 'Kiểu dữ liệu số (number)', 'https://www.youtube.com/watch?v=varb35t44v0&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=22', 10, 1),
(147, 48, 'Số và làm việc với số', 'https://www.youtube.com/watch?v=varb35t44v0&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=22', 10, 2),
(148, 49, 'JSON là gì?', 'https://www.youtube.com/watch?v=Uph14HYkgEQ&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=87', 17, 1),
(149, 49, 'Promise (sync, async)', 'https://www.youtube.com/watch?v=QJmNEqy0zV0&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=88', 13, 2),
(150, 49, 'Promise (pain)', 'https://www.youtube.com/watch?v=bgSbjJIwrj0&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=89', 5, 3),
(151, 49, 'Promise (concept)', 'https://www.youtube.com/watch?v=_4F8ihblZFU&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=90', 15, 4),
(152, 49, 'Promise (chain)', 'https://www.youtube.com/watch?v=Ldl571DAlXI&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=91', 14, 5),
(153, 49, 'Promise methods (resolve, reject, all)', 'https://www.youtube.com/watch?v=pxyxbaq8i8c&list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5&index=92', 15, 6),
(154, 50, 'Giới thiệu khóa học', 'https://www.youtube.com/watch?v=Da1tpV9TMU0&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA', 1, 1),
(155, 50, 'Cài đặt Dev - C++', 'https://www.youtube.com/watch?v=9_uoKY0AwqE&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=2', 2, 2),
(156, 50, 'Hướng dẫn sử dụng Dev - C++', 'https://www.youtube.com/watch?v=vFhKEYRBmVY&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=3', 3, 3),
(157, 51, 'Biến và nhập xuất dữ liệu', 'https://www.youtube.com/watch?v=Z5O6pxQm6II&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=4', 7, 1),
(158, 51, 'Kiểu dữ liệu thường gặp', 'https://www.youtube.com/watch?v=qpIautEyv2s&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=5', 5, 2),
(159, 51, 'Biến cục bộ và biến toàn cục', 'https://www.youtube.com/watch?v=79mzaFPLEz8&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=6', 6, 3),
(160, 51, 'Hằng số', 'https://www.youtube.com/watch?v=zccrOA-00lM&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=7', 3, 4),
(161, 51, 'Toán tử gán và toán tử số học', 'https://www.youtube.com/watch?v=THAJMtm53ZQ&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=8', 10, 5),
(162, 51, 'Toán tử quan hệ và toán tử logic', 'https://www.youtube.com/watch?v=RX8tkygyHPU&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=9', 12, 6),
(163, 52, 'Cấu trúc if else', 'https://www.youtube.com/watch?v=1ppDCzoB03k&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=12', 9, 1),
(164, 52, 'Cấu trúc switch case', 'https://www.youtube.com/watch?v=W3k6lrN0qG4&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=13', 11, 2),
(165, 52, 'Toán tử 3 ngôi', 'https://www.youtube.com/watch?v=YKeKmpcMcQY&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=14', 5, 3),
(166, 52, 'Vòng lặp', 'https://www.youtube.com/watch?v=7uHfTAj3Vao&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=15', 12, 4),
(167, 52, 'Bài tập về vòng lặp', 'https://www.youtube.com/watch?v=Oe27IJSOUUM&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=16', 11, 5),
(168, 52, 'Break, continue, goto', 'https://www.youtube.com/watch?v=r2FMycOy_2Y&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=17', 12, 6),
(169, 52, 'Bài tập chương 03', 'https://www.youtube.com/watch?v=icnzUqCmFes&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=18', 23, 7),
(170, 53, 'Mảng 1 chiều', 'https://www.youtube.com/watch?v=89W1oyXfqgo&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=19', 9, 1),
(171, 53, 'Thực hành sử dụng mảng', 'https://www.youtube.com/watch?v=X5LOZEf0j6g&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=20', 18, 2),
(172, 53, 'Mảng 2 chiều', 'https://www.youtube.com/watch?v=xGpB07JzrQ8&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=21', 7, 3),
(173, 54, 'String', 'https://www.youtube.com/watch?v=Q06peb_sH6k&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=25', 7, 1),
(174, 54, 'Các phương thức làm việc với string', 'https://www.youtube.com/watch?v=duJoNkUE-MA&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=26', 14, 2),
(175, 55, 'Hàm', 'https://www.youtube.com/watch?v=ay8PEiiP5tU&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=28', 17, 1),
(176, 55, 'Tham số và đối số', 'https://www.youtube.com/watch?v=ATAoEb-ZXKI&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=29', 8, 2),
(177, 55, 'Đối số mặc định', 'https://www.youtube.com/watch?v=NU0joSR66Ag&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=30', 3, 3),
(178, 55, 'Tham chiếu và tham trị', 'https://www.youtube.com/watch?v=OQfEPrsWYlY&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=31', 11, 4),
(179, 55, 'Hàm nguyên mẫu', 'https://www.youtube.com/watch?v=5Z63whiuzhE&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=32', 3, 5),
(180, 56, 'Con trỏ', 'https://www.youtube.com/watch?v=uBfsM5RJWSI&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=35', 8, 1),
(181, 56, 'Cấp phát động', 'https://www.youtube.com/watch?v=OIU55ogb26M&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=36', 6, 2),
(182, 56, 'Cấp phát mảng động', 'https://www.youtube.com/watch?v=anbncsNUSSk&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=37', 6, 3),
(183, 57, 'Struct', 'https://www.youtube.com/watch?v=ZbVO_4jH60k&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=39', 16, 1),
(184, 57, 'Con trỏ và struct', 'https://www.youtube.com/watch?v=T39JnItSmJU&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=40', 5, 2),
(185, 57, 'Nạp chồng toán tử', 'https://www.youtube.com/watch?v=tNlCid6mQ3E&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=41', 11, 3),
(186, 58, 'Làm việc với file text', 'https://www.youtube.com/watch?v=LekUWlASyMY&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=43', 19, 1),
(187, 58, 'Các chế độ làm việc với file', 'https://www.youtube.com/watch?v=_wdQU8GrJcY&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=44', 11, 2),
(188, 58, 'Làm việc với file nhị phân', 'https://www.youtube.com/watch?v=UvNdzdhkDJQ&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=45', 8, 3),
(189, 59, 'Class và object', 'https://www.youtube.com/watch?v=jwvmfp3Kp8U&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=46', 15, 1),
(190, 59, 'Tính đóng gói', 'https://www.youtube.com/watch?v=ab2TALCZruo&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=47', 4, 2),
(191, 59, 'Con trỏ và object', 'https://www.youtube.com/watch?v=tSBR3R-6egg&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=48', 9, 3),
(192, 59, 'Tính kế thừa', 'https://www.youtube.com/watch?v=M6FwepHC6vM&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=49', 7, 4),
(193, 59, 'Tính đa hình (nạp chồng và ghi đè)', 'https://www.youtube.com/watch?v=j-LyRHfSY_Y&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=51', 13, 5),
(194, 59, 'Tính đa hình (phương thức ảo)', 'https://www.youtube.com/watch?v=m2ZsYwZuns4&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=52', 5, 6),
(195, 59, 'Tính trừu tượng', 'https://www.youtube.com/watch?v=-G0bcwu_Vtw&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=53', 5, 7),
(196, 59, 'Hàm bạn (friend function)', 'https://www.youtube.com/watch?v=F74kzmhQRA8&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=54', 7, 8),
(197, 59, 'Lớp bạn (friend class)', 'https://www.youtube.com/watch?v=ezTDHifaJ74&list=PL_-VfJajZj0Uo72G_6tSY4NRLpmffeXSA&index=55', 15, 9),
(198, 60, 'Giới thiệu Windows Terminal & WSL', 'https://www.youtube.com/watch?v=7ppRSaGT1uw&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7', 4, 1),
(199, 61, 'Cài đặt Windows Terminal', 'https://www.youtube.com/watch?v=egSxAF-Sak4&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=2', 20, 1),
(200, 61, 'Cài Đặt Ubuntu với WSL 1', 'https://www.youtube.com/watch?v=ypvjxw5qBK0&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=3', 11, 2),
(201, 61, 'Update, Upgrade Packages', 'https://www.youtube.com/watch?v=1jsHfX2WomA&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=4', 10, 3),
(202, 62, 'Lệnh ls, cd, clear', 'https://www.youtube.com/watch?v=1UIe8sHXN5c&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=5', 17, 1),
(203, 62, 'Lệnh mkdir, touch, vi', 'https://www.youtube.com/watch?v=ozBhz7il5Ts&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=6', 14, 2),
(204, 62, 'Lệnh cat, echo, tail, grep', 'https://www.youtube.com/watch?v=l5mLKwWjSe8&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=7', 15, 3),
(205, 62, 'Lệnh cp, mv, rm, rmdir', 'https://www.youtube.com/watch?v=ISW0pwn2LY8&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=8', 14, 4),
(206, 62, 'Lệnh sudo, chmod, chown', 'https://www.youtube.com/watch?v=ob3SLQoMJOo&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=9', 33, 5),
(207, 62, 'Lệnh man, wget, apt', 'https://www.youtube.com/watch?v=iCTsqLRDug4&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=10', 11, 6),
(208, 62, 'Lệnh kill, ping, uname, passwd', 'https://www.youtube.com/watch?v=gu8Kj5fHh9g&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=11', 9, 7),
(209, 62, 'Lệnh top, df, free', 'https://www.youtube.com/watch?v=DJe00lKmWxA&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=12', 5, 8),
(210, 62, 'Các mẹo khi gõ lệnh', 'https://www.youtube.com/watch?v=G6_lzrkSqNA&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=13', 5, 9),
(211, 63, 'Cài đặt NodeJS trên Ubuntu', 'https://www.youtube.com/watch?v=9rddrjDkmWo&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=14', 6, 1),
(212, 63, 'Chạy dự án ReactJS', 'https://www.youtube.com/watch?v=aj3HXDfrM2Q&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=15', 4, 2),
(213, 63, 'Chạy dự án ExpressJS', 'https://www.youtube.com/watch?v=MpYEUtbbFSg&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=16', 5, 3),
(214, 63, 'Cài đặt PHP 8 và Composer', 'https://www.youtube.com/watch?v=_Le-We25B0k&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=17', 6, 4),
(215, 63, 'Chạy dự án Laravel trên Ubuntu', 'https://www.youtube.com/watch?v=EHlmj2KDyHU&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=18', 9, 5),
(216, 64, 'SSH vào Server thật', 'https://www.youtube.com/watch?v=ScLOfVwezKU&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=19', 7, 1),
(217, 64, 'Mua tên miền và trỏ về IP Server', 'https://www.youtube.com/watch?v=7RjjF8Ee7Ws&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=20', 6, 2),
(218, 64, 'Thêm người dùng trên Linux', 'https://www.youtube.com/watch?v=CLJSI2xO1Mo&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=21', 8, 3),
(219, 64, 'Deploy dự án HTML với Nginx', 'https://www.youtube.com/watch?v=1sdaPoXWQrw&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=22', 21, 4),
(220, 64, 'Upload source code với Filezilla', 'https://www.youtube.com/watch?v=fvs_wjEd0Ks&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=23', 6, 5),
(221, 64, 'Hướng dẫn cấu hình Subdomain', 'https://www.youtube.com/watch?v=d7kZJhvmuaU&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=24', 10, 6),
(222, 64, 'Hướng dẫn sử dụng Cloudflare #1', 'https://www.youtube.com/watch?v=DqhSe3HcDTU&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=25', 7, 7),
(223, 64, 'Hướng dẫn sử dụng Cloudflare #2', 'https://www.youtube.com/watch?v=t3Ulfmm3eew&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=26', 1, 8),
(224, 64, 'Sử dụng TLS Free của Cloudflare', 'https://www.youtube.com/watch?v=Q_I28ieWJMQ&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=27', 8, 9),
(225, 64, 'Hướng dẫn deploy dự án ReactJS', 'https://www.youtube.com/watch?v=zFwcLLl1gNw&list=PL_-VfJajZj0XGfh528VqhlgXUfzw1Y0N7&index=28', 9, 10),
(226, 65, 'Giới thiệu', 'https://www.youtube.com/watch?v=MGhw6XliFgo&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=1', 1, 1),
(227, 65, 'IIFE là gì?', 'https://www.youtube.com/watch?v=N-3GU1F1UBY&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=2', 23, 2),
(228, 65, 'Scope là gì?', 'https://www.youtube.com/watch?v=5N8vz_VmszE&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=3', 36, 3),
(229, 65, 'Khái niệm Closure?', 'https://www.youtube.com/watch?v=xtQtGKL0NCI&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=4', 40, 4),
(230, 66, 'Hoisting là gì?', 'https://www.youtube.com/watch?v=3MLhU1DrUxM&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=5', 10, 1),
(231, 66, 'Strict mode?', 'https://www.youtube.com/watch?v=w1W-j4cSPF0&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=6', 14, 2),
(232, 66, 'Primitive Types & Reference Types', 'https://www.youtube.com/watch?v=n4tS1Q5-EzY&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=7', 29, 3),
(233, 67, 'Từ khóa \"this\"?', 'https://www.youtube.com/watch?v=ii1Ra_zLDIo&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=8', 25, 1),
(234, 67, 'Fn.bind() method - Phần 1', 'https://www.youtube.com/watch?v=F5z6YoR8of0&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=9', 14, 2),
(235, 67, 'Fn.bind() method - Phần 2', 'https://www.youtube.com/watch?v=6j9b2_E34JM&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=10', 23, 3),
(236, 67, 'Fn.call() method', 'https://www.youtube.com/watch?v=QxLTSdTJDXY&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=11', 20, 4),
(237, 67, 'Fn.apply() method', 'https://www.youtube.com/watch?v=a4FjX4Z-9Rs&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=12', 16, 5),
(238, 68, 'Tìm hiểu về thư viện Redux', 'https://www.youtube.com/watch?v=GQ-toR8F7rc&list=PL_-VfJajZj0U1MSx1IMu13oLJq2nM97ac&index=14', 35, 1),
(239, 68, 'Tự code thư viện build UI', 'https://www.youtube.com/watch?v=RClK-ltP-Bg', 53, 2),
(240, 68, 'Code ứng dụng Todo List', 'https://www.youtube.com/watch?v=UajBbcr8sfc', 74, 3),
(241, 69, 'Giải thích các trường hợp \"phi lý\" trong JavaScript?', 'https://www.youtube.com/watch?v=YFhyq-CMGtY', 21, 1),
(242, 69, '\"Code Thiếu Nhi Battle\" Tranh Giành Trà Sữa Size L', 'https://www.youtube.com/watch?v=sgq7BH6WxL8', 25, 2),
(243, 69, '\"Học Xong\" Javascript Có Giải Được \"Code Thiếu Nhi\"?', 'https://www.youtube.com/watch?v=utF5vj7Ljuo', 37, 3),
(244, 70, 'Responsive là gì?', 'https://www.youtube.com/watch?v=uz5LIP85J5Y&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8', 7, 1),
(245, 70, 'Chúng ta sẽ làm gì?', 'https://www.youtube.com/watch?v=5QT0aeovTTY&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=2', 1, 2),
(246, 70, 'Chuẩn bị công cụ làm việc', 'https://www.youtube.com/watch?v=CIIYogDrGto&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=3', 3, 3),
(247, 71, 'Khái niệm Viewport', 'https://www.youtube.com/watch?v=XJiq_d0vGCQ&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=4', 5, 1),
(248, 71, 'Media query (@media)', 'https://www.youtube.com/watch?v=YgkzJkmDP3U&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=5', 18, 2),
(249, 71, 'Khái niệm Breakpoints?', 'https://www.youtube.com/watch?v=0i37IU0wjlI&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=6', 9, 3),
(250, 71, 'Media queries: Px, rem hay em?', 'https://www.youtube.com/watch?v=aywAr27pkWE&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=7', 4, 4),
(251, 72, 'Học responsive qua thực hành', 'https://www.youtube.com/watch?v=-NK4jLekauw&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=8', 23, 1),
(252, 72, 'Responsive navigation bar', 'https://www.youtube.com/watch?v=HYy4c6lcOlM&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=9', 27, 2),
(253, 73, 'Hệ thống lưới (Grid system)', 'https://www.youtube.com/watch?v=lvD5K50TZPk&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=10', 18, 1),
(254, 73, 'Grid system - Phần 2', 'https://www.youtube.com/watch?v=iKlMB01w47g&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=11', 10, 2),
(255, 73, 'Tạo thư viện?', 'https://www.youtube.com/watch?v=ScZaj1eG7DQ&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=12', 2, 3),
(256, 73, 'Tạo đối tượng Grid', 'https://www.youtube.com/watch?v=SZXvXXb_7aA&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=13', 13, 4),
(257, 73, 'Tạo đối tượng Row', 'https://www.youtube.com/watch?v=9RHKgjuoIPQ&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=14', 13, 5),
(258, 73, 'Tạo đối tượng Column', 'https://www.youtube.com/watch?v=Ck-CnLU7HZI&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=15', 23, 6),
(259, 73, 'Column offset', 'https://www.youtube.com/watch?v=P4LW5HjrOQs&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=16', 8, 7),
(260, 73, 'No gutters', 'https://www.youtube.com/watch?v=u06X297OuFc&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=17', 2, 8),
(261, 74, 'Giới thiệu chương', 'https://www.youtube.com/watch?v=xPwt0rBL-3k&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=18', 3, 1),
(262, 74, 'Sử dụng với các website khác', 'https://www.youtube.com/watch?v=lJworR_9WRk&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=19', 8, 2),
(263, 74, 'Ví dụ dựng layout - Level 1', 'https://www.youtube.com/watch?v=03HYwqbHrF0&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=20', 7, 3),
(264, 74, 'Ví dụ dựng layout - Level 2', 'https://www.youtube.com/watch?v=WREPR84fV80&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=21', 8, 4),
(265, 74, 'Ví dụ dựng layout - Level 3', 'https://www.youtube.com/watch?v=DZNA4oNtjOk&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=22', 15, 5),
(266, 75, 'Những lưu ý', 'https://www.youtube.com/watch?v=QtDvA0MTSCE&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=23', 4, 1),
(267, 75, 'Công tác chuẩn bị', 'https://www.youtube.com/watch?v=lV9mjNIjJXU&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=24', 7, 2),
(268, 75, 'Header search', 'https://www.youtube.com/watch?v=TszF5Cg1VnU&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=25', 16, 3),
(269, 75, 'Cart responsive', 'https://www.youtube.com/watch?v=WdKTFxRE5sE&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=26', 15, 4),
(270, 75, 'Header sort bar', 'https://www.youtube.com/watch?v=kzM8J3GgZso&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=27', 14, 5),
(271, 75, 'Header search', 'https://www.youtube.com/watch?v=kfWv251spNA&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=28', 26, 6),
(272, 75, 'Category product', 'https://www.youtube.com/watch?v=ezOPHqdZIxY&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=29', 20, 7),
(273, 75, 'Mobile / tablet category', 'https://www.youtube.com/watch?v=KFOP0Bt86Es&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=30', 20, 8),
(274, 75, 'Sửa vài lỗi', 'https://www.youtube.com/watch?v=0UuET9nZKxw&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=31', 5, 9),
(275, 75, 'Mobile footer', 'https://www.youtube.com/watch?v=BtK-lwkogfs&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=32', 6, 10),
(276, 75, 'Truy cập từ điện thoại', 'https://www.youtube.com/watch?v=_yM-8DTWMD0&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=33', 7, 11),
(277, 75, 'Sửa vài lỗi - 2', 'https://www.youtube.com/watch?v=_VFUaktkcEU&list=PL_-VfJajZj0VkWYODGeMuraS8V7xaOZM8&index=34', 6, 12);

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
(7, '2025_10_08_122130_update_payments_method_enum', 4),
(8, '2024_01_01_000001_create_payments_table', 5);

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
(47, '958879', 4, 1299000.00, 'cancelled', '2025-11-11 01:08:15'),
(48, '492121', 12, 5000.00, 'cancelled', '2025-11-11 01:12:29'),
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
(66, '254191', 16, 5000.00, 'paid', '2025-12-16 05:00:25'),
(67, '624504', 17, 5000.00, 'paid', '2025-12-21 08:31:02'),
(68, '553413', 19, 5000.00, 'paid', '2026-01-01 10:32:35'),
(69, '789892', 19, 1299000.00, 'cancelled', '2026-01-01 10:37:58'),
(70, '350321', 4, 599000.00, 'cancelled', '2026-01-02 11:00:35'),
(71, '925993', 1, 299000.00, 'cancelled', '2026-01-02 14:09:52'),
(72, '492710', 1, 2499000.00, 'cancelled', '2026-01-02 14:10:49'),
(73, '702547', 4, 199000.00, 'paid', '2026-01-03 07:39:30'),
(74, '205518', 22, 199000.00, 'cancelled', '2026-01-08 03:55:20'),
(75, '42786', 23, 199000.00, 'paid', '2026-01-09 01:16:44'),
(76, '963978', 23, 1299000.00, 'cancelled', '2026-01-09 01:31:36'),
(77, '158750', 4, 2499000.00, 'cancelled', '2026-01-09 03:51:55');

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
(47, 47, 4, 1299000.00),
(48, 48, 2, 5000.00),
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
(66, 66, 2, 5000.00),
(67, 67, 2, 5000.00),
(68, 68, 2, 5000.00),
(69, 69, 4, 1299000.00),
(70, 70, 7, 599000.00),
(71, 71, 2, 299000.00),
(72, 72, 8, 2499000.00),
(73, 73, 9, 199000.00),
(74, 74, 9, 199000.00),
(75, 75, 9, 199000.00),
(76, 76, 4, 1299000.00),
(77, 77, 8, 2499000.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_data` text DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'Giới thiệu & làm quen Javascript', 1),
(2, 3, 'Bắt đầu', 1),
(3, 2, 'Giới thiệu & tổng quan về SASS', 1),
(4, 2, 'Môi trường & cấu hình SASS', 2),
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
(16, 2, 'SASS & CSS extension', 3),
(17, 2, 'Biến (variables) & kiểu dữ liệu', 4),
(18, 2, 'Cấu trúc điều khiển & biểu thức', 5),
(19, 2, 'Function trong SASS', 6),
(21, 1, 'Biến và kiểu dữ liệu', 2),
(22, 1, 'Toán tử và biểu thức', 3),
(23, 1, 'Cấu trúc điều khiển và vòng lặp', 4),
(24, 1, 'Xử lý lỗi', 5),
(25, 1, 'Number trong JavaScript', 6),
(26, 1, 'Array (mảng)', 7),
(27, 3, 'Làm quen với HTML', 2),
(28, 3, 'Làm quen với CSS', 3),
(29, 3, 'Đệm, viền và khoảng lề', 4),
(30, 3, 'Thuộc tính tạo nền', 5),
(31, 3, 'Thuộc tính vị trí', 6),
(32, 3, 'Dựng bố cục với Flexbox', 7),
(33, 6, 'Giới thiệu', 1),
(34, 6, 'Ôn lại ES6+', 2),
(35, 6, 'React, ReactDOM', 3),
(36, 6, 'JSX, Components, Props', 4),
(37, 6, 'Create React App', 5),
(38, 6, 'Hooks', 6),
(39, 6, 'CSS, SCSS và CSS modules', 7),
(40, 7, 'Bắt đầu', 1),
(41, 7, 'Kiến thức cốt lõi', 2),
(42, 7, 'Xây dựng website', 3),
(43, 11, 'Giới thiệu', 1),
(44, 11, 'Biến, comments, built-in', 2),
(45, 11, 'Toán tử, kiểu dữ liệu', 3),
(46, 11, 'Làm việc với hàm', 4),
(47, 11, 'Làm việc với chuỗi', 5),
(48, 11, 'Làm việc với số', 6),
(49, 11, 'JSON, Fetch, Postman', 7),
(50, 12, 'Giới thiệu', 1),
(51, 12, 'Biến và kiểu dữ liệu', 2),
(52, 12, 'Cấu trúc điều khiển và vòng lặp', 3),
(53, 12, 'Mảng', 4),
(54, 12, 'String', 5),
(55, 12, 'Hàm', 6),
(56, 12, 'Con trỏ', 7),
(57, 12, 'Struct', 8),
(58, 12, 'Làm việc với file', 9),
(59, 12, 'Hướng đối tượng (OOP)', 10),
(60, 10, 'Giới thiệu', 1),
(61, 10, 'Windows Terminal & WSL', 2),
(62, 10, 'Các lệnh Linux cơ bản', 3),
(63, 10, 'Chạy dự án React, Node, Laravel', 4),
(64, 10, 'Deploy dự án với Server thật', 5),
(65, 8, 'IIFE, Scope, Closure', 1),
(66, 8, 'Hoisting, Strict Mode, Data Types', 2),
(67, 8, 'This, Bind, Call, Apply', 3),
(68, 8, 'Các bài thực hành cần nhiều tư duy', 4),
(69, 8, 'Vừa giải trí vừa học', 5),
(70, 9, 'Bắt đầu', 1),
(71, 9, 'Viewport, @media, breakpoint', 2),
(72, 9, 'Thực hành nhỏ', 3),
(73, 9, 'Grid system', 4),
(74, 9, 'Áp dụng vào thực tế', 5),
(75, 9, 'Responsive web Shopee', 6);

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
('gCng7ZnoqFLcS5nnNLjhySHSrXYXfGYd03u4vTGa', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieDFFakh5c0thQUxDbVhPaURTR2NwcGQ4bkRINFhoNU1WMlBlaHdQdCI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767931616),
('vH7uH1pEdUE9WPmzEwPeci6nfMMJHcvqWVphfPFp', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVDY5dnJxZFRYblpIa3ZUTzhLWU53SE14d3ZmRkUyNzJ2RFp5WEVvQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1767933206);

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
(13, 'Trần Thị Yến Nhi', '110122133@st.tvu.edu.vn', '$2y$12$eXWqCPfjPWV/D9GDpgnWH.Lorw/7iPpDLfi9ysrGMhQwXq8rnQf06', 'student', '2025-11-17 09:35:01'),
(14, 'Nguyễn Trang', 'nguyentrang@gmail.com', '$2y$12$rfylkerkPK0hbM9mYEcZ4OogxwC1WWSkcEz3KYWLd0HH6WVRzCqh6', 'student', '2025-12-02 06:31:08'),
(15, 'Minh Nguyễn', 'nguyenminh@gmail.com', '$2y$12$XRm5khj2qmu8/3jFQV6ZWu/WO1vLNAem1Q8LPDBA.khnbSFjzYxlC', 'student', '2025-12-02 13:35:24'),
(16, 'Nguyễn An', 'nguyenan@gmail.com', '$2y$12$4h4i6Ef7Jss9RprOyom1WO2CqiCL7HjSAzQJuxyMY5UDuwcay7X3O', 'student', '2025-12-16 05:00:18'),
(17, 'Trần Minh', 'tranminh@gmail.com', '$2y$12$yaB5khRfA5XNn5q0oAThEO6A.SbQzez166XxO0rc1gRmCZyu.CNu6', 'student', '2025-12-21 08:30:48'),
(18, 'Nguyễn Long', 'nguyenvanlong@gmail.com', '$2y$12$x3IBtPO5fXPQ1YamZQNQJuy/rIp55SjvUtPKLW5GLXG7S/foN4nSK', 'student', '2026-01-01 09:41:56'),
(19, 'Dan Dan', 'dan@gmail.com', '$2y$12$uSTbiWF1GxPojFb1yAScHODJLeuPvTiseXgYHVuveRFSRejsZmTfm', 'student', '2026-01-01 10:32:29'),
(20, 'Trần Thanh Hiếu', 'tranthanhhieu@gmail.com', '$2y$12$J7XiYKK02bmakUtUGEE.Cuo3c8PcuyJ6KKHIdCLkQhN1W8ZRXuDe2', 'instructor', '2026-01-02 07:00:18'),
(21, 'Trần Văn Huy', 'tranvanhuy@gmail.com', '$2y$12$w1eWKt5YJHqqEgbevUzRteesfViYPRNfX82Iq2BUO.XWi6e62S8OK', 'instructor', '2026-01-02 10:56:29'),
(22, 'Lê Văn An', 'levanan@gmail.com', '$2y$12$Io8mDyaQoCzGu3HZa64Tau.QIcbwdJJTAQKUmkx4HToPM3Dne4NaS', 'student', '2026-01-08 03:54:59'),
(23, 'Trần Minh Đức', 'tranminhduc@gmail.com', '$2y$12$hXY5/GEd4hRHlQrDM2qH..TsfloKMaVdXTTSql8a4Az.F8D/C2FVu', 'student', '2026-01-09 01:16:35'),
(24, 'Khôi Nguyên', 'khoinguyen2712@gmail.com', '$2y$12$3jBFO04mdGno7nqTIGf9/.zZSxAMdt5NO0EsFLfV/hpO1old3.cVe', 'student', '2026-01-09 04:25:00');

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
(4, 4, 4, 1, '2025-10-17 00:05:51'),
(6, 4, 7, 1, '2026-01-02 07:27:18'),
(7, 4, 8, 1, '2026-01-02 07:27:24'),
(8, 4, 5, 1, '2026-01-02 10:46:04'),
(9, 4, 6, 1, '2026-01-02 11:08:32'),
(10, 4, 25, 1, '2026-01-02 11:08:33'),
(11, 4, 26, 1, '2026-01-02 11:08:34'),
(12, 4, 27, 1, '2026-01-02 11:08:39'),
(13, 4, 28, 1, '2026-01-02 11:08:40'),
(14, 4, 29, 1, '2026-01-02 11:08:42'),
(15, 4, 30, 1, '2026-01-02 11:08:43'),
(16, 4, 31, 1, '2026-01-02 11:08:49'),
(17, 4, 32, 1, '2026-01-02 11:08:50'),
(18, 4, 33, 1, '2026-01-02 11:08:51'),
(19, 4, 34, 1, '2026-01-02 11:08:52'),
(20, 4, 35, 1, '2026-01-02 11:08:54'),
(21, 4, 37, 1, '2026-01-02 11:09:01'),
(22, 4, 36, 1, '2026-01-02 11:09:02'),
(23, 4, 38, 1, '2026-01-02 11:09:05'),
(24, 4, 244, 1, '2026-01-09 04:30:48');

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
  ADD KEY `payments_order_id_index` (`order_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `course_enrollments`
--
ALTER TABLE `course_enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
