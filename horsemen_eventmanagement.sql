-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2021 at 06:15 AM
-- Server version: 10.2.38-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `horsemen_eventmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `championship`
--

CREATE TABLE `championship` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `championship` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_site` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validity_from` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validity_to` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'APPLIED/ACTIVE/INACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `championship`
--

INSERT INTO `championship` (`id`, `code`, `championship`, `details`, `place_name`, `address`, `phone_number`, `email_id`, `web_site`, `validity_from`, `validity_to`, `status`) VALUES
(1, 'NRT', 'Namakkal Rifle Tournament', 'Pistol and Rifle Tournament', 'Selam', 'Selam, Tamilnadu', '0475525252', 'namakkalshootting@gmail.com', 'www.nsa.co.in', '01/06/2021', '05/06/2021', 'ACTIVE'),
(2, 'CTVM', '2nd Trivandrum Cricket Championship ', 'College level ', 'Trivandrum', 'Medical college ground, tvm', '5868598652', 'Test@test.com', 'test.com', '01/01/1901', '05/01/1901', 'ACTIVE'),
(3, 'tvmC', 'Trivandrum Swimming Championship', 'College Level', 'Vellayambalam', 'Vellayambalam Swimming Club', '282828', 'Test@test.com', 'www.test.com', '04/07/2021', '10/07/2021', 'ACTIVE'),
(4, 'TVO', 'Trivandrum Volleyball tournament', 'District level ', 'Central Stadium', 'Trivandrum', '9855685956', 'anandan@gmail.com', 'trivandrumvolley.org.in', '11/07/2021', '18/07/2021', 'ACTIVE'),
(5, 'WL', 'Weight Lifting', '', 'Thiruvananthapuram', 'Velayambalam', '2333455', 'golds@gmail.com', 'www.golds.co.in', '12/07/2021', '18/07/2021', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `mst_gender`
--

CREATE TABLE `mst_gender` (
  `id` int(11) NOT NULL,
  `gender` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mst_gender`
--

INSERT INTO `mst_gender` (`id`, `gender`) VALUES
(1, 'Female'),
(2, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `sports_agegroup`
--

CREATE TABLE `sports_agegroup` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `agegroup_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age_from` int(11) DEFAULT NULL,
  `age_to` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_agegroup`
--

INSERT INTO `sports_agegroup` (`id`, `championship_id`, `item_id`, `agegroup_name`, `age_from`, `age_to`, `is_active`) VALUES
(1, 1, 1, 'Sub Junior', 12, 15, 1),
(2, 1, 1, 'Junior', 12, 17, 1),
(3, 1, 1, 'Youth', 12, 21, 1),
(4, 1, 1, 'Senior', 12, 60, 1),
(8, 3, 5, 'Sub Junior', 10, 15, 1),
(9, 3, 5, 'Junior', 16, 21, 1),
(10, 3, 5, 'Senior', 21, 60, 1),
(12, 1, 4, 'Juniors', 12, 20, 1),
(13, 1, 4, 'Seniors', 21, 60, 1),
(14, 2, 3, 'Sub junior', 11, 16, 1),
(15, 2, 3, 'Junior ', 16, 22, 1),
(16, 2, 3, 'Senior', 21, 50, 1),
(17, 4, 6, 'Junior', 15, 20, 1),
(18, 4, 6, 'Senior', 21, 30, 1),
(23, 5, 7, 'Junior Male', 18, 29, 1),
(24, 5, 7, 'Junior Female', 20, 29, 1),
(25, 5, 7, 'Senior Male', 30, 50, 1),
(26, 5, 7, 'Senior Female', 29, 45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sports_club`
--

CREATE TABLE `sports_club` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `club_name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `club_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `loginuser_id` bigint(20) DEFAULT NULL,
  `reg_authorised_date` timestamp NULL DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PENDING/ACTIVE/INACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_club`
--

INSERT INTO `sports_club` (`id`, `championship_id`, `club_name`, `club_address`, `registration_no`, `location`, `phone_number`, `date_created`, `loginuser_id`, `reg_authorised_date`, `status`) VALUES
(1, 1, 'Brothers Sports Club', 'Kachani', '23/1980', 'Kachani', '989898956', '2021-05-23 09:05:51', 7, '2021-06-18 12:06:36', 'RESISTERED'),
(2, 2, 'Brothers Club', 'Karakulam', '232', 'Trivandrum', '828282', '2021-06-13 21:40:26', 7, NULL, 'PENDING'),
(3, 2, 'Crew ', 'Thiruvananthapuram central', '', 'Thiruvananthapuram ', '8893126174', '2021-07-04 03:30:18', 20, '2021-07-04 03:32:06', 'RESISTERED'),
(4, 4, 'Kattakada Sports Club', 'kattakada', '10/250', 'trivandrum', '4545545', '2021-07-04 08:03:04', 24, '2021-07-04 08:09:52', 'RESISTERED');

-- --------------------------------------------------------

--
-- Table structure for table `sports_event`
--

CREATE TABLE `sports_event` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `agegroup_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `fee_amount` double DEFAULT NULL,
  `fee_amount_fine` double DEFAULT NULL,
  `max_score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_event`
--

INSERT INTO `sports_event` (`id`, `championship_id`, `item_id`, `event_name`, `details`, `gender_id`, `agegroup_id`, `is_active`, `fee_amount`, `fee_amount_fine`, `max_score`) VALUES
(1, 1, 1, '10 M Rifle', 'Rifle', 1, 1, 1, 500, 800, 400),
(2, 1, 1, '10 M Rifle', 'Rifle', 1, 2, 1, 500, 800, 400),
(3, 1, 1, '10 M Rifle', 'Rifle', 1, 3, 1, 500, 800, 400),
(4, 1, 1, '10 M Rifle', 'Rifle', 1, 4, 1, 500, 800, 400),
(5, 1, 1, '10 M Rifle', 'Rifle', 2, 1, 1, 500, 800, 400),
(6, 1, 1, '10 M Rifle', 'Rifle', 2, 2, 1, 500, 800, 400),
(7, 1, 1, '10 M Rifle', 'Rifle', 2, 3, 1, 500, 800, 400),
(8, 1, 1, '10 M Rifle', 'Rifle', 2, 4, 1, 500, 800, 400),
(9, 1, 1, '25 Meter Female Senior', '25 meter ', 1, 4, 1, 1000, 0, 500),
(10, 1, 4, 'Singles Women', 'Singles women match', 1, 12, 1, 1000, 0, 200),
(11, 1, 4, 'Singles Men', 'Singles Men match', 2, 12, 1, 1000, 0, 200),
(12, 2, 3, 'Cricket', '10 over (tennis ball)', 2, 14, 1, 500, 0, 0),
(13, 2, 3, 'Cricket', '10 over (tennis ball)', 1, 14, 1, 500, 0, 0),
(14, 2, 3, 'Cricket', '	10 over (tennis ball)', 2, 15, 1, 600, 0, 0),
(15, 2, 3, 'Cricket', '	10 over (tennis ball)', 1, 15, 1, 600, 0, 0),
(16, 2, 3, 'Cricket', '	10 over (tennis ball)', 2, 16, 1, 700, 0, 0),
(17, 2, 3, 'Cricket', '	10 over (tennis ball)', 1, 16, 1, 700, 0, 0),
(18, 4, 6, 'Volleyball - Junior - Men', 'TEAM', 2, 17, 1, 500, 0, 1),
(19, 4, 6, 'Volleyball - Senior Men', 'TEAM', 2, 18, 1, 500, 0, 1),
(20, 4, 6, 'Volleyball - Junior Women', 'TEAM', 1, 17, 1, 500, 0, 1),
(21, 4, 6, 'Volleyball - Senior Women', 'TEAM', 1, 18, 1, 500, 0, 1),
(22, 5, 7, 'Bench Press Junior Male', 'INDIVIDUAL', 2, 23, 1, 500, 0, 10),
(23, 5, 7, 'Bench Press Junior Female', 'INDIVIDUAL', 1, 24, 1, 500, 0, 10),
(24, 5, 7, 'Bench Press Senior Male', 'INDIVIDUAL', 2, 25, 1, 500, 0, 10),
(25, 5, 7, 'Bench Press Senior Female', 'INDIVIDUAL', 1, 26, 1, 500, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sports_item`
--

CREATE TABLE `sports_item` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `sports_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_item`
--

INSERT INTO `sports_item` (`id`, `championship_id`, `sports_name`, `details`, `is_active`) VALUES
(1, 1, 'Rifle/Pistol Shooting', '10 Meter Shooting', 1),
(3, 2, 'Cricket', '10 Overs Tournament using Tennis ball', 1),
(4, 1, 'Badminton', 'Badminton Singles1', 1),
(5, 3, 'Swimming', 'Swimming - Freestyle , Backstroke, Breaststroke and Butterfly ', 1),
(6, 4, 'Volleyball', 'Volleyball', 1),
(7, 5, 'Bench Press', 'weight lifting', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sports_matchlocations`
--

CREATE TABLE `sports_matchlocations` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `location` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_numbers` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'comma separated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_matchlocations`
--

INSERT INTO `sports_matchlocations` (`id`, `championship_id`, `location`, `details`, `line_numbers`) VALUES
(1, 1, 'CHAKRA VYUGAM RIFLE CLUB 1', 'Fairlands, Salem, Tamil Nadu 636016', NULL),
(4, 2, 'MCH Ground', 'Near Sree chitra Institute, Medical college, trivandrum', NULL),
(5, 1, 'CHAKRA VYUGAM RIFLE CLUB 2', 'Shot gun Events', NULL),
(6, 3, 'Swimming Pool 1', 'Main swimming pool', NULL),
(7, 3, 'Swimming Pool 2', 'PTP Nagar', NULL),
(8, 1, 'District Badminton Club', 'Near Police ground', NULL),
(9, 4, 'Central Stadium', '', NULL),
(10, 5, 'Golds Gym', 'Velayambalam,Tvpm', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sports_participants`
--

CREATE TABLE `sports_participants` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `participant_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `loginuser_id` bigint(20) DEFAULT NULL,
  `requested_date` timestamp NULL DEFAULT current_timestamp(),
  `reg_authorised_date` timestamp NULL DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PENDING/ACTIVE/INACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_participants`
--

INSERT INTO `sports_participants` (`id`, `championship_id`, `participant_name`, `email`, `phone_number`, `address`, `location`, `age`, `gender_id`, `club_id`, `loginuser_id`, `requested_date`, `reg_authorised_date`, `status`) VALUES
(1, 1, 'Adrika N', 'adrikanarayanan@gmail.com', '9388778885', 'Krishnakripa, Machel', 'Trivandrum', 15, 1, 1, 8, '2021-06-13 22:57:06', '2021-06-18 12:49:43', 'REGISTERED'),
(2, 1, 'Ayonika Paul', 'ayonikapaul@gmail.com', '8787878787', 'Karnataka', 'Karnataka', 15, 1, 1, 9, '2021-06-19 12:43:37', '2021-06-19 12:45:33', 'REGISTERED'),
(3, 1, 'Elavenil Valarivan', 'elavenilvalarivan@gmail.com', '878785858', 'AP', 'Andra Pradesh', 15, 1, 1, 10, '2021-06-19 19:54:40', '2021-06-19 19:55:22', 'REGISTERED'),
(4, 1, 'Apurvi chandela', 'apurvichandela@gmail.com', '655656557', 'MP', 'MP', 15, 1, 1, 11, '2021-06-19 20:44:29', '2021-06-19 20:45:12', 'REGISTERED'),
(5, 4, 'kattakada Senior boys', 'kattakadaboys@gmail.com', '54545', 't', 'k', 16, 2, 4, 23, '2021-07-04 08:03:57', '2021-07-04 13:30:57', 'REGISTERED'),
(6, 4, 'Kattakada Junior Boys', 'k', '8888', 'k', 'k', 18, 2, 4, 23, '2021-07-04 08:07:37', '2021-07-04 13:31:01', 'REGISTERED'),
(7, 4, 'Kattakkada Junior Girls', 'kattakadaboys@gmail.com', '54545', 'kattakada', 'Kattakada', 18, 1, 4, 23, '2021-07-04 13:28:25', '2021-07-04 13:31:03', 'REGISTERED'),
(8, 4, 'Kattakkada Senior Girls', 'kattakadaboys@gmail.com', '54545', 't', 'kattakada', 25, 1, 4, 23, '2021-07-04 13:29:57', '2021-07-04 13:31:06', 'REGISTERED'),
(9, 4, 'Roshan', 'r123@gmail.com', '088931261', 'Malayinkeezhu', 'tvm', 21, 2, 0, 18, '2021-07-07 09:00:08', NULL, 'SUBMITTED');

-- --------------------------------------------------------

--
-- Table structure for table `sports_participants_events`
--

CREATE TABLE `sports_participants_events` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `participants_id` int(11) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fee_amount` double DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_ref_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `club_id` int(11) DEFAULT NULL,
  `club_authorised` int(11) DEFAULT NULL,
  `club_authorisation_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_participants_events`
--

INSERT INTO `sports_participants_events` (`id`, `championship_id`, `event_id`, `participants_id`, `registration_date`, `fee_amount`, `payment_status`, `payment_mode`, `payment_date`, `payment_ref_no`, `trans_status`, `created_time`, `club_id`, `club_authorised`, `club_authorisation_date`) VALUES
(1, 1, 1, 1, '2021-06-18 13:36:42', 500, 'PAID', 'DIRECT', NULL, NULL, NULL, '2021-06-14 08:58:55', 1, NULL, NULL),
(2, 1, 2, 1, '2021-06-18 13:36:45', 500, 'PAID', 'DIRECT', NULL, NULL, NULL, '2021-06-14 09:25:44', 1, NULL, NULL),
(3, 1, 3, 1, '2021-06-19 20:09:18', 500, 'PAID', 'DIRECT', NULL, NULL, NULL, '2021-06-14 09:26:32', 1, NULL, NULL),
(4, 1, 1, 2, '2021-06-19 12:46:14', 500, 'PAID', 'DIRECT', NULL, NULL, NULL, '2021-06-19 12:44:49', 1, NULL, NULL),
(5, 1, 1, 3, '2021-06-19 19:55:22', 500, 'PAID', 'DIRECT', '2021-06-19', NULL, NULL, '2021-06-19 19:54:59', 1, NULL, NULL),
(6, 1, 1, 4, '2021-06-19 20:45:12', 500, 'PAID', 'DIRECT', '2021-06-19', NULL, NULL, '2021-06-19 20:44:47', 1, NULL, NULL),
(7, 4, 18, 5, '2021-07-04 13:30:57', 500, 'PAID', 'DIRECT', '2021-07-04', NULL, NULL, '2021-07-04 12:55:31', 4, NULL, NULL),
(8, 4, 18, 6, '2021-07-04 13:31:01', 500, 'PAID', 'DIRECT', '2021-07-04', NULL, NULL, '2021-07-04 12:58:13', 4, NULL, NULL),
(9, 4, 20, 7, '2021-07-04 13:31:03', 500, 'PAID', 'DIRECT', '2021-07-04', NULL, NULL, '2021-07-04 13:28:57', 4, NULL, NULL),
(10, 4, 21, 8, '2021-07-04 13:31:06', 500, 'PAID', 'DIRECT', '2021-07-04', NULL, NULL, '2021-07-04 13:30:07', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sports_participants_slot`
--

CREATE TABLE `sports_participants_slot` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `event_id` int(10) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  `max_score` decimal(10,0) DEFAULT NULL,
  `remarks` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Registered/Absent/Score/Result',
  `created_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_participants_slot`
--

INSERT INTO `sports_participants_slot` (`id`, `championship_id`, `schedule_id`, `event_id`, `participant_id`, `score`, `max_score`, `remarks`, `status`, `created_date`) VALUES
(1, 1, 1, 1, 1, 370, 400, 'Q', 'SCORE_ENTERED', '2021-06-18 23:31:11'),
(3, 1, 1, 1, 2, 320, 400, 'Q', 'SCORE_ENTERED', '2021-06-19 12:48:16'),
(5, 1, 1, 1, 3, 360, 400, 'Q', 'SCORE_ENTERED', '2021-06-19 20:20:44'),
(6, 1, 1, 1, 4, 330, 400, 'Q', 'SCORE_ENTERED', '2021-06-19 20:45:27'),
(7, 4, 11, 20, 7, 3, 1, 'Final', 'SCORE_ENTERED', '2021-07-04 13:31:30'),
(8, 4, 9, 18, 6, 2, 1, '1', 'SCORE_ENTERED', '2021-07-04 13:31:53'),
(9, 4, 9, 18, 5, 1, 1, '2', 'SCORE_ENTERED', '2021-07-04 13:32:00'),
(10, 4, 12, 21, 8, NULL, 1, NULL, 'SCHEDULED', '2021-07-04 13:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `sports_result`
--

CREATE TABLE `sports_result` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  `max_score` decimal(10,0) DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `schedule_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_result`
--

INSERT INTO `sports_result` (`id`, `championship_id`, `event_id`, `participant_id`, `score`, `max_score`, `position`, `result`, `result_datetime`, `schedule_id`) VALUES
(1, 1, 1, 1, 370, 400, '1', 'FINAL', '2021-06-20 11:49:33', 1),
(2, 1, 1, 3, 360, 400, '2', 'FINAL', '2021-06-20 11:49:33', 1),
(3, 1, 1, 4, 330, 400, '3', 'FINAL', '2021-06-20 11:49:33', 1),
(4, 1, 1, 2, 320, 400, '4', 'FINAL', '2021-06-20 11:49:33', 1),
(10, 4, 18, 6, 2, 1, '1', 'FINAL', '2021-07-10 05:17:18', 9),
(11, 4, 18, 5, 1, 1, '2', 'FINAL', '2021-07-10 05:17:18', 9);

-- --------------------------------------------------------

--
-- Table structure for table `sports_schedule`
--

CREATE TABLE `sports_schedule` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `schedule_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_from` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_from_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Active/Completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sports_schedule`
--

INSERT INTO `sports_schedule` (`id`, `championship_id`, `item_id`, `event_id`, `location_id`, `schedule_name`, `date_from`, `date_from_time`, `status`) VALUES
(1, 1, 1, 1, 1, '10 M RIFLE F SubJunior S1 FINAL', '16/06/2021', '18:30', 'ACTIVE'),
(2, 1, 3, 1, 1, '10 M RIFLE F Junior S2 FINAL', '10/06/2021', '10:30', 'ACTIVE'),
(3, 1, 1, 5, 1, '10 M Rifle - Male - Sub Junior - Final', '30/06/2021', '10:00', 'ACTIVE'),
(4, 1, 1, 4, 1, 'test - final', '16/06/2021', '14:20', 'ACTIVE'),
(5, 1, 4, 10, 8, 'Singles Women - Female - Juniors - Semi finals', '23/06/2021', '10:00', 'ACTIVE'),
(6, 1, 4, 11, 8, 'Singles Men - Male - Juniors - semi finals', '23/06/2021', '14:00', 'ACTIVE'),
(7, 1, 4, 11, 8, 'Singles Men - Male - Juniors - Finals', '24/06/2021', '10:00', 'ACTIVE'),
(8, 1, 4, 10, 8, 'Singles Women - Female - Juniors - Finals', '24/06/2021', '14:00', 'ACTIVE'),
(9, 4, 6, 18, 9, ' Volleyball - Junior - Men - Male - Junior- Final', '11/07/2021', '10:00', 'ACTIVE'),
(10, 4, 6, 19, 9, ' Volleyball - Senior Men - Male - Senior', '13/07/2021', '10:00', 'ACTIVE'),
(11, 4, 6, 20, 9, 'Volleyball - Junior Women - Female - Junior - fina', '15/07/2021', '10:00', 'ACTIVE'),
(12, 4, 6, 21, 9, 'Volleyball - Senior Women - Female - Senior - fina', '18/07/2021', '10:00', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `championship_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `role_name` varchar(200) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `championship_id`, `user_name`, `password`, `full_name`, `email`, `phone_number`, `address`, `location`, `role_name`, `role_id`, `status`, `created_date`) VALUES
(1, 0, 'superadmin', '202cb962ac59075b964b07152d234b70', 'Super Admin', 'superadmin@sems.org', '0475525252', 'Selam, Tamilnadu', NULL, 'Super Admin', 1, 'ACTIVE', '2020-12-26 14:28:10'),
(2, 1, 'nazadmin', '202cb962ac59075b964b07152d234b70', 'Naz Admin', 'naztag@gmail.com', '9939393939', 'Dubai', 'Dubai Jn', 'Admin', 2, 'ACTIVE', '2020-12-26 14:48:33'),
(3, 1, 'nsastaff1', '202cb962ac59075b964b07152d234b70', 'Unit Staff', 'test@test.com', '8239487', 'Dubai', 'Dubai Jn', 'Staff', 3, 'ACTIVE', '2021-03-21 19:33:56'),
(4, 2, 'rahul', '202cb962ac59075b964b07152d234b70', 'Rahul S S', 'rahulss@gmail.com', '38383831', 'Trivandrum 2', 'Kattakada South', 'Admin', 2, 'ACTIVE', '2021-05-22 18:40:17'),
(5, 2, 'athiresh', '202cb962ac59075b964b07152d234b70', 'ATHIRESH R', 'athireshr@gmail.com', '56565656', 'Trivandrum', 'Vattiyoorkavu', 'Staff', 3, 'ACTIVE', '2021-05-22 18:41:09'),
(6, 2, 'ananda', '202cb962ac59075b964b07152d234b70', 'ANANDA PADMANABHAN ', 'ananda@gmail.com', '84985741', 'Thirumala, Trivandrum', 'Thirumala', 'Staff', 3, 'ACTIVE', '2021-05-22 19:01:39'),
(7, 0, 'narayananng@gmail.com', '202cb962ac59075b964b07152d234b70', 'Narayanan', 'narayananng@gmail.com', '838383', NULL, NULL, 'Club Admin', 4, 'ACTIVE', '2021-05-23 00:06:12'),
(8, 0, 'adrikanarayanan@gmail.com', '202cb962ac59075b964b07152d234b70', 'Adrika', 'adrikanarayanan@gmail.com', '838383', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-05-23 00:07:38'),
(9, 0, 'ayonikapaul@gmail.com', '202cb962ac59075b964b07152d234b70', 'Ayonika Paul', 'ayonikapaul@gmail.com', '45465252152', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-06-19 12:39:51'),
(10, 0, 'elavenilvalarivan@gmail.com', '202cb962ac59075b964b07152d234b70', 'Elavenil Valarivan', 'elavenilvalarivan@gmail.com', '454565651651', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-06-19 12:40:22'),
(11, 0, 'apurvichandela@gmail.com', '202cb962ac59075b964b07152d234b70', 'Apurvi chandela', 'apurvichandela@gmail.com', '875584511', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-06-19 12:41:10'),
(12, 0, 'divyanshsingh@gmail.com', '202cb962ac59075b964b07152d234b70', 'Divyansh Singh', 'divyanshsingh@gmail.com', '8574521', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-06-19 12:41:45'),
(13, 0, 'saurabhchaudhary@gmail.com', '202cb962ac59075b964b07152d234b70', 'Saurabh Chaudhary', 'saurabhchaudhary@gmail.com', '35265412', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-06-19 12:42:13'),
(15, 3, 'swimmingadmin', '202cb962ac59075b964b07152d234b70', 'Vellayambalam Admin', 'vellayambalam@gmail.com', '98732897', 'Vellayambalam sports complex', 'trivandrum', 'Admin', 2, 'ACTIVE', '2021-06-22 08:57:06'),
(16, 3, 'swimmingstaff1', '202cb962ac59075b964b07152d234b70', 'Reception staff', 'vellayambalam2@swimming.com', '987298793872', '9879879834793', 'vellayambalam', 'Staff', 3, 'ACTIVE', '2021-06-22 09:07:45'),
(17, 3, 'swimmingstaff2', '202cb962ac59075b964b07152d234b70', 'Management Staff', 'test', '838383', '8383838', '8383838', 'Staff', 3, 'ACTIVE', '2021-06-22 09:09:52'),
(18, 0, 'r123@gmail.com', '202cb962ac59075b964b07152d234b70', 'Roshan', 'r123@gmail.com', '8888888890', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-07-04 03:18:00'),
(19, 0, 'harivishwanad@gmail.com', '202cb962ac59075b964b07152d234b70', 'Roshan', 'harivishwanad@gmail.com', '8893126176 ', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-07-04 03:22:04'),
(20, 0, 'crew', '202cb962ac59075b964b07152d234b70', 'Crew', 'crew', '8888888891', NULL, NULL, 'Club Admin', 4, 'ACTIVE', '2021-07-04 03:27:19'),
(21, 4, 'anandanp', '202cb962ac59075b964b07152d234b70', 'Ananda Padmanbhan', 'anandanp@gmail.com', '8137928088', 'thirumala', 'trivandrum', 'Admin', 2, 'ACTIVE', '2021-07-04 06:38:02'),
(22, 4, 'athireshr', '202cb962ac59075b964b07152d234b70', 'Athiresh R', 'athireshr@gmail.com', '454545454', 'Test', 'trivandrum', 'Staff', 3, 'ACTIVE', '2021-07-04 07:51:29'),
(23, 0, 'kattakadaboys@gmail.com', '202cb962ac59075b964b07152d234b70', 'Kattakkada Senior Boys', 'kattakadaboys@gmail.com', '54545', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-07-04 07:57:19'),
(24, 0, 'kattakadaclub@gmail.com', '202cb962ac59075b964b07152d234b70', 'Kattakada Sports Club', 'kattakadaclub@gmail.com', '8787878', NULL, NULL, 'Club Admin', 4, 'ACTIVE', '2021-07-04 07:59:46'),
(25, 5, 'weightlift', '202cb962ac59075b964b07152d234b70', 'Golds Gym', 'golds@gmail.com', '3333', 'Thiruvananthapuram', 'Velayambalam', 'Admin', 2, 'ACTIVE', '2021-07-12 13:59:29'),
(26, 0, 'mahesh', '202cb962ac59075b964b07152d234b70', 'Mahesh.R', 'mahesh', '1234', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-07-12 14:07:09'),
(27, 5, 'Trainer', '202cb962ac59075b964b07152d234b70', 'Golds Trainer', 'g@gmail.com', '33455', 'Malayinkeezhu', 'Thiruvananthapuram', 'Staff', 3, 'ACTIVE', '2021-07-12 14:13:15'),
(28, 0, 'shashi', '202cb962ac59075b964b07152d234b70', 'shashi', 'shashi', '45657', NULL, NULL, 'Participant', 5, 'ACTIVE', '2021-07-13 07:31:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `championship`
--
ALTER TABLE `championship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_gender`
--
ALTER TABLE `mst_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_agegroup`
--
ALTER TABLE `sports_agegroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_club`
--
ALTER TABLE `sports_club`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_event`
--
ALTER TABLE `sports_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_item`
--
ALTER TABLE `sports_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_matchlocations`
--
ALTER TABLE `sports_matchlocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_participants`
--
ALTER TABLE `sports_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_participants_events`
--
ALTER TABLE `sports_participants_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_participants_slot`
--
ALTER TABLE `sports_participants_slot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_result`
--
ALTER TABLE `sports_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports_schedule`
--
ALTER TABLE `sports_schedule`
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
-- AUTO_INCREMENT for table `championship`
--
ALTER TABLE `championship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sports_agegroup`
--
ALTER TABLE `sports_agegroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `sports_club`
--
ALTER TABLE `sports_club`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sports_event`
--
ALTER TABLE `sports_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sports_item`
--
ALTER TABLE `sports_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sports_matchlocations`
--
ALTER TABLE `sports_matchlocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sports_participants`
--
ALTER TABLE `sports_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sports_participants_events`
--
ALTER TABLE `sports_participants_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sports_participants_slot`
--
ALTER TABLE `sports_participants_slot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sports_result`
--
ALTER TABLE `sports_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sports_schedule`
--
ALTER TABLE `sports_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
