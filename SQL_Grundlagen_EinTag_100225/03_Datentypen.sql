/*

	Datentypen in SQL: 3 große Datentypen Gruppen


	1. Charakter/String Datentypen
		char(10) = 'Hallo     ' = 10 Byte Speicherplatz
		=> braucht immer seine 10 Byte Speicherplatz (UTF-8)

		nchar(10) = 'Hallo     ' = 20 Byte Speicherplatz
		=> Andere Zeichenkodierung => (UTF-16)

		varchar(10) = 'Hallo' = 5 Byte Speicherplatz
		=> Brauchen nur soviel wie das Wort lang ist

		nvarchar(10) = 'Hallo' = 10 Byte Speicherplatz

		Legacy: text --> mittlerweile VARCHAR(max) = bis zu 2GB groß
		varchar(8000) & nvarchar(4000) sind maximum




	2. Numerische Datentypen
		tinyint = 8 Bit = 1 Byte = -255 bis 255
		smallint = 16 Bit = 2 Byte = -32k bis 32k
		int = 32 Bit = 4 Byte = 2,14Mrd +-
		bigint = 64 Bit = 8 Byte = 9,2 Trillionen ca. +-

		bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool!

		decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
		decimal(10, 2) = 10 Ziffern, davon sind 2 Nachkommastellen
		money = 9,2 Trillionen
		smallmoney = ca.214k



	3. Datum/Zeit Datentypen
		time = hh:mm:ss.nnnnnnn
		date = YYYY-MM-DD
		datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
		datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
		smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss
	

*/