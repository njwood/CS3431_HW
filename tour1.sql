/*

Nicholas Wood
9/7/2020
Database Systems 1
Professor Wong

*/

-- Drops tables and sequences on reruns
drop table Reservation;
drop table Customer;
drop table Tour;
drop table Guide;
drop sequences seq_cID;
drop sequences seq_rID;
drop sequences seq_gID;

-- Table Creation
create table Customer (
    customerID number(4),
    firstName varchar2(15),
    lastName varchar2(15),
    address varchar2(25),
    phone number(10),
    age number(3) not null,
    PRIMARY KEY(customerID)
);

create table Tour (
    tourID number(3),
    tourName varchar2(25),
    description varchar2(40),
    city varchar2(15),
    state char(2),
    vehicleType varchar2(15),
    PRIMARY KEY(tourID)
);

create table Guide (
    guideID number(3),
    firstName varchar2(15),
    lastName varchar2(15),
    phone number(10),
    vehicleType varchar2(15),
    title varchar2(15),
    salary number(5),
    PRIMARY KEY(guideID)
);

create table Reservation (
    reservationID number(4),
    travelDate date,
    customerID number(4),
    tourID number(3),
    guideID number(5),
    PRIMARY KEY(reservationID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID), 
    FOREIGN KEY (tourID) REFERENCES Tour(tourID), 
    FOREIGN KEY (guideID) REFERENCES Guide(guideID)
);

-- Sequence Creation
create sequence seq_cID
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;

create sequence seq_gID
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;

create sequence seq_rID
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;

-- Statements to insert the Customer into the Customer table
insert into Customer values(seq_cID.nextval,'Michael','Ward','143 Cambridge Ave.',5082328798,45);
insert into Customer values(seq_cID.nextval,'Lisa','Gray','77 Massachusetts Ave.',6174153059,68);
insert into Customer values(seq_cID.nextval,'Brian','Myers','175 Forest St.',2123043923,19);
insert into Customer values(seq_cID.nextval,'Nicole','Ross','35 Tremont St.',7818914567,42);
insert into Customer values(seq_cID.nextval,'Kelly','Powell','100 Main St.',8915367188,57);
insert into Customer values(seq_cID.nextval,'Madison','Martin','42 Oak St.',1233753684,16);
insert into Customer values(seq_cID.nextval,'Ashley','White','1414 Cedar St.',6428369619,18);
insert into Customer values(seq_cID.nextval,'Joshua','Clark','42 Elm Place',1946825344,22);
insert into Customer values(seq_cID.nextval,'Tyler','Young','9 Washington Court',9864752346,25);
insert into Customer values(seq_cID.nextval,'Anna','Powell','98 Lake Hill Drive',8946557732,17);
insert into Customer values(seq_cID.nextval,'Justin','Allen','657 Redondo Ave.',7988641411,18);
insert into Customer values(seq_cID.nextval,'Bruce','Sanchez','5 Jefferson Ave.',2324648888,26);
insert into Customer values(seq_cID.nextval,'Rachel','Lee','8711 Meadow St.',2497873464,67);
insert into Customer values(seq_cID.nextval,'Dylan','Garcia','17 Valley Drive',9865553232,20);
insert into Customer values(seq_cID.nextval,'Austin','Davis','1212 8th St.',4546667821,29);

-- Statements to insert the Guides into the Guide table
insert into Guide values(seq_gID.nextval,'Noah','Smith',5082391452,'bus','Junior Guide',22000);
insert into Guide values(seq_gID.nextval,'Liam','Johnson',7812930638,'bus','Guide',31000);
insert into Guide values(seq_gID.nextval,'Mason','Williams',6174920983,'car','Senior Guide',45000);
insert into Guide values(seq_gID.nextval,'Olivia','Brown',6672930684,'amphibious','Guide',32000);
insert into Guide values(seq_gID.nextval,'Sofia','Jones',4150973848,'bus','Senior Guide',49000);
insert into Guide values(seq_gID.nextval,'Emily','Miller',3058442323,'car','Junior Guide',25000);
insert into Guide values(seq_gID.nextval,'Ethan','Davis',4156719583,'bus','Junior Guide',24000);
insert into Guide values(seq_gID.nextval,'Chloe','Garcia',8193291234,'amphibious','Guide',30000);
insert into Guide values(seq_gID.nextval,'Ben','Rodriguez',8458799394,'bus','Junior Guide',27000);
insert into Guide values(seq_gID.nextval,'Mia','Wilson',5088314545,'car','Senior Guide',47000);

-- Statements to insert the Tours into the Tour table
insert into Tour values(1,'Duck Tour','Amphibious tour of the Charles River','Boston','MA','amphibious');
insert into Tour values(2,'Freedom Trail','Historic tour of Boston','Boston','MA','bus');
insert into Tour values(3,'Magnificent Mile Tour','Tour of Michigan Ave','Chicago','IL','car');
insert into Tour values(4,'City Sights','Highlights of New York City','New York','NY','bus');
insert into Tour values(5,'Golden Gate','Tour of Golden Gate Park','San Francisco','CA','bus');

-- Statements to insert the Reservations into the Reservation table -> Requires all three tables to be created prior to this since it references them as Foriegen Keys
insert into Reservation values(seq_rID.nextval,'15-Mar-16',5,2,5);
insert into Reservation values(seq_rID.nextval,'28-Feb-16',1,4,1);
insert into Reservation values(seq_rID.nextval,'3-Jun-16',5,1,4);
insert into Reservation values(seq_rID.nextval,'17-May-16',4,4,2);
insert into Reservation values(seq_rID.nextval,'11-Apr-16',3,2,9);
insert into Reservation values(seq_rID.nextval,'24-Nov-16',2,5,8);
insert into Reservation values(seq_rID.nextval,'3-Aug-16',4,3,3);
insert into Reservation values(seq_rID.nextval,'13-Dec-16',14,2,10);
insert into Reservation values(seq_rID.nextval,'9-Nov-16',5,5,7);
insert into Reservation values(seq_rID.nextval,'21-Jan-16',9,1,5);
insert into Reservation values(seq_rID.nextval,'6-Feb-16',13,5,8);
insert into Reservation values(seq_rID.nextval,'31-Aug-16',8,1,2);
insert into Reservation values(seq_rID.nextval,'10-Apr-16',15,3,6);
insert into Reservation values(seq_rID.nextval,'29-Jul-16',10,3,2);
insert into Reservation values(seq_rID.nextval,'15-Oct-16',6,2,10);
insert into Reservation values(seq_rID.nextval,'8-Mar-16',14,3,3);
insert into Reservation values(seq_rID.nextval,'11-Dec-16',11,4,9);
insert into Reservation values(seq_rID.nextval,'12-Aug-16',7,4,7);
insert into Reservation values(seq_rID.nextval,'22-Jun-16',14,1,7);
insert into Reservation values(seq_rID.nextval,'1-Feb-16',12,5,1);

-- Statements to display all the values to make sure the data was entered correctly
select * from Customer;
select * from Tour;
select * from Guide;
select * from Reservation;