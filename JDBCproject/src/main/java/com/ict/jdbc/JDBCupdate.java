package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCupdate {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in); 
		System.out.println("������ ���̵� �Է����ּ���");
		String uid = scan.nextLine();
		System.out.println("������ ��� �Է����ּ���");
		String upw = scan.nextLine();
		System.out.println("������ �̸� �Է����ּ���");
		String uname = scan.nextLine();
		System.out.println("������ �̸��� �Է����ּ���");
		String email = scan.nextLine();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ���� Ÿ���� MySQL 8�������� ���
			// Ŀ�ؼ� ��ü�� ���� ���θ� Ȯ���մϴ�.
			// �Է� ��Ҵ� ���� �ּ�, MySQL ������, MySQL ��й�ȣ ������ �Է��մϴ�. (�������� MySQL ���� �ּҸ� �����ϴ�.)
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														 "root", // DB ���� ���̵� 
														 "mysql1111"); // DB ��й�ȣ
			
			Statement stmt = con.createStatement();
			String sql = "UPDATE userinfo SET user_pw = '" + upw + "', user_name = '" + uname + "', email = '" + email + "' WHERE user_id = '" + uid + "'";
			
			System.out.println("���� ���� ���� : " + sql);
			stmt.executeUpdate(sql); // select���� ������ ������(insert, delete������ resultSet�� �º��� ���� �ʾƵ� �ȴ�.)
		
			
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		scan.close();
	}
	}
	}