package com.konnect2grow.seedkey;
import java.io.Serializable;


public class SeedPaid implements Serializable {


	private String seederid, status;
	private String seederskey, bindseeder, bindskey;		

	private String paiddate, paymentvia,transid;
	private int amount;
	
		
	public SeedPaid(){}

	public SeedPaid(String seederid, String seederskey, String bindseeder,String bindskey,String paymentvia,String transid, int amount){


		this.bindseeder=bindseeder;
		this.bindskey=bindskey;
		this.seederid=seederid;
		this.seederskey=seederskey;
		this.amount=amount;
		this.paymentvia=paymentvia;

		this.transid=transid;


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
	public void setAmount(int amount){
		this.amount=amount;

	}
	public int getAmount(){
		return amount;
	}	
	public void setPaymentvia(String paymentvia){
		this.paymentvia=paymentvia;

	}
	public String getPaymentvia(){
		return paymentvia;
	}
	public void setPaiddate(String paiddate){
		this.paiddate=paiddate;

	}
	public String getPaiddate(){
		return paiddate;
	}
	public void setTransid(String transid){
		this.transid=transid;

	}
	public String getTransid(){
		return transid;
	}
}