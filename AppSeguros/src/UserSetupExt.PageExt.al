pageextension 50102 UserSetupExt extends "User Setup"
{
    layout
    {
        addbefore(email)
        {
            field("Insurance Alert"; Rec."Insurance Alert")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Insurance Alert';
                ToolTip = 'Specifies the insurance alert status for the user.';
            }
        }
    }

}