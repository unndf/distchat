--
--
-- Distchat database Schema
--
--
DROP SCHEMA IF EXISTS distchat;
CREATE SCHEMA distchat;
USE distchat;
SET AUTOCOMMIT=0;

--
-- Table structure for table 'user'
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id`		    INT(4)   	    NOT NULL	AUTO_INCREMENT,
	`nick`  	    VARCHAR(255)	NOT NULL,
	`salt`  	    VARCHAR(128)	NOT NULL	DEFAULT '',
	`hash`	        VARCHAR(128)	NOT NULL	DEFAULT '',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--
-- Table structure for table 'room'
--
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
    `chat_id`       INT(4)          NOT NULL    AUTO_INCREMENT,
    `name`          VARCHAR(255)    NOT NULL    DEFAULT '',
    PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--
-- Table structure for table 'message'
--
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
    `m_id`          INT(4)          NOT NULL,
    `chat_id`       INT(4)          NOT NULL,
    `content`       VARCHAR(MAX)    NOT NULL    DEFAULT '',
    CONSTRAINT FOREIGN KEY(`chat_id`)
        REFERENCES `room`(`chat_id`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;
SET AUTOCOMMIT=1;
