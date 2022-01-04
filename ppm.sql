-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2021 at 05:07 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppm`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `Uid` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `role` varchar(10) DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`Uid`, `fullname`, `email`, `password`, `phone`, `role`) VALUES
(1, 'dom', 'dom@gmail.com', '123456', '9876543210', 'student'),
(3, 'Vaibhav Sharma', 'vaibhav@gmail.com', 'vaibhav', '9874563210', 'student'),
(4, 'admin', 'admin', 'admin', '9874563210', 'admin'),
(7, 'ankita', 'ankita@gmail.com', 'ankita', '3201456987', 'student'),
(8, 'kshitij', 'kshitij@gmail.com', 'kshitij', '9874563210', 'student'),
(9, 'Jay patel', 'jay@gmail.com', 'jay123', '9632587410', 'faculty'),
(10, 'Dr. Khyati rami', 'khyati@gmail.com', 'khyati', '8547963210', 'faculty'),
(11, 'vraj patel', 'vraj@gmail.com', 'vraj123', '9856321470', 'student'),
(12, 'Dr. Bhumika Shah', 'bhumika@gmail.com', 'bhumika', '9563217840', 'faculty'),
(13, 'Ashok', 'ashok@gmail.com', 'ashok123', '8745693210', 'student'),
(14, 'Rakesh Keshri', 'rakesh@gmail.com', 'rakesh', '7043526936', 'student'),
(15, 'abc', 'abcabc@gmail.com', 'abcabc', '9874563210', 'faculty');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(20) NOT NULL,
  `language` varchar(20) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'upcoming',
  `upcoming_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `language`, `job_type`, `location`, `status`, `upcoming_date`) VALUES
(1, 'Incubyte', 'Python', 'FullTime', 'Remote', 'done', '2021-08-28'),
(2, 'ECWs', '.NET', 'FullTime', 'Ahmedabad', 'done', '2021-09-17'),
(3, 'Evosys', 'Non-Technical', 'Intern', 'Surat', 'done', '2021-10-24'),
(4, 'Aimdek Technologies', 'Java', 'FullTime', 'Vadodara', 'done', '2021-11-07'),
(6, 'GreyCell', '.Net', 'FullTime', 'Rajkot', 'upcoming', '2021-12-20'),
(7, 'MindInventory', 'Java', 'FullTime', 'Ahmedabad', 'upcoming', '2021-12-22'),
(16, 'MotaData', 'Python', 'Intern', 'Surat', 'upcoming', '2021-12-28'),
(17, 'Cognizant', 'Java', 'FullTime', 'Vadodara', 'upcoming', '2021-12-26'),
(18, 'Mahindra', 'Python', 'FullTime', 'Pune', 'upcoming', '2021-12-28'),
(19, 'Infosys', '.Net', 'FullTime', 'Mumbai', 'upcoming', '2021-12-30'),
(21, 'MasterCard', 'Android', 'Intern', 'Vadodara', 'upcoming', '2022-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `language` varchar(30) NOT NULL,
  `job_type` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `upcoming_date` date NOT NULL,
  `time_slot` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`company_id`, `company_name`, `language`, `job_type`, `location`, `upcoming_date`, `time_slot`) VALUES
(6, 'GreyCell', '.Net', 'FullTime', 'Rajkot', '2021-12-18', '14:00'),
(7, 'MindInventory', 'Java', 'FullTime', 'Ahmedabad', '2021-12-22', '11:00'),
(16, 'MotaData', 'Python', 'Intern', 'Surat', '2021-12-28', '14:00'),
(19, 'Infosys', '.Net', 'FullTime', 'Mumbai', '2021-12-30', '11:00'),
(21, 'MasterCard', 'Android', 'Intern', 'Vadodara', '2022-01-12', '14:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `prn` int(5) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `std_class` varchar(20) NOT NULL,
  `placement_status` varchar(20) NOT NULL DEFAULT 'pending',
  `company_name` varchar(20) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`prn`, `student_name`, `std_class`, `placement_status`, `company_name`) VALUES
(10005, 'Nirav Chavda', 'MCA5', 'placed', 'Incubyte'),
(10007, 'Lakshya Choudhary', 'MCA5', 'placed', 'Evosys'),
(10008, 'Ankita Gaonkar', 'MCA5', 'placed', 'Evosys'),
(10010, 'Rakesh Keshri', 'MCA5', 'placed', 'Aimdek Technologies'),
(10011, 'Kunjal Simzia', 'MCA3', 'placed', 'Aimdek Technologies'),
(10012, 'Pradip Karmakar', 'MCA5', 'placed', 'Aimdek Technologies'),
(10013, 'Rakesh Makhija', 'MCA5', 'pending', 'N/A'),
(10018, 'Kshitij Modi', 'MCA5', 'placed', 'MindInventory'),
(10021, 'Yash Soni', 'MCA5', 'placed', 'Evosys'),
(10024, 'Preksha Seth', 'MCA5', 'placed', 'Aimdek Technologies'),
(10029, 'Ajinkya Rathod', 'MCA5', 'placed', 'Incubyte'),
(10035, 'Vaibhav Sharma', 'MCA5', 'placed', 'Aimdek Technologies'),
(10039, 'Rajvi Pandya', 'Msc AIML', 'placed', 'MotaData'),
(10042, 'Yash Shah', 'Msc AIML', 'placed', 'Evosys'),
(10043, 'Khushali Modi', 'Msc AIML', 'placed', 'ECWs'),
(10045, 'Kirti Patel', 'Msc AIML', 'placed', 'Aimdek Technologies'),
(20015, 'Rahul Modi', 'MCA3', 'pending', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `student2020`
--

CREATE TABLE `student2020` (
  `prn` int(5) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `std_class` varchar(20) NOT NULL,
  `placement_status` varchar(20) NOT NULL DEFAULT 'pending',
  `company_name` varchar(20) DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student2020`
--

INSERT INTO `student2020` (`prn`, `student_name`, `std_class`, `placement_status`, `company_name`) VALUES
(10005, 'Aqueed ', 'MCA3', 'placed', 'Incubyte'),
(10007, 'Faizan Sheikh', 'MCA5', 'placed', 'Evosys'),
(10008, 'Ankita Sinha', 'MCA5', 'placed', 'Evosys'),
(10010, 'Zeel Mawani', 'MCA3', 'placed', 'Aimdek Technologies'),
(10011, 'Antra Koul', 'MCA3', 'placed', 'Aimdek Technologies'),
(10012, 'Ankita Nayani', 'MCA5', 'placed', 'Aimdek Technologies'),
(10013, 'Rahul Gupta', 'MCA5', 'placed', 'Evosys'),
(10018, 'Khushali Panchal', 'MCA5', 'placed', 'MindInventory'),
(10021, 'Parth Soni', 'MCA3', 'placed', 'Evosys'),
(10024, 'Imraan Sheikh', 'MCA5', 'placed', 'Aimdek Technologies'),
(10029, 'Riddhi', 'MCA4', 'placed', 'Incubyte'),
(10035, 'Avni', 'Msc AIML', 'placed', 'Aimdek Technologies'),
(20015, 'Parth Rana', 'Msc AIML', 'placed', 'TCS');

-- --------------------------------------------------------

--
-- Table structure for table `uploadfile`
--

CREATE TABLE `uploadfile` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploadfile`
--

INSERT INTO `uploadfile` (`id`, `filename`, `path`, `add_date`) VALUES
(1, 'SE Assignments.pdf', 'files\\SE Assignments.pdf', '2021-12-01 18:31:26'),
(2, 'ESICJuly2021.pdf', 'files\\ESICJuly2021.pdf', '2021-12-01 18:41:50'),
(3, 'GSTAug2021.pdf', 'files\\GSTAug2021.pdf', '2021-12-01 18:42:48'),
(4, 'GSTOct21_LateFee.pdf', 'files\\GSTOct21_LateFee.pdf', '2021-12-01 18:50:06'),
(5, 'GSTSept2021LateFee.pdf', 'files\\GSTSept2021LateFee.pdf', '2021-12-01 18:56:43'),
(6, 'GSTJuly2021_LateFee.pdf', 'files\\GSTJuly2021_LateFee.pdf', '2021-12-01 19:00:29'),
(7, 'GSTJuly2021_LateFee.pdf', 'files\\GSTJuly2021_LateFee.pdf', '2021-12-01 19:07:25'),
(8, 'GSTAug2021.pdf', 'files\\GSTAug2021.pdf', '2021-12-02 14:23:31'),
(9, 'GST-CHALLAN unpaid.pdf', 'files\\GST-CHALLAN unpaid.pdf', '2021-12-02 20:07:22'),
(10, 'GSTOct21_LateFee.pdf', 'files\\GSTOct21_LateFee.pdf', '2021-12-02 20:46:55'),
(11, 'GSTOct21_LateFee.pdf', 'files\\GSTOct21_LateFee.pdf', '2021-12-02 20:52:44'),
(12, 'GSTJuly2021_LateFee.pdf', 'files\\GSTJuly2021_LateFee.pdf', '2021-12-02 20:55:14'),
(13, 'Term Work Schedule Dec 2021.pdf', 'files\\Term Work Schedule Dec 2021.pdf', '2021-12-08 08:09:05'),
(14, 'SE Assignments.pdf', 'files\\SE Assignments.pdf', '2021-12-09 14:40:18'),
(15, 'PPM Presentation.pptx', 'files\\PPM Presentation.pptx', '2021-12-10 08:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `uploadoffer`
--

CREATE TABLE `uploadoffer` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploadoffer`
--

INSERT INTO `uploadoffer` (`id`, `filename`, `path`, `add_date`) VALUES
(1, 'Rakesh Keshri Ethical Hacking Webinar Certificate.pdf', 'offer\\Rakesh Keshri Ethical Hacking Webinar Certificate.pdf', '2021-12-17 08:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `uploadresume`
--

CREATE TABLE `uploadresume` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uploadresume`
--

INSERT INTO `uploadresume` (`id`, `filename`, `path`, `add_date`) VALUES
(1, 'keshri-rakesh Resume.pdf', 'resume\\keshri-rakesh Resume.pdf', '2021-12-17 07:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `SlNo` int(10) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`SlNo`, `Name`, `Email`, `userName`, `password`) VALUES
(1, 'admin', 'admin@ppm.com', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`Uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`prn`);

--
-- Indexes for table `student2020`
--
ALTER TABLE `student2020`
  ADD PRIMARY KEY (`prn`);

--
-- Indexes for table `uploadfile`
--
ALTER TABLE `uploadfile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploadoffer`
--
ALTER TABLE `uploadoffer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploadresume`
--
ALTER TABLE `uploadresume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`SlNo`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `Uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `uploadfile`
--
ALTER TABLE `uploadfile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uploadoffer`
--
ALTER TABLE `uploadoffer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploadresume`
--
ALTER TABLE `uploadresume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `SlNo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
