package com.model;

import java.sql.ResultSet;

import com.database.DAO;

public class User {
	private int userId;
	private String username, email, password, mobile_number;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}


	public static boolean isUser(String username, String password) {
		boolean flag=false;
		String query = String.format("select * from user_details where user_email = '%s' and user_password = '%s'", username, password );
		System.out.println(query);
		DAO dao = new DAO();
		ResultSet res = dao.getData(query);
		try
		{
			if(res.next())
				flag=true;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return flag;
	}
	
	public int createUser()
	{
		String query = String.format("insert into user_details (user_name, user_email, user_password, user_mobile_number) values ('%s', '%s', '%s', '%s')", username, email, password, mobile_number);
		System.out.println(query);
		DAO dao = new DAO();
		int res = dao.putData(query);
		return res;
	}
	
	public static User getDetails(String email) {
		String query = String.format("select * from user_details where user_email = '%s'", email);
		System.out.println(query);
		DAO dao = new DAO();
		User user = null;
		ResultSet res = dao.getData(query);
		try{
			if(res.next())
			{
				user = new User();
				user.setUserId(res.getInt("user_id"));
				user.setUsername(res.getString("user_name"));
				user.setEmail(res.getString("user_email"));
				user.setPassword(res.getString("user_password"));
				user.setMobile_number(res.getString("user_mobile_number"));
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return user;
	}
	
	
	public ResultSet getAllUsersDetails() {
		String query = "select * from user_details";
		System.out.println(query);
		DAO dao = new DAO();
		ResultSet res = dao.getData(query);
		return res;
	}
}
