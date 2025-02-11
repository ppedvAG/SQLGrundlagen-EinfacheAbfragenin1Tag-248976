USE Northwind

-- CASE -- unterscheiden wir definierte F�lle, die die ausgabe ab�ndern

-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 30 THEN 'Nachbestellen n�tig!'
	WHEN UnitsInStock > 30 THEN 'Vorrat reicht gerade so aus!'
END as Pr�fung
FROM Products

-- Alternative mit ELSE einen "Notausgang" definieren
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 40 THEN 'Nachbestellen n�tig!'
	WHEN UnitsInStock > 40 THEN 'Vorrat reicht gerade so aus!'
	ELSE 'Fehler, f�r diesen Fall gibt es keine �berpr�fung!'
END as Pr�fung
FROM Products

-- Funktioniert auch mit UPDATE
UPDATE Customers
SET City =
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END