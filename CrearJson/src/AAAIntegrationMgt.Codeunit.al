codeunit 50102 "AAA Integration Mgt"
{
    procedure GetSalesInvoicesAsJson(): Text
    var
        SalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary;
        ExecutionDate: Date;
        JsonResult: text;
    begin
        ExecutionDate := GetExecutionDate();
        WriteSalesInvoicesToBuffer(ExecutionDate, SalesInvoiceBuffer);
        JsonResult := SalesInvoiceBuffer.WriteAllRecToJson();
        exit(JsonResult);
    end;


    local procedure WriteSalesInvoicesToBuffer(ExecutionDate: Date; var SalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary)
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        SalesInvoiceHeader.SetRange("Posting Date", ExecutionDate);
        if SalesInvoiceHeader.IsEmpty() then
            exit;
        SalesInvoiceHeader.FindSet();
        repeat
            WriteHeaderDataToBuffer(SalesInvoiceHeader, SalesInvoiceBuffer);
        // Desglose de IVA
        // Datos de líneas
        until SalesInvoiceHeader.Next() = 0;
    end;

    local procedure WriteHeaderDataToBuffer(SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary)

    begin
        SalesInvoiceBuffer.Init();
        SalesInvoiceBuffer."Entry No." += 1;
        SalesInvoiceBuffer."Line Type" := SalesInvoiceBuffer."Line Type"::Header;
        SalesInvoiceBuffer."Document No." := SalesInvoiceHeader."No.";
        SalesInvoiceBuffer."Posting Date" := SalesInvoiceHeader."Posting Date";
        SalesInvoiceBuffer.Insert();
    end;

    local procedure GetExecutionDate(): Date
    begin
        exit(Today());
    end;

}