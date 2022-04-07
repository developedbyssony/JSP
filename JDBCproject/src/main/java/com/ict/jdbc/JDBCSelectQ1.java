package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCSelectQ1 {

	public static void main(String[] args) {
		// Scanner를 이용해 user_id를 입력받은 다음
		// 방금 배운 SELECT문 실행 구문들을 응용해서
		// WHERE uid=입력받은 아이디 형식으로
		// 내가 조회한 아이디의 정보만
		// 콘솔에 찍히도록 로직을 작성해주세요.
		Scanner scan = new Scanner(System.in);
		System.out.println("조회할 아이디를 입력해주세요");
		String uid = scan.nextLine();
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 접속 타겟이 MySQL 8버전임을 명시
			// 커넥션 객체는 연결 여부를 확인합니다.
			// 입력 요소는 접속 주소, MySQL 계정명, MySQL 비밀번호 순으로 입력합니다. (목적지인 MySQL 서버 주소를 적습니다.)
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														 "root", // DB 접속 아이디 
														 "mysql1111"); // DB 비밀번호
			
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE user_id='" + uid + "'";
			System.out.println("실행 예정 구문 : " + sql);
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
			System.out.print(rs.getString(1));
			System.out.println("<--------------id");
			System.out.print(rs.getString(2));
			System.out.println("<--------------pw");
			System.out.print(rs.getString(3));
			System.out.println("<--------------name");
			System.out.print(rs.getString(4));
			System.out.println("<--------------email");
			} else {
				System.out.println(uid + "는 DB에 없는 아이디입니다.");
			}
			
	} catch(Exception e) {
		e.printStackTrace();
	}

	}
	}