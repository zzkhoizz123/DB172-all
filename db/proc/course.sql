DELIMITER //

DROP PROCEDURE IF EXISTS `GetCourse`//
CREATE PROCEDURE `GetCourse`(IN id BIGINT)
BEGIN
      SELECT Name, Description, Star, Length, CreateDate, OpenedClass 
      FROM Course
      WHERE Course_ID = id;
END;//

DROP PROCEDURE IF EXISTS `AddCourse`//
CREATE PROCEDURE `AddCourse`(IN Cname CHAR(20), IN Teacher_ID BIGINT)
BEGIN
      INSERT Course(Name, Teacher_ID) VALUES(Cname, Teacher_ID);
END;//

DROP PROCEDURE IF EXISTS `UpdateDescription`//
CREATE PROCEDURE `UpdateDescription`(IN id BIGINT,IN Cname CHAR(50), IN description text,IN image CHAR(128))
BEGIN
      UPDATE Course SET Description = description ,
             ImageLink = image ,
             Name = Cname
      WHERE Course_ID=id;
END;//







DELIMITER ;