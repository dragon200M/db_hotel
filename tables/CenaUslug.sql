CREATE TABLE z_32414.dbo.CenaUslug (
	id_cena_uslugi int NOT NULL,
	id_uslugi int NOT NULL,
	cena float NOT NULL,
	"data" date NOT NULL,
	CONSTRAINT PK_CenaUslug PRIMARY KEY (id_cena_uslugi),
	CONSTRAINT FK_CenaUslug_Uslugi FOREIGN KEY (id_uslugi) REFERENCES z_32414.dbo.Uslugi(id_uslugi) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_CenaUslug ON z_32414.dbo.CenaUslug (id_cena_uslugi);
