page 123456706 "CSD Seminar Comment Sheet"
{
    Caption = 'Seminar Comment Sheet';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar Comment Line";
    AutoSplitKey = true;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date;Date)
                {
                    
                }
                field(Code;Code)
                {
                 Visible = false;   
                }
                field(Comment;Comment)
                {
                    
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec:Boolean);
    begin
        SetupNewLine;
    end;
}