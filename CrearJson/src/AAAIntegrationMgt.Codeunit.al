codeunit 50102 "AAA Integration Mgt"
{
    procedure GetSalesInvoicesAsJson(): Text
    begin
        exit('{"test-sepa" : "FV19003"}');
    end;

}