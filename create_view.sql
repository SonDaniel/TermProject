create view Customer_v as
select FirstName, LastName, 'Prospective' as 'CustomerType' from individual inner join customer using(CustomerID) 
inner join prospectivecustomer as P using(CustomerID)
union
select FirstName, LastName, 'Steady' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join steadycustomer using(CustomerID)
union
select FirstName, LastName, 'Premier' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join premiumcustomer using(CustomerID);

