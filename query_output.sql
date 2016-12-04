-- 1. List the customers. For each customer, indicate which category he or she fall into, and his or her contact information.
SELECT FirstName, LastName, 'Individual' AS 'Customer Type',Phone, Email
From Individual 
inner join Customer using(CustomerID)
UNION
SELECT CorpName AS 'FirstName', 'Corp' AS 'LastName', 'Corporation' AS 'Customer Type',Phone,Email
FROM Corporation
inner join Customer using(CustomerID)
order by LastName asc, FirstName asc;
#VERSION 2
SELECT FirstName, LastName, '' AS 'Corporation Name','Individual' AS 'Customer Type',Phone, Email
From Individual 
inner join Customer using(CustomerID)
UNION
SELECT '' AS 'FirstName', '' AS 'LastName',CorpName AS 'Corporation Name', 'Corporation' AS 'Customer Type',Phone,Email
FROM Corporation
inner join Customer using(CustomerID);

-- 2. For each service visit, list the total cost to the customer for that visit.

-- 3. List the top three customers in terms of their net spending for the past two years, and the total
-- that they have spent in that period.

-- 4. Find all of the mechanics who have three or more skills.
SELECT EFirstName, ELastName, count(certificateID) AS 'Number of Skills'
FROM Employee	
inner join employmentTime using(EmployeeID)
inner join Mechanic on MechanicInstance=EmployeeInstance
inner join tempcertificate using(MechanicInstance)
group by EFirstName, ELastName;


-- 5. Find all of the mechanics who have three or more skills in common.

-- 6. For each maintenance package, list the total cost of the maintenance package, as well as a list of
-- all of the maintenance items within that package.

-- 7. Find all of those mechanics who have one or more maintenance items that they lacked one or
-- more of the necessary skills.

-- 8. List the customers, sorted by the number of loyalty points that they have, from largest to
-- smallest.

-- 9. The premier customers and the difference between what they have paid in the past year, versus
-- the services that they actually used during that same time. List from the customers with the
-- largest difference to the smallest.

-- 10. Report on the steady customers based on the net profit that we have made from them over the
-- past year, and the dollar amount of that profit, in order from the greatest to the least.

-- 11. List the three suppliers who have supplied us the largest number of parts (not total quantity of
-- parts, but the largest number of distinct parts) over the past year.

-- 12. List the five suppliers who have supplied us the largest dollar value of parts in the past year.

-- 13. Find the mechanic who is mentoring the most other mechanics. List the skills that the mechanic
-- is passing along to the other mechanics.

-- 14. Find the three skills that have the fewest mechanics who have those skills.

-- 15. List the employees who are both service technicians as well as mechanics.

-- 16. Three additional queries that demonstrate the five additional business rules. Feel free to create
-- additional views to support these queries if you so desire.