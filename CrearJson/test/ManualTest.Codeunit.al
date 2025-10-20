codeunit 50109 "Manual Test"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnOpenPageEvent', '', true, true)]
    local procedure ManualTest()
    var
        WsMethods: Codeunit "Webservice Methods";
    begin
        WsMethods.SalesInvoices();
    end;

}