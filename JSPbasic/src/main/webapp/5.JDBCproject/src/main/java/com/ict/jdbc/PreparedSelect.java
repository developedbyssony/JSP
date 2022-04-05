package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class PreparedSelect {

	public static void main(String[] args) {
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql1111";
		
		Scanner scan = new Scanner(System.in);
		System.out.println("조회할 아이디를 입력해주세요");
		String uid = scan.nextLine();
		
		
		try {
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw);
			String sql = "SELECT * FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,uid);
			ResultSet rs = pstmt.executeQuery();
			
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
		} finally {
			scan.close();
		}
	}

}
