table 50100 "Sales Invoice Buffer"
{
    DataClassification = ToBeClassified;
    Caption = 'Sales Invoice Buffer', comment = 'ESP="Sales Invoice Buffer"';

    fields
    {
        // The Following block of fields are used for Internal purposes
        field(1; "Entry No."; Integer) { DataClassification = CustomerContent; }
        field(2; "Line Type"; Enum "Buffer Line Type") { DataClassification = CustomerContent; }
        //The Following block of field are used for the sales invoice header data
        field(10; "Document No."; Code[20])
        {
            Caption = 'serial_number', Locked = true;
            DataClassification = CustomerContent;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'date', Locked = true;
            DataClassification = CustomerContent;
        }
        field(30; "Name"; Text[100])
        {
            Caption = 'name', Locked = true;
            DataClassification = CustomerContent;
        }
        field(40; "Address"; Text[100])
        {
            Caption = 'address', Locked = true;
            DataClassification = CustomerContent;
        }
        field(50; "Post Code"; Code[20])
        {
            Caption = 'cp', Locked = true;
            DataClassification = CustomerContent;
        }
        field(60; "Amount"; Decimal)
        {
            Caption = 'amount', Locked = true;
            DataClassification = CustomerContent;
        }
        field(70; "Amount Incl. VAT"; Decimal)
        {
            Caption = 'amouuntIncVat', Locked = true;
            DataClassification = CustomerContent;
        }
        // The following block of fields are used for the tax subjson
        field(100; "VAT %"; Decimal)
        {
            Caption = 'tax_percentage', Locked = true;
            DataClassification = CustomerContent;
        }
        field(110; "VAT Base Amount"; Decimal)
        {
            Caption = 'tax_base', Locked = true;
            DataClassification = CustomerContent;
        }
        field(120; "VAT Amount"; Decimal)
        {
            Caption = 'tax_amount', Locked = true;
            DataClassification = CustomerContent;
        }
        // The following block of fields are used for the Lines subjson
        field(200; "Description"; Text[100])
        {
            Caption = 'description', Locked = true;
            DataClassification = CustomerContent;
        }
        field(210; "Quantity"; Decimal)
        {
            Caption = 'quantity', Locked = true;
            DataClassification = CustomerContent;
        }
        field(220; "Unit Price"; Decimal)
        {
            Caption = 'unit_price', Locked = true;
            DataClassification = CustomerContent;
        }
    }
}