/*
	테이블 생성
*/
/*
	char -> 길이가 고정이다 -> 수정이 빈번하게 일어나는일 일때 char가 유리하다.
	varchar -> 가변길이 , abc -> abcd를 넣으면 왼쪽으로 shift를 한다. 추가와 삭제를 하는 일일때 varchar가 유리하다.
 */

/*
 * 테이블 삭제
 */
DROP TABLE car;

CREATE TABLE car (
	car_id		INT 			PRIMARY KEY 		AUTO_INCREMENT,
	car_model 	CHAR(20) 		NOT NULL,
	car_price 	INT				NOT NULL,
	car_desc	VARCHAR(200)
);

DESC car;

-- car 테이블에서 레코드 수를 가지고온다.
SELECT count(*) FROM car;