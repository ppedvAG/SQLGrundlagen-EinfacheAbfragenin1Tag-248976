USE Northwind

-- CASE -- unterscheiden wir definierte Fälle, die die ausgabe abändern

-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 30 THEN 'Nachbestellen nötig!'
	WHEN UnitsInStock > 30 THEN 'Vorrat reicht gerade so aus!'
END as Prüfung
FROM Products

-- Alternative mit ELSE einen "Notausgang" definieren
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 40 THEN 'Nachbestellen nötig!'
	WHEN UnitsInStock > 40 THEN 'Vorrat reicht gerade so aus!'
	ELSE 'Fehler, für diesen Fall gibt es keine Überprüfung!'
END as Prüfung
FROM Products

-- Funktioniert auch mit UPDATE
UPDATE Customers
SET City =
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END