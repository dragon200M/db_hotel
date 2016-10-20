CREATE VIEW v_rezerwacje_pokoje AS
SELECT DISTINCT RS.id_rezerwacji,
                STUFF(
                          ( SELECT ','+ CONVERT(varchar(2),SB.id_pokoju) AS [text()]
                           FROM
                               (SELECT R.id_rezerwacji,R.id_klienta,P.id_pokoju
                                FROM dbo.Rezerwacje AS R
                                INNER JOIN dbo.Zarezerwowane_pokoje AS P ON R.id_rezerwacji =P.id_rezerwacji
                                WHERE (R.data_od<=GETDATE()
                                       AND R.data_do>=GETDATE())
                                    AND R.potwierdzone!='A' ) AS SB
                           WHERE SB.id_rezerwacji=RS.id_rezerwacji
                               FOR XML PATH('') ),1,1,'') AS 'id_pokoi'
FROM
    ( SELECT R.id_rezerwacji,
             R.id_klienta,
             P.id_pokoju
     FROM dbo.Rezerwacje AS R
     INNER JOIN dbo.Zarezerwowane_pokoje AS P ON R.id_rezerwacji =P.id_rezerwacji
     WHERE (R.data_od<=GETDATE()
            AND R.data_do>=GETDATE())
         AND R.potwierdzone!='A' ) AS RS
