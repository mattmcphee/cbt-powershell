Send-MailMessage -From "matt.imcphee@gmail.com" `
    -To "matt.imcphee@gmail.com" `
    -Subject "Check out my yt channel" `
    -Body "Here's the body of the email." `
    -SmtpServer 'smtp.google.com' `
    -UseSsl `
    -Port 587 `
    -Credential (Get-Credential) `
    -Priority High `
    -DeliveryNotificationOption OnSuccess, OnFailure