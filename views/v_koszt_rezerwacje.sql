CREATE VIEW v_koszt_rezerwacje AS
SELECT W.id_rezerwacji,
       Re.data_od,
       Re.data_do,
       DATEDIFF(DAY,Re.data_od,Re.data_do) AS dni,
       W.Koszt_pokoje,
       W.Koszt_uslugi,
       (W.Koszt_pokoje*DATEDIFF(DAY,Re.data_od,Re.data_do)+W.Koszt_uslugi) AS Suma
FROM
    (SELECT Z.id_rezerwacji,
            SUM(CP.cena) AS Koszt_pokoje,
            SUM (CASE
                     WHEN CU.cena IS NULL THEN 0
                     WHEN CU.cena IS NOT NULL THEN CU.cena
                 END) AS Koszt_uslugi
     FROM dbo.Zarezerwowane_pokoje AS Z
     LEFT JOIN dbo.Rejestr_uslug AS R ON Z.id_rezerwacji=R.id_rezerwacji
     INNER JOIN dbo.CenaPokoju AS CP ON Z.id_cena_pokoju=CP.id_cena_pokoju
     LEFT JOIN dbo.CenaUslug AS CU ON R.id_cena_uslugi=CU.id_cena_uslugi
     GROUP BY Z.id_rezerwacji) AS W
INNER JOIN dbo.Rezerwacje AS Re ON W.id_rezerwacji=Re.id_rezerwacji
