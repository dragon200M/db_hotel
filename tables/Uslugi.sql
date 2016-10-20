CREATE TABLE z_32414.dbo.Uslugi (
	id_uslugi int NOT NULL,
	nazwa char(20) NOT NULL,
	opis varchar(50),
	CONSTRAINT PK_Uslugi PRIMARY KEY (id_uslugi)
);

CREATE INDEX PK_Uslugi ON z_32414.dbo.Uslugi (id_uslugi);
