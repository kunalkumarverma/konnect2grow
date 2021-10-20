package com.konnect2grow.seedkey;
import java.io.Serializable;


public class SeedHelp implements Serializable {


	private String seederassigned, lifecycle;
	private String seederskey, seederstype, bindseeder, bindskey, bindstype;		

	private String name, mobile, whatsapp;
	private String phonepe, gpayid, upiid;
	private String binddate, assigndate;
	
	public SeedHelp(String seederassigned,String lifecycle,String seederskey,String seederstype, String bindseeder, String bindskey,String bindstype, String name, String mobile, String whatsapp,String phonepe,String gpayid, String upiid, String assigndate, String binddate){

		this.seederassigned=seederassigned;
		this.lifecycle=lifecycle;
		this.seederskey=seederskey;
		this.seederstype=seederstype;
		this.bindseeder=bindseeder;
		this.bindskey=bindskey;
		this.bindstype=bindstype;
		this.name=name;
		this.mobile=mobile;
		this.whatsapp=whatsapp;
		this.phonepe=phonepe;
		this.gpayid=gpayid;
		this.upiid=upiid;
		this.assigndate=assigndate;
		this.binddate=binddate;
		
	}
	
	public SeedHelp(){}

public void setSeederstype(String seederstype){
		this.seederstype=seederstype;

	}
	public String getSeederstype(){
		return seederstype;
	}
public void setBindseeder(String bindseeder){
		this.bindseeder=bindseeder;

	}
	public String getBindseeder(){
		return bindseeder;
	}
public void setBindskey(String bindskey){
		this.bindskey=bindskey;

	}
public String getBindskey(){
		return bindskey;
	}
	
public void setBindstype(String bindstype){
		this.bindstype=bindstype;
	}
	
public String getBindstype(){
		return bindstype;
	}

	public void setSeederassigned(String seederassigned){
		this.seederassigned=seederassigned;

	}
	public String getSeederassigned(){
		return seederassigned;
	}

	public void setSeederskey(String seederskey){
		this.seederskey=seederskey;

	}
	public String getSeederskey(){
		return seederskey;
	}
	
	public String getLifecycle(){
		return lifecycle;
	}
	public void setLifecycle(String lifecycle){
		this.lifecycle=lifecycle;

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
	
public void setPhonepe(String phonepe){
		this.phonepe=phonepe;

	}
	public String getPhonepe(){
		return phonepe;
	}	
public void setGpayid(String gpayid){
		this.gpayid=gpayid;

	}
	public String getGpayid(){
		return gpayid;
	}	
	public void setUpiid(String upiid){
		this.upiid=upiid;

	}
	public String getUpiid(){
		return upiid;
	}	
	
public void setAssigndate(String assigndate){
		this.assigndate=assigndate;

	}
	public String getAssigndate(){
		return assigndate;
	}	
public void setBinddate(String binddate){
		this.binddate=binddate;

	}
	public String getBinddate(){
		return binddate;
	}	

}