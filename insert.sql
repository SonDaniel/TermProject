#SQL file to create tables
/*Employee Part*/
CREATE TABLE IF NOT EXISTS Employee (
	EmployeeID int not null primary key,
	EFirstName varchar(30),
	ELastName  varchar(30),
	Phone varchar(11),
	Constraint UC_Employee_ID UNIQUE (EFirstName,ELastName,Phone)
);

CREATE TABLE IF NOT EXISTS EmploymentTime(
	EmployeeInstance int not null auto_increment primary key,
	DateRetired Date,
	DateEmployed Date not null,
	EmployeeID int,
    Constraint UC_EmployeeInstance UNIQUE (DateEmployed,EmployeeID),
    constraint fk_EmployeeID foreign key (EmployeeID) references Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Mechanic(
	EmploymentField varchar(30),
	MechanicInstance int not null primary key,
	constraint fk_Mechanic foreign key (MechanicInstance) references EmploymentTime (EmployeeInstance)
);

CREATE TABLE IF NOT EXISTS ServiceTechnician(
	EmploymentField varchar(30),
	ServiceTechnicianInstance int not null primary key,
	constraint fk_ServiceTechnician foreign key  (ServiceTechnicianInstance) references EmploymentTime (EmployeeInstance)
);

CREATE TABLE IF NOT EXISTS Certificate(
	CertificateID int not null primary key,
	CertificateLevel int,
	ServiceType varchar(30) not null,
	Constraint UC_Certificate UNIQUE (ServiceType)   
);

CREATE TABLE IF NOT EXISTS TempCertificate(
	MechanicInstance int not null,
	CertificateID int not null,
	primary key (MechanicInstance, CertificateID),
    constraint fk_TempCertificate foreign key(MechanicInstance) references Mechanic (MechanicInstance),
    constraint fk_Certificate foreign key(CertificateID) references Certificate (CertificateID)
);

CREATE TABLE IF NOT EXISTS MentorShip(
	MenteeInstance int not null,
	MentorInstance int not null,
	CertificateID int not null,
	StopTime date,
	StartTime date,
	primary key (MenteeInstance,MentorInstance,CertificateID),
    constraint fk_MentorShip foreign key (MentorInstance,CertificateID) references TempCertificate (MechanicInstance,CertificateID),
    constraint fk_Mentee foreign key(MenteeInstance) references Mechanic (MechanicInstance)
);

CREATE TABLE IF NOT EXISTS Customer (
	CustomerID int not null primary key AUTO_INCREMENT,
	Phone varchar(12),
	Email varchar(30),
    Constraint UC_Customer UNIQUE (Phone,Email)
);

CREATE TABLE IF NOT EXISTS Address (
	CustomerID int not null,
    AddressType varchar(20),
	Street varchar(20),
    AddressNumber int,
    ZipCode int,
    PRIMARY KEY (customerID,AddressType),
	constraint fk_CustomerAddress foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS Corporation (
	CustomerID int not null primary key,
	CorpName varchar(20),
	constraint fk_CustomerIDCorp foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS Individual (
	CustomerID int not null primary key,
	FirstName varchar(20),
	LastName varchar(20),
	age int,
	constraint fk_CustomerIDIndividual foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS Contracted (
	CustomerID int not null primary key,
	DateJoined Year(4),
	constraint fk_ContractedCustomer foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS SteadyCustomer (
	CustomerID int not null primary key,
	LoyaltyPoints int,
	amountSpent Decimal(13,2),
	constraint fk_SteadyCustomerContracted foreign key (CustomerID) references Contracted (CustomerID)
);

CREATE TABLE IF NOT EXISTS PremiumCustomer (
	CustomerID int not null primary key,
	AnnualFee Decimal(13,2),
	constraint fk_PremiumCustomerID foreign key (CustomerID) references Contracted (CustomerID)
);

CREATE TABLE IF NOT EXISTS ProspectiveCustomer (
	CustomerID int not null primary key,
	ContractedID int not null,
	SpecialPromotion varchar(30),
	EmailsSent boolean,
	ReferralCode varchar(20),
	ReferralAwards varchar(100),
	referralAwardsUsed boolean,
	DateJoined Year(4),
	DeadProspective boolean not null default false,
	constraint fk_CustomerIDProspective foreign key (CustomerID) references Customer (CustomerID),
	constraint fk_ConstraintIDContracted foreign key (ContractedID) references Contracted (CustomerID)
);

CREATE TABLE IF NOT EXISTS MonthlyPayments (
	PaymentID int not null primary key auto_increment,
	ProspectiveID int,
	CustomerID int,
	DateBilled Date,
	PaymentMethods varchar(20),
	MonthlyCost Decimal(13,2),
	constraint fk_CustomerIDMonthly foreign key (CustomerID) references PremiumCustomer (CustomerID),
	constraint fk_ProspectiveIDMonthly foreign key (ProspectiveID) references ProspectiveCustomer (CustomerID),
	constraint uk_MonthlyBill unique (ProspectiveID, DateBilled)
);

CREATE TABLE IF NOT EXISTS VehicleCatalog (

	Make varchar(30) not null,
	Model varchar(30) not null,
	Year Year(4) not null,
	primary key (Make, Model, Year)
);

CREATE TABLE IF NOT EXISTS OwnedVehicle (
	VinNumber varchar(20) not null primary key,
	DateOwned Date,
	TotalMiles int,
	YearlyMileage int,
	RegisteredDate Date,
	LicenseNumber varchar(20),
	CustomerID int,
	Make varchar(30),
	Model varchar(30),
	Year Year(4),
	constraint fk_CatalogVehicle foreign key (Make, Model, Year) references VehicleCatalog (Make, Model, Year),
	constraint fk_CustomerVehicle foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS RepairOrder (
	RepairOrderID int not null primary key AUTO_INCREMENT,
	DateOrdered datetime,
	RepairDate datetime,
	VinNumbers varchar(20),
    ProspectiveID int,
    ServiceTechnicianInstance int,
    Constraint UC_RepairOrder UNIQUE (VinNumbers,DateOrdered),
	constraint fk_VehicleRepairOrders foreign key (VinNumbers) references OwnedVehicle (VinNumber),
	constraint fk_prospectivecustomerid foreign key(ProspectiveID) references ProspectiveCustomer(CustomerID),
    constraint fk_ServiceTechnicians foreign key(ServiceTechnicianInstance) references ServiceTechnician(ServiceTechnicianInstance)
);

CREATE TABLE IF NOT EXISTS ServiceItem (
	ServiceitemID int not null primary key AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS RepairLine (
	ServiceitemID int not null,
	RepairOrderID int not null,
    MechanicInstance int not null,
	primary key (ServiceitemID, RepairOrderID),
	constraint fk_ServiceRepairLines foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_OrderRepairLines foreign key (RepairOrderID) references RepairOrder (RepairOrderID),
	constraint fk_Mechanics foreign key(MechanicInstance) references Mechanic (MechanicInstance)
);

CREATE TABLE IF NOT EXISTS MaintenancePackage (
	MaintenancePackageID int not null primary key,
	PackageTitle varchar(50),
	cost Decimal(13,2) not null,
    Constraint UC_MaintenancePackage UNIQUE (PackageTitle),
	constraint fk_ServicePackage foreign key (MaintenancePackageID) references ServiceItem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS ServicePackageLine (
	ServiceitemID int not null,
	MaintenancePackageID int not null,
	primary key (ServiceitemID, MaintenancePackageID),
	constraint fk_PackageLineMaintainancePackage foreign key (MaintenancePackageID) references MaintenancePackage (MaintenancePackageID),
	constraint fk_PackageLineService foreign key (ServiceitemID) references ServiceItem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS IndividualService (
	ServiceitemID int not null primary key,
	Service varchar(30),
	Cost Decimal(13,2),
	CertificateNeeded int,
	Constraint UC_IndividualService UNIQUE (Service),
	constraint fk_ItemIndividualService foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_IndividualService_Certificate foreign key (CertificateNeeded) references Certificate (CertificateID)
);

CREATE TABLE IF NOT EXISTS Supplier(
	SupplierName varchar(50) primary key
);

CREATE TABLE IF NOT EXISTS PartCatalog (
	PartCatalogID int not null primary key AUTO_INCREMENT,
	PartName varchar(30),
	Cost Decimal(13,2),
    SupplierName varchar(50), 
	Constraint UC_EmployeeInstance UNIQUE (PartName,SupplierName),
    constraint fk_Supplier foreign key (SupplierName) references Supplier(SupplierName)
);

CREATE TABLE IF NOT EXISTS PartUsage (
	IndividualServiceID int not null,
	Make varchar(30) not null,
	Model varchar(30) not null,
	Year Year(4) not null,
	PartCatalogID int not null,
	Quantity int,
	primary key (IndividualServiceID, Make, Model, Year, PartCatalogID),
	constraint fk_IndividualServicePartUsage foreign key (IndividualServiceID) references IndividualService (ServiceitemID),
	constraint fk_PartCatalogPartUsage foreign key (PartCatalogID) references PartCatalog (PartCatalogID),
	constraint fk_VehicleCatalogPartUsage foreign key (Make, Model, Year) references VehicleCatalog (Make, Model, Year)
);

CREATE TABLE IF NOT EXISTS Holiday(
	holidayDay int not null,
	holidayMonth int not null,
	primary key (holidayDay,holidayMonth)
);

CREATE TABLE IF NOT EXISTS Email (
	MaintenancePackageID int,
    CustomerID int not null,
    SuggestedDate Date not null,
    Replied boolean default false,
    primary key (CustomerID, SuggestedDate),
    constraint fk_ServiceItemIDEmail foreign key (MaintenancePackageID) references MaintenancePackage (MaintenancePackageID),
    constraint fk_CustomerIDEmail foreign key (CustomerID) references Customer (CustomerID)
);
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (1,'Jimmy','Chao', '1111111111');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (2,'Eugene','Mesina', '1111111112');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (3,'Alex','Tol', '1111111113');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (4,'Daniel','Son', '1111111114');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (5,'John','smith', '1111111115');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (6,'Rick','Rickson', '1011111116');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (7,'Harambe','Bringer of Peace', '1777777777');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (8,'Jeff','Jefferson', '1111111117');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (9,'Steve','Stevens', '1111111118');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (10,'Derik','Derikson', '1111111119');

insert into Customer(CustomerID,Phone,email)#1
 values(1982,'710-562-2011','Bobsherman@hotmail.com');
insert into Customer(CustomerID,Phone,email)#2
 Values(003,'818-667-9479','ealonzo003@gmail.com');
insert into Customer(CustomerID,Phone,email)#3
 values(004,'911-911-9111','about4turtles@gmail.com');
insert into Customer(CustomerID,Phone,email)#4
 values(21, '010-021-1997','fake@Fakemail.com');
insert into Customer(CustomerID,Phone,email)#5
 values(57, '310-210-2879','rocker@hooner.com');
insert into Customer(CustomerID,Phone,email)#6
 values(5, '661-287-2882','about5@gmail.com');
insert into Customer(CustomerID,Phone,email)#7
 values(109, '182-283-2918','Customer@customermail.com');
insert into Customer(CustomerID,Phone,email)#8
 values(1021,'003-007-1021','Fighter@jet.com');
insert into Customer(CustomerID,Phone,email)#9
 values(1291,'021-427-1231','Matt@Matt.com');
 insert into Customer(CustomerID,Phone,email)#10
 values(1287,'153-237-2411','Damn@Daniel.com');
insert into Customer(CustomerID,Phone,email)#11
 Values(1889,'298-631-4416','Funny003@bmail.com');
insert into Customer(CustomerID,Phone,email)#12
 values(1738,'999-999-9345','daadwadurtles@fmail.com');
insert into Customer(CustomerID,Phone,email)#13
 values(1395, '123-231-1231','Wdae@dmail.com');
 
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(1982,'home','Wew St.',124,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(003,'home','feel St',522,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(004,'home','zero St.',134,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(21,'home','fronge St',4202,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(57,'home','Wew AV.',125,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(5,'home','Noice Lane',627,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(109,'home','Colombus Ave.',184,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(1021,'home','cat St',5444,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(1291,'Coporate HQ','Gold way.',1812,11111);
 insert into Address(CustomerID,AddressType,Street,AddressNumber,ZipCode)
 values(1287,'Corporate HQ','Silver St',0011,11111);
 
insert into VehicleCatalog(Make,Model, Year)#1
values('Challenger','Mk2',1998);
insert into VehicleCatalog(Make,Model, Year)#2
values('Nissan','370z',2016);
insert into VehicleCatalog(Make,Model, Year)#3
values('Subaru','BRZ',2016);
insert into VehicleCatalog(Make,Model, Year)#4
values('Mazda','MX-5',2016);
insert into VehicleCatalog(Make,Model, Year)#5
values('Mazda','Rx-7',1998);
insert into VehicleCatalog(Make,Model, Year)#6
values('Ford','GT',2013);
insert into VehicleCatalog(Make,Model, Year)#7
values('Dodge','Hellcat',2015);
insert into VehicleCatalog(Make,Model, Year)#8
values('Toyota','AE86',1983);
insert into VehicleCatalog(Make,Model, Year)#9
values('Toyota','Supra',1992);
insert into VehicleCatalog(Make,Model, Year)#10
values('Acura','NSX',2016);
insert into VehicleCatalog(Make,Model, Year)#11
values('DanielSon','CardboardBox',1928);

insert into Contracted (CustomerID, DateJoined)
values (1982,'2000');
insert into Contracted (CustomerID, DateJoined)
values (003,'2001');
insert into Contracted (CustomerID, DateJoined)
values (004,'2005');
insert into Contracted (CustomerID, DateJoined)
values (21,'2010');
insert into Contracted (CustomerID, DateJoined)
values (57,'2004');
insert into Contracted (CustomerID, DateJoined)
values (5,'2004');
insert into Contracted (CustomerID, DateJoined)
values (1291,'2011');
insert into Contracted (CustomerID, DateJoined)
values (1287,'1999');

insert into ProspectiveCustomer (CustomerID,ContractedID,SpecialPromotion,EmailsSent,ReferralCode,ReferralAwards,referralAwardsUsed, DateJoined)
values (109,003,'free oil change',true,'1234','50 dollars off next purchase',false, '2012');
insert into ProspectiveCustomer (CustomerID,ContractedID,SpecialPromotion,EmailsSent,ReferralCode,ReferralAwards,referralAwardsUsed, DateJoined, DeadProspective)
values (1021,004,'free oil change',true,'1236','60 dollars off next purchase',false, '2013', true);

insert into PremiumCustomer(CustomerID, AnnualFee)
values (1291, 1000000);
insert into PremiumCustomer(CustomerID, AnnualFee)
values (1287, 1000000);


insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(1982,50,69);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(003,100,619);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(004,99,2600);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(21,0,2000);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(57,420,500);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(5,69,6900);


insert into MonthlyPayments(PaymentID, ProspectiveID, CustomerID, DateBilled, PaymentMethods,MonthlyCost)
values (1,null,1291,'2016-01-01','wire',100000), (2,null,1291,'2016-02-01','wire',100000),(3,null,1287,'2016-01-01','wire',100000), (4,null,1287,'2016-02-01','wire',100000);

insert into Corporation(CustomerID,CorpName)
values (1291,'Salt Miners LTD.'),(1287,'Bank of Salt');

insert into Individual(CustomerID,FirstName,LastName, age)
values(1982,'Tops','Kekman',30),(003,'Jimmy','Rustleford',80),(004,'Rusty','Shackleford', 24),(21,'Cat','Fishman', 34),(57,'Mr','Mrson', 54),(5,'Snoopo','Doggo',69),(109,'Kelly','Keller',90),(1021,'Bannana','Man',20);

insert into EmploymentTime(DateRetired,DateEmployed,EmployeeID)
values(null,'1990-02-13',1),(null,'1990-02-13',2),('2002-02-14','1990-02-13',3),(null,'1990-02-13',4),(null,'1990-02-13',5),(null,'1990-02-13',6),(null,'1990-02-13',7),(null,'1990-02-13',8),(null,'1990-02-13',9),(null,'1990-02-13',10),(null,'2002-02-14',3);

insert into ServiceTechnician(EmploymentField,ServiceTechnicianInstance)
values('Diagnostics',8),('Diagnostics',9),('Diagnostics',10),('Diagnostics',11);

insert into Mechanic(EmploymentField,MechanicInstance)
values ('Engine repair',1),('Engine repair',2),('Maintenance',3),('Maintenance',4),('Body repair',5),('Electrical repair',6),('Chasis repair',7);

insert into Supplier (SupplierName)
values ('Alex Salty Auto Supply');
insert into Supplier (SupplierName)
values ('The Auto Lads');
insert into Supplier (SupplierName)
values ('Dank Souls');
insert into Supplier (SupplierName)
values ('Weebs are US');
insert into Supplier (SupplierName)
values ('Hi Tech');
insert into Supplier (SupplierName)
values ('We are Auto');
insert into Supplier (SupplierName)
values ('Fancy Auto Parts');
insert into Supplier (SupplierName)
values ('Happy Cars');
insert into Supplier (SupplierName)
values ('I Like Supplying');
insert into Supplier (SupplierName)
values ('GIT GUD');


insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(1,'oil filter',6.99,'Alex Salty Auto Supply');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(2,'oil',17.99,'Alex Salty Auto Supply');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(3,'Tires',99.99,'Weebs are US');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(4,'Rims',99.99,'Happy Cars');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(5,'BreakPads',25.99,'GIT GUD');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(6,'Air Filters',29.99,'Hi Tech');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(7,'WindShield Wipers',25.99,'Hi Tech');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(8,'Wheels',199.99,'The Auto Lads');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(9,'Fuel Filters',31.99,'The Auto Lads');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(10,'Air Intake',44.99,'Fancy Auto Parts');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(11,'Timing Belts',16.99,'Fancy Auto Parts');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(12,'suspension', 149.99,'Dank Souls');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(13,'Fuse',2.99,'Dank Souls');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(14,'bolts',2.99,'Dank Souls');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(15,'Battery',209.99,'Fancy Auto Parts');
insert into PartCatalog(PartCatalogID,PartName,Cost,SupplierName)
values(16,'Wind Shield',999.99,'We are Auto');

insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(1,1,'oil change');	
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(2,1,'oil filter change');	
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(3,1,'Air Filter Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(4,3,'Belt Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(5,2,'Tire Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(6,2,'Break Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(7,2,'Rim Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(8,1,'Wind Shield Wipers Replacement');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(9,2,'Battery Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(10,3,'Suspensension Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(11,2,'Spark Plug Change');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(12,3,'Air Intake');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(13,3,'Windshield Replacement');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values(14,4,'belt repair');
insert into Certificate(CertificateID,CertificateLevel,ServiceType)
values (15,3,'wheel change');

insert into TempCertificate(MechanicInstance,CertificateID) 
values(1,1),(1,2),(1,5),(1,8),(1,12),(1,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(2,3),(2,9),(2,10),(2,11),(2,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(3,1),(3,2),(3,5),(3,7),(3,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(4,3),(4,5),(4,6),(4,12),(4,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(5,1),(5,2),(5,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(6,10),(6,11),(6,12),(6,14);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(7,1),(7,2),(7,3),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14);



insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (3,6,10,'2007-10-07','2007-12-7');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (2,1,5,'2007-04-17','2007-08-29');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (2,4,6,'2007-08-30','2008-02-05');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (1,4,6,'2006-03-01','2006-04-29');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (3,4,12,'2006-03-01','2006-04-29');

insert into ServiceItem(ServiceitemID)
values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25);

insert into MaintenancePackage(MaintenancePackageID,PackageTitle, Cost)
values(1, 'Oil change package', 60.00),(2, 'Tire change package', 65.00),(3, 'Air Filter Change Package', 100.00),(4, 'Suspension Change Package', 500.00),
(5, 'Wheel Change Package', 60.00),(6, 'Battery change package', 225.00),(7, 'deluxe oil change package', 100.00),(8, 'Fuse change package', 60.00),
(9, 'Belt change package', 300.00),(10, 'Break change package', 200.00),(11, 'WindShield change package', 300.00);

insert into IndividualService(ServiceItemID,Service,Cost,CertificateNeeded)
values (12,'change oil', 50.55,1),(13,'change oil filter', 100.55,2),(14,'change tire', 50.55,5)
,(15,'change air filter', 95.55,3),(16,'fix air intake', 150.55,12),(17,'break change', 150.55,6)
,(18,'change rim', 250.55,7),(19,'repair windshield wipers', 80.55,8), (20,'replace battery', 200.55,9)
,(21,'change suspension', 450.55,10),(22,'change spark plug', 50.55,11),(23,'replace windshield', 250.55,13),(24,'replace belt', 250.55,14)
,(25,'change wheel', 50.55,15);


insert into ServicePackageLine(ServiceItemID,MaintenancePackageID)
values (12,1),(13,1),(14,2),(12,2),(15,3),(12,3),(14,4),(21,4),(14,5),(17,5),(20,6),(12,6),(1,7),(15,7)
,(12,8),(22,8),(12,9),(24,9),(12,10),(17,10),(23,11),(19,11);


insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#1 goes to 2
values (12,'Challenger','Mk2',1998,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Nissan','370z',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Subaru','BRZ',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Mazda','MX-5',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Mazda','Rx-7',1998,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Ford','GT',2013,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Dodge','Hellcat',2015,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Toyota','AE86',1983,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Toyota','Supra',1992,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'Acura','NSX',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (12,'DanielSon','CardboardBox',1928,2,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#2 goes to 3
values (14,'Challenger','Mk2',1998,3,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Nissan','370z',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Subaru','BRZ',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Mazda','MX-5',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Mazda','Rx-7',1998,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Ford','GT',2013,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Dodge','Hellcat',2015,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Toyota','AE86',1983,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Toyota','Supra',1992,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'Acura','NSX',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (14,'DanielSon','CardboardBox',1928,3,3);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#3 goes to 6
values (15,'Challenger','Mk2',1998,6,2);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Nissan','370z',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Subaru','BRZ',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Mazda','MX-5',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Mazda','Rx-7',1998,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Ford','GT',2013,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Dodge','Hellcat',2015,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Toyota','AE86',1983,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Toyota','Supra',1992,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'Acura','NSX',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (15,'DanielSon','CardboardBox',1928,6,5);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#4 goes to 12
values (21,'Challenger','Mk2',1998,12,6);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Nissan','370z',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Subaru','BRZ',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Mazda','MX-5',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Mazda','Rx-7',1998,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Ford','GT',2013,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Dodge','Hellcat',2015,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Toyota','AE86',1983,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Toyota','Supra',1992,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'Acura','NSX',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (21,'DanielSon','CardboardBox',1928,12,10);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#5 goes to 8
values (25,'Challenger','Mk2',1998,8,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Nissan','370z',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Subaru','BRZ',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Mazda','MX-5',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Mazda','Rx-7',1998,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Ford','GT',2013,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Dodge','Hellcat',2015,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Toyota','AE86',1983,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Toyota','Supra',1992,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'Acura','NSX',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (25,'DanielSon','CardboardBox',1928,8,10);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#6 goes to 15
values (20,'Challenger','Mk2',1998,15,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Nissan','370z',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Subaru','BRZ',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Mazda','MX-5',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Mazda','Rx-7',1998,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Ford','GT',2013,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Dodge','Hellcat',2015,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Toyota','AE86',1983,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Toyota','Supra',1992,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'Acura','NSX',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (20,'DanielSon','CardboardBox',1928,15,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#7 goes to 1
values (13,'Challenger','Mk2',1998,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Nissan','370z',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Subaru','BRZ',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Mazda','MX-5',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Mazda','Rx-7',1998,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Ford','GT',2013,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Dodge','Hellcat',2015,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Toyota','AE86',1983,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Toyota','Supra',1992,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'Acura','NSX',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (13,'DanielSon','CardboardBox',1928,1,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#8 goes to 13
values (22,'Challenger','Mk2',1998,13,16);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Nissan','370z',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Subaru','BRZ',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Mazda','MX-5',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Mazda','Rx-7',1998,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Ford','GT',2013,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Dodge','Hellcat',2015,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Toyota','AE86',1983,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Toyota','Supra',1992,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'Acura','NSX',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (22,'DanielSon','CardboardBox',1928,13,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#9 goes to 11
values (24,'Challenger','Mk2',1998,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Nissan','370z',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Subaru','BRZ',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Mazda','MX-5',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Mazda','Rx-7',1998,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Ford','GT',2013,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Dodge','Hellcat',2015,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Toyota','AE86',1983,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Toyota','Supra',1992,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'Acura','NSX',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (24,'DanielSon','CardboardBox',1928,11,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#10 goes to 5
values (17,'Challenger','Mk2',1998,5,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Nissan','370z',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Subaru','BRZ',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Mazda','MX-5',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Mazda','Rx-7',1998,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Ford','GT',2013,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Dodge','Hellcat',2015,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Toyota','AE86',1983,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Toyota','Supra',1992,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'Acura','NSX',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (17,'DanielSon','CardboardBox',1928,5,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#11 goes to 16
values (23,'Challenger','Mk2',1998,16,0);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Nissan','370z',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Subaru','BRZ',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Mazda','MX-5',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Mazda','Rx-7',1998,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Ford','GT',2013,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Dodge','Hellcat',2015,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Toyota','AE86',1983,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (23,'Toyota','Supra',1992,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
 values (23,'Acura','NSX',2016,16,1);
 insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
 values (23,'DanielSon','CardboardBox',1928,16,0);

insert into Holiday(holidayDay, holidayMonth)
values (31,12),(25,12),(25,11),(24,11),(11,11),(10,10),(5,9),(4,7),(19,6),(30,5),(8,5),(15,4),(15,2),
(18,1),(1,1);

insert into OwnedVehicle (VinNumber,DateOwned,TotalMiles,YearlyMileage,RegisteredDate,LicenseNumber,CustomerID,Make,Model,Year)
values (1,'2005-05-05',9001,1200,'2005-05-05',1,1982,'Challenger','Mk2',1998),
(2,'2016-05-05',9001,1200,'2016-05-05',2,003,'Nissan','370z',2016),
(3,'2016-12-17',9001,1200,'2016-12-17',3,004,'Subaru','BRZ',2016),
(4,'2015-4-19',9001,1200,'2015-4-19',4,21,'Mazda','MX-5',2016),
(5,'2008-4-19',9001,1200,'2008-4-19',5,57,'Mazda','Rx-7',1998),
(6,'2014-05-05',9001,1200,'2014-05-05',6,5,'Ford','GT',2013),
(7,'2015-05-05',9001,1200,'2015-05-05',7,109,'Dodge','Hellcat',2015),
(8,'2015-10-17',9001,1200,'2015-10-17',8,1021,'Toyota','AE86',1983),
(9,'2015-6-19',9001,1200,'2015-6-19',9,1291,'Toyota','Supra',1992),
(10,'2004-4-19',9001,1200,'2004-4-19',10,1287,'DanielSon','CardboardBox',1928);
insert into OwnedVehicle (VinNumber,DateOwned,TotalMiles,YearlyMileage,RegisteredDate,LicenseNumber,CustomerID,Make,Model,Year)
values(11,'2016-12-17',9001,1200,'2016-12-17',3,004,'Subaru','BRZ',2016),
(12,'2016-12-17',9001,1200,'2016-12-17',3,004,'Subaru','BRZ',2016),
(13,'2016-12-17',9001,1200,'2016-12-17',3,004,'Subaru','BRZ',2016);



insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ProspectiveID,ServiceTechnicianInstance )
values(1,  '2001-3-1','2001-3-8',2,109,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ProspectiveID,ServiceTechnicianInstance )
values(2,  '2005-3-14','2005-3-27',3,1021,10);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(3,  '2001-3-1',  '2001-4-8', 1,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(4,  '2001-7-1',  '2001-8-8', 1,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(5,  '2010-3-1',  '2010-4-8', 4,10);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(6,  '2011-3-1',  '2011-3-8', 4,10);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(7,  '2012-3-1',  '2012-4-8', 4,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(8,  '2004-4-1',  '2004-8-8', 5,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(9,  '2004-5-1',  '2004-5-8', 6,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(10,  '2011-6-1',  '2011-6-8', 7,10);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(11,  '2012-6-1',  '2012-6-8', 7,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(12,  '2013-6-1',  '2013-6-8', 7,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(13,  '1999-6-1',  '1999-6-8', 8,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(14,  '2013-7-1',  '2013-7-8', 9,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(15, '2013-7-1',  '2013-7-8', 10,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(16, '2014-7-1',  '2014-7-8', 10,10);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(17,  '2015-7-1',  '2015-7-8', 11,9);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(18, '2015-3-1',  '2015-3-21', 12,8);
insert into RepairOrder(RepairOrderID,DateOrdered,RepairDate,VinNumbers,ServiceTechnicianInstance )
values(19, '2015-1-1',  '2015-1-21', 13,10);



insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(12,1 ,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(1,2 ,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(14,3 ,3);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(1,4 ,3);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(15,5 ,2);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(1,6 ,5);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(13,7 ,5);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(16,8 ,6);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(1,9 ,7);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(24,10,4);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(22,11,6);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(21,12,7);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(1,13,7);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(19,14,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(17,15,4);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(13,16,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(13,17,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(13,18,1);
insert into RepairLine(ServiceitemID,RepairOrderID,MechanicInstance)
value(13,19,1);

insert into Email (MaintenancePackageID, CustomerID, SuggestedDate)
values (1, 109, '2015-01-01'),(1, 109, '2015-05-01'),(3, 1021, '2014-03-01'),(2, 1021, '2016-01-01'),
(3, 1021, '2015-04-01'),(3, 1021, '2016-05-01'),(3, 1021, '2016-05-02');