package com.konnect2grow.seedkey;
import java.io.Serializable;


public class SeedKey implements Serializable {


//(SrNo, skey, Stype, Generation, lifecycle )

	private String skey, skeytype, lifecycle;
	
	private String dog, seederid;
	private int srno;

	private int remainhelp;
	private String seeddate, assigndate,paiddate, generation;
	
	
	
	public SeedKey(String skey, String seederid,String skeytype, String lifecycle){

		this.seederid=seederid;
		this.skeytype=skeytype;
		this.lifecycle=lifecycle;
				
		this.skey=skey;
	}
	
	public SeedKey(){
		
	}


	public void setSkey(String skey){
		this.skey=skey;

	}
	public String getSkey(){
		return skey;
	}

	public void setSeederid(String seederid){
		this.seederid=seederid;

	}
	public String getSeederid(){
		return seederid;
	}
	
	public String getSkeytype(){
		return skeytype;
	}
	public void setSkeytype(String skeytype){
		this.skeytype=skeytype;

	}
	public void setLifecycle(String lifecycle){
		this.lifecycle=lifecycle;

	}
	public String getLifecycle(){
		return lifecycle;
	}	
	public void setSrno(int srno){
		this.srno=srno;

	}
	public int getSrno(){
		return srno;
	}	
	public void setDog(String dog){
		this.dog=dog;

	}
	public String getDog(){
		return dog;
	}	

	public void setSeeddate(String seeddate){
		this.seeddate=seeddate;

	}
	public String getSeeddate(){
		return seeddate;
	}	
		
	public void setAssigndate(String assigndate){
		this.assigndate=assigndate;

	}
	public String getAssigndate(){
		return assigndate;
	}
	public void setPaiddate(String paiddate){
		this.paiddate=paiddate;

	}
	public String getPaiddate(){
		return paiddate;
	}	
		
	public void setRemainhelp(int remainhelp){
		this.remainhelp=remainhelp;

	}
	public int getRemainhelp(){
		return remainhelp;
	}	
	public void setGeneration(String generation){
		this.generation=generation;

	}
	public String getGeneration(){
		return generation;
	}	
	

}