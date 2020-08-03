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

/*
 * 데이터 입력(INSERT INTO)
*/
INSERT INTO car (car_model, car_price, car_desc)
	VALUES ('sonata', 3000, 'not bad');
	
INSERT INTO car (car_desc, car_model, car_price)
	VALUES ('good', 'SM7', 3700);

INSERT INTO car (car_model, car_price)
	VALUES ('genesis', 6000);

INSERT INTO car (car_model, car_price, car_desc)
	VALUES ('avante', 2500, 'bad'), 
		   ('morning', 1800, 'great'),
		   ('k5', 3000, 'trash'),
		   ('malibu', 3100, 'cool');

/*
 * 데이터 읽기(Read) -> (SELECT) 
 */
SELECT * FROM car;

/*
 * 별칭 달기
 * 
 */
SELECT car_model, car_price FROM car;
SELECT car_model AS model, car_price AS price FROM car;

/*
*조건
*
*/
SELECT *
	FROM car
	WHERE car_price < 2000;
SELECT *
	FROM car
	WHERE car_price <> 3000;
SELECT *
	FROM car
	WHERE NOT car_price = 3000;

-- 가격이 2500 이상 5000 미만의 차 구하기
SELECT *
	FROM car
	WHERE NOT car_price >= 2500 AND car_price < 5000;

-- 3000이상 3700이하
SELECT *
	FROM car
	WHERE NOT car_price BETWEEN 3000 AND 3700;

	
-- 3000이거나 3700인 자동차
SELECT *
	FROM car
	WHERE NOT car_price OR car_price = 3700;
	
SELECT *
	FROM car
	WHERE car_price IN(3000, 3700);
	
SELECT car_name
	FROM car
	WHERE car_desc IS = NULL;
	
SELECT car_name
	FROM car
	WHERE car_desc IS NOT = NULL;
	
-- 정렬
SELECT *
	FROM car
	ORDER BY car_price ASC;

SELECT *
	FROM car
	ORDER BY car_price DESC;

	
SELECT *
	FROM car
	WHERE car_price >= 2500;
	ORDER BY car_price DESC, car_id DESC;
	LIMIT 3, 2;
	
-- wild card 글자갯수 상관없다. 'm%'
SELECT car_model
	FROM car 
	WHERE car_model LIKE '%m%';

-- 3글자중  m을 찾아라
-- 해당하는 열 기준으로 정렬하는 기준이 있다  (- 한글자).
-- 복수개 데이터가있을때 제일 빠르게 찾는 검색 : 이진검색
SELECT car_model
	FROM car
	WHERE car_model LIKE '_m_';


/*
 * 삭제(delete) -> DELETE FROM
 * 
 */

SELECT * FROM car WHERE car_model = 'k5';
DELETE FROM car WHERE car_model = 'k5';


/*
 *  수정(Update) -> UPDATE
 */
SELECT * FROM car WHERE car_id = 2;
SELECT car SET car_desc = 'very good', car_price = 3800 WHERE car_id = 2;
