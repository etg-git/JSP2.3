CREATE TABLE docs (
	d_num				INT(4) 				PRIMARY KEY			AUTO_INCREMENT,
	d_title				VARCHAR(40)			NOT NULL,
	d_content	TEXT		NOT NULL,
	d_author			VARCHAR(20)			NOT NULL,
	d_date				VARCHAR(30)			NOT NULL
);

DESC docs;