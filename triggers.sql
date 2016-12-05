#TRIGGERS


delimiter //
create TRIGGER holidayCheck BEFORE INSERT ON RepairOrder
for each row
begin

    DECLARE msg VARCHAR(255);
	DECLARE n INT DEFAULT 0;
	DECLARE mDay INT DEFAULT 0;
	DECLARE mMonth INT DEFAULT 0;
	DECLARE cur CURSOR FOR SELECT holidayDay,holidayMonth FROM Holiday;
	
	SELECT COUNT(*) FROM Holiday into n;
    OPEN cur;
		WHILE n > 0 DO
			FETCH cur into mDay, mMonth;
			
				if DAY(NEW.DateOrdered) = mDay  AND  MONTH(NEW.DateOrdered) = mMonth then
					set msg = "You Can't place orders on Holidays";
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
				end if;
		Set n = n - 1;
		END WHILE;


end;
//
delimiter ;



delimiter //
create TRIGGER certificateCheck BEFORE INSERT ON RepairLine
for each row
begin
	DECLARE msg VARCHAR(255);
	DECLARE n INT DEFAULT 0;
	DECLARE cert INT DEFAULT 0;
    
    DECLARE cur1 CURSOR FOR Select CertificateID FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join certificate on(individualservice.CertificateNeeded = certificate.CertificateID)
								where maintenancepackage.MaintenancePackageID = NEW.ServiceitemID;
    
	
		if NEW.ServiceitemID in (SELECT MaintenancePackageID FROM MaintenancePackage) then
			
            OPEN cur1;
								
			Select COUNT(*) FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join certificate on(individualservice.CertificateNeeded = certificate.CertificateID)
								where MaintenancePackage.MaintenancePackageID = NEW.ServiceitemID into n;
								
								
								WHILE n > 0 DO
									fetch cur1 into cert;
									
										if cert not in (Select TempCertificate.CertificateID FROM Mechanic inner join TempCertificate
																on (Mechanic.MechanicInstance = TempCertificate.MechanicInstance)
																Where Mechanic.MechanicInstance = NEW.MechanicInstance) then
											
											set msg = "Employee not qualified for this maitenance package";
											SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
										end if;
									
									Set n = n - 1;
								END WHILE;
		
		ELSE
			Select CertificateID FROM serviceitem
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join certificate on(individualservice.CertificateNeeded = certificate.CertificateID)
								where Serviceitem.ServiceitemID = NEW.ServiceitemID into cert;
								
								if cert not in (Select TempCertificate.CertificateID FROM Mechanic inner join TempCertificate
																on (Mechanic.MechanicInstance = TempCertificate.MechanicInstance)
																Where Mechanic.MechanicInstance = NEW.MechanicInstance) then
											
											set msg = "Employee not qualified for this service";
											SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
								end if;



			
					
		end if;
	
		

end;
//
delimiter ;




delimiter //
create TRIGGER addLoyaltyPoints AFTER INSERT ON RepairLine
for each row
begin

	DECLARE ID int DEFAULT 0;
    
	DECLARE n INT DEFAULT 0;
	DECLARE subCost DECIMAL(13,2) DEFAULT 0;
	DECLARE serviceCost DECIMAL(13,2) DEFAULT 0;
	DECLARE partCost DECIMAL(13,2) DEFAULT 0;
	DECLARE Cost DECIMAL(13,2) DEFAULT 0;
    
    DECLARE carYear YEAR(4) DEFAULT 0000;
	DECLARE carMake VARCHAR(30) Default '';
	DECLARE carModel VARCHAR(30) Default '';
	DECLARE k INT DEFAULT 0;
	
	DECLARE Cur1 CURSOR FOR Select DISTINCT IndividualService.Cost FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								where maintenancepackage.MaintenancePackageID = NEW.ServiceitemID;
								
	DECLARE Cur2 CURSOR FOR Select DISTINCT PartCatalog.Cost FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join PartUsage on(IndividualService.ServiceitemID = PartUsage.IndividualServiceID)
								inner join PartCatalog on(PartUsage.PartCatalogID = PartCatalog.PartCatalogID)
								Where PartUsage.Year = carYear AND PartUsage.Make = carMake AND PartUsage.Model = carModel
								AND MaintenancePackage.MaintenancePackageID = New.ServiceItemID;
								
		
	Select DISTINCT OwnedVehicle.Year from RepairLine inner join RepairOrder on (RepairLine.RepairOrderID = RepairOrder.RepairOrderID)
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber) 
     Where RepairLine.RepairOrderID = New.RepairOrderID into carYear;
	
	Select DISTINCT OwnedVehicle.Make from RepairLine inner join RepairOrder on (RepairLine.RepairOrderID = RepairOrder.RepairOrderID)
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber) 
     Where RepairLine.RepairOrderID = New.RepairOrderID into carMake;
	
	Select DISTINCT OwnedVehicle.Model from RepairLine inner join RepairOrder on (RepairLine.RepairOrderID = RepairOrder.RepairOrderID)
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber) 
     Where RepairLine.RepairOrderID = New.RepairOrderID into carModel;
				
		if NEW.ServiceitemID in (SELECT MaintenancePackageID FROM MaintenancePackage) then
		
			open Cur1;
			
			Select COUNT(*) FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join certificate on(individualservice.CertificateNeeded = certificate.CertificateID)
								where MaintenancePackage.MaintenancePackageID = NEW.ServiceitemID into n;
			
				While n > 0 DO
					Fetch Cur1 into subCost;
					SET serviceCost = serviceCost + subCost;
				
					SET n = n - 1;
				END WHILE;
				
				open Cur2;
				
				Select COUNT(*) FROM maintenancepackage inner join servicepackageline
								on (maintenancepackage.MaintenancePackageID = servicepackageline.MaintenancePackageID)
								inner join serviceitem on (servicepackageline.ServiceitemID = serviceitem.ServiceitemID)
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join PartUsage on(IndividualService.ServiceitemID = PartUsage.IndividualServiceID)
								inner join PartCatalog on(PartUsage.PartCatalogID = PartCatalog.PartCatalogID)
								Where PartUsage.Year = carYear AND PartUsage.Make = carMake AND PartUsage.Model = carModel
								AND MaintenancePackage.MaintenancePackageID = New.ServiceItemID into k;
								
				While k> 0 DO
					Fetch Cur2 into subCost;
					SET partCost = partCost + subCost;
				
					SET k = k - 1;
				END WHILE;
				
				
				
		ELSE
		
			Select DISTINCT IndividualService.Cost FROM ServiceItem
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								where ServiceItem.ServiceItemID = NEW.ServiceitemID into serviceCost;
								
			Select DISTINCT PartCatalog.Cost FROM ServiceItem  
								inner join individualservice on (serviceitem.ServiceitemID = individualservice.ServiceitemID)
								inner join PartUsage on(IndividualService.ServiceitemID = PartUsage.IndividualServiceID)
								inner join PartCatalog on(PartUsage.PartCatalogID = PartCatalog.PartCatalogID)
								Where PartUsage.Year = carYear AND PartUsage.Make = carMake AND PartUsage.Model = carModel
								AND ServiceItem.ServiceItemID = NEW.ServiceitemID into partCost;							
		
		end if;
		
		
	
	
		SET Cost = serviceCost + PartCost;
	
		
	Select Distinct Customer.CustomerID from RepairLine inner join RepairOrder on (RepairLine.RepairOrderID = RepairOrder.RepairOrderID)
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber)
	inner join Customer on (OwnedVehicle.CustomerID = Customer.CustomerID)
	where RepairLine.RepairOrderID = New.RepairOrderID into ID;
		
		if ID in (Select CustomerID FROM SteadyCustomer) then
			UPDATE SteadyCustomer SET LoyaltyPoints = LoyaltyPoints + FLOOR(Cost/10)
			WHERE SteadyCustomer.CustomerID = ID;
		end if;

	
		
	

end;
//
delimiter ;





delimiter //
create TRIGGER companyOrderLimit BEFORE INSERT ON RepairOrder
for each row
begin

	DECLARE msg VARCHAR(255);
	DECLARE ID int DEFAULT 0;
    DECLARE mDATE Date;
    
    Select Distinct Customer.CustomerID from RepairOrder 
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber)
	inner join Customer on (OwnedVehicle.CustomerID = Customer.CustomerID)
	where RepairOrder.VinNumbers = New.VinNumbers into ID;
    
    Set mDATE = New.DateOrdered;
    
    if ID in (Select CustomerID FROM Corporation) and mDATE in (Select RepairOrder.DateOrdered From RepairOrder inner join
				OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber)
				inner join Customer on (OwnedVehicle.CustomerID = Customer.CustomerID)
				where Customer.customerID = ID 
                GROUP BY RepairOrder.DateOrdered
                HAVING Count(Customer.customerID) >= 25) then
    
		 
                
                set msg = "A corporation Can't place more than 25 orders a day";
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
                
    end if;

end;
//
delimiter ;


delimiter //
create TRIGGER invdividualOrderLimit BEFORE INSERT ON RepairOrder
for each row
begin

	DECLARE msg VARCHAR(255);
	DECLARE ID int DEFAULT 0;
    DECLARE mDATE Date;
    
    Select Distinct Customer.CustomerID from RepairOrder 
	inner join OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber)
	inner join Customer on (OwnedVehicle.CustomerID = Customer.CustomerID)
	where RepairOrder.VinNumbers = New.VinNumbers into ID;
    
    Set mDATE = New.DateOrdered;
    
    if ID in (Select CustomerID FROM Individual) and mDATE in (Select RepairOrder.DateOrdered From RepairOrder inner join
				OwnedVehicle on (RepairOrder.VinNumbers = OwnedVehicle.VinNumber)
				inner join Customer on (OwnedVehicle.CustomerID = Customer.CustomerID)
				where Customer.customerID = ID 
                GROUP BY RepairOrder.DateOrdered
                HAVING Count(Customer.customerID) >= 5) then
    
		 
                
                set msg = "An individual Can't place more than 5 orders a day";
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
                
    end if;

end;
//
delimiter ;



delimiter //
create Trigger CheckDate before insert on RepairOrder
for each row
begin
DECLARE msg VARCHAR(255);
	if NEW.DateOrdered > New.RepairDate then
    set msg = 'Repair date cannot be earlier than Orderdate';
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	end if;
end;
//
delimiter ;


delimiter //
delimiter //
create Trigger MentorCertificate After insert ON MentorShip
for each row
begin 
Declare MenteeInst int;
Declare	CID int;
set MenteeInst = NEW.MenteeInstance;
set CID = NEW.CertificateID;
insert into TempCertificate(MechanicInstance,CertificateID)
values(MenteeInst, CID);
end;
//
delimiter ;

