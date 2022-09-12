
Create database if not exists lab_mysql;
use lab_mysql;

Create Table Car (
VehicleID char(9), Manufacturer  Varchar(20), Model Varchar(20), year int(4), color varchar(10) );
create Table Customers (
Customer_ID char(8), Customer_Name varchar(30), Phone_number char(12), Email varchar(35), Address varchar(40), City_province varchar(20), Country varchar(15), postalcode char(15) );
create Table Salesperson (
SalespersonID char(7), Salesperson_Name varchar(30), Store varchar(10), Email varchar(35), phone_number char(12) );
create Table Invoice (
Invoice_no char(7), Orderdate date, VehicleID char(9),Customer_ID char(5), SalespersonID char(7) );

INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('09LI985TR','Volkswagen', 'Tiguan', '2019','Blue');
INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('87ERT34GT','Peugeot', 'Rifter', '2017','Black');
INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('73FGY85TR','Ford', 'Fusion', '2018','Red');
INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('809TVF98G','Toyota', 'RAV4', '2016','White');
INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('63YFD476N','Volvo', 'V6', '2020','Silver');
INSERT INTO Car (VehicleID, Manufacturer, Model, year , color)
VALUES ('085TH39NY','Volvo', 'V60', '2015','White');

iNSERT INTO Customers (Customer_ID, Customer_Name, Phone_number, Email, Address,City_province, Country, Postalcode)
Values ('10001', 'Pablo Picasso', '+34636176382', 'ppicasso@gmail.com', '14 Paseo de la Chopera', 'Madrid', 'Spain','28045');
iNSERT INTO Customers (Customer_ID, Customer_Name, Phone_number, Email, Address,City_province, Country, Postalcode)
Values ('20001', 'Abraham Lincon', '+13059077086', 'lincoln@us.gov', '120 SW 8th St', 'Miami', 'Florida','20685');
iNSERT INTO Customers (Customer_ID, Customer_Name, Phone_number, Email, Address,City_province, Country, Postalcode)
Values ('30001', 'Napoleon Bonaparte', '+33179754000', 'hello@napoleon.me', '40 Rue Colisee', 'Paris', 'France','75008');


iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00001','Petey Cruiser', 'Madrid', 'peteycruiser@gmail.com', '+33179754000');
iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00002','Paul Molive', 'Berlin', 'paulmolive@gmail.com', '+4978955800');
iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00003','Anna Sthesia', 'Barcelona', 'annasthesia@gmail.com', '+34808675800');
iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00004','Gail Forcewind', 'Paris', 'gailforce@hotmail.com', '+338087800');
iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00005','Leonard Davinci', 'Paris', 'leoa@yahoo.com', '+338068900');
iNSERT INTO salesperson (SalespersonID, Salesperson_Name, Store, Email, phone_number)
Values ('00005','Marie Hutchkins', 'Miami', 'mariehuct@yahoo.com', '+1338068900');

iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID, Customer_ID, SalespersonID)
Values ('8523990','22-08-2018', '63YFD476N','10001' '00001');
iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID,Customer_ID, SalespersonID)
Values ('7311665','31-12-2018', '98HU675O','20001', '00002');
iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID, Customer_ID, SalespersonID)
Values ('2711351','22-01-2018','809TVF98A','30001', '00003');

ALTER TABLE Invoice
ADD  Customer_ID1 char(5);

iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID, Customer_ID1, SalespersonID)
Values ('8523990', 22/08/2018, '63YFD476N', '10001','00001');
iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID,Customer_ID1, SalespersonID)
Values ('7311665', 31/12/2018, '98HU675O','20001', '00002');
iNSERT INTO Invoice (Invoice_no, Orderdate, VehicleID, Customer_ID1, SalespersonID)
Values ('2711351', 22/01/2019,'809TVF98G','30001', '00003');