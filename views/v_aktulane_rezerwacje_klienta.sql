CREATE VIEW v_aktulane_rezerwacje_klienta AS
SELECT R.id_klienta,
       R.id_rezerwacji,
       V.id_pokoi
FROM dbo.Rezerwacje AS R
INNER JOIN dbo.v_rezerwacje_pokoje AS V ON R.id_rezerwacji=V.id_rezerwacji
