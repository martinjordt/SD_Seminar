page 123456701 "Seminar Card"
// Lab 5.2
// Task 5
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if AssistEdit then
                            currpage.update(false);
                    end;
                }
                field(Name; Name)
                { }
                field("Search Name"; "Search Name")
                { }
                field("Seminar Duration"; "Seminar Dutarion")
                { }
                field("Minimum Participants"; "Minimum Participants")
                { }
                field("Maximum Participants"; "Maximum Participants")
                { }
                field(Blocked; Blocked)
                { }
                field("Last Date Modified"; "Last Date Modified")
                { }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                { }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                { }
                field("Seminar Price"; "Seminar Price")
                { }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
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
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;                    
                }
            }
        }
    }
}