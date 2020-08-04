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

-- car ���̺��� ���ڵ� ���� ������´�.
SELECT count(*) FROM car;