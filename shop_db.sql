-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 02 2023 г., 13:38
-- Версия сервера: 5.6.51-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(20) NOT NULL DEFAULT 'в обработке'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 12, 'ророва', '7898989898', 'aa@mail.ru', 'оплата после получения', 'рооаоы', 'Процессор INTEL Core i5-12400F (23123 x 1)', 23123, '2023-06-20 11:28:42', 'в доставке');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(9, 'видеокарта MSI GeForce RTX 3060 ', 'Видеокарта MSI GeForce RTX 3060 GAMING X (LHR) [RTX 3060 GAMING X 12G] обладает высокой производительностью, благодаря чему может станет отличным выбором для настольных игровых и рабочих систем. Основой данной модели является многоядерный блок с поддержкой трассировки лучей, который дополнен 12 ГБ скоростной видеопамяти.', 41590, 'videocard-msi1.jpg', 'videocard-msi2.jpg', 'videocard-msi3.jpg'),
(11, 'Процессор INTEL Core i5-12400F', 'Процессор Intel Core i5-12400F – чип со сбалансированной производительностью. Можно использовать его для создания различных сборок. При изготовлении применялся технологический процесс 10 нм. Он позволяет добиться небольшого потребления энергии и тепловыделения. Процессор выполнен с применением архитектуры Alder Lake. Она позволила поднять производительность в сравнении с чипами прошлого поколения. Используется шесть ядер и двенадцать потоков для обработки информации.', 23123, 'processors-intel1.jpg', 'processors-intel1 (1).jpg', 'processors-intel1 (1).jpg'),
(12, 'Оперативная память Kingston Fury', 'описание', 1699, 'ozu-kingston1.jpg', '3320707091e44d6b92d41949cf5fb5b433fea80bb0e39e20f03199296e41f81e.jpg.webp', 'e2089cd75b53ea48a8910c0457566780c00d1987bddc9dabdf4d56770a4b1f9f.jpg.webp'),
(13, 'Блок питания Deepcool PF700 80+', 'Блок питания DEEPCOOL PF700 [R-PF700D-HA0B-EU] с подтвержденной сертификатом 80 PLUS Standart энергоэффективностью является отличным решением для производительной компьютерной сборки. При совокупной выходной мощности по всем линиям 700 Вт БП может быть использован для питания модулей игрового ПК, рассчитанного на запуск видеоигр и другого ресурсоемкого софта. Устройство снабжено кабелями с основным разъемом питания и разъемами для подключения ЦПУ, SATA-накопителей (6 шт) и видеокарт (до 4 шт).', 3990, 'bp-deepcol1.jpg', 'bp-deepcol2.jpg', '7a2ff0004a53ae6c2dcf2c7754b448ce93e00f0ea64a7341278937b31fb3ba67.jpg.webp'),
(14, 'Материнская плата MSI A520M-A', 'Материнская плата MSI A520M-A PRO имеет внешний вид, который наверняка придется по душе пользователям ПК с большим стажем. Основной цвет устройства – коричневый. Плата лишена отличающихся броской «внешностью» декоративных элементов. Отсутствует и подсветка.\r\nПлата MSI A520M-A PRO базируется на чипсете AMD A520. Процессорный сокет – AM4. ', 5150, 'msi_a520m_a_pro_am4_matx__1637188_1.jpg', 'msi_a520m_a_pro_am4_matx__1637188_2.jpg', 'msi_a520m_a_pro_am4_matx__1637188_3.jpg'),
(15, 'Материнская плата Gigabyte H510M', 'Материнская плата GIGABYTE H510M H станет надежным решением для сборки офисной рабочей станции. Она выполнена в форм-факторе Micro-ATX и содержит в своей основе чипсет Intel H510 с процессорным разъемом LGA 1200. В оснащение платы входят 2 слота под размещение до 64 ГБ оперативной памяти, 4 разъема SATAIII и 1 разъем M.2 под установку накопителей, по одному слоту расширения PCI-E x16 и PCI-E x1 для графических адаптеров.', 5499, 'materinskaya_plata_gigabyte_h510m_h_lga1200_matx__1779130_1.jpg', 'materinskaya_plata_gigabyte_h510m_h_lga1200_matx__1779130_2.jpg', 'materinskaya_plata_gigabyte_h510m_h_lga1200_matx__1779130_3.jpg'),
(16, 'Материнская плата ASROCK B550M', 'Материнская плата ASRock B550M-HDV в сочетании с компактными размерами и лаконичным оформлением обеспечивает высокие показатели производительности. Она выполнена в форм-факторе Micro-ATX. Основанная на чипсете AMD B550, плата предлагает 2 слота под оперативную память объемом до 64 ГБ, по одному слоту PCI-E x16 и PCI-E x1 под графический адаптер, 4 разъема SATA 6Gb/s и разъем M.2 для накопителей.', 9299, 'materinskaya_plata_asrock_b550m_pro4_am4_matx__1398948_1.jpg', 'materinskaya_plata_asrock_b550m_pro4_am4_matx__1398948_2.jpg', 'materinskaya_plata_asrock_b550m_pro4_am4_matx__1398948_4.jpg'),
(17, 'Жесткий диск Seagate Barracuda 3.5&#34;', 'Жесткий диск Seagate BarraCuda объемом 1 ТБ рассчитан на домашнее использование в составе настольных ПК и внешних систем хранения. Это надежная платформа для хранения объемных коллекций видео, фото, фильмов в высоком качестве. Для связи с компьютером накопитель использует интерфейс SATA III с высокими скоростными характеристиками благодаря пропускной способности 6 Гбит/с.', 3499, 'gestkiy_disk_3.5_1tb_sata_iii_64mb_7200rpm_seagate_original_barracuda_st1000dm010_1.jpg', 'gestkiy_disk_3.5_1tb_sata_iii_64mb_7200rpm_seagate_original_barracuda_st1000dm010_2.jpg', 'gestkiy_disk_3.5_1tb_sata_iii_64mb_7200rpm_seagate_original_barracuda_st1000dm010_3.jpg'),
(18, 'SSD диск SAMSUNG M.2 970 EVO', '250 ГБ SSD M.2 накопитель Samsung 970 EVO [MZ-V7E250BW] предоставляет искушенному геймеру возможность повысить производительность его стационарного компьютера и вывести удовольствие от его эксплуатации и прохождения на нем ресурсоемких игр на более высокий уровень. Аппаратная составляющая этого устройства свидетельствует о ее непревзойденном качестве и эффективности. Контроллер представлен моделью Samsung Phoenix. Память относится к типу TLC, в качестве интерфейса NAND памяти используется вид V-', 4399, 'ssd_disk_samsung_m.2_970_evo_plus_500_gb_pcie_gen_3.0_x4_v_nand_3bit_mlc_mz_v7s500bw__1017834_1.jpg', 'ssd_disk_samsung_m.2_970_evo_plus_500_gb_pcie_gen_3.0_x4_v_nand_3bit_mlc_mz_v7s500bw__1017834_2.jpg', 'ssd_disk_samsung_m.2_970_evo_plus_500_gb_pcie_gen_3.0_x4_v_nand_3bit_mlc_mz_v7s500bw__1017834_3.jpg'),
(19, 'Корпус Zalman N4 Rev.1', 'Корпус ZALMAN N4 Rev.1 Black выполнен из металла и отличается стильным дизайном. Отличительной особенностью модели является прозрачная боковая панель, благодаря чему вы сможете в любое время наслаждаться видом вашего компьютера.\r\nКорпус ZALMAN N4 Rev.1 выполнен в формате Mid-Tower и поддерживает установку материнских плат Micro-ATX, Standard-ATX и Mini-ITX, что открывает широкий выбор самых разных комплектующих для создания производительной рабочей или игровой системы.', 4699, 'zalman_n4_rev.1_bez_bp__2223490_1.jpg', 'zalman_n4_rev.1_bez_bp__2223490_2.jpg', 'zalman_n4_rev.1_bez_bp__2223490_3.jpg'),
(20, 'Кулер  Jonsbo', 'Кулер для процессора JONSBO MX400 демонстрирует универсальность и подходит для ЦПУ с разъемом для подключения AM2, AM2+, AM3, AM3+ или другим сокетом. Если центральный процессор вашей сборки выделяет до 150 Вт тепловой энергии, эта активная система воздушного охлаждения башенного типа станет удачным решением для отвода и рассеивания тепла. В конструкции этой модели с алюминиево-медным основанием и радиатором из алюминия используются тепловые трубки в количестве 6 шт.', 790, 'jonsbo_cr_1200e_2040465_1.jpg', 'jonsbo_cr_1200e_2040465_2.jpg', 'jonsbo_cr_1200e_2040465_4.jpg'),
(21, 'Видеокарта Palit  GTX 1650', 'Если вы хотите собрать игровой компьютер в ультракомпактном корпусе, то видеокарта Palit GeForce GTX 1650 Gaming Pro OC [NE61650S1BG1-1175A] станет для вас оправданным выбором. Длина видеоадаптера составляет лишь 170 мм. Устройство занимает 2 слота расширения. Не предъявляются значительные требования и к блоку питания: его мощность должна быть выше 300 Вт. Пиковая потребляемая мощность видеокарты равна 75 Вт.', 15890, '1348303_1.jpg', '1348303_2.jpg', '1348303_3.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(11, 'q', 'q1@mail.ru', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', ''),
(12, 'q', 'q@mail.ru', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '');

-- --------------------------------------------------------

--
-- Структура таблицы `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`name`) REFERENCES `products` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`name`) REFERENCES `products` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
