
#The insert statements used to populate the tables

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
values (6,'Rick','Rickson', '1111111116');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (7,'Harambe','Bringer of Peace', '7777777777');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (8,'Jeff','Jefferson', '1111111117');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (9,'Steve','Stevens', '1111111118');
insert into Employee(EmployeeID, EFirstName, ELastName, Phone)
values (10,'Derik','Derikson', '1111111119');


insert into Customer(CustomerID,Phone,email)#1
 values(1982,710-562-2011,'Bobsherman@hotmail.com');
insert into Customer(CustomerID,Phone,email)#2
 Values(003,818-667-9479,'ealonzo003@gmail.com');
insert into Customer(CustomerID,Phone,email)#3
 values(004,911-911-9111,'about4turtles@gmail.com');
insert into Customer(CustomerID,Phone,email)#4
 values(21, 010-021-1997,'fake@Fakemail.com');
insert into Customer(CustomerID,Phone,email)#5
 values(57, 310-210-2879,'rocker@hooner.com');
insert into Customer(CustomerID,Phone,email)#6
 values(5, 661-287-2882,'about5@gmail.com');
insert into Customer(CustomerID,Phone,email)#7
 values(109, 182-283-2918,'Customer@customermail.com');
insert into Customer(CustomerID,Phone,email)#8
 values(1021,003-007-1021,'Fighter@jet.com');
insert into Customer(CustomerID,Phone,email)#9
 values(1291,021-427-1231,'Matt@Matt.com');
 insert into Customer(CustomerID,Phone,email)#10
 values(1287,2153-237-2411,'Damn@Daniel.com');
 
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
values('Mazda','MX-5',2018);
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
values('Acura','NSX',2018);
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
insert into ProspectiveCustomer (CustomerID,ContractedID,SpecialPromotion,EmailsSent,ReferralCode,ReferralAwards,referralAwardsUsed, DateJoined)
values (1021,004,'free oil change',true,'1236','60 dollars off next purchase',false, '2013');

insert into PremiumCustomer(CustomerID, AnnualFee)
values (1291, 1000000);
insert into PremiumCustomer(CustomerID, AnnualFee)
values (1287, 1000000);


insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(1982,0,69);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(003,0,619);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(004,0,2600);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(21,0,2000);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(57,0,500);
insert into SteadyCustomer(CustomerID,LoyaltyPoints,amountSpent)
values(5,0,6900);


insert into MonthlyPayments(PaymentID, ProspectiveID, CustomerID, DateBilled, PaymentMethods,MonthlyCost)
values (1,null,1291,'2016-01-01','wire',100000), (2,null,1291,'2016-02-01','wire',100000),(3,null,1287,'2016-01-01','wire',100000), (4,null,1287,'2016-02-01','wire',100000);

insert into Corporation(CustomerID,CorpName)
values (1291,'Salt Miners LTD.'),(1287,'Bank of Salt');

insert into Individual(CustomerID,FirstName,LastName)
values(1982,'Tops','Kekman'),(003,'Jimmy','Rustleford'),(004,'Rusty','Shackleford'),(21,'Cat','Fishman'),(57,'Mr','Mrson'),(5,'Snoopo','Doggo'),(109,'Kelly','Keller'),(1021,'Bannana','Man');

insert into EmploymentTime(DateRetired,DateEmployed,EmployeeID)
values(null,'2006-02-13',1),(null,'2006-02-13',2),(null,'2006-02-13',3),(null,'2006-02-13',4),(null,'2006-02-13',5),(null,'2006-02-13',6),(null,'2006-02-13',7),(null,'2006-02-13',8),(null,'2006-02-13',9),(null,'2006-02-13',10);

insert into ServiceTechnician(EmploymentField,ServiceTechnicianInstance)
values('Diagnostics',8),('Diagnostics',9),('Diagnostics',10);

insert into Mechanic(EmploymentField,MechanicInstance)
values ('Engine repair',1),('Engine repair',2),('Maintenance',3),('Maintenance',4),('Body repair',5),('Electrical repair',6),('Chasis repair',7);

insert into PartCatalog(PartCatalogID,PartName,Cost)
values(1,'oil filter',6.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(2,'oil',17.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(3,'Tires',99.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(4,'Rims',99.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(5,'BreakPads',25.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(6,'Air Filters',29.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(7,'WindShield Wipers',25.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(8,'Spark Plug',10.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(9,'Fuel Filters',31.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(10,'Air Intake',44.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(11,'Timing Belts',16.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(12,'coilovers', 149.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(13,'Fuse',2.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(14,'bolts',2.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(15,'Battery',209.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(16,'Wind Shield',999.99);

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


insert into TempCertificate(MechanicInstance,CertificateID) 
values(1,1),(1,2),(1,5),(1,8),(1,12);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(2,3),(2,9),(2,10),(2,11);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(3,1),(3,2),(3,5),(3,7);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(4,3),(4,5),(4,6),(4,12);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(5,1),(5,2);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(6,10),(6,11),(6,12);
insert into TempCertificate(MechanicInstance,CertificateID) 
values(7,1),(7,2),(7,3),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13);

insert into ServiceItem(ServiceitemID)
values(1);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(1, 'Oil change package');
insert into ServiceItem(ServiceitemID)
values(2);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(2, 'Tire change package');
insert into ServiceItem(ServiceitemID)
values(3);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(3, 'Air Filter Change Package');
insert into ServiceItem(ServiceitemID)
values(4);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(4, 'Suspension Change Package');
insert into ServiceItem(ServiceitemID)
values(5);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(5, 'Wheel Change Package');
insert into ServiceItem(ServiceitemID)
values(6);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(6, 'Battery change package');
insert into ServiceItem(ServiceitemID)
values(7);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(7, 'oil filter change package');
insert into ServiceItem(ServiceitemID)
values(8);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(8, 'Fuse change package');
insert into ServiceItem(ServiceitemID)
values(9);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(9, 'Belt change package');
insert into ServiceItem(ServiceitemID)
values(10);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(10, 'Break change package');
insert into ServiceItem(ServiceitemID)
values(11);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(11, 'WindShield change package');


insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (3,6,10,'2007-10-07','2007-12-7');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (2,1,5,'2007-04-17','2007-08-29');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (2,4,6,'2007-08-30','2008-02-05');
insert into MentorShip(MenteeInstance,MentorInstance,CertificateID,StartTime,StopTime) 
values (1,4,6,'2006-03-01','2006-04-29');

insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(1, 'Oil change', 24.99, 1);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(2, 'Tire change', 109.99, 5);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(3, 'Air Filter change', 19.99, 3);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(4, 'Suspension Replacement', 849.99, 10);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(5, 'Wheel(Rim) Change', 499.99, 7);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(6, 'Battery Replacement', 74.99, 9);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(7, 'Oil Filter Change', 9.99, 2);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(8, 'Fuse/Spark Change', 9.99, 11);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(9, 'Belt Change', 29.99, 4);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(10, 'Break Change', 149.99, 6);
insert into IndividualService(ServiceitemID,Service,Cost,CertificateNeeded)
values(11, 'WindShield Replacement', 799.99, 13);
