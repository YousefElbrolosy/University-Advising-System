﻿---------------------------------------------------------------------------------------
--2.1 (1) NO PROBLEMS HERE
CREATE DATABASE Advising_Team_61
Go
USE Advising_Team_61
GO
--2.1 (2)
Create Proc CreateAllTables
	As
	--INSERT VALUES IN (2.3-B)
	Create Table Advisor( --NO PROBLEMS HERE BUT WE CAN THINK OF MORE CONSTRAINTS
		advisor_id int PRIMARY KEY IDENTITY NOT NULL,--IDENTITY BASED ON (2.3-B) 
		name varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-B) 
		email varchar(40) NOT NULL, --NOT NULL BASED ON (2.3-B) // We can add further Constraints 'LIKE (%@%.com)' 
		office varchar(40) NOT NULL, --NOT NULL BASED ON (2.3-B) 
		password varchar(40) NOT NULL--NOT NULL BASED ON (2.3-B)
	);
	--INSERT VALUES IN (2.3-A)
	Create Table Student(--FINANCIAL STATUS default value or should we make it a derived attribute? // WE CAN ALSO THINK OF MORE CONSTRAINTS
		student_id int Primary key IDENTITY,--IDENTITY BASED ON (2.3-A)
		f_name varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A)
		l_name varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A)
		gpa decimal(3,2), -- GPA NULL BASED ON (2.3-A) // GPA SHOULD WE Assign the decimal size
		faculty varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A)
		email varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A) // We can add further Constraints 'LIKE (%@%.com)' 
		major varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A)
		password varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-A)
		financial_status BIT DEFAULT 1,--NULL BASED ON (2.3-A) (or default value?) // SKIP THE DERIVATION IN THE SCHEMA?
		semester int NOT NULL,--NOT NULL BASED ON (2.3-A)
		acquired_hours int DEFAULT 0,--NULL BASED ON (2.3-A)
		assigned_hours int DEFAULT 0,--NULL BASED ON (2.3-A) and Ashan mawgouda f M1
		advisor_id int CONSTRAINT fk4 Foreign Key references Advisor ON DELETE SET NULL ON UPDATE CASCADE, --NULL BASED ON (2.3-A)
		CHECK (gpa BETWEEN 0.7 AND 5),--Based on common questions posted on CMS
        CHECK (assigned_hours<=34),--Based on common questions posted on CMS
        CHECK (acquired_hours>34)--Based on common questions posted on CMS
	);
	--INSERT VALUES IN (2.3-BB)
	Create Table Student_Phone (--NO PROBLEMS HERE
		student_id int CONSTRAINT fk5 Foreign Key references Student ON DELETE CASCADE ON UPDATE CASCADE, 
		phone_number varchar(40),
		Primary Key(student_id,phone_number)
	);
	--INSERT VALUES IN (2.3-G)
	Create Table Course (--NO PROBLEMS HERE BUT WE CAN THINK OF MORE CONSTRAINTS
		course_id int Primary Key Identity,--IDENTITY BASED ON (2.3-G)
		name varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-G)
		major varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-G) // CONSTRAINTS ON MAJOR ?? CHECK (major in ('ENG',....))
		is_offered BIT NOT NULL,--NOT NULL BASED ON (2.3-G) 
		credit_hours int NOT NULL,--NOT NULL BASED ON (2.3-G) // CONSTRAINT ON CREDIT HOURS?? CHECK (credit_hours BETWEEN 1 AND 8)
		semester int NOT NULL--NOT NULL BASED ON (2.3-G)
	);
	--INSERT VALUES IN (NO IDEA)
	Create Table PreqCourse_course (-- NO PROBLEMS HERE
		prerequisite_course_id int CONSTRAINT fk6 FOREIGN KEY references Course,
		course_id int CONSTRAINT fk7 FOREIGN KEY references Course,
		Primary Key (prerequisite_course_id, course_id),
	);
	--INSERT VALUES IN (NO IDEA)
	Create Table Instructor ( -- NOT NULL BASED ON SIMILARITY BETWEEN INSTRUCTOR ATTRIBUTES AND ADVISOR ATTRIBUTES
		instructor_id int PRIMARY KEY IDENTITY, 
		name varchar(40) NOT NULL, 
		email varchar(40) NOT NULL, 
		faculty varchar(40) NOT NULL, 
		office varchar(40) NOT NULL
	);
	--INSERT VALUES IN (NO IDEA)
	Create Table Instructor_Course (--NO PROBLEMS HERE
		course_id int CONSTRAINT fk8 FOREIGN KEY references Course
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		instructor_id int CONSTRAINT fk9 FOREIGN KEY references Instructor
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		Primary Key (course_id,instructor_id)
	);
	--INSERT VALUES IN (2.3-I)
	Create Table Student_Instructor_Course_Take (--NO PROBLEMS HERE
		student_id int CONSTRAINT fk10 Foreign Key references Student
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		course_id int CONSTRAINT fk11 Foreign Key references Course
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		instructor_id int CONSTRAINT fk12 Foreign Key references Instructor
		ON DELETE SET NULL
		ON UPDATE CASCADE, 
		semester_code varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-I)
		exam_type varchar(40) DEFAULT 'Normal',--DEFAULT VALUE BASED ON M2 DESC 
		grade varchar(40),--NULL BASED ON (2.3-I) 
		Primary Key(student_id,course_id,semester_code,exam_type),
		CHECK (exam_type IN('Normal','First_makeup','Second_makeup'))--CONSTRAINT BASED ON M2 DESC	
	);
	--INSERT VALUES IN (2.3-F)
	Create Table Semester (--NO PROBLEMS HERE
		semester_code varchar(40) PRIMARY KEY, 
		start_date DATE NOT NULL,--NOT NULL BASED ON (2.3-F)
		end_date DATE NOT NULL--NOT NULL BASED ON (2.3-F)
	);
	--INSERT VALUES IN (NO IDEA)
	Create Table Course_Semester (--NO PROBLEMS HERE
		course_id int CONSTRAINT fk13 FOREIGN KEY references Course
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		semester_code varchar(40) CONSTRAINT fk14 Foreign Key references Semester
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		Primary Key(course_id,semester_code)
	);
	--INSERT VALUES IN (NO IDEA) // INSTRUCTOR/COURSE In (2.3-H)
	Create Table Slot (--NOT NULLS BASED ON THE ASSUMPTION THAT EVERY SLOT THAT EXISTS IS ALREADY STORED AND YOU JUST UPDATE THE INSTRUCTOR/COURSE THAT IS ASSIGNED TO THIS SLOT // WE CAN THINK OF MORE CONSTRAINTS
		slot_id int IDENTITY Primary Key, 
		day varchar(40) NOT NULL,--IN(Sunday,Monday,...) 
		time varchar(40) NOT NULL,--IN(1st,2nd,3rd,...) 
		location varchar(40) NOT NULL, 
		course_id int CONSTRAINT fk15 Foreign Key references Course 
		ON UPDATE CASCADE
		ON DELETE SET NULL,-- NULL BASED ON (2.3-H) 
		instructor_id int CONSTRAINT fk16 Foreign Key references Instructor
		ON UPDATE CASCADE
		ON DELETE SET NULL -- NULL BASED ON (2.3-H)
	);
	--INSERT VALUES IN (2.3-R)
	Create Table Graduation_Plan (--NO PROBLEMS HERE
		plan_id int IDENTITY,--IDENTITY BASED ON (2.3-R) 
		semester_code varchar(40), 
		semester_credit_hours int NOT NULL,--NOT NULL BASED ON (2.3-R) 
		expected_grad_date date NOT NULL,--NOT NULL BASED ON (2.3-R)
		advisor_id int CONSTRAINT fk17 FOREIGN KEY references Advisor
		ON UPDATE CASCADE
		ON DELETE SET NULL,
		student_id int NOT NULL CONSTRAINT fk18 FOREIGN KEY references Student, --NOT NULL BASED ON (2.3-R)
		PRIMARY KEY (plan_id , semester_code)
	);
	--INSERT VALUES IN (2.3-S) // DELETE VALUES (2.3-U)
	Create Table GradPlan_Course (--NO PROBLEMS HERE
		plan_id int, 
		semester_code varchar(40), 
		course_id int,
		PRIMARY KEY(plan_id, semester_code, course_id),
		CONSTRAINT fk1 FOREIGN KEY(plan_id,semester_code) references Graduation_Plan
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	--INSERT VALUES IN (2.3-DD // 2.3-EE)
	Create Table Request (--ADVISOR --> NULL/NOT NULL
		request_id int PRIMARY KEY IDENTITY,--IDENTITY BASED ON (2.3-DD // 2.3-EE)
		type varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-DD // 2.3-EE)
		comment varchar(40) NOT NULL,-- NOT NULL BASED ON  (2.3-DD // 2.3-EE)
		status varchar(40) DEFAULT 'pending',--DEFAULT VALUE BASED ON M2 DESC 
		credit_hours int,--NULL BASED ON (2.3-DD // 2.3-EE)
		student_id int NOT NULL CONSTRAINT fk19 FOREIGN KEY references Student --NOT NULL BASED ON  (2.3-DD // 2.3-EE) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		advisor_id int CONSTRAINT fk20 FOREIGN KEY references Advisor,--NULL UNTIL ADVISOR RESPONDS? OR PUT THE CURRENT STUDENT'S ADVISOR 
		course_id int CONSTRAINT fk25 FOREIGN KEY references Course 
		ON UPDATE CASCADE
		ON DELETE CASCADE,--NULL BASED ON (2.3-DD // 2.3-EE)
		CHECK (status IN ('pending','accepted','approved','rejected'))--BASED ON M2 DESC 
	);
	--INSERT VALUES IN (2.3-K)
	Create Table MakeUp_Exam (--date datatype
		exam_id int PRIMARY KEY IDENTITY,--IDENTITY BASED ON (2.3-K)
		date DATETIME NOT NULL,--DATETIME IN 2.3-K // DATE IN UPDATED SCHEMA // NOT NULL BASED ON (2.3-K) 
		type varchar(40) NOT NULL,--NOT NULL BASED ON (2.3-K) 
		course_id int NOT NULL CONSTRAINT fk21 FOREIGN KEY references Course 
		ON DELETE CASCADE
		ON UPDATE CASCADE,--NOT NULL BASED ON (2.3-K) 
		CHECK(type in('First_makeup','Second_makeup'))--BASED ON M2 DESC
	);
	--INSERT VALUES IN (2.3-II // 2.3-KK)
	Create Table Exam_Student (--NO PROBLEMS HERE
		exam_id int CONSTRAINT fk2 FOREIGN KEY references MakeUp_Exam
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		student_id int CONSTRAINT fk22 FOREIGN KEY references Student
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		course_id int NOT NULL,--NOT NULL BASED ON (2.3-II // 2.3-KK) 
		PRIMARY KEY(exam_id,student_id)
	);
	--INSERT VALUES IN (NO IDEA)
	Create Table Payment(--NULL/NOT NULL BASED ON NOTHING // DERIVED ATTRIBUTE IS NOT DERIVED IN THE SCHEMA
		payment_id int identity PRIMARY KEY, 
		amount int NOT NULL,
		deadline DATETIME NOT NULL, 
		n_installments INT, 
		status varchar(40) DEFAULT 'notPaid',--DEFAULT VALUE BASED ON M2 DESC 
		fund_percentage decimal(5,2) NOT NULL,
		start_date DATETIME NOT NULL,
		student_id int NOT NULL CONSTRAINT fk23 FOREIGN KEY references Student
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		semester_code varchar(40) NOT NULL CONSTRAINT fk24 FOREIGN KEY references Semester 
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		CHECK(status IN ('notPaid','Paid'))--BASED ON M2 DESC
	);
	--INSERT VALUES IN (2.3-L)
	Create Table Installment (
		payment_id int CONSTRAINT fk3 FOREIGN KEY references Payment
		ON DELETE CASCADE
		ON UPDATE CASCADE, 
		deadline datetime,--AS DATEADD(month, 1, start_date),--JUST COMMENT: heya sa7 bas it is not explicitly stated fel schema fa can we assume enaha derived?
		amount int NOT NULL,
		status varchar(40) DEFAULT 'notPaid', --DEFAULT VALUE BASED ON M2 DESC 
		start_date DATETIME NOT NULL,
		PRIMARY KEY(payment_id,deadline),
		CHECK(status IN ('notPaid','Paid'))--BASED ON M2 DESC

	);
GO
------------------------------------------------------------------------------------
--2.1 (3) NO PROBLEMS HERE
Create PROC DropAllTables
	As
	DROP TABLE Student_instructor_course_take
	DROP TABLE Slot
	DROP TABLE PreqCourse_course
	DROP TABLE Instructor_Course
	DROP TABLE GradPlan_Course
	DROP TABLE Graduation_Plan
	DROP TABLE Course_semester
	DROP TABLE Request
	DROP TABLE Exam_Student
	DROP TABLE MakeUp_Exam
	DROP TABLE Installment
	DROP TABLE Payment
	DROP TABLE Instructor
	DROP TABLE Course
	DROP TABLE Semester
	DROP TABLE Student_Phone
	DROP TABLE Student
	DROP TABLE Advisor
GO
---------------------------------------------------------------------------------------
--2.1 (4) NO PROBLEMS HERE
CREATE PROCEDURE clearAllTables
AS	

	ALTER TABLE GradPlan_Course
	Drop fk1

	ALTER TABLE Exam_Student
	DROP fk2,fk22

	ALTER TABLE Installment
	DROP fk3

	ALTER TABLE Student
	DROP fk4

	ALTER TABLE Student_Phone
	DROP fk5

	ALTER TABLE PreqCourse_course
	DROP fk6,fk7

	ALTER TABLE Instructor_Course
	DROP fk8,fk9

	ALTER TABLE Student_Instructor_Course_Take
	DROP fk10,fk11,fk12

	ALTER TABLE Course_Semester
	DROP fk13,fk14

	ALTER TABLE Slot
	DROP fk15,fk16

	ALTER TABLE Graduation_Plan
	DROP fk17,fk18

	ALTER TABLE Request
	DROP fk19,fk20,fk25
	
	ALTER TABLE MakeUp_Exam
	DROP fk21

	ALTER TABLE Payment
	DROP fk23,fk24

    TRUNCATE TABLE Student_instructor_course_take
    TRUNCATE TABLE Slot
    TRUNCATE TABLE PreqCourse_course
    TRUNCATE TABLE Instructor_Course
    TRUNCATE TABLE GradPlan_Course
    TRUNCATE TABLE Graduation_Plan
    TRUNCATE TABLE Course_semester
    TRUNCATE TABLE Request
    TRUNCATE TABLE Exam_Student
    TRUNCATE TABLE MakeUp_Exam
    TRUNCATE TABLE Installment
    TRUNCATE TABLE Payment
    TRUNCATE TABLE Instructor
    TRUNCATE TABLE Course
    TRUNCATE TABLE Semester
    TRUNCATE TABLE Student_Phone
    TRUNCATE TABLE Student
    TRUNCATE TABLE Advisor

	ALTER TABLE GradPlan_Course
	ADD CONSTRAINT fk1 FOREIGN KEY(plan_id,semester_code) references Graduation_Plan ON UPDATE CASCADE ON DELETE CASCADE

	ALTER TABLE Exam_Student
	ADD CONSTRAINT fk2  FOREIGN KEY(exam_id) references MakeUp_Exam ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk22 FOREIGN KEY(student_id) references Student ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE Installment
	ADD CONSTRAINT fk3 FOREIGN KEY(payment_id) references Payment ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE Student
	ADD CONSTRAINT fk4 FOREIGN KEY(advisor_id) references Advisor ON DELETE SET NULL ON UPDATE CASCADE

	ALTER TABLE Student_Phone
	ADD CONSTRAINT fk5 FOREIGN KEY(student_id) references Student ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE PreqCourse_course
	ADD CONSTRAINT fk6 FOREIGN KEY(prerequisite_course_id) references Course,
		CONSTRAINT fk7 FOREIGN KEY(course_id) references Course

	ALTER TABLE Instructor_Course
	ADD CONSTRAINT fk8 FOREIGN KEY(course_id) references Course ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk9 FOREIGN KEY(instructor_id) references Instructor ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE Student_Instructor_Course_Take
	ADD CONSTRAINT fk10 FOREIGN KEY(student_id) references Student ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk11 FOREIGN KEY(course_id) references Course ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk12 FOREIGN KEY(instructor_id) references Instructor ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE Course_Semester
	ADD CONSTRAINT fk13 FOREIGN KEY(course_id) references Course ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk14 FOREIGN KEY(semester_code) references Semester ON DELETE CASCADE ON UPDATE CASCADE
	
	ALTER TABLE Slot
	ADD CONSTRAINT fk15 FOREIGN KEY(course_id) references Course ON DELETE SET NULL ON UPDATE CASCADE, 
		CONSTRAINT fk16 FOREIGN KEY(instructor_id) references Instructor ON UPDATE CASCADE ON DELETE SET NULL

	ALTER TABLE Graduation_Plan
	ADD CONSTRAINT fk17 FOREIGN KEY(advisor_id) references Advisor ON UPDATE CASCADE ON DELETE SET NULL,
		CONSTRAINT fk18 FOREIGN KEY(student_id) references Student

	ALTER TABLE Request
	ADD	CONSTRAINT fk19 FOREIGN KEY(student_id) references Student ON UPDATE CASCADE ON DELETE CASCADE,
		CONSTRAINT fk20 FOREIGN KEY(advisor_id) references Advisor,
		CONSTRAINT fk25 FOREIGN KEY(course_id) references Course ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE MakeUp_Exam
	ADD CONSTRAINT fk21 FOREIGN KEY(course_id) references Course ON DELETE CASCADE ON UPDATE CASCADE

	ALTER TABLE Payment
	ADD	CONSTRAINT fk23 FOREIGN KEY(student_id) references Student ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk24 FOREIGN KEY(semester_code) references Semester ON DELETE CASCADE ON UPDATE CASCADE
		
GO
---------------------------------------------------------------------------------------
--ALL VIEWS COLUMNS NAME
--2.2 (A)
CREATE View view_Students
	AS
	SELECT *
		FROM Student
		WHERE financial_status=1;

GO
--2.2 (B)
CREATE view view_Course_prerequisites
	AS
	SELECT c.*,pre.prerequisite_course_id,prec.name as 'Prerequisite course name '
		FROM Course c
			LEFT OUTER JOIN PreqCourse_course pre ON c.course_id = pre.course_id 
			LEFT OUTER JOIN Course prec ON pre.prerequisite_course_id=prec.course_id

GO
--2.2 (C)
CREATE view Instructors_AssignedCourses
	AS
	SELECT Ins.instructor_id,Ins.name as 'Instructor name',Ins.email,Ins.faculty,Ins.office,Cou.course_id,Cou.name AS 'Course name'
		FROM Instructor Ins
			LEFT JOIN Instructor_Course InsCou ON Ins.instructor_id = InsCou.instructor_id
			LEFT JOIN Course Cou ON InsCou.course_id = Cou.course_id
GO
--2.2 (D)
CREATE view Student_Payment
	AS 
	SELECT P.*,s.f_name,s.l_name
		FROM Payment P 
			INNER JOIN Student s ON P.student_id = s.student_id
GO

--2.2 (E)
CREATE view Courses_Slots_Instructor
	AS
	SELECT c.course_id as CourseID , c.name as 'Course name' , s.slot_id as 'Slot ID' , s.day as 'Slot Day' , 
            s.time as 'Slot Time', s.location as 'Slot Location' , I.name as 'Slot’s Instructor name'
		FROM Course c 
			LEFT OUTER JOIN Slot s ON c.course_id = s.course_id
			LEFT OUTER JOIN Instructor I ON I.instructor_id = s.instructor_id
GO

--2.2 (F)
CREATE VIEW Courses_MakeupExams
	AS
	SELECT c.name, c.semester, m.*
		FROM Course c LEFT OUTER JOIN MakeUp_Exam m ON c.course_id = m.course_id
GO

--2.2 (G)
CREATE VIEW Students_Courses_transcript
	AS
	SELECT s.student_id,s.f_name +' '+ s.l_name AS 'student name',c.course_id,c.name AS 'course name',r.exam_type,r.grade,r.semester_code,i.name AS 'instructor name'
		FROM Student s, Course c, Instructor i, Student_Instructor_Course_Take r
		WHERE s.student_id=r.student_id AND
			  c.course_id=r.course_id AND
			  i.instructor_id=r.instructor_id
GO

--2.2 (H)
CREATE VIEW Semster_offered_Courses
	AS
	SELECT c.course_id, c.name AS 'course_name', s.semester_code
		FROM Semester s 
		LEFT OUTER JOIN Course_Semester cs ON s.semester_code = cs.semester_code
		LEFT OUTER JOIN Course c ON cs.course_id = c.course_id
GO

--2.2 (I)		
CREATE VIEW Advisors_Graduation_Plan
	AS
	SELECT g.*, a.name AS 'advisor_name'
		FROM Graduation_Plan g , Advisor a
		WHERE g.advisor_id = a.advisor_id
GO
---------------------------------------------------------------------------------------
--2.3 (A) SHOULD WE CALL THE UPDATE FINANCIAL STATUS HERE?? / SHOULD WE CALCULATE AQH,ASH,GPA
CREATE PROC Procedures_StudentRegistration
	@first_name varchar(40), 
	@last_name varchar(40), 
	@password varchar(40), 
	@faculty varchar(40), 
	@email varchar(40), 
	@major varchar(40), 
	@Semester int,
	@StudentID int OUTPUT
	As
		INSERT INTO Student(f_name,l_name,faculty,email,major,password,semester)
		VALUES(@first_name,@last_name,@faculty,@email,@major,@password,@Semester)
		
		SELECT @StudentID = MAX(student_id)
		FROM Student
GO
--2.3(B) NO PROBLEMS HERE
CREATE PROCEDURE Procedures_AdvisorRegistration
	@advisor_name varchar(40),
	@password varchar(40),
	@email varchar(40),
	@office varchar(40),
	@advisor_id int	OUTPUT
	AS 
		INSERT INTO Advisor(name, email, office, password)
		VALUES(@advisor_name, @email, @office, @password)
		
		SELECT @advisor_id = MAX(advisor_id)
		FROM Advisor 

GO
--2.3(C) COLUMNS??
CREATE PROC Procedures_AdminListStudents
	As
		SELECT *
		FROM Student
GO

--2.3(D) COLUMNS
CREATE PROCEDURE Procedures_AdminListAdvisors
	AS 
		SELECT * 
		FROM Advisor
	-- does he want names? or all data
GO

-- 2.3(E) LIST ALL STUDENTS or Students w Advisors (in other words inner or outer)/COLUMNS
CREATE PROCEDURE AdminListStudentsWithAdvisors
	AS
		SELECT s.student_id,s.f_name +' '+s.l_name as 'Student Name',s.gpa,s.major,s.email as'Student Email',s.faculty,s.financial_status,s.semester,s.acquired_hours,s.assigned_hours,a.advisor_id,a.name AS 'Advisor name',a.email as 'Advisor Email',a.office
		FROM Student s LEFT OUTER JOIN Advisor a ON s.advisor_id = a.advisor_id

GO

--2.3(F) NO PROBLEM HERE
Create Procedure AdminAddingSemester
	@start_date date,
	@end_date date,
	@semester_code VARCHAR(40)
	AS
		Insert Into Semester
		VALUES(@semester_code,@start_date,@end_date)
GO

--2.3(G) NO PROBLEM HERE
CREATE PROCEDURE Procedures_AdminAddingCourse
	@major varchar(40),
	@semester int,
	@credit_hours int,
	@course_name varchar(40),
	@offered bit
	AS
		INSERT INTO Course(name, major, is_offered, credit_hours, semester)
		VALUES(@course_name, @major, @offered, @credit_hours, @semester)
GO

--2.3(H) NO PROBLEM HERE
CREATE PROC Procedures_AdminLinkInstructor
	@InstructorId int, 
	@courseId int, 
	@slotID int
	As	
		UPDATE Slot
		SET instructor_id = @InstructorId,
			course_id = @courseId
		WHERE slot_id = @slotID
GO

--2.3(I) NO PROBLEM HERE
CREATE PROCEDURE Procedures_AdminLinkStudent
	@instructor_id int,
	@student_id int,
	@course_id int,
	@semester_code varchar(40)
	AS
		INSERT INTO Student_Instructor_Course_Take(student_id, course_id, instructor_id, semester_code)
		VALUES(@student_id, @course_id, @instructor_id, @semester_code)
GO

--2.3(J) NO PROBLEM HERE
Create PROCEDURE Procedures_AdminLinkStudentToAdvisor
	@studentID int,
	@advisorId int
	AS
		Update Student 
		Set advisor_id = @advisorID
		WHERE student_id = @studentID
GO

--2.3(K) NO PROBLEM HERE
CREATE PROCEDURE Procedures_AdminAddExam
	@type varchar(40),
	@date datetime,
	@course_id int
	AS 
		INSERT INTO MakeUp_Exam(date, type, course_id)
		VALUES(@date,@type,@course_id)
GO

--2.3(L) NO PROBLEM HERE/ recheck the deadline insertion
CREATE PROC Procedures_AdminIssueInstallment
	@payment_ID int
	AS
		DECLARE @n int,
				@start_date date,
			    @amountperinstallment int

		SELECT @n=n_installments ,@amountperinstallment=amount/n_installments, @start_date=start_date
		FROM Payment
		WHERE payment_id=@payment_ID

		WHILE @n>0
			BEGIN
				INSERT INTO Installment(payment_id,amount,start_date,deadline)
				VALUES (@payment_ID,@amountperinstallment,@start_date,DATEADD(month, 1, @start_date))
				SET @start_date = DATEADD(month, 1, @start_date)
				SET @n = @n-1
			END
GO
--2.3(M) NO PROBLEM HERE
CREATE PROC Procedures_AdminDeleteCourse
	@courseID int
	AS
		DELETE FROM PreqCourse_course where course_id=@courseID OR prerequisite_course_id=@courseID

		UPDATE Slot
		SET course_id=NULL, 
			instructor_id=NULL
		WHERE course_id=@courseID

		DELETE FROM Course
		WHERE course_id=@courseID
GO

--2.3(N) HEYA MESH EL MAFROOD TOBAA 1 LAW EL TABLE NOT EXISTS?? W 0 OTHERWISE
CREATE PROC  Procedure_AdminUpdateStudentStatus
	@StudentID int
	AS
	UPDATE Student
	SET financial_status =
	CASE WHEN (
		NOT EXISTS (
					SELECT *
					FROM Installment i
					WHERE i.payment_id IN 
							(SELECT payment_id
							 FROM Payment
							 WHERE student_id=@StudentID AND CURRENT_TIMESTAMP > i.deadline AND i.status='notPaid')
				)) THEN 1 ELSE 0 END
				
	WHERE student_id=@StudentID
GO

--2.3(O) COLUMNS
CREATE VIEW all_Pending_Requests
	AS
		SELECT r.request_id,r.type,r.comment,r.status,r.credit_hours,r.course_id, s.f_name+' '+s.l_name AS Student_name,a.name as 'Advisor Name',s.student_id,a.advisor_id
		FROM Request r LEFT OUTER JOIN Student s ON r.student_id=s.student_id 
					   LEFT OUTER JOIN Advisor a ON r.advisor_id=a.advisor_id
		WHERE r.status='pending'

GO

--2.3(P) DIFFERENCE BETWEEN THIS AND (2.3-H) // SHOULD WE DELETE THE SLOT?? ANA FAKER EL TA ALET KEDA
CREATE PROC Procedures_AdminDeleteSlots
	@current_semester varchar(40)
	AS
		UPDATE Slot
		SET course_id=NULL,
			instructor_id=NULL
		WHERE course_id NOT IN (SELECT course_id
								FROM Course_Semester
								WHERE semester_code=@current_semester)
GO

--2.3(Q) NO PROBLEM HERE
CREATE FUNCTION FN_AdvisorLogin (@ID int, @password varchar(40))
	RETURNS BIT 
	AS
		BEGIN
			DECLARE @count int

			SELECT @count = count(*)
			FROM Advisor
			Where advisor_id = @ID and @password = password

			RETURN @count
		END
GO

--2.3(R) NO PROBLEM HERE
CREATE PROC Procedures_AdvisorCreateGP
	@Semester_code varchar(40),
	@expected_graduation_date date,
	@sem_credit_hours int,
	@advisor_id int,
	@student_id int
	AS
    IF EXISTS(SELECT * FROM Student WHERE student_id=@student_id AND acquired_hours>157)
        BEGIN
            INSERT INTO Graduation_Plan
            VALUES(@Semester_code,@sem_credit_hours,@expected_graduation_date,@advisor_id,@student_id)
        END
    ELSE
        BEGIN
            print('student has less than 157 acquired hours')
        END

GO
--2.3(S) NO PROBLEM HERE
CREATE PROC Procedures_AdvisorAddCourseGP
	@student_id int,
	@Semester_code varchar(40),
	@course_name varchar(40)
	AS
		DECLARE @plan_id INT,
			    @course_id INT

		SELECT @plan_id=plan_id
		FROM Graduation_Plan
		WHERE student_id=@student_id AND semester_code=@Semester_code
		
		SELECT @course_id=course_id
		FROM Course
		WHERE name=@course_name
		
		INSERT INTO GradPlan_Course
		VALUES(@plan_id,@Semester_code,@course_id)
GO

--2.3(T) NO PROBLEM HERE
CREATE PROC Procedures_AdvisorUpdateGP
	@expected_grad_date date,
	@studentID int
	AS 
		UPDATE Graduation_Plan
		SET expected_grad_date=@expected_grad_date
		WHERE student_id=@studentID
GO

--2.3(U) NO PROBLEM HERE
CREATE PROC Procedures_AdvisorDeleteFromGP
	@studentID int, 
	@semester_code varchar(40),
	@course_ID INT
	AS
		DECLARE @plan_id INT
		
		SELECT @plan_id=plan_id
		FROM Graduation_Plan
		WHERE student_id=@studentID AND semester_code=@semester_code

		DELETE FROM GradPlan_Course 
		WHERE (plan_id=@plan_id AND semester_code=@semester_code AND course_id=@course_ID)
GO

--2.3(V) COLUMNS
CREATE FUNCTION FN_Advisors_Requests(@advisorID int)
	RETURNS TABLE
	AS
		RETURN(
			SELECT *
			FROM Request r
			WHERE r.advisor_id = @advisorID
		)
GO

--Output: Table (Requests details related to this advisor)
-- thats why I wrote SELECT *


--2.3(W)
CREATE PROC Procedures_AdvisorApproveRejectCHRequest
	@RequestID int, 
	@Current_semester_code varchar(40)
	AS
	IF EXISTS (
		SELECT * FROM Request WHERE request_id=@RequestID AND type='credit_hours'
	)
	BEGIN
		DECLARE 
		@credit_hrs_req INT,
		@studentID INT,
		@gpa decimal(3,2),
		@assignedhrs INT,
		@tot_hours_curr_sem INT

		SELECT @credit_hrs_req=r.credit_hours, @studentID=r.student_id, @gpa=s.gpa,@assignedhrs=s.assigned_hours
		FROM Request r INNER JOIN student s ON r.student_id=s.student_id
		WHERE r.request_id=@RequestID

		SELECT @tot_hours_curr_sem= SUM(c.credit_hours)
		FROM Student_Instructor_Course_Take st INNER JOIN Course c ON st.course_id=c.course_id
		WHERE st.student_id=@studentID AND
		st.semester_code=@Current_semester_code
		--SOME TAS SAID that we should account for the credit hours taken by the students in the current semester and some said no and use the assigned hours only instead
		--ALL TAS agreed en both are correct
		IF (@gpa<=3.7 AND @credit_hrs_req<=3 AND (@assignedhrs+@credit_hrs_req+@tot_hours_curr_sem<=34))
			BEGIN 
				UPDATE Request
				SET status='accepted'
				WHERE request_id=@RequestID

				UPDATE Student
				SET assigned_hours=@assignedhrs+@credit_hrs_req
				WHERE student_id=@studentID

				DECLARE @extra_money INT,
				@payment_ID INT,
				@deadline DATETIME
				SET @extra_money =@credit_hrs_req*1000

				SELECT @payment_ID= p.payment_id,@deadline=MIN(i.deadline)
				FROM Payment p INNER JOIN Installment i on p.payment_id=i.payment_id
				WHERE p.student_id=@studentID AND p.semester_code=@Current_semester_code AND i.status='notPaid'
				AND i.deadline>CURRENT_TIMESTAMP
				GROUP BY p.payment_id

				UPDATE Payment
				SET amount=amount+@extra_money
				WHERE student_id=@studentID AND semester_code=@Current_semester_code

				UPDATE Installment
				SET amount=amount+@extra_money
				WHERE payment_id=@payment_ID AND deadline=@deadline

				
				
			END
		ELSE
			BEGIN
				UPDATE Request
					SET status='rejected'
					WHERE request_id=@RequestID
			END 
	END
	ELSE
	print('Request ID is invalid, you should enter request of type course')

GO
--2.3(X)
CREATE PROC Procedures_AdvisorViewAssignedStudents
	@AdvisorID int, 
	@major varchar(40)
	AS
	SELECT s.student_id,s.f_name+' '+s.l_name AS Student_Name,s.major,c.name AS course_name
	FROM  Student_Instructor_Course_Take r INNER JOIN Course c ON r.course_id=c.course_id
          RIGHT OUTER JOIN Student s ON s.student_id=r.student_id
	WHERE s.advisor_id=@AdvisorID AND 
		  s.major=@major 
GO
--2.3(Y)
CREATE PROC Procedures_AdvisorApproveRejectCourseRequest
	@RequestID int,
	@current_semester_code varchar(40)
	AS
	DECLARE @crs_id int,
	@not_taken_prereq int,
	@assigned_hours int,
	@crs_credit_hours int,
	@studentID int

	IF EXISTS (
		SELECT * FROM Request WHERE request_id=@RequestID AND type='course'
	)
	BEGIN
		SELECT @crs_credit_hours=c.credit_hours,@crs_id=r.course_id
		FROM Request r 
			INNER JOIN Course c ON r.course_id=c.course_id
			INNER JOIN  Course_Semester cs on cs.course_id=c.course_id --to check that the course is offered
		WHERE r.request_id=@RequestID AND cs.semester_code=@current_semester_code
		
		SELECT @assigned_hours=s.assigned_hours, @studentID=r.student_id
		FROM Student s INNER JOIN Request r ON r.student_id=s.student_id AND r.request_id=@RequestID

		SELECT @not_taken_prereq=count(pre.prerequisite_course_id)
		FROM PreqCourse_course pre
		WHERE pre.course_id=@crs_id AND NOT EXISTS (
			SELECT *
			FROM Student_Instructor_Course_Take
			WHERE student_id=@studentID AND 
				pre.prerequisite_course_id=course_id AND
				semester_code <> @current_semester_code 
				--AND grade is not NULL and grade <> 'FA' // to ensure that the student is not taking the prereq now. If he's taking the prereq course in this current semester then he can't take the requested course until finishing the prereq	
				)

		IF (@not_taken_prereq=0 AND @assigned_hours>=@crs_credit_hours)
			BEGIN
			UPDATE Request
			SET status='accepted'
			WHERE request_id=@RequestID

			UPDATE Student
			SET assigned_hours=@assigned_hours-@crs_credit_hours
			WHERE student_id=@studentID
			INSERT INTO Student_Instructor_Course_Take(student_id,course_id,semester_code)
			VALUES (@studentID,@crs_id,@current_semester_code);
			END
		ELSE
			BEGIN
			UPDATE Request
			SET status='rejected'
			WHERE request_id=@RequestID
			END
	END 
	ELSE
		print('Request ID is invalid, you should enter request of type course')

	
GO

--2.3(Z)
CREATE PROC Procedures_AdvisorViewPendingRequests
	@Advisor_ID int
	AS 
	SELECT request_id, type,comment,credit_hours,s.f_name,s.l_name,s.student_id,course_id ---student_id abayeno or no?
	FROM request r INNER Join student s on r.student_id = s.student_id
	WHERE  status='pending' AND s.advisor_id = @Advisor_ID
GO

--2.3(AA)
CREATE FUNCTION FN_StudentLogin (@StudentID int, @password varchar(40))
	RETURNS BIT AS

		BEGIN
			DECLARE @count int

			SELECT @count = count(*)
			FROM Student
			Where student_id = @StudentID and @password = password and financial_status = 1

			RETURN @count
		END
GO

--2.3(BB)
CREATE PROC Procedures_StudentaddMobile
	@StudentID int,
	@mobile_number varchar(40)
	AS
	INSERT INTO Student_Phone
	VALUES(@StudentID,@mobile_number)

GO

--2.3(CC)

CREATE FUNCTION FN_SemsterAvailableCourses
(@semester_code varchar(40))
RETURNS TABLE
AS 
RETURN
(
	SELECT c.course_id as 'CourseID', c.name as 'Course Name', c.credit_hours as 'Credit Hours'
	FROM Course c, Course_Semester r
	WHERE c.course_id = r.course_id AND r.semester_code = @semester_code
			-- AND c.is_offered = 1
)

GO

--2.3(DD)
CREATE PROC Procedures_StudentSendingCourseRequest
	@Student_ID int, 
	@course_ID int, 
	@type varchar (40),
	@comment varchar(40)
	AS
	DECLARE @advisor_id INT
	SELECT @advisor_id=advisor_id
	FROM Student 
	WHERE student_ID=@Student_ID
	INSERT INTO Request(type,comment,student_id,advisor_id,course_id)
	VALUES(@type,@comment,@Student_ID,@advisor_id,@course_ID)

GO

--2.3(EE)
CREATE PROC  Procedures_StudentSendingCHRequest
	@Student_ID int, 
	@credit_hours int, 
	@type varchar (40),
	@comment varchar (40)
	AS
	DECLARE @advisor_id INT
		SELECT @advisor_id=advisor_id
		FROM Student 
		WHERE student_ID=@Student_ID
		INSERT INTO Request(type,comment,student_id,advisor_id,credit_hours)
		VALUES(@type,@comment,@Student_ID,@advisor_id,@credit_hours)
GO

--2.3(FF)
CREATE FUNCTION FN_StudentViewGP(@student_ID INT)
RETURNS TABLE
AS
RETURN (
	SELECT s.student_id,s.f_name+' '+s.l_name AS 'Student name',gp.plan_id,c.course_id,c.name AS 'Course name',
	 gp.semester_code,gp.expected_grad_date,gp.semester_credit_hours,gp.advisor_id
    FROM Student s INNER JOIN Graduation_Plan gp ON gp.student_id = s.student_id
			INNER JOIN GradPlan_Course gpc ON gp.plan_id = gpc.plan_id AND gp.semester_code=gpc.semester_code
            INNER JOIN Course c ON gpc.course_id = c.course_id
    where gp.student_ID = @student_ID 
)
GO

--2.3(GG)
create FUNCTION FN_StudentUpcoming_installment(@StudentID int)
RETURNS DATETIME
AS
BEGIN
Declare @FIRST_DEADLINE_DATE DATETIME

SELECT @FIRST_DEADLINE_DATE = MIN(I.deadline) --first not paid, asdo beha a2rb deadline of installment wla awl intallment nzlt?
											  --momken installment tnzl b3d installment we deadline bt3ha ykon abl el ableha
FROM Payment p INNER JOIN Installment I on p.payment_id = I.payment_id
WHERE p.student_id = @StudentID and I.STATUS = 'notPaid'

return @FIRST_DEADLINE_DATE
END
GO

--2.3(HH)

Create Function FN_StudentViewSlot(@CourseID int, @InstructorID int)
Returns TABLE
AS
Return 
	(SELECT s.slot_id,s.location,s.time,s.day,c.name as 'Course name',i.name as 'Instructor name'
	FROM Instructor i INNER JOIN Slot s  on s.instructor_id = i.instructor_id
				Inner JOIN Course c on s.course_id = c.course_id
	WHERE s.course_id = @CourseID and s.instructor_id = @InstructorID)
GO


--2.3(II)
CREATE PROC Procedures_StudentRegisterFirstMakeup
	@StudentID int,
	@courseID int, 
	@studentCurrent_semester varchar(40)
	AS
	DECLARE 
	@grade varchar(40),
	@examID int,
	@taken BIT

	SELECT @grade=grade
	FROM Student_Instructor_Course_Take
	WHERE student_id=@StudentID AND course_id=@courseID AND exam_type='Normal'

	SELECT @examID=exam_id
	FROM MakeUp_Exam
	WHERE course_id=@courseID AND type='First_makeup'

	IF ( NOT EXISTS ( SELECT * 
					  FROM Student_Instructor_Course_Take
					  WHERE student_id=@StudentID AND course_id=@courseID AND exam_type LIKE '%makeup' 
					) AND 
		(@grade IS NULL or @grade in ('F','FF')) AND @examID is NOT NULL)
	BEGIN
		INSERT INTO Exam_Student
			VALUES(@examID,@studentID,@courseID)
		INSERT INTO Student_Instructor_Course_Take(student_id,course_id,semester_code,exam_type)
			VALUES(@StudentID,@courseID,@studentCurrent_semester,'First_makeup')
	END
GO
--2.3(JJ)	
create function FN_StudentCheckSMEligiability (@CourseID int, @StudentID int)
	RETURNS BIT
	AS
	BEGIN
	Declare 
	@count INT

    IF EXISTS(
                SELECT grade
                FROM Student_Instructor_Course_Take
                WHERE student_id=@StudentID AND course_id=@CourseID AND 
                (exam_type='First_makeup' OR exam_type='Normal') AND  --I'm selecting any record that shows that the student has passed this course
                grade NOT IN ('F','FF','FA') AND grade IS NOT NULL
                UNION
                SELECT grade
                FROM Student_Instructor_Course_Take
                WHERE student_id=@StudentID AND course_id=@courseID AND exam_type='Second_makeup'--I'm selecting any record that shows that the student has already registered for a second makeup before

            )
        OR NOT EXISTS(
                SELECT *
                FROM Student_Instructor_Course_Take
                WHERE student_id=@StudentID AND course_id=@courseID--checking if the student has never taken this course before
            )
    BEGIN
        RETURN 0;
    END


    IF EXISTS ( SELECT *
                FROM Course
                WHERE course_id=@CourseID AND semester % 2=0) --check that course is even
    BEGIN 
        SELECT @count = count(DISTINCT c.course_id)
        from Student_Instructor_Course_Take c
        WHERE (c.semester_code like ('S__') OR c.semester_code like ('S__R2')) AND c.student_id = @StudentID
		AND (c.grade in ('F','FF','FA') or c.grade is null) and not exists(SELECT *			
													FROM Student_Instructor_Course_Take s		
													WHERE c.course_id = s.course_id AND s.grade NOT IN ('F','FF','FA') and s.grade is not null
													AND  s.student_id=@StudentID )
    END

	ELSE 
	BEGIN
		SELECT @count = count(DISTINCT course_id)
        from Student_Instructor_Course_Take c
        WHERE (semester_code like ('W__') OR semester_code like ('S__R1')) AND student_id = @studentID 
		AND (grade in ('F','FF','FA') or grade is null) and not exists(SELECT *
													FROM Student_Instructor_Course_Take s
													WHERE c.course_id = s.course_id AND s.grade NOT IN ('F','FF','FA')  and s.grade is not null
													AND  s.student_id=@StudentID)
	END
	
	if @count>2
	BEGIN
		return 0
	END

	return 1
END
GO
--2.3(KK)
CREATE PROC Procedures_StudentRegisterSecondMakeup
	@StudentID int, 
	@courseID int, 
	@Student_Current_Semester Varchar(40) 
	AS
	DECLARE @elig_bit BIT,
	@examID INT

	SELECT @examID=exam_id
	FROM MakeUp_Exam
	WHERE course_id=@courseID AND type='Second_makeup'

	SET @elig_bit= dbo.FN_StudentCheckSMEligiability(@courseID,@StudentID)

	if (@elig_bit=1 and @examID is not null) 
	BEGIN
		INSERT INTO Exam_Student
			VALUES(@examID,@StudentID,@courseID)
		INSERT INTO Student_Instructor_Course_Take(student_id,course_id,semester_code,exam_type)
			VALUES(@StudentID,@courseID,@Student_Current_Semester,'Second_makeup')
	END

GO

--2.3(LL)
CREATE PROC Procedures_ViewRequiredCourses
@StudentID int, 
@Current_semester_code Varchar(40)
AS
	-- DECLARE @oddeven int;

	-- IF (@Current_semester_code like 'S__' or @Current_semester_code like 'S__R2')
	-- BEGIN
	-- 	SET @oddeven =0
	-- END
	-- ELSE
	-- BEGIN
	-- 	SET @oddeven=1
	-- END

	SELECT c.* --rename column
	FROM Course c INNER JOIN Student_Instructor_Course_Take s ON c.course_id=s.course_id AND s.student_id=@StudentID
				  INNER JOIN Course_Semester cs ON c.course_id=cs.course_id
	WHERE cs.semester_code=@Current_semester_code AND
	      (dbo.FN_StudentCheckSMEligiability(c.course_id,@StudentID) = 0) AND --and c.semester %2=@oddeven 
		  (s.grade in('F','FF','FA')) and not exists(SELECT *			
													FROM Student_Instructor_Course_Take s2		
													WHERE c.course_id = s2.course_id AND s2.grade NOT IN ('F','FF','FA') and s2.grade is not null
													AND  s2.student_id=@StudentID )

	UNION

	SELECT c.*
	FROM Course c , Student s, Course_Semester cs
	Where c.major = s.major and s.student_id = @StudentID and cs.course_id=c.course_id and cs.semester_code=@Current_semester_code and s.semester >c.semester  and not exists( SELECT *
																				FROM Student_Instructor_Course_Take se 
																				WHERE se.course_id = c.course_id AND se.student_id=@StudentID
																				) --and c.semester %2=@oddeven


GO
--2.3(MM)
CREATE PROC Procedures_ViewOptionalCourse
@StudentID int, 
@Currentsemestercode Varchar(40) --me7tagenha fe eh
AS
	SELECT c.*
	FROM Course c , Student s, Course_Semester cs
	where  c.major = s.major and s.student_id = @StudentID and cs.course_id=c.course_id and cs.semester_code=@Currentsemestercode and s.semester<=c.semester  and 
	NOT EXISTS( 
		SELECT *
		FROM Student_Instructor_Course_Take se 
		WHERE se.course_id = c.course_id AND se.student_id=@StudentID ) AND 
	NOT EXISTS(
		SELECT p.prerequisite_course_id
		FROM PreqCourse_course p
		WHERE c.course_id=p.course_id

		EXCEPT 

		SELECT sct.course_id
		FROM Student_Instructor_Course_Take sct
		WHERE sct.student_id=@StudentID --and sct.grade <>'FA' and sct.grade is not null //We are told not to check the grades of the prereq by the TAS
	)
	
GO

--2.3(NN)
--Add on this the courses that belong to the major that the student hasn't taken it yet
CREATE PROC Procedures_ViewMS 
@StudentID int
AS
	SELECT c.*
		FROM Course c , Student s
		where  c.major = s.major and s.student_id = @StudentID 
	EXCEPT
	(
	SELECT c.*
	FROM Student_Instructor_Course_Take st INNER JOIN Course c ON c.course_id=st.course_id
	WHERE student_id=@StudentID 
	)

GO

--2.3(OO)
CREATE PROC Procedures_ChooseInstructor
	@Student_ID int, 
	@Instructor_ID int,
	@Course_ID int,
	@semesterCode varchar(40)
	AS
	UPDATE Student_Instructor_Course_Take
	SET instructor_id=@Instructor_ID
	WHERE student_id=@Student_ID AND course_id=@Course_ID and semester_code=@semesterCode

GO
--Farahh
s