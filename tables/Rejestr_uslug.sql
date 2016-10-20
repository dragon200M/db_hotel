CREATE TABLE z_32414.dbo.Rejestr_uslug (
	id_rej_uslug int NOT NULL,
	id_uslugi int NOT NULL,
	id_rezerwacji int NOT NULL,
	id_klienta int NOT NULL,
	id_cena_uslugi int NOT NULL,
	CONSTRAINT PK_Rejestr_uslug PRIMARY KEY (id_rej_uslug),
	CONSTRAINT FK_Rejestr_uslug_CenaUslug FOREIGN KEY (id_cena_uslugi) REFERENCES z_32414.dbo.CenaUslug(id_cena_uslugi) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Rejestr_uslug_Klienci FOREIGN KEY (id_klienta) REFERENCES z_32414.dbo.Klienci(id_klienta) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Rejestr_uslug_Rezerwacje FOREIGN KEY (id_rezerwacji) REFERENCES z_32414.dbo.Rezerwacje(id_rezerwacji) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Rejestr_uslug_Uslugi FOREIGN KEY (id_uslugi) REFERENCES z_32414.dbo.Uslugi(id_uslugi) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Rejestr_uslug ON z_32414.dbo.Rejestr_uslug (id_rej_uslug);
