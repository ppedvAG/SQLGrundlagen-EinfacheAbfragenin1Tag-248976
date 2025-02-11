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

-- Beziehung zwischen PurchasingOrders und Products anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalten hinzufügen zu bestehender Table
ALTER TABLE PurchasingOrders
ADD TestDaten INT

SELECT * FROM PurchasingOrders

-- Spalte aus der bestehenden Table löschen
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte nach Datentyp ändern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

-- INSERT - Hinzufügen von Datensätze in eine Tabelle
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


-- DELETE -- Löschen von Datensätze in einer Tabelle
SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne Where filter werden ALLE Datensätzen werden gelöscht!
DELETE FROM PurchasingOrders
WHERE ID = 6

-- Primär-/Fremdschlüsselbeziehungen verhindern das löschen von Datensätzen,
-- wenn andere DATENSÄTZE sonst "ins Leere laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - Ändern von Werten in einem vorhanden Datensatz
SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 255
WHERE ID = 7

-- "Löschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 7


-- TRANSACTIONS
BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 4

COMMIT  -- übernehmen
ROLLBACK -- Rückgänig machen

SELECT * FROM PurchasingOrders
