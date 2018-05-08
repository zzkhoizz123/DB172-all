DELIMITER //


DROP PROCEDURE IF EXISTS `AddLesson`//
CREATE PROCEDURE `AddLesson`(IN Courseid BIGINT,IN Classid BIGINT, IN Lname CHAR(50))
BEGIN
      DECLARE lessonid SMALLINT;
      DECLARE teacherid BIGINT;

      SELECT NoLesson, Teacher_ID INTO @lessonid, @teacherid
      FROM Class WHERE Class_ID = Classid AND Course_ID = Courseid;

      INSERT Lesson(Course_ID, Class_ID, Teacher_ID, Lesson_ID, Name)
      VALUES (Courseid, Classid, @teacherid, @lessonid + 1, Lname);

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