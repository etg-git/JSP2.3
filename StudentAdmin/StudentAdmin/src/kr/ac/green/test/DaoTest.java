package kr.ac.green.test;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import org.junit.Assert;

import kr.ac.green.dao.Student;
import kr.ac.green.dao.StudentDao;

public class DaoTest {
	
	private static StudentDao dao;
	private Connection con;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = StudentDao.getInstance();
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
	public void searchTest() {
		Assert.assertEquals(1, dao.getSearch(con, 2));
	}
	
	@Test
	public void insertTest() {
		Assert.assertEquals(1, dao.insert(con, new Student(0, "¾öÅÂ±Õ", "0101010", 1, 2)));
	}
	@Test
	public void deleteTest() {
		Assert.assertEquals(1, dao.delete(con, "std_id", 1));
	}
	
}
