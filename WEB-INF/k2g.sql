
create table Seeder(seederid varchar(20)primary key, password varchar(30), name varchar(30), mobile varchar(20), whatsapp varchar(20), email varchar(50), dob varchar(20), gender varchar(20), address varchar(50), address2 varchar(50), district varchar(50), state varchar(40), pincode varchar(10), phonepe varchar(30), gpayid varchar(30), upiid varchar(30), refseeder varchar(20), doj timestamp, status varchar(30), skey varchar(30), level int, bonus int);  


create table SKeyType(stype varchar(20) primary key,duration int,gtype varchar(20),status varchar(20),keyval int);

create table skey(SrNo int auto_increment unique key, skey varchar(30) primary key, Stype int references SkeyType(SrNo), Generation timestamp, seederassign varchar(10) references seeder(seederid), status varchar(30), dos timestamp, growerassigned varchar(10), growerremark varchar(30), seederremark varchar(30), transactionid varchar(30), assignment varchar(20), assigngh varchar(20));  

create table admin(userid varchar(30) primary key, password varchar(30));


create table seedkey(SrNo int auto_increment unique key, skey varchar(30) primary key, seederassigned varchar(10) references seeder(seederid), Stype varchar(20) references SkeyType(Stype), Generation timestamp,lifecycle varchar(30),seeddate timestamp, assigndate timestamp, remainhelp int, paiddate timestamp)

create table transferlog(SrNo int auto_increment primary key, skey varchar(30) references skey(skey), seederid varchar(20) references seeder(seederid), seederassigned varchar(20) references seeder(seederid), stype varchar(20), datetime timestamp);



create table bindlog(SrNo int auto_increment primary key, seederid varchar(10), seederskey varchar(30) references seedkey(skey) unique key,seederstype varchar(20), bindseeder varchar(10), bindskey varchar(30) references seedkey(skey), bindstype varchar(10), status varchar(20), binddate timestamp, remainhelp int);

 

select seederassigned, stype, count(stype) from seedkey where seederassig
ned='KG1001' group by stype;

create view seederview as select seederassigned,sk.skey, stype, name, district,lifecycle,s.status, mobile,phonepe,gpayid, upiid, seeddate, remainhelp, paiddate from seedkey sk join seeder s on seederassigned=seederid;


create view as seederview select s.name, seederassigned, stype, count(stype) from seedkey join seed
er s on seederassigned=s.seederid where seederassigned='KG1001' group by stype;
select sk.skey, stype, name,state,district,lifecycle from seedkey sk join
 seeder s on seederassigned=seederid where Stype='S50' and lifecycle='Seeded';

select bindseeder, seederskey, seederstype, bindskey from seedkey s join bindlog bl on bl.seederskey=s.skey where seederassigned='KG1002' and lifecycle='
Assign';


create view seedhelp as select seederassigned, lifecycle, seederskey, seederstype,bindseeder, bindskey, bindstype, sd.name,sd.mobile, sd.whatsapp, sd.phonepe, sd.gpayid, sd.upiid, s.assigndate, bl.binddate from seedkey s join bindlog bl on bl.seederskey=s.skey join seeder sd on bl.bindseeder=sd.seederid;

create view gethelp as select seederassigned, lifecycle, bindskey,bindstype, bl.seederid,seederskey,seederstype, sd.name,sd.mobile, sd.whatsapp, sd.phonepe, sd.gpayid, sd.upiid, bl.binddate from seedkey s join bindlog bl on bl.bindskey=s.skey join seeder sd on sd.seederid=bl.seederid;



mysql> create view gethelp as select seederassigned, lifecycle, bindskey,bindsty
pe, bl.seederid,seederskey,seederstype, sd.name,sd.mobile, sd.phonepe, sd.gpayid
, sd.upiid, bl.binddate from seedkey s join bindlog bl on bl.bindskey=s.skey joi
n seeder sd on sd.seederid=bl.seederid;


create table seedpaid(seederid varchar(30),seederskey varchar(30) primary key, bindseeder varchar(30),bindskey varchar(30), paymentvia varchar(40), pamount int, transactionid varchar(50), status varchar(30), paiddate timestamp);


 
create view bindview as select srno,b.seederid, seederskey,seederstype, s.name, s.mobile, s.whatsapp,bindseeder,bindskey,bindstype, b.status,binddate, b.remainhelp  from bindlog b join seeder s on b.seederid=s.seederid;

create table withdraw(srno int auto_increment primary key,seederid varchar(20), name varchar(40),district varchar(40), withdrawl int, reqdate timestamp, bonusremain int, status varchar(20),paiddate timestamp,transactionid varchar(40));

create table growseed(switch varchar(10), STime varchar(20), ETime varchar(20));


