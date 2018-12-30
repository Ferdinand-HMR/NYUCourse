use dbhw2;

insert into Student(sname,semail,sphone) values ("student1" , "s1@nyu.edu","1111");
insert into Student(sname,semail,sphone) values ("student2" , "s2@nyu.edu","2222");
insert into Student(sname,semail,sphone) values ("student3" , "s3@nyu.edu","3333");
insert into Student(sname,semail,sphone) values ("student4" , "s4@nyu.edu","4444");
insert into Student(sname,semail,sphone) values ("student5" , "s5@nyu.edu","5555");
insert into Student(sname,semail,sphone) values ("student6" , "s6@nyu.edu","6666");
insert into Student(sname,semail,sphone) values ("student7" , "s7@nyu.edu","7777");
insert into Student(sname,semail,sphone) values ("student8" , "s8@nyu.edu","8888");
insert into Student(sname,semail,sphone) values ("student9" , "s9@nyu.edu","9999");
insert into Student(sname,semail,sphone) values ("student10" , "s10@nyu.edu","1010");


insert into Club( cname, cdescription) values
				("chess club" , "Club1 Descriptio"),
                ("Club1" , "Club1 Descriptio"),
                ("Club2" , "Club2 Descriptio"),
                ("Club3" , "Club3 Descriptio"),
				("chinese student association" , "Club2 Descriptio"),
				("Japanese student association" , "Club3 Descriptio"),
				("Club4" , "Club4 Descriptio"),
				("Club5" , "Club5 Descriptio"),
                ("Club9" , "Club9 Descriptio"),
                ("Club10" , "Club10 Descriptio"),
                ("Club11" , "Club11 Descriptio"),
                ("Club12" , "Club12 Descriptio"),
                ("Club13" , "Club13 Descriptio"),
                ("Club14" , "Club14 Descriptio")
                
                ;
insert into Club( cname, cdescription) values("tennis club","club description");
insert into Event (ename, edescription, edate, memprice,nonmemprice,maxpeople) values
				("event1", "event 1 description", now(), 5,8, 15),
                ("event2", "event 2 description", now(), 5,8, 15),
                ("event3", "event 3 description", now(), 5,8, 15),
                ("event4", "event 4 description", now(), 5,8, 15),
                ("event5", "event 5 description", now(), 5,10, 15),
                ("event6", "event 6 description", now(), 5,10, 15),
                ("event7", "event 7 description", now(), 5,10, 15),
                ("event8", "event 8 description", now(), 5,10, 15),
                ("event9", "event 9 description", now(), 5,10, 15),
                ("event10", "event 10 description", now(), 5,10, 15),
                ("event11", "event 11 description", now(), 5,10, 15),
                ("event12", "event 12 description", now(), 5,10, 15),
                ("event13", "event 13 description", now(), 5,10, 15),
                ("event14", "event 14 description", now(), 5,10, 15),
                ("event15", "event 15 description", now(), 5,10, 15),
                ("event16", "event 16 description", now(), 5,10, 15),
                ("event17", "event 17 description", now(), 5,10, 15),
                ("event18", "event 18 description", now(), 5,10, 15),
                ("event19", "event 19 description", now(), 5,10, 15);
                
insert into Event (ename, edescription, edate, memprice,nonmemprice,maxpeople) values
                ("event20", "event 20 description,'2017-10-10',5,10,10);
insert into HoldsEvent(eid,cid) values
				(5,1),
                (6,1),
                (7,1),
                (8,1),
                (9,1),
                (10,1),
				(5,2),
                (6,2),
                (7,2),
                (8,2),
                (9,2),
                (10,2),
				(5,3),
                (6,3),
                (7,3),
                (8,3),
                (9,3),
                (10,3),
                (1,6),
                (2,6),
                (3,6),
                (4,6),
                (12,7),
                (12,8),
                (13,4),
                (14,4),
                (15,4),
                (16,4),
                (17,9),
                (17,10),
                (17,11),
                (17,12),
                (17,13),
                
                (18,14),
                (18,10),
                (18,11),
                (18,12),
                (18,13)
                ;
insert into HoldsEvent(eid,cid) values(1,5)            
insert into Register(eid,sid,price,rating) values 
					(13,2,15,3.5),
                    (14,2,15,4.5),
                    (15,3,15,4.5),
                    (16,4,15,4.0),
                    
                    (1,5,15,3.5),
                    (2,6,15,4.5),
                    (3,7,15,4.5),
                    (16,7,15,4.0),
                    (12,8,15,4.0)
                    ;
insert into Register(eid,sid,price,rating) values (5,2,34,5);                 
insert into Membership values(8,1,'Fall',2017,10),
(8,1,'spring',2018,10),
(8,1,'Fall',2018,10);
insert into Membership values(8,1,'spring',2015,10),
(8,1,'Fall',2015,10)
(8,1,'spring',2016,10),
(8,1,'spring',2017,10),
(8,1,'Fall',2016,10);

