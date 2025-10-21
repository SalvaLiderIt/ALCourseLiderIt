// pagina para pruebas de codigo AL de salva
// para comprobar estas pruebas, en concreto la de eliminar espacios, buscar la página en BC "Pruebas Salva", y darle a acciones 

#pragma warning disable AA0247
page 50100 "Pruebas Salva"
#pragma warning restore AA0247
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Pruebas Salva';

    actions
    {
        area(Processing)
        {
            action("Generate and Show JSON")
            {
                ApplicationArea = All;
                Caption = 'Generate and Show JSON';
                Image = Web;
                ToolTip = 'Use this to generate a JSON.';

                trigger OnAction()
                //prueba de metodo RemoveNonVisibleCharsAndSpaces
                var
                    StringUtils: Codeunit "My Test Library";
                    entrada: Text;
                    salida: Text;
                begin
                    entrada := ' Hola   Mundo' + '\n' + '     Esto es una    prueba del  metodo para eliminar espacios.';
                    salida := StringUtils.RemoveNonVisibleCharsAndSpaces(entrada);
                    Message('Texto original: ' + entrada + '\n\n' + 'Texto limpio: ' + salida);
                end;


            }
        }
    }
}