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
        addafter(Posting)
        {
            group(InsNotification)
            {
                field("Alert"; Rec.Alert)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Alert';
                    ToolTip = 'Specifies the alert status for the insurance.';
                }
                field("Notice"; Rec.Notice)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Notice';
                    ToolTip = 'Specifies the notice date for the insurance.';
                }
            }

        }
    }
}