USE Northwind

/*
	Inner Join:
	=> Wenn du nur übereinstimmende Daten aus beiden Tabellen brauchst

	Left Join:
	=> Wenn du alle Daten aus der Linken Tabelle brauchst (inkl. übereinstimmende)

	Right Join:
	=> Wenn du alle Daten aus der Rechten Tabelle brauchst (inkl. übereinstimmende)

	Full Join:
	=> Wenn du alle Daten aus beiden Tabellen brauchst, egal ob sie übereinstimmen

*/


/*
	Inner Join:

	SELECT * FROM Table1
	JOIN Table2 ON Table1.KeySpalte = Table2.KeySpalte
*/

SELECT * FROM Customers -- Table1
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Anders anordnen
SELECT * FROM Orders -- Table1
JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Mehrdeutiger Spaltenname
SELECT Orders.CustomerID FROM Customers -- Table1
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Customers Tabelle: Country & Orders Tabelle: Alles
SELECT Country, Orders.* FROM Customers -- Table1
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers as cus -- Table1
JOIN Orders as ord ON cus.CustomerID = ord.CustomerID

-- Join: Customers - Orders - Order Details
SELECT * from Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
-- JOIN [Nächste Tabelle] ON [Tabelle].KeySpalte = [Vorherige Tabelle].KeySpalte
-- WHERE ....
-- ORDER BY

-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
SELECT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Employees.LastName = 'Leverling'

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Tabellen: Customers - Orders
SELECT OrderID FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
SELECT ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 5. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details]. OrderID
WHERE Discontinued = 1

-- OUTER Joins:

-- Left:
-- Alle Datensätze aus der Linken Tabelle, auch wenn es keine passende Verknüpfung gibt
-- Bestellungen von keinem Kunden (gibts nicht)
SELECT * FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Right: Z.189 & Z.502
-- Alle Datensätze aus der Rechten Tabelle, auch wenn ese keine passende Verknüpfung gibt
-- Kunden ohne Bestellungen
SELECT * FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Full Outer Join:
-- Kunden ohne Bestellungen und Bestellungen ohne Kunden werden angezeigt, mit NULL Werten
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerID IS NULL OR Orders.OrderID IS NULL

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (A x B) 91 x 830
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo