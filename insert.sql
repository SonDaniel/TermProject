
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
insert into customer(CustomerID,Phone,email)#8
 values(1021,003-007-1021,'Fighter@jet.com');
insert into customer(CustomerID,Phone,email)#9
 values(1291,021-427-1231,'Matt@Matt.com');
 insert into customer(CustomerID,Phone,email)#10
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
values('DanielSon','CardboardBox',3000);

insert into Contracted (CustomerID)
values (1982);
insert into Contracted (CustomerID)
values (003);
insert into Contracted (CustomerID)
values (004);
insert into Contracted (CustomerID)
values (21);
insert into Contracted (CustomerID)
values (57);
insert into Contracted (CustomerID)
values (5);
insert into Contracted (CustomerID)
values (1291);
insert into Contracted (CustomerID)
values (1287);


insert into ProspectiveCustomer (CustomerID,ContractedID,SpecialPromotion,EmailsSent,ReferralCode,ReferralAwards,referralAwardsUsed)
values (109,003,'free oil change',true,'1234','50 dollars off next purchase',false);
insert into ProspectiveCustomer (CustomerID,ContractedID,SpecialPromotion,EmailsSent,ReferralCode,ReferralAwards,referralAwardsUsed)
values (1021,004,'free oil change',true,'1236','60 dollars off next purchase',false);

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
values (1,null,1291,'1/1/2016','wire',100000), (2,null,1291,'2/1/2016','wire',100000),(3,null,1287,'1/1/2016','wire',100000), (4,null,1287,'2/1/2016','wire',100000);

insert into Coporation(CustomerID,CorpName)
values (1291,'Salt Miners LTD.'),(1287,'Bank of Salt');

insert into Individual(CustomerID,FirstName,LastName)
values(1982,'Tops','Kekman'),(003,'Jimmy','Rustleford'),(004,'Rusty','Shackleford'),(21,'Cat','Fishman'),(57,'Mr','Mrson'),(5,'Snoopo','Doggo'),(109,'Kelly','Keller'),(1021,'Bannana','Man');

insert into EmploymentTime(DateRetired,DateEmployed,EmployeeID)
values(null,'2/13/2006',1),(null,'2/13/2006',2),(null,'2/13/2006',3),(null,'2/13/2006',4),(null,'2/13/2006',5),(null,'2/13/2006',6),(null,'2/13/2006',7),(null,'2/13/2006',8),(null,'2/13/2006',9),(null,'2/13/2006',10);

insert into ServiceTechnician(EmploymentField,ServiceTechnicianInstance)
values('Diagnostics',8),('Diagnostics',9),('Diagnostics',10);

insert into Mechanic(EmploymentField,ServiceTechnicianInstance)
values ('Engine repair',1),('Engine repair',2),('Maintenance',3),('Maintenance',4),('Body repair',5),('Electrical repair',6),('Chasis repair',7)



