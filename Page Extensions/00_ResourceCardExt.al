pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
// Lab 5.1
// Task 2

{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CDS Quantity Per Day"; "CDS Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("CDS Room")
            {
                Visible = ShowMaxField;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (type = Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
}