package com.ict.domain;

public class UserVO {
	// VOŬ������ �Ϲ������� Ư�� ���̺��� �ڷḦ �� row������ �����Ҽ��ֵ���
	// �÷������� ������ �����Ѱ��Դϴ�.
	// �� �÷��� �����ϴ� ������ �������ݴϴ�.
	private String userId;
	private String userPw;
	private String userName;
	private String UserEmail;
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
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String UserEmail) {
		this.UserEmail = UserEmail;
	}
}
