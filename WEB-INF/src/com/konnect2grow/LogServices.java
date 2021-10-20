package com.konnect2grow;

import java.sql.*;
import java.text.*;
import static com.konnect2grow.DBUtil.*;
import java.util.*;

public class LogServices{

	private Connection con=null;
	private SKey skey=null;
	//private SKeyType skeytype=null;
	private PreparedStatement ps=null;
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
		
		try{
		
		ps=con.prepareStatement("insert into SeedKey(skey, seederassigned, stype, generation, lifecycle) value(?,?,?,?,?)");
		
		ps.setString(1, seedkey.getSkey());
		ps.setString(2, seedkey.getSeederid());
		
		ps.setString(3, seedkey.getSkeytype());
		ps.setTimestamp(4, timestamp);
		ps.setString(5,seedkey.getLifecycle());
				
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
		
		ps=con.prepareStatement("insert into SKeytype(stype, gtype, duration,status) value(?,?,?,?)");
		
		ps.setString(1, skeytype.getStype());
		ps.setString(2, skeytype.getGtype());
		
		ps.setInt(3, skeytype.getDuration());
		ps.setString(4, skeytype.getStatus());
				
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
			ps=con.prepareStatement("update skeytype set duration=?, status=? where stype=?");

			ps.setInt(1, stype.getDuration());
			ps.setString(2, stype.getStatus());
			ps.setString(3, stype.getStype());			
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
		
		String query="Select srno from seedkey where stype='"+tstype+"' and seederassigned='"+sfrom+"' and lifecycle IN('NEW','TRANSFER') limit "+ nos;
		try{

			Statement state=con.createStatement();
			rs=state.executeQuery(query);
		
		while(rs.next()){
			
			int snos=rs.getInt(1);
			
			ps=con.prepareStatement("update seedkey set seederassigned=?, lifecycle=? where srno=?");

			ps.setString(1,sto);
			ps.setString(2,"TRANSFER");
			ps.setInt(3, snos);
					
			value=ps.executeUpdate();
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
	public int getSKeyCount(String seederid,String stype){
		
		int count=0;
		//String query="select count(stype) from seedkey where seederassigned=? and stype=?";
		try{

		ps=con.prepareStatement("select count(stype) from seedkey where seederassigned=? and stype=?");
		ps.setString(1, seederid);
		ps.setString(2, stype);
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
	
}
