table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(20; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
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
        field(80; "Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
        }
        field(90; "Comment";Boolean)
        {
            //FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line"
            //where("Table Name"= const("Seminar"),
            // "No."=Field("No.")));
            Editable = false;
            Caption = 'Comment';
        }
        field(100; "Seminar Price";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;
        }
        field(110; "Gen. Prod. Posting Group";code[10])
        {
            TableRelation = "Gen. Product Posting Group";
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(120; "VAT Prod. Posting Group";code[10])
        {
            TableRelation = "VAT Product Posting Group";
            Caption = 'VAT Prod. Posting Group';
            DataClassification = ToBeClassified;
        }
        field(130; "No. Series";code[10])
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
        key(Key1;"Search Name")
        {
        }
    }


}