#View for Customer
create view Customer_v as
select FirstName, LastName,(Year(curdate()) - DateJoined) as 'YearsJoined', 'Prospective' as 'CustomerType' from Individual inner join Customer using(CustomerID) 
inner join ProspectiveCustomer as P using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as 'YearsJoined', 'Steady' as 'CustomerType' from Individual inner join Customer using(CustomerID)
inner join Contracted using(CustomerID) inner join SteadyCustomer using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as 'YearsJoined','Premier' as 'CustomerType' from Individual inner join Customer using(CustomerID)
inner join Contracted using(CustomerID) inner join PremiumCustomer using(CustomerID);

#View for Customer_addresses
create view Customer_addresses_v as
select CustomerID ,'Corporate' as 'CustomerType', street, addressnumber, zipcode from Corporation inner join Customer using(CustomerID)
inner join Address using(CustomerID)
union
select CustomerID, 'Individual' as 'CustomerType', street, addressnumber, zipcode from Individual inner join Customer using(CustomerID)
inner join Address using(CustomerID);

#View for Mechanic Mentor
create view Mechanic_mentor_v as
select Mechanic.MechanicInstance as 'MechanicID', Mentor.EFirstName as 'MentorFirstName', Mentor.ELastName as 'MentorLastName', Mentee.EFirstName as
'MenteeFirstName', Mentee.ELastName as 'MenteeLastName' from Employee Mentor inner join EmploymentTime using(EmployeeID) inner join Mechanic 
on EmploymentTime.EmployeeInstance = Mechanic.MechanicInstance inner join TempCertificate using(MechanicInstance) inner join MentorShip on 
TempCertificate.CertificateID = MentorShip.CertificateID and TempCertificate.MechanicInstance = MentorShip.MentorInstance inner join Mechanic B on
MentorShip.MenteeInstance = B.MechanicInstance inner join EmploymentTime E on B.MechanicInstance = E.EmployeeInstance inner join Employee Mentee on
E.EmployeeID = Mentee.EmployeeID order by Mentor.EFirstName, Mentor.ELastName, Mentee.EFirstName, Mentee.ELastName;

#View for Premier Profits
create view Premier_profits_v as
(select PremiumCustomer.CustomerID, AnnualFee, Year(RepairOrder.DateOrdered) as 'Year of Repair', Sum(cost) as 'Years Cost'
from PremiumCustomer inner join Contracted using(CustomerID) inner join Customer using(CustomerID) inner join OwnedVehicle
using(CustomerID) inner join RepairOrder on OwnedVehicle.VinNumber = RepairOrder.VinNumbers inner join RepairLine on 
RepairOrder.RepairOrderID = RepairLine.RepairOrderID inner join ServiceItem using(ServiceItemID) inner join IndividualService 
using(ServiceItemID) group by RepairOrder.DateOrdered, CustomerID)
union
(select PremiumCustomer.CustomerID, AnnualFee, Year(RepairOrder.DateOrdered) as 'Year of Repair', Sum(cost) as 'Years Cost' 
from PremiumCustomer inner join Contracted using(CustomerID) inner join Customer using(CustomerID) inner join OwnedVehicle 
using(CustomerID) inner join RepairOrder on OwnedVehicle.VinNumber = RepairOrder.VinNumbers inner join RepairLine on 
RepairOrder.RepairOrderID = RepairLine.RepairOrderID inner join ServiceItem using(ServiceItemID) inner join MaintenancePackage 
on ServiceItem.ServiceitemID = MaintenancePackage.MaintenancePackageID group by RepairOrder.DateOrdered, CustomerID)
order by CustomerID, 'Year of Repair';


#View for Prospective Customer Resurrection
create view Prospective_resurrection_v as 
select CustomerID from Email inner join Customer using(CustomerID) 
inner join ProspectiveCustomer using(CustomerID) group by CustomerID having count(CustomerID) > 3
union
select A.CustomerID from Email A inner join Customer using(CustomerID) inner join ProspectiveCustomer using(CustomerID)
where suggestedDate = (Select max(SuggestedDate) from Email B where B.CustomerID = A.CustomerID) and (year(curdate()) - year(A.suggestedDate)) >= 1;