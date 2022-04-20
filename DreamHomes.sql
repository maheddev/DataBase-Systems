create database DreamHomes
use DreamHomes

create table Branch(
	branchNo varchar(4) not null primary key,
	street varchar(256),
	city varchar(20),
	postcode varchar(10)
)
create table Staff(
	staffno varchar(10) not null primary key,
	fName varchar(20) not null,
	lName varchar(20) not null,
	position varchar(20) not null,
	sex varchar(6) not null,
	DOB date not null,
	salary int not null,
	branchNo varchar(4) not null foreign key REFERENCES Branch(branchNo)
)
create table PrivateOwner(
	ownerNo varchar(6) not null primary key,
	fName varchar(20) not null,
	lName varchar(20) not null,
	address varchar(256) not null,
	telNo varchar(13) not null,
	eMail varchar(30) not null,
	password varchar(60) not null
)
create table PropertyForRent(
	propertyNo varchar(5) not null primary key,
	street varchar(50)not null,
	city varchar(20)not null,
	postcode varchar(10)not null,
	type varchar(12)not null,
	rooms int not null,
	rent int not null,
	ownerNo varchar(6) not null foreign key references PrivateOwner(ownerNo),
	staffno varchar(10) not null foreign key references Staff(staffno),
	branchNo varchar(4) not null foreign key references Branch(branchNo)
)
create table Client(
	clientNo varchar(5) not null primary key,
	fName varchar(20) not null,
	lName varchar(20) not null,	
	tellNo varchar(13) not null,
	prefType varchar(15) not null,
	maxRent int not null,
	eMail varchar(30) not null
)
create table Viewing(
	clientNo varchar(5) not null,
	propertyNo varchar(5) not null,
	constraint viewingpk primary key(clientNo,propertyNo),
	viewDate date not null,
	comment varchar(256) not null
)
create table Registeration(
	clientNo varchar(5) not null,
	branchNo varchar(4) not null,
	constraint reg primary key(clientNo,branchNo),
	staffno varchar(10) not null foreign key references Staff(staffno),
	dateJoined date not null
)

insert into Branch(BranchNo,Street,City,Postcode)
values  ('B005','22 Deer Rd','London','SWI 4EH'),
		('B007','16 Argyll St','Aberdeen','AB2 3SU'),
		('B003','163 Main St','Glasgow','G11 9QX'),
		('B004','32 Manse Rd','Bristal','BS99 INZ'),
		('B002','56 Clover Dr','London','NW10 6EU')

insert into Staff
values  ('SL21','John','White','Manager','M','1980-12-02',30000,'B005'),
		('SG37','Ann','Beech','Assistant','F','1982-03-17',12000,'B003'),
		('SG14','David','Ford','Supervisor','M','1984-01-25',18000,'B003'),
		('SA9','Mary','Howe','Assistant','F','1979-10-30',10000,'B007'),
		('SG5','Susan','Brand','Manager','F','1988-06-13',24000,'B003'),
		('SL41','Julie','Lee','Assistant','F','2000-12-21',20000,'B005')


INSERT INTO propertyForRent
VALUES  ('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'),
		('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005' ),
		('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003' ),
		('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'),
		('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003' );

select * from propertyForRent

insert into PrivateOwner
values  ('CO45','John','Smith','Dowining st','0214-861341','asdgh@gmail.com','1242sd'),
		('CO46','Joe','Koegh','2 Fergus ABZ4','0214-861212','jegh@gmail.com','124244'),
		('CO87','Carol','Farrel','2 glasgow 3Z4','0141-243632','Cfar@gmail.com','13hr444'),
		('CO40','Tina','Murphy','ach Glawsow AB4','0141-823563','tmhy@gmail.com','13gev4'),
		('CO93','Tony','Shaw','1 park p,London','0141-623412','tsw@gmail.com','4343g4')

insert into Client
values  ('CR76','John','Kay','0207-774-45','Flat',425,'Johky@gmail.com'),
		('CR56','Aline','Stewart','0141-784-13','Flat',350,'astrt@gmail.com'),
		('CR74','Mike','Ritchie','0341-324-23','Housse',700,'mrite@gmail.com'),
		('CR62','Mary','Tregear','0323-521-32','Flat',600,'mart@gmail.com')

insert into Viewing
values  ('CR56','PA14','2013-05-24','too small'),
		('CR76','PG4','2013-04-13','too remote'),
		('CR56','PG4','2013-05-18',' '),
		('CR62','PA14','2013-05-21','no dining room'),
		('CR56','PA36','2013-04-28',' ')
		
insert into Registeration
values  ('CR76','B005','SL41','2013-01-02'),
		('CR56','B003','SG37','2012-04-11'),
		('CR74','B003','SG37','2011-10-16'),
		('CR62','B007','SA9','2012-03-06')
