#SQL file to create tables
CREATE TABLE IF NOT EXISTS Customer (
	CustomerID int not null primary key AUTO_INCREMENT,
	Phone varchar(11),
	# need to add loyaltypoints attribute
	Email varchar(30),

);

CREATE TABLE IF NOT EXISTS VehicleCatalog (
	Make varchar(30) not null primary key,
	Model varchar(30) not null primary key,
	Year Year(4) not null primary key
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
	DateOrdered Date,
	RepairDate Date
);

CREATE TABLE IF NOT EXISTS RepairOrder (
	RepairOrderID int not null primary key AUTO_INCREMENT,
	DateOrdered datetime,
	RepairDate datetime,
	#need total Order,
	VinNumber int,
	constraint fk_VehicleRepairOrder foreign key (VinNumber) references OwnedVehicle (VinNumber)
);

CREATE TABLE IF NOT EXISTS ServiceItem (
	ServiceitemID not null primary key AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS RepairLine (
	ServiceitemID int not null primary key,
	RepairOrderID int not null primary key,
	# need subcost
	constraint fk_ServiceRepairLine foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_OrderRepairLine foreign key (RepairOrderID) references RepairOrderID (RepairOrderID)
);

CREATE TABLE IF NOT EXISTS MaintenancePackage (
	ServiceitemID int not null primary key,
	PackageTitle varchar(20),
	constraint fk_ServicePackage foreign key (ServiceitemID) references ServiceItem (ServiceitemID)
);

CREATE TABLE IF NOT EXISTS ServicePackageLine (
	ServiceitemID int not null primary key,
	MaintainancePackageID int not null primary key,
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
	IndividualServiceID int not null primary key,
	Make varchar(30) not null primary key,
	Model varchar(30) not null primary key,
	Year Year(4) not null primary key,
	PartCatalogID int not null primary key,
	Quantity int,
	constraint fk_IndividualServicePartUsage foreign key (IndividualServiceID) references IndividualService (IndividualServiceID),
	constraint fk_PartCatalogPartUsage foreign key (PartCatalogID) references PartCatalog (PartCatalogID),
	constraint fk_VehicleCatalogPartUsage foreign key (Make, Model, Year) references VehicleCatalog (Make, Model, Year)
);


