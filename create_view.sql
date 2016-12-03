create view Customer_v as
select FirstName, LastName,(Year(curdate()) - DateJoined) as "YearsJoined", 'Prospective' as 'CustomerType' from individual inner join customer using(CustomerID) 
inner join prospectivecustomer as P using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as "YearsJoined", 'Steady' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join steadycustomer using(CustomerID)
union
select FirstName, LastName, (Year(curdate()) - DateJoined) as "YearsJoined",'Premier' as 'CustomerType' from individual inner join customer using(CustomerID)
inner join contracted using(CustomerID) inner join premiumcustomer using(CustomerID);

