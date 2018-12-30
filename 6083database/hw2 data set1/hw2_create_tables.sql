use dbhw2;
create table Student (sid integer auto_increment primary key,
					sname varchar(50),
                    semail varchar(50),
                    sphone varchar(50));

create table Club( cid integer auto_increment primary key,
					cname varchar(50),
                    cdescription varchar(50));
create table Event(
					eid int auto_increment primary key,
                    ename varchar(50),
                    edescription varchar(50),
                    edate datetime,
                    memprice int,
                    nonmemprice int,
                    maxpeople int
				);
                
create table Membership(
						sid int,
                        cid int,
                        semester varchar(50),
                        year int,
                        memberfee int,
                        FOREIGN KEY (sid) REFERENCES Student(sid) ON DELETE CASCADE,
                        FOREIGN KEY (cid) REFERENCES Club(cid) ON DELETE CASCADE
						);

create table HoldsEvent(
						eid int, 
                        cid int,
                        FOREIGN KEY (eid) REFERENCES Event(eid) ON DELETE CASCADE,
                        FOREIGN KEY (cid) REFERENCES Club(cid) ON DELETE CASCADE
);

create table Register(
						eid int,
                        sid int,
                        price int,
                        rating float,
                        FOREIGN KEY (eid) REFERENCES Event(eid) ON DELETE CASCADE,
                        FOREIGN KEY (sid) REFERENCES Student(sid) ON DELETE CASCADE
                        
);



