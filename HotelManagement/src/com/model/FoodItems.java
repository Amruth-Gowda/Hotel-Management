package com.model;

import java.sql.ResultSet;

import com.database.DAO;

public class FoodItems {
	private int foodId;
	private String foodName, foodType;
	private double foodPrice;
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(double foodPrice) {
		this.foodPrice = foodPrice;
	}

	public int createFoodItem()
	{
		String query = String.format("insert into food_items (food_name, food_price, food_type) values ('%s', '%f', '%s' )",foodName, foodPrice, foodType);
		System.out.println(query);
		DAO dao = new DAO();
		int res = dao.putData(query);
		return res;
	}

	public ResultSet getAllFoodItems() {
		String query = "select * from food_items";
		System.out.println(query);
		DAO dao = new DAO();
		ResultSet res = dao.getData(query);
		return res;
	}
}
