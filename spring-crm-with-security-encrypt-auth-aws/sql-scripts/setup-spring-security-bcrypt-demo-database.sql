DROP DATABASE  IF EXISTS `spring_security_demo_bcrypt2`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo_bcrypt2`;
USE `spring_security_demo_bcrypt2`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO `users` 
VALUES 
('emp','{bcrypt}$2a$10$W0R2.UV/oliLHV6H1//Bb.xP3otmirsTFsSgc7DPL9LtnUNCXAHBO',1),
('manager','{bcrypt}$2a$10$A7iPOFtd2T4FUK/tjZ0OWuEWDLbAXoWWqx7rqq50dMDLqkevEPMKS',1),
('admin','{bcrypt}$2a$10$kHeqIparhOskgs5gDCA4WOIBLJhIdMBQaUg3wvuqhSpxn/kOwgvGK',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('emp','ROLE_EMPLOYEE'),
('manager','ROLE_EMPLOYEE'),
('manager','ROLE_MANAGER'),
('admin','ROLE_EMPLOYEE'),
('admin','ROLE_ADMIN');


