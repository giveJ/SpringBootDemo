package org.a.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	// log : 흔적. 데이터 잘 나오는지 찍어봄 
	// log.info : 콘솔창에 찍힘 . 순수정보 찍을 때
	
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE",
				"scott",
				"tiger"
				)) {
			
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
}
