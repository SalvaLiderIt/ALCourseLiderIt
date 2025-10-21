permissionset 50103 "CrearJson Permission"
{
    Assignable = true;
    Permissions = tabledata "Sales Invoice Buffer" = RIMD,
        table "Sales Invoice Buffer" = X,
        codeunit "AAA Integration Mgt" = X,
        codeunit "Manual Test" = X,
        codeunit "WebService Methods" = X;
}