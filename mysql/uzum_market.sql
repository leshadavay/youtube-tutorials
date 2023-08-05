-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 05 2023 г., 12:58
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `uzum_market`
--

CREATE DATABASE uzum_market;
USE uzum_market;

-- --------------------------------------------------------

--
-- Структура таблицы `uzum_customers`
--

CREATE TABLE `uzum_customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `uzum_customers`
--

INSERT INTO `uzum_customers` (`id`, `first_name`, `last_name`, `address`, `tel`) VALUES
(1, 'Akmal', 'Komilov', 'Tashkent 123', '+99890-412-52-12'),
(2, 'Komil', 'Qodirov', 'Navoiy 42', '+99899-532-35-23'),
(3, 'Qodir', 'Akmalov', 'Buxoro 45', '+99895-451-64-63'),
(4, 'Nodir', 'Sobirov', 'Fargona 63', '+99893-123-42-32');

-- --------------------------------------------------------

--
-- Структура таблицы `uzum_orders`
--

CREATE TABLE `uzum_orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_price` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_cnt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `uzum_orders`
--

INSERT INTO `uzum_orders` (`id`, `customer_id`, `order_price`, `date`, `address`, `status`, `product_cnt`) VALUES
(1, 1, 60000, '2023-06-30 19:00:00', 'Toshkent 123', 3, 1),
(2, 4, 75000, '2023-07-02 19:00:00', 'Buxoro 45', 1, 1),
(3, 1, 279000, '2023-07-03 19:00:00', 'Navoiy 42', 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `uzum_order_products`
--

CREATE TABLE `uzum_order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `uzum_order_products`
--

INSERT INTO `uzum_order_products` (`id`, `order_id`, `product_id`, `customer_id`, `price`, `qty`, `total`, `status`) VALUES
(1, 1, 2, 1, 30000, 2, 60000, 1),
(2, 2, 1, 4, 75000, 1, 75000, 1),
(3, 3, 4, 1, 50000, 1, 50000, 1),
(4, 3, 3, 1, 93000, 1, 93000, 1),
(5, 3, 2, 1, 30000, 1, 30000, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `uzum_products`
--

CREATE TABLE `uzum_products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `uzum_products`
--

INSERT INTO `uzum_products` (`id`, `category_id`, `name`, `price`, `stock`) VALUES
(1, 1, 'JBL earphones', 75000, 45),
(2, 2, 'futbolka free-size', 30000, 60),
(3, 1, 'asus klaviatura', 93000, 10),
(4, 1, 'acer mouse', 50000, 32);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `uzum_customers`
--
ALTER TABLE `uzum_customers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `uzum_orders`
--
ALTER TABLE `uzum_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `uzum_order_products`
--
ALTER TABLE `uzum_order_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `uzum_products`
--
ALTER TABLE `uzum_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `uzum_customers`
--
ALTER TABLE `uzum_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `uzum_orders`
--
ALTER TABLE `uzum_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `uzum_order_products`
--
ALTER TABLE `uzum_order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `uzum_products`
--
ALTER TABLE `uzum_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
