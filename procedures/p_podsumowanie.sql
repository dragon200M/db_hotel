CREATE PROCEDURE p_podsumowanie
  @id_rezerwacji int=null, @id_s_platnosc int=null,@status bit=null
AS
  DECLARE @ilosc_dni int
  DECLARE @kwota float
  DECLARE @zaplacone bit

  SET @ilosc_dni= (
    SELECT
     CASE
      WHEN DATEDIFF(day,data_od,d) = 0 THEN 1
      WHEN DATEDIFF(day,data_od,d) >0 THEN DATEDIFF(day,data_od,d)
     END  AS dni
   FROM (
     SELECT id_rezerwacji,data_od,
      CASE
       WHEN data_do >GETDATE() AND data_od < GETDATE() THEN GETDATE()
       WHEN data_do >GETDATE() AND data_od > GETDATE() THEN data_do
       WHEN data_do <=GETDATE() THEN data_do
      END AS d
     ,Koszt_pokoje,Koszt_uslugi from dbo.v_koszt_rezerwacje
  )AS W
  WHERE id_rezerwacji=@id_rezerwacji)


  SET @kwota=(
    SELECT
      (Koszt_pokoje*(
        CASE
          WHEN DATEDIFF(day,data_od,d) = 0 THEN 1
          WHEN DATEDIFF(day,data_od,d) >0 THEN DATEDIFF(day,data_od,d)
        END)+Koszt_uslugi) AS Suma
    FROM (
      SELECT id_rezerwacji,data_od,
        CASE
          WHEN data_do >GETDATE() AND data_od < GETDATE() THEN GETDATE()
          WHEN data_do >GETDATE() AND data_od > GETDATE() THEN data_do
          WHEN data_do <=GETDATE() THEN data_do
        END AS d
      ,Koszt_pokoje,Koszt_uslugi
      FROM dbo.v_koszt_rezerwacje
      )AS W
      WHERE id_rezerwacji=@id_rezerwacji)



   SET @zaplacone=(SELECT status FROM dbo.Platnosc WHERE id_rezerwacji=@id_rezerwacji)

  BEGIN
    IF @id_rezerwacji IS NULL
      PRINT 'Podaj id_rezerwacji'
    ELSE IF @id_s_platnosc IS NULL
      PRINT 'Podaj id platnosci'
    ELSE IF @status IS NULL
      PRINT 'Podaj status 0 lub 1'
    ELSE IF @zaplacone = 1
      PRINT 'Juz zaplacono'
    ELSE IF @zaplacone = 0
		  UPDATE z_32414.dbo.Platnosc
      SET status=1
      WHERE id_rezerwacji=@id_rezerwacji;
		ELSE
      INSERT INTO z_32414.dbo.Platnosc
      ( id_rezerwacji, kwota, ilosc_dni, id_s_platnosc, status)
      VALUES(@id_rezerwacji, @kwota, @ilosc_dni, @id_s_platnosc,@status);
END
