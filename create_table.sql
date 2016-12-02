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
	ServiceType varchar(30) not null
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
	StopTime datetime,
	StartTime datetime,
	primary key (MenteeInstance,MentorInstance,CertificateID),
    constraint fk_MentorShip foreign key (MentorInstance,CertificateID) references TempCertificate (MechanicInstance,CertificateID),
    constraint fk_Mentee foreign key(MenteeInstance) references Mechanic (MechanicInstance)
);

CREATE TABLE IF NOT EXISTS Customer (
	CustomerID int not null primary key AUTO_INCREMENT,
	Phone varchar(11),
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

CREATE TABLE IF NOT EXISTS Corporation (
	CustomerID int not null primary key,
	CorpName varchar(20),
	constraint fk_CustomerIDCorp foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS Individual (
	CustomerID int not null primary key,
	FirstName varchar(20),
	LastName varchar(20),
	constraint fk_CustomerIDIndividual foreign key (CustomerID) references Customer (CustomerID)
);

CREATE TABLE IF NOT EXISTS Contracted (
	CustomerID int not null primary key,
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
	#need total Order,
	VinNumbers varchar(20),
    ProspectiveID int,
    ServiceTechnicianInstance int,
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
	# need subcost
	primary key (ServiceitemID, RepairOrderID),
	constraint fk_ServiceRepairLines foreign key (ServiceitemID) references ServiceItem (ServiceitemID),
	constraint fk_OrderRepairLines foreign key (RepairOrderID) references RepairOrder (RepairOrderID),
	constraint fk_Mechanics foreign key(MechanicInstance) references Mechanic (MechanicInstance)
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
	CertificateNeeded int,
	constraint fk_ItemIndividualService foreign key (ServiceitemID) references ServiceItem (ServiceitemID)
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
	constraint fk_IndividualServicePartUsage foreign key (IndividualServiceID) references IndividualService (ServiceitemID),
	constraint fk_PartCatalogPartUsage foreign key (PartCatalogID) references PartCatalog (PartCatalogID),
	constraint fk_VehicleCatalogPartUsage foreign key (Make, Model, Year) references VehicleCatalog (Make, Model, Year)
);

CREATE TABLE IF NOT EXISTS HOLIDAY(
	HolidayDate date not null primary key
);
