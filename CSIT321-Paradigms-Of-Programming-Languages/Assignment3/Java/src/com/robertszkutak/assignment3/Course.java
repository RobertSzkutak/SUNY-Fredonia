package com.robertszkutak.assignment3;

public class Course {
	
	private int number;//What course is it?
	private boolean taken = false;//Has the course been taken yet?
	
	public void setNumber(int crn){
		this.number = crn;	
	}
	
	public void setTaken(boolean taken){
		this.taken = taken;
	}
	
	public int getNumber(){
		return number;
	}
	
	public boolean getTaken(){
		return taken;
	}

}
