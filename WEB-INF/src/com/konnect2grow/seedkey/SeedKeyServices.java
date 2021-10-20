package com.konnect2grow.seedkey;

import java.sql.*;
import java.text.*;
import static com.konnect2grow.DBUtil.*;
import com.konnect2grow.seeder.*;
import java.util.*;

public class SeedKeyServices{

	private Connection con=null;
	private SKey skey=null;
	//private SKeyType skeytype=null;
	private PreparedStatement ps=null;
	private PreparedStatement ps2=null;	
	private ResultSet rs=null;
	
	public SeedKeyServices(){
		con=getConnection();
		skey=new SKey();	
	}
	
	
	public SeedKey generateSKey(SeedKey seedkey){
		
		int val=0;
		java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());

		seedkey.setSkey(skey.getAlphaNumericString(30));
		
		seedkey.setLifecycle("NEW");
		String stype=seedkey.getSkeytype();
		stype=stype.substring(1);
		
		int remainhelp=Integer.parseInt(stype);
		remainhelp=remainhelp*2;
		
		try{
		
		ps=con.prepareStatement("insert into SeedKey(skey, seederassigned, stype, generation, lifecycle,remainhelp) value(?,?,?,?,?,?)");
		
		ps.setString(1, seedkey.getSkey());
		ps.setString(2, seedkey.getSeederid());
		
		ps.setString(3, seedkey.getSkeytype());
		ps.setTimestamp(4, timestamp);
		ps.setString(5,seedkey.getLifecycle());
		ps.setInt(6,remainhelp);		
		val=ps.executeUpdate();

		if(val==1){
			return seedkey;
		}
		else{
			seedkey=null;
		}
				
		}//try close
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return seedkey;
	}

	public SKeyType insertSKeyType(SKeyType skeytype){
		
		
		int val=0;
		
		
		try{
		
		ps=con.prepareStatement("insert into SKeytype(stype, gtype, duration, status,keyval) value(?,?,?,?,?)");
		
		ps.setString(1, skeytype.getStype());
		ps.setString(2, skeytype.getGtype());
		
		ps.setInt(3, skeytype.getDuration());
		
		ps.setString(4, skeytype.getStatus());
		ps.setInt(5, skeytype.getKeyVal());
		
				
		val=ps.executeUpdate();

		if(val==1){
			return skeytype;
		}
		else{
			skeytype=null;
		}
				
		}
		catch(SQLException sqlex){System.out.println(sqlex.toString());}
		catch(Exception ex){ System.out.println(ex.toString()); }
	return skeytype;
	}
	
	public List<SKeyType> getSKeyTypes(){
		List<SKeyType> stypes=new ArrayList<SKeyType>();
		//System.out.println(mid);
		String query="select * from skeytype order by duration";
		try{
		Statement state=con.createStatement();
		rs=state.executeQuery(query);
		
		while(rs.next()){
			SKeyType stype=new SKeyType();
			stype.setStype(rs.getString(1));
			stype.setDuration(rs.getInt(2));
			stype.setGtype(rs.getString(3));
			stype.setStatus(rs.getString(4));
			stype.setKeyVal(rs.getInt(5));
			//System.out.println(stype.getStype());
			stypes.add(stype);
								
		}
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return stypes;

	}

	public int updateSKeyType(SKeyType stype){
		int value=0;
		try{
			ps=con.prepareStatement("update skeytype set duration=?, status=?, keyval=? where stype=?");

			ps.setInt(1, stype.getDuration());
			ps.setString(2, stype.getStatus());
			ps.setInt(3, stype.getKeyVal());
			
			ps.setString(4, stype.getStype());			
			value=ps.executeUpdate();
			
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return value;
	}

	public List<String> getSTypes(){
		List<String> stypes=new ArrayList<String>();
		
		String query="select stype from skeytype where status='ACTIVE' order by duration";
		try{
		Statement state=con.createStatement();
		rs=state.executeQuery(query);
		
		while(rs.next()){
			
			String stype=rs.getString(1);
			stypes.add(stype);
								
		}
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return stypes;

	}	
	public int transferSKey(String sfrom, String sto, String tstype, int nos){
		int value=0;
		int rowcount=0;
		java.util.Date date=new java.util.Date();
		String query="Select srno, skey from seedkey where stype='"+tstype+"' and seederassigned='"+sfrom+"' and lifecycle IN('NEW','TRANSFER') limit "+ nos;
		try{

			Statement state=con.createStatement();
			rs=state.executeQuery(query);
		
		while(rs.next()){
			
			int snos=rs.getInt(1);
			String skey=rs.getString(2);
			
			ps=con.prepareStatement("update seedkey set seederassigned=?, lifecycle=? where srno=?");

			ps.setString(1,sto);
			ps.setString(2,"TRANSFER");
			ps.setInt(3, snos);
					
			value=ps.executeUpdate();
			


			java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());

			ps2=con.prepareStatement("insert into transferlog(skey, seederid, seederassigned, stype, datetime) value(?,?,?,?,?)");
		
		ps2.setString(1, skey);
		ps2.setString(2, sfrom);
				
		ps2.setString(3, sto);
		ps2.setString(4, tstype);
		ps2.setTimestamp(5, timestamp); 
				
		ps2.executeUpdate();
		rowcount++;
		}
	
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return rowcount;
	}
	
	public int seedSKey(String seederid, String tstype){
		int value=0;
		int rowcount=0;
		java.util.Date date=new java.util.Date();
		String query="Select srno, skey from seedkey where stype='"+tstype+"' and seederassigned='"+seederid+"' and lifecycle IN('NEW','TRANSFER') limit 1";
		try{

			Statement state=con.createStatement();
			rs=state.executeQuery(query);
		
		if(rs.next()){
			java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
			int snos=rs.getInt(1);
			String skey=rs.getString(2);
			
			ps=con.prepareStatement("update seedkey set lifecycle=?, seeddate=? where srno=?");

			ps.setString(1,"SEEDED");
			ps.setTimestamp(2, timestamp);
			ps.setInt(3, snos);
					
			value=ps.executeUpdate();
			


		}
	
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return value;
	}
	public int getSKeyCount(String seederid,String stype){
		
		int count=0;
		String query=null;
		if(stype==null){
			query="select count(stype) from seedkey where seederassigned=? and lifecycle IN('NEW','TRANSFER')";

		}
		else{
			query="select count(stype) from seedkey where seederassigned=? and stype='"+stype+"' and lifecycle IN('NEW','TRANSFER')";
		}
		//String query="select count(stype) from seedkey where seederassigned=? and stype=?";
		try{

		ps=con.prepareStatement(query);
		ps.setString(1, seederid);
		//ps.setString(2, stype);
		rs=ps.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1);
			
											
		}
		else return 0;
		
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return count;

	}
	public List<String> getSeederIds(String stype){//get seeder who seeded their skey
		
		
		List<String> seederids=new ArrayList<String>();
		int count=0;
		//String query="select seederassigned from seedkey where stype=?";
		try{

		ps=con.prepareStatement("select seederassigned from seedkey where stype=? and lifecycle IN('SEEDED','REGISTER')");
		
		ps.setString(1, stype);
		rs=ps.executeQuery();
		
		while(rs.next()){
			
			seederids.add(rs.getString(1));
			
											
		}
		
		
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seederids;

	}

	public List<Seeder> getSeeders(String stype, String lifecycle,String seederid,String seederstype){
		
		//get the seeder who seeded skey and provided help will get help by binding works for admin
		
		List<Seeder> seeders=new ArrayList<Seeder>();
		int count=0;
		String sdate="";
		//System.out.println(stype);
		String query="select * from seederview where stype=? and lifecycle IN('SEEDED')";//register set to off

		
		if(lifecycle.equals("DIST")){
		query="select * from seederview where district=? and lifecycle IN('SEEDED','REGISTER')";
		//System.out.println("Dist");

		}
		
		
		else if(lifecycle.equals("SEEDPAID")){
		query="select * from seederview where stype=? and seederassigned !='"+seederid+"' and lifecycle IN('SEEDPAID','PAIDPARTIAL','BINDPARTIAL')";
		}
		else if(lifecycle.equals("DISTRICT")){
		query="select * from seederview where district=? and seederassigned !='"+seederid+"' and lifecycle IN('SEEDPAID','PAIDPARTIAL','BINDPARTIAL')";
		}

		try{

		ps=con.prepareStatement(query);
		
		ps.setString(1, stype);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
					
		Seeder seeder=new Seeder();
		seeder.setSeederid(rs.getString(1));
		seeder.setSkey(rs.getString(2));
		seeder.setAddress1(rs.getString(3));//stype

		seeder.setAddress2(seederstype);//set stype for current seeded user will be static
		seeder.setName(rs.getString(4));
		seeder.setDistrict(rs.getString(5));
		seeder.setStatus(rs.getString(6));
		seeder.setState(rs.getString(7));
		try{
		sdate=rs.getTimestamp(12).toString();//get Seeddate
		//seeder.setDoj(rs.getTimestamp(12).toString());//seeddate;			
				
		if(lifecycle.equals("SEEDPAID")||lifecycle.equals("DISTRICT")){
		seeder.setBonus(rs.getInt(13));//get reaminhelp;	
		sdate=rs.getTimestamp(14).toString();//get paid date
		}
		seeder.setDoj(sdate);
			seeders.add(seeder);
			
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
										
		}//while close
		
		
		
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
		return seeders;

	}
	public List<SeedKey> getSeededKey(String seederid){
		
		//get the seeded keys for particular user
		
		List<SeedKey> skeys=new ArrayList<SeedKey>();
		int count=0;
		String sdate="";
		
		String query="select s.stype, seeddate,gtype,duration, lifecycle from seedkey s join skeytype sk on s.stype=sk.stype where seederassigned=? and lifecycle IN('SEEDED')";

		try{

		ps=con.prepareStatement(query);
		
		ps.setString(1, seederid);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
					
		SeedKey skey=new SeedKey();
		skey.setSkeytype(rs.getString(1));
		skey.setSeeddate(rs.getTimestamp(2).toString());
		skey.setDog(rs.getString(3));//gtype

		skey.setRemainhelp(rs.getInt(4));//set duration
		skey.setLifecycle(rs.getString(5));
		skeys.add(skey);
			
												
		}//while close
		
		
		
		}//try close
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
		return skeys;

	}
	

	public Seeder getSeeder(String skey){
		
		Seeder seeder=new Seeder();
		int count=0;
		//String query="select * from seederview where stype=?";
		try{

		ps=con.prepareStatement("select * from seederview where skey=?");
		
		ps.setString(1, skey);
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		seeder.setSeederid(rs.getString(1));							
		seeder.setSkey(rs.getString(2));
		seeder.setAddress2(rs.getString(3));//stype
		//System.out.println(seeder.getAddress2());
		seeder.setName(rs.getString(4));
		seeder.setDistrict(rs.getString(5));
		seeder.setStatus(rs.getString(6));
		seeder.setDoj(rs.getTimestamp(7).toString());//date of seeding			
													
		}
				
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seeder;
	}

	public int bindSKey(Seeder seeder, String binderid, String binderskey,String binderstype, int remainhelp){
		int value=0;
		//Error while calculating binderstype replace it with remainhelp
		
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
		String lifecycle="";	
		String status=null;	
		try{
			String skey=seeder.getSkey();
			String stype=seeder.getAddress2();//getStype
			int seed=Integer.parseInt(stype.substring(1));
			//int growth=Integer.parseInt(binderstype.substring(1));
			//growth=growth*2;
			
			int remainder=0;
			remainder=remainhelp-seed;
			if(remainder==0){
				status="FULL";
				lifecycle="BINDED";
			}
			else{
				
				status="PARTIAL";
				lifecycle="BINDPARTIAL";
			}			

			ps=con.prepareStatement("update seedkey set lifecycle=?, RemainHelp=? where skey=?");
//Binder skey lifecycle set to BINDED and payment lifecycle set to SEEDDEAD in case of full payment and //in case of partial payment lifecycle set to BINDPARTIAL
			
			ps.setString(1, lifecycle);
			ps.setInt(2, remainder);
			ps.setString(3, binderskey);
			
			value=ps.executeUpdate();

			
			ps=con.prepareStatement("update seedkey set lifecycle=?, assigndate=? where skey=?");//update seeder lifecyle to ASSIGN after payment lifecycle set to SEEDPAID

			ps.setString(1,"ASSIGN");
			ps.setTimestamp(2, timestamp);
			ps.setString(3, skey);
					
			value=ps.executeUpdate();
			
		

			ps=con.prepareStatement("insert into bindlog(seederid, seederskey, seederstype,   bindseeder, bindskey, bindstype, status, binddate,remainhelp) value(?,?,?,?,?,?,?,?,?)");
		
		ps.setString(1, seeder.getSeederid());
		ps.setString(2, seeder.getSkey());
				
		ps.setString(3, seeder.getAddress2());//get SKEYTYPE
		ps.setString(4, binderid);
		ps.setString(5, binderskey);
		ps.setString(6, binderstype);
		ps.setString(7, status);
		
		
		ps.setTimestamp(8, timestamp); 
		ps.setInt(9,remainder);
				
		value=ps.executeUpdate();
		
		
	
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return value;
	}		
	public List<SeedHelp> getAssign(String seederid){//for seed help red table
		
		List<SeedHelp> seedhelps=new ArrayList<SeedHelp>();
		int count=0;

		String seederstype=null;
		String bindstype=null;
		
		//String query="select * from seederview where stype=?";
		try{

		ps=con.prepareStatement("select * from seedhelp where seederassigned=? and lifecycle=?");
		
		ps.setString(1, seederid);
		ps.setString(2, "ASSIGN");
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		SeedHelp seedhelp=new SeedHelp();
		seedhelp.setSeederassigned(rs.getString(1));
		seedhelp.setLifecycle(rs.getString(2));
		seedhelp.setSeederskey(rs.getString(3));

		seederstype=rs.getString(4);	
		seederstype=seederstype.substring(1);
		seedhelp.setSeederstype(seederstype);
		
		//seedhelp.setSeederstype(rs.getString(4));
		seedhelp.setBindseeder(rs.getString(5));
		seedhelp.setBindskey(rs.getString(6));

				
		seedhelp.setBindstype(rs.getString(7));
		seedhelp.setName(rs.getString(8));
		seedhelp.setMobile(rs.getString(9));
		seedhelp.setWhatsapp(rs.getString(10));
		
		seedhelp.setPhonepe(rs.getString(11));

		seedhelp.setGpayid(rs.getString(12));							
		seedhelp.setUpiid(rs.getString(13));
		seedhelp.setAssigndate(rs.getTimestamp(14).toString());
		seedhelp.setBinddate(rs.getTimestamp(15).toString());
		
		seedhelps.add(seedhelp);											
		}
				
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
	return seedhelps;
	}
	public List<BindHelp> getBind(String seederid){//for reciever seed help table green
		
		
		List<BindHelp> gethelps=new ArrayList<BindHelp>();
		int count=0;
		String seederstype=null;
		try{

		ps=con.prepareStatement("select * from bindview where bindseeder=? and status IN('FULL','PARTIAL')");
		
		ps.setString(1, seederid);
		//ps.setString(2, "BINDPARTIAL");
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		//System.out.println("bind");
		BindHelp seedhelp=new BindHelp();
		
		seedhelp.setSrno(rs.getInt(1));
		
		seedhelp.setSeederid(rs.getString(2));
		seedhelp.setSeederskey(rs.getString(3));
				
		
		seederstype=rs.getString(4);
		seederstype=seederstype.substring(1);
				
		seedhelp.setSeederstype(seederstype);

		
		seedhelp.setName(rs.getString(5));
		seedhelp.setMobile(rs.getString(6));
		seedhelp.setWhatsapp(rs.getString(7));
		
		seedhelp.setBindseeder(rs.getString(8));
		seedhelp.setBindskey(rs.getString(9));
		
		
		//seedhelp.setBindstype(seederstype);
		
		seedhelp.setBindstype(rs.getString(10));
		
		seedhelp.setStatus(rs.getString(11));
		seedhelp.setBinddate(rs.getTimestamp(12).toString());
		seedhelp.setRemainhelp(rs.getInt(13));	
		gethelps.add(seedhelp);											
		}
				
		}
		catch(SQLException sqlex){
			//System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	//System.out.println(gethelps);
	return gethelps;
	}
	//for recieving help from seeder
	public int recievedHelp(String seederskey, String bindskey, String stype, String bindstype, String status, String srno){
		int value=0;
		int sno=0;
		try{
		sno=Integer.parseInt(srno);
		}
		catch(Exception ex){return 0;};
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
		String lifecycle1="UNPAID";
		//String lifecycle2="SEEDDEAD";
		String logstatus="UNPAID";	

		if(status.equals("Recieved")){
			lifecycle1="SEEDPAID";//binder skey status seedpaid
			logstatus="PAID";
		}
		
		//System.out.println(bindskey);	

		//bindskey lifecycle set to seedpaid in case of approval recieved
	
		try{

			
							
			con.setAutoCommit(false);
			ps=con.prepareStatement("update bindlog set status=? where srno=?");
			ps.setString(1,logstatus);
			ps.setInt(2, sno);
			value=ps.executeUpdate();
						
			
			ps=con.prepareStatement("update seedkey set lifecycle=?, Paiddate=? where skey=?");
			//always run
			ps.setString(1, lifecycle1);
			ps.setTimestamp(2,timestamp);
			ps.setString(3, seederskey);
			
			value=ps.executeUpdate();

			
						

			//Level bonus will be execute here
			//levelBonus(sid,stype);	
		con.commit();
			
			
		
		//con.close();
			
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return value;
	}
	//for seedpaid record only red table
	public int seedPaid(SeedPaid seedpaid){	
		int value=0;
		
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
		String status="PAID";
		
		
		//bindskey lifecycle set to seedpaid in case of approval recieved
	
		try{
							
			ps=con.prepareStatement("insert into seedpaid(seederid, seederskey, bindseeder, bindskey,paymentvia, amount,transactionid, status,paiddate) values(?,?,?,?,?,?,?,?,?)");

			ps.setString(1, seedpaid.getSeederid());
			
			ps.setString(2, seedpaid.getSeederskey());
			ps.setString(3, seedpaid.getBindseeder());
			
			ps.setString(4, seedpaid.getBindskey());
			ps.setString(5, seedpaid.getPaymentvia());
			ps.setInt(6, seedpaid.getAmount());
			ps.setString(7, seedpaid.getTransid());
			ps.setString(8, status);
			ps.setTimestamp(9, timestamp);
											
			value=ps.executeUpdate();
			
			
		}
		catch(SQLException sqlex){
			
			//System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			//System.out.println(ex.toString());
		}
		
	return value;
	}
	public List<Integer[]> getSeeded(String seederid){//for total paid amount
		
		
		int count=0,samount=0, subtotal=0;
		String stype;
		List<Integer[]> seedlist=new ArrayList<Integer[]>();
		
		//String query= select count(*),seederstype  from bindlog where seederid='KG1001' 		//and status='PAID' group by seederstype;
		try{

		ps=con.prepareStatement("select count(*),seederstype  from bindlog where seederid=?  and status='PAID' group by seederstype");
		
		ps.setString(1, seederid);
		rs=ps.executeQuery();
		
		while(rs.next()){
		
			count=rs.getInt(1);
			stype=rs.getString(2);
			samount=Integer.parseInt(stype.substring(1));
			subtotal=count*samount;

			Integer[] seedpaid=new Integer[3];
			seedpaid[0]=samount;
			seedpaid[1]=count;
			seedpaid[2]=subtotal;
			seedlist.add(seedpaid);
			//System.out.println(subtotal);										
		}
				
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seedlist;
	}

			
	public List<Integer[]> getPaid(String seederid){//for total recieve amount
		
		
		int count=0,samount=0, subtotal=0;
		String stype;
		List<Integer[]> seedlist=new ArrayList<Integer[]>();
		
		//String query="select * from seederview where stype=?";
		try{

		ps=con.prepareStatement("select count(*),seederstype  from bindlog where bindseeder=?  and status='PAID' group by seederstype");
//use seederstype instead bind for actual paid amount
		
		ps.setString(1, seederid);
		rs=ps.executeQuery();
		
		while(rs.next()){
		
			count=rs.getInt(1);
			stype=rs.getString(2);
			samount=Integer.parseInt(stype.substring(1));
			subtotal=count*samount;

			Integer[] seedpaid=new Integer[3];
			seedpaid[0]=samount;
			seedpaid[1]=count;
			seedpaid[2]=subtotal;
			seedlist.add(seedpaid);
			//System.out.println(subtotal);										
		}
				
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seedlist;
	}

	public int getDirects(String seederid){//get active teams
		
		int count=0;
		String query=null;
			query="select count(*) from seeder where refseeder=?";

			
		try{

		ps=con.prepareStatement(query);
		ps.setString(1, seederid);
		//ps.setString(2, stype);
		rs=ps.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1);
			
											
		}
		else return 0;
		
		
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return count;

	}
	public List<SeedKey> getSeedPaidLog(String seederid){
		
		List<SeedKey> seedkeys=new ArrayList<SeedKey>();
		int duration=0;
		String seederstype=null;
		try{

		ps=con.prepareStatement("select * from seedkey sd join skeytype sk on sd.stype=sk.stype where seederassigned=? and lifecycle in('SEEDPAID','UNPAID') order by paiddate desc;");
		
		ps.setString(1, seederid);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		//System.out.println("bind");
		SeedKey sk=new SeedKey();
		//sk.setSeederid(rs.getString(3));
		sk.setSkeytype(rs.getString(4));
		sk.setLifecycle(rs.getString(6));
				
		sk.setSeeddate(rs.getTimestamp(7).toString());
		//sk.setAssigndate(rs.getTimestamp(8).toString());
		sk.setRemainhelp(rs.getInt(9));
		java.sql.Timestamp timestamp=rs.getTimestamp(10);
		sk.setPaiddate(timestamp.toString());
		duration=rs.getInt(12);
		sk.setRemainhelp(duration);
		String timer=getTimer(timestamp,duration);
		//System.out.println(timer);
		sk.setDog(timer);		
		seedkeys.add(sk);											
		}
				
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	//System.out.println(seedkeys);
	return seedkeys;
	}
	public List<BindHelp> getBindHelpLog(String seederid){
		//get actual paid/unpaid log
		List<BindHelp> bhlist=new ArrayList<BindHelp>();
		int count=0;
		String seederstype=null;
		try{

		ps=con.prepareStatement("select * from bindlog where bindseeder=? and Status in('PAID','UNPAID') order by binddate desc;");
		
		ps.setString(1, seederid);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
		
		BindHelp bh=new BindHelp();
		seederstype=rs.getString(4).substring(1);
		bh.setSeederstype(seederstype);
		
		
		bh.setBindstype(rs.getString(7));
		
		bh.setStatus(rs.getString(8));
				
		bh.setBinddate(rs.getTimestamp(9).toString());
		bh.setRemainhelp(rs.getInt(9));
		
				
		bhlist.add(bh);											
		}
				
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
	//System.out.println(seedkeys);
	return bhlist;
	}

	
	public List<String[]> getNewSkeys(String seederid){
		
		int count=0,samount=0, subtotal=0;
		String stype,scount;
		List<String[]> seedlist=new ArrayList<String[]>();
		
		//String query="select * from seederview where stype=?";
		try{

		ps=con.prepareStatement("select count(*),stype from seedkey where seederassigned=?  and lifecycle in ('NEW','TRANSFER') group by stype");
		
		ps.setString(1, seederid);
		rs=ps.executeQuery();
		
		while(rs.next()){
		
			count=rs.getInt(1);
			scount=((Integer)count).toString();
			stype=rs.getString(2);
			
			String[] seedkey=new String[2];
			seedkey[0]=stype;
			seedkey[1]=scount;
			seedlist.add(seedkey);
			//System.out.println(subtotal);										
		}
				
		}
		catch(SQLException sqlex){

		}
		catch(Exception ex){}
		return seedlist;
	}
	
	private String getTimer(Timestamp tm, int duration){

		java.util.Date date=new java.util.Date();
		DateFormat df=DateFormat.getInstance();
		df.format(date);
		
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
	
		Calendar cl =Calendar.getInstance();
		Calendar cl2 =Calendar.getInstance();
		
		
		cl.setTime(tm);
		cl2.setTime(timestamp);
		
		cl.add(Calendar.MINUTE,duration*60);
		
		long l1=cl.getTimeInMillis();
		long l2=cl2.getTimeInMillis();
		
		//System.out.println(cl2.getTime());
		//System.out.println(cl.getTime());
		//System.out.println((l2-l1)/1000/60);
		String str="";
		long l3=(l1-l2)/1000/60;
		
		long l4=l3%60;
		l3=l3/60;
		if(l4<0 || l3<0){
			str="00:00";

		}
		//else if((l4>0 && l4<9)||(l4>0 && l4<9)){
			//str="0"+l4;
			//str="0"+l3;
		//}
		
		else if(l4==0){
			str=l3+":00";
		}
		
		
		else{
			str=l3+":"+l4;
		}
		//System.out.println(str);
		return str;	
			
	}
	public void levelBonus(String seederid,String stype,int l1){
		
		int val=0;
		double bonus=0;
		int l1bonus=0;
		int keyval=0;
		int level=0;
		//System.out.println(l1+seederid+stype);
		SeederServices sedser=new SeederServices();
			
		Seeder seeder=sedser.getLevels(seederid);
		keyval=getKeyVal(stype);
		
		System.out.println(keyval);

		if(l1==0){//for self bonus

			level=seeder.getLevel();
			
		
		if(level==5){
			bonus=Math.round(keyval*10/100);	
			//l1bonus=Math.round(keyval*10/100);
		}
		else if(level==4){
			bonus=Math.round(keyval*10/100);	
			
		}
		else if(level==3){
			bonus=Math.round(keyval*10/100);	
			
		}
		else if(level==2){
			bonus=Math.round(keyval*6.6/100);	
			
		}
		else{
			bonus=Math.round(keyval*6.6/100);
			//System.out.println(bonus);	
			//l1bonus=0;
		}
		}
		
		if(l1==1){//for level 1 bonus

			level=seeder.getBonus();//referal level
			seederid=seeder.getRefSeeder();

		if(level==5){
			bonus=Math.round(keyval*10/100);
		}
		else if(level==4){
			bonus=Math.round(keyval*6.6/100);
		}
		else if(level==3){
			bonus=Math.round(keyval*3.3/100);
		}
		else if(level==2){
			bonus=Math.round(keyval*3.3/100);
		}
		else{
			bonus=0;
		}

		}
		
			
		try{
			
			int ibonus=(int)bonus;
			//System.out.println(ibonus);	
			ps=con.prepareStatement("update seeder set bonus=(bonus+"+ibonus+") where seederid=?");
			ps.setString(1, seederid);
								
			val=ps.executeUpdate();
			
			//System.out.println("Level Updated");
			
		}
		catch(SQLException sqlex){
			//System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			//System.out.println(ex.toString());

		}
		
	

	}

	public int getKeyVal(String type){
		
		int kv=0;
		String stype="S"+type;
		try{
		ps=con.prepareStatement("select keyval from Skeytype where stype=?");
		ps.setString(1, stype);
		rs=ps.executeQuery();
		
		if(rs.next()){
			kv=rs.getInt(1);
			
											
		}
		else return 0;
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());

		}
		catch(Exception ex){}
		return kv;

	}
	public int upgradeLevel(String seederid, int team){
		
		int level=1;
		if(team>0 || team<5){
			level=2;

		}
		else if(team>=5 || team<20){

			level=3;
		}
		else if (team>=20 || team<100){
			level=4;
		}
		else if(team>=100){
			level=5;
		}
		else{level=1;}	
	
		try{
			
			
			
			ps=con.prepareStatement("update seeder set level=? where seederid=?");
			ps.setInt(1, level);
			ps.setString(2, seederid);
								
			team=ps.executeUpdate();
			
			//System.out.println("Level Updated");
			
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());

		}

	return level;
	}
	
	public String getSeedGrowSwitch(){
		
		String val="Off";

		try{
		ps=con.prepareStatement("select * from growseed");

		rs=ps.executeQuery();
		
		if(rs.next()){
			val=rs.getString(1);
			
											
		}
		else return "Off";
		}
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());

		}
		catch(Exception ex){}
		return val;

	}

	public String skeyValue(String seederid, String tstype){
		int value=0;
		int rowcount=0;
		String skey=null;
		java.util.Date date=new java.util.Date();
		String query="Select skey from seedkey where stype='"+tstype+"' and seederassigned='"+seederid+"' and lifecycle IN('NEW','TRANSFER') limit 1";
		try{

			Statement state=con.createStatement();
			rs=state.executeQuery(query);
		
		if(rs.next()){
			skey=rs.getString(1);
		

		}
	
		}
		catch(SQLException sqlex){
			
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		
	return skey;
	}
	public List<SeedKey> getNewKeys(String seederid, String stype){
		
		//get the seeded keys for particular user and stype
		
		List<SeedKey> skeys=new ArrayList<SeedKey>();
		
		String query="select skey, seederassigned, stype, lifecycle from seedkey where seederassigned=? and stype=? and lifecycle IN('NEW', 'TRANSFER') limit 10;";

		try{

		ps=con.prepareStatement(query);
		
		ps.setString(1, seederid);
		ps.setString(2, stype);
		
		rs=ps.executeQuery();
		
		while(rs.next()){
					
		SeedKey skey=new SeedKey();
		skey.setSkey(rs.getString(1));
		skey.setSeederid(rs.getString(2));
		
		skey.setSkeytype(rs.getString(3));
		
		skey.setLifecycle(rs.getString(4));
		skeys.add(skey);
			
												
		}//while close
		
		
		
		}//try close
		catch(SQLException sqlex){
			System.out.println(sqlex.toString());
		}
		catch(Exception ex){}
		return skeys;

	}


}
