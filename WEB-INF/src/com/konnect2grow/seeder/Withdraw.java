package com.konnect2grow.seeder;
import java.io.Serializable;


public class Withdraw implements Serializable {


	private String seederid, transactionid;
	private String name;
	private String district, status;
	private String reqdate, paiddate;
	private int withdrawl,bonusremain;
	private int srno;
		public Withdraw(){
	

	
	}


	
	public void setSeederid(String seederid){
		this.seederid=seederid;

	}
	public String getSeederid(){
		return seederid;
	}
	
	public String getTransactionid(){
		return transactionid;
	}
	public void setTransactionid(String transactionid){
		this.transactionid=transactionid;

	}
	public void setName(String name){
		this.name=name;

	}
	public String getName(){
		return name;
	}	
	public void setStatus(String status){
		this.status=status;

	}
	public String getStatus(){
		return status;
	}
	
	public void setReqdate(String reqdate){
		this.reqdate=reqdate;

	}
	public String getReqdate(){
		return reqdate;
	}	
	public void setPaiddate(String paiddate){
		this.paiddate=paiddate;

	}
	public String getPaiddate(){
		return paiddate;
	}

	
public void setDistrict(String district){
		this.district=district;

	}
	public String getDistrict(){
		return district;
	}	

	public void setWithdrawl(int withdrawl){
		this.withdrawl=withdrawl;

	}
	public int getWithdrawl(){
		return withdrawl;
	}
	public void setBonusremain(int bonusremain){
		this.bonusremain=bonusremain;

	}
	public int getBonusremain(){
		return bonusremain;
	}

public void setSrno(int srno){
		this.srno=srno;

	}
	public int getSrno(){
		return srno;
	}

}