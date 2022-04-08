package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserVO {
	// VO클래스는 일반적으로 특정 테이블의 자료를 한 row단위로 저장할수있도록
	// 컬럼정보를 변수로 나열한것입니다.
	// 각 컬럼에 대응하는 변수를 선언해줍니다.
	private String userId;
	private String userPw;
	private String userName;
	private String email;
	
	// getter/setter를 생성해주세요.
	// 우클릭 -> Source -> generate getters and setters -> 모든 변수 체크 -> generate
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	// toString도 생성해주면, System.out.println()과 같은 조회구문에서
	// 자료 주소값 대신 실제로 들어있는 데이터를 화면에 보여줍니다.
	// 우클릭 -> source -> generateToString() 실행 -> 모든변수 선택후 생성
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", email=" + email + "]";
	}
	
	// DB접속시 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	private String connectId = "root";
	private String connectPw = "mysql";
	
	public UserVO getUserInfo(String userId) {
		// try 블럭 진입 전에 .close()로 닫는 요소들을
		// 모두 선언해주도록 코드를 고칩니다.
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		// 유저정보를 저장할 수 있는 변수를 생성합니다.
		UserVO user = new UserVO();
		try {
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			// 3. 해당 아이디의 정보만 ResultSet에 받아와서
			// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
			String sql = "SELECT * FROM userinfo WHERE user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			//?를 채워주세요.
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			// rs내부 데이터를 user변수에 옮겨넣어주세요(setter 사용)
			System.out.println("데이터 입력 전 : " + user);
			if(rs.next()) {
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
			}
			System.out.println("데이터 입력 후 : " + user);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				con.close();
				rs.close();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}// getUserInfo() 끝나는 지점
}
