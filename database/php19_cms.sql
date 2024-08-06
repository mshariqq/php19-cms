-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 06, 2024 at 06:42 PM
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
  `views` int(11) DEFAULT 0,
  `downloads` int(11) DEFAULT 0,
  `likes` int(11) DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `tag_id` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `parent`, `name`, `slug`, `keywords`, `description`, `content`, `download_link`, `status`, `user_id`, `thumbnail`, `views`, `downloads`, `likes`, `category_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(3, 0, 'Xilancer – Freelancer Marketplace Platform with Services & Projects', 'free-download-bootstrap-admin-template', 'free download, php scripts, bootstrap admin theme', 'Welcome to Xilacner, your comprehensive solution for building a dynamic and efficient freelance marketplace. Crafted with the powerful Laravel framework, Xilacner is designed to cater to both freelancers and clients', 'SumoWebTools is a web tools script that provides free internet tools useful in daily online activities. It supports multi-language, making it easy to customize the language you want with just a few taps.\n\nThis script is built on Bootstrap v5, supports Light and Dark modes, and supports LTR and RTL layouts. With more than 150 commonly used web tools on the internet, it will help you quickly get approved for Google Adsense.\n\nOptimized for Page Speed Insights\nSumoWebTools has been optimized for performance according to the standards set by Google Page Speed Insights. This specialized script targets the critical factors that affect your site’s speed and overall user experience, making it an invaluable asset for your web optimization efforts.\n\nOptimize for PageSpeed Insights\n\nOptimized for GTmetrix\nWhat truly differentiates the SumoWebTools is its adaptability. It’s constructed to stay on par with the continuous evolution of web optimization standards and accommodate performance metrics updates. This ensures your website remains in line with the best practices in web speed optimization. This script can significantly improve your website’s performance and ranking on search engines.\n\nOptimize for GTmetrix\n\nFrontend – Light Theme – LTR\nThe front end is fully responsive with a modern interface and works perfectly with the latest Chrome, Firefox, Safari, Opera, Edge, Electron, Brave, Vivaldi, and mobile browsers. It will provide an enjoyable experience for you as well as your customers.\n\nFrontend - Light Theme - LTR\n\nFrontend – Dark Theme – LTR\nFrontend - Dark Theme - LTR\n\nFrontend – Light Theme – RTL\nFrontend - Light Theme - RTL\n\nFrontend – Dark Theme – RTL\nFrontend - Dark Theme - RTL\n\nAdmin Dashboard – Light Theme – LTR\nThe Admin Dashboard aggregates all the customizations. You will easily navigate to any component you want to customize in just a few seconds.\n\nAdmin Dashboard - Light Theme - LTR\n\nAdmin Dashboard – Light Theme – RTL\nAdmin Dashboard - Light Theme - RTL\n\nAdmin Dashboard – Dark Theme – LTR\nAdmin Dashboard - Dark Theme - LTR\n\nAdmin Dashboard – Darl Theme – RTL\nAdmin Dashboard - Dark Theme - RTL\n\nWe are keen to release continuous long-term updates, and dozens of new features will be coming soon in future releases. Once you purchased SumoWebTools, you will be entitled to a free download of all future updates for the same license.\n\nDemos:\nHomepage: https://sumowebtools.themeluxury.com\nAdmin Dashboard: https://sumowebtools.themeluxury.com/admin/dashboard\nUsername: demo@themeluxury.com\nPassword: password\nSumoWebTools Features:\nMulti-language Support\nBootstrap v5\nLight / Dark Mode\nLTR / RTL Support\nGoogle Adsense Approved\nOne Click Demo Data Import\nAdmin Dashboard Ready\nMaintenance Mode Support\nAdblock Detection Support\nAutomatic Language Detection Support\nLink Redirect Support\nModern Design\n100% Responsive\nSEO Friendly\nSPA (Single Page Application)\nGDPR Compliant\nSocial Media Ready\nUnlimited Typography Options\nEasily Customizable from Admin Dashboard\nEasily Add Any New Language With One Click\nAutomatic Sitemap\nFast, Lightweight & Powerful\nFree Google Fonts\nUnlimited Font Awesome\nWell Commented Code\nDeveloper Friendly\nBrowser Compatibility\nEasily Customizable\nFree Updates\nPremium Support\nOnline Documentation\n', 'https://google.com', 'public', 1, 'https://codecanyon.img.customer.envatousercontent.com/files/477401384/Xilancer+Cover.png?auto=compress%2Cformat&fit=crop&crop=top&w=590&h=300&s=d3430dabb5b1951d7031a48620ff2228', 12, 0, 0, 1, 2, '2024-07-24 16:33:08', '2024-07-28 14:49:32'),
(4, 0, 'Free download best bootstrap admin template made by codecanyon', 'post-22', 'post22', 'Free download the best bootstrap admin template theme worth of $50 for free', NULL, 'https://google.com', 'public', 1, 'https://img.freepik.com/free-photo/abstract-paint-background-with-multi-colored-watercolor-painting-generated-by-ai_188544-15558.jpg', 2, 0, 0, 1, 2, '2024-07-24 16:33:08', '2024-07-28 14:43:28'),
(5, 0, 'HOGO Admin template', 'hogo-admin-template', 'hogo admin template, bootstrap admin', 'Bootstarp admin template', '<h2>Perfex Project Manager &amp; Freelancer Modules Bundle</h2>\r\n\r\n<p><strong>Note</strong>: This is a bundle of modules for&nbsp;<a href=\"https://1.envato.market/7RRrV\" rel=\"nofollow\"><strong>Perfex CRM</strong></a>.<br />\r\n<br />\r\n<br />\r\nUnlock the full potential of Perfex CRM with the our bundle. Purchase it now and take your business to new heights!</p>\r\n\r\n<p>The&nbsp;<strong>Perfex Project Manager &amp; Freelancer Modules Bundle</strong>&nbsp;is designed to offer a comprehensive collection of&nbsp;<strong>Business Modules</strong>&nbsp;that can be integrated in Perfex in order to meet the most common business needs for businesses that use Perfex as their CRM solution.<br />\r\n<br />\r\nThis bundle is regularly updated and upon purchasing it, you will receive&nbsp;<strong>LIFETIME updates and LIFETIME access to new bundle modules that will be added</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Why Choose Perfex Project Manager &amp; Freelancer Modules Bundle?</h2>\r\n\r\n<p><strong>1. Cost-Effective Solution</strong><br />\r\nSave dollars with this exclusive bundle, offering a significant discount compared to purchasing individual modules separately.<br />\r\n<br />\r\n<strong>2. Enhanced Functionality</strong><br />\r\nProvides a combination of business actions which make an awesome total result for efficiency and effectiveness in business operations.<br />\r\n<br />\r\n<strong>3. Seamless Integration</strong><br />\r\nOur modules seamlessly integrate with Perfex CRM, ensuring a smooth and hassle-free user experience. No need for complex setups.<br />\r\n<br />\r\n<strong>4. Regular Updates</strong><br />\r\nEnjoy access to future updates and improvements for each module included in the bundle. Our commitment to excellence ensures that your CRM stays up-to-date with the latest features and optimizations.</p>\r\n\r\n<p><br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 1\" src=\"https://camo.envatousercontent.com/5e85ae7a0d84985aa137e06a6c7445b4f0358c34/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f70726f6a6563742d6d616e616765722d62756e646c652d696e6e65722d696d6167652e706e67\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Included Modules in the Business Bundle</h3>\r\n\r\n<p><br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 2\" src=\"https://camo.envatousercontent.com/92b49b839afa23dfce6513e0a5dadabdfc306490/68747470733a2f2f73332e656e7661746f2e636f6d2f66696c65732f3237373633353736332f69636f6e2e706e67\" /><br />\r\n<strong>Mailbox &ndash; Webmail based e-mail client module for Perfex CRM</strong><br />\r\n<br />\r\nEver wanted a&nbsp;<strong>web-based client inside Perfex CRM&rsquo;s admin area</strong>, to managing your mails from? We got you covered! By using our module, you will be able to allow your staff members to send/receive/draft/organize e-mails of their IMAP accounts, inside their dashboard.<br />\r\n<br />\r\n<a href=\"https://codecanyon.net/item/mailbox-webmail-client-for-perfex-crm/25308081\">Read the complete description &raquo;</a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 3\" src=\"https://camo.envatousercontent.com/d7ddea8382582aed743979ef65a837ac21a8a3d7/68747470733a2f2f73332e656e7661746f2e636f6d2f66696c65732f3237373333383335392f69636f6e2e706e67\" /><br />\r\n<strong>REST API module for Perfex CRM &ndash; Connect your Perfex CRM with third party applications</strong><br />\r\n<br />\r\nThis module allows you to enable&nbsp;<strong>REST API</strong>&nbsp;functionality at your your&nbsp;<strong>Perfex CRM</strong>&nbsp;installation. It includes a variety of useful commands in order to control your Perfex installation remotely, build third party connections and access Perfex&rsquo;s information in real-time!<br />\r\n<br />\r\n<a href=\"https://codecanyon.net/item/rest-api-for-perfex-crm/25278359\">Read the complete description &raquo;</a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 4\" src=\"https://camo.envatousercontent.com/0987b487f60359522a1c43b9b4bc17973f5cbb12/68747470733a2f2f73332e656e7661746f2e636f6d2f66696c65732f3238393936303334332f69636f6e2e706e67\" /><br />\r\n<strong>Project Roadmap &ndash; Advanced Reporting &amp; Workflow module for Perfex CRM Projects</strong><br />\r\n<br />\r\nProject Roadmap module provides you advanced reporting for your Perfex CRM Projects, inside admin area. It generates usable reports for every project, straight at your dashboard and allows you to filter projects, based on advanced reporting (Milestones, Tasks etc). It works fine with every custom Project status aswell.<br />\r\n<br />\r\n<a href=\"https://codecanyon.net/item/project-roadmap-advanced-reporting-for-perfex-crm-projects/26761482\">Read the complete description &raquo;</a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 5\" src=\"https://camo.envatousercontent.com/03c6438e56d6dd8077e1f5a9216f53fe05157931/68747470733a2f2f73332e656e7661746f2e636f6d2f66696c65732f3238363638343531332f69636f6e2e706e67\" /><br />\r\n<strong>Account Planning module for Perfex CRM &ndash; Strategic planning for your clients</strong><br />\r\n<br />\r\nAccount Planning Module for Perfex CRM, is a strategic account planning tool, which, through a customer-centric approach to identifying priority accounts capturing and analysing critical information, allows you and your staff members to develop a strategy to expand and grow existing customer relationships.<br />\r\n<br />\r\n<a href=\"https://codecanyon.net/item/account-planning-module-for-perfex-crm/26406165\">Read the complete description &raquo;</a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 6\" src=\"https://camo.envatousercontent.com/a4bbe1801899a13daea04443c7124765434a23bd/68747470733a2f2f73332e656e7661746f2e636f6d2f66696c65732f3336353138303330312f69636f6e2e706e67\" /><br />\r\n<strong>Custom SMS &amp; Email Notifications module for Perfex CRM</strong><br />\r\n<br />\r\nCustom SMS &amp; Email module for Perfex CRM allows you to send out custom Emails and SMS to your clients!<br />\r\n<br />\r\n<a href=\"https://codecanyon.net/item/custom-sms-email-notifications-for-pefex/24851275\">Read the complete description &raquo;</a><br />\r\n&nbsp;</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<h2><strong>Documentation</strong></h2>\r\n\r\n<p>It takes only&nbsp;<strong>a couple minutes</strong>&nbsp;to get our modules installed and activated.<br />\r\nYou can browse the complete documentation inside the zip file that will be provided along with the purchase.<br />\r\n<br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 7\" src=\"https://camo.envatousercontent.com/32c7e08cdd1a2f433f1fb886367ecefb3bfffa87/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f656c697465322e706e673f31\" /><br />\r\n<a href=\"https://codecanyon.net/user/themesic/reviews\"><img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 8\" src=\"https://camo.envatousercontent.com/006d112984417053da71ab07c8d4b1ea6cc4f7f3/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f726561642d616c6c2d726576696577732e706e67\" /></a><br />\r\n&nbsp;</p>\r\n\r\n<h2><strong>Important notice</strong></h2>\r\n\r\n<p>A Bundle cannot be used in separate websites. You can use thi bundle in one website, as per Envato Marketplace&rsquo;s Licensing Policy.</p>\r\n\r\n<h2><strong>Support</strong></h2>\r\n\r\n<p>Just raise a support ticket within support area and we will get back to you ASAP!</p>\r\n\r\n<p><a href=\"https://codecanyon.net/user/themesic/follow\"><img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 9\" src=\"https://camo.envatousercontent.com/f9a62a7a4d1d2bb6b1e2d0ce9acf1ab43f28e196/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f666f6c6c6f7775732e706e67\" /></a><br />\r\n<a href=\"https://themesic.com/support/ticket/new\" rel=\"nofollow\"><img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 10\" src=\"https://camo.envatousercontent.com/5dbbb61d3bf74f3f254c227dd2b9b8756646d918/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f676574737570706f72742e706e67\" /></a><br />\r\n<a href=\"https://themesic.com/codecanyon-newsletter-form\" rel=\"nofollow\"><img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 11\" src=\"https://camo.envatousercontent.com/bb716a437850ce876705dd72ddd56f92a23d4538/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f6e6577736c65747465722e706e67\" /></a></p>\r\n\r\n<p><img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 12\" src=\"https://camo.envatousercontent.com/f3ebef84a7d06cde826d801a86b461a30669a810/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f737570706f72742e706e67\" /><br />\r\n<br />\r\n<img alt=\"Project Management &amp; Freelancer Business Modules Bundle for Perfex CRM - 13\" src=\"https://camo.envatousercontent.com/19e3d2dbf03b676490069feda8d1a169557b7ef6/68747470733a2f2f7468656d657369632e636f6d2f656e7661746f2f323032322d30392f757064617465732d616e642d6368616e67656c6f672e706e67\" /></p>\r\n\r\n<p><strong>Version 1.0.0c</strong></p>\r\n\r\n<pre>\r\n-Bundle update to include updated modules\r\n</pre>\r\n\r\n<p><strong>Version 1.0.0b</strong></p>\r\n\r\n<pre>\r\n-Bundle update to include updated modules\r\n</pre>\r\n\r\n<p><strong>Version 1.0.0</strong></p>', NULL, 'draft', 1, NULL, 3, 0, 0, 1, 0, '2024-07-24 16:45:25', '2024-07-28 14:43:38');

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
(3, 2, 4, '2024-07-24 17:50:07', NULL),
(4, 1, 6, '2024-07-24 22:15:40', NULL),
(5, 2, 6, '2024-07-24 22:15:40', NULL),
(6, 5, 6, '2024-07-24 22:15:40', NULL),
(7, 1, 7, '2024-07-24 22:15:54', NULL),
(8, 2, 7, '2024-07-24 22:15:54', NULL),
(9, 5, 7, '2024-07-24 22:15:54', NULL);

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
('XrF8wJ9Nu9AvpSO749lWhbEkYWyhonleZMkVA2nq', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXNRZ0tpRnpZdTZRTVhQSktXd2lycG9wR1REMHBTNDVaZ1JYQWFsNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWdzL2ZyZWUtZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1722178243);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
