-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-08-20 08:37:42
-- 服务器版本： 5.6.50-log
-- PHP 版本： 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `saylovewal`
--

-- --------------------------------------------------------

--
-- 表的结构 `saylove_2021_blacklist`
--

CREATE TABLE `saylove_2021_blacklist` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `saylove_2021_commtents`
--

CREATE TABLE `saylove_2021_commtents` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `contents` varchar(140) NOT NULL,
  `ip` text NOT NULL,
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `saylove_2021_commtents`
--

INSERT INTO `saylove_2021_commtents` (`id`, `posts_id`, `contents`, `ip`, `mtime`) VALUES
(2, 7, '沙发一下', '171.93.233.225', '2021-05-18 06:53:06'),
(3, 7, '傻狗', '117.136.70.139', '2021-05-25 09:19:58'),
(4, 12, '强哥，最帅了', '61.157.243.125', '2021-07-06 06:21:01'),
(5, 19, '强哥，最帅了', '61.157.243.125', '2021-07-06 06:21:24'),
(6, 20, 'hahha', '139.207.202.81', '2021-08-07 02:50:35'),
(7, 20, '这好吗？这不好', '139.207.202.81', '2021-08-07 02:51:09'),
(8, 34, '第一个吃螃蟹的人是我狗子？', '139.207.17.169', '2021-08-18 15:30:25'),
(9, 34, '第一个吃螃蟹的人是我狗子？', '139.207.17.169', '2021-08-18 15:30:33'),
(10, 34, '第一个吃螃蟹的人是我狗子？', '139.207.17.169', '2021-08-18 15:30:41'),
(11, 34, '？', '60.255.139.29', '2021-08-19 01:45:17'),
(12, 34, '？', '60.255.139.29', '2021-08-19 01:45:18'),
(13, 34, '？', '60.255.139.29', '2021-08-19 01:45:20'),
(14, 24, '？', '60.255.139.29', '2021-08-19 01:45:31'),
(15, 24, '？', '60.255.139.29', '2021-08-19 01:45:33'),
(16, 22, '这是原本的样子', '171.92.123.147', '2021-08-19 01:52:13'),
(17, 34, '嗯哼', '60.255.139.29', '2021-08-19 02:05:41'),
(18, 34, '嗯哼', '60.255.139.29', '2021-08-19 02:05:42'),
(19, 34, '嗯哼', '60.255.139.29', '2021-08-19 02:05:51'),
(20, 34, '评课', '60.255.139.29', '2021-08-19 02:08:11'),
(21, 34, '评课', '60.255.139.29', '2021-08-19 02:08:12'),
(22, 34, '评课', '60.255.139.29', '2021-08-19 02:08:15'),
(23, 34, '评课', '60.255.139.29', '2021-08-19 02:08:15'),
(24, 34, '评课', '60.255.139.29', '2021-08-19 02:08:17'),
(25, 34, '评课', '60.255.139.29', '2021-08-19 02:08:18'),
(26, 34, '哈哈', '60.255.139.29', '2021-08-19 02:08:37'),
(27, 34, '小盆友', '222.182.2.82', '2021-08-19 02:22:02'),
(28, 34, '楼中楼回复', '106.119.238.160', '2021-08-19 04:48:32');

-- --------------------------------------------------------

--
-- 表的结构 `saylove_2021_guess`
--

CREATE TABLE `saylove_2021_guess` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `guessName` varchar(30) NOT NULL,
  `isRight` enum('0','1') NOT NULL DEFAULT '0',
  `ip` text NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `saylove_2021_guess`
--

INSERT INTO `saylove_2021_guess` (`id`, `posts_id`, `guessName`, `isRight`, `ip`, `mtime`) VALUES
(1, 20, '憨批', '1', '171.93.233.225', '2021-05-18 07:21:53'),
(2, 21, 'GB', '0', '171.92.99.126', '2021-05-24 07:59:28');

-- --------------------------------------------------------

--
-- 表的结构 `saylove_2021_like`
--

CREATE TABLE `saylove_2021_like` (
  `id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `saylove_2021_like`
--

INSERT INTO `saylove_2021_like` (`id`, `posts_id`, `ip`, `mtime`) VALUES
(34, 24, '171.210.156.130', '2021-08-17 15:24:45'),
(35, 23, '171.210.156.130', '2021-08-17 15:24:47'),
(36, 22, '171.210.156.130', '2021-08-17 15:24:51'),
(37, 21, '171.210.156.130', '2021-08-17 15:24:52'),
(38, 20, '171.210.156.130', '2021-08-17 15:24:54'),
(39, 24, '116.169.3.48', '2021-08-17 15:26:09'),
(40, 23, '116.169.3.48', '2021-08-17 15:26:13'),
(41, 22, '116.169.3.48', '2021-08-17 15:26:42'),
(42, 21, '116.169.3.48', '2021-08-17 15:26:45'),
(43, 20, '116.169.3.48', '2021-08-17 15:26:48'),
(44, 24, '171.210.156.130', '2021-08-17 15:27:38'),
(45, 23, '171.210.156.130', '2021-08-17 15:27:45'),
(46, 21, '171.210.156.130', '2021-08-17 15:27:54'),
(47, 20, '171.210.156.130', '2021-08-17 15:27:54'),
(48, 24, '116.169.3.48', '2021-08-17 15:28:44'),
(49, 23, '116.169.3.48', '2021-08-17 15:28:46'),
(50, 22, '116.169.3.48', '2021-08-17 15:28:48'),
(51, 21, '116.169.3.48', '2021-08-17 15:28:50'),
(52, 20, '116.169.3.48', '2021-08-17 15:28:51'),
(53, 24, '222.182.3.66', '2021-08-17 15:31:09'),
(54, 23, '222.182.3.66', '2021-08-17 15:31:17'),
(55, 22, '222.182.3.66', '2021-08-17 15:31:19'),
(56, 21, '222.182.3.66', '2021-08-17 15:31:21'),
(57, 20, '222.182.3.66', '2021-08-17 15:31:23'),
(58, 24, '39.144.50.145', '2021-08-17 16:27:50'),
(59, 20, '171.217.49.167', '2021-08-18 00:22:20'),
(60, 20, '223.88.154.25', '2021-08-18 00:26:48'),
(61, 22, '223.104.196.101', '2021-08-18 09:37:34'),
(62, 22, '106.119.238.160', '2021-08-18 10:46:28'),
(63, 34, '139.207.17.169', '2021-08-18 11:00:07'),
(64, 23, '221.8.95.253', '2021-08-18 11:02:03'),
(65, 34, '171.92.123.147', '2021-08-19 01:54:11'),
(66, 34, '106.119.238.160', '2021-08-19 04:47:56');

-- --------------------------------------------------------

--
-- 表的结构 `saylove_2021_posts`
--

CREATE TABLE `saylove_2021_posts` (
  `id` int(11) NOT NULL,
  `nickName` varchar(30) NOT NULL,
  `tureName` varchar(30) NOT NULL,
  `toWho` varchar(30) NOT NULL,
  `gender` enum('male','female','secrecy') NOT NULL,
  `itsGender` enum('male','female','secrecy') NOT NULL,
  `contents` varchar(520) NOT NULL,
  `email` text NOT NULL,
  `isDisplay` enum('0','1') NOT NULL DEFAULT '0',
  `isSended` enum('0','1','2') NOT NULL DEFAULT '0',
  `love` int(11) NOT NULL DEFAULT '0',
  `ip` text NOT NULL,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `saylove_2021_posts`
--

INSERT INTO `saylove_2021_posts` (`id`, `nickName`, `tureName`, `toWho`, `gender`, `itsGender`, `contents`, `email`, `isDisplay`, `isSended`, `love`, `ip`, `mtime`, `images`) VALUES
(20, '测试', 'test', '不知道', 'male', 'female', '这里有520个字', '', '0', '0', 9, '171.210.34.229', '2021-07-18 02:16:35', 'https://www.conputer.xyz/upload/abc.jpg'),
(21, '测试', '测试真名', '没问题把', 'male', 'female', '121这是好多字啊', '', '0', '0', 5, '171.216.241.125', '2021-08-11 10:27:31', ''),
(22, '全是牛牛', '勇敢牛牛', '狗子', 'male', 'female', '勇敢牛牛不怕困呐', '', '0', '0', 6, '171.216.241.125', '2021-08-11 10:32:41', '#http://vue.conputer.xyz/api/upload/2021081137.png#http://vue.conputer.xyz/api/upload/2021081147.png'),
(23, '多图测试', 'bug', 'bug修复', 'male', 'female', '即将添加点赞功能', '', '0', '0', 6, '171.209.157.144', '2021-08-13 08:14:37', '#http://vue.conputer.xyz/api/upload/2021081396.jpeg#http://vue.conputer.xyz/api/upload/2021081380.jpeg#http://vue.conputer.xyz/api/upload/2021081356.jpeg#http://vue.conputer.xyz/api/upload/2021081321.jpeg'),
(24, '三张显示', '3', '3张图片显示', 'male', 'female', '我看看三张图片的显示效果', '', '0', '0', 6, '171.216.250.41', '2021-08-14 10:22:18', '#http://vue.conputer.xyz/api/upload/2021081485.jpeg#http://vue.conputer.xyz/api/upload/2021081458.jpeg#http://vue.conputer.xyz/api/upload/2021081410.jpeg'),
(34, '修复', '', '成功', 'male', 'female', '哈哈', '', '0', '0', 3, '139.207.17.169', '2021-08-18 10:58:47', '#http://vue.conputer.xyz/api/upload/2021081849.jpeg'),
(35, '我看看？', '', '修复？', 'male', 'female', '我看看坎坎坷坷', '', '0', '0', 0, '106.119.238.160', '2021-08-19 04:49:27', '#http://vue.conputer.xyz/api/upload/2021081912.jpeg');

--
-- 转储表的索引
--

--
-- 表的索引 `saylove_2021_commtents`
--
ALTER TABLE `saylove_2021_commtents`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `saylove_2021_guess`
--
ALTER TABLE `saylove_2021_guess`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `saylove_2021_like`
--
ALTER TABLE `saylove_2021_like`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `saylove_2021_posts`
--
ALTER TABLE `saylove_2021_posts`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `saylove_2021_commtents`
--
ALTER TABLE `saylove_2021_commtents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `saylove_2021_guess`
--
ALTER TABLE `saylove_2021_guess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `saylove_2021_like`
--
ALTER TABLE `saylove_2021_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- 使用表AUTO_INCREMENT `saylove_2021_posts`
--
ALTER TABLE `saylove_2021_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
