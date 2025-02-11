USE Northwind

/*
	
	- CREATE / ALTER / DROP - DDL (Data Definition Language)
	
*/
-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

-- CREATE
CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ProductID INT NOT NULL
)

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalten hinzuf�gen zu bestehender Table
ALTER TABLE PurchasingOrders
ADD TestDaten INT

SELECT * FROM PurchasingOrders

-- Spalte aus der bestehenden Table l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte nach Datentyp �ndern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

-- INSERT - Hinzuf�gen von Datens�tze in eine Tabelle
SELECT * FROM PurchasingOrders

-- Methode 1: Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES('11.02.2025', 5, 20)

-- Methode 2: Explizit einzelne Spalten befuellen
INSERT INTO PurchasingOrders
(OrderDate, ProductID)
VALUES ('11.02.2025', 10)

-- Methode 3: Ergebnis einer SELECT-Abfrage direkt inserten
-- Geht nur wenn: Spaltenanzahl passt & Datentypen kompatibel sind
INSERT INTO PurchasingOrders
SELECT '11.02.2025', 10, 1000


-- DELETE -- L�schen von Datens�tze in einer Tabelle
SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne Where filter werden ALLE Datens�tzen werden gel�scht!
DELETE FROM PurchasingOrders
WHERE ID = 6

-- Prim�r-/Fremdschl�sselbeziehungen verhindern das l�schen von Datens�tzen,
-- wenn andere DATENS�TZE sonst "ins Leere laufen w�rden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - �ndern von Werten in einem vorhanden Datensatz
SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 255
WHERE ID = 7

-- "L�schen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 7


-- TRANSACTIONS
BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 4

COMMIT  -- �bernehmen
ROLLBACK -- R�ckg�nig machen

SELECT * FROM PurchasingOrders
