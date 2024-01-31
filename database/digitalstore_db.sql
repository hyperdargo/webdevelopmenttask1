-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 12:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalstore_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'GiftCard', 'Giftcard Category', 1, '2021-07-28 10:26:56'),
(2, 'Game Top Up', '&lt;p&gt;Game Topup Categories&lt;/p&gt;', 1, '2021-07-28 10:27:16'),
(3, 'Entertainment', '&lt;p&gt;Entertainment&lt;span style=&quot;font-size: 1rem;&quot;&gt;&amp;nbsp;Category&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-31 15:28:36'),
(4, 'PC Games', '&lt;p&gt;PC Games Category&lt;br&gt;&lt;/p&gt;', 1, '2024-01-31 15:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@sample.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address Only', '2021-07-28 13:41:33'),
(2, 'Ankit', 'Gupta', 'Male', '9817051335', 'ankitstudentid@gmail.com', '26b0326790fafea70f52d50eac89807d', 'Damak - 09, Jhapa, Koshi Province', '2024-01-31 15:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `featured_game`
--

CREATE TABLE `featured_game` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `featured_game`
--

INSERT INTO `featured_game` (`id`, `product_id`) VALUES
(1, 4),
(2, 1),
(3, 3),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 300, '2021-07-28 10:36:07', NULL),
(2, 2, 50, 300, '2021-07-28 10:36:17', NULL),
(3, 3, 50, 10, '2021-07-28 10:36:26', '2024-01-31 15:34:17'),
(4, 4, 50, 500, '2021-07-28 10:36:38', NULL),
(5, 5, 30, 550, '2021-07-28 11:38:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(24, 2, 'Damak - 09, Jhapa, Koshi Province', 'cod', 2, 10, 3, 0, '2024-01-31 16:21:04', '2024-01-31 16:21:34'),
(25, 1, 'Esewa- 1232312', 'cod', 2, 10, 3, 1, '2024-01-31 16:51:21', '2024-01-31 17:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(10, 24, 3, 1, 10, 10),
(11, 25, 3, 1, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `description`, `status`, `date_created`) VALUES
(1, 3, 16, 'Spotify 3 Month Subscription ', '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam semper et purus blandit fringilla. Pellentesque at libero finibus nisl ultricies iaculis. Cras porta, orci commodo ullamcorper mattis, elit ex pretium arcu, eu tempor justo nibh in magna. Cras placerat fringilla neque, vitae posuere ligula bibendum sit amet. Suspendisse ultrices molestie auctor. Suspendisse ac tempus libero. Pellentesque efficitur, eros sed rhoncus posuere, enim lacus sodales ante, id egestas urna leo vitae erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque non porttitor massa. Nunc eu neque bibendum, ornare ligula eu, condimentum purus. Mauris sit amet massa nec urna porta euismod. Maecenas fermentum ante ac ipsum luctus semper eu nec justo. Ut quis suscipit dolor, ac consequat justo. Nunc elementum ullamcorper lectus consequat porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-28 10:30:43'),
(2, 1, 1, 'Playstation $30 Giftcard', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sed pretium odio euismod porttitor scelerisque. Vestibulum ipsum magna, consectetur a rutrum vitae, faucibus vel odio. Nullam pulvinar dapibus eros, eget vestibulum libero luctus in. Vestibulum facilisis convallis viverra. Cras posuere tortor facilisis dolor ultricies tempor. Etiam venenatis malesuada risus, a ullamcorper eros sagittis sed. Maecenas consectetur rhoncus lacus, quis finibus eros commodo finibus. Proin sed scelerisque orci. Duis id cursus odio.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Ut volutpat ullamcorper turpis. Cras vitae ultricies ligula, vitae finibus neque. Pellentesque condimentum mi sem. Morbi elementum neque vitae tempus blandit. Nam interdum egestas pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices dictum commodo. Cras bibendum nibh est, a eleifend dolor pharetra non. Phasellus ullamcorper vel tellus at rhoncus. Nulla facilisi. Proin suscipit tincidunt neque eu lacinia. Fusce euismod posuere augue, eget dignissim quam dignissim at. Praesent dapibus turpis ut dolor dignissim mollis. In porta mi eget arcu consequat efficitur. Duis ut viverra felis, nec ullamcorper urna.&lt;/p&gt;', 1, '2021-07-28 10:32:20'),
(3, 1, 2, 'Steam $10 Gift Card', '&lt;p&gt;&lt;span style=\\&quot;font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; text-align: justify; background-color: rgb(69, 77, 85);\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam semper et purus blandit fringilla. Pellentesque at libero finibus nisl ultricies iaculis. Cras porta, orci commodo ullamcorper mattis, elit ex pretium arcu, eu tempor justo nibh in magna. Cras placerat fringilla neque, vitae posuere ligula bibendum sit amet. Suspendisse ultrices molestie auctor. Suspendisse ac tempus libero. Pellentesque efficitur, eros sed rhoncus posuere, enim lacus sodales ante, id egestas urna leo vitae erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque non porttitor massa. Nunc eu neque bibendum, ornare ligula eu, condimentum purus. Mauris sit amet massa nec urna porta euismod. Maecenas fermentum ante ac ipsum luctus semper eu nec justo. Ut quis suscipit dolor, ac consequat justo. Nunc elementum ullamcorper lectus consequat porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-28 10:33:03'),
(4, 2, 8, '1000 VP', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam semper et purus blandit fringilla. Pellentesque at libero finibus nisl ultricies iaculis. Cras porta, orci commodo ullamcorper mattis, elit ex pretium arcu, eu tempor justo nibh in magna. Cras placerat fringilla neque, vitae posuere ligula bibendum sit amet. Suspendisse ultrices molestie auctor. Suspendisse ac tempus libero. Pellentesque efficitur, eros sed rhoncus posuere, enim lacus sodales ante, id egestas urna leo vitae erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque non porttitor massa. Nunc eu neque bibendum, ornare ligula eu, condimentum purus. Mauris sit amet massa nec urna porta euismod. Maecenas fermentum ante ac ipsum luctus semper eu nec justo. Ut quis suscipit dolor, ac consequat justo. Nunc elementum ullamcorper lectus consequat porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sed pretium odio euismod porttitor scelerisque. Vestibulum ipsum magna, consectetur a rutrum vitae, faucibus vel odio. Nullam pulvinar dapibus eros, eget vestibulum libero luctus in. Vestibulum facilisis convallis viverra. Cras posuere tortor facilisis dolor ultricies tempor. Etiam venenatis malesuada risus, a ullamcorper eros sagittis sed. Maecenas consectetur rhoncus lacus, quis finibus eros commodo finibus. Proin sed scelerisque orci. Duis id cursus odio.&lt;/p&gt;', 1, '2021-07-28 10:33:58'),
(5, 2, 5, '1000 UC', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam semper et purus blandit fringilla. Pellentesque at libero finibus nisl ultricies iaculis. Cras porta, orci commodo ullamcorper mattis, elit ex pretium arcu, eu tempor justo nibh in magna. Cras placerat fringilla neque, vitae posuere ligula bibendum sit amet. Suspendisse ultrices molestie auctor. Suspendisse ac tempus libero. Pellentesque efficitur, eros sed rhoncus posuere, enim lacus sodales ante, id egestas urna leo vitae erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque non porttitor massa. Nunc eu neque bibendum, ornare ligula eu, condimentum purus. Mauris sit amet massa nec urna porta euismod. Maecenas fermentum ante ac ipsum luctus semper eu nec justo. Ut quis suscipit dolor, ac consequat justo. Nunc elementum ullamcorper lectus consequat porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sed pretium odio euismod porttitor scelerisque. Vestibulum ipsum magna, consectetur a rutrum vitae, faucibus vel odio. Nullam pulvinar dapibus eros, eget vestibulum libero luctus in. Vestibulum facilisis convallis viverra. Cras posuere tortor facilisis dolor ultricies tempor. Etiam venenatis malesuada risus, a ullamcorper eros sagittis sed. Maecenas consectetur rhoncus lacus, quis finibus eros commodo finibus. Proin sed scelerisque orci. Duis id cursus odio.&lt;/p&gt;', 1, '2021-07-28 11:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(9, 24, 10, '2024-01-31 16:21:04'),
(10, 25, 10, '2024-01-31 16:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Playstation', '&lt;h3 style=&quot;margin: 10px 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif;&quot;&gt;Playstation&lt;/h3&gt;', 1, '2021-07-28 10:27:36'),
(2, 1, 'Steam', '&lt;h3 style=&quot;margin: 10px 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif;&quot;&gt;Steam&lt;/h3&gt;', 1, '2021-07-28 10:27:57'),
(3, 1, 'Xbox', '', 1, '2024-01-31 15:38:29'),
(4, 1, 'Itunes', '', 1, '2024-01-31 15:38:42'),
(5, 2, 'PUBG', '', 1, '2024-01-31 15:39:03'),
(6, 2, 'Free Fire', '', 1, '2024-01-31 15:39:14'),
(7, 2, 'Mobile Legends', '', 1, '2024-01-31 15:39:26'),
(8, 2, 'Valorant', '', 1, '2024-01-31 15:39:36'),
(9, 4, 'GTA 5', '', 1, '2024-01-31 15:39:51'),
(10, 4, 'Minecraft', '', 1, '2024-01-31 15:40:02'),
(11, 4, 'FIFA', '', 1, '2024-01-31 15:40:15'),
(12, 4, 'Red Dead Redemption', '', 1, '2024-01-31 15:40:28'),
(13, 4, 'Cyberpunk', '', 1, '2024-01-31 15:40:58'),
(14, 3, 'Crunchyroll', '', 1, '2024-01-31 15:41:10'),
(15, 3, 'Netflix', '', 1, '2024-01-31 15:41:21'),
(16, 3, 'Spotify', '', 1, '2024-01-31 15:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Digital Store'),
(6, 'short_name', 'Digital Store'),
(11, 'logo', 'uploads/1706693940_DG.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1706700420_digitalstore.png'),
(15, 'yt_channel_id', 'UCyxsVTlslnh4Py4T9cpImLg'),
(16, 'yt_video_id', 'eroWCJodVa8');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_game`
--
ALTER TABLE `featured_game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `featured_game`
--
ALTER TABLE `featured_game`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
