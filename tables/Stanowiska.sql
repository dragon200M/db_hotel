CREATE TABLE z_32414.dbo.Stanowiska (
	id_stanowiska int NOT NULL,
	nazwa char(20) NOT NULL,
	opis varchar(50),
	CONSTRAINT PK_Stanowiska PRIMARY KEY (id_stanowiska)
);

CREATE INDEX PK_Stanowiska ON z_32414.dbo.Stanowiska (id_stanowiska);
