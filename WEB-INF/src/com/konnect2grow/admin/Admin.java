package com.konnect2grow.admin;
import java.io.Serializable;


public class Admin implements Serializable {


	private String userid, password;
	
	
	
	public Admin(){
		
	}
	

	public void setUserid(String userid){
		this.userid=userid;

	}
	public String getUserid(){
		return userid;
	}
	
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;

	}
	
	

}