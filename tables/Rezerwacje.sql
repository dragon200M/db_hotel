CREATE TABLE z_32414.dbo.Rezerwacje (
	id_rezerwacji int NOT NULL,
	id_klienta int NOT NULL,
	id_pracownika int NOT NULL,
	data_od date NOT NULL,
	data_do date NOT NULL,
	ilosc_osob int NOT NULL,
	opis varchar(50),
	potwierdzone char(5) NOT NULL,
	CONSTRAINT PK_Rezerwacje PRIMARY KEY (id_rezerwacji),
	CONSTRAINT FK_Rezerwacje_Klienci FOREIGN KEY (id_klienta) REFERENCES z_32414.dbo.Klienci(id_klienta) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Rezerwacje_Pracownicy FOREIGN KEY (id_pracownika) REFERENCES z_32414.dbo.Pracownicy(id_pracownika) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Rezerwacje ON z_32414.dbo.Rezerwacje (id_rezerwacji);
