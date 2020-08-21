package com.project.study;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations= "classpath:app-context.xml")
public class MysqlConnectionTest {
	
	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() throws Exception{
		try(Connection con = ds.getConnection()){
			System.out.println("Connection : " +con);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
