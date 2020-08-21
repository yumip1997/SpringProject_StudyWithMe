package com.project.study;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations= "classpath:app-context.xml")
public class MyBatisTest {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		System.out.println("sqlFactory : " + sqlFactory);
	}
	
	@Test
	public void testSession() throws Exception {
		try(SqlSession session = sqlFactory.openSession()){
			System.out.println("session : "+ session);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
