/*

Nicholas Wood
9/11/2020
Database Systems 1
Professor Wong

*/

-- Initial Drop
DROP TABLE Reservation
DROP TABLE Customer
DROP TABLE Guide
DROP TABLE Tour
DROP TABLE Location


-- Create Tables
CREATE TABLE Customer (
    customerID number(4),
    firstName varchar2(15),
    lastName varchar2(15),
    address varchar2(25),
    phone number(10),
    age number(3)
    CONSTRAINT Customer_PK PRIMARY KEY(customerID)
);

CREATE TABLE Tour (
    tourID number(3),
    tourName varchar(25),
    description varchar2(40),
    city varchar2(15),
    state char(2),
    vehicleType(15),
    CONSTRAINT Tour_PK PRIMARY KEY(tourID)
);

CREATE TABLE Guide (
    guideID number(3),
    firstName varchar2(15),
    lastName varchar2(15),
    phone number(10,0),
    vehicleType varchar2(15),
    title varchar2(15),
    salary number(5),
    CONSTRAINT Guide_PK PRIMARY KEY(guideID)
);

CREATE TABLE Location (
    locationName varchar2(30),
    locationType varchar2(10),
    address varchar2(40),
    FOREIGN KEY tourID REFERENCES Tour(tourID)
    CONSTRAING Location_PK PRIMARY KEY(locationName)
);

CREATE TABLE Reservation (
    reservationID number(4),
    travelDate date,
    FOREIGN KEY customerID REFERENCES Customer(customerID),
    FOREIGN KEY tourID REFERENCES Tour(tourID),
    FOREIGN KEY guidID REFERENCES Guide(guideID)
    price number(5,2),
    CONSTRAINT Reservation_PK PRIMARY KEY(reservationID)
);


-- Create Sequences
CREATE SEQUENCE seq_cID
    MIN VALUE 5
    STARTS WITH 5
    INCREMENT BY 5;

CREATE SEQUENCE seq_gID
    MIN VALUE 101
    STARTS WITH 101
    INCREMENT BY 1;

CREATE SEQUENCE seq_rID
    MIN VALUE 100
    STARTS WITH 100
    INCREMENT BY 10;

insert into Customer values(seq_cID.nextval,'Michael','Ward','143 Cambridge Ave.',5082328798,45);
insert into Customer values(seq_cID.nextval,'Lisa','Gray','77 Massachusetts Ave.',6174153059,68);
insert into Customer values(seq_cID.nextval,'Brian','Myers','175 Forest St.',2123043923,19);
insert into Customer values(seq_cID.nextval,'Nicole','Ross','35 Tremont St.',7818914567,42);
insert into Customer values(seq_cID.nextval,'Kelly','Powell','100 Main St.',8915367188,57);
insert into Customer values(seq_cID.nextval,'Madison','Martin','42 Oak St.',1233753684,16);
insert into Customer values(seq_cID.nextval,'Ashley','White','414 Cedar St.',6428369619,18);
insert into Customer values(seq_cID.nextval,'Joshua','Clark','42 Elm Place',1946825344,22);
insert into Customer values(seq_cID.nextval,'Tyler','Young','9 Washington Court',9864752346,25);
insert into Customer values(seq_cID.nextval,'Anna','Powell','98 Lake Hill Drive',8946557732,17);
insert into Customer values(seq_cID.nextval,'Justin','Allen','657 Redondo Ave.',7988641411,18);
insert into Customer values(seq_cID.nextval,'Bruce','Sanchez','5 Jefferson Ave.',2324648888,26);
insert into Customer values(seq_cID.nextval,'Rachel','Lee','8711 Meadow St.',2497873464,67);
insert into Customer values(seq_cID.nextval,'Dylan','Garcia','17 Valley Drive',9865553232,20);
insert into Customer values(seq_cID.nextval,'Austin','Davis','1212 8th St.',4546667821,29);

insert into Tour values(1, 'Duck Tour', 'Amphibious tour of the Charles River', 'Boston', 'MA', 'duckboat')
insert into Tour values(2, 'Freedom Trail', 'Historic tour of Boston', 'Boston', 'MA', 'bus')
insert into Tour values(3, 'Magnificent Mile Tour', 'Tour of Michigan', 'Chicago', 'IL', 'bus')
insert into Tour values(4, 'City Sights', 'Highlights of New York City', 'New York', 'NY', 'car')
insert into Tour values(5, 'Golden Gate', 'Tour of Golden Gate Park', 'San Francisco', 'CA', 'bus')

insert into Guide values(seq_gID.nextval,'Noah','Smith',5082391452,'bus','Junior Guide',22000);
insert into Guide values(seq_gID.nextval,'Liam','Johnson',7812930638,'bus','Guide',31000);
insert into Guide values(seq_gID.nextval,'Mason','Williams',6174920983,'car','Senior Guide',45000);
insert into Guide values(seq_gID.nextval,'Olivia','Brown',6672930684,'duckboat','Guide',32000);
insert into Guide values(seq_gID.nextval,'Sofia','Jones',4150973848,'bus','Senior Guide',49000);
insert into Guide values(seq_gID.nextval,'Emily','Miller',3058442323,'car','Junior Guide',25000);
insert into Guide values(seq_gID.nextval,'Ethan','Davis',4156719583,'bus','Junior Guide',24000);
insert into Guide values(seq_gID.nextval,'Chloe','Garcia',8193291234,'duckboat','Guide',30000);
insert into Guide values(seq_gID.nextval,'Ben','Rodriguez',8458799394,'bus','Junior Guide',27000);
insert into Guide values(seq_gID.nextval,'Mia','Wilson',5088314545,'car','Senior Guide',47000);

insert into Location values('Charles River','Historic','10 Mass Avenue',1);
insert into Location values('Salt and Pepper Bridge','Historic','100 Broadway',1);
insert into Location values('Boston Common','Park','139 Tremont Street',2);
insert into Location values('Kings Chapel','Historic','58 Tremont Street',2);
insert into Location values('Omni Parker House','Restaurant','60 School Street',2);
insert into Location values('Paul Revere House','Historic','19 North Square'2);
insert into Location values('Bunker Hill Monument','Historic','Monument Square',2);
insert into Location values('Art Institute','Museum','111 S Michigan Avenue',3);
insert into Location values('Chicago Tribune','Historic','435 N Michigan Avenue',3);
insert into Location values('White Castle','Restaurant','S Wabash Avenue',3);
insert into Location values('Freedom Tower','Historic','285 Fulton Street',4);
insert into Location values('Le Bernardin','Restaurant','155 W 51 Street',4);
insert into Location values('Park Aquarium','Museum','55 Music Concourse Drive',5);
insert into Location values('de Young Museum','Museum','50 Hagiwara Tea Garden Drive',5);
insert into Location values('Japanese Tea Garden','Park','75 Hagiwara Tea Garden Drive',5);
insert into Location values('Botanical Garden','Park','1199 9th Avenue',5);

insert into Reservation values(seq_rID.nextval,'15-Mar-16',25,2,105,null);
insert into Reservation values(seq_rID.nextval,'28-Feb-16',5,4,101,null);
insert into Reservation values(seq_rID.nextval,'3-Jun-16',25,1,104,null);
insert into Reservation values(seq_rID.nextval,'17-May-16',20,4,102,null);
insert into Reservation values(seq_rID.nextval,'11-Apr-16',15,2,109,null);
insert into Reservation values(seq_rID.nextval,'24-Nov-16',10,5,108,null);
insert into Reservation values(seq_rID.nextval,'3-Aug-16',20,3,103,null);
insert into Reservation values(seq_rID.nextval,'13-Dec-16',70,2,110,null);
insert into Reservation values(seq_rID.nextval,'9-Nov-16',25,5,107,null);
insert into Reservation values(seq_rID.nextval,'21-Jan-16',45,1,105,null);
insert into Reservation values(seq_rID.nextval,'6-Feb-16',65,5,108,null);
insert into Reservation values(seq_rID.nextval,'31-Aug-16',40,1,102,null);
insert into Reservation values(seq_rID.nextval,'10-Apr-16',75,3,106,null);
insert into Reservation values(seq_rID.nextval,'29-Jul-16',50,3,102,null);
insert into Reservation values(seq_rID.nextval,'15-Oct-16',30,2,110,null);
insert into Reservation values(seq_rID.nextval,'8-Mar-16',70,3,103,null);
insert into Reservation values(seq_rID.nextval,'11-Dec-16',55,4,109,null);
insert into Reservation values(seq_rID.nextval,'12-Aug-16',35,4,107,null);
insert into Reservation values(seq_rID.nextval,'22-Jun-16',70,1,107,null);
insert into Reservation values(seq_rID.nextval,'1-Feb-16',60,5,101,null);

