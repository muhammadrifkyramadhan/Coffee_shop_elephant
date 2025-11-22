-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2024 at 10:51 PM
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
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `itemName`, `price`, `image`, `quantity`, `catName`, `email`, `total_price`) VALUES
(1, 'Americano', 25000, 'Americano.jpg', 1, 'Coffee Based', 'asna@gmail.com', '25000'),
(2, 'Kopi Susu Gula Aren', 15000, 'Kopi_Susu_Gula_Aren.jpg', 1, 'Signature Menu', 'zidnan@gmail.com', '15000'),
(3, 'Waffle', 10000, 'Waffle.png', 2, 'Snacks', 'zidnan@gmail.com', '20000');

-- --------------------------------------------------------

--
-- Table structure for table `menucategory`
--

CREATE TABLE `menucategory` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menucategory`
--

INSERT INTO `menucategory` (`catId`, `catName`, `dateCreated`) VALUES
(1, 'Coffee', '2024-07-26 12:31:55'),
(2, 'NonCoffee', '2024-07-26 12:31:55'),
(3, 'Signature', '2024-07-26 12:33:18'),
(4, 'Snacks', '2024-07-26 12:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` enum('Available','Unavailable','','') NOT NULL DEFAULT 'Available',
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedDate` datetime NOT NULL,
  `is_popular` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`itemId`, `itemName`, `catName`, `price`, `status`, `description`, `image`, `dateCreated`, `updatedDate`, `is_popular`) VALUES
(3, 'Americano', 'Coffee Based', '25000', 'Available', 'Kopi hitam klasik dengan rasa kuat dan bersih, dibuat dari espresso yang ditambahkan air panas sehingga menghasilkan cita rasa yang ringan namun tetap bold.', 'Americano.jpg', '2024-07-26 09:09:35', '2024-07-26 14:39:35', 1),
(5, 'Kopi Susu Gula Aren', 'Signature Menu', '15000', 'Available', 'Perpaduan espresso, susu creamy, dan manisnya gula aren asli yang memberikan rasa karamel lembut dan aroma khas yang hangat. Cocok untuk pecinta kopi susu dengan sentuhan manis alami.', 'Kopi_Susu_Gula_Aren.jpg', '2024-07-26 09:10:36', '2024-07-26 14:40:36', 1),
(6, 'Smoky Dark Caramel Latte', 'Signature Menu', '15000', 'Available', 'Latte dengan perpaduan espresso halus dan saus caramel dark yang kaya, diberi sentuhan smoky sehingga menghadirkan rasa manis-karamel yang lebih dalam dan aroma panggang yang unik.', 'Smoky_Dark_Caramel_Latte.jpg', '2024-07-26 09:12:03', '2024-07-26 14:42:03', 1),
(7, 'Mocha Hazelnut Signature', 'Signature Menu', '15000', 'Available', 'Kombinasi sempurna antara espresso, cokelat rich, dan aroma hazelnut yang lembut, Minuman signature yang menghadirkan sensasi mocha lebih premium dan memanjakan.', 'Mocha_Hazelnut_Signature.jpg', '2024-07-26 09:13:09', '2024-07-26 14:43:09', 1),
(8, 'Spiced Orange Americano', 'Signature Menu', '15000', 'Available', 'Americano segar dengan sentuhan jeruk yang aromatic dan hint rempah hangat, Pilihan tepat untuk kamu yang suka kopi hitam dengan twist yang lebih berani dan modern.', 'Spiced_Orange_Americano.jpg', '2024-07-26 09:13:45', '2024-07-26 14:43:45', 1),
(9, 'Chocolate', 'Non-Coffee', '10000', 'Available', 'Minuman cokelat lembut dengan rasa rich dan creamy, dibuat dari cokelat berkualitas yang memberikan sensasi manis hangat dan comforting di setiap tegukan.', 'Chocolate.jpg', '2024-08-03 14:37:51', '2024-08-03 16:37:09', 1),
(10, 'Red Velvet Latte', 'Non-Coffee', '10000', 'Available', 'Latte creamy dengan aroma khas red velvet yang manis dan lembut, dipadukan dengan hint cokelat halus. Hadir dengan warna merah elegan dan rasa dessert-like yang memanjakan.', 'Red_Velvet_Latte.jpg', '2024-08-03 15:07:32', '2024-08-03 17:07:01', 1),
(11, 'Matcha Latte', 'Non-Coffee', '10000', 'Available', 'Perpaduan matcha premium dan susu yang creamy, menghasilkan rasa earthy yang lembut dengan aroma teh hijau yang menenangkan. Minuman yang smooth, elegan, dan cocok untuk pecinta matcha sejati.', 'Matcha_Latte.jpg', '2024-08-03 15:09:50', '2024-08-03 17:07:34', 1),
(12, 'Taro Latte', 'Non-Coffee', '10000', 'Available', 'Minuman taro berwarna ungu lembut dengan rasa manis-creamy khas talas, dipadukan dengan susu yang smooth. Aromanya yang harum dan teksturnya yang lembut membuatnya cocok untuk penikmat minuman manis yang unik dan comforting.', 'Taro_Latt.jpg', '2024-08-03 15:21:27', '2024-08-03 17:20:42', 1),
(13, 'French Fries', 'Snacks', '5000', 'Available', 'Kentang goreng renyah berwarna golden-brown, dibumbui ringan agar gurihnya pas, dan disajikan dengan pilihan saus favoritmu. Cocok sebagai camilan atau pendamping menu apa pun.', 'French_Fries.jpg', '2024-08-03 14:18:11', '2024-08-03 16:09:51', 1),
(14, 'Toast', 'Snacks', '5000', 'Available', 'Roti panggang yang hangat dan renyah, disajikan dengan olesan butter atau topping manis-gurih sesuai selera. Teksturnya crunchy di luar dan soft di dalam, cocok sebagai camilan ringan atau pendamping minuman favoritmu.', 'Toast.jpg', '2024-08-03 14:24:49', '2024-08-03 16:24:05', 1),
(15, 'Waffle', 'Snacks', '10000', 'Available', 'Waffle hangat dengan tekstur crispy di luar dan soft di dalam, memiliki aroma butter yang harum. Cocok disajikan dengan topping manis atau gurih untuk camilan yang memanjakan.', 'Waffle.jpg', '2024-08-03 14:25:57', '2024-08-03 16:24:54', 1),
(16, 'Chicken Wings', 'Snacks', '15000', 'Available', 'Sayap ayam gurih dengan bumbu meresap sempurna, digoreng atau dipanggang hingga renyah di luar dan juicy di dalam. Disajikan dengan saus pilihan untuk rasa yang lebih nikmat.', 'Chicken_Wings.jpg', '2024-08-03 14:26:56', '2024-08-03 16:26:00', 1),
(33, 'espreso', 'Coffee Based', '25000', 'Available', 'Sajian kopi pekat dengan rasa bold dan aroma kuat, diekstraksi dari biji kopi berkualitas menggunakan tekanan tinggi. Memberikan sensasi kopi murni yang intens dalam satu tegukan.', 'espreso.jpg', '2024-08-08 16:37:43', '2024-08-08 22:07:43', 1),
(34, 'Cappuccino', 'Coffee Based', '15000', 'Available', 'Kopi klasik dengan perpaduan seimbang antara espresso, steamed milk, dan foam lembut di atasnya. Menghadirkan rasa creamy yang ringan namun tetap memiliki karakter espresso yang kuat.', 'Cappuccino.jpg', '2024-08-08 16:43:59', '2024-08-08 22:13:59', 1),
(35, 'Caffe Latte', 'Coffee Based', '20000', 'Available', 'Perpaduan espresso dan susu steamed yang creamy, menghasilkan rasa kopi yang lembut dan halus. Cocok untuk kamu yang menyukai kopi dengan karakter ringan dan milky.', 'Caffe_Latte.jpg', '2024-08-08 16:45:44', '2024-08-08 22:15:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pmode` enum('Cash','Card','Takeaway','') NOT NULL DEFAULT 'Cash',
  `payment_status` enum('Pending','Successful','Rejected','') NOT NULL DEFAULT 'Pending',
  `sub_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('Pending','Completed','Cancelled','Processing','On the way') NOT NULL DEFAULT 'Pending',
  `cancel_reason` varchar(255) DEFAULT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `email`, `firstName`, `lastName`, `phone`, `address`, `pmode`, `payment_status`, `sub_total`, `grand_total`, `order_date`, `order_status`, `cancel_reason`, `note`) VALUES
(54, 'preethi@gmail.com', 'Alfarizi', 'Zaky', '089698979', 'Jl. Aria Putra', 'Cash', 'Pending', 50000.00, 50000.00, '2024-08-11 18:00:04', 'Processing', '', ''),
(55, 'zidnan@gmail.com', 'Zidnan', 'Ahamad', '2222222222', 'Jl. Oscar 3', 'Cash', 'Pending', 35000.00, 35000.00, '2024-08-10 18:02:26', 'On the way', '', ''),
(56, 'zidnan@gmail.com', 'Jihan', 'Aulia', '0000000000', 'Jl. Oscar 2', 'Takeaway', 'Successful', 30000.00, 30000.00, '2024-08-11 18:04:16', 'Completed', '', ''),
(57, 'jhon@gmail.com', 'Akbar', 'Debar', '087876759', 'Jl. Pamulang 2', 'Takeaway', 'Successful', 20000.00, 20000.00, '2024-08-08 18:05:26', 'Completed', '', ''),
(58, 'zidnan@gmail.com', 'Zidnan', 'Ahamad', '085657549', 'Jl. Puspitek', 'Takeaway', 'Pending', 35000.00, 35000.00, '2024-08-10 20:12:14', 'Cancelled', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `itemName`, `image`, `quantity`, `price`, `total_price`) VALUES
(122, 54, 'Americano', 'Americano.jpg', 1, 25000, 25000.00),
(123, 54, 'espreso', 'espreso.jpg', 1, 15000, 15000.00),
(124, 54, 'Mocha Hazelnut Signature', 'Mocha_Hazelnut_Signature.jpg', 1, 10000, 10000.00),
(125, 55, 'Waffle', 'Waffle.jpg', 1, 10000, 10000.00),
(126, 55, 'Chocolate', 'Chocolate.jpg', 3, 10000, 30000.00),
(127, 55, 'Chicken Wings', 'Chicken_Wings.jpg', 2, 15000, 30000.00),
(128, 56, 'Americano', 'Americano.jpg', 1, 25000, 25000.00),
(129, 56, 'Mocha Hzelnut Signature', 'Mocha_Hazelnut_Signature.jpg', 1, 10000, 10000.00),
(130, 57, 'espreso', 'espreso.jpg', 2, 10000, 20000.00),
(131, 57, 'Chocolate', 'Chocolate.jpg', 2, 10000, 20000.00),
(132, 58, 'Americano', 'Americano.jpg', 3, 25000, 75000.00),
(133, 58, 'Waffle', 'Waffle.jpg', 3, 10000, 30000.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `noOfGuests` int(50) NOT NULL,
  `reservedTime` time NOT NULL,
  `reservedDate` date NOT NULL,
  `reservedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','On Process','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`email`, `name`, `contact`, `noOfGuests`, `reservedTime`, `reservedDate`, `reservedAt`, `status`, `reservation_id`) VALUES
('asnah@gmail.com', 'Asnah Afifah', '085152348', 6, '12:00:00', '2024-07-31', '2024-07-29 15:35:05', 'Completed', 1),
('zidnan@gmail.com', 'Zidnan', '1111111111', 5, '10:00:07', '2024-08-11', '2024-08-10 18:14:55', 'Pending', 2),
('preethi@gmail.com', 'Alfarizi Zaky', '089698979', 2, '06:30:59', '2024-08-10', '2024-08-03 18:15:54', 'On Process', 3),
('jhon@gmail.com', 'Akbar Debar', '087876759', 9, '20:45:59', '2024-08-09', '2024-08-05 18:16:38', 'Cancelled', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `review_date` date DEFAULT current_timestamp(),
  `status` enum('approved','pending','rejected') DEFAULT 'pending',
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `email`, `order_id`, `rating`, `review_text`, `review_date`, `status`, `response`) VALUES
(1, 'zidnan@gmail.com', 56, 5, 'Kopinya enak, aromanya kuat dan rasanya pas, tapi sayangnya minumannya sampai ke meja sudah agak dingin. Kudapannya juga kurang renyah. Semoga ke depannya bisa lebih ditingkatkan lagi', '2024-08-10', 'approved', 'Thank you for your feedback.'),
(2, 'jhon@gmail.com', 57, 3, 'Minumannya benar-benar enak! Pasti akan pesan lagi lain kali!', '2024-08-11', 'pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `role` enum('superadmin','admin','delivery boy','waiter') NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` varchar(255) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `firstName`, `lastName`, `email`, `contact`, `role`, `password`, `createdAt`, `updatedAt`, `profile_image`) VALUES
(2, 'Khansa', 'Ramadhani', 'eca@gmail.com', '0851989678', 'superadmin', 'eca0711', '2024-08-02 19:45:36', '2024-08-10 15:30:48', 'user-girl.png'),
(3, 'Rifky', 'Ramadhan', 'rifky@mail.com', '0878720854', 'waiter', 'rifky111', '2024-08-02 19:46:10', '2024-08-02 19:46:10', 'default.jpg'),
(5, 'Fasya', 'Azka', 'fasya@mail.com', '085819808489', 'delivery boy', 'fasya234', '2024-08-04 06:51:20', '2024-08-04 06:51:38', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `firstName`, `lastName`, `contact`, `password`, `dateCreated`, `profile_image`) VALUES
('asna@gmail.com', 'Asna', 'Afifah', '085152348', 'AsnaA', '2024-07-26 12:50:46', 'user-girl.png'),
('jhon@gmail.com', 'Akbar', 'Debar', '087876759', 'JhonP', '2024-08-10 15:37:56', 'default.jpg'),
('preethi@gmail.com', 'Alfarizi', 'Zaky', '089698979', 'Preethi123', '2024-08-10 15:36:50', 'default.jpg'),
('zidnan@gmail.com', 'Zidnan', 'Ahamad', '1111111111', 'Zidnan123', '2024-07-30 12:45:21', 'user-boy.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menucategory`
--
ALTER TABLE `menucategory`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `itemId` (`itemName`) USING BTREE;

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `email` (`email`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `menucategory`
--
ALTER TABLE `menucategory`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
