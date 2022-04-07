package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

// DAO�� DB���� �� �ݺ������� �ۼ��ϴ� �ڵ带 �ߺ� �ۼ����� �ʱ����� �ۼ��մϴ�.
public class UserDAO {
	// db ����
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql1111";

	ResultSet rs = null;
	
	public UserDAO() { // java ������
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
		System.out.println("����ֱ� �� : " + user);
		
		System.out.println("������� �� : " + user);
		user.setUserId(rs.getString(1));
		user.setUserPw(rs.getString(2));
		user.setUserName(rs.getString(3));
		user.setUserEmail(rs.getString(4));
		userList.add(user);// ��������Ʈ�� ������ ������ ���� �� �ִ� �ڽ�
		} System.out.println("����Ʈ�� ���� �ڷ� üũ :" + userList);
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