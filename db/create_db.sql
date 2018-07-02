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


-- Dumping database structure for claims
CREATE DATABASE IF NOT EXISTS `claims` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `claims`;

-- Dumping structure for таблиця claims.claims
DROP TABLE IF EXISTS `claims`;
CREATE TABLE IF NOT EXISTS `claims` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `store_id` varchar(8) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_claims_stores` (`store_id`),
  CONSTRAINT `FK_claims_stores` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table claims.claims: ~0 rows (приблизно)
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;

-- Dumping structure for таблиця claims.managers
DROP TABLE IF EXISTS `managers`;
CREATE TABLE IF NOT EXISTS `managers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `position` varchar(256) NOT NULL,
  `photo` varchar(256) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table claims.managers: ~8 rows (приблизно)
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

-- Dumping structure for таблиця claims.photos
DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `claim_id` int(8) unsigned NOT NULL,
  `photo` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_photos_claims` (`claim_id`),
  CONSTRAINT `FK_photos_claims` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table claims.photos: ~0 rows (приблизно)
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;

-- Dumping structure for таблиця claims.stores
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` varchar(8) NOT NULL,
  `title` varchar(256) NOT NULL,
  `link` varchar(128) NOT NULL,
  `manager_id` tinyint(3) unsigned NOT NULL,
  `franchisee` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table claims.stores: ~54 rows (приблизно)
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`id`, `title`, `link`, `manager_id`, `franchisee`) VALUES
	('1fopqjw9', 'Винница, ТЦ "Мегамолл", ул. 600-летия, 17 е', 'http://kolg.net/80g', 8, 'N'),
	('1zhe43lo', 'Днепр, пр-кт. Кирова 119', 'http://kolg.net/ruj', 1, 'N'),
	('2etvydf4', 'Днепр, ТРЦ Мост сити', 'http://kolg.net/1qf', 1, 'N'),
	('2p3ea1vw', 'Днепр, ТЦ Дафи', 'http://kolg.net/wmp', 1, 'N'),
	('2xfmixe9', 'Днепр, ТЦ Караван', 'http://kolg.net/9fo', 1, 'N'),
	('43vp8so6', 'Днепр, ТЦ Кодак', 'http://kolg.net/s7n', 1, 'N'),
	('49gf63qt', 'Днепр, ТЦ Новый центр', 'http://kolg.net/qru', 1, 'N'),
	('4cce7nrj', 'Днепр, ТЦ Славутич', 'http://kolg.net/82e', 1, 'N'),
	('5q6tz2rk', 'Днепр, ТЦ Фрунзе', 'http://kolg.net/uih', 1, 'N'),
	('5ybg7e79', 'Днепр, ул. Гончара 32', 'http://kolg.net/o6q', 1, 'N'),
	('6f11fsj6', 'Днепр, ул. Мостовая 2', 'http://kolg.net/w4q', 1, 'N'),
	('6uus23b2', 'Днепр, ул. Рабочая 79', 'http://kolg.net/htn', 1, 'N'),
	('6x8q0owg', 'Житомир, ТРК "Глобал.ua", ул.Киевская,77', 'http://kolg.net/i9j', 8, 'N'),
	('7hct7xqt', 'Житомир, ул. Киевская, 64', 'http://kolg.net/6gq', 7, 'Y'),
	('7t7qy0qd', 'Запорожье, пр.Металлургов, 14', 'http://kolg.net/wvc', 5, 'N'),
	('9rg1a22d', 'Запорожье, ТРЦ Аврора', 'http://kolg.net/wm2', 5, 'N'),
	('9s3h3doc', 'Запорожье, ТЦ Амстор, ул. Чаривна 74', 'http://kolg.net/i6t', 5, 'N'),
	('9wr822s0', 'Запорожье, ТЦ Амстор, ул.Новокузнецкая, 41', 'http://kolg.net/mop', 5, 'N'),
	('9y4dbo10', 'Запорожье, ТЦ Амстор, ул.Победы, 64', 'http://kolg.net/2cy', 5, 'N'),
	('ayfzywn0', 'Каменское, ТЦ Терра', 'http://kolg.net/p1i', 5, 'N'),
	('c64pdp5q', 'Киев, Дрим Таун', 'http://kolg.net/1jv', 8, 'N'),
	('ccgpphaw', 'Киев, ТРЦ Lavina Mall (магазин)', 'http://kolg.net/3qr', 8, 'N'),
	('cupz40sw', 'Киев, ТРЦ Silver Breeze', 'http://kolg.net/3g1', 4, 'N'),
	('dapn64eh', 'Киев, ТРЦ SkyMall, пр-т Генерала Ватутіна, 2', 'http://kolg.net/vk9', 4, 'N'),
	('do16xvxy', 'Киев, ТЦ Променада парк', 'http://kolg.net/h9o', 8, 'N'),
	('dtcm9me6', 'Киев, Рив гош', 'http://kolg.net/hev', 4, 'N'),
	('dx9heyjk', 'Днепр, ТЦ Апполо', 'http://kolg.net/em5', 1, 'N'),
	('e3b7226u', 'Киев, ТРЦ РайON', 'http://kolg.net/3p1', 4, 'N'),
	('eaj0t7bz', 'Киев, Смарт плаза Политех', 'http://kolg.net/k9w', 8, 'N'),
	('eb9wybhh', 'Киев, ТЦ  Гулливер', 'http://kolg.net/3o7', 4, 'N'),
	('ey559s8q', 'Киев, ТЦ Academ-City', 'http://kolg.net/0dv', 8, 'N'),
	('f8skdhzw', 'Киев, ТЦ New Way', 'http://kolg.net/5y4', 4, 'N'),
	('ftmny9zk', 'Киев, ТЦ Novus, пр.М.Бажана, 8', 'http://kolg.net/vuj', 4, 'N'),
	('hj0kwu93', 'Киев, ТЦ Глобус, Майдан Незалежності, 1', 'http://kolg.net/266', 4, 'N'),
	('jttfm9ua', 'Киев, ТЦ Космополит', 'http://kolg.net/pvs', 8, 'N'),
	('klyoib74', 'Киев, ул. Саксаганского 87', 'http://kolg.net/p9r', 4, 'N'),
	('knmj7lme', 'Киев, ул.Большая Васильковская, 67/7', 'http://kolg.net/0yw', 4, 'N'),
	('l4c2mfjv', 'Кривой Рог, ТРК Солнечная Галерея', 'http://kolg.net/qun', 3, 'N'),
	('lcx9fjdm', 'Кривой рог, ТЦ Терра', 'http://kolg.net/un0', 3, 'N'),
	('mh7tk1ak', 'Львов, вул.Староміська, 1', 'http://kolg.net/uvv', 1, 'N'),
	('o2tbvnk5', 'Львов, вул.Степана Бандери, 71', 'http://kolg.net/x00', 1, 'N'),
	('oweftfth', 'Одесса, пл.Старосенная,1а', 'http://kolg.net/rqd', 6, 'Y'),
	('pylqfex8', 'Одесса, ул. Марсельская,35-б', 'http://kolg.net/67h', 6, 'Y'),
	('q6msr6ux', 'Одесса, ул.Генуэзская,24б', 'http://kolg.net/yss', 6, 'Y'),
	('so5zxy6u', 'Одесса, ул.Екатерининская, 27/1', 'http://kolg.net/lqf', 6, 'Y'),
	('t73lbw61', 'Полтава, ул.Пушкина, 47', 'http://kolg.net/6gi', 2, 'N'),
	('uz5t75y1', 'Полтава, ТЦ Конкорд', 'http://kolg.net/osy', 2, 'N'),
	('vo4ghdyp', 'Харьков, пр.Гагарина, 52', 'http://kolg.net/wu0', 2, 'N'),
	('vtdw9xen', 'Харьков, ТРЦ Караван', 'http://kolg.net/k9d', 2, 'N'),
	('x160blda', 'Харьков, ТРЦ Украина', 'http://kolg.net/auh', 2, 'N'),
	('xwpmfyqp', 'Харьков, ТЦ Дафи', 'http://kolg.net/ogr', 2, 'N'),
	('y3v1q1l8', 'Харьков, ТЦ Французский бульвар', 'http://kolg.net/2wu', 2, 'N'),
	('zj18zzuh', 'Харьков, ул. Пушкинская 72', 'http://kolg.net/x2c', 2, 'N'),
	('zzuaq4tn', 'Харьков, ул.Сумская, 73', 'http://kolg.net/szi', 2, 'N');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
