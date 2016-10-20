CREATE TABLE z_32414.dbo.Pracownicy (
	id_pracownika int NOT NULL,
	id_stanowiska int,
	imie char(20),
	nazwisko char(30),
	email char(30),
	telefon char(20),
	CONSTRAINT PK_Pracownicy PRIMARY KEY (id_pracownika),
	CONSTRAINT FK_Pracownicy_Stanowiska1 FOREIGN KEY (id_stanowiska) REFERENCES z_32414.dbo.Stanowiska(id_stanowiska) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Pracownicy ON z_32414.dbo.Pracownicy (id_pracownika);
