tableextension 50145 "Insurance Ext" extends Insurance
{
    fields
    {
        field(50100; "Insurance Policy No."; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Insurance Policy No.';
        }
    }
}