package com.model;

import java.sql.ResultSet;

import com.database.DAO;

public class Room {
	private int roomId;
	private String fromDate, toDate;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	} 
	
	DAO dao = new DAO();
	
	public ResultSet getRoomsList() {
		String query = "select * from rooms where room_status = 'unbooked'";
		System.out.println(query);
		ResultSet res = dao.getData(query);
		return res;
	}
	
	public int reserveRoom(int userId) {
		String query = String.format("insert into room_booking (room_id, user_id, from_date, to_date) values ('%d', '%d', '%s', '%s')", roomId, userId, fromDate, toDate); 
		System.out.println(query);
		int res1 = dao.putData(query);
		String query2 = "UPDATE rooms SET  room_status = 'booked' WHERE room_id ='"+roomId+"'";
		System.out.println(query2);
		int res2 = dao.putData(query2);
		String query3 = "UPDATE room_booking SET total_days=(to_date - from_date) WHERE room_id = '"+roomId+"'";
		System.out.println(query3);
		int res3 = dao.putData(query3);
		if(res1==1) {
			return 1;
		}
		else {
			return 0;
		}
	}
	
	public ResultSet viewBookings() {
		String query = "select * from room_booking";
		System.out.println(query);
		ResultSet res = dao.getData(query);
		return res;
	}
}
