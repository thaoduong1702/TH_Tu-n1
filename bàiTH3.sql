create database MarkManagement
go
use MarkManagement
Create table Students
(
StudentID nvarchar(12) primary key,
StudentName nvarchar(25) not null,
DateofBirth datetime not null,
Email nvarchar(40),
Phone nvarchar(12),
Class nvarchar(10)
)
go

Create table Subjects
(
SubjectID nvarchar(10) primary key,
SubjectName nvarchar(25) not null
)
go

create table Mark
(
StudentID nvarchar(12),
SubjectID nvarchar(10),
Date Datetime,
Theory Tinyint,
Practical Tinyint
PRIMARY KEY(StudentID, SubjectID)
)
go

INSERT INTO Students(StudentID, StudentName, DateofBirth, Email, Phone, Class) VALUES ('AV0807005', N'Mai Trung Hiếu', '11-10-1989','trunghieu@yahoo.com',0904115116,'AV1'),
                                                                                      ('AV0807006',N'Nguyễn Quý Hùng', '02-12-1988', 'quyhung@yahoo.com', 0955667787, 'AV2'),
																					  ('AV0807007', N'Đỗ Đắc Huỳnh', '02-01-1990', 'dachuynh@yahoo.com', 0988574747,'AV2'),
																					  ('AV0807009', N'An Đăng Khuê', '06-03-1986', 'dangkhue@yahoo.com', 0986757463, 'AV1'),
																					  ('AV0807010',N'Nguyễn T. Tuyết Lan','12-07-1989' ,'tuyetlan@yahoo.com', 0983310342,'AV2'),
																					  ('AV0807011',N'Đinh Phụng Long','02-12-1990','phunglong@yahoo.com', NULL ,'AV1'),
																					  ('AV0807012',N'Nguyễn Tuấn Nam','02-03-1990','tuannam@yahoo.com', NULL , 'AV1')

INSERT INTO Subjects(SubjectID, SubjectName) VALUES ('S001','SQL'),
                                                    ('S002','JAVA SIMPLEFIELD'),
													('S003','ACTIVE SERVER PAGE')

INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807005', 'S001', 8, 25, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES('AV0807006', 'S002', 16, 30, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807007', 'S001', 10, 25, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807009', 'S003', 7, 13, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807010', 'S003', 9, 16, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807011', 'S002', 8, 30, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807012', 'S001', 7, 31, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807005', 'S002', 12, 11, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807009', 'S003', 11, 20, '06-05-2008')
INSERT INTO Mark(StudentID, SubjectID, Theory, Practical, Date) VALUES ('AV0807010', 'S001', 7, 6, '06-06-2008')

---Câu 1---
select * from Students
go
---Câu 2---
select * from Students
where Class = 'AV1'
go

---Câu 3---
UPDATE Students set Class = 'AV2' where StudentID = 'AV0807012'

---Câu 4--

SELECT COUNT(StudentName) as Lớp1
FROM Students
WHERE Class = 'AV1';

SELECT COUNT(StudentName) as Lớp2
FROM Students
WHERE Class = 'AV2';

---Câu 5--
Select * From Students Where Class='AV2' Order by StudentName

----Câu 6---
select * from Students inner join Mark ON Students.StudentID = Mark.StudentID
Where SubjectID = 'S001' and theory < 10 and Date = '6/5/2008'

----Câu 7----
select count(Class) from Students inner join Mark ON Students.StudentID = Mark.StudentID
Where SubjectID = 'S001' and theory < 10

---Câu 8---
select * from Students 
where Class = 'AV1' and DateofBirth > '01-01-1980'

---Câu 9---
DELETE FROM Students
Where StudentID = 'AV0807011'

---Câu 10---
SELECT Students.StudentID, StudentName, SubjectName, Theory, Practical, Date 
FROM Mark 
INNER JOIN Subjects ON Mark.SubjectID = Subjects.SubjectID 
INNER JOIN Students ON Mark.StudentID = Students.StudentID 
WHERE Subjects.SubjectID = 'S001' AND Date = '6/5/2008';