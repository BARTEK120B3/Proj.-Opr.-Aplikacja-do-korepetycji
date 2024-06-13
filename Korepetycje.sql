CREATE DATABASE tutorsFind CHARACTER SET utf8 COLLATE utf8_polish_ci;


-- tabela klasa 
-- powiazania:user
CREATE TABLE tutorsFind.class (
    id int AUTO_INCREMENT,
    name varchar(3) NOT NUll,
    PRIMARY KEY(id)
);

-- tabela subject
-- powiazania competence ,note
CREATE TABLE tutorsFind.subject(
    id int AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    PRIMARY KEY(id)
);

-- tabela competence:
-- powiazania:userCompetence
CREATE TABLE tutorsFind.competence(
    id int AUTO_INCREMENT ,
    subjectId int  NOT NULL,
    chapter varchar(30) NOT NULL,
    topic varchar(30) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (subjectId) REFERENCES tutorsFind.subject(id)
);
ALTER TABLE tutorsFind.competence ADD INDEX(subjectId);

-- tabela user 
-- powiazania:userNote
CREATE TABLE tutorsFind.user(
    id int AUTO_INCREMENT,
    name varchar(30) ,
    surname varchar(30) ,
    nick varchar(30) ,
    email varchar(30) NOT NULL,
    password varchar(100) NOT NULL,
    classId int ,
    strikes int(1) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (classId) REFERENCES class(id),
    FOREIGN KEY(permisionId) REFERENCES permision(id)

);
ALTER TABLE tutorsFind.user ADD INDEX (classId);
ALTER TABLE tutorsFind.user ADD INDEX (permisionId);

-- tabela tutor 
-- powiązania:tutorRate

CREATE TABLE tutorsFind.tutor(
    id int AUTO_INCREMENT,
    userId int NOT NULL,
    competenceId int NOT NULL,
    avgRate int(2) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);
ALTER TABLE tutorsFind.tutor ADD INDEX (userId);

CREATE TABLE tutorsFind.tutorRate(
    id int AUTO_INCREMENT,
    tutorId int NOT NULL,
    userId int NOT NULL,
    rate int (1) NOT NULL,
    text varchar(1000) NOT NULL,
    creationDate date NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE tutorsFind.tutorRateReported(
    id int AUTO_INCREMENT,
    tutorRateId int NOT NULL,
    text varchar(1000) NOT NULL,
    reportDate date NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tutorRateId) REFERENCES tutorRate(id)
);
ALTER TABLE tutorsFind.tutorRateReported ADD INDEX(tutorRateId);


CREATE TABLE tutorsFind.note( 
    id int AUTO_INCREMENT,
    tutorId int NOT NULL,
    title varchar(10) NOT NULL,
    topicId int NOT NULL,
    content varchar(6000) ,
    media BLOB ,
    isPrivate boolean NOT NULL,
    status ENUM("Oczekujący","Zatwierdzony"),
    creationDate date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(tutorId) REFERENCES tutor(id)
);
ALTER TABLE tutorsFind.note ADD INDEX(tutorId);

CREATE TABLE tutorsFind.noteComment(
    id int AUTO_INCREMENT,
    userId int NOT NULL,
    noteId int NOT NULL,
    content varchar(1000),
    rate int(2) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES tutorsFind.user(id),
    FOREIGN KEY(noteId) REFERENCES tutorsFind.note(id)
);
ALTER TABLE tutorsFind.noteComment ADD INDEX (userId);
ALTER TABLE tutorsFind.noteComment ADD INDEX (noteId);



CREATE TABLE tutorsFind.announcement(
    id int AUTO_INCREMENT,
    tutorId int NOT NULL ,
    creationDate date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(tutorId) REFERENCES tutorsFind.tutor(id)

);
ALTER TABLE tutorsFind.announcement ADD INDEX(tutorId);





CREATE TABLE tutorsFind.lesson(
    id int AUTO_INCREMENT,
    tutorId int NOT NULL,
    userId int NOT NULL,
    topicId int NOT NULL,
    lessonDate date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (tutorId) REFERENCES tutor(id),
    FOREIGN KEY (userId) REFERENCES user(id)
);
ALTER TABLE tutorsFind.lesson ADD INDEX(tutorId);
ALTER TABLE tutorsFind.lesson ADD INDEX(userId);
ALTER TABLE tutorsFind.lesson ADD INDEX(topicId);

CREATE TABLE tutorsFind.lecture(
    id int AUTO_INCREMENT,
    tutorId int NOT NULL,
    topicId int NOT NULL,
    lectureDate date NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (tutorId) REFERENCES tutor(id)
  
);

ALTER TABLE tutorsFind.lecture ADD INDEX(tutorId);
ALTER TABLE tutorsFind.lecture ADD INDEX(topicId);


CREATE TABLE tutorsFind.userReported(
    id int AUTO_INCREMENT,
    userId int NOT NULL,
    reason varchar(100),
    PRIMARY KEY(id),
    FOREIGN KEY (userId) REFERENCES user(id)

);
ALTER TABLE tutorsFind.userReported ADD INDEX(userId);