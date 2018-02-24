package com.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public abstract class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String oldstring = "2011-01-18";
		LocalDateTime datetime = LocalDateTime.parse(oldstring, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		System.out.println(datetime);
	}

}
