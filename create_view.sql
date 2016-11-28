#SQL file to create tables
CREATE TABLE IF NOT EXISTS Customer (
	CustomerID int not null primary key AUTO_INCREMENT,
	Phone varchar(11),
	loyaltyPoints #need to fix in relational
	Email varchar(30),

);

CREATE TABLE IF NOT EXISTS OwnedVehicle (
	VinNumber varchar(20) not null primary key,
	DateOwned Date,
	TotalMiles int,
	YearlyMileage int,
	RegisteredDate Date,
	LicenseNumber varchar(20),
	CustomerID int not
);

CREATE TABLE IF NOT EXISTS VehicleCatalog (
	Make varchar(30) not null primary key,
	Model varchar(30) not null primary key,
	Year Year(4) not null primary key
);

CREATE TABLE IF NOT EXISTS RepairOrder (
	DateOrdered Date,
	RepairDate Date
);

CREATE TABLE IF NOT EXISTS RepairOrder (
	RepairOrderID not null primary key AUTO_INCREMENT,
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
	ServiceitemID not null primary key,
	RepairOrderID not null primary key,
	# need subcost
	constraint fk_ServiceRepairLine foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_OrderRepairLine foreign key (RepairOrderID) references RepairOrderID (RepairOrderID)
);