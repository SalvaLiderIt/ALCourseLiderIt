pageextension 50101 "Insurance Card Ext" extends "Insurance Card"
{
    layout
    {
        addafter("Insurance Vendor No.")
        {
            field("Brokerage Vendor No."; Rec."Brokerage Vendor No.")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Brokerage Vendor No.';
                ToolTip = 'Specifies the brokerage vendor number for the customer.';
            }
        }
    }
}