page 123456702 "CSD Seminar List"
// Lab 5.2
// Task 5
{
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 123456701;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }
                field("Seminar Dutarion"; "Seminar Duration")
                {
                }
                field("Seminar Price"; "Seminar Price")
                {
                }
                field("Minimum Participants"; "Minimum Participants")
                {
                }
                field("Maximum Participants"; "Maximum Participants")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            { }
            systempart(Notes; Notes)
            { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Seminar")
            {
                action("Comments")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar),"no." = field("no.");
                    Image = Comment;
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = Page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("no.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl+F7";
                    Image = WarrantyLedger;
                }
                action("Registrations")
                {
                    Caption = 'Registrations';
                    RunObject = page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                    Promoted = true;
                    PromotedCategory = Process;
                }
            }
        }
        area(Processing)
        {
            action("Seminar Registration")
            {
                Caption = 'Seminar Registration';
                RunObject= page "CSD Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory=New;
            }
        }
    }
}