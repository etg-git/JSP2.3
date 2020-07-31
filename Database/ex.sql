/*
	���̺� ����
*/
/*
	char -> ���̰� �����̴� -> ������ ����ϰ� �Ͼ���� �϶� char�� �����ϴ�.
	varchar -> �������� , abc -> abcd�� ������ �������� shift�� �Ѵ�. �߰��� ������ �ϴ� ���϶� varchar�� �����ϴ�.
 */

/*
 * ���̺� ����
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
 * ������ �Է�(INSERT INTO)
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
 * ������ �б�(Read) -> (SELECT) 
 */
SELECT * FROM car;

/*
 * ��Ī �ޱ�
 * 
 */
SELECT car_model, car_price FROM car;
SELECT car_model AS model, car_price AS price FROM car;

/*
*����
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

-- ������ 2500 �̻� 5000 �̸��� �� ���ϱ�
SELECT *
	FROM car
	WHERE NOT car_price >= 2500 AND car_price < 5000;

-- 3000�̻� 3700����
SELECT *
	FROM car
	WHERE NOT car_price BETWEEN 3000 AND 3700;

	
-- 3000�̰ų� 3700�� �ڵ���
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
	
-- ����
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
	
-- wild card ���ڰ��� �������. 'm%'
SELECT car_model
	FROM car 
	WHERE car_model LIKE '%m%';

-- 3������  m�� ã�ƶ�
-- �ش��ϴ� �� �������� �����ϴ� ������ �ִ�  (- �ѱ���).
-- ������ �����Ͱ������� ���� ������ ã�� �˻� : �����˻�
SELECT car_model
	FROM car
	WHERE car_model LIKE '_m_';


/*
 * ����(delete) -> DELETE FROM
 * 
 */

SELECT * FROM car WHERE car_model = 'k5';
DELETE FROM car WHERE car_model = 'k5';


/*
 *  ����(Update) -> UPDATE
 */
SELECT * FROM car WHERE car_id = 2;
SELECT car SET car_desc = 'very good', car_price = 3800 WHERE car_id = 2;
