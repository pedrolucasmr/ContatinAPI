DROP DATABASE IF EXISTS contatinAPI;
CREATE DATABASE contatinAPI;
USE contatinAPI;
CREATE TABLE users(id INT PRIMARY KEY AUTO_INCREMENT, emailLogin VARCHAR(255) NOT NULL UNIQUE,createdAT DATETIME DEFAULT(NOW()));
CREATE TABLE contacts(id INT PRIMARY KEY AUTO_INCREMENT, firstName VARCHAR(255) NOT NULL, lastName VARCHAR(255) DEFAULT(NULL),nickname VARCHAR(255) DEFAULT(NULL), company VARCHAR(255) DEFAULT(NULL), isComercial BOOL DEFAULT(FALSE), createdAt DATETIME DEFAULT(NOW()),userId INT NOT NULL, FOREIGN KEY(userId) REFERENCES users(id));
CREATE TABLE emails(id INT PRIMARY KEY AUTO_INCREMENT, address VARCHAR(255) UNIQUE, isComercial BOOL DEFAULT(FALSE),heading VARCHAR(255) DEFAULT("EMAIL"), subheading VARCHAR(255) DEFAULT(NULL),contactId INT, FOREIGN KEY(contactId) REFERENCES contacts(id));
CREATE TABLE telephones(id INT PRIMARY KEY AUTO_INCREMENT,phoneNumber VARCHAR(255) NOT NULL,DDI char(3) NOT NULL, DDD char(3) NOT NULL,heading VARCHAR(255) NOT NULL DEFAULT("TELEFONE"),subheading VARCHAR(255) DEFAULT(NULL), contactId INT, FOREIGN KEY(contactId) REFERENCES contacts(id));
CREATE TABLE contactLists(id INT PRIMARY KEY AUTO_INCREMENT, heading VARCHAR(255) NOT NULL DEFAULT("LISTA DE CONTATOS"),subheading VARCHAR(255) DEFAULT(NULL),createdAt DATETIME DEFAULT(NOW()),userId INT NOT NULL, FOREIGN KEY(userId) REFERENCES users(id));
CREATE TABLE contactOfAList(contactId INT, listId INT, FOREIGN KEY(contactId) REFERENCES contacts(id), FOREIGN KEY(listId) REFERENCES contactLists(id));

DELIMITER //

CREATE PROCEDURE GetLastContactId(IN iUserId INT)
BEGIN
	SELECT id FROM contacts WHERE userId=iUserId ORDER BY createdAt DESC LIMIT 1;
END//

CREATE PROCEDURE SetNewUser(IN iEmailLogin VARCHAR(255))
BEGIN
	INSERT INTO users(emailLogin) VALUE(iEmailLogin);
END//

CREATE PROCEDURE SetNewContactWithAutomaticId(IN iFirstName VARCHAR(255),IN iLastName VARCHAR(255),IN iNickname VARCHAR(255), IN iCompany VARCHAR(255), IN iIsComercial BOOL, IN iUserId INT)
BEGIN
	INSERT INTO contacts(firstName,lastName,nickname,company,isComercial,userId) VALUES(iFirstName,iLastName,iNickname,iCompany,iIsComercial,iUserId);
    CALL GetLastContactId(iUserId);
END//

CREATE PROCEDURE SetNewContact(IN iId INT, IN iFirstName VARCHAR(255),IN iLastName VARCHAR(255),IN iNickname VARCHAR(255), IN iCompany VARCHAR(255), IN iIsComercial BOOL, IN iUserId INT)
BEGIN
	INSERT INTO contacts(id,firstName,lastName,nickname,company,isComercial,userId) VALUES(iId,iFirstName,iLastName,iNickname,iCompany,iIsComercial,iUserId);
END//

CREATE PROCEDURE SetNewEmail(IN iAddress VARCHAR(255), IN iIsComercial BOOL, IN iHeading VARCHAR(255), IN iSubheading VARCHAR(255), IN iContactId INT)
BEGIN
	INSERT INTO emails(address,isComercial,heading,subheading,contactId) VALUES(iAddress,iIsComercial,iHeading,iSubheading,iContactId);
END//

CREATE PROCEDURE SetNewTelephone(IN iPhoneNumber VARCHAR(255), IN iDDI char(3),IN iDDD char(3), IN iHeading VARCHAR(255),IN iSubheading VARCHAR(255),IN iContactId INT)
BEGIN
	INSERT INTO telephones(phoneNumber,DDI,DDD,heading,subheading,contactId) VALUES(iPhoneNumber,iDDI,iDDD,iHeading,iSubheading,iContactId);
END//

CREATE PROCEDURE SetNewContactList(IN iHeading VARCHAR(255),IN iSubheading VARCHAR(255),IN iUserId INT)
BEGIN
	INSERT INTO contactLists(heading,subheading,userId) VALUES(iHeading,iSubheading,iUserId);
END//

CREATE PROCEDURE AddContactToList(IN iContactId INT, IN iListId INT)
BEGIN
	CASE
		WHEN(SELECT COUNT(*) FROM contactOfAList WHERE contactId=iContactId AND listId=iListId)=0 THEN INSERT INTO contactOfAList(contactId,listId) VALUES(iContactId,iListId);
	END CASE;
END//

CREATE PROCEDURE CountContactEmails(IN iContactId INT)
BEGIN
	SELECT COUNT(*) FROM emails WHERE contactId=iContactId;
END//

CREATE PROCEDURE CountContactTelephones(IN iContactId INT)
BEGIN
	SELECT COUNT(*) FROM telephones WHERE contactId=iContactId;
END//

CREATE PROCEDURE GetAllContactsNames(IN iUserId INT)
BEGIN
	SELECT id,firstName,lastName,company FROM contacts WHERE userId=iUserId;
END//

CREATE PROCEDURE GetContactDetails(IN iContactId INT)
BEGIN
	SELECT * FROM contacts WHERE id=iContactId;
END//

CREATE PROCEDURE GetContactEmails(IN iContactId INT)
BEGIN
	SELECT * FROM emails WHERE contactId=iContactId;
END//

CREATE PROCEDURE GetContactTelephones(IN iContactId INT)
BEGIN
	SELECT * FROM telephones WHERE contactId=iContactId;
END//

CREATE PROCEDURE GetListsWithTheContact(IN iContactId INT)
BEGIN
	SELECT id,heading FROM contactOfAList AS cl INNER JOIN contactLists AS l ON c.listId=l.id WHERE c.contactId=iContactId;
END//

CREATE PROCEDURE GetAList(IN iListId INT)
BEGIN
	SELECT * FROM contactLists AS cl INNER JOIN contactOfAList AS col ON cl.id=col.listId INNER JOIN contacts AS c ON cl.contactId=c.id WHERE cl.id=iListId;
END//

CREATE PROCEDURE GetAllListsNames(IN iUserId INT)
BEGIN
	SELECT id, heading, subheading FROM contactLists WHERE userId=iUserId;
END//

