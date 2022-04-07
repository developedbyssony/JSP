package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class PrepareDelete {

	public static void main(String[] args) {
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql1111";
		
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요");
		String uid = scan.nextLine();

		try {
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(connectUrl,connectId,connectPw);
			String sql = "DELETE FROM userinfo WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1,uid);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}

	}

