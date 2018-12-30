create table Student(
	sid int primary key,
	sname varchar(255),
	semail  varchar(255),
	sphone char(10)
);
create table Club(
	cid int primary key,
	cname varchar(255),
	cdescription varchar(255)
);
create table Event(
	eid int primary key,
	ename varchar(255),
	edescription varchar(255),
	edate date,
	memprice int,
	nonmemprice int,
	maxpeople int
);
create table Membership(
	sid int,
	cid int,
	semester varchar(10),
	year int,
	memberfee int,
	primary key(sid,cid,semester,year),
	foreign key(sid) references Student(sid),
	foreign key(cid) references Club(cid)
);
create table HoldsEvent(
	eid int,
	cid int,
	primary key(eid,cid),
	foreign key(eid) references Event(eid),
	foreign key(cid) references Club(cid)
);
create table Register(
	eid int,
	sid int,
	price int,
	rating int,
	primary key(eid,sid),
	foreign key(eid) references Event(eid),
	foreign key(sid) references Student(sid),
	check (rating>=1 and rating <=5)
); 

(i)
select S.sid, count(R.eid),sum(price)
from Student S left outer join Register R on S.sid=R.sid, Event E
where  month(edate)>8 and year(edate)=2018 and E.eid=R.eid
group by sid;

select S.sid, count(R.eid),sum(price)
from Student S natural join  Register R, Event E
where  month(edate)>8 and year(edate)=2018 and E.eid=R.eid
group by sid;

select S.sid, count(R.eid),sum(price)
from Student S natural join Register R 
group by sid
having count(R.eid)=0;

(ii)
select E.eid, E.ename
from Event E,(select eid,count(*) as n
from HoldsEvent 
group by eid) Num
where E.eid = Num.eid and Num.n >=all(select count(*) as p
from HoldsEvent 
group by eid);

(iii)
select T.id
from (select distinct R.sid as id
from Register R natural join HoldsEvent H, Club C,Membership M
where C.cid= H.cid and C.cname="chess club"  and M.sid!=R.sid and M.cid=C.cid and M.semester="Fall" and M.year=2017
) as T, Register R natural join Event E,HoldsEvent H,Club C
where R.sid=T.id and R.eid=H.eid and H.cid=C.cid and month(edate)>8 and year(edate)=2017
group by T.id
having sum(R.price)>(select distinct memberfee
                     from Membership M natural join Club C
                     where c.cname="chess club") 
(iV)
select sid
from Membership M
where (M.semester="Fall" and M.year=2015) or M.year>2015
group by sid,cid
having count(*)>=7

(v)
select cname
from Club C, HoldsEvent H
where C.cid=H.cid and H.eid = all(select eid
from Register
group by eid
having avg(rating)>4);
(vi)
select C1.cname, C2.cname
from HoldsEvent H1 join HoldsEvent H2 on H1.eid=H2.eid, Club C1,Club C2
where C1.cid=H1.cid and C2.cid=H2.cid and H1.cid>H2.cid
group by H1.cid, H2.cid
having count(*)>=5
(vii)

select distinct S.sname
from Register R natural join Student S,Membership M,(select H1.eid as id
from HoldsEvent H1, HoldsEvent H2, Club C1, Club C2
where  H1.eid=H2.eid and H1.cid=C1.cid and C1.cname ="chinese student association" and H2.cid=C2.cid and C2.cname="Japanese student association") as T
where R.eid=T.id and S.sid not in (select sid
from Membership M natural join Club C
where C.cname ="chinese student association" or C.cname="Japanese student association");

(h)
(i)
insert into Membership
	select R.sid,H,cid,"Fall",2018,0
	from Register R natural join HoldsEvent H,Event E
	where month(edate)>8 and year(edate)=2018 and E.eid= R.eid  and (R.sid,H.cid) not in(select sid.cid
		                                                                                 from Membership
		                                                                                 where semester="Fall" and year=2018)
	group by R.sid,H.cid 
	having count(*)>5

(ii)
delete from Student 
where sid not in (select sid from Membership) or sid not in(select sid from Register);
(iii)
insert into Event(ename, edescription, edate, memprice,nonmemprice,maxpeople) values("Halloween Party","Fun",'2018-10-10',10,20,50);
insert into HoldsEvent values(20,15);
insert into HoldsEvent values(20,1);

Problem 2
(a) 
create view SC as 
	select S.sid,S.sname,C.cid, C.cname
	from Student S left outer join Membership M on S.sid=M.sid,Club C
	where M.semester="Fall" and M.year=2018 and C.cid=M.cid;

(i)
select count(*)
from SC 
where sname="John Myers";
(ii)
create view S_num as
	select sid,sname,num.count(*)
	from SC, (select SC.sid id , count(*)
	from SC left outer join Register R on SC.sid=R.sid,HoldsEvent H,Event E
	where SC.cid=H.cid and H.eid=R.eid
	group by SC.sid) num
	where SC.sid=num.id;
create view S_num as 
	select sid, sname,count(*)
	from SC natural join Register R,HoldsEvent H natural join Event E
	where month(edate)>8 and year(edate)=2018 and   
	group by sid,sname,SC.cid
(iii)
select * 
from S_num
where  sname="student8";
(iV)
drop view SC;
drop view S_num;
(b)
select M.sid
from Membership M left outer join Register R on M.sid=R.sid,Event E
where year(edate)>=2016 and E.eid=R.eid
group by M.sid
having count(*)=0
create trigger delete after update
	on Membership for each row
	referencing new row as nrow
	when(nrow.sid in (select M.sid
from Membership M outer left join Register R on S.sid=R.sid,Event E
where year(edate)>=2016 and E.eid=R.eid
group by M.sid
having count(*)=0))
begin
delete * from Membership where sid=nrow.sid
end;
(c)
create trigger  increase  after insert
on Register for each row 
referencing new row as rnow
when((select count(R.sid) from Register R where R.eid=nrow.eid)>=(select 0.8*maxpeople from Event E where E.eid =nrow.eid))  
begin
	update Event set nonmemprice=1.5*nonmemprice where eid=nrow.eid;
end;

