table 123456700 "CSD Seminar Setup"
// Lab 5.2
// Task 1
{
    Caption = 'Seminar Setup';
    
    fields
    {
        field(10;"Primary Key";Code[10])
        {
            Caption = 'Seminar Setup';
        }
        field(20;"Seminar Nos.";Code[20])
        {
            Caption = 'Seminar Nos.';
            TableRelation = "No. Series";
        }
        field(30;"Seminat Registration Nos.";Code[20])
        {
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
        }
        field(40;"Posted Seminar Reg. Nos.";Code[20])
        {
            Caption = 'Posted Seminar Reg. Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}