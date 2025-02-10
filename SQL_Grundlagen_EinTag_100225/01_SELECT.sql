-- USE Datenbanknamen wechselt die angesprochene Datenbank

-- Alternativ "oben links" im Drop-Down Menü die richtige DB auswählen
USE Northwind

-- Datei speichern mit STRG + S


SELECT * FROM Customers -- * = alle Spalten in der angesprochenen Tabelle

SELECT CompanyName, Country FROM Customers

-- "Custom" - Werte und mathematische Operationen nutzen

SELECT 100 * 5

SELECT 'Hallo', 500

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons gesetzt werden
sEleCt			CoUNtrY,
		cOmPanYNamE
FrOm				cUsToMeRS

-- Sortieren it ORDER BY
SELECT * FROM Customers
ORDER BY City ASC

SELECT CompanyName as Unternehmen FROM Customers
ORDER BY Unternehmen ASC

-- Mehrere Spalten gleichzeitig sortieren
SELECT City, CompanyName FROM Customers
ORDER BY City DESC, CompanyName 
-- Order by ist syntaktisch immer am Ende
-- DESC = descending = absteigend
-- ASC = ascending = aufsteigend (der Standardwert)

-- TOP X gibt nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %-Angaben
SELECT TOP 10 PERCENT * FROM Customers

-- Die 20 größten Frachtkosten von der Tabelle "Orders"
-- Spalte: Freight, FROM Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Die 20 kleinsten Frachtkosten von der Tabelle "Orders"
-- Spalte: Freight, FROM Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

/*
	BOTTOM X = gibts nicht 
		=> mit ORDER BY andersrum sortieren
*/

-- DUPLIKATE "filtern" mit DISTINCT
-- Filtert alle Ergebnisse/Datensätze deren Werte exakt gleicht sind
SELECT Country FROM Customers

-- DISTINCT macht automatisch ein Order By
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers


-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Datentypen müssen kompatibel sein, Spaltenanzahl gleich sein

SELECT * FROM Customers -- (91 Zeilen)
UNION
SELECT * FROM Customers -- (91 Zeilen)

-- alle duplikate anzeigen lassen => UNION ALL
SELECT * FROM Customers -- (91 Zeilen)
UNION ALL
SELECT * FROM Customers -- (91 Zeilen)


-- geht nicht
SELECT 100, 'Hallo'
UNION
SELECT 'Tschüss', 50

-- Option 1
SELECT 'Hallo', 100
UNION
SELECT 'Tschüss', 50

-- Option 2
SELECT '100', 'Hallo'
UNION
SELECT 'Tschüss', '50'

-- Aliase => Spalten umbennen
SELECT 100 as Zahl, 'Hallo' as Begrüßung

SELECT City as Stadt, Country as Land FROM Customers

-- Aliase können auch für Tabellennamen vergeben werden
SELECT * FROM Customers as cus
