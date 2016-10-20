CREATE TABLE z_32414.dbo.Naprawa (
	id_naprawy int NOT NULL,
	id_usterki int NOT NULL,
	id_pracownika int NOT NULL,
	status bit NOT NULL,
	opis varchar(50),
	CONSTRAINT PK_Naprawa PRIMARY KEY (id_naprawy),
	CONSTRAINT FK_Naprawa_Pracownicy FOREIGN KEY (id_pracownika) REFERENCES z_32414.dbo.Pracownicy(id_pracownika) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT FK_Naprawa_Usterki FOREIGN KEY (id_usterki) REFERENCES z_32414.dbo.Usterki(id_usterki) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE INDEX PK_Naprawa ON z_32414.dbo.Naprawa (id_naprawy);
