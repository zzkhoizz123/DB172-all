DELIMITER //

DROP PROCEDURE IF EXISTS `AddClass`//
CREATE PROCEDURE `AddClass`(IN Courseid BIGINT, IN Teacher_ID BIGINT)
BEGIN
      DECLARE Class_id BIGINT;
      SELECT OpenedClass INTO @Class_id
      FROM Course WHERE Course_ID = Courseid;

      INSERT Class(Course_ID, Class_ID, Teacher_ID)
           VALUES (Courseid,@Class_id+1,Teacher_ID);

      # Trigger on OpenedClass to update new value
END;//

DROP PROCEDURE IF EXISTS `GetClass`//
CREATE PROCEDURE `GetClass`(IN Course_id BIGINT, IN Class_id BIGINT)
BEGIN
     SELECT OpenDate, EndDate, Teacher_ID, NoLesson
     FROM Class
     WHERE Course_ID = Course_id AND Class_ID = Class_id;
END;//







DELIMITER ;