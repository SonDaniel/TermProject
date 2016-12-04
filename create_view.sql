--View for Customer
create view Customer_v as
select FirstName, LastName,(Year(curdate()) - DateJoined) as "YearsJoined", 'Prospective' as 'CustomerType' from individual inner join customer using(CustomerID) 
inner join prospectivecustomer as P using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as "YearsJoined", 'Steady' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join steadycustomer using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as "YearsJoined",'Premier' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join premiumcustomer using(CustomerID);

--View for Customer_addresses
create view Customer_addresses_v as
select CustomerID ,'Corporate' as 'CustomerType', street, addressnumber, zipcode from corporation inner join customer using(CustomerID)
inner join address using(CustomerID)
union
select CustomerID, 'Individual' as 'CustomerType', street, addressnumber, zipcode from individual inner join customer using(CustomerID)
inner join address using(CustomerID);

--View for Mechanic Mentor
create view Mechanic_mentor_v as
select Mentor.EFirstName as 'MentorFirstName', Mentor.ELastName as 'MentorLastName', Mentee.EFirstName as
'MenteeFirstName', Mentee.ELastName as 'MenteeLastName' from Employee Mentor inner join employmenttime using(EmployeeID) inner join mechanic 
on employmenttime.EmployeeInstance = Mechanic.MechanicInstance inner join tempcertificate using(MechanicInstance) inner join mentorship on 
tempcertificate.CertificateID = mentorship.CertificateID and tempcertificate.MechanicInstance = mentorship.MentorInstance inner join mechanic B on
mentorship.MenteeInstance = B.MechanicInstance inner join employmenttime E on B.MechanicInstance = E.EmployeeInstance inner join employee Mentee on
E.EmployeeID = Mentee.EmployeeID order by Mentor.EFirstName, Mentor.ELastName, Mentee.EFirstName, Mentee.ELastName;

--View for Premier Profits


--View for Prospective Customer Resurrection
create view Prospective_resurrection_v as 
select CustomerID from email inner join customer using(CustomerID) 
inner join prospectivecustomer using(CustomerID) group by CustomerID having count(CustomerID) > 3
union
select A.CustomerID from email A inner join customer using(CustomerID) inner join prospectivecustomer using(CustomerID)
where suggestedDate = (Select max(SuggestedDate) from email B where B.CustomerID = A.CustomerID) and (year(curdate()) - year(A.suggestedDate)) >= 1;