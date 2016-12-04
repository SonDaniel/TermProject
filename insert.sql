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
values(8,'Wheels',199.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(9,'Fuel Filters',31.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(10,'Air Intake',44.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(11,'Timing Belts',16.99);
insert into PartCatalog(PartCatalogID,PartName,Cost)
values(12,'suspension', 149.99);
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

insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#1 goes to 2
values (1,'Challenger','Mk2',1998,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Nissan','370z',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Subaru','BRZ',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Mazda','MX-5',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Mazda','Rx-7',1998,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Ford','GT',2013,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Dodge','Hellcat',2015,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Toyota','AE86',1983,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Toyota','Supra',1992,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'Acura','NSX',2016,2,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (1,'DanielSon','CardboardBox',1928,2,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#2 goes to 3
values (2,'Challenger','Mk2',1998,3,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Nissan','370z',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Subaru','BRZ',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Mazda','MX-5',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Mazda','Rx-7',1998,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Ford','GT',2013,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Dodge','Hellcat',2015,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Toyota','AE86',1983,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Toyota','Supra',1992,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'Acura','NSX',2016,3,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (2,'DanielSon','CardboardBox',1928,3,3);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#3 goes to 6
values (3,'Challenger','Mk2',1998,6,2);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Nissan','370z',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Subaru','BRZ',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Mazda','MX-5',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Mazda','Rx-7',1998,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Ford','GT',2013,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Dodge','Hellcat',2015,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Toyota','AE86',1983,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Toyota','Supra',1992,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'Acura','NSX',2016,6,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (3,'DanielSon','CardboardBox',1928,6,5);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#4 goes to 12
values (4,'Challenger','Mk2',1998,12,6);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Nissan','370z',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Subaru','BRZ',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Mazda','MX-5',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Mazda','Rx-7',1998,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Ford','GT',2013,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Dodge','Hellcat',2015,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Toyota','AE86',1983,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Toyota','Supra',1992,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'Acura','NSX',2016,12,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (4,'DanielSon','CardboardBox',1928,12,10);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#5 goes to 8
values (5,'Challenger','Mk2',1998,8,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Nissan','370z',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Subaru','BRZ',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Mazda','MX-5',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Mazda','Rx-7',1998,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Ford','GT',2013,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Dodge','Hellcat',2015,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Toyota','AE86',1983,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Toyota','Supra',1992,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'Acura','NSX',2016,8,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (5,'DanielSon','CardboardBox',1928,8,10);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#6 goes to 15
values (6,'Challenger','Mk2',1998,15,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Nissan','370z',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Subaru','BRZ',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Mazda','MX-5',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Mazda','Rx-7',1998,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Ford','GT',2013,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Dodge','Hellcat',2015,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Toyota','AE86',1983,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Toyota','Supra',1992,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'Acura','NSX',2016,15,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (6,'DanielSon','CardboardBox',1928,15,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#7 goes to 1
values (7,'Challenger','Mk2',1998,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Nissan','370z',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Subaru','BRZ',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Mazda','MX-5',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Mazda','Rx-7',1998,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Ford','GT',2013,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Dodge','Hellcat',2015,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Toyota','AE86',1983,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Toyota','Supra',1992,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'Acura','NSX',2016,1,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (7,'DanielSon','CardboardBox',1928,1,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#8 goes to 13
values (8,'Challenger','Mk2',1998,13,16);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Nissan','370z',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Subaru','BRZ',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Mazda','MX-5',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Mazda','Rx-7',1998,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Ford','GT',2013,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Dodge','Hellcat',2015,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Toyota','AE86',1983,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Toyota','Supra',1992,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'Acura','NSX',2016,13,8);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (8,'DanielSon','CardboardBox',1928,13,0);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#9 goes to 11
values (9,'Challenger','Mk2',1998,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Nissan','370z',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Subaru','BRZ',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Mazda','MX-5',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Mazda','Rx-7',1998,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Ford','GT',2013,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Dodge','Hellcat',2015,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Toyota','AE86',1983,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Toyota','Supra',1992,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'Acura','NSX',2016,11,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (9,'DanielSon','CardboardBox',1928,11,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#10 goes to 5
values (10,'Challenger','Mk2',1998,5,10);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Nissan','370z',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Subaru','BRZ',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Mazda','MX-5',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Mazda','Rx-7',1998,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Ford','GT',2013,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Dodge','Hellcat',2015,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Toyota','AE86',1983,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Toyota','Supra',1992,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'Acura','NSX',2016,5,4);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (10,'DanielSon','CardboardBox',1928,5,2);
#______________________________________#
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)#11 goes to 16
values (11,'Challenger','Mk2',1998,16,0);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Nissan','370z',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Subaru','BRZ',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Mazda','MX-5',2016,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Mazda','Rx-7',1998,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Ford','GT',2013,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Dodge','Hellcat',2015,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Toyota','AE86',1983,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
values (11,'Toyota','Supra',1992,16,1);
insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
 values (11,'Acura','NSX',2016,16,1);
 insert into PartUsage(IndividualServiceID,Make,Model,Year, PartCatalogID,Quantity)
 values (11,'DanielSon','CardboardBox',1928,16,0);

insert into HOLIDAY(holidayDay, holidayMonth)
insert (31,12),(25,12),(25,11),(24,11),(11,11),(10,10),(5,9),(4,7),(19,6),(30,5),(8,5),(15,4),(15,2),
(18,1),(1,1);


insert into ServiceItem(ServiceitemID)
values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23);
insert into MaintenancePackage(ServiceitemID,PackageTitle)
values(1, 'Oil change package'),(2, 'Tire change package'),(3, 'Air Filter Change Package'),(4, 'Suspension Change Package'),
(5, 'Wheel Change Package'),(6, 'Battery change package'),(7, 'deluxe oil change package'),(8, 'Fuse change package'),
(9, 'Belt change package'),(10, 'Break change package'),(11, 'WindShield change package');

insert into IndividualService(ServiceItemID,Service,Cost,CertificateNeeded)
values (12,'change oil', 50.55,1),(13,'change oil filter', 100.55,2),(14,'change tire', 50.55,5)
,(15,'change air filter', 95.55,3),(16,'fix air intake', 150.55,12),(17,'break change', 150.55,6)
,(18,'change rim', 250.55,7),(19,'repair windshield wipers', 80.55,8), (20,'replace battery', 200.55,9)
,(21,'change suspension', 450.55,10),(22,'change spark plug', 50.55,11),(23,'replace windshield', 250.55,13),(24,'replace windshield', 250.55,14);

insert into OwnedVehicle (VinNumber,DateOwned,TotalMiles,YearlyMileage,RegisteredDate,LicenseNumber,CustomerID,Make,Model,Year)
values (1,'2005-05-05',9001,1200,'2005-05-05',1,1982,'Challenger','Mk2',1998),
(2,'2016-05-05',9001,1200,'2016-05-05',2,003,'Nissan','370z',2016),
(3,'2016-12-17',9001,1200,'2016-12-17',3,004,'Subaru','BRZ',2016),
(4,'2015-4-19',9001,1200,'2015-4-19',4,21,'Mazda','MX-5',2018),
(5,'2008-4-19',9001,1200,'2008-4-19',5,57,'Mazda','Rx-7',1998),
(6,'2014-05-05',9001,1200,'2014-05-05',6,5,'Ford','GT',2013),
(7,'2015-05-05',9001,1200,'2015-05-05',7,109,'Dodge','Hellcat',2015),
(8,'2015-10-17',9001,1200,'2015-10-17',8,1021,'Toyota','AE86',1983),
(9,'2015-6-19',9001,1200,'2015-6-19',9,1291,'Toyota','Supra',1992),
(10,'2004-4-19',9001,1200,'2004-4-19',10,1287,'DanielSon','CardboardBox',1928);


insert into ServicePackageLine(ServiceItemID,MaintenancePackageID)
values (12,1),(13,1),(14,2),(12,2),(15,3),(12,3),(14,4),(21,4),(14,5),(17,5),(20,6),(12,6),(1,7),(15,7)
,(12,8),(22,8),(12,9),(24,9),(12,10),(17,10),(23,11),(19,11)

