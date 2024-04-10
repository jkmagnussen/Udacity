-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2021 at 08:24 PM
-- Server version: 10.4.15-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u490444716_wouldYouRather`
--

-- --------------------------------------------------------

--
-- Table structure for table `friendsList`
--

CREATE TABLE `friendsList` (
  `id` int(11) NOT NULL,
  `frienderId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `optionsForQuestions`
--

CREATE TABLE `optionsForQuestions` (
  `id` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `optionsForQuestions`
--

INSERT INTO `optionsForQuestions` (`id`, `questionId`, `title`) VALUES
(1, 1, 'have horrible short term memory'),
(2, 1, 'have horrible long term memory'),
(3, 2, 'be a front-end developer'),
(4, 2, 'be a back-end developer'),
(5, 3, 'become a superhero'),
(6, 3, 'become a supervillain'),
(7, 4, 'be telekinetic'),
(8, 4, 'be telepathic'),
(9, 5, 'find $50 yourself'),
(10, 5, 'have your best friend find $500'),
(11, 6, 'Blue cheese'),
(12, 6, 'go Effff yah'),
(13, 7, 'Noodle the guitar'),
(14, 7, 'Slap de bass'),
(15, 8, 'A Guinea pig called Ronnie'),
(16, 8, 'A guinea pig called Borris'),
(23, 13, 'Option one'),
(24, 13, 'Option two'),
(25, 14, 'Option one'),
(26, 14, 'Option two');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `timeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `authorId`, `timeStamp`) VALUES
(1, 1, '0000-00-00 00:00:00'),
(2, 2, '0000-00-00 00:00:00'),
(3, 5, '0000-00-00 00:00:00'),
(4, 1, '0000-00-00 00:00:00'),
(5, 2, '0000-00-00 00:00:00'),
(6, 5, '0000-00-00 00:00:00'),
(7, 1, '0000-00-00 00:00:00'),
(8, 2, '0000-00-00 00:00:00'),
(13, 1, '2021-01-19 17:28:40'),
(14, 1, '2021-01-19 17:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `userOptionChoice`
--

CREATE TABLE `userOptionChoice` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `OptionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userOptionChoice`
--

INSERT INTO `userOptionChoice` (`id`, `userId`, `questionId`, `OptionId`) VALUES
(15, 1, 2, 3),
(31, 1, 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` text NOT NULL,
  `avatarUrl` text DEFAULT NULL,
  `email` text NOT NULL,
  `password` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `avatarUrl`, `email`, `password`) VALUES
(1, 'Lauryn Pih', 'https://images.8tracks.com/avatar/i/009/851/004/Snapchat--8317067121052947278-1-2137.jpg?rect=0,183,766,766&q=98&fm=jpg&fit=max', 'lpih@outlook.com', 'ghost1'),
(2, 'Erik Davidkov', 'https://yt3.ggpht.com/a/AATXAJylJXZssrjcZ2vMTiUpi6pAxuQEVPEkRstGyO0GdBI=s900-c-k-c0x00ffffff-no-rj', 'erik@outlook.com', 'frog'),
(5, 'Joe Magnussen', 'https://yt3.ggpht.com/a/AATXAJx23JIEZhyfc2abGBkrYcsk73XmOxdJHbV483jJ=s900-c-k-c0x00ffffff-no-rj', 'jmagnussen@outlook.com', 'circle1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friendsList`
--
ALTER TABLE `friendsList`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend` (`friendId`),
  ADD KEY `friender` (`frienderId`);

--
-- Indexes for table `optionsForQuestions`
--
ALTER TABLE `optionsForQuestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionOptionsToQuestionId` (`questionId`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userToQuestion` (`authorId`);

--
-- Indexes for table `userOptionChoice`
--
ALTER TABLE `userOptionChoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `optionChoiceToUsers` (`userId`),
  ADD KEY `optionIdToOptionsForQuestions` (`OptionId`),
  ADD KEY `userChoiceOptionToQuestionId` (`questionId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friendsList`
--
ALTER TABLE `friendsList`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `optionsForQuestions`
--
ALTER TABLE `optionsForQuestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `userOptionChoice`
--
ALTER TABLE `userOptionChoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friendsList`
--
ALTER TABLE `friendsList`
  ADD CONSTRAINT `friend` FOREIGN KEY (`friendId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friender` FOREIGN KEY (`frienderId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `optionsForQuestions`
--
ALTER TABLE `optionsForQuestions`
  ADD CONSTRAINT `questionOptionsToQuestionId` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `userToQuestion` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userOptionChoice`
--
ALTER TABLE `userOptionChoice`
  ADD CONSTRAINT `optionChoiceToUsers` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `optionIdToOptionsForQuestions` FOREIGN KEY (`OptionId`) REFERENCES `optionsForQuestions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userChoiceOptionToQuestionId` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
