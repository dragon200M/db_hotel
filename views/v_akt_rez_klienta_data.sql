CREATE VIEW v_akt_rez_klienta_data AS
SELECT V.id_klienta,
       V.id_rezerwacji,
       V.id_pokoi,
       R.data_od,
       R.data_do,
       DATEDIFF(DAY,GETDATE(),R.data_do) AS Pozostalo_dni
FROM dbo.v_aktulane_rezerwacje_klienta AS V
INNER JOIN dbo.Rezerwacje AS R ON V.id_rezerwacji=R.id_rezerwacji
