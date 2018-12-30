create table Shops(
	sid integer auto_increment primary key,
	address varchar(255),
	phone_number char(10)
);
create table Services(
	id integer auto_increment primary key,
	sname varchar(255),
	decription varchar(255)
);
create table offer(
	sid integer,
	id integer,
	per_price integer,
	primary key(sid,id),
	foreign key(sid) references Shops(sid) on delete cascade,
	foreign key(id) references Services(id) on delete cascade
);
create table Employees(
	eid integer auto_increment primary key,
	ename varchar(255),
	sid integer,
	foreign key(sid) references Shops(sid) on delete cascade
);
create table Customers(
	cid integer auto_increment primary key,
	cname varchar(255),
	phone_number char(10),
	credit_card varchar(255)
);
create table Orders(
	oid integer auto_increment primary key,
	cid integer,
	order_date date,
	requested_date date,
	actual_completed_date date,
	sid integer,
	total_price integer
	
	
);
foreign key(sid) references Shops(sid) on delete cascade
foreign key(cid) references Customer(cid) on delete cascade
create table Jobs(
	oid integer,
	id integer,
	amount integer,
	decription varchar(255),
	primary key(oid, id),
	foreign key(oid) references Orders(oid) on delete cascade,
	foreign key(id) references Services(id) on delete cascade
);
create table Doneby(
	oid integer,
	eid integer,
	primary key(oid,eid),
	foreign key(oid) references Orders(oid) on delete cascade,
	foreign key(eid) references Employees(eid) on delete cascade
);



(i)
select count(oid), sum(total_price)
from Customers natural join Orders
where cname="Jhon Myers" and year(order_date)=2017;

(ii)

select count(sid)
from (select sid
from offer 
group by sid
having count(id) =(select count(id) from Services)) as ;
(iii)
select E.eid, delay.num/count(D.oid)
from Employees E left outer join Doneby D on E.eid=D.eid,(select E.eid, count(O.oid) as num
from Orders O, Employees E left outer join Doneby D on E.eid=D.eid 
where O.oid= D.oid and to_days(O.actual_completed_date)-to_days(O.requested_date)>1
group by E.eid) as delay
where E.eid =delay.eid
group by eid

create view delay as 
	select E.eid, count(O.oid) as num
from Orders O, Employees E left outer join Doneby D on E.eid=D.eid 
where O.oid= D.oid and to_days(O.actual_completed_date)-to_days(O.requested_date)>1
group by E.eid)
(iv) 
select cid, cname
from Customers C natural join Orders O,Jobs J , Services S
where O.oid=J.oid and S.sname="color copying" and J.id=S.id and C.cid in (select cid
from Customers C natural join Orders O,Jobs J,Services S
where O.oid=J.oid and S.sname="shipping" and J.id=S.id);



insert into Shops(address, phone_number) values("343 Gold","1234567890"),
	("Avalon Fort Greene","1234567890"),
	("Avalon Dobro","1234567890"),
	("The Eagle","1234567890"),
	("Hoyt and Horn","1234567890");
insert into Services(sname,decription)values("color copying","decription"),
	("shipping","decription"),
	("printing","decription"),
	("blinding","decription"),
	("scanning","decription");
insert into offer values(1,1,2),
	(1,2,2),
	(1,3,2),
	(1,4,5),
	(1,5,1);
insert into Employees(ename,sid) values("Evelyn",1),
	("Emily",2),
	("Alice",3),
	("Ying",4),
	("Bao",5);
insert into Customers(cname,phone_number,credit_card)values("Jhon Myers","1234567890","1234567890"),
	("Evelyn","1234567890","1234567890"),
	("Happy","1234567890","1234567890"),
	("Ying","1234567890","1234567890"),
	("Boston","1234567890","1234567890");
insert into Orders(cid,order_date,requested_date,actual_completed_date,sid,total_price) values(1,'2017-10-10','2017-11-11','2017-11-23',1,100),
	(2,'2017-01-23','2017-03-03','2017-03-03',2,23),
	(3,'2018-01-01','2018-02-01','2018-02-01',3,200),
	(2,'2018-07-01','2018-09-02','2018-09-09',3,30),
	(4,'2017-08-08','2017-09-09','2018-11-11',4,200);
insert into Jobs values(1,1,10,10),
	(1,2,10,10),
	(2,1,10,10),
	(2,2,19,20),
	(3,1,34,100);
insert into Doneby values(1,1),
	(1,2),
	(1,3),
	(2,3),
	(3,4),
	(4,5);




