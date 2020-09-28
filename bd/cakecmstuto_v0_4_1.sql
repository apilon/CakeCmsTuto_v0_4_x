-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 28, 2020 at 02:00 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cakecmstuto_v0_4_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` text,
  `published` tinyint(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `body`, `published`, `created`, `modified`) VALUES
(1, 1, 'First post en_US', 'first-post', 'This is the first post! en_US', 1, '2020-08-30 12:25:57', '2020-09-13 21:50:20'),
(2, 1, 'Slug\'s try', 'essai-slug', 'To test the Article\'s slug', 1, '2020-08-30 00:00:00', '2020-09-27 16:22:08'),
(4, 1, 'Longer title', 'ticourt-plus-long', 'Longer title works fine', 1, '2020-08-30 22:16:39', '2020-09-27 16:22:48'),
(5, 1, 'Everything about Wikipedia', 'Everything-about-Wikipedia', 'Everything You Always Wanted to Know About Wikipedia', 1, '2020-09-27 16:34:44', '2020-09-27 19:30:59'),
(6, 1, 'Everything about Montmorency', 'Everything-about-Montmorency', 'Everything You Always Wanted to Know About Montmorency College', 1, '2020-09-27 16:35:23', '2020-09-27 19:31:30'),
(7, 1, 'Everything about CakePHP', 'Everything-about-CakePHP', 'Everything You Always Wanted to Know About CakePHP', 1, '2020-09-27 16:35:56', '2020-09-28 01:58:59'),
(10, 1, 'Test d\'article toutes étiquettes', 'Tags-test-article-all', 'Un article avec toutes les étiquettes', 1, '2020-09-27 17:26:25', '2020-09-27 18:54:11'),
(12, 1, 'Test d\'article une étiquette', 'Tags-test-article-one', 'Un article avec une étiquette', 1, '2020-09-27 18:41:54', '2020-09-27 18:53:26'),
(13, 1, 'Article with image', 'Article-with-image', 'Associate an image to the article', 1, '2020-09-28 01:51:45', '2020-09-28 01:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `articles_files`
--

CREATE TABLE `articles_files` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles_files`
--

INSERT INTO `articles_files` (`id`, `article_id`, `file_id`) VALUES
(1, 1, 1),
(2, 13, 2),
(3, 7, 1),
(4, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

CREATE TABLE `articles_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
(6, 1),
(7, 1),
(10, 1),
(12, 1),
(6, 2),
(10, 2),
(5, 3),
(7, 3),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `name`, `comment`, `created`, `modified`) VALUES
(1, 1, 'Me', 'Congrats for the first post! EN', '2020-09-09 00:00:00', '2020-09-13 21:48:18'),
(2, 1, 'you', 'your comment', '2020-09-09 21:36:02', '2020-09-13 21:52:03'),
(3, 1, 'lui', 'Son commentaire sur le first post', '2020-09-09 21:48:08', '2020-09-09 21:48:08'),
(4, 4, 'nous', 'notre commentaire sur ticourt', '2020-09-09 21:48:44', '2020-09-09 21:48:44'),
(5, 2, 'Eux', 'Leur commentaire sur le slug', '2020-09-09 22:56:45', '2020-09-09 22:56:45'),
(6, 2, 'en vidéo', 'Redirection vers l\'article après un ajout', '2020-09-09 23:01:22', '2020-09-09 23:01:22'),
(7, 4, 'en vidéo', 'Ajout et redirection  vers ticourt', '2020-09-09 23:02:41', '2020-09-09 23:02:41'),
(8, 1, 'en vidéo', 'Ajout commentaire à first post', '2020-09-09 23:05:58', '2020-09-09 23:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `path`, `created`, `modified`, `status`) VALUES
(1, 'helfenburk_shody.jpg', 'files/add/', '2020-09-27 00:00:00', '2020-09-27 00:00:00', 1),
(2, 'bezdez_uvnitr.jpg', 'files/add/', '2020-09-28 01:50:46', '2020-09-28 01:50:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i18n`
--

CREATE TABLE `i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foreign_key` int(10) NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n`
--

INSERT INTO `i18n` (`id`, `locale`, `model`, `foreign_key`, `field`, `content`) VALUES
(5, 'fr_CA', 'Comments', 1, 'name', 'Moi fr_CA'),
(6, 'fr_CA', 'Comments', 1, 'comment', 'Félicitations pour le premier article! fr_CA'),
(7, 'fr_CA', 'Articles', 1, 'title', 'Premier article fr_CA'),
(8, 'fr_CA', 'Articles', 1, 'body', 'Voici le premier article fr_CA'),
(9, 'fr_CA', 'Comments', 2, 'name', 'Toi fr_CA'),
(10, 'fr_CA', 'Comments', 2, 'comment', 'Ton commentaire fr_CA'),
(11, 'fr_CA', 'Articles', 2, 'title', 'Essai de slug'),
(12, 'fr_CA', 'Articles', 2, 'body', 'Voici un article pour tester le slug'),
(13, 'fr_CA', 'Articles', 4, 'title', 'Titre plus long'),
(14, 'fr_CA', 'Articles', 4, 'body', 'Un article plus long est accepté'),
(15, 'fr_CA', 'Tags', 1, 'title', 'Éducation'),
(16, 'fr_CA', 'Tags', 2, 'title', 'Ville de Laval'),
(17, 'fr_CA', 'Tags', 3, 'title', 'International'),
(18, 'fr_CA', 'Articles', 5, 'title', 'Tout sur Wikipedia'),
(19, 'fr_CA', 'Articles', 6, 'title', 'Tout sur Montmorency'),
(20, 'fr_CA', 'Articles', 7, 'title', 'Tout sur CakePHP'),
(21, 'fr_CA', 'Articles', 5, 'body', 'Tout ce que vous avez toujours voulu savoir sur Wikipedia'),
(22, 'fr_CA', 'Articles', 6, 'body', 'Tout ce que vous avez toujours voulu savoir sur le collège Montmorency'),
(23, 'fr_CA', 'Articles', 7, 'body', 'Tout ce que vous avez toujours voulu savoir sur CakePHP');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'Training', '2020-09-27 16:37:54', '2020-09-27 16:42:08'),
(2, 'City of Laval', '2020-09-27 16:38:31', '2020-09-27 16:42:16'),
(3, 'World', '2020-09-27 16:38:48', '2020-09-27 16:42:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'cakephp@example.com', '$2y$10$iBI.6gNPxKfepjyRSDOcweqT6p6Tkf.ZkNsbIKn9AKkQvjWcvu/42', '2020-08-30 12:25:57', '2020-09-09 22:05:23'),
(2, 'admin@admin.com', '$2y$10$AQvpqlMoXhHtjad/4RsVyOw9Epw7XVmltfCDavvzICJd1AFIeYVda', '2020-09-09 22:05:30', '2020-09-09 22:05:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `articles_files`
--
ALTER TABLE `articles_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_comments_fk` (`article_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `I18N_LOCALE_FIELD` (`locale`,`model`,`foreign_key`,`field`),
  ADD KEY `I18N_FIELD` (`model`,`foreign_key`,`field`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `articles_files`
--
ALTER TABLE `articles_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `articles_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `articles_tags_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `article_comments_fk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
