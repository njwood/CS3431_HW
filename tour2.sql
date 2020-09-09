/*

Nicholas Wood
9/7/2020
Database Systems 1
Professor Wong

*/

-- Part 2A

SELECT firstName, lastName, tourName FROM Reservation NATURAL JOIN Customer NATURAL JOIN Tour
WHERE tourID = 1 OR tourID = 5 AND tourName = 'Golden Gate' OR tourName = 'Duck Tour'
ORDER BY lastName ASC, firstName ASC;

-- Part 2B

SELECT travelDate, Customer.firstName || ' ' || Customer.lastName AS CustomerName, age, Guide.firstName || ' ' || Guide.lastName AS GuideName FROM Reservation JOIN Customer
ON Reservation.customerID = Customer.customerID AND Customer.age>21
JOIN Guide
ON Reservation.guideID = Guide.guideID AND Guide.vehicleType = 'bus';


-- Part 2C

SELECT DISTINCT tourName, firstName, lastName FROM Reservation, Tour, Guide
WHERE reservation.guideID = Guide.guideID AND reservation.tourID = Tour.tourID
ORDER BY tourName DESC;