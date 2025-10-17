tableextension 50101 "Insurance Ext" extends Insurance
{
    fields
    {
        field(50101; "Brokerage Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Brokerage Vendor No.';
            ToolTip = 'Specifies the brokerage vendor number for the customer.';
            TableRelation = Vendor;//  note just by adding this line i will add a droplist to the field and a lookup to the vendor table
            ValidateTableRelation = true;// Ensures the value entered exists in the Vendor table, not sure if is still needed
        }
        field(50102; "Alert"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Alert';
            ToolTip = 'Specifies the alert status for the insurance.';
        }
        field(50103; "Notice"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Notice';
            ToolTip = 'Specifies the notice date for the insurance.';
        }

    }

    // <<< CAMBIO CLAVE: AÑADIR ESTE TRIGGER >>>
    // Este bloque de código se ejecuta DESPUÉS de que un registro se ha modificado.
    trigger OnAfterModify()
    var
        InsuranceMgt: Codeunit InsuranceEmailMgt;
    begin
        // Comprobamos si el campo "Alert" ha cambiado y si su nuevo valor es 'true'.
        if Rec.Alert <> xRec.Alert and Rec.Alert then
            InsuranceMgt.NotifyInsuranceAlert(Rec);
    end;
}
