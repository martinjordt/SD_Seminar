page 123456702 "CSD Seminar List"
// Lab 5.2
// Task 5
{
    PageType = List;
    SourceTable = "CSD Seminar";
    caption = 'Seminars';
    Editable = false;
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
                field("Seminar Dutarion"; "Seminar Dutarion")
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
                    // RunObject = page "Seminar Comment Sheet";
                    // RunPageLink = "Table Name" = const(Seminar),"no." = field("no.");
                    Image = Comment;
                }
            }
        }
    }
}