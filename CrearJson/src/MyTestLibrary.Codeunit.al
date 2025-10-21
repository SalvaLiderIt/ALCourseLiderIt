codeunit 50106 "My Test Library"
{
    local procedure GetExpectedJsonValue(): Text
    var
        JsonTxt: Text;

        // Labels for JSON structure
        InvoicesLbl: Label ' "Invoices" : [ ';
        SerialNumberLbl: Label '   "serial_number" : "00001" , ';
        DateLbl: Label '   "date":"%1"', Comment = 'La etiqueta contiene el marcador de posición %1.'; // La etiqueta contiene el marcador de posición %1
        JsonStartLbl: Label '{';
        JsonEndLbl: Label '}';
        // ArrayStartLbl: Label '[';
        ArrayEndLbl: Label ']';
        ObjectStartLbl: Label '  { ';
        ObjectEndLbl: Label '  } ';
    begin
        JsonTxt := StrSubstNo(JsonStartLbl);
        JsonTxt += StrSubstNo(InvoicesLbl);
        JsonTxt += StrSubstNo(ObjectStartLbl);
        JsonTxt += StrSubstNo(SerialNumberLbl);
        JsonTxt += StrSubstNo(DateLbl, Format(Today(), 0, 9));
        JsonTxt += StrSubstNo(ObjectEndLbl);
        JsonTxt += StrSubstNo(ArrayEndLbl);
        JsonTxt += StrSubstNo(JsonEndLbl);

        Message(RemoveNonVisibleCharsAndSpaces(JsonTxt));
    end;

    //remove all unnecesary spaces and non visible characters from a text
    procedure RemoveNonVisibleCharsAndSpaces(InString: Text): Text
    var
        i: Integer;
        ThisChar: Char;
        ThisInt: Integer;
        Result: Text;
    begin
        /*Asciis to Remove:
        9 = Tab
        10 = LineFeed
        13 = CarriageReturn
        all other ascii values between 0 and 31
        32 = space*/
        for i := 1 to StrLen(InString) do begin
            ThisChar := InString[i];
            ThisInt := ThisChar;
            if not (ThisInt IN [0 .. 32]) then
                Result += InString[i];
        end;
        exit(Result);
    end;
}