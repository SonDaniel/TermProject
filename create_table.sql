#SQL file to create tables
CREATE TABLE IF NOT EXISTS Customer (
	CustomerID int not null primary key AUTO_INCREMENT,
	Phone varchar(11),
	loyaltyPoints int,
	Email varchar(30)
	
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
	#need total Order,
	VinNumber varchar(20),
	constraint fk_VehicleRepairOrder foreign key (VinNumber) references OwnedVehicle (VinNumber)
);

CREATE TABLE IF NOT EXISTS ServiceItem (
	ServiceitemID int not null primary key AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS RepairLine (
	ServiceitemID int not null,
	RepairOrderID int not null,
	# need subcost
	primary key (ServiceitemID, RepairOrderID),
	constraint fk_ServiceRepairLine foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_OrderRepairLine foreign key (RepairOrderID) references RepairOrder (RepairOrderID)
);

CREATE TABLE IF NOT EXISTS MaintenancePackage (
	ServiceitemID int not null primary key,
	PackageTitle varchar(20),
	constraint fk_ServicePackage foreign key (ServiceitemID) references ServiceItem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS ServicePackageLine (
	ServiceitemID int not null,
	MaintainancePackageID int not null,
	primary key (ServiceitemID, MaintainancePackageID),
	constraint fk_PackageLineMaintainancePackage foreign key (MaintainancePackageID) references MaintenancePackage (ServiceitemID),
	constraint fk_PackageLineService foreign key (ServiceitemID) references ServiceItem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS IndividualService (
	ServiceitemID int not null primary key,
	Service varchar(30),
	Cost Decimal(13,2),
	CertificateNeeded varchar(30),
	constraint fk_ItemIndividualService foreign key (ServiceitemID) references Serviceitem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS PartCatalog (
	PartCatalogID int not null primary key AUTO_INCREMENT,
	PartName varchar(30),
	Cost Decimal(13,2)
);

CREATE TABLE IF NOT EXISTS PartUsage (
	IndividualServiceID int not null,
	Make varchar(30) not null,
	Model varchar(30) not null,
	Year Year(4) not null,
	PartCatalogID int not null,
	Quantity int,
	primary key (IndividualServiceID, Make, Model, Year, PartCatalogID),
	constraint fk_IndividualServicePartUsage foreign key (IndividualServiceID) references IndividualService (IndividualServiceID),
	constraint fk_PartCatalogPartUsage foreign key (PartCatalogID) references PartCatalog (PartCatalogID),
	constraint fk_VehicleCatalogPartUsage foreign key (Make, Model, Year) references VehicleCatalog (Make, Model, Year)
);
/*Employee Part*/
CREATE TABLE IF NOT EXISTS Employee (
	EmployeeID int not null primary key,
	EFirstName varchar(30),
	ELastName  varchar(30),
	Phone int
);
CREATE TABLE IF NOT EXISTS EmploymentTime(
	DateRetired int not null primary key,
	DateEmployed int,
	EmployeeID int
);

CREATE TABLE IF NOT EXISTS Mechanic(
	EmploymentField varchar(30),
	EmployeeID int not null primary key,
	constraint fk_Mechanic foreign key (EmployeeID) references Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS Mechanic(
	EmploymentField varchar(30),
	EmployeeID int not null primary key,
	constraint fk_Mechanic foreign key (EmployeeID) references Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS ServiceTechnician(
	EmploymentField varchar(30),
	EmployeeID int not null primary key,
	constraint fk_ServiceTechnician foreign key (EmployeeID) references Employee (EmployeeID)
);

CREATE TABLE IF NOT EXISTS MentorShip(
	EmployeeID int not null,
	MentorID int not null,
	Skill varchar(30) not null,
	Stop datetime,
	Start datetime,
	primary key (EmployeeID, MentorID, Skill)
);
CREATE TABLE IF NOT EXISTS TempCertificate(
	EmployeeID int not null,
	CertificateID int not null,
	Skill int not null,
	CertificateName varchar(30),
	primary key (EmployeeID, CertificateID, Skill)
);

CREATE TABLE IF NOT EXISTS Certificate(
	CertificateID int not null primary key,
	CertificateLevel,
	ServiceType varchar(30)
);


