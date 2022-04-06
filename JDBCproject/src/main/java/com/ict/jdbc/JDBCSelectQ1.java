package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCSelectQ1 {

	public static void main(String[] args) {
		// Scanner�� �̿��� user_id�� �Է¹��� ����
		// ��� ��� SELECT�� ���� �������� �����ؼ�
		// WHERE uid=�Է¹��� ���̵� ��������
		// ���� ��ȸ�� ���̵��� ������
		// �ֿܼ� �������� ������ �ۼ����ּ���.
		Scanner scan = new Scanner(System.in);
		System.out.println("��ȸ�� ���̵� �Է����ּ���");
		String uid = scan.nextLine();
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ���� Ÿ���� MySQL 8�������� ���
			// Ŀ�ؼ� ��ü�� ���� ���θ� Ȯ���մϴ�.
			// �Է� ��Ҵ� ���� �ּ�, MySQL ������, MySQL ��й�ȣ ������ �Է��մϴ�. (�������� MySQL ���� �ּҸ� �����ϴ�.)
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														 "root", // DB ���� ���̵� 
														 "mysql1111"); // DB ��й�ȣ
			
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM userinfo WHERE user_id='" + uid + "'";
			System.out.println("���� ���� ���� : " + sql);
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
				System.out.println(uid + "�� DB�� ���� ���̵��Դϴ�.");
			}
			
	} catch(Exception e) {
		e.printStackTrace();
	}

	}
	}