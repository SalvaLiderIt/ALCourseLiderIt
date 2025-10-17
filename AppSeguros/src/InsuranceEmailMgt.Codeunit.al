codeunit 50100 InsuranceEmailMgt
{
    trigger OnRun()
    begin
        CheckAndSendInsuranceEmailNotifications();
    end;

    local procedure CheckAndSendInsuranceEmailNotifications()
    var
        varInsurance: Record Insurance;
        varUserSetup: Record "User Setup";
    begin
        // recorrer todos los seguros
        varInsurance.SetRange(Alert, true);
        if varInsurance.FindSet() then
            repeat
                //  todo comprobar si hay que mandar el email
                //  todo mandar el email a tantos usuarios como sea necesario
                varUserSetup.SetRange("Insurance Alert", true);
                if varUserSetup.FindSet() then
                    repeat
                        SendInsuranceEmailNotification(varInsurance, varUserSetup);
                    until varUserSetup.Next() = 0;
            until varInsurance.Next() = 0;
    end;


    procedure SendInsuranceEmailNotification(var varInsurance: Record Insurance; var varUserSetup: Record "User Setup")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        SenderAddress: Text[250];
        Recipients: Text[250];
        Subject: Text[100];
        Body: Text[1000];
    begin
        //  note Aquí están los detalles del email
        //  info la siguiente condición es muy útil para mostrar errores en pantalla en caso de que la información del usuario no esté completa
        if varUserSetup."E-Mail" = '' then begin
            Message('El usuario %1 no tiene una dirección de correo electrónico válida.', varUserSetup."User ID");
            exit;
        end;
        // todo falta por agregar que si el email está en blanco no se envía
        SenderAddress := 'sepabeat@gmail.com';
        Recipients := varUserSetup."E-Mail";
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

    // Método público para ser llamado desde el trigger de la tabla
    procedure NotifyInsuranceAlert(var Insurance: Record Insurance)
    var
        UserSetup: Record "User Setup";
    begin
        // Buscar todos los usuarios que quieren recibir alertas de seguros
        UserSetup.SetRange("Insurance Alert", true);
        if UserSetup.FindSet() then
            repeat
                SendInsuranceEmailNotification(Insurance, UserSetup);
            until UserSetup.Next() = 0;
    end;

}