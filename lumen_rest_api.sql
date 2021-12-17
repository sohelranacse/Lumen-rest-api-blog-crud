-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2021 at 05:45 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumen_rest_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_12_17_060550_create_posts_table', 1),
(2, '2021_12_17_081406_create_user_table', 2),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(6, '2016_06_01_000004_create_oauth_clients_table', 3),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, NULL, 'Lumen Personal Access Client', 'SVuvGKp9UVE1WQhbhU5tV9udrzUq5wGsMn4VwiXv', NULL, 'http://localhost', 1, 0, 0, '2021-12-17 08:31:47', '2021-12-17 08:31:47'),
(2, NULL, 'Lumen Password Grant Client', 'wV4cIAnS7H3ZSqxmatGe2qVrSWfjJF1PDCrlARcO', 'users', 'http://localhost', 0, 1, 0, '2021-12-17 08:31:47', '2021-12-17 08:31:47'),
(3, NULL, 'Lumen Personal Access Client', '6cb5O4X4uwmzrb75upPauJDks92sHmMRWYcSz7Hg', NULL, 'http://localhost', 1, 0, 0, '2021-12-17 11:56:40', '2021-12-17 11:56:40'),
(4, NULL, 'Lumen Password Grant Client', 'zMkLQ6rdD7zuzwId4ErlZagQCcFeTyghKmDewYbQ', 'users', 'http://localhost', 0, 1, 0, '2021-12-17 11:56:40', '2021-12-17 11:56:40');

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
(1, 1, '2021-12-17 08:31:47', '2021-12-17 08:31:47'),
(2, 3, '2021-12-17 11:56:40', '2021-12-17 11:56:40');

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

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('02815f9ef0467fbd8dfc02157a8fee5e246090f9e85b36d1ff077190a03591c61c7ddfe784be0d6e', 'f37aaab3e6568baba835e66ea578ab3d2cb0b55b1a177efa4f16e8344087d358601967924f21d76d', 0, '2022-12-17 12:27:36'),
('0458734f75d15244e4c6410573c5ac878a9b0173a0648de0f0816cafcb0acc577d385c95ad2fbb20', 'afceb590db2b79f995433f3ffadc98d16561706ac5d3d07d5e102e8936ec61009c12a143256b8736', 0, '2022-12-17 11:57:55'),
('6bcb32675d308b4ef46ef0dcaeb783e36330fe5e6b953ffe77933cd4ed4522a361bee3b63cd78b29', '0d9fe55752b15d4d605387a71274f06a6413a728907b21aca8f3f0b3339add13646261813a837148', 0, '2022-12-17 12:15:10'),
('a9ef2e11159c85483e1b864a62b6201578717402011b64f973a9d313a78959cf2b1f5179fb282031', '6fef18a46ea9a76dc4014e097ac775cb5c8ef4090812246276e0aeca0cb8204827f8d34296a7534a', 0, '2022-12-17 11:58:11'),
('b8d2cf86bc92bfa1fd98a6a3aed67b81f872a652538a7d381e6f9019dd09627d98fc4e5545bd22c2', '20b0f52fa0a7ca4add7951c2468a6755d158c1e70e1d54b64394219547e388a46a990c173e39df83', 0, '2022-12-17 11:59:28'),
('d3c9f2ee70fec873e1580929f41378e4131840984ced0c441b162c5a45126073e7d34ab51775d2f6', '661e5970cdd9e00759ef6afb4ee85eb8ff1c5c5c20c276665e8738aba4e1b8603cf280bf6f351692', 0, '2022-12-17 11:57:34'),
('df662911f5f72cbf84a5f86aa992d92f4ef81b2e4157a52d281a21e25c0efbf90e27cf36afe2a079', 'ffc2b37dea230a7f3745b296be33f7e220d5b579039bec5b7a5db04b4ea5d62496264bbfd671a3d0', 0, '2022-12-17 08:53:47'),
('f95fbf639f0d71d5d9ba1fc0cb4e70e41229019013779023edd4806e21a38825467ac8d598b6da12', 'd62fa56ee39482c391a12251f488adf49987cb9aa472d4d629333ede50d79c08b51b8ecaca0ab547', 0, '2022-12-17 12:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Ullam et ea voluptates vero.', 'Nemo sit nulla sint facere quo temporibus et. Quidem autem aut eos tempore dolor mollitia velit. Assumenda illum commodi autem. Fuga atque quis qui aliquam praesentium sit enim.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(4, 'Repellat sapiente accusamus dolore aut molestias voluptatem quia provident.', 'Aliquam non ad qui nulla nemo ad. Ea explicabo velit aspernatur libero. Maxime quasi dolores sit aliquid. Quia qui totam consectetur sit.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(5, 'Rerum mollitia ea facilis voluptatem ut ut ullam.', 'Quaerat tempore maiores fugit provident velit. Ut perspiciatis debitis impedit iure et deleniti. Mollitia molestias illo minima et quaerat qui placeat odio.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(6, 'Reiciendis adipisci illum odit.', 'Tempora autem temporibus ullam ut ut corrupti quaerat. In possimus cumque minus voluptas velit magni. Illum porro expedita sapiente est.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(7, 'Amet maxime aut iste nihil.', 'Consectetur quidem qui repellendus non laborum repellendus autem harum. Aut reprehenderit illum ut asperiores perspiciatis. Aut et commodi quas omnis.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(8, 'Rem voluptatem nesciunt praesentium quidem debitis.', 'Atque alias illum aperiam rerum. Tempore quis deleniti quibusdam nam dolor ut ducimus. Ut eum occaecati quidem sit aut voluptatem. Aut rerum eos consectetur ut. Maiores aut quam debitis tempora voluptate.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(9, 'Repellat veritatis totam iure facilis aperiam minus excepturi.', 'Ut omnis consequatur vitae. Neque provident doloribus amet quaerat minus dolorem. Aut dignissimos nemo corporis suscipit.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(10, 'Commodi tenetur quis non numquam quod autem nostrum.', 'Qui sint sit atque qui consequuntur fuga autem. Ducimus eveniet corrupti repellendus quia ratione itaque accusamus.', '2021-12-17 06:31:42', '2021-12-17 06:31:42'),
(11, 'Sohel Rana Title', 'Post body', '2021-12-17 06:49:21', '2021-12-17 07:49:47'),
(12, '1st post title', '1st Post body', '2021-12-17 06:53:51', '2021-12-17 07:54:40'),
(14, '3rd post title here', '3rd post descriptio here', '2021-12-17 07:53:58', '2021-12-17 07:53:58'),
(15, 'Ducimus nam inventore nihil voluptatem sunt.', 'Voluptatem ut voluptas dolorem aut dolorum ut occaecati ea. Similique quisquam ut quis sequi porro tenetur minima fugit. Dignissimos cumque aut id in. Fuga laboriosam dolorum voluptas et animi neque.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(16, '6th post changes', '6th Post body changes', '2021-12-17 08:48:45', '2021-12-17 16:02:39'),
(17, 'Nisi excepturi ducimus reiciendis dolorem et deserunt.', 'Odit dicta ab est magnam odio perferendis officiis doloribus. Velit excepturi doloribus et cum. Quia voluptas adipisci perferendis incidunt earum nihil.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(18, 'Aut officia dignissimos est sit et officiis adipisci.', 'Soluta eaque error minus autem veritatis minus. Ut velit cum quisquam dolores. Doloribus voluptatem ut ad maxime.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(19, 'Dolor rerum vel id qui dolorum quia a adipisci.', 'Placeat sit exercitationem minima aut vel in illum consequatur. Ut laborum beatae voluptates dolorum natus perspiciatis. Qui ut architecto culpa quaerat. Nisi cupiditate accusamus officia recusandae qui aspernatur dolorem.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(20, 'Fugiat suscipit et qui ipsam provident dolorem.', 'Illum iusto sint dolorem sint praesentium. Animi dicta aut voluptatem et in atque et laudantium.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(21, 'Eum et vel aperiam.', 'Inventore quasi autem laborum esse reprehenderit quos dolores. Ullam expedita ut nesciunt modi nam. Reprehenderit in dolorem minus eos voluptate numquam ratione fuga.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(22, 'Rerum reprehenderit voluptatem perferendis accusamus.', 'Dolores quas deleniti voluptas vel libero. Numquam velit commodi sed aliquid enim maxime maxime. Accusamus fuga repudiandae sapiente ea sequi nihil. Necessitatibus dolorum est laboriosam aut.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(23, 'Nihil facere earum voluptates rerum aut id blanditiis excepturi.', 'Quod dolor culpa voluptas porro aut. Sunt dolores quos provident cupiditate iste eligendi rem. Hic quo odio sapiente tempora labore odit. Quasi voluptas nisi nihil aut.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(24, 'Quos et quasi nulla quo sed autem est.', 'Id dolorem necessitatibus in ut id labore enim excepturi. Optio ut fuga eaque in incidunt. Ut consequuntur eum amet officia reiciendis aut.', '2021-12-17 08:48:45', '2021-12-17 08:48:45'),
(25, '4th post title here', '4th post descriptio here', '2021-12-17 11:56:05', '2021-12-17 11:56:05'),
(26, '5th post title here', '5th post descriptio here', '2021-12-17 13:45:12', '2021-12-17 13:45:12'),
(27, '6th post title here', '6th post descriptio here', '2021-12-17 16:01:54', '2021-12-17 16:01:54'),
(28, '6th post title here', '6th post descriptio here', '2021-12-17 16:44:11', '2021-12-17 16:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Carolanne Lakin', 'caufderhar@example.org', '$2y$10$6IUfONzKwmddfIO408MDN.m0cIb5m.1nBmYWCyaAuzBXalDITrw1a', '2021-12-17 08:48:57', '2021-12-17 08:48:57'),
(3, 'Estel Douglas', 'isadore.schaden@example.com', '$2y$10$qZcZJZ4R4Q09XmDMxfXkXOtOdBIinoY1RH9PfqLN6caf89xrdaN0u', '2021-12-17 08:48:57', '2021-12-17 08:48:57'),
(4, 'Brandt Nitzsche', 'peyton33@example.org', '$2y$10$1AVe1ZTuEOdB35mA8XhD7ONfboteOU8ZJcXJ7Q45zzxxGoyVKgtIG', '2021-12-17 08:48:57', '2021-12-17 08:48:57'),
(5, 'Ceasar Hilpert', 'auer.clare@example.com', '$2y$10$nzes977TpUjrkKT.RAx9zuJH8wY3/q9Hoj/2yLOA/sa0r10zdjbI.', '2021-12-17 08:48:57', '2021-12-17 08:48:57'),
(6, 'Mr. Blaise Schaden', 'shickle@example.org', '$2y$10$fTrhUfiwTISf9/bnZk.ToelYmCAuW2JGBaYIJjpIzEzUX64USopuO', '2021-12-17 08:48:57', '2021-12-17 08:48:57'),
(7, 'Sohel Rana', 'sohel@example.org', '$2y$10$F6ifVpO/aI.Z/UWFEIa.u.Zv479l2Cl6tCwGBFxQojprVCKD9gWXK', '2021-12-17 12:50:52', '2021-12-17 12:50:52'),
(8, 'Rabeya Rana', 'rabeya@example.org', '$2y$10$69AWf2x9d.5LbZQC6H/1eOAQIBxaqE7dv18H9HIty7/hYTOrrPgNS', '2021-12-17 13:40:51', '2021-12-17 13:40:51'),
(9, 'Samiul Islam', 'samiul@gmail.com', '$2y$10$jGo7HNzczK9wX.G6u7O0deOx0NuFy1kugUkB2HHubs0Amzod4Nj.y', '2021-12-17 16:38:19', '2021-12-17 16:38:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
