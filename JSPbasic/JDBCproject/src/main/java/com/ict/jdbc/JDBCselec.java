package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCselec {

	public static void main(String[] args) {
		// JDBC ����
		
		// MySQL�� ������ ������ �˸��� ���� forName ���ο� MySQL�� ���� ������ �����ϴ�.
		// SQL �����ڵ�� �ݵ�� try~catch�� ���ο� �ֵ��� �����˴ϴ�.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ���� Ÿ���� MySQL 8�������� ���
			// Ŀ�ؼ� ��ü�� ���� ���θ� Ȯ���մϴ�.
			// �Է� ��Ҵ� ���� �ּ�, MySQL ������, MySQL ��й�ȣ ������ �Է��մϴ�. (�������� MySQL ���� �ּҸ� �����ϴ�.)
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														 "root", // DB ���� ���̵� 
														 "mysql1111"); // DB ��й�ȣ
			
			// java���� MySQL�� ������ �������� �ۼ��մϴ�.
			Statement stmt = con.createStatement();
			// .executeQuery() ���ο� ������ �������� ���ڿ��� �ۼ��մϴ�.
			// SELECT���� ������ �� executeQuery()�� �����մϴ�.
			// SELECT���� ������ ��� �ڷ�� ResultSet �̶�� �ڷ�� ���� �� �ֽ��ϴ�.	
			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo");
			
			// ResultSet�� �⺻������ row ������ŭ ���ο� �����͸� �����մϴ�.
			// ResultSet�� Ư�� ��ȣ�� ��� ��ȸ�ϴ� ��캸�ٴ� ����������
			// ��� �����͸� ��ȸ�ϴ� ������ ���� ����մϴ�.
			// �� ó�� ResultSet�� -1���̶�� �ӽù�ȣ�� Ÿ������ ����ϴ�.
			// �� ��ȣ�� �ű�� ���� .next()�� ȣ���ϸ� ���� ��ȣ�� �Ѿ�ϴ�.
			
			// rs.next();�� ���� �ڷᰡ ���������� true, ������ false�� �����մϴ�.
			// rs.get�ڷ���(�ε�����ȣ(1����)), Ȥ�� rs.get�ڷ���("�÷���") �Է½�
			// �ش� �÷��� �ڷḦ ��ȯ�մϴ�.

			/*
			rs.next(); //col�� ��Ŀ���� �ϳ��� �Ű��ݴϴ�.
			System.out.println(rs.getString("user_id"));
			System.out.println(rs.getString(2));
			rs.next();
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			*/
			
			// while������ ó���Ϸ���, �Ʊ� �ô� ��ó�� rs.get �ڷ��� ������ �̿��� ��ȸ�ϴ� ������ ���ο� �ۼ��ϰ� �����غ�����.
			while(rs.next()) { 			// �� ���� ������ ��Ȯ�ϰ� �����ϴ� row ������ŭ�� ���� �ݺ���
				System.out.println(rs.getString(1)); //user_id
				System.out.println(rs.getString(2)); //user_pw
				System.out.println(rs.getString(3)); // user_name 
				System.out.println(rs.getString(4)); // mail
			}
	
	} catch(Exception e) {
		e.printStackTrace();
	}

}
}
