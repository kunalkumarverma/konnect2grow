package com.konnect2grow.seeder;
import java.io.Serializable;


public class Seeder implements Serializable {


	private String seederid, password;
	private String name, mobile, email,dob, whatsapp;
	private String gender, address1, address2, district, state, pincode, phonepe, gpayid, upiid, refseeder, status;
	private String doj;
	private String skey;
	private int level,bonus;
	
	public Seeder(String name,String mobile, String whatsapp,String email,String dob,String gender,String address1,String address2,String district,String state,String pincode,String phonepe,String gpayid, String upiid,String refseeder,String skey){

		this.name=name;
		this.mobile=mobile;
		this.whatsapp=whatsapp;
		this.email=email;
		this.dob=dob;
		this.gender=gender;
		this.address1=address1;
		this.address2=address2;
		this.district=district;
		this.state=state;
		this.pincode=pincode;
		this.phonepe=phonepe;
		this.gpayid=gpayid;
		this.upiid=upiid;
		this.refseeder=refseeder;
		//this.status=status;
		this.skey=skey;
		
	}
	
	public Seeder(){
	

	
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
	
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;

	}
	public void setName(String name){
		this.name=name;

	}
	public String getName(){
		return name;
	}	
	public void setMobile(String mobile){
		this.mobile=mobile;

	}
	public String getMobile(){
		return mobile;
	}
public void setWhatsapp(String whatsapp){
		this.whatsapp=whatsapp;

	}
	public String getWhatsapp(){
		return whatsapp;
	}	
	
public void setEmail(String email){
		this.email=email;

	}
	public String getEmail(){
		return email;
	}	
public void setDob(String dob){
		this.dob=dob;

	}
	public String getDob(){
		return dob;
	}	
public void setGender(String gender){
		this.gender=gender;

	}
	public String getGender(){
		return gender;
	}	
public void setAddress1(String address1){
		this.address1=address1;

	}
	public String getAddress1(){
		return address1;
	}	
public void setAddress2(String address2){
		this.address2=address2;

	}
	public String getAddress2(){
		return address2;
	}	
public void setDistrict(String district){
		this.district=district;

	}
	public String getDistrict(){
		return district;
	}	
public void setPhonepe(String phonepe){
		this.phonepe=phonepe;

	}
	public String getPhonepe(){
		return phonepe;
	}	
public void setGpayId(String gpayid){
		this.gpayid=gpayid;

	}
	public String getGpayId(){
		return gpayid;
	}	
public void setUpiId(String upiid){
		this.upiid=upiid;

	}
	public String getUpiId(){
		return upiid;
	}	
public void setState(String state){
		this.state=state;

	}
	public String getState(){
		return state;
	}	
public void setPinCode(String pincode){
		this.pincode=pincode;

	}
	public String getPinCode(){
		return pincode;
	}
public void setStatus(String status){
		this.status=status;

	}
	public String getStatus(){
		return status;
	}	

	public void setRefSeeder(String refseeder){
		this.refseeder=refseeder;

	}
	public String getRefSeeder(){
		return refseeder;
	}		
	public void setDoj(String doj){
		this.doj=doj;

	}
	public String getDoj(){
		return doj;
	}
	public void setLevel(int level){
		this.level=level;

	}
	public int getLevel(){
		return level;
	}
	public void setBonus(int bonus){
		this.bonus=bonus;

	}
	public int getBonus(){
		return bonus;
	}

	

	
			
	

}