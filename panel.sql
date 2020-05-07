-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u9
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 07 2020 г., 08:57
-- Версия сервера: 5.5.62-0+deb8u1
-- Версия PHP: 5.6.40-0+deb8u11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE IF NOT EXISTS `games` (
`game_id` int(10) NOT NULL,
  `game_name` varchar(44) DEFAULT NULL,
  `game_code` varchar(8) DEFAULT NULL,
  `game_query` varchar(32) DEFAULT NULL,
  `image_url` varchar(128) DEFAULT NULL,
  `game_min_slots` int(8) DEFAULT NULL,
  `game_max_slots` int(8) DEFAULT NULL,
  `game_min_port` int(8) DEFAULT NULL,
  `game_max_port` int(8) DEFAULT NULL,
  `game_price` decimal(10,2) DEFAULT NULL,
  `game_status` int(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`game_id`, `game_name`, `game_code`, `game_query`, `image_url`, `game_min_slots`, `game_max_slots`, `game_min_port`, `game_max_port`, `game_price`, `game_status`) VALUES
(1, 'SA:MP 0.3.7 [LITE] (50-1000 слотов)', 'samp', 'samp', 'https://lk.advens.ru/img/samp.png', 50, 1000, 1111, 9999, 0.50, 1),
(2, 'SA:MP 0.3.7 [VIP] (500 слотов)', 'samp', 'samp', 'https://lk.advens.ru/img/samp.png', 500, 500, 1111, 9999, 0.12, 1),
(3, 'SA:MP 0.3.7 [PRO] (1000 слотов)', 'samp', 'samp', 'https://lk.advens.ru/img/samp.png', 1000, 1000, 1111, 9999, 0.10, 1),
(4, 'CR:MP 0.3.E [LITE] (50-1000 слотов)', 'crmp', 'crmp', 'https://lk.advens.ru/img/crmp.png', 50, 1000, 1111, 9999, 0.50, 1),
(5, 'CR:MP 0.3.E [PRO] (500 слотов)', 'crmp', 'crmp', 'https://lk.advens.ru/img/crmp.png', 500, 500, 1111, 9999, 0.12, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`invoice_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `invoice_ammount` decimal(10,2) DEFAULT NULL,
  `invoice_status` int(1) DEFAULT NULL,
  `invoice_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
`location_id` int(10) NOT NULL,
  `location_name` varchar(32) DEFAULT NULL,
  `location_ip` varchar(15) DEFAULT NULL,
  `location_ip2` varchar(15) DEFAULT NULL,
  `location_user` varchar(32) DEFAULT NULL,
  `location_password` varchar(32) DEFAULT NULL,
  `location_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`news_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `news_title` varchar(32) DEFAULT NULL,
  `news_text` text,
  `news_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_id`, `user_id`, `news_title`, `news_text`, `news_date_add`) VALUES
(1, 1, 'Arbite RP Открытие совсем скоро!', 'Вступайте в нашу группу проекта Arbite RP Uran!\nhttps://vk.com/arbite_rp_uran', '2020-04-23 01:41:39');

-- --------------------------------------------------------

--
-- Структура таблицы `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
`server_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `game_id` int(10) DEFAULT NULL,
  `location_id` int(10) DEFAULT NULL,
  `server_database` int(1) DEFAULT NULL,
  `server_slots` int(8) DEFAULT NULL,
  `server_port` int(8) DEFAULT NULL,
  `server_password` varchar(32) DEFAULT NULL,
  `server_status` int(1) DEFAULT NULL,
  `server_cpu_load` float NOT NULL DEFAULT '0',
  `server_ram_load` float NOT NULL DEFAULT '0',
  `server_date_reg` datetime DEFAULT NULL,
  `server_date_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `servers_stats`
--

CREATE TABLE IF NOT EXISTS `servers_stats` (
  `server_id` int(11) DEFAULT NULL,
  `server_stats_date` datetime DEFAULT NULL,
  `server_stats_players` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`ticket_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `ticket_name` varchar(32) DEFAULT NULL,
  `ticket_status` int(1) DEFAULT NULL,
  `ticket_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_messages`
--

CREATE TABLE IF NOT EXISTS `tickets_messages` (
`ticket_message_id` int(10) NOT NULL,
  `ticket_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `ticket_message` text,
  `ticket_message_date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) NOT NULL,
  `user_email` varchar(96) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_firstname` varchar(32) DEFAULT NULL,
  `user_lastname` varchar(32) DEFAULT NULL,
  `user_status` int(1) DEFAULT NULL,
  `user_balance` decimal(10,2) DEFAULT NULL,
  `user_access_level` int(1) DEFAULT NULL,
  `user_news` int(10) DEFAULT NULL,
  `user_date_reg` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_firstname`, `user_lastname`, `user_status`, `user_balance`, `user_access_level`, `user_news`, `user_date_reg`) VALUES
(1, 'slaviha21@gmail.com', '$2y$10$sPGgyN6f2nUHEqiW6A5EEOREsg1n6eJr6kCFUyLNs2DmWi6tpfnqC', 'Администратор', 'Хостинга', 1, 0.00, 3, 0, '2020-04-20 22:06:04'),
(2, 'sanyagames227@gmail.com', '$2y$10$eF2iCaisPaXv1AdXelu6IubgYxgs8QWMZSp6N5MITg3jmofYYtOK2', 'Саша', 'Диса', 1, 0.00, 3, 0, '2020-04-20 22:13:08'),
(3, 'channeloxothuk@gmail.com', '$2y$10$xKnvtRGW3GUZMDL9T.9GbO9UAeRXxWoqWp.k6208Y0Xa.XwSGtIr2', 'Мирон', 'Сосать', 1, 0.00, 1, 1, '2020-04-21 21:15:06'),
(4, 'arbite.hosttop@gmail.com', '$2y$10$KJNJY/mFMnqRSeT8RyerceTKCASJKiaEeRqi7lNMcgdTm1473dKJa', 'Алекс', 'Деф', 1, 0.00, 1, 0, '2020-04-21 21:56:43'),
(5, 'sanyadisatop@mail.ru', '$2y$10$/k08dgusoUSoRUccMO574.ACDf01K2y4m2m0y..92X.DcVH1gZNGi', 'Эбер', 'Вайс', 1, 0.00, 1, 1, '2020-04-21 22:17:38'),
(6, 'gardener@gmail.com', '$2y$10$xxLc0flhNhhUXw63VMtOp.pStYaNUnkTvpmevZI6g1AilUEGmQA4q', 'Виталик', 'Садовод', 1, 0.00, 1, 1, '2020-04-21 22:19:09'),
(7, 'salvatore809099@mail.ru', '$2y$10$98fPdsgEyb.vGZQv7p2E1eSS/PYtnL2002vydVSFfuAG9y131WDW2', 'Санёк', 'Санёк', 1, 0.00, 1, 0, '2020-04-22 10:10:03'),
(8, 'otsosalbodya@mail.ru', '$2y$10$xoe/V0pCtGsq9TeHzDHtRue58H.27WaY5k8BvBu0CwBBXJDywmLne', 'Sosi', 'Bogdan', 1, 0.00, 1, 1, '2020-04-23 01:21:14'),
(9, 'dmitro.romanoff@mail.ru', '$2y$10$qFyuf2eP3ZNhofeI7stIfON6q3S/dgld2ejAoY2yXnmPy9T9hZrxi', 'Дмитрий', 'Романов', 1, 0.00, 1, 0, '2020-04-23 11:04:42'),
(10, 'zv117@yandex.ru', '$2y$10$S0cYNkg1j3Z02csFdzPymO30urWtu27QL4bvRmc50Yv4ZjGJJFtFS', 'Вячеслав', 'Залетаев', 1, 4388.00, 3, 0, '2020-04-23 18:26:51'),
(11, 'semen.bakulin06@mail.ru', '$2y$10$vGMg3Jq.MKHnDIFZ/yZ8HumKv2IX/zPFB78WQnEobvQ7PW3oq4gwO', 'Семён', 'Бакулин', 1, 0.00, 1, 0, '2020-04-24 13:21:21'),
(12, 'semen.bakulin061@mail.ru', '$2y$10$xIkzqRxsSkY2LPorwFXQWOjm9rDSzd1lzCGdB1xX.lr.21.DKsIJG', 'Семён', 'Бакулин', 1, 0.00, 1, 0, '2020-04-24 13:29:42'),
(13, 'support@g-24.host', '$2y$10$DTG4EAA3dmvc9J0dLpU6DuMM9KbotRruBqJN9Q6WRki9Dpy.1Ai2W', 'Алексей', 'Сундеев', 1, 75.00, 1, 0, '2020-04-24 13:31:21'),
(14, 'sanya.shibaev2016@yandex.ru', '$2y$10$VPRTOancsLvBTX306550FOro4rmc1mm.Fjmr.UoOscnFc4KgJL76O', 'Михаил', 'Зубенко', 1, 0.00, 1, 0, '2020-04-24 18:11:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
 ADD PRIMARY KEY (`game_id`);

--
-- Индексы таблицы `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`invoice_id`);

--
-- Индексы таблицы `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`location_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`news_id`);

--
-- Индексы таблицы `servers`
--
ALTER TABLE `servers`
 ADD PRIMARY KEY (`server_id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`ticket_id`);

--
-- Индексы таблицы `tickets_messages`
--
ALTER TABLE `tickets_messages`
 ADD PRIMARY KEY (`ticket_message_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
MODIFY `game_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
MODIFY `invoice_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `locations`
--
ALTER TABLE `locations`
MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
MODIFY `news_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `servers`
--
ALTER TABLE `servers`
MODIFY `server_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
MODIFY `ticket_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tickets_messages`
--
ALTER TABLE `tickets_messages`
MODIFY `ticket_message_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
