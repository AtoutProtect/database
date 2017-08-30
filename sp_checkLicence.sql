CREATE PROCEDURE `check_licence`(IN licenceSerial varchar(255),IN email varchar(255))
BEGIN
SELECT *
FROM achat, user, licence
WHERE user.email = email
AND user.ID = achat.User_ID
AND achat.Achat_ID = licence.achat_ID
AND licence.Licence_Serial = licenceSerial;

END