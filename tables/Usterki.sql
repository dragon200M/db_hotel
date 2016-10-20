CREATE TABLE z_32414.dbo.Usterki (
	id_usterki int NOT NULL,
	id_rezerwacji int,
	id_pokoju int,
	opis varchar(50) NOT NULL,
	CONSTRAINT PK_Usterki PRIMARY KEY (id_usterki),
	CONSTRAINT FK_Usterki_Pokoje FOREIGN KEY (id_pokoju) REFERENCES z_32414.dbo.Pokoje(id_pokoju) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Usterki_Rezerwacje FOREIGN KEY (id_rezerwacji) REFERENCES z_32414.dbo.Rezerwacje(id_rezerwacji) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Usterki ON z_32414.dbo.Usterki (id_usterki);
