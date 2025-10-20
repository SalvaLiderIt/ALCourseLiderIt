codeunit 50101 "WebService Methods"
{
    //These Codeunits implements the methods used to integrate Business Central with the third party software
    procedure SalesInvoices()
    var
        AAAIntegrationMgt: Codeunit "AAA Integration Mgt";
        JsonRequest: Text;
    begin
        JsonRequest := AAAIntegrationMgt.GetSalesInvoicesAsJson();
        Message(JsonRequest);
    end;

    procedure SalesCrMemos()
    begin
        //  todo build json
        //  todo call web service
        // todo process answer
        //  todo update log
    end;

    procedure Customers()
    begin
        //  todo build json
        //  todo call web service
        // todo process answer
        //  todo update log
    end;


    procedure Payments()
    begin
        //  todo build json
        //  todo call web service
        // todo process answer
        //  todo update log
    end;

}

