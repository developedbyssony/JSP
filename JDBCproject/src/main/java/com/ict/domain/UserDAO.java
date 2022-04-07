package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

// DAO는 DB연동 시 반복적으로 작성하는 코드를 중복 작성하지 않기위해 작성합니다.
public class UserDAO {
	// db 연동
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";

	ResultSet rs = null;
	
	public UserDAO() { // java 생성자
		try {
		Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<UserVO> getAllUserList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<UserVO> userList = new ArrayList<>();
		
		try {
		Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw); 
		String sql = "SELECT * FROM userinfo";
		PreparedStatement pstmt = con.prepareStatement(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	while(rs.next()) {
		UserVO user = new UserVO();
		System.out.println("집어넣기 전 : " + user);
		
		System.out.println("집어넣은 후 : " + user);
		user.setUserId(rs.getString(1));
		user.setUserPw(rs.getString(2));
		user.setUserName(rs.getString(3));
		user.setUserEmail(rs.getString(4));
		userList.add(user);// 유저리스트는 유저를 여러개 담을 수 있는 박스
		} System.out.println("리스트에 쌓인 자료 체크 :" + userList);
	} catch(Exception e) {
	e.printStackTrace();
	} finally {
		try {
			con.close();
			pstmt.close();
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	return userList;
	}