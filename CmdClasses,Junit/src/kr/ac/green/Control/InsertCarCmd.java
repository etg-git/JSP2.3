package kr.ac.green.Control;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.AdvancedCarDao;
import kr.ac.green.Car;
import kr.ac.green.cmd.ICmd;

public class InsertCarCmd implements ICmd{

	@Override
	public void action(HttpServletRequest request) {
		AdvancedCarDao dao = AdvancedCarDao.getDao();
		
		Connection con = dao.connect(); //�����λ���.
		
		Car car = new Car();
		car.setCar_model(request.getParameter("car_model"));
		car.setCar_price(Integer.parseInt(request.getParameter("car_price")));
		car.setCar_desc(request.getParameter("car_desc"));
		
		try {
			con.setAutoCommit(false); // autocommit�� ����.
			dao.insertCar(con, car);
			
			con.commit(); //������ db�� �ݿ��̵ȴ�.
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback(); //������ ����� �ѹ�, �����Ű�� �����·� ���ư���. �����ߴ��ϵ鵵 �ݿ������ʴ´�.
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		dao.disconnect(con);
		request.setAttribute("nextPage", request.getContextPath());
		request.setAttribute("isRedirect", true);
	}
	

}
