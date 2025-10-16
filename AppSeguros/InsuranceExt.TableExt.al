tableextension 50100 "Insurance Ext" extends Customer
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