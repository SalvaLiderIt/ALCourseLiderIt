table 50100 "Sales Invoice Buffer"
{
    DataClassification = ToBeClassified;

    fields
    {
        // The Following block of fields are used for Internal purposes
        field(1; "Entry No."; Integer) { DataClassification = CustomerContent; }
        field(2; "Line Type"; Enum "Buffer Line Type") { DataClassification = CustomerContent; }
        //The Following block of field are used for the sales invoice header data
        field(10; "Document No."; Code[20]) { DataClassification = CustomerContent; }
        field(20; "Posting Date"; Date) { DataClassification = CustomerContent; }
        field(30; "Name"; Text[100]) { DataClassification = CustomerContent; }
        field(40; "Address"; Text[100]) { DataClassification = CustomerContent; }
        field(50; "Post Code"; Code[20]) { DataClassification = CustomerContent; }
        field(60; "Amount"; Decimal) { DataClassification = CustomerContent; }
        field(70; "Amount Incl. VAT"; Decimal) { DataClassification = CustomerContent; }
        // The following block of fields are used for the tax subjson
        field(100; "VAT %"; Decimal) { DataClassification = CustomerContent; }
        field(110; "VAT Base Amount"; Decimal) { DataClassification = CustomerContent; }
        field(120; "VAT Amount"; Decimal) { DataClassification = CustomerContent; }
        // The following block of fields are used for the Lines subjson
        field(200; "Description"; Text[100]) { DataClassification = CustomerContent; }
        field(210; "Quantity"; Decimal) { DataClassification = CustomerContent; }
        field(220; "Unit Price"; Decimal) { DataClassification = CustomerContent; }
    }
}