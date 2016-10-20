CREATE PROCEDURE p_dodaj_pokoje_r
  @id_rezerwacji int=null,
  @id_pokoju int =null,
  @id_cena_pokoju int =null,
  @opis varchar(50)=null

AS
  DECLARE @rez int
  DECLARE @pok int
  DECLARE @cena int
  DECLARE @ilosc_cen int
  DECLARE @dostepne_pokoje int
  DECLARE @miejsca_info varchar(200)
  DECLARE @SqlString VARCHAR(MAX)

  SET @rez=(SELECT id_rezerwacji FROM z_32414.dbo.Rezerwacje WHERE
    id_rezerwacji=@id_rezerwacji)
  SET @pok=(SELECT id_pokoju FROM z_32414.dbo.Pokoje WHERE id_pokoju=@id_pokoju)
  SET @cena=(SELECT id_cena_pokoju FROM z_32414.dbo.CenaPokoju WHERE
    id_cena_pokoju=@id_cena_pokoju)
  SET @ilosc_cen=(SELECT COUNT(cena) FROM dbo.CenaPokoju WHERE
    id_pokoju=@id_pokoju)
  SET @dostepne_pokoje=(SELECT id_pokoju FROM dbo.v_dostepne_pokoje WHERE
    id_pokoju=@id_pokoju)

BEGIN
  BEGIN
    SELECT  DISTINCT
     @miejsca_info =(
       SELECT 'Dostepne pokoje: id:'+CONVERT(varchar(4),id_pokoju)+'
       miejsc:'+CONVERT(varchar(4),miejsc)+' '
       FROM	dbo.v_dostepne_pokoje
    FOR XML PATH('')
   )FROM    dbo.v_dostepne_pokoje

  SELECT  DISTINCT
     @SqlString =(
       SELECT 'id:'+CONVERT(varchar(4),id_cena_pokoju)+' cena:'+str(cena,5,2) + ' '
       FROM dbo.CenaPokoju
       WHERE id_pokoju=@id_pokoju
     FOR XML PATH('')
  )FROM dbo.CenaPokoju
  END

  IF @pok IS NOT NULL AND @ilosc_cen>1 AND @id_cena_pokoju IS NULL
     PRINT RTRIM(CAST(GETDATE() as nvarchar(20)))+' Wybierz odpowiednia cene:'+@SqlString
  ELSE IF @id_rezerwacji IS NULL
     PRINT 'id rezerwacji nie moze byc null'
  ELSE IF @id_pokoju IS NULL
     PRINT 'id pokoju nie moze byc null'
  ELSE IF @rez IS NULL
     PRINT 'Brak rezerwacji o padanym id'
  ELSE IF @pok IS NULL
     PRINT 'Brak pokoju o podanym id'
  ELSE IF @dostepne_pokoje IS NULL
     PRINT 'Pokoj niedostepny.'+@miejsca_info
  ELSE IF @id_cena_pokoju IS NULL
     PRINT 'id ceny nie może być null,dostępne ceny dla pokoju: '+@SqlString
  ELSE
     INSERT INTO dbo.Zarezerwowane_pokoje
     (id_rezerwacji, id_pokoju, id_cena_pokoju, opis)
     VALUES(@id_rezerwacji, @id_pokoju, @id_cena_pokoju, @opis)

END
