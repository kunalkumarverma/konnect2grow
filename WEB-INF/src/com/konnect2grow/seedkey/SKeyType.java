package com.konnect2grow.seedkey;
import java.io.Serializable;


public class SKeyType implements Serializable {


//SKeyType(SrNo, stype , duration int, gtype);

	private String stype, gtype,status;
	
	private int duration, keyVal;
	
	public SKeyType(String stype, String gtype, int duration,int keyVal,String status){

		this.stype=stype;
		this.gtype=gtype;
		this.duration=duration;	
		this.status=status;
		this.keyVal=keyVal;	
	}
	
	public SKeyType(){
		
	}

	public void setDuration(int duration){
		this.duration=duration;

	}
	public int getDuration(){
		return duration;
	}
	
	public String getStype(){
		return stype;
	}
	public void setStype(String stype){
		this.stype=stype;

	}
	public String getGtype(){
		return gtype;
	}
	public void setGtype(String gtype){
		this.gtype=gtype;

	}

	
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status=status;

	}
	public void setKeyVal(int keyVal){
		this.keyVal=keyVal;

	}
	public int getKeyVal(){
		return keyVal;
	}


}