CREATE TABLE z_32414.dbo.Klienci (
	id_klienta int NOT NULL,
	imie char(20) NOT NULL,
	nazwisko char(40) NOT NULL,
	telefon char(20),
	email char(40),
	rabat tinyint,
	opis varchar(200),
	CONSTRAINT PK_Klienci PRIMARY KEY (id_klienta)
);

CREATE INDEX PK_Klienci ON z_32414.dbo.Klienci (id_klienta);
