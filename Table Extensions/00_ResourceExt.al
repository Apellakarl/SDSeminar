tableextension 123456700 "CSD Resource Type" extends Resource
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;

        }
        field(123456701; "CSD Resource Type"; Option)
        {
            OptionMembers = "Internal", "External";
        }
        field(123456702; "CSD Maximum Participants"; Integer)
        {

        }
        field(123456703; "CSD Quantity Per Day"; Decimal)
        {

        }
        
        
    }

    var
        myInt: Integer;
}