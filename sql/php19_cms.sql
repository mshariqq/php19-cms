-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 24, 2024 at 04:13 PM
-- Server version: 10.11.8-MariaDB
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php19_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP Scripts', 'php-scripts', '2024-07-24 15:18:19', '2024-07-24 15:32:44'),
(2, 'Themes', 'themes', '2024-07-24 15:18:26', '2024-07-24 15:32:47'),
(3, 'Mobile App scripts', 'mobile-app-scripts', '2024-07-24 15:18:39', '2024-07-24 15:32:56');

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
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `meta_kw` tinytext DEFAULT NULL,
  `meta_desc` tinytext DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `content` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `thumbnail` varchar(250) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `meta_kw`, `meta_desc`, `parent`, `user_id`, `status`, `content`, `created_at`, `updated_at`, `thumbnail`, `count`, `views`) VALUES
(1, 'PHP19 - Free php scripts, html themes, wordpress themes and plugins', '/', 'php19, php scripts, html themes, wordpress plugins', 'A free platform for developers, entrepreneurs by shariqq ahmed from India', 0, 1, 'published', NULL, '2024-07-24 13:19:37', '2024-07-24 15:00:00', NULL, 0, 0),
(2, 'About', 'about', 'php19 about, about', 'about us page', 0, 1, 'published', '<p><strong>Hey, welcome to about us page</strong></p>', '2024-07-24 14:41:55', '2024-07-24 15:38:45', NULL, 0, 2),
(4, 'Disclaimer', 'disclaimer', NULL, 'The information provided on this blog is for general informational purposes only. All content, including text, images, and other material, is not intended to constitute professional advice', 0, 1, 'published', '<p><strong>Disclaimer:</strong></p>\r\n\r\n<p>The information provided on this blog is for general informational purposes only. All content, including text, images, and other material, is not intended to constitute professional advice. Readers are advised to seek professional guidance and conduct their own research before making any decisions based on the information provided.</p>\r\n\r\n<p>While we strive to provide accurate and up-to-date information, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the blog or the information, products, services, or related graphics contained on the blog for any purpose.</p>\r\n\r\n<p>Any reliance you place on such information is therefore strictly at your own risk. In no event will we be liable for any loss or damage including without limitation, indirect or consequential loss or damage, or any loss or damage whatsoever arising from loss of data or profits arising out of, or in connection with, the use of this blog.</p>\r\n\r\n<p>Through this blog, you are able to link to other websites that are not under our control. We have no control over the nature, content, and availability of those sites. The inclusion of any links does not necessarily imply a recommendation or endorse the views expressed within them.</p>\r\n\r\n<p>Every effort is made to keep the blog up and running smoothly. However, we take no responsibility for, and will not be liable for, the blog being temporarily unavailable due to technical issues beyond our control.</p>\r\n\r\n<hr />\r\n<h3>Explanation:</h3>\r\n\r\n<ul>\r\n	<li><strong>Purpose</strong>: Clearly states the purpose of the disclaimer, which is to provide guidance and information, not professional advice.</li>\r\n	<li><strong>Content</strong>: Covers various aspects including accuracy of information, reliance on content, external links, and website availability.</li>\r\n	<li><strong>Liability</strong>: Disclaims liability for any loss or damage arising from the use of the blog or reliance on its content.</li>\r\n	<li><strong>Links</strong>: Warns about external links and disclaims responsibility for their content.</li>\r\n	<li><strong>Availability</strong>: Acknowledges potential technical issues that may affect blog accessibility.</li>\r\n</ul>\r\n\r\n<h3>Usage:</h3>\r\n\r\n<ul>\r\n	<li>Adjust the disclaimer text to fit the specific context and legal requirements of your blog or website.</li>\r\n	<li>Ensure the disclaimer is prominently displayed and easily accessible to visitors, typically in the footer or sidebar of your website.</li>\r\n	<li>Consult with legal professionals to ensure compliance with relevant laws and regulations, especially if your blog provides specific advice or information in regulated industries.</li>\r\n</ul>', '2024-07-24 14:49:36', '2024-07-24 15:38:35', NULL, 0, 1),
(5, 'Privacy Policy', 'privacy-policy', 'php19 policy', 'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website [https://www.php19.com] (the \"Site\").', 0, 1, 'published', '<p><strong>Privacy Policy for php19</strong></p>\r\n\r\n<p>Effective Date: 24 July 2024</p>\r\n\r\n<p><strong>Introduction</strong></p>\r\n\r\n<p>php19 (&quot;we&quot;, &quot;us&quot;, &quot;our&quot;) is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website [<a href=\"https://www.php19.com\" rel=\"noreferrer\" target=\"_new\">https://www.php19.com</a>] (the &quot;Site&quot;). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the Site.</p>\r\n\r\n<p><strong>Information We Collect</strong></p>\r\n\r\n<p>We may collect personal information from you when you visit our Site, including:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Personal Information</strong>: Such as your name, email address, and any other information you voluntarily provide to us through contact forms or when subscribing to our newsletter.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Non-Personal Information</strong>: Such as browser type, language preference, referring site, and the date and time of each visitor request.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>How We Use Your Information</strong></p>\r\n\r\n<p>We may use the information we collect in the following ways:</p>\r\n\r\n<ul>\r\n	<li>To operate and maintain our Site.</li>\r\n	<li>To send you administrative communications, such as updates on policies or service changes.</li>\r\n	<li>To respond to your comments or inquiries.</li>\r\n	<li>To provide you with information, products, or services that you request from us.</li>\r\n	<li>To improve our Site and enhance your experience.</li>\r\n</ul>\r\n\r\n<p><strong>Disclosure of Your Information</strong></p>\r\n\r\n<p>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. This does not include trusted third parties who assist us in operating our website, conducting our business, or servicing you, as long as those parties agree to keep this information confidential.</p>\r\n\r\n<p><strong>Third-Party Links and Tools</strong></p>\r\n\r\n<p>Our Site may contain links to third-party websites or tools. These third-party sites have separate and independent privacy policies. We have no responsibility or liability for the content and activities of these linked sites. Nonetheless, we seek to protect the integrity of our Site and welcome any feedback about these sites.</p>\r\n\r\n<p><strong>Security of Your Information</strong></p>\r\n\r\n<p>We use administrative, technical, and physical security measures to help protect your personal information. Despite these measures, no method of transmission over the Internet or electronic storage is completely secure, so we cannot guarantee absolute security.</p>\r\n\r\n<p><strong>Children&#39;s Privacy</strong></p>\r\n\r\n<p>Our Site is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from anyone under the age of 13. If we learn that we have collected personal information from a child under age 13 without verification of parental consent, we will delete that information as quickly as possible.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>We may update this Privacy Policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal, or regulatory reasons. We encourage you to periodically review this page for the latest information on our privacy practices.</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions about this Privacy Policy, please contact us at [insert contact email].</p>\r\n\r\n<hr />\r\n<h3>Notes:</h3>\r\n\r\n<ul>\r\n	<li><strong>Customization</strong>: Replace placeholders like &quot;[Insert Effective Date]&quot; and &quot;[insert contact email]&quot; with actual dates and contact information relevant to your website.</li>\r\n	<li><strong>Legal Advice</strong>: Consider seeking legal advice to ensure compliance with applicable laws and regulations, especially if your website collects sensitive personal information or operates in regulated jurisdictions.</li>\r\n	<li><strong>Transparency</strong>: Ensure your Privacy Policy is easily accessible to users, typically linked in the footer of your website.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', '2024-07-24 15:15:47', '2024-07-24 16:00:19', NULL, 0, 1),
(6, 'Contact Us', 'contact-us', 'php19 contact us, contact us', 'php19 contact information, the author has given enough information to contact, we are always here to help you', 0, 1, 'published', '<p>Email: help@php19.com<br />\r\nPhone: +91 950 28 44 949<br />\r\nYoutube channel : PHP19<br />\r\nLinkedin: <a href=\"https://www.linkedin.com/in/muhammed-shariq-ahmed-78199b158/\"><strong>OPEN</strong></a></p>', '2024-07-24 15:18:33', '2024-07-24 15:42:09', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `download_link` tinytext DEFAULT NULL,
  `status` varchar(50) DEFAULT 'draft',
  `user_id` int(11) NOT NULL,
  `thumbnail` varchar(250) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `parent`, `name`, `slug`, `keywords`, `description`, `content`, `download_link`, `status`, `user_id`, `thumbnail`, `views`, `downloads`, `likes`, `category_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(3, 0, 'Xilancer – Freelancer Marketplace Platform with Services & Projects', 'free-download-bootstrap-admin-template', 'free download, php scripts, bootstrap admin theme', 'Welcome to Xilacner, your comprehensive solution for building a dynamic and efficient freelance marketplace. Crafted with the powerful Laravel framework, Xilacner is designed to cater to both freelancers and clients', NULL, 'https://google.com', 'public', 1, 'https://codecanyon.img.customer.envatousercontent.com/files/477401384/Xilancer+Cover.png?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=300&s=d3430dabb5b1951d7031a48620ff2228', 0, 0, 0, 1, 2, '2024-07-24 16:33:08', '2024-07-24 17:59:56'),
(4, 0, 'Free download best bootstrap admin template made by codecanyon', 'free-download-bootstrap-admin-template', 'free download, php scripts, bootstrap admin theme', 'Free download the best bootstrap admin template theme worth of $50 for free', NULL, 'https://google.com', 'public', 1, 'https://img.freepik.com/free-photo/abstract-paint-background-with-multi-colored-watercolor-painting-generated-by-ai_188544-15558.jpg', 0, 0, 0, 1, 2, '2024-07-24 16:33:08', '2024-07-24 16:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `tag_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2024-07-24 17:30:32', '2024-07-24 17:47:23'),
(2, 1, 3, '2024-07-24 17:30:38', '2024-07-24 17:47:20'),
(3, 2, 4, '2024-07-24 17:50:07', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('MEyhbtd3ugR8eIkKWFPm3xr9PUpGILZhBoDEi5tA', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEJhdm9YemE2d2hNUXNLM2MzSXdTT2MxaFZibHdlSFhaaVI3VFNiaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1721837554);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `tag` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Free Downloads', 'free-downloads', '2024-07-24 15:20:28', '2024-07-24 17:53:06'),
(2, 'College projects', 'college-projects', '2024-07-24 15:20:35', '2024-07-24 15:35:02'),
(5, 'ecommerce', 'ecommerce', '2024-07-24 16:08:50', '2024-07-24 16:08:50'),
(6, 'business', 'business', '2024-07-24 16:08:57', '2024-07-24 16:08:57'),
(7, 'Tools', 'tools', '2024-07-24 16:09:03', '2024-07-24 16:09:03'),
(8, 'Plugins', 'plugins', '2024-07-24 16:09:12', '2024-07-24 16:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `upwork` varchar(250) DEFAULT NULL,
  `github` varchar(250) DEFAULT NULL,
  `linkedin` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `facebook` varchar(250) DEFAULT NULL,
  `instagram` varchar(250) DEFAULT NULL,
  `youtube` varchar(250) DEFAULT NULL,
  `discord` varchar(250) DEFAULT NULL,
  `stack_overflow` varchar(250) DEFAULT NULL,
  `bio` tinytext DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `upwork`, `github`, `linkedin`, `created_at`, `updated_at`, `twitter`, `facebook`, `instagram`, `youtube`, `discord`, `stack_overflow`, `bio`, `photo`) VALUES
(1, 'shariqq ahmed khan', 'admin@email.com', 'admin', NULL, '$2y$12$jYHLQfRtWuhy.UJ3l4TjNu6wfh1F5pZ/Y.QRo0MYZAHGNB.m8tuJC', NULL, 'https://www.upwork.com/freelancers/~0142acdc12184086c7', 'https://github.com/mshariqq', 'https://www.linkedin.com/in/muhammed-shariq-ahmed-78199b158/', '2024-07-24 01:32:44', '2024-07-24 01:32:44', NULL, NULL, NULL, NULL, NULL, NULL, 'Founder of php19 <br>\r\n                Hi, i have been working as Full Stack developer since 2016, 8 years of exp in full stack development', 'https://php19.com/wp-content/uploads/2024/02/dp.png');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
