package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCInsert {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요.");
		String uid = scan.nextLine();
		System.out.println("비밀번호를 입력해주세요.");
		String upw = scan.nextLine();
		System.out.println("이름을 입력해주세요.");
		String uname = scan.nextLine();
		System.out.println("이메일을 입력해주세요.");
		String email = scan.nextLine();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 접속 타겟이 MySQL 8버전임을 명시
			// 커넥션 객체는 연결 여부를 확인합니다.
			// 입력 요소는 접속 주소, MySQL 계정명, MySQL 비밀번호 순으로 입력합니다. (목적지인 MySQL 서버 주소를 적습니다.)
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														 "root", // DB 접속 아이디 
														 "mysql1111"); // DB 비밀번호
			
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO userinfo VALUES ('" + uid + "','" + upw + "','" + uname + "','" + email + "')";
			System.out.println("실행 예정 구문 : " + sql);
			stmt.executeUpdate(sql);
		
			
	} catch(Exception e) {
		e.printStackTrace();
	}
	}

}
