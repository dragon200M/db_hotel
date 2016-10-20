CREATE TABLE z_32414.dbo.CenaPokoju (
	id_cena_pokoju int NOT NULL,
	id_pokoju int NOT NULL,
	cena float NOT NULL,
	"data" date NOT NULL,
	CONSTRAINT PK_CenaPokoju PRIMARY KEY (id_cena_pokoju),
	CONSTRAINT FK_CenaPokoju_Pokoje FOREIGN KEY (id_pokoju) REFERENCES z_32414.dbo.Pokoje(id_pokoju) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_CenaPokoju ON z_32414.dbo.CenaPokoju (id_cena_pokoju);
