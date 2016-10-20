CREATE TABLE z_32414.dbo.Sposob_platnosci (
	id_s_platnosc int NOT NULL,
	metoda char(10) NOT NULL,
	opis varchar(50),
	CONSTRAINT PK_Sposob_platnosci PRIMARY KEY (id_s_platnosc)
);

CREATE INDEX PK_Sposob_platnosci ON z_32414.dbo.Sposob_platnosci (id_s_platnosc);
