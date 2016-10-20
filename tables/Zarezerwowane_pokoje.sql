CREATE TABLE z_32414.dbo.Zarezerwowane_pokoje (
	id_rezerwacji int NOT NULL,
	id_pokoju int NOT NULL,
	id_cena_pokoju int NOT NULL,
	opis varchar(50),
	CONSTRAINT FK_Zarezerwowane_pokoje_CenaPokoju FOREIGN KEY (id_cena_pokoju) REFERENCES z_32414.dbo.CenaPokoju(id_cena_pokoju) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Zarezerwowane_pokoje_Pokoje FOREIGN KEY (id_pokoju) REFERENCES z_32414.dbo.Pokoje(id_pokoju) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Zarezerwowane_pokoje_Rezerwacje FOREIGN KEY (id_rezerwacji) REFERENCES z_32414.dbo.Rezerwacje(id_rezerwacji) ON DELETE RESTRICT ON UPDATE RESTRICT
);
