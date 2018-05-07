DELIMITER //

DROP PROCEDURE IF EXISTS `AddUser`//
CREATE PROCEDURE `AddUser`(IN uname CHAR(20), IN pwd CHAR(64), IN email CHAR(50))
BEGIN
      INSERT User(Username, Password, Email) VALUES(uname, pwd, email);
END;//

DROP PROCEDURE IF EXISTS `ValidatePwdbyName`//
CREATE PROCEDURE `ValidatePwdbyName`(IN uname CHAR(20), IN pwd CHAR(64))
BEGIN
      SELECT User_ID AS ID FROM User WHERE Username LIKE uname AND Password LIKE pwd;
END;//

DROP PROCEDURE IF EXISTS `GetUserInfo`//
CREATE PROCEDURE `GetUserInfo`(IN id INT)
BEGIN
      SELECT Username, Name, DoB, Email, FacebookToken, CreateDate FROM User WHERE User_ID=id;
END;//

DROP PROCEDURE IF EXISTS `ResetPwd`//
CREATE PROCEDURE `ResetPwd`(IN uname CHAR(20), IN pwd CHAR(64), IN new_pwd CHAR(64))
BEGIN
      UPDATE User SET Password=new_pwd, LastPwdUpdate=CURRENT_TIMESTAMP()
            WHERE Username LIKE uname AND
                  Password LIKE pwd;
END;//

DROP PROCEDURE IF EXISTS `LastPwdUpdate`//
CREATE PROCEDURE `LastPwdUpdate`(IN id INT)
BEGIN
      SELECT LastPwdUpdate FROM User WHERE User_ID=id;
END;//



DELIMITER ;