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