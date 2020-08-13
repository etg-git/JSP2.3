package kr.ac.green.test;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.ac.green.dao.JoinInfoDao;

public class TestDao {
	private static JoinInfoDao dao;
	private Connection con;

	@BeforeClass
	public void setUpBeforeClass() throws Exception {
		dao = JoinInfoDao.getInstance();
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
	public void insertTest() {
	}
	@Test
	public void searchTest() {
	}
}
