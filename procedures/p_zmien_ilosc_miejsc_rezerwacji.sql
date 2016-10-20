CREATE PROCEDURE p_zmien_ilosc_miejsc_rezerwacji
  @id_rezerwacji int, @miejsca int
AS
  DECLARE @r_istnieje INT
  DECLARE @PrintMessage nvarchar(100);
  SET @r_istnieje=(select id_rezerwacji from dbo.Rezerwacje WHERE
    id_rezerwacji=@id_rezerwacji);

   BEGIN
     IF @id_rezerwacji IS NULL
       PRINT 'ID rezerwacji nie może być null';
     ELSE IF @r_istnieje IS NULL
       PRINT 'BRAK REZERWACJI O PODANYM ID';
     ELSE IF @miejsca <1
       PRINT 'Wartosc musi byc wieksza od zera '
     ELSE
       BEGIN TRY
         UPDATE z_32414.dbo.Rezerwacje
         SET ilosc_osob=@miejsca
         WHERE id_rezerwacji=@id_rezerwacji;
         SET @PrintMessage=RTRIM(CAST(GETDATE() as nvarchar(20)))
            +':Zmnieniono ilosc miejsc rezerwacji: '
            +RTRIM(CAST(@id_rezerwacji as nvarchar(10)))
            +': na:'+RTRIM(CAST(@miejsca as nvarchar(3)))
            PRINT @PrintMessage
      END TRY
     BEGIN CATCH
      IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN
     END CATCH

   END
