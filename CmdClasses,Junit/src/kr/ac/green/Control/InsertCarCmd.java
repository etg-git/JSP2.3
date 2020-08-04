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
		
		Connection con = dao.connect(); //밖으로뺀다.
		
		Car car = new Car();
		car.setCar_model(request.getParameter("car_model"));
		car.setCar_price(Integer.parseInt(request.getParameter("car_price")));
		car.setCar_desc(request.getParameter("car_desc"));
		
		try {
			con.setAutoCommit(false); // autocommit을 끈다.
			dao.insertCar(con, car);
			
			con.commit(); //실제로 db에 반영이된다.
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback(); //오류가 생기면 롤백, 실행시키기 전상태로 돌아간다. 성공했던일들도 반영하지않는다.
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		dao.disconnect(con);
		request.setAttribute("nextPage", request.getContextPath());
		request.setAttribute("isRedirect", true);
	}
	

}
