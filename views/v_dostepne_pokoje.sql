CREATE VIEW v_dostepne_pokoje AS
SELECT *
FROM dbo.Pokoje
WHERE id_pokoju NOT IN
        (SELECT Z.id_pokoju
         FROM dbo.Zarezerwowane_pokoje AS Z
         INNER JOIN
             (SELECT *
              FROM dbo.Rezerwacje
              WHERE data_od<=GETDATE()
                  AND data_do>=GETDATE() )AS W ON Z.id_rezerwacji=W.id_rezerwacji)
    AND remont=0
