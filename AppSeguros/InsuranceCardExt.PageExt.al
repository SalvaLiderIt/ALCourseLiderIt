pageextension 50101 "Insurance Card Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Insurance Policy No."; Rec."Insurance Policy No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the insurance policy number for the customer.';
            }
        }
    }
}