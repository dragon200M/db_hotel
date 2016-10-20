
CREATE VIEW v_uslugi_klient AS
SELECT DISTINCT U.id_rezerwacji,
                U.id_klienta,
                kl.imie,
                kl.nazwisko,
                STUFF(
                          (SELECT ','+ CONVERT(varchar(2),SB.id_uslugi) AS [text()]
                           FROM
                               (SELECT id_klienta, id_uslugi,id_rezerwacji
                                FROM dbo.Rejestr_uslug) AS SB
                           WHERE SB.id_klienta=U.id_klienta
                               AND SB.id_rezerwacji=U.id_rezerwacji
                               FOR XML PATH('') ),1,1,'')AS 'id_uslug'
FROM
    (SELECT id_klienta,
            id_uslugi,
            id_rezerwacji
     FROM dbo.Rejestr_uslug) AS U
INNER JOIN dbo.Klienci AS Kl ON U.id_klienta=Kl.id_klienta
INNER JOIN dbo.Rezerwacje AS R ON U.id_rezerwacji=R.id_rezerwacji
WHERE R.data_od <=GETDATE()
    AND R.data_do>=GETDATE()
