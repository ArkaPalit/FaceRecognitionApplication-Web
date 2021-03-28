-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 11:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user otp', 1, 'add_userotp'),
(2, 'Can change user otp', 1, 'change_userotp'),
(3, 'Can delete user otp', 1, 'delete_userotp'),
(4, 'Can view user otp', 1, 'view_userotp'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add student', 8, 'add_student'),
(30, 'Can change student', 8, 'change_student'),
(31, 'Can delete student', 8, 'delete_student'),
(32, 'Can view student', 8, 'view_student'),
(33, 'Can add student_ attendance', 9, 'add_student_attendance'),
(34, 'Can change student_ attendance', 9, 'change_student_attendance'),
(35, 'Can delete student_ attendance', 9, 'delete_student_attendance'),
(36, 'Can view student_ attendance', 9, 'view_student_attendance'),
(37, 'Can add employee', 10, 'add_employee'),
(38, 'Can change employee', 10, 'change_employee'),
(39, 'Can delete employee', 10, 'delete_employee'),
(40, 'Can view employee', 10, 'view_employee'),
(41, 'Can add employee_ attendance', 11, 'add_employee_attendance'),
(42, 'Can change employee_ attendance', 11, 'change_employee_attendance'),
(43, 'Can delete employee_ attendance', 11, 'delete_employee_attendance'),
(44, 'Can view employee_ attendance', 11, 'view_employee_attendance'),
(45, 'Can add outside_ person', 12, 'add_outside_person'),
(46, 'Can change outside_ person', 12, 'change_outside_person'),
(47, 'Can delete outside_ person', 12, 'delete_outside_person'),
(48, 'Can view outside_ person', 12, 'view_outside_person');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$0Eb6TqiwfIPt$z+9DsRvbjzfNwiI+r86rC827wi4Mb82VAK66fjmGJpI=', '2021-01-07 09:12:01.876490', 1, 'admin', 'Admin', '', 'developer.fra.demo@gmail.com', 1, 1, '2021-01-07 08:22:19.000000'),
(2, 'pbkdf2_sha256$216000$V3dBp794igxc$557dO2wfDn7EL+ygwPON3tdNIvcMPu/7Jd3vEYBl+XM=', '2021-01-07 09:01:19.123920', 0, 'arka.palit', 'Arka', 'Palit', 'arkapalit55@gmail.com', 0, 1, '2021-01-07 08:59:53.059522');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-01-07 08:57:23.328179', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 5, 1),
(2, '2021-01-07 09:12:16.527828', '1', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Id photo\"]}}]', 10, 1),
(3, '2021-01-07 09:12:42.625858', '1', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Id photo\"]}}]', 10, 1),
(4, '2021-01-07 09:15:05.747663', '1', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Id photo\"]}}]', 10, 1),
(5, '2021-01-07 09:17:12.512493', '1', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Id photo\"]}}]', 10, 1),
(6, '2021-01-07 09:17:45.475457', '1', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Id photo\"]}}]', 10, 1),
(7, '2021-01-07 09:21:20.068614', '2', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 10, 1),
(8, '2021-01-07 09:25:15.487949', '3', 'Sudhir Pal', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(10, 'employee', 'employee'),
(11, 'employee', 'employee_attendance'),
(1, 'home', 'userotp'),
(12, 'outside', 'outside_person'),
(7, 'sessions', 'session'),
(8, 'student', 'student'),
(9, 'student', 'student_attendance');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-07 08:20:41.580087'),
(2, 'auth', '0001_initial', '2021-01-07 08:20:41.814727'),
(3, 'admin', '0001_initial', '2021-01-07 08:20:42.894749'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-07 08:20:43.427264'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-07 08:20:43.439267'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-07 08:20:43.535274'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-07 08:20:43.618095'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-07 08:20:43.638364'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-07 08:20:43.647005'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-07 08:20:43.714943'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-07 08:20:43.718943'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-07 08:20:43.737943'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-07 08:20:43.760944'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-07 08:20:43.980749'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-07 08:20:44.010769'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-07 08:20:44.019770'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-07 08:20:44.041753'),
(18, 'employee', '0001_initial', '2021-01-07 08:20:44.115592'),
(19, 'home', '0001_initial', '2021-01-07 08:20:44.156880'),
(20, 'outside', '0001_initial', '2021-01-07 08:20:44.340100'),
(21, 'sessions', '0001_initial', '2021-01-07 08:20:44.373373'),
(22, 'student', '0001_initial', '2021-01-07 08:20:44.460145'),
(23, 'outside', '0002_auto_20210107_1402', '2021-01-07 08:32:45.928724'),
(24, 'employee', '0002_auto_20210107_1452', '2021-01-07 09:22:39.331628'),
(25, 'outside', '0003_outside_person_email', '2021-01-07 10:03:17.403776'),
(26, 'outside', '0004_auto_20210107_1536', '2021-01-07 10:06:30.520698');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_employee`
--

CREATE TABLE `employee_employee` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(122) NOT NULL,
  `date_of_birth` date NOT NULL,
  `department` varchar(10) NOT NULL,
  `school` varchar(6) NOT NULL,
  `university_mail` varchar(20) NOT NULL,
  `date_of_joining` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `id_proof_no` varchar(20) NOT NULL,
  `id_type` varchar(20) NOT NULL,
  `id_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_employee`
--

INSERT INTO `employee_employee` (`id`, `employee_id`, `name`, `date_of_birth`, `department`, `school`, `university_mail`, `date_of_joining`, `photo`, `id_proof_no`, `id_type`, `id_photo`) VALUES
(3, '85GT', 'Sudhir Pal', '2021-01-07', 'Academics', 'SOET', 'email@gmail', '2021-01-07', 'employee_img/KGI-Indian-American-Professor-Dr-Animesh-Ray-receives-funding-for-lung-canc_twnKoJz.jpg', '8520 9639 7418', 'Adhar Card', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_employee_attendance`
--

CREATE TABLE `employee_employee_attendance` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `department` varchar(100) NOT NULL,
  `name` varchar(122) NOT NULL,
  `time_of_entry` time(6) NOT NULL,
  `time_of_exit` time(6) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `home_userotp`
--

CREATE TABLE `home_userotp` (
  `id` int(11) NOT NULL,
  `time_st` time(6) NOT NULL,
  `date_st` date NOT NULL,
  `otp` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_userotp`
--

INSERT INTO `home_userotp` (`id`, `time_st`, `date_st`, `otp`, `user_id`) VALUES
(1, '14:29:53.206832', '2021-01-07', 9581, 2);

-- --------------------------------------------------------

--
-- Table structure for table `outside_outside_person`
--

CREATE TABLE `outside_outside_person` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `purpose` varchar(150) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `time_of_entry` time(6) NOT NULL,
  `time_of_exit` time(6) DEFAULT NULL,
  `date` date NOT NULL,
  `picture` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outside_outside_person`
--

INSERT INTO `outside_outside_person` (`id`, `full_name`, `address`, `purpose`, `phone_no`, `time_of_entry`, `time_of_exit`, `date`, `picture`, `email`) VALUES
(2, 'Ranjit Saha', 'Dum Dum', 'Acdemics', 2147483647, '15:29:37.625517', NULL, '2021-01-07', '', ''),
(5, 'Santunu Dey', 'Park Street', 'Acdemics', 2147483647, '15:37:02.239993', NULL, '2021-01-07', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_student`
--

CREATE TABLE `student_student` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `name` varchar(122) NOT NULL,
  `course` varchar(10) NOT NULL,
  `course_years` int(11) NOT NULL,
  `school` varchar(6) NOT NULL,
  `dept` varchar(5) NOT NULL,
  `roll_no` varchar(20) NOT NULL,
  `university_mail` varchar(254) NOT NULL,
  `mentors_name` varchar(122) NOT NULL,
  `date_of_admission` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `parents_name` varchar(122) NOT NULL,
  `parents_no` int(11) NOT NULL,
  `parents_email` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `id_proof_no` varchar(20) NOT NULL,
  `id_type` varchar(20) NOT NULL,
  `id_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_student`
--

INSERT INTO `student_student` (`id`, `reg_no`, `name`, `course`, `course_years`, `school`, `dept`, `roll_no`, `university_mail`, `mentors_name`, `date_of_admission`, `photo`, `parents_name`, `parents_no`, `parents_email`, `date_of_birth`, `id_proof_no`, `id_type`, `id_photo`) VALUES
(3, '1025', 'Arka Palit', 'B.Tech', 4, 'SOET', 'CSE', '034', 'student@email.com', 'Prof. R. Kumar', '2021-01-07', 'student_img/Arka_Palit.jpg', 'H. Palit', 2147483647, 'parent@email.com', '2021-01-07', '98520', 'Adhar Card', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_student_attendance`
--

CREATE TABLE `student_student_attendance` (
  `id` int(11) NOT NULL,
  `roll_no` varchar(20) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `name` varchar(122) NOT NULL,
  `time_of_entry` time(6) NOT NULL,
  `time_of_exit` time(6) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_employee_attendance`
--
ALTER TABLE `employee_employee_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_userotp`
--
ALTER TABLE `home_userotp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_userotp_user_id_52f82065_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `outside_outside_person`
--
ALTER TABLE `outside_outside_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_student`
--
ALTER TABLE `student_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_student_attendance`
--
ALTER TABLE `student_student_attendance`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `employee_employee`
--
ALTER TABLE `employee_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_employee_attendance`
--
ALTER TABLE `employee_employee_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_userotp`
--
ALTER TABLE `home_userotp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `outside_outside_person`
--
ALTER TABLE `outside_outside_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_student`
--
ALTER TABLE `student_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_student_attendance`
--
ALTER TABLE `student_student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `home_userotp`
--
ALTER TABLE `home_userotp`
  ADD CONSTRAINT `home_userotp_user_id_52f82065_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
