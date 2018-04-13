
-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

DROP TABLE IF EXISTS `db_online_course`.`Submission`;


DROP TABLE IF EXISTS `db_online_course`.`Content`;


DROP TABLE IF EXISTS `db_online_course`.`Exercise`;


DROP TABLE IF EXISTS `db_online_course`.`Comment`;


DROP TABLE IF EXISTS `db_online_course`.`Attend`;


DROP TABLE IF EXISTS `db_online_course`.`Lesson`;


DROP TABLE IF EXISTS `db_online_course`.`CourseVote`;


DROP TABLE IF EXISTS `db_online_course`.`Collection_Course`;


DROP TABLE IF EXISTS `db_online_course`.`Class`;


DROP TABLE IF EXISTS `db_online_course`.`Course_Tag`;


DROP TABLE IF EXISTS `db_online_course`.`TeacherVote`;


DROP TABLE IF EXISTS `db_online_course`.`Work_Study`;


DROP TABLE IF EXISTS `db_online_course`.`Collection`;


DROP TABLE IF EXISTS `db_online_course`.`Course`;


DROP TABLE IF EXISTS `db_online_course`.`Tag`;


DROP TABLE IF EXISTS `db_online_course`.`Group`;


DROP TABLE IF EXISTS `db_online_course`.`User`;



DROP DATABASE IF EXISTS `db_online_course`;

CREATE DATABASE `db_online_course`;



-- ************************************** `db_online_course`.`Tag`

CREATE TABLE `db_online_course`.`Tag`
(
 `Tag_ID`       BIGINT AUTO_INCREMENT ,
 `Name`         VARCHAR(50) NOT NULL ,
 `CourseNumber` BIGINT NOT NULL ,

PRIMARY KEY (`Tag_ID`)
);




-- ************************************** `db_online_course`.`Group`

CREATE TABLE `db_online_course`.`Group`
(
 `Group_ID`    BIGINT AUTO_INCREMENT ,
 `Name`        VARCHAR(50) NOT NULL ,
 `Phone`       VARCHAR(20) NOT NULL ,
 `Email`       VARCHAR(50) NOT NULL ,
 `Country`     VARCHAR(50) NOT NULL ,
 `City`        VARCHAR(50) NOT NULL ,
 `Established` DATE ,
 `CreateDate`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
 `Type`        INT NOT NULL ,

PRIMARY KEY (`Group_ID`)
);





-- ************************************** `db_online_course`.`User`

CREATE TABLE `db_online_course`.`User`
(
 `User_ID`       BIGINT AUTO_INCREMENT ,
 `Username`      VARCHAR(50) NOT NULL ,
 `Password`      VARCHAR(150) NOT NULL ,
 `Name`          VARCHAR(50) NOT NULL ,
 `DoB`           DATETIME ,
 `Email`         VARCHAR(50) ,
 `FacebookToken` VARCHAR(200) ,
 `CreateDate`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
 `isTeacher`     BIT DEFAULT 0,
 `Star`          SMALLINT DEFAULT 0,

PRIMARY KEY (`User_ID`)
);





-- ************************************** `db_online_course`.`TeacherVote`

CREATE TABLE `db_online_course`.`TeacherVote`
(
 `Teacher_ID` BIGINT NOT NULL ,
 `Student_ID` BIGINT NOT NULL ,
 `Star`       SMALLINT NOT NULL ,

PRIMARY KEY (`Teacher_ID`, `Student_ID`),
KEY `fkIdx_701` (`Teacher_ID`),
CONSTRAINT `FK_701` FOREIGN KEY `fkIdx_701` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`),
KEY `fkIdx_706` (`Student_ID`),
CONSTRAINT `FK_706` FOREIGN KEY `fkIdx_706` (`Student_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Work_Study`

CREATE TABLE `db_online_course`.`Work_Study`
(
 `User_ID`  BIGINT NOT NULL ,
 `Group_ID` BIGINT NOT NULL ,

PRIMARY KEY (`User_ID`, `Group_ID`),
KEY `fkIdx_480` (`User_ID`),
CONSTRAINT `FK_480` FOREIGN KEY `fkIdx_480` (`User_ID`) REFERENCES `db_online_course`.`User` (`User_ID`),
KEY `fkIdx_485` (`Group_ID`),
CONSTRAINT `FK_485` FOREIGN KEY `fkIdx_485` (`Group_ID`) REFERENCES `db_online_course`.`Group` (`Group_ID`)
);





-- ************************************** `db_online_course`.`Collection`

CREATE TABLE `db_online_course`.`Collection`
(
 `User_ID`        BIGINT NOT NULL ,
 `Collection_ID`  BIGINT AUTO_INCREMENT ,
 `CollectionName` VARCHAR(50) NOT NULL ,
 `CreateDate`     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),

PRIMARY KEY (`Collection_ID`),
KEY `fkIdx_460` (`User_ID`),
CONSTRAINT `FK_460` FOREIGN KEY `fkIdx_460` (`User_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Course`

CREATE TABLE `db_online_course`.`Course`
(
 `Course_ID`   BIGINT AUTO_INCREMENT ,
 `Name`        VARCHAR(50) NOT NULL ,
 `Description` TEXT ,
 `Star`        TINYINT DEFAULT 0,
 `Length`      TIME(6) ,
 `CreateDate`  DATETIME DEFAULT CURRENT_TIMESTAMP() ,
 `Teacher_ID`  BIGINT NOT NULL ,
 `OpenedClass` BIGINT DEFAULT 0 ,

PRIMARY KEY (`Course_ID`),
KEY `fkIdx_678` (`Teacher_ID`),
CONSTRAINT `FK_678` FOREIGN KEY `fkIdx_678` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`CourseVote`

CREATE TABLE `db_online_course`.`CourseVote`
(
 `Course_ID` BIGINT NOT NULL ,
 `User_ID`   BIGINT NOT NULL ,
 `Star`      SMALLINT DEFAULT 0 ,

PRIMARY KEY (`Course_ID`, `User_ID`),
KEY `fkIdx_689` (`Course_ID`),
CONSTRAINT `FK_689` FOREIGN KEY `fkIdx_689` (`Course_ID`) REFERENCES `db_online_course`.`Course` (`Course_ID`),
KEY `fkIdx_694` (`User_ID`),
CONSTRAINT `FK_694` FOREIGN KEY `fkIdx_694` (`User_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Collection_Course`

CREATE TABLE `db_online_course`.`Collection_Course`
(
 `Course_ID`     BIGINT NOT NULL ,
 `Collection_ID` BIGINT NOT NULL ,

PRIMARY KEY (`Course_ID`, `Collection_ID`),
KEY `fkIdx_474` (`Course_ID`),
CONSTRAINT `FK_474` FOREIGN KEY `fkIdx_474` (`Course_ID`) REFERENCES `db_online_course`.`Course` (`Course_ID`),
KEY `fkIdx_683` (`Collection_ID`),
CONSTRAINT `FK_683` FOREIGN KEY `fkIdx_683` (`Collection_ID`) REFERENCES `db_online_course`.`Collection` (`Collection_ID`)
);





-- ************************************** `db_online_course`.`Class`

CREATE TABLE `db_online_course`.`Class`
(
 `Course_ID`      BIGINT NOT NULL ,
 `Class_ID`       BIGINT NOT NULL ,
 `OpenDate`       DATETIME ,
 `EndDate`        DATETIME ,
 `Teacher_ID`     BIGINT NOT NULL ,
 `NoLesson`       SMALLINT NOT NULL ,

PRIMARY KEY (`Course_ID`, `Class_ID`),
KEY `fkIdx_422` (`Course_ID`),
CONSTRAINT `FK_422` FOREIGN KEY `fkIdx_422` (`Course_ID`) REFERENCES `db_online_course`.`Course` (`Course_ID`),
KEY `fkIdx_672` (`Teacher_ID`),
CONSTRAINT `FK_672` FOREIGN KEY `fkIdx_672` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Course_Tag`

CREATE TABLE `db_online_course`.`Course_Tag`
(
 `Course_ID` BIGINT NOT NULL ,
 `Tag_ID`    BIGINT NOT NULL ,

PRIMARY KEY (`Course_ID`, `Tag_ID`),
KEY `fkIdx_247` (`Course_ID`),
CONSTRAINT `Class_Tag` FOREIGN KEY `fkIdx_247` (`Course_ID`) REFERENCES `db_online_course`.`Course` (`Course_ID`),
KEY `fkIdx_252` (`Tag_ID`),
CONSTRAINT `Tag_Class` FOREIGN KEY `fkIdx_252` (`Tag_ID`) REFERENCES `db_online_course`.`Tag` (`Tag_ID`)
);





-- ************************************** `db_online_course`.`Attend`

CREATE TABLE `db_online_course`.`Attend`
(
 `Course_ID`    BIGINT NOT NULL ,
 `Class_ID`     BIGINT NOT NULL ,
 `GradeFormula` TEXT NOT NULL ,
 `EnrollDate`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Student_ID`   BIGINT NOT NULL ,
 `LastCheckin`  DATETIME NOT NULL ,
 `Status`       MEDIUMTEXT NOT NULL ,

PRIMARY KEY (`Course_ID`, `Class_ID`),
KEY `fkIdx_428` (`Course_ID`, `Class_ID`),
CONSTRAINT `FK_428` FOREIGN KEY `fkIdx_428` (`Course_ID`, `Class_ID`) REFERENCES `db_online_course`.`Class` (`Course_ID`, `Class_ID`),
KEY `fkIdx_668` (`Student_ID`),
CONSTRAINT `FK_668` FOREIGN KEY `fkIdx_668` (`Student_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Lesson`

CREATE TABLE `db_online_course`.`Lesson`
(
 `Lesson_ID`   BIGINT NOT NULL ,
 `Course_ID`   BIGINT NOT NULL ,
 `Class_ID`    BIGINT NOT NULL ,
 `Name`        VARCHAR(50) NOT NULL ,
 `Description` TEXT NOT NULL ,
 `Create`      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `LastUpdate`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Teacher_ID`  BIGINT NOT NULL ,
 `NoExercise`  SMALLINT DEFAULT 0 ,
 `NoContent`   SMALLINT DEFAULT 0 ,

PRIMARY KEY (`Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_502` (`Course_ID`, `Class_ID`),
CONSTRAINT `FK_502` FOREIGN KEY `fkIdx_502` (`Course_ID`, `Class_ID`) REFERENCES `db_online_course`.`Class` (`Course_ID`, `Class_ID`),
KEY `fkIdx_664` (`Teacher_ID`),
CONSTRAINT `FK_664` FOREIGN KEY `fkIdx_664` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Content`

CREATE TABLE `db_online_course`.`Content`
(
 `Content_ID` BIGINT NOT NULL ,
 `Lesson_ID`  BIGINT NOT NULL ,
 `Course_ID`  BIGINT NOT NULL ,
 `Class_ID`   BIGINT NOT NULL ,
 `Title`      VARCHAR(45) NOT NULL ,
 `CreateDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `LastUpdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Type`       INT NOT NULL ,
 `Text`       LONGTEXT NOT NULL ,
 `Teacher_ID` BIGINT NOT NULL ,

PRIMARY KEY (`Content_ID`, `Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_640` (`Lesson_ID`, `Course_ID`, `Class_ID`),
CONSTRAINT `FK_640` FOREIGN KEY `fkIdx_640` (`Lesson_ID`, `Course_ID`, `Class_ID`) REFERENCES `db_online_course`.`Lesson` (`Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_646` (`Teacher_ID`),
CONSTRAINT `FK_646` FOREIGN KEY `fkIdx_646` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Exercise`

CREATE TABLE `db_online_course`.`Exercise`
(
 `Exercise_ID` BIGINT NOT NULL ,
 `Lesson_ID`  BIGINT NOT NULL ,
 `Course_ID`  BIGINT NOT NULL ,
 `Class_ID`   BIGINT NOT NULL ,
 `Title`       VARCHAR(45) NOT NULL ,
 `CreateDate`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Description` VARCHAR(45) NOT NULL ,
 `Question`    VARCHAR(45) NOT NULL ,
 `Teacher_ID` BIGINT NOT NULL ,

PRIMARY KEY (`Exercise_ID`, `Lesson_ID`, `Class_ID`, `Course_ID`),
KEY `fkIdx_585` (`Lesson_ID`, `Course_ID`, `Class_ID`),
CONSTRAINT `FK_585` FOREIGN KEY `fkIdx_585` (`Lesson_ID`, `Course_ID`, `Class_ID`) REFERENCES `db_online_course`.`Lesson` (`Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_591` (`Teacher_ID`),
CONSTRAINT `FK_591` FOREIGN KEY `fkIdx_591` (`Teacher_ID`) REFERENCES `db_online_course`.`User` (`User_ID`)
);





-- ************************************** `db_online_course`.`Comment`

CREATE TABLE `db_online_course`.`Comment`
(
 `Comment_ID`       BIGINT NOT NULL ,
 `Lesson_ID`        BIGINT NOT NULL ,
 `Course_ID`        BIGINT NOT NULL ,
 `Class_ID`         BIGINT NOT NULL ,
 `Create`           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Inappropriate`    BIT NOT NULL DEFAULT 0 ,
 `Deleted`          BIT NOT NULL DEFAULT 0 ,
 `ParrentThread_ID` BIGINT COMMENT 'A reply to a thread' ,
 `User_ID`          BIGINT NOT NULL ,
 `ParrentLesson_ID` BIGINT ,
 `ParrentCourse_ID` BIGINT ,
 `ParrentOpenDay`   BIGINT ,

PRIMARY KEY (`Comment_ID`, `Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_234` (`ParrentThread_ID`, `ParrentLesson_ID`, `ParrentCourse_ID`, `ParrentOpenDay`),
CONSTRAINT `Reply` FOREIGN KEY `fkIdx_234` (`ParrentThread_ID`, `ParrentLesson_ID`, `ParrentCourse_ID`, `ParrentOpenDay`) REFERENCES `db_online_course`.`Comment` (`Comment_ID`, `Lesson_ID`, `Course_ID`, `Class_ID`),
KEY `fkIdx_353` (`User_ID`),
CONSTRAINT `User_Comment` FOREIGN KEY `fkIdx_353` (`User_ID`) REFERENCES `db_online_course`.`User` (`User_ID`),
KEY `fkIdx_378` (`Lesson_ID`, `Course_ID`, `Class_ID`),
CONSTRAINT `Lesson_Comment` FOREIGN KEY `fkIdx_378` (`Lesson_ID`, `Course_ID`, `Class_ID`) REFERENCES `db_online_course`.`Lesson` (`Lesson_ID`, `Course_ID`, `Class_ID`)
);





-- ************************************** `db_online_course`.`Submission`

CREATE TABLE `db_online_course`.`Submission`
(
 `Submission_ID` BIGINT NOT NULL ,
 `Student_ID`    BIGINT NOT NULL ,
 `Exercise_ID`   BIGINT NOT NULL ,
 `Lesson_ID`     BIGINT NOT NULL ,
 `Class_ID`      BIGINT NOT NULL ,
 `Course_ID`     BIGINT NOT NULL ,
 `CreateDate`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() ,
 `Score`         INT NOT NULL DEFAULT 0 ,

PRIMARY KEY (`Submission_ID`, `Student_ID`, `Exercise_ID`, `Lesson_ID`, `Class_ID`, `Course_ID`),
KEY `fkIdx_601` (`Student_ID`),
CONSTRAINT `FK_601` FOREIGN KEY `fkIdx_601` (`Student_ID`) REFERENCES `db_online_course`.`User` (`User_ID`),
KEY `fkIdx_605` (`Exercise_ID`, `Lesson_ID`, `Class_ID`, `Course_ID`),
CONSTRAINT `FK_605` FOREIGN KEY `fkIdx_605` (`Exercise_ID`, `Lesson_ID`, `Class_ID`, `Course_ID`) REFERENCES `db_online_course`.`Exercise` (`Exercise_ID`, `Lesson_ID`, `Class_ID`, `Course_ID`)
);




