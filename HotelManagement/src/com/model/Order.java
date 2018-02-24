package com.model;

import java.sql.ResultSet;

import com.database.DAO;

public class Order {
	private  int orderId, userId, foodId, foodQuantity;
	private double foodPrice, totalPrice;
	
	int getOrderId() {
		return orderId;
	}
	void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	int getUserId() {
		return userId;
	}
	void setUserId(int userId) {
		this.userId = userId;
	}
	int getFoodId() {
		return foodId;
	}
	void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	int getFoodQuantity() {
		return foodQuantity;
	}
	void setFoodQuantity(int foodQuantity) {
		this.foodQuantity = foodQuantity;
	}
	double getFoodPrice() {
		return foodPrice;
	}
	void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}
	double getTotalPrice() {
		return totalPrice;
	}
	void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	DAO dao = new DAO();
	
	public int placeOrder(int userId, int foodId, double foodPrice, int foodQuantity) {
		String query = String.format("insert into order_table (user_id, food_id, food_price, food_quantity, total_price) values ('%d', '%d', '%f', '%d', '%f')",userId, foodId, foodPrice, foodQuantity, (foodPrice * foodQuantity));
		System.out.println(query);
		int res = dao.putData(query);
		if(res==1) 
			return 1;
		else 
			return 0;
	}
	
	public ResultSet getAllOrders() {
		String query = "select * from order_table order by ordered_time desc";
		System.out.println(query);
		ResultSet res = dao.getData(query);
		return res;
	}
	
	public ResultSet getOrdersById(String userId) {
		String query = String.format("", userId);
		return null;
	}
}
