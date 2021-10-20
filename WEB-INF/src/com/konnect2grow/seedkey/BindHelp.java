package com.konnect2grow.seedkey;
import java.io.Serializable;


public class BindHelp implements Serializable {

	private int srno, remainhelp;
	private String seederid, status;
	private String seederskey, seederstype, bindseeder, bindskey, bindstype;		

	private String name, mobile, whatsapp;
	private String binddate;
	
		public BindHelp(){}

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

	public void setSeederid(String seederid){
		this.seederid=seederid;

	}
	public String getSeederid(){
		return seederid;
	}

	public void setSeederskey(String seederskey){
		this.seederskey=seederskey;

	}
	public String getSeederskey(){
		return seederskey;
	}
	
	public String getStatus(){
		return status;
	}
	public void setStatus(String status){
		this.status=status;

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
	
public void setSrno(int srno){
		this.srno=srno;

	}
	public int getSrno(){
		return srno;
	}	
public void setRemainhelp(int remainhelp){
		this.remainhelp=remainhelp;

	}
public int getRemainhelp(){
	return remainhelp;
}
		
public void setBinddate(String binddate){
		this.binddate=binddate;

	}
	public String getBinddate(){
		return binddate;
	}	

}