DELIMITER //

DROP PROCEDURE IF EXISTS `AddContent`//
CREATE PROCEDURE `AddContent`(IN courseid BIGINT, IN classid BIGINT, IN lessonid BIGINT,
                              IN title CHAR(48) , IN text LONGTEXT, IN Type INT)

BEGIN
      DECLARE contentid BIGINT;
      DECLARE teacherid BIGINT;
      SELECT NoContent , Teacher_ID INTO @contentid, @teacherid
      FROM Lesson WHERE Course_ID = courseid AND Class_ID = classid AND Lesson_ID = lessonid;

      INSERT Content(Course_ID, Class_ID, Lesson_ID, Content_ID, Title, Type, Teacher_ID, Text)
           VALUES (courseid, classid, lessonid, @contentid + 1, title, Type, @teacherid, text);

END;//




DROP PROCEDURE IF EXISTS `GetContent`//
CREATE PROCEDURE `GetContent`(IN courseid BIGINT, IN classid BIGINT,
                              IN lessonid BIGINT, IN contentid BIGINT)
BEGIN
     SELECT Title, Text, Type, LastUpdate
     FROM Content
     WHERE Course_ID = courseid AND Class_ID = classid
       AND Lesson_ID = lessonid AND Content_ID = contentid;
END;//







DELIMITER ;