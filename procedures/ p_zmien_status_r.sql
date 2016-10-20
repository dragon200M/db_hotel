CREATE PROCEDURE p_zmien_status_r
@id_rezerwacji int, @status char
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
    ELSE IF @status NOT IN ('A','Z','N')
      PRINT 'Możliwe do wyboru A-anulowane,Z-zaplacone,N-nie zaplacone'
    ELSE
      BEGIN TRY
        UPDATE z_32414.dbo.Rezerwacje
        SET potwierdzone=@status
        WHERE id_rezerwacji=@id_rezerwacji;
        SET @PrintMessage=RTRIM(CAST(GETDATE() as nvarchar(20)))
          +':Zmnieniono status rezerwacji: '
          +RTRIM(CAST(@id_rezerwacji as nvarchar(10)))
          +': status:'+RTRIM(CAST(@status as nvarchar(3)))
        PRINT @PrintMessage
     END TRY

   BEGIN CATCH
     IF(@@TRANCOUNT > 0)
       ROLLBACK TRAN
   END CATCH

  END 
