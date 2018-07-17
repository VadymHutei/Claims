-- --------------------------------------------------------
-- Сервер:                       localhost
-- Версія сервера:               5.7.22 - MySQL Community Server (GPL)
-- ОС сервера:                   Linux
-- HeidiSQL Версія:              9.5.0.5280
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table claims.claims: ~1 rows (приблизно)
DELETE FROM `claims`;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` (`id`, `date`, `store_id`, `name`, `phone_number`, `email`, `text`) VALUES
	(1, '2018-07-04 01:56:48', '1fopqjw9', NULL, NULL, NULL, 'test');
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;

-- Dumping data for table claims.logs: ~12 rows (приблизно)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `title`, `text`, `date`) VALUES
	(1, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 18:06:00'),
	(2, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 18:47:12'),
	(3, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:44:15'),
	(4, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:47:09'),
	(5, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:51:35'),
	(6, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:52:05'),
	(7, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:52:29'),
	(8, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:53:24'),
	(9, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:54:09'),
	(10, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 22:57:31'),
	(11, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 23:53:20'),
	(12, 'AdminSession', 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '2018-07-03 23:53:52');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping data for table claims.managers: ~8 rows (приблизно)
DELETE FROM `managers`;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` (`id`, `name`, `position`, `photo`, `email`) VALUES
	(1, 'Елена Решетникова', 'Региональный менеджер региона Днепр, Львов', 'https://img.kolgot.net/img/58e/regional_manager_reshetnikova.jpg', 'er@kolgot.net'),
	(2, 'Ольга Захарова', 'Региональный менеджер региона Харьков, Полтава', 'https://img.kolgot.net/img/cad/regional_manager_zaharova.png', 'oz@kolgot.net'),
	(3, 'Екатерина Шайденко', 'Региональный менеджер региона Кривой Рог', 'https://img.kolgot.net/img/995/regional_manager_shaidenko.jpg', 'ksh@kolgot.net'),
	(4, 'Светлана Олейник', 'Региональный менеджер региона Киев', 'https://img.kolgot.net/img/e45/regional_manager_oleinikova.jpeg', 'ss@kolgot.net'),
	(5, 'Светлана Пименова', 'Региональный менеджер региона Запорожье, Каменское', 'https://img.kolgot.net/img/212/regional_manager_pimenova.jpg', 'sp@kolgot.net'),
	(6, 'Мирослава Шпиталенко', '', 'https://img.kolgot.net/img/53f/regional_manager_shpitalenko.png', 'miroslava_od@ukr.net'),
	(7, 'Юлия Разводовская', '', 'https://img.kolgot.net/img/02f/regional_manager_razvodovskaya.JPG', '4646@i.ua'),
	(8, 'Роман Ивашко', 'Региональный менеджер Киевского, Винницкого, Житомирского региона', '', 'ir@kolgot.net');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;

-- Dumping data for table claims.photos: ~0 rows (приблизно)
DELETE FROM `photos`;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;

-- Dumping data for table claims.stores: ~54 rows (приблизно)
DELETE FROM `stores`;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`id`, `title`, `city`, `link`, `manager_id`, `franchisee`) VALUES
	('1fopqjw9', 'ТЦ "Мегамолл", ул. 600-летия, 17 е', 'Винница', 'http://kolg.net/80g', 8, 'Y'),
	('1zhe43lo', 'пр-кт. Кирова 119', 'Днепр', 'http://kolg.net/ruj', 1, 'N'),
	('2etvydf4', 'ТРЦ Мост сити', 'Днепр', 'http://kolg.net/1qf', 1, 'N'),
	('2p3ea1vw', 'ТЦ Дафи', 'Днепр', 'http://kolg.net/wmp', 1, 'N'),
	('2xfmixe9', 'ТЦ Караван', 'Днепр', 'http://kolg.net/9fo', 1, 'N'),
	('43vp8so6', 'ТЦ Кодак', 'Днепр', 'http://kolg.net/s7n', 1, 'N'),
	('49gf63qt', 'ТЦ Новый центр', 'Днепр', 'http://kolg.net/qru', 1, 'N'),
	('4cce7nrj', 'ТЦ Славутич', 'Днепр', 'http://kolg.net/82e', 1, 'N'),
	('5q6tz2rk', 'ТЦ Фрунзе', 'Днепр', 'http://kolg.net/uih', 1, 'N'),
	('5ybg7e79', 'ул. Гончара 32', 'Днепр', 'http://kolg.net/o6q', 1, 'N'),
	('6f11fsj6', 'ул. Мостовая 2', 'Днепр', 'http://kolg.net/w4q', 1, 'N'),
	('6uus23b2', 'ул. Рабочая 79', 'Днепр', 'http://kolg.net/htn', 1, 'N'),
	('6x8q0owg', 'ТРК "Глобал.ua", ул.Киевская,77', 'Житомир', 'http://kolg.net/i9j', 8, 'N'),
	('7hct7xqt', 'ул. Киевская, 64', 'Житомир', 'http://kolg.net/6gq', 7, 'Y'),
	('7t7qy0qd', 'пр.Металлургов, 14', 'Запорожье', 'http://kolg.net/wvc', 5, 'N'),
	('9rg1a22d', 'ТРЦ Аврора', 'Запорожье', 'http://kolg.net/wm2', 5, 'N'),
	('9s3h3doc', 'ТЦ Амстор, ул. Чаривна 74', 'Запорожье', 'http://kolg.net/i6t', 5, 'N'),
	('9wr822s0', 'ТЦ Амстор, ул.Новокузнецкая, 41', 'Запорожье', 'http://kolg.net/mop', 5, 'N'),
	('9y4dbo10', 'ТЦ Амстор, ул.Победы, 64', 'Запорожье', 'http://kolg.net/2cy', 5, 'N'),
	('ayfzywn0', 'ТЦ Терра', 'Каменское', 'http://kolg.net/p1i', 5, 'N'),
	('c64pdp5q', 'Дрим Таун', 'Киев', 'http://kolg.net/1jv', 8, 'N'),
	('ccgpphaw', 'ТРЦ Lavina Mall (магазин)', 'Киев', 'http://kolg.net/3qr', 8, 'N'),
	('cupz40sw', 'ТРЦ Silver Breeze', 'Киев', 'http://kolg.net/3g1', 4, 'N'),
	('dapn64eh', 'ТРЦ SkyMall, пр-т Генерала Ватутіна, 2', 'Киев', 'http://kolg.net/vk9', 4, 'N'),
	('do16xvxy', 'ТЦ Променада парк', 'Киев', 'http://kolg.net/h9o', 8, 'N'),
	('dtcm9me6', 'Рив гош', 'Киев', 'http://kolg.net/hev', 4, 'N'),
	('dx9heyjk', 'ТЦ Апполо', 'Днепр', 'http://kolg.net/em5', 1, 'N'),
	('e3b7226u', 'ТРЦ РайON', 'Киев', 'http://kolg.net/3p1', 4, 'N'),
	('eaj0t7bz', 'Смарт плаза Политех', 'Киев', 'http://kolg.net/k9w', 8, 'N'),
	('eb9wybhh', 'ТЦ  Гулливер', 'Киев', 'http://kolg.net/3o7', 4, 'N'),
	('ey559s8q', 'ТЦ Academ-City', 'Киев', 'http://kolg.net/0dv', 8, 'N'),
	('f8skdhzw', 'ТЦ New Way', 'Киев', 'http://kolg.net/5y4', 4, 'N'),
	('ftmny9zk', 'ТЦ Novus, пр.М.Бажана, 8', 'Киев', 'http://kolg.net/vuj', 4, 'N'),
	('hj0kwu93', 'ТЦ Глобус, Майдан Незалежності, 1', 'Киев', 'http://kolg.net/266', 4, 'N'),
	('jttfm9ua', 'ТЦ Космополит', 'Киев', 'http://kolg.net/pvs', 8, 'N'),
	('klyoib74', 'ул. Саксаганского 87', 'Киев', 'http://kolg.net/p9r', 4, 'N'),
	('knmj7lme', 'ул.Большая Васильковская, 67/7', 'Киев', 'http://kolg.net/0yw', 4, 'N'),
	('l4c2mfjv', 'ТРК Солнечная Галерея', 'Кривой Рог', 'http://kolg.net/qun', 3, 'N'),
	('lcx9fjdm', 'ТЦ Терра', 'Кривой Рог', 'http://kolg.net/un0', 3, 'N'),
	('mh7tk1ak', 'вул.Староміська, 1', 'Львов', 'http://kolg.net/uvv', 1, 'N'),
	('o2tbvnk5', 'вул.Степана Бандери, 71', 'Львов', 'http://kolg.net/x00', 1, 'N'),
	('oweftfth', 'пл.Старосенная,1а', 'Одесса', 'http://kolg.net/rqd', 6, 'Y'),
	('pylqfex8', 'ул. Марсельская,35-б', 'Одесса', 'http://kolg.net/67h', 6, 'Y'),
	('q6msr6ux', 'ул.Генуэзская,24б', 'Одесса', 'http://kolg.net/yss', 6, 'Y'),
	('so5zxy6u', 'ул.Екатерининская, 27/1', 'Одесса', 'http://kolg.net/lqf', 6, 'Y'),
	('t73lbw61', 'ул.Пушкина, 47', 'Полтава', 'http://kolg.net/6gi', 2, 'N'),
	('uz5t75y1', 'ТЦ Конкорд', 'Полтава', 'http://kolg.net/osy', 2, 'N'),
	('vo4ghdyp', 'пр.Гагарина, 52', 'Харьков', 'http://kolg.net/wu0', 2, 'N'),
	('vtdw9xen', 'ТРЦ Караван', 'Харьков', 'http://kolg.net/k9d', 2, 'N'),
	('x160blda', 'ТРЦ Украина', 'Харьков', 'http://kolg.net/auh', 2, 'N'),
	('xwpmfyqp', 'ТЦ Дафи', 'Харьков', 'http://kolg.net/ogr', 2, 'N'),
	('y3v1q1l8', 'ТЦ Французский бульвар', 'Харьков', 'http://kolg.net/2wu', 2, 'N'),
	('zj18zzuh', 'ул. Пушкинская 72', 'Харьков', 'http://kolg.net/x2c', 2, 'N'),
	('zzuaq4tn', 'ул.Сумская, 73', 'Харьков', 'http://kolg.net/szi', 2, 'N');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
