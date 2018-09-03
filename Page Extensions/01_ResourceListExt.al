pageextension 123456701 "CSD ResourceListExt" extends "Resource List"
// Lab 5.1
// Task 3
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnOpenPage();
    begin
        ShowMaxField := true;
        ShowType := true;
        rec.FilterGroup(3);
        ShowType := (Getfilter(Type)='');
        ShowMaxField := (GetFilter(Type)=format(Type::Machine));
        rec.FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        ShowType: Boolean;

}