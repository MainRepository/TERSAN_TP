table 50100 MovConferimentoWINWASTE
{
    DataClassification = ToBeClassified;
    caption = 'Mov. Conferimento WINWASTE';
    DataPerCompany = true;

    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Movimento';
        }
        field(2; Codice; Text[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if (EntryNo = 0) then
                    Evaluate(EntryNo, Codice);
            end;
        }
        field(3; Causale; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Causale';
        }
        field(4; Operatore; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Operatore';
        }
        field(5; POSI; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'POSI';
        }
        field(6; DATR; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'DATR';
        }
        field(7; ORA; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ORA';
        }
        field(8; FORMU; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'FORMU';
        }
        field(9; DATD; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'DATD';
        }
        field(10; NUMD; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'NUMD';
        }
        field(11; SCON; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'SCON';
        }
        field(12; RIFER; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'RIFER';
        }
        field(13; DTUK; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'DTUK';

            trigger OnValidate();
            begin
                ValidateDtuk();
            end;
        }
        field(14; CLIE; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CLIE';
        }
        field(15; CONT; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CONT';
        }
        field(16; PROD; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'PROD';
        }
        field(17; AUTP; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'AUTP';
        }
        field(18; MAG1; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'MAG1';
        }
        field(19; TRANS; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'TRANS';
        }
        field(20; AUTT; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'AUTT';
        }
        field(21; MEX; Text[6])
        {
            DataClassification = ToBeClassified;
            Description = 'MEZ';
        }
        field(22; AUTIST; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'AUTIST';
        }
        field(23; RIM; Text[6])
        {
            DataClassification = ToBeClassified;
            Description = 'RIM';
        }
        field(24; SMAL; Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'SMAL';
        }
        field(25; AUTS; Text[6])
        {
            DataClassification = ToBeClassified;
            Description = 'AUTS';
        }
        field(26; MAG2; Text[6])
        {
            DataClassification = ToBeClassified;
            Description = 'MAG2';
        }
        field(27; MODA; Text[6])
        {
            DataClassification = ToBeClassified;
            Description = 'MODA';
        }
        field(28; POS2; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'POS2';
        }
        field(29; INTE; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'INTE';
        }
        field(30; AUTI; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'AUTI';
        }
        field(31; CER; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CER';
        }
        field(32; RIRI; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'RIRI';
        }
        field(33; TIPOL; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPOL';
        }
        field(34; FISI; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'FISI';
        }
        field(35; RECUP; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'RECUP';
        }
        field(36; QCAT; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'QCAT';
        }
        field(37; LORDO; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'LORDO';
        }
        field(38; TARA; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'TARA';
        }
        field(39; NETTO; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'NETTO';
        }
        field(40; VOLU; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'VOLU';
        }
        field(41; UM; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'UM';
        }
        field(42; CATS; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATS';
        }
        field(43; RACS; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'RACS';
        }
        field(44; TIPS; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPS';
        }
        field(45; NCARD; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'NCARD';
        }
        field(46; NATU; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = '';
        }
        field(47; CARP; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'CARP';
        }
        field(48; SOST; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'SOST';
        }
        field(49; DES; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'DES';
        }
        field(50; CARC; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'CARC';
        }
        field(51; NOT1; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'NOT1';
        }
        field(52; NOT2; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'NOT2';
        }
        field(53; NOT3; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'NOT3';
        }
        field(54; AVVE; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'AVVE';
        }
        field(55; DATI; Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'DATI';
        }
        field(56; ORAI; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ORAI';
        }
        field(57; DATF; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'DATF';
        }
        field(58; ORAF; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ORAF';
        }
        field(59; COLL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'COLL';
        }
        field(60; ADR; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ADR';
        }
        field(61; CONTE; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'CONTE';
        }
        field(62; PARTI; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'PART';
        }
        field(63; ATTR; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'ATTR';
        }
        field(64; ARRI; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'ARRI';
        }
        field(65; COMU; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'COMU';
        }
        field(66; PRES; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'PRES';
        }
        field(67; IND; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'IND';
        }
        field(68; ATTI; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'ATTI';
        }
        field(69; TIPA; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPA';
        }
        field(70; COBAT; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'COBAT';
        }
        field(71; REG1; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'REG1';
        }
        field(72; REG2; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'REG2';
        }
        field(73; REG3; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'REG3';
        }
        field(74; REG4; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'REG4';
        }
        field(75; GRUPADD; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'GRUPADD';
        }
        field(76; DETTAGLIO; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'DETTAGLIO';
        }
        field(77; RELAZ; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ';
        }
        field(78; FOGLIO; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'FOGLIO';
        }
        field(79; C1; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C1';
        }
        field(80; C2; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C2';
        }
        field(81; C3; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C3';
        }
        field(82; C4; Text[15])
        {
            DataClassification = ToBeClassified;
            Description = 'C4';
        }
        field(83; C5; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C5';
        }
        field(84; C6; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C6';
        }
        field(85; C7; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C7';
        }
        field(86; C8; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C8';
        }
        field(87; C9; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'C9';
        }
        field(88; PROT1; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PROT1';
        }
        field(89; PROT2; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PROT2';
        }
        field(90; PROT3; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PROT3';
        }
        field(91; PROT4; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'PROT4';
        }
        field(92; GIASCAR; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'GIASCAR';
            trigger OnValidate();
            BEGIN
                // commentato il 070519 perchè è necessario l'utilizzo di DTUK
                //if (GIASCAR <> '') then
                //    Evaluate("Quantita Da Fatturare", GIASCAR);
            END;
        }
        field(93; STATO; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'STATO';
        }
        field(94; NFATT; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NFATT';
        }
        field(95; LEGAME; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'LEGAME';
        }
        field(96; KGNUM; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KGNUM';
        }
        field(97; MCNUM; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'MCNUM';
        }
        field(98; VER; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'VER';
        }
        field(99; ID; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ID';
        }
        field(100; IDT; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'IDT';
        }
        field(101; BLOK; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'BLOK';
        }
        field(102; IMPORT; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'IMPORT';
        }
        field(103; "Quantita Da Fatturare"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Quantità Da Fatturare';
        }
        field(104; "Data Movimento"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Movimento';
            trigger OnValidate();
            begin
                "NrSettimana" := DATE2DWY("Data Movimento", 2);
                VerificaTipoSettimana("NrSettimana", gInt);
            end;
        }
        field(105; NrSettimana; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Settimana';
        }
        field(106; TipoSettimana; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Tipo Settimana';
            OptionMembers = Totale,Parziale;
            //OptionCaptionML = ITA =Totale, Parziale;
        }
        field(107; NrGiorniAttivi; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Giorni Attivi';
        }
        field(108; MovimentoLavoratoInNAV; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Movimento Lavorato in NAV';
        }
        field(109; Lunghezza; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Lunghezza';
        }
        field(110; RELAZ_1; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_1';
        }
        field(111; RELAZ_2; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_2';
        }
        field(112; RELAZ_3; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_3';
        }
        field(113; RELAZ_4; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_4';
        }
        field(114; RELAZ_5; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_5';
        }
        field(115; RELAZ_6; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_6';
        }
        field(116; RELAZ_7; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_7';
        }
        field(117; RELAZ_8; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'RELAZ_8';
        }
        field(118; RifiutoInRecupero; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'RifiutoInRecupero';
        }

    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
        key(Second; PROD, "Data Movimento")
        {
            Clustered = false;
        }
        key(Tre; Codice)
        {
            Clustered = false;
        }
        key(Quattro; CATS, "Data Movimento")
        {
            Clustered = false;
        }
    }

    Var
        gInt: Integer;

    trigger OnInsert()
    begin
        VerificaRelazione;
    end;

    trigger OnModify()
    begin
        VerificaRelazione;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure ValidateDtuk();
    var
        gg: Integer;
        mm: Integer;
        aaaa: Integer;
    begin
        //IF (GIASCAR <> '0') THEN
        //    IF (DTUK <> '') THEN BEGIN
        //        EVALUATE(gg, COPYSTR(DTUK, 7, 2));
        //        EVALUATE(mm, COPYSTR(DTUK, 5, 2));
        //        EVALUATE(aaaa, COPYSTR(DTUK, 1, 4));
        //        VALIDATE("Data Movimento", DMY2DATE(gg, mm, aaaa));
        //    END;
        if ((StrPos(DTUK, '$') = 0) and (DTUK <> '')) then begin
            EVALUATE(gg, COPYSTR(DTUK, 7, 2));
            EVALUATE(mm, COPYSTR(DTUK, 5, 2));
            EVALUATE(aaaa, COPYSTR(DTUK, 1, 4));
            VALIDATE("Data Movimento", DMY2DATE(gg, mm, aaaa));
            Evaluate("Quantita Da Fatturare", NETTO);
        end;
    end;

    procedure VerificaTipoSettimana(pIntNrSett: Integer; VAR IntTipo: Integer);
    var
        lRecDate: Record 2000000007;
        lRecDate2: Record 2000000007;
    BEGIN
        "NrGiorniAttivi" := 0;

        lRecDate.RESET;
        lRecDate.SETRANGE("Period Type", lRecDate."Period Type"::Week);
        lRecDate.SETRANGE("Period No.", pIntNrSett);
        IF lRecDate.FINDSET THEN BEGIN
            IF (DATE2DMY(lRecDate."Period Start", 2) = DATE2DMY(lRecDate."Period End", 2)) THEN BEGIN
                "TipoSettimana" := "TipoSettimana"::Totale;
                "NrGiorniAttivi" := 5;
                IntTipo := "NrGiorniAttivi";
            END
            ELSE BEGIN
                "TipoSettimana" := "TipoSettimana"::Parziale;
                IntTipo := 0;
                lRecDate2.RESET;
                lRecDate2.SETRANGE("Period Type", lRecDate2."Period Type"::Date);
                lRecDate2.SETRANGE("Period Start", lRecDate."Period Start", lRecDate."Period End");
                lRecDate2.SETRANGE("Period No.", 1, 5);
                IF lRecDate2.FINDSET THEN
                    REPEAT
                        IF (DATE2DMY(lRecDate."Period Start", 2) = DATE2DMY(lRecDate2."Period End", 2)) THEN
                            "NrGiorniAttivi" := "NrGiorniAttivi" + 1;
                    UNTIL lRecDate2.NEXT = 0;
                IntTipo := "NrGiorniAttivi";
            END;

        END;
    end;

    LOCAL PROCEDURE VerificaRelazione();
    VAR
        StringaValori: Text[250];
        StringaValoriTOT: Text;
        lunghezzaStr: Integer;
        i: Integer;
        ValoreC: Text[50];
        ValoreR: Text[50];
        TrovatoC: Boolean;
        TrovatoR: Boolean;
        CarattereCorrente: Text[1];
        CampoRelazioneWinWaste: Record 50108;
    BEGIN
        IF (RELAZ = '') THEN
            EXIT;


        IF (Causale <> '24') THEN
            EXIT;

        //C1       R       34820           0C2       R       16450           0C3       R        6750           0
        StringaValoriTOT := RELAZ_1 + RELAZ_2 + RELAZ_3 + RELAZ_4 + RELAZ_5 + RELAZ_6 + RELAZ_7 + RELAZ_8;
        lunghezzaStr := STRLEN(StringaValoriTOT);


        FOR i := 1 TO lunghezzaStr DO BEGIN
            CarattereCorrente := COPYSTR(StringaValoriTOT, i, 1);
            IF (CarattereCorrente = 'C') THEN BEGIN
                IF (ValoreC <> '') THEN BEGIN
                    CampoRelazioneWinWaste.INIT;
                    CampoRelazioneWinWaste."Campo C" := ValoreC;
                    IF (STRLEN(ValoreR) <> 0) THEN
                        EVALUATE(CampoRelazioneWinWaste."Campo Valore", COPYSTR(ValoreR, 1, (STRLEN(ValoreR) - 1)));
                    CampoRelazioneWinWaste."Campo Tipo Valore" := StringaValori;
                    CampoRelazioneWinWaste."Nr Movimento" := 0;
                    CampoRelazioneWinWaste."Codice Riga WinWaste" := Codice;
                    CampoRelazioneWinWaste."Data Movimento causale 24" := "Data Movimento";
                    CampoRelazioneWinWaste.INSERT(TRUE);
                    VerificaLegamiRifiuti(CampoRelazioneWinWaste."Campo C");
                    ValoreC := '';
                    ValoreR := '';
                END;

                TrovatoC := TRUE;
                TrovatoR := FALSE;
            END;
            IF ((CarattereCorrente = 'R') OR (CarattereCorrente = 'T')) THEN BEGIN
                TrovatoC := FALSE;
                TrovatoR := TRUE;
                StringaValori := CarattereCorrente;
            END;
            IF TrovatoC THEN BEGIN
                IF ((CarattereCorrente <> 'C') AND (CarattereCorrente <> ' ')) THEN
                    ValoreC := ValoreC + CarattereCorrente;
            END;
            IF TrovatoR THEN BEGIN
                IF ((CarattereCorrente <> 'R') AND (CarattereCorrente <> ' ') AND (CarattereCorrente <> 'T')) THEN
                    ValoreR := ValoreR + CarattereCorrente;
            END;
        END;

        IF (ValoreC <> '') THEN BEGIN
            CampoRelazioneWinWaste.INIT;
            CampoRelazioneWinWaste."Campo C" := ValoreC;
            IF (STRLEN(ValoreR) <> 0) THEN
                EVALUATE(CampoRelazioneWinWaste."Campo Valore", COPYSTR(ValoreR, 1, (STRLEN(ValoreR) - 1)));
            CampoRelazioneWinWaste."Nr Movimento" := 0;
            CampoRelazioneWinWaste."Campo Tipo Valore" := StringaValori;
            CampoRelazioneWinWaste."Codice Riga WinWaste" := Codice;
            CampoRelazioneWinWaste."Data Movimento causale 24" := "Data Movimento";
            CampoRelazioneWinWaste.INSERT(TRUE);
            VerificaLegamiRifiuti(CampoRelazioneWinWaste."Campo C");
            ValoreC := '';
            ValoreR := '';
        END;
    END;

    LOCAL PROCEDURE VerificaLegamiRifiuti(Par_code: Code[20]);
    VAR
        lRecMovConferimentoWINWASTE: Record 50100;
    BEGIN
        lRecMovConferimentoWINWASTE.RESET;
        lRecMovConferimentoWINWASTE.SETCURRENTKEY(lRecMovConferimentoWINWASTE.Codice);
        lRecMovConferimentoWINWASTE.SETRANGE(Codice, Par_code);
        IF lRecMovConferimentoWINWASTE.FINDFIRST THEN BEGIN
            lRecMovConferimentoWINWASTE.RifiutoInRecupero := TRUE;
            lRecMovConferimentoWINWASTE.MODIFY;
        END;
    END;

}
table 50101 "Categorie WinWaste"
{
    DataClassification = ToBeClassified;
    caption = 'Categorie WinWaste';
    DataPerCompany = true;

    fields
    {
        field(1; Codice; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice';
        }
        field(2; CATPL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATPL';
        }
        field(3; CATTL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATTL';
        }
        field(4; CATSL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATSL';
        }
        field(5; CATIL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATIL';
        }
        field(6; CATCL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATCL';
        }
        field(7; CATFL; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'CATFL';
        }
        field(8; CATM; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'CATM';
        }
        field(9; CATA; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CATA';
        }
        field(10; CCR; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CCR';
        }
        field(11; ZNR; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ZNR';
        }
        field(12; ZNC; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ZNC';
        }
        field(13; CATCONTR; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CATCONTR';
        }
        field(14; TIPOCONTR; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPOCONTR';
        }
        field(15; CANTIERE; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'CANTIERE';
        }
        field(16; TIPAUT; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPAUT';
        }
        field(17; CATMOV; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'CATMOV';
        }
        field(18; RACMOV; Text[150])
        {
            DataClassification = ToBeClassified;
            Description = 'RACMOV';
        }
        field(19; TIPOMOV; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPOMOV';
        }
        field(20; IMBALL; Text[20])
        {
            DataClassification = ToBeClassified;
            Description = 'IMBALL';
        }
        field(21; ATTIV; Text[5])
        {
            DataClassification = ToBeClassified;
            Description = 'ATTIV';
        }
        field(22; GRUPPADD; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'GRUPPADD';
        }
        field(23; ADDGRUP; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDGRUP';
        }
        field(24; ADDCAT; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDCAT';
        }
        field(25; ADDCAT1; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDCAT1';
        }
        field(26; ADDCAT2; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDCAT2';
        }
        field(27; DEP; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'DEP';
        }
        field(28; C1; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C1';
        }
        field(29; C2; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C2';
        }
        field(30; C3; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C3';
        }
        field(31; C4; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C4';
        }
        field(32; C5; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C5';
        }
        field(33; C6; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C6';
        }
        field(34; C7; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C7';
        }
        field(35; C8; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C8';
        }
        field(36; C9; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'C9';
        }
        field(37; TIPEFF; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPEFF';
        }
        field(38; STAEFF; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'STAEFF';
        }
        field(39; CERT; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CERT';
        }
        field(40; CLASSEVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CLASSEVEIC';
        }
        field(41; DOCUMVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'DOCUMVEIC';
        }
        field(42; INTERVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'INTERVEIC';
        }
        field(43; TIPIDOCVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'TIPIDOCVEIC';
        }
        field(44; PARTIVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'PARTIVEIC';
        }
        field(45; MODAROTVEIC; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'MODAROVEIC';
        }
        field(46; CATEGVEIC1; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CATEGVEIC1';
        }
        field(47; CATEGVEIC2; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CATEGVEIC2';
        }
        field(48; CATEGVEIC3; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'CATEGVEIC3';
        }

    }

    keys
    {
        key(PK; Codice)
        {
            Clustered = true;
        }

    }

}
table 50102 "Contratti Clienti-Produttori"
{
    DataClassification = ToBeClassified;
    caption = 'Contratti Clienti-Produttori';
    DataPerCompany = true;

    fields
    {
        field(1; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cod. Cliente';

        }
        field(2; "Spedire a Codice"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Spedire a Codice';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Cod. Cliente"));

        }
        field(3; "Codice Produttore WinWaste"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Produttore WinWaste (CATS)';
            Caption = 'Codice Produttore WinWaste (CATS)';
        }
        field(4; "Data Scadenza"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Scadenza';
        }
        field(5; "Stato"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Stato';
            OptionMembers = Attivo,Cessato;
        }
        field(6; "Articolo CER"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo CER';
        }
        field(7; "TN da Conferire (MESE)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'TN da Conferire (MESE)';
            trigger OnValidate();
            begin
                "TN da Conferire (Settimana)" := ("TN da Conferire (MESE)" / 4);
            end;
        }
        field(8; "TN da Conferire (Settimana)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'TN da Conferire (Settimana)';
            trigger OnValidate();
            begin
                "TN da Conferire (MESE)" := ("TN da Conferire (Settimana)" * 4);
            end;
        }
        field(9; "Tariffa Base"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa Base';
        }
        field(10; "Maggiorazione"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Maggiorazione';
        }
        field(11; Descrizione; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Descrizione';
        }
        field(12; Articolo; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo';
        }
        field(13; "Tariffa Verifica Merceologica"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa Verifica Merceologica';
        }
        field(14; "Tariffa Base VPP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa Base VPP';
        }
        field(15; "Addebito VPP sopra N gg"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Addebito VPP sopra N gg';
        }

        field(16; "Percentuale Impurità Stabilita"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Percentuale Impurità Stabilita';
        }
        field(17; "Codice PROD"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Produttore WinWaste (PROD)';
            Caption = 'Codice Produttore WinWaste (PROD)';
        }
    }

    keys
    {
        key(PK; "Cod. Cliente", "Spedire a Codice", "Data Scadenza", "Articolo CER")
        {
            Clustered = true;
        }
        key(Sec; "Cod. Cliente", "Spedire a Codice", "Articolo CER")
        {
            Clustered = false;
        }

    }
    trigger OnInsert();
    begin
        IF (GETFILTER("Cod. Cliente") <> '') THEN
            "Cod. Cliente" := GETFILTER("Cod. Cliente");

        IF (GETFILTER("Spedire a Codice") <> '') THEN
            "Spedire a Codice" := GETFILTER("Spedire a Codice");

        IF ("Addebito VPP sopra N gg" = 0) THEN
            "Addebito VPP sopra N gg" := 5;
    end;

    trigger OnModify();
    begin
        IF (GETFILTER("Cod. Cliente") <> '') THEN
            "Cod. Cliente" := GETFILTER("Cod. Cliente");

        IF (GETFILTER("Spedire a Codice") <> '') THEN
            "Spedire a Codice" := GETFILTER("Spedire a Codice");
        IF ("Addebito VPP sopra N gg" = 0) THEN
            "Addebito VPP sopra N gg" := 5;
    end;
}

table 50103 "Lista Riepilogo Conferimenti"
{
    DataClassification = ToBeClassified;
    caption = 'Lista Riepilogo Conferimenti';
    DataPerCompany = true;

    fields
    {
        field(1; "Nr"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr.';

        }
        field(2; Periodo; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Periodo';

        }
        field(3; "Cliente/Produttore"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cliente/Produttore';
        }
        field(4; "Qta Conferita"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Quantità Conferita';
        }
        field(5; "Settimana"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Settimana';
        }
        field(6; "Data Inizio"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Inizio';
            trigger OnValidate();
            BEGIN
                Periodo := FORMAT("Data Fine") + '..' + FORMAT("Data Fine");
            END;
        }
        field(7; "Data Fine"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fine';
            trigger OnValidate();
            BEGIN
                Periodo := FORMAT("Data Fine") + '..' + FORMAT("Data Fine");
            END;
        }
        field(8; "GG Settimana"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'GG Settimana';
        }
        field(9; "Perc. Impurità"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Perc. Impurità';
        }
        field(10; "Tariffa Applicata"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa Applicata';
        }
        field(11; "VPP-TON"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Maggiorazione';
        }
        field(12; Maggiorazione; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Maggiorazione';
        }
        field(13; "Importo Riga"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo';
        }
        field(14; "Articolo CER"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo CER';
        }
        field(15; "Movimento Fatturato"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Movimento Fatturato';
        }
        field(16; "Ultima Verifica Merceologica"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Ultima Verifica Merceologica';
        }
        field(17; "Tariffa Verifica Merceologica"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa Verifica Merceologica';
        }
        field(18; "Tariffa VPP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa VPP';
        }
        field(19; "RifiutoInRecupero"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'RifiutoInRecupero';
        }
        field(20; "CodiceDelibera"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Delibera';
        }
        field(21; "Data Fatturazione"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fatturazione';
        }
        field(22; "Settimana Fatturazione"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Settimana Fatturazione';
        }
    }

    keys
    {
        key(PK; "Nr")
        {
            Clustered = true;
        }
        key(Sec; "Cliente/Produttore", "Data Inizio", "Data Fine", "Settimana")
        {
            Clustered = false;
        }
        key(Ter; "Cliente/Produttore", "Movimento Fatturato")
        {
            Clustered = false;
        }

    }
    VAR
        g_TersanMng: Codeunit 50101;

    trigger OnInsert();
    VAR
        lRecListaRiepilogoConferimenti: Record 50103;

    BEGIN
        lRecListaRiepilogoConferimenti.RESET;
        IF lRecListaRiepilogoConferimenti.FINDLAST THEN
            Nr := lRecListaRiepilogoConferimenti.Nr + 1
        ELSE
            Nr := 1;
        "Data Fatturazione" := g_TersanMng.PrendiGiornoFatturazione("Data Inizio", "Data Fine", Settimana);
        "Settimana Fatturazione" := Settimana;
    end;
}

table 50104 "Registro Analisi Merceologiche"
{
    DataClassification = ToBeClassified;
    caption = 'Registro Analisi Merceologiche';
    DataPerCompany = true;

    fields
    {
        field(1; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cod. Cliente';
            TableRelation = Customer;
        }
        field(2; "Spedire a Codice"; code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Spedire a Codice';
            TableRelation = "Ship-to Address".Code where ("Customer No." = field ("Cod. Cliente"));

        }
        field(3; "Codice Produttore WinWaste"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Produttore WinWaste (CATS)';
            Caption = 'Codice Produttore WinWaste (CATS)';
        }
        field(4; "Data Analisi"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Analisi';
        }
        field(5; "Impurità Vigente"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Impurità Vigente';
        }
        field(6; "Impurità Rilevata"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Impurità Rilevata';
            trigger OnValidate();
            BEGIN
                gRecSetupTersan.GET;
                "Perc. Impurità Extra" := "Impurità Rilevata" - gRecSetupTersan."Perc. Impurità Autorizzata";
                IF ("Perc. Impurità Extra" < 0) THEN
                    "Perc. Impurità Extra" := 0;
            END;
        }
        field(7; "Protocollo"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Protocollo';
        }
        field(8; "Perc. Impurità Extra"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Perc. Impurità Extra';
        }
        field(9; "Articolo CER WinWaste"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo CER WinWaste';
        }
    }

    keys
    {
        key(PK; "Protocollo")
        {
            Clustered = true;
        }
        key(Sec; "Data Analisi", "Cod. Cliente", "Spedire a Codice", "Codice Produttore WinWaste", "Articolo CER WinWaste")
        {
            Clustered = false;
        }
    }
    VAR
        g_TersanMng: Codeunit 50101;
        gRecListaClientiProduttori: Record 50102;
        gRecSetupTersan: Record 50105;
        gCUNoSeriesManagement: Codeunit 396;

    trigger OnInsert();
    VAR
        lRecRegistroAnalisiMerceologiche: Record 50104;
    BEGIN
        gRecSetupTersan.GET;

        Protocollo := gCUNoSeriesManagement.GetNextNo(gRecSetupTersan."Nr. Serie Reg Merceologica", WORKDATE, TRUE);


        IF (GETFILTER("Cod. Cliente") <> '') THEN
            "Cod. Cliente" := GETFILTER("Cod. Cliente");

        IF (GETFILTER("Spedire a Codice") <> '') THEN
            "Spedire a Codice" := GETFILTER("Spedire a Codice");

        gRecListaClientiProduttori.RESET;
        gRecListaClientiProduttori.SETCURRENTKEY("Cod. Cliente", "Spedire a Codice", "Articolo CER");
        gRecListaClientiProduttori.SETRANGE("Cod. Cliente", Rec."Cod. Cliente");
        gRecListaClientiProduttori.SETRANGE("Spedire a Codice", Rec."Spedire a Codice");
        gRecListaClientiProduttori.SETRANGE("Articolo CER", Rec."Articolo CER WinWaste");
        gRecListaClientiProduttori.SETRANGE(Stato, gRecListaClientiProduttori.Stato::Attivo);
        IF gRecListaClientiProduttori.FINDLAST THEN
            "Codice Produttore WinWaste" := gRecListaClientiProduttori."Codice Produttore WinWaste";

        ControlloImpurita();
    END;

    trigger OnModify();
    begin
        gRecSetupTersan.GET;
        ControlloImpurita;
    end;

    LOCAL PROCEDURE ControlloImpurita();
    VAR
        lRecRegistroAnalisiMerceologiche: Record 50104;
    BEGIN
        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETCURRENTKEY(Protocollo);
        lRecRegistroAnalisiMerceologiche.SETFILTER(Protocollo, '..%1&<>%1', Protocollo);
        IF ("Cod. Cliente" <> '') THEN
            lRecRegistroAnalisiMerceologiche.SETRANGE("Cod. Cliente", "Cod. Cliente");
        IF ("Spedire a Codice" <> '') THEN
            lRecRegistroAnalisiMerceologiche.SETRANGE("Spedire a Codice", "Spedire a Codice");
        IF ("Articolo CER WinWaste" <> '') THEN
            lRecRegistroAnalisiMerceologiche.SETRANGE("Articolo CER WinWaste", "Articolo CER WinWaste");
        IF lRecRegistroAnalisiMerceologiche.FINDLAST THEN
            "Impurità Vigente" := lRecRegistroAnalisiMerceologiche."Impurità Rilevata";
    END;
}
table 50105 "Setup Tersan"
{
    DataClassification = ToBeClassified;
    caption = 'Setup Tersan';
    DataPerCompany = true;

    fields
    {
        field(1; "code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Code';

        }
        field(2; "Perc. Impurità Autorizzata"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Perc. Impurità Autorizzata';
        }
        field(3; "Perc. Soglia Conferimento VPP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Perc. Soglia Conferimento VPP';
        }
        field(4; "Tipo Doc. da Generare da WinW"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Tipo Doc. da Generare da WinW';
            OptionMembers = Ordine,"Fattura Provvisoria";
        }
        field(5; "Nr. Serie Reg Merceologica"; code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Serie Reg Merceologica';
            TableRelation = "No. Series".Code;
        }
        field(6; "Nr. Serie Reg Delibere"; code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Serie Reg Delibere';
        }
        field(7; "Nr. Articolo Servizio Stocc"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Articolo Servizio Stocc';
            TableRelation = Item;
        }
    }

    keys
    {
        key(PK; "code")
        {
            Clustered = true;
        }
    }
}
table 50106 "Lista Tot. Conferimenti VPP"
{
    DataClassification = ToBeClassified;
    caption = 'Lista Tot. Conferimenti VPP';
    DataPerCompany = true;

    fields
    {
        field(1; "Nr"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr.';
        }
        field(2; "Periodo"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Periodo';
        }
        field(3; "Cliente/Produttore"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cliente/Produttore';
        }
        field(4; "Qta Conferita"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tipo Doc. da Generare da WinW';
        }
        field(5; "Settimana"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Settimana';
        }
        field(6; "Data Inizio"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Inizio';
            trigger OnValidate();
            begin
                Periodo := FORMAT("Data Fine") + '..' + FORMAT("Data Fine");
            end;
        }
        field(7; "Data Fine"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fine';
            trigger OnValidate();
            begin
                Periodo := FORMAT("Data Fine") + '..' + FORMAT("Data Fine");
            end;
        }
        field(8; "GG Settimana"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'GG Settimana';
        }
        field(9; "VPP-KG"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'VPP-KG';
            trigger OnValidate();
            begin
                "Vpp-TN" := "VPP-KG" / 1000;
            end;
        }
        field(10; "Articolo CER"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo CER';
        }
        field(11; "Tariffa VPP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Tariffa VPP';
        }
        field(12; "Vpp-TN"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Vpp-TN';
        }
        field(13; "Valore Compensabile"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Valore Compensabile';
        }
        field(14; "Valore Compensato"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Valore Compensato';
        }
        field(15; "Articolo Compensabile"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo Compensabile';
        }
        field(16; "Valore Compensabile Residuo"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Valore Compensabile Residuo';
        }
        field(17; "Data Fatturazione"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fatturazione';
        }
        field(18; "Settimana Fatturazione"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Settimana Fatturazione';
        }
    }

    keys
    {
        key(PK; "nr")
        {
            Clustered = true;
        }
        key(Sec; "Cliente/Produttore", "Data Inizio", "Data Fine", Settimana)
        {
            Clustered = false;
        }
    }
    trigger OnInsert()
    var
        lRecListaRiepilogoConferimenti: Record 50106;
    begin
        lRecListaRiepilogoConferimenti.RESET;
        IF lRecListaRiepilogoConferimenti.FINDLAST THEN
            Nr := lRecListaRiepilogoConferimenti.Nr + 1
        ELSE
            Nr := 1;

        "Settimana Fatturazione" := DATE2DWY("Data Fatturazione", 2);
    end;
}
table 50107 "Clienti da Fatturare"
{
    DataClassification = ToBeClassified;
    caption = 'Clienti da Fatturare';
    DataPerCompany = true;

    fields
    {
        field(1; "Nr."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr.';
        }
        field(2; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cod. Cliente';
            TableRelation = Customer."No.";
        }
        field(3; "Cod. Spedizione"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Cod. Spedizione';
        }
        field(4; "Periodo Fatturazione"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Periodo Fatturazione';
        }
        field(5; "Data Inizio Periodo"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Inizio Periodo';
        }
        field(6; "Data Fine Periodo"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fine Periodo';
        }
        field(7; "Stato"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Stato';
            OptionMembers = "Documento da Emettere","Documento Generato","Errore: rilevati movimenti in periodi chiusi";
        }
        field(8; "Nr. Documento Emesso"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Nr. Documento Emesso';
        }
        field(9; "Tipo Documento Emesso"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Tipo Documento Emesso';
            OptionMembers = Ordine,Fattura;
        }
        field(10; "Ragione Sociale Cliente"; Text[50])
        {
            Description = 'Ragione Sociale Cliente';
            FieldClass = FlowField;
            CalcFormula = lookup (Customer.Name where ("No." = field ("Cod. Cliente")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Cod. Cliente", "Cod. Spedizione", "Periodo Fatturazione")
        {
            Clustered = true;
        }
        key(Sec; "Cod. Spedizione")
        {
            Clustered = false;
        }
        key(Ter; "Periodo Fatturazione")
        {
            Clustered = false;
        }
    }
}

table 50108 "Campo Relazione WinWaste"
{
    DataClassification = ToBeClassified;
    caption = 'Campo Relazione WinWaste';
    DataPerCompany = true;

    fields
    {
        field(1; "Nr Movimento"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Nr Movimento';
        }
        field(2; "Codice Riga WinWaste"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Riga WinWaste';
        }
        field(3; "Campo C"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Campo C';
        }
        field(4; "Campo Valore"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Campo Valore';
        }
        field(5; "Campo Tipo Valore"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Campo Tipo Valore';
        }
        field(6; "Data Movimento causale 24"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Movimento causale 24';
        }
    }

    keys
    {
        key(PK; "Nr Movimento")
        {
            Clustered = true;
        }
    }
    trigger OnInsert();
    var
        CampoRelazioneWinWaste: Record 50108;
    begin
        IF "Nr Movimento" = 0 THEN BEGIN
            CampoRelazioneWinWaste.RESET;
            IF CampoRelazioneWinWaste.FINDLAST THEN
                "Nr Movimento" := CampoRelazioneWinWaste."Nr Movimento";
            "Nr Movimento" := "Nr Movimento" + 1;
        END;
    end;
}


table 50109 "Registro Delibere Cliente"
{
    DataClassification = ToBeClassified;
    caption = 'Registro Delibere Cliente';
    DataPerCompany = true;

    fields
    {
        field(1; "Cod. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Cod. Cliente';
            TableRelation = Customer;
        }
        field(2; "Spedire a Codice"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Spedire a Codice';
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Cod. Cliente"));
        }
        field(3; "Codice Produttore WinWaste"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Codice Produttore WinWaste';
        }
        field(4; "Data Delibera"; date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Delibera';
        }
        field(5; "Impurità Vigente"; decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Impurità Vigente';
            editable = false;
        }
        field(6; "Impurità Rilevata"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Impurità Rilevata';
        }
        field(7; "Protocollo"; code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Protocollo';
        }
        field(8; "Perc. Impurità Extra"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Perc. Impurità Extra';
        }
        field(9; "Articolo CER WinWaste"; code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Articolo CER WinWaste';
        }
        field(10; "Importo Unitario"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Importo Unitario';
        }
        field(11; "Stato Delibera"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Stato Delibera';
            OptionMembers = "Non Attivo","Attivo";
        }
        field(12; "Data Inizio Validità"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Inizio Validità';
        }
        field(13; "Data Fine Validità"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fine Validità';
        }
        field(14; "GG Inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'GG inizio';
        }
        field(15; "MM inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'MM Inizio';
        }
        field(16; "AAAA Inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'AAAA Inizio';
        }
    }

    keys
    {
        key(PK; "Data Delibera", "Cod. Cliente", "Spedire a Codice", "Codice Produttore WinWaste", "Articolo CER WinWaste")
        {
            Clustered = true;
        }
        key(sec; Protocollo)
        {
            Clustered = false;
        }
    }
    var
        gRecListaClientiProduttori: Record 50102;
        gRecSetupTersan: Record 50105;
        gCUNoSeriesManagement: Codeunit 396;

    trigger OnInsert();
    var
        lRecRegistroAnalisiMerceologiche: Record 50104;
    begin
        gRecSetupTersan.GET;

        Protocollo := gCUNoSeriesManagement.GetNextNo(gRecSetupTersan."Nr. Serie Reg Delibere", WORKDATE, TRUE);

        IF (GETFILTER("Cod. Cliente") <> '') THEN
            "Cod. Cliente" := GETFILTER("Cod. Cliente");

        IF (GETFILTER("Spedire a Codice") <> '') THEN
            "Spedire a Codice" := GETFILTER("Spedire a Codice");

        gRecListaClientiProduttori.RESET;
        gRecListaClientiProduttori.SETCURRENTKEY("Cod. Cliente", "Spedire a Codice", "Articolo CER");
        gRecListaClientiProduttori.SETRANGE("Cod. Cliente", Rec."Cod. Cliente");
        gRecListaClientiProduttori.SETRANGE("Spedire a Codice", Rec."Spedire a Codice");
        gRecListaClientiProduttori.SETRANGE("Articolo CER", Rec."Articolo CER WinWaste");
        gRecListaClientiProduttori.SETRANGE(Stato, gRecListaClientiProduttori.Stato::Attivo);
        IF gRecListaClientiProduttori.FINDLAST THEN
            "Codice Produttore WinWaste" := gRecListaClientiProduttori."Codice Produttore WinWaste";

        "GG Inizio" := DATE2DMY("Data Inizio Validità", 1);
        "MM Inizio" := DATE2DMY("Data Inizio Validità", 2);
        "AAAA Inizio" := DATE2DMY("Data Inizio Validità", 3);

        ControlloImpurita();
    end;

    trigger OnModify();
    begin
        gRecSetupTersan.GET;

        ControlloImpurita;
    end;

    LOCAL PROCEDURE ControlloImpurita();
    VAR
        lRecRegistroDelibereCliente: Record 50109;
    BEGIN

        //lRecRegistroDelibereCliente.RESET;
        //lRecRegistroDelibereCliente.SETCURRENTKEY(Protocollo);
        //lRecRegistroDelibereCliente.SETFILTER(Protocollo, '..%1&<>%1',Protocollo);
        //IF ("Cod. Cliente" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Cod. Cliente", "Cod. Cliente");
        //IF ("Spedire a Codice" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Spedire a Codice", "Spedire a Codice");
        //IF ("Articolo CER WinWaste" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Articolo CER WinWaste", "Articolo CER WinWaste");
        //IF lRecRegistroDelibereCliente.FINDLAST THEN
        //  "Impurità Vigente" := lRecRegistroDelibereCliente."Impurità Rilevata";

    END;
}

table 50110 "Registro Delibere"
{
    DataClassification = ToBeClassified;
    caption = 'Registro Delibere Cliente';
    DataPerCompany = true;

    fields
    {
        field(1; "Nr"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Nr.';
        }
        field(2; "Data Delibera"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Delibera';
        }
        field(3; "Stato Delibera"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Stato Delibera';
            OptionMembers = "Non Attivo","Attivo";
        }
        field(4; "Data Inizio Validità"; date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Inizio Validità';
        }
        field(5; "Data Fine Validità"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Data Fine Validità';

        }
        field(6; "GG Inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'GG Inizio';
        }
        field(7; "MM Inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'MM Inizio';
        }
        field(8; "AAAA Inizio"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'AAAA Inizio';
        }
    }

    keys
    {
        key(PK; "Nr")
        {
            Clustered = true;
        }
    }
    var
        gRecListaClientiProduttori: Record 50102;
        gRecSetupTersan: Record 50105;
        gCUNoSeriesManagement: Codeunit 396;

    trigger OnInsert();
    var
        lRecRegistroAnalisiMerceologiche: Record 50104;
    begin
        gRecSetupTersan.GET;
        //

        Nr := gCUNoSeriesManagement.GetNextNo(gRecSetupTersan."Nr. Serie Reg Delibere", WORKDATE, TRUE);
        //
        // IF (GETFILTER("Cod. Cliente") <> '') THEN
        //  "Cod. Cliente" := GETFILTER("Cod. Cliente");
        //
        // IF (GETFILTER("Spedire a Codice") <> '') THEN
        //  "Spedire a Codice" := GETFILTER("Spedire a Codice");
        //
        // gRecListaClientiProduttori.RESET;
        // gRecListaClientiProduttori.SETCURRENTKEY("Cod. Cliente","Spedire a Codice","Articolo CER");
        // gRecListaClientiProduttori.SETRANGE("Cod. Cliente", Rec."Cod. Cliente");
        // gRecListaClientiProduttori.SETRANGE("Spedire a Codice", Rec."Spedire a Codice");
        // gRecListaClientiProduttori.SETRANGE("Articolo CER", Rec."Articolo CER WinWaste");
        // gRecListaClientiProduttori.SETRANGE(Stato, gRecListaClientiProduttori.Stato::Attivo);
        // IF gRecListaClientiProduttori.FINDLAST THEN
        //  "Codice Produttore WinWaste" := gRecListaClientiProduttori."Codice Produttore WinWaste";

        "GG Inizio" := DATE2DMY("Data Inizio Validità", 1);
        "MM Inizio" := DATE2DMY("Data Inizio Validità", 2);
        "AAAA Inizio" := DATE2DMY("Data Inizio Validità", 3);
        // ControlloImpurità();
    end;

    trigger OnModify();
    begin
        gRecSetupTersan.GET;

        ControlloImpurita;
    end;

    LOCAL PROCEDURE ControlloImpurita();
    VAR
        lRecRegistroDelibereCliente: Record 50109;
    BEGIN

        //lRecRegistroDelibereCliente.RESET;
        //lRecRegistroDelibereCliente.SETCURRENTKEY(Protocollo);
        //lRecRegistroDelibereCliente.SETFILTER(Protocollo, '..%1&<>%1',Protocollo);
        //IF ("Cod. Cliente" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Cod. Cliente", "Cod. Cliente");
        //IF ("Spedire a Codice" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Spedire a Codice", "Spedire a Codice");
        //IF ("Articolo CER WinWaste" <> '') THEN
        //  lRecRegistroDelibereCliente.SETRANGE("Articolo CER WinWaste", "Articolo CER WinWaste");
        //IF lRecRegistroDelibereCliente.FINDLAST THEN
        //  "Impurità Vigente" := lRecRegistroDelibereCliente."Impurità Rilevata";

    END;
}