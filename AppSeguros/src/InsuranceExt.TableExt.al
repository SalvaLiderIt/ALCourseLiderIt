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

    }
}