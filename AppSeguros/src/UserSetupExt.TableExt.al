tableextension 50102 UserSetupExt extends "User Setup"
{
    fields
    {
        field(50102; "Insurance Alert"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default Insurance No.';
            ToolTip = 'Specifies the default insurance number for the user.';
        }
    }

}