package kr.ac.green.test;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import org.junit.Assert;
import kr.ac.green.AdvancedCarDao;

public class TestDao {
	private static AdvancedCarDao dao;
	private Connection con;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = AdvancedCarDao.getDao();
	}

	@Before
	public void setUp() throws Exception {
		con = dao.connect();
	}

	@After
	public void tearDown() throws Exception {
		dao.disconnect(con);
	}

	@Test
	public void test() {
		Assert.assertEquals(4, dao.getAll(con).length); //기대하는값, 실제값
	}
	
	@Test
	public void testClear() {
		Assert.assertEquals(dao.getAll(con).length, dao.clear(con)); //기대하는값, 실제값
	}

}
