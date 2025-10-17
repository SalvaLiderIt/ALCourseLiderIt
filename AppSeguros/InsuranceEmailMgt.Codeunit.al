codeunit 50100 InsuranceEmailMgt
{
    trigger OnRun()
    begin
        CheckAndSendInsuranceEmailNotifications();
    end;

    local procedure CheckAndSendInsuranceEmailNotifications()
    var
        varInsurance: Record Insurance;
    begin
        // recorrer todos los seguros
        varInsurance.SetRange(Alert, true);
        if varInsurance.FindSet() then
            repeat
                //  todo comprobar si hay que mandar el email
                //  todo mandar el email a tantos usuarios como sea necesario
                SendInsuranceEmailNotification();
            until varInsurance.Next() = 0;
    end;


    local procedure SendInsuranceEmailNotification()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        SenderAddress: Text[250];
        Recipients: Text[250];
        Subject: Text[100];
        Body: Text[1000];
    begin
        //  note Configurar los datos del email reemplazar?
        SenderAddress := 'sepabeat@gmail.com';
        Recipients := 'spavila@liderit.es';
        Subject := 'Notificación de Seguro - test primer email programado';
        Body := 'Estimado usuario,' + '<br><br>' +
                'Le informamos de que eres la puta ostia si esto funciona a la primera, y que el seguro está próximo a vencer.' + '<br><br>' +
                'Saludos cordiales';

        // Crear el mensaje de email
        EmailMessage.Create(Recipients, Subject, Body, true);
        // No SetSender method available on Email Message codeunit; configure the sender address
        // in the SMTP/Email Setup on the server or use a supported API to set the From address.

        // Enviar el email
        if not Email.Send(EmailMessage) then
            Error('Error al enviar el email de notificación');
    end;

}