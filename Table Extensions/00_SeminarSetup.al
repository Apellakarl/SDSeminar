
table 123456700 "CSD Seminar Setup"
{
    DataClassification     = ToBeClassified;
    Caption = 'Seminar Setup’';
    
    fields
    {
        field(10;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Seminar Nos.";Code[20])
        {
            Caption = 'Seminar Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(30;"Seminar Registration Nos.";Code[20])
        {
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(40;"Posted Seminar Reg. Nos.";Code[20])
        {
            Caption = 'Posted Seminar Reg. Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
    
}
