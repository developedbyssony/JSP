package com.ict.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// DAO클래스는 DB연동시 반복적으로 작성하는 코드를 중복 작성하지 않기 위해 작성합니다.
public class UserDAO {
	// DB접속시 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	private String connectId = "root";
	private String connectPw = "mysql1111";
	
	// 생성자를 이용해 생성할 때 자동으로 Class.forName()을 세팅하게 만들어줍니다.
	// 어떤 쿼리문을 실행하더라도 위의 DB 접속 변수와 DB 종류 지정은 무조건 하기에 생성자로 생성합니다.
	public UserDAO() {
		try {
			Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
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
			// ?를 채워주세요.
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			System.out.println("데이터 입력 전 : " + user);

			// rs내부 데이터를 user변수에 옮겨넣어주세요(setter 사용)
			if(rs.next()) { // true면 if문 실행, false면 실행하지 않음
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
	
	// getAllUserList.jsp의 핵심 로직을 DAO로 옮겨서 작성해보겠습니다.
	// getAllUserList는 전체 유저목록을 출력해주고 있기 때문에
	// userinfo테이블의 row 여러개를 받아올 수 있어야 합니다.
	// 그래서 리턴 자료형으로 List<UserVO> 를 리턴해야 합니다.
	// UserVO가 row 한 개를 저장할 수 있으므로 UserVO를 여러개 연달아 저장하는 자료가 필요합니다.
	public List<UserVO> getAllUserList(){ 
		// uservo한개는 유저 1명의 정보 (row 한줄짜리) => 전체 유저는 row 1개 이상이므로 리스트
		// .jsp에서 로드할때는 페이지가 옮겨가면 어차피 다 삭제되었기 때문에 .close()를
		// 해 줘도 안 해줘도 큰 상관이 없었습니다.
		// 그러나 DAO에서는 회수를 안 해주면 힙에 데이터가 계속 쌓여 시스템에 부하가 생깁니다.
		// 그래서 꼬박꼬박 접속이 끝나면 .close()를 해 줘야 합니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;//ResultSet은 실행쿼리문이 SELECT 구문인 경우 결과값을 받기 위해 필요합니다.
		// 결과로 DB에서 꺼내올 user들의 목록도 미리 선언해둡니다.
		
		List<UserVO> userList = new ArrayList<>(); 
		// 자바쪽 자료로 다시 바꿔줌
		
		// 필요한 모든 변수가 선언되었다면 try블럭을 선언합니다.
		// try 블럭이 닫히는 순간 try 내부의 코드가 삭제되므로 
		// 바깥쪽에서 빈 박스를 만들어주고 진입해야 합니다.
		try {
			// getAllUserList.jsp를 참조해 아래 로직을 작성완료해주세요.
			// Connection 생성
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			// 쿼리문 저장
			String sql = "SELECT * FROM userinfo";
			// PreparedStatement에 쿼리문 입력
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 유저 한 명의 정보를 담을 수 있는 VO 생성
				UserVO user = new UserVO();
				// 디버깅으로 비어있는것 확인
				System.out.println("집어넣기 전 : " + user);
				// setter로 다 집어넣기
				user.setUserId(rs.getString(1));
				user.setUserPw(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setEmail(rs.getString(4));
				// 다 집어넣은 후 디버깅
				System.out.println("집어넣은 후 : " + user);
				// userList에 쌓기
				userList.add(user);
			}
			System.out.println("리스트에 쌓인 자료 체크 : " + userList); // 리스트에 쌓인 자료 체크
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { //열어두면 나중에 메모리가 모자라지니, 자원 회수
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return userList; // List<UserVO> userList의 우변에다가 치킨배달하듯이 가져다놔주기!
	}
	
	// 유저 탈퇴기능을 DAO로 옮겨서 만들겠습니다.
	// 유저 탈퇴 시 입력받는 자료가 user_id이고
	// DELETE 구문은 결과자료가 없습니다. 따라서 리턴 자료형을 맞게 적어주면 됩니다.
	public void userDelete(String userId) { // 리턴 자료형 없으면 Public void
		// Connection, PreparedStatement생성해주신 다음 try~catch쪽에서 처리해주세요.
		Connection con = null;
		PreparedStatement pstmt = null;
		
		UserVO user = new UserVO();
		
		try {
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sql = "DELETE FROM userinfo WHERE user_id = ?";		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void userJoinCheck(String userId, String userPw, String userName, String userEmail) { // 리턴 자료형 없으면 Public void
		// Connection, PreparedStatement생성해주신 다음 try~catch쪽에서 처리해주세요.
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// UserVO user = new UserVO();
		
		try {
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sql = "INSERT INTO userinfo VALUES (?,?,?,?)";		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void userUpdateCheck(String userId, String userPw, String userName, String userEmail) { // 리턴 자료형 없으면 Public void
		Connection con = null;
		PreparedStatement pstmt = null;
				
		try {
			con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(4, userId);
			pstmt.setString(1, userPw);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
