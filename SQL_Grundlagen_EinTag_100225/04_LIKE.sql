USE Northwind

-- LIKE: Für ungenaue Filterung/Suche
-- (statt Vergleichsoperatoren)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Owner'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

-- "_"-Zeichen: EIN beliebiges Zeichen
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles in den Klammern ist gültiges Zeichen
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[12345]%'

-- "[a-z] oder gegenteil mit ^ [^a-z]"
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '__[1-5]%'

-- Alles außer 1-5
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^1-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderfälle: % '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- 1. Alle ContactNames haben, die den ContactTitle "Manager" beeinhalten
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- 2. Alle ShipPostalCodes anzeigen lassen, die mit 0, 2 oder 4 beginnen
-- (Tabelle Orders) 
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'

