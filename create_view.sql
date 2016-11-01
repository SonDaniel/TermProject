#SQL file to create tables
CREATE TABLE IF NOT EXISTS OwnedVehicle (
	VIN int,
	DateOwned Date,
	TotalMiles int,
	YearlyMileage int,
	RegisteredDate Date,
	LicenseNumber varchar(20)
);

CREATE TABLE IF NOT EXISTS VehicleCatalog (
	Make varchar(30),
	Model varchar(30)
);

CREATE TABLE IF NOT EXISTS RepairOrder (
	DateOrdered Date,
	RepairDate Date
);

CREATE TABLE IF NOT EXISTS Service (
	action varchar(60),
	cost float(7,2)
);