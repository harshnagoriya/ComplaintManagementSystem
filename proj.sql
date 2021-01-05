-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table x.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.articles: ~1 rows (approximately)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `content`, `user_id`, `created`) VALUES
	(1, 'Release Salary In Time, AICTE To Approved Institutes', '<p><strong>New Delhi:</strong></p>\r\n\r\n<p>After receiving complaints from some of the institutions, the <a href="https://www.ndtv.com/education/aicte-mumbai-university-announce-workshop-on-universal-human-values-in-education-for-educators-2226742" target="_self">All India Council for Technical Education or AICTE</a>, the national level technical and professional education regulator, has asked the approved colleges to release the salary of faculty and staff in time. This is the second time, the Council&nbsp;is asking the institutions working under its supervision to pay the salary in time.</p>\r\n\r\n<p>&quot;<a href="https://www.ndtv.com/education/new-session-in-standalone-b-schools-to-begin-from-july-no-hike-in-fees-permissible-aicte-2224754" target="_self">AICTE</a> has been receiving complaints that some of the institutions have not yet paid the salary of faculty/staff for the month of March 2020 and in some cases even Feb 2020,&quot; the notification from AICTE said.&nbsp;</p>\r\n\r\n<p>&quot;Kindly note that this is a National Emergency as the whole country is under lock down due to COVID-19 and non-payment of salary to staff would lead to great stress and even starvation to the families of some of the staff members. You are therefore requested to kindly ensure that the salary of faculty and staff is released in time,&quot; it said.</p>\r\n\r\n<p>&quot;It has been learnt that various institutions have not paid salary to their faculty and staff members, for the duration of the lockdown. Also certain institutions have terminated the services of certain faculty/staff members. It is clarified that salary and other dues to the faculty/staff members will be released for the duration of lockdown and also terminations, if any, made during the lockdown will be withdrawn. Hence, the same may be strictly complied with,&quot; an earlier notification released by the AICTE read.&nbsp;</p>\r\n\r\n<p>In a related development today, Mumbai University, in collaboration with the AICTE (Western Region), announced that it will organize an online workshop on &#39;Universal Human Values in Education&#39;. The workshop will be held from May 13 to May 17, 2020. The workshop is of &#39;paramount&#39; significance to continue teaching process amid Covid-19 pandemic, says the University.</p>\r\n\r\n<p>New academic session in standalone business schools or management colleges offering post graduate diploma or certificate courses will begin from July 1 and the institutions will not be allowed to hike fees, the AICTE said last week.</p>\r\n\r\n<p>The new academic session for freshers will begin from August 1.</p>\r\n', 2, '2021-01-05');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Dumping structure for table x.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(6) NOT NULL,
  `dept_id` int(6) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `priority` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `dept_id`, `name`, `priority`) VALUES
	(1, 1, 'Salary', 1),
	(2, 1, 'Leave', 0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table x.complaints
CREATE TABLE IF NOT EXISTS `complaints` (
  `id` int(6) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `dept_id` int(6) DEFAULT NULL,
  `category_id` int(6) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL,
  `open` date DEFAULT NULL,
  `close` date DEFAULT NULL,
  `technician_id` int(6) DEFAULT NULL,
  `priority` int(2) DEFAULT NULL,
  `resolution` varchar(4000) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `technician_id` (`technician_id`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_ibfk_4` FOREIGN KEY (`technician_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.complaints: ~2 rows (approximately)
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` (`id`, `title`, `description`, `dept_id`, `category_id`, `user_id`, `open`, `close`, `technician_id`, `priority`, `resolution`, `status`) VALUES
	(1, 'dfd', '<p>dsfd</p>\r\n', 1, 2, 3, '2021-01-05', '2021-01-05', 4, 1, '<p>approved</p>\r\n', 1),
	(2, 'Leave', '<p>I am sick and I need leave tomorrow</p>\r\n', 1, 2, 3, '2021-01-05', '2021-01-05', 4, 1, '<p>Your leave is granted</p>\r\n', 1);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;

-- Dumping structure for table x.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(6) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.departments: ~0 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `name`) VALUES
	(1, 'Admin');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table x.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(6) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(4000) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.faq: ~1 rows (approximately)
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` (`id`, `question`, `answer`, `user_id`, `created`) VALUES
	(1, 'What is considered as salary income? ', '<p>section 17 &#8203;&#8203; of the Income-tax Act defines the term &lsquo;salary&rsquo;. However, not going into the technical definition, generally whatever is received by an employee from an employer in cash, kind or as a facility [perquisite] is considered as salary.</p>\r\n', 2, '2021-01-05');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;

-- Dumping structure for table x.ratings
CREATE TABLE IF NOT EXISTS `ratings` (
  `user_id` int(6) DEFAULT NULL,
  `article_id` int(6) DEFAULT NULL,
  `star` int(5) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.ratings: ~0 rows (approximately)
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;

-- Dumping structure for table x.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(6) NOT NULL,
  `dept_id` int(6) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table x.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `dept_id`, `name`, `email`, `password`, `user_type`) VALUES
	(2, 1, 'Shilpi Ghosal', '07shilpighosal@gmail.com', 'shilpi', 2),
	(3, 1, 'Harsh', 'harshnagoriya@gmail.com', 'harsh', 0),
	(4, 1, 'HR Manager', 'hr@shilpi.com', 'hr', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
