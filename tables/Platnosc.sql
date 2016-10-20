CREATE TABLE z_32414.dbo.Platnosc (
	id_platnosc int NOT NULL,
	id_rezerwacji int NOT NULL,
	kwota float NOT NULL,
	ilosc_dni int NOT NULL,
	id_s_platnosc int NOT NULL,
	status bit NOT NULL,
	CONSTRAINT PK_Platnosc PRIMARY KEY (id_platnosc),
	CONSTRAINT FK_Platnosc_Rezerwacje FOREIGN KEY (id_rezerwacji) REFERENCES z_32414.dbo.Rezerwacje(id_rezerwacji) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Platnosc_Sposob_platnosci FOREIGN KEY (id_s_platnosc) REFERENCES z_32414.dbo.Sposob_platnosci(id_s_platnosc) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Platnosc ON z_32414.dbo.Platnosc (id_platnosc);
