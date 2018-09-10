table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if("Search Name" = UpperCase(xRec.Name)) or("Search Name" = '') then
                    "Search Name" := Name;
            end;

        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
            DataClassification = ToBeClassified;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(60; "Search Name"; code[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
        }
        field(90; "Comment"; Boolean)
        {
            //FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line"
            //where("Table Name"= const("Seminar"),
            // "No."=Field("No.")));
            Editable = false;
            Caption = 'Comment';
        }
        field(100; "Seminar Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            TableRelation = "Gen. Product Posting Group";
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if(xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;

            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            TableRelation = "VAT Product Posting Group";
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(130; "No. Series"; code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {
        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : Record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := today;
    end;

    trigger OnDelete();
    begin
        //CommentLine.Reset; 
        //CommentLine.SetRange("Table Name", 
        //CommentLine."Table Name"::Seminar); 
        //CommentLine.SetRange("No.","No."); 
        // CommentLine.DeleteAll;   
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do
        begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}