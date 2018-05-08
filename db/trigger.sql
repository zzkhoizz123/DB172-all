DELIMITER //

CREATE TRIGGER UpdateOpenedClass AFTER INSERT ON Class
FOR EACH ROW
BEGIN
      
      UPDATE Course SET OpenedClass = NEW.Class_ID
      WHERE Course_ID = NEW.Course_ID;
      
END;//

CREATE TRIGGER UpdateNoLess AFTER INSERT ON Lesson
FOR EACH ROW
BEGIN
      
      UPDATE Class SET NoLesson = NEW.Lesson_ID
      WHERE Course_ID = NEW.Course_ID AND Class_ID = NEW.Class_ID;
      
END;//


CREATE TRIGGER UpdateNoContent AFTER INSERT ON Content
FOR EACH ROW
BEGIN
      
      UPDATE Lesson SET NoContent = NEW.Content_ID
      WHERE Course_ID = NEW.Course_ID AND Class_ID = NEW.Class_ID
            AND Lesson_ID = NEW.Lesson_ID;
      
END;//

DELIMITER ;