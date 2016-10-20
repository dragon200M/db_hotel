CREATE TRIGGER t_dodaj_rezerwacje
ON dbo.Rezerwacje
FOR INSERT
AS
  DECLARE @NewName varchar(30)
  DECLARE @LastName varchar(30)

  SELECT @NewName=(Select imie FROM dbo.Klienci WHERE id_klienta=(SELECT id_klienta
    FROM INSERTED))

  SELECT @LastName=(Select nazwisko FROM dbo.Klienci WHERE id_klienta=(SELECT
    id_klienta FROM INSERTED))
  PRINT 'Dodano rezerwacje dla '+@NewName+''+@LastName
