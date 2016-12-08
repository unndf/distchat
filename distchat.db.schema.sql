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
    `nick`          VARCHAR(255)    NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--DROP TABLE IF EXISTS `user`;
/*CREATE TABLE `user` (
	`id`		    INT(4)   	    NOT NULL	AUTO_INCREMENT,
	`nick`  	    VARCHAR(255)	NOT NULL,
	`salt`  	    VARCHAR(128)	NOT NULL	DEFAULT '',
	`hash`	        VARCHAR(128)	NOT NULL	DEFAULT '',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;
*/
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
    `m_id`          INT(4)          NOT NULL    AUTO_INCREMENT,
    `chat_id`       INT(4)          NOT NULL,
    `content`       VARCHAR(MAX)    NOT NULL    DEFAULT '',
    PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;
SET AUTOCOMMIT=1;

-- Test data --------------------------------------------------------------
-- rooms
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('demo-room');          -- id 1
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('tech');               -- id 2
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('politics');           -- id 3
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('news');               -- id 4
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('art');                -- id 5
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('video-games');        -- id 6
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('music');              -- id 7
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('programming');        -- id 8
INSERT INTO DISTCHAT.ROOM(`name`) VALUES('general');            -- id 9

--users
INSERT INTO DISTCHAT.USER(`nick`) VALUES('bill');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('mike');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('bob');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('joe');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('mary-sue');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('gary-stu');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('2373374U');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('user965');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('eve');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('mallory');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('dev');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('jennifer');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('guy');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('cool-dude');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('anon');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('gates');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('mac');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('hito');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('raj');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('gil');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('linus');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('nub');
INSERT INTO DISTCHAT.USER(`nick`) VALUES('gitgud');

--messages
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(2,'<bill> Wow, Can''t wait for AMD ZEN!');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(2,'<mallory> Same time to get rid of my Intel chip');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(2,'<bill> Mumbles something about price:performance ratio');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(2,'<dev> This message should be the second to last message if you are just entering the room');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(2,'<dev> This is the last message, If the ordering was bill>mallory>bill>dev>dev then the messages were sent from the client to the server in the correct order');

INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 1');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 2');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 3');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 4');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 5');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 6');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 7');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<dev> Message 8');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<joe> I was a second user');
INSERT INTO DISTCHAT.MESSAGE(`chat_id`,`content`) VALUES(1,'<mike> I am a third user');
