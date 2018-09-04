codeunit 123456739 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateFindRecord(var DocumentEntry: record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text);
    var
        SeminarLedgerEntry: record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;

    begin
        if PostedSeminarRegHeader.ReadPermission then begin
            PostedSeminarRegHeader.reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.count;

            with DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;

                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;

                init;
                "Entry No." := NextEntryNo;
                "Table ID" := database::"CSD Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := CopyStr(PostedSeminarRegHeader.TableCaption, 1, maxstrlen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                insert;
            end;
        end;

        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.reset;
            SeminarLedgerEntry.SetFilter("document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := SeminarLedgerEntry.count;

            with DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;

                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;

                init;
                "Entry No." := NextEntryNo;
                "Table ID" := database::"CSD Seminar Ledger Entry";
                "Document Type" := 0;
                "Table Name" := CopyStr(SeminarLedgerEntry.TableCaption, 1, maxstrlen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                insert;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean);
    var
        SeminarLedgerEntry: record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
    begin
        case TableID of
        Database::"CSD Posted Seminar Reg. Header" :
        begin
            PostedSeminarRegHeader.reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            page.Run(0, PostedSeminarRegHeader);
        end;
        database::"CSD Seminar Ledger Entry" :
        begin
            SeminarLedgerEntry.reset;
            SeminarLedgerEntry.SetFilter("document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            page.Run(0, SeminarLedgerEntry);
        end;
        end;
    end;
}
