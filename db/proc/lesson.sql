DELIMITER //


DROP PROCEDURE IF EXISTS `AddLesson`//
CREATE PROCEDURE `AddLesson`(IN Course_id BIGINT,IN Class_ID BIGINT, IN Lname CHAR(50))
BEGIN
      DECLARE lessonid SMALLINT;
      DECLARE Teacherid BIGINT;

      # SELECT Class_id, Course_id;

      SELECT NoLesson, Teacher_ID INTO @lessonid, @Teacherid
      FROM Class WHERE Class_ID = Class_id AND Course_ID = Course_id LIMIT 1;

      # SELECT @Nolesson, @Teacherid;
      
      INSERT Lesson(Course_ID, Class_ID, Teacher_ID, Lesson_ID, Name)
            VALUES (Course_id, Class_ID, @Teacherid, @lessonid + 1, Lname);

      # Trigger on OpenedClass to update new value
END;//

DROP PROCEDURE IF EXISTS `GetLesson`//
CREATE PROCEDURE `GetLesson`(IN Courseid BIGINT, IN Classid BIGINT, IN Lessonid BIGINT )
BEGIN
      SELECT *
      FROM Lesson
      WHERE Course_ID = Courseid AND Class_ID = Classid AND Lesson_ID = Lessonid;
END;//





DELIMITER ;