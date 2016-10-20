CREATE PROCEDURE p_dodaj_rabat
@id_klienta int,@rabat int
AS
 DECLARE @osoba_istnieje INT
 DECLARE @PrintMessage nvarchar(100);
 IF @id_klienta IS NOT NULL
    SET @osoba_istnieje=
       (SELECT id_klienta FROM dbo.Klienci  WHERE id_klienta=@id_klienta);

     BEGIN IF @id_klienta IS NULL
      PRINT 'ID osoby nie może być null';
     ELSE IF @osoba_istnieje IS NULL
      PRINT 'BRAK KLIENTA O PODANYM ID';
     ELSE IF @rabat<0
      PRINT 'RABAT NIE MOZE BYC UJEMNY'
     ELSE IF @rabat >100
      PRINT 'RABAT NIE MOZE BYC WIEKSZY NIZ 100'
     ELSE
      BEGIN TRY
       UPDATE z_32414.dbo.Klienci
       SET rabat=@rabat
       WHERE id_klienta=@id_klienta;

       SET @PrintMessage=RTRIM(CAST(GETDATE() AS nvarchar(20))) +':Dodano rabat klientowi o id: '
         +RTRIM(CAST(@id_klienta AS nvarchar(10))) +
         ': rabat:'+RTRIM(CAST(@rabat AS nvarchar(3)))
         PRINT @PrintMessage
     END TRY

    BEGIN CATCH
      IF(@@TRANCOUNT > 0)
        ROLLBACK TRAN
    END CATCH
END
