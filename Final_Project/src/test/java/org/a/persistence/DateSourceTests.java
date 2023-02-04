package org.a.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	//객체생성해서 가져오던거. 컨테이너로 잡을 경로. 빈 가져올 곳
@Log4j
public class DateSourceTests {
	
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	// DataSource : root context에 있음. connection pool을 관리하는 객체(root-context.xml) 가져다 쓸 것.
	// 원래라면 dataSource = new DataSource(); 자바에서 객체 생성하고 사용했었음. xml이용하기 위해 의존성 주입함
	// getBean과 같은 역할.
	
	
	@Test //test 용도로 사용하기 위해서는 반드시 붙혀주어야 함. 메소드 명 앞에도 test 붙혀주기
	public void testConnection() {
		try(Connection con = dataSource.getConnection()) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	
	// 쿼리 날리기 위해
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;
	
	
	@Test
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			log.info(session);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	

}
