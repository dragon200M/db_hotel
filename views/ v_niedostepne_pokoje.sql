CREATE VIEW v_niedostepne_pokoje AS
SELECT id_pokoju,
       CASE
           WHEN remont=1 THEN 'Niedostępny'
       END AS remont
FROM Pokoje
WHERE remont = 1
