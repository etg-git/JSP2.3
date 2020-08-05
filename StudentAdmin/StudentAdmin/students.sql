CREATE TABLE student (
	std_id		INT			PRIMARY KEY		AUTO_INCREMENT,
	std_name	CHAR(20)	NOT NULL,
	std_tel		CHAR(20)	NOT NULL,
	std_grade	INT			NOT NULL,
	std_class	INT			NOT NULL
);

DESC student;

SELECT * FROM student WHERE std_tel LIKE concat('%', 010, '%') ORDER BY std_id DESC;