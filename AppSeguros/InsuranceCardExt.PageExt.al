pageextension 50101 "Insurance Card Ext" extends "Insurance Card"
{
    layout
    {
        addlast(General)
        {
            field("Insurance Policy No."; Rec."Insurance Policy No.")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Insurance Policy No.';
                ToolTip = 'Specifies the insurance policy number for the customer.';
            }
        }
    }
}