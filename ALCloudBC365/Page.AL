page 50100 "Lista Conferimenti WinWaste"
{
    Caption = 'Lista Conferimenti WinWaste';
    PageType = List;
    //ApplicationArea = All;
    SourceTable = MovConferimentoWINWASTE;

    layout
    {
        area(content)
        {
            //group(General)
            repeater(Group)
            {
                field(EntryNo; EntryNo)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Entry No.', ITA = 'Nr. Movimento';


                    /*
                    trigger OnValidate()
                    begin
                        if "No." < '' then
                            Message('Number too small')
                    end;
                    */
                }

                field(Codice; Codice)
                {
                    ApplicationArea = All;
                }
                field(Causale; Causale)
                {
                    ApplicationArea = All;
                }
                field(Operatore; Operatore)
                {
                    ApplicationArea = All;
                }
                field(POSI; POSI)
                {
                    ApplicationArea = All;
                }
                field(ORA; ORA)
                {
                    ApplicationArea = all;
                }
                field(FORMU; FORMU)
                {
                    ApplicationArea = All;
                }
                field(DATD; DATD)
                {
                    ApplicationArea = All;
                }
                field(NUMD; NUMD)
                {
                    ApplicationArea = All;
                }
                field(SCON; SCON)
                {
                    ApplicationArea = All;
                }
                field("Quantita Da Fatturare"; "Quantita Da Fatturare")
                {
                    ApplicationArea = All;
                }
                field(RIFER; RIFER)
                {
                    ApplicationArea = All;
                }
                field(DTUK; DTUK)
                {
                    ApplicationArea = All;
                }
                field(CLIE; CLIE)
                {
                    ApplicationArea = All;
                }
                field
                (CONT; CONT)
                {
                    ApplicationArea = All;
                }
                field(PROD; PROD)
                {
                    ApplicationArea = All;
                }
                field(AUTP; AUTP)
                {
                    ApplicationArea = All;
                }
                field(MAG1; MAG1)
                {
                    ApplicationArea = All;
                }
                field(MAG2; MAG2)
                {
                    ApplicationArea = All;
                }
                field(AUTT; AUTT)
                {
                    ApplicationArea = All;
                }
                field(TRANS; TRANS)
                {
                    ApplicationArea = All;
                }
                field(MEX; MEX)
                {
                    ApplicationArea = All;
                }
                field(AUTIST; AUTIST)
                {
                    ApplicationArea = All;
                }
                field(RIM; RIM)
                {
                    ApplicationArea = All;
                }
                field(SMAL; SMAL)
                {
                    ApplicationArea = All;
                }
                field(MODA; MODA)
                {
                    ApplicationArea = All;
                }
                field(POS2; POS2)
                {
                    ApplicationArea = All;
                }
                field(INTE; INTE)
                {
                    ApplicationArea = All;
                }
                field(AUTI; AUTI)
                {
                    ApplicationArea = All;
                }
                field(CER; CER)
                {
                    ApplicationArea = All;
                }
                field(RIRI; RIRI)
                {
                    ApplicationArea = All;
                }
                field(TIPOL; TIPOL)
                {
                    ApplicationArea = All;
                }
                field(FISI; FISI)
                {
                    ApplicationArea = All;
                }
                field(RECUP; RECUP)
                {
                    ApplicationArea = All;
                }
                field(QCAT; QCAT)
                {
                    ApplicationArea = All;
                }
                field(LORDO; LORDO)
                {
                    ApplicationArea = All;
                }
                field(TARA; TARA)
                {
                    ApplicationArea = All;
                }
                field(NETTO; NETTO)
                {
                    ApplicationArea = All;
                }
                field(VOLU; VOLU)
                {
                    ApplicationArea = All;
                }
                field(UM; UM)
                {
                    ApplicationArea = All;
                }
                field(CATS; CATS)
                {
                    ApplicationArea = All;
                }
                field(RACS; RACS)
                {
                    ApplicationArea = All;
                }
                field(TIPS; TIPS)
                {
                    ApplicationArea = All;
                }
                field(NCARD; NCARD)
                {
                    ApplicationArea = All;
                }
                field(NATU; NATU)
                {
                    ApplicationArea = All;
                }
                field(CARP; CARP)
                {
                    ApplicationArea = All;
                }
                field(SOST; SOST)
                {
                    ApplicationArea = All;
                }
                field(DES; DES)
                {
                    ApplicationArea = All;
                }
                field(CARC; CARC)
                {
                    ApplicationArea = All;
                }
                field(NOT1; NOT1)
                {
                    ApplicationArea = All;
                }
                field(NOT2; NOT2)
                {
                    ApplicationArea = All;
                }
                field(NOT3; NOT3)
                {
                    ApplicationArea = All;
                }
                field(AVVE; AVVE)
                {
                    ApplicationArea = All;
                }
                field(DATI; DATI)
                {
                    ApplicationArea = All;
                }
                field(ORAI; ORAI)
                {
                    ApplicationArea = All;
                }
                field(DATF; DATF)
                {
                    ApplicationArea = All;
                }
                field(ORAF; ORAF)
                {
                    ApplicationArea = All;
                }
                field(COLL; COLL)
                {
                    ApplicationArea = All;
                }
                field(ADR; ADR)
                {
                    ApplicationArea = All;
                }
                field(CONTE; CONTE)
                {
                    ApplicationArea = All;
                }
                field(PARTI; PARTI)
                {
                    ApplicationArea = All;
                }
                field(ATTR; ATTR)
                {
                    ApplicationArea = All;
                }
                field(ARRI; ARRI)
                {
                    ApplicationArea = All;
                }
                field(COMU; COMU)
                {
                    ApplicationArea = All;
                }
                field(PRES; PRES)
                {
                    ApplicationArea = All;
                }
                field(IND; IND)
                {
                    ApplicationArea = All;
                }
                field(ATTI; ATTI)
                {
                    ApplicationArea = All;
                }
                field(TIPA; TIPA)
                {
                    ApplicationArea = All;
                }
                field(COBAT; COBAT)
                {
                    ApplicationArea = All;
                }
                field(REG1; REG1)
                {
                    ApplicationArea = All;
                }
                field(REG2; REG2)
                {
                    ApplicationArea = All;
                }
                field(REG3; REG3)
                {
                    ApplicationArea = All;
                }
                field(REG4; REG4)
                {
                    ApplicationArea = All;
                }
                field(GRUPADD; GRUPADD)
                {
                    ApplicationArea = All;
                }
                field(DETTAGLIO; DETTAGLIO)
                {
                    ApplicationArea = All;
                }
                field(RELAZ; RELAZ)
                {
                    ApplicationArea = All;
                }
                field(FOGLIO; FOGLIO)
                {
                    ApplicationArea = All;
                }
                field(C1; C1)
                {
                    ApplicationArea = All;
                }
                field(C2; C2)
                {
                    ApplicationArea = All;
                }
                field(C3; C3)
                {
                    ApplicationArea = All;
                }
                field(C4; C4)
                {
                    ApplicationArea = All;
                }
                field(C5; C5)
                {
                    ApplicationArea = All;
                }
                field(C6; C6)
                {
                    ApplicationArea = All;
                }
                field(C7; C7)
                {
                    ApplicationArea = All;
                }
                field(C8; C8)
                {
                    ApplicationArea = All;
                }
                field(C9; C9)
                {
                    ApplicationArea = All;
                }
                field(PROT1; PROT1)
                {
                    ApplicationArea = All;
                }
                field(PROT2; PROT2)
                {
                    ApplicationArea = All;
                }
                field(PROT3; PROT3)
                {
                    ApplicationArea = All;
                }
                field(PROT4; PROT4)
                {
                    ApplicationArea = All;
                }
                field(GIASCAR; GIASCAR)
                {
                    ApplicationArea = All;
                    trigger OnValidate();
                    begin
                        if (GIASCAR <> '') then
                            Evaluate("Quantita Da Fatturare", GIASCAR);
                    end;
                }
                field(STATO; STATO)
                {
                    ApplicationArea = All;
                }
                field(NFATT; NFATT)
                {
                    ApplicationArea = All;
                }
                field(LEGAME; LEGAME)
                {
                    ApplicationArea = All;
                }
                field(KGNUM; KGNUM)
                {
                    ApplicationArea = All;
                }
                field(MCNUM; MCNUM)
                {
                    ApplicationArea = All;
                }
                field(VER; VER)
                {
                    ApplicationArea = All;
                }
                field(ID; ID)
                {
                    ApplicationArea = All;
                }
                field(IDT; IDT)
                {
                    ApplicationArea = All;
                }
                field(BLOK; BLOK)
                {
                    ApplicationArea = All;
                }
                field(IMPORT; IMPORT)
                {
                    ApplicationArea = All;
                }


                field("Data Movimento"; "Data Movimento")
                {
                    ApplicationArea = All;
                }
                field(NrGiorniAttivi; NrGiorniAttivi)
                {
                    ApplicationArea = All;
                }
                field(MovimentoLavoratoInNAV; MovimentoLavoratoInNAV)
                {
                    ApplicationArea = All;
                }

                field(TipoSettimana; TipoSettimana)
                {
                    ApplicationArea = All;
                }

                field(NrSettimana; NrSettimana)
                {
                    ApplicationArea = All;
                }
                field(Lunghezza; Lunghezza)
                {
                    ApplicationArea = All;
                }
                field(RifiutoInRecupero; RifiutoInRecupero)
                {
                    ApplicationArea = All;
                }

                field(DATR; DATR)
                {
                    ApplicationArea = All;
                }
            }

        }
        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Navigation)
        {
            action("Aggiorna Lista")
            {
                ApplicationArea = All;
                Image = "1099Form";
                //RunObject = codeunit "Document Totals";
                trigger OnAction()
                begin
                    UpdateList();
                    Message('Lista Aggiornata!');
                end;

            }

        }

    }
    procedure UpdateList();
    begin
        RESET;
        REPEAT
            VALIDATE(DATD);
            VALIDATE(DTUK);
            VALIDATE(GIASCAR);
            RifiutoInRecupero := FALSE;
            MODIFY(TRUE);
        UNTIL NEXT = 0;
    end;
}

page 50101 "Lista Categorie Winwaste"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Categorie WinWaste";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Codice; Codice)
                {
                    ApplicationArea = All;
                }

                field(C1; C1)
                {
                    ApplicationArea = All;
                }
                field(C2; C2)
                {
                    ApplicationArea = All;
                }
                field(C3; C3)
                {
                    ApplicationArea = All;
                }
                field(C4; C4)
                {
                    ApplicationArea = All;
                }
                field(C5; C5)
                {
                    ApplicationArea = All;
                }
                field(C6; C6)
                {
                    ApplicationArea = All;
                }
                field(C7; C7)
                {
                    ApplicationArea = All;
                }
                field(C8; C8)
                {
                    ApplicationArea = All;
                }
                field(C9; C9)
                {
                    ApplicationArea = All;
                }
                field(CATMOV; CATMOV)
                {
                    ApplicationArea = All;
                }
                field(RACMOV; RACMOV)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}
page 50102 "Contratti Clienti-Produttori"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Contratti Clienti-Produttori";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod. Cliente"; "Cod. Cliente")
                {
                    ApplicationArea = All;
                }

                field("Spedire a Codice"; "Spedire a Codice")
                {
                    ApplicationArea = All;
                }
                field("Codice Produttore WinWaste (CATS)"; "Codice Produttore WinWaste")
                {
                    ApplicationArea = All;
                }
                field(Descrizione; Descrizione)
                {
                    ApplicationArea = All;
                }
                field("Data Scadenza"; "Data Scadenza")
                {
                    ApplicationArea = All;
                }
                field(Stato; Stato)
                {
                    ApplicationArea = All;
                }
                field("Articolo CER"; "Articolo CER")
                {
                    ApplicationArea = All;
                }
                field(Articolo; Articolo)
                {
                    ApplicationArea = All;
                }
                field("TN da Conferire (MESE)"; "TN da Conferire (MESE)")
                {
                    ApplicationArea = All;
                }
                field("TN da Conferire (Settimana)"; "TN da Conferire (Settimana)")
                {
                    ApplicationArea = All;
                }
                field("Tariffa Base"; "Tariffa Base")
                {
                    ApplicationArea = All;
                }
                field(Maggiorazione; Maggiorazione)
                {
                    ApplicationArea = All;
                }
                field("Tariffa Verifica Merceologica"; "Tariffa Verifica Merceologica")
                {
                    ApplicationArea = All;
                }
                field("Tariffa Base VPP"; "Tariffa Base VPP")
                {
                    ApplicationArea = All;
                }
                field("Addebito VPP sopra N gg"; "Addebito VPP sopra N gg")
                {
                    ApplicationArea = All;
                }
                field("Percentuale Impurità Stabilita"; "Percentuale Impurità Stabilita")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}

page 50103 "Lista Riepiloghi trasferimenti"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Lista Riepilogo Conferimenti";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Nr; Nr)
                {
                    ApplicationArea = All;
                }

                field(Periodo; Periodo)
                {
                    ApplicationArea = All;
                }
                field("Cliente/Produttore"; "Cliente/Produttore")
                {
                    ApplicationArea = All;
                }
                field("Qta Conferita"; "Qta Conferita")
                {
                    ApplicationArea = All;
                }
                field(Settimana; Settimana)
                {
                    ApplicationArea = All;
                }
                field("Data Inizio"; "Data Inizio")
                {
                    ApplicationArea = All;
                }
                field("Data Fine"; "Data Fine")
                {
                    ApplicationArea = All;
                }
                field("GG Settimana"; "GG Settimana")
                {
                    ApplicationArea = All;
                }
                field("Perc. Impurità"; "Perc. Impurità")
                {
                    ApplicationArea = All;
                }
                field("Tariffa Applicata"; "Tariffa Applicata")
                {
                    ApplicationArea = All;
                }
                field("VPP-TON"; "VPP-TON")
                {
                    ApplicationArea = All;
                }
                field(Maggiorazione; Maggiorazione)
                {
                    ApplicationArea = All;
                }
                field("Tariffa Verifica Merceologica"; "Tariffa Verifica Merceologica")
                {
                    ApplicationArea = All;
                }
                field("Importo Riga"; "Importo Riga")
                {
                    ApplicationArea = All;
                }
                field("Articolo CER"; "Articolo CER")
                {
                    ApplicationArea = All;
                }
                field("Ultima Verifica Merceologica"; "Ultima Verifica Merceologica")
                {
                    ApplicationArea = All;
                }
                field(RifiutoInRecupero; RifiutoInRecupero)
                {
                    ApplicationArea = All;
                }
                field(CodiceDelibera; CodiceDelibera)
                {
                    ApplicationArea = All;
                }
                field("Data Fatturazione"; "Data Fatturazione")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}

page 50104 "Registro Analisi Merceologiche"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Registro Analisi Merceologiche";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Protocollo; Protocollo)
                {
                    ApplicationArea = All;
                }

                field("Cod. Cliente"; "Cod. Cliente")
                {
                    ApplicationArea = All;
                }
                field("Spedire a Codice"; "Spedire a Codice")
                {
                    ApplicationArea = All;
                }
                field("Codice Produttore WinWaste"; "Codice Produttore WinWaste")
                {
                    ApplicationArea = All;
                }
                field("Articolo CER WinWaste"; "Articolo CER WinWaste")
                {
                    ApplicationArea = All;
                }
                field("Data Analisi"; "Data Analisi")
                {
                    ApplicationArea = All;
                }
                field("Impurità Vigente"; "Impurità Vigente")
                {
                    ApplicationArea = All;
                }
                field("Impurità Rilevata"; "Impurità Rilevata")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}
page 50105 "Setup Tersan"
{
    PageType = Card;
    //ApplicationArea = all;
    SourceTable = "Setup Tersan";

    layout
    {
        area(content)
        {
            Group(General)
            {
                field("Perc. Impurità Autorizzata"; "Perc. Impurità Autorizzata")
                {
                    ApplicationArea = All;
                }

                field("Perc. Soglia Conferimento VPP"; "Perc. Soglia Conferimento VPP")
                {
                    ApplicationArea = All;
                }
                field("Tipo Doc. da Generare da WinW"; "Tipo Doc. da Generare da WinW")
                {
                    ApplicationArea = All;
                }
                field("Nr. Serie Reg Merceologica"; "Nr. Serie Reg Merceologica")
                {
                    ApplicationArea = All;
                }
                field("Nr. Serie Reg Delibere"; "Nr. Serie Reg Delibere")
                {
                    ApplicationArea = All;
                }
                field("Nr. Articolo Servizio Stocc"; "Nr. Articolo Servizio Stocc")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}

page 50106 "Lista Clienti da Fatturare"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Clienti da Fatturare";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod. Cliente"; "Cod. Cliente")
                {
                    ApplicationArea = All;
                }

                field("Cod. Spedizione"; "Cod. Spedizione")
                {
                    ApplicationArea = All;
                }
                field("Periodo Fatturazione"; "Periodo Fatturazione")
                {
                    ApplicationArea = All;
                }
                field("Data Inizio Periodo"; "Data Inizio Periodo")
                {
                    ApplicationArea = All;
                }
                field("Data Fine Periodo"; "Data Fine Periodo")
                {
                    ApplicationArea = All;
                }
                field(Stato; Stato)
                {
                    ApplicationArea = All;
                }
                field("Nr. Documento Emesso"; "Nr. Documento Emesso")
                {
                    ApplicationArea = All;
                }
                field("Tipo Documento Emesso"; "Tipo Documento Emesso")
                {
                    ApplicationArea = All;
                }
                field("Ragione Sociale Cliente"; "Ragione Sociale Cliente")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Navigation)
        {
            action("Genera Movimenti da Fatturare")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    REPORT.RUNMODAL(50100, TRUE, TRUE);
                end;
            }
            action("Crea Documenti")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    //
                    CreaDocumenti();
                end;
            }
            action("Apri Lista Documenti Emessi")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    //
                    ApriDocumentoEmesso();
                end;
            }
            action("Apri scheda Documento Emesso")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    //
                    ApriDocumentoEmessoScheda();
                end;
            }
            action("Visualizza Conferimenti")
            {
                ApplicationArea = All;
                trigger OnAction();
                var
                    lRecContrattiClientiProduttori: Record "Contratti Clienti-Produttori";
                    lRecListaRiepilogoConferimenti: Record "Lista Riepilogo Conferimenti";

                begin
                    //

                    lRecContrattiClientiProduttori.RESET;
                    lRecContrattiClientiProduttori.SETCURRENTKEY("Cod. Cliente", "Spedire a Codice", "Articolo CER");
                    lRecContrattiClientiProduttori.SETRANGE("Cod. Cliente", Rec."Cod. Cliente");
                    lRecContrattiClientiProduttori.SETRANGE("Spedire a Codice", Rec."Cod. Spedizione");
                    lRecContrattiClientiProduttori.SETRANGE(Stato, lRecContrattiClientiProduttori.Stato::Attivo);
                    IF NOT lRecContrattiClientiProduttori.FINDSET THEN ERROR('Contratto non presente!');

                    lRecListaRiepilogoConferimenti.RESET;
                    lRecListaRiepilogoConferimenti.SETRANGE(lRecListaRiepilogoConferimenti."Data Inizio", Rec."Data Inizio Periodo");
                    lRecListaRiepilogoConferimenti.SETRANGE(lRecListaRiepilogoConferimenti."Cliente/Produttore", lRecContrattiClientiProduttori."Codice Produttore WinWaste");
                    IF lRecListaRiepilogoConferimenti.FINDSET THEN
                        PAGE.RUNMODAL(50103, lRecListaRiepilogoConferimenti);

                end;
            }
            action("Visualizza Vuoto per Pieno(VPP)")
            {
                ApplicationArea = All;
                trigger OnAction();
                var
                    lRecContrattiClientiProduttori: Record "Contratti Clienti-Produttori";
                    lRecListaRiepilogoConferimenti: Record "Lista Riepilogo Conferimenti";
                    lRecListaTotConferimentiVPP: Record "Lista Tot. Conferimenti VPP";

                begin
                    //

                    lRecContrattiClientiProduttori.RESET;
                    lRecContrattiClientiProduttori.SETCURRENTKEY("Cod. Cliente", "Spedire a Codice", "Articolo CER");
                    lRecContrattiClientiProduttori.SETRANGE("Cod. Cliente", Rec."Cod. Cliente");
                    lRecContrattiClientiProduttori.SETRANGE("Spedire a Codice", Rec."Cod. Spedizione");
                    lRecContrattiClientiProduttori.SETRANGE(Stato, lRecContrattiClientiProduttori.Stato::Attivo);
                    IF NOT lRecContrattiClientiProduttori.FINDSET THEN ERROR('Contratto non presente!');

                    lRecListaTotConferimentiVPP.RESET;
                    lRecListaTotConferimentiVPP.SETRANGE("Data Inizio", Rec."Data Inizio Periodo");
                    lRecListaTotConferimentiVPP.SETRANGE("Cliente/Produttore", lRecContrattiClientiProduttori."Codice Produttore WinWaste");
                    IF lRecListaTotConferimentiVPP.FINDSET THEN
                        PAGE.RUNMODAL(50107, lRecListaTotConferimentiVPP);

                end;
            }
        }
    }
    var
        TipoDoc: Text[10];
        NrDocTestata: Code[20];
        TRS_Mng: Codeunit "Tersan Mng";
        intero: Integer;

    local procedure CreaDocumenti();
    var
        lRecSetupTersan: Record "Setup Tersan";
        lRecClientidaFatturare: Record "Clienti da Fatturare";
        lRecListaRiepilogoConferimenti: Record "Lista Riepilogo Conferimenti";
        lRecContrattiClientiProduttori: Record "Contratti Clienti-Produttori";
        lRecCONFER_TMP: Record "Lista Riepilogo Conferimenti" temporary;
        lIntNr: Integer;
        lRecVPP: Record "Lista Tot. Conferimenti VPP";
        lRecVPP_Comp: Record "Lista Tot. Conferimenti VPP";
        lDelibera: Decimal;


    begin
        lRecSetupTersan.GET;
        CLEAR(lRecClientidaFatturare);
        CurrPage.SETSELECTIONFILTER(lRecClientidaFatturare);
        IF lRecClientidaFatturare.FINDSET THEN
            REPEAT
                IF (lRecClientidaFatturare.Stato = lRecClientidaFatturare.Stato::"Documento da Emettere") THEN BEGIN
                    // crea fatt/ord
                    IF (lRecSetupTersan."Tipo Doc. da Generare da WinW" = lRecSetupTersan."Tipo Doc. da Generare da WinW"::Ordine) THEN BEGIN
                        TipoDoc := 'OC';
                        lRecClientidaFatturare."Tipo Documento Emesso" := lRecClientidaFatturare."Tipo Documento Emesso"::Ordine;
                    END;

                    IF (lRecSetupTersan."Tipo Doc. da Generare da WinW" = lRecSetupTersan."Tipo Doc. da Generare da WinW"::"Fattura Provvisoria") THEN BEGIN
                        TipoDoc := 'FT';
                        lRecClientidaFatturare."Tipo Documento Emesso" := lRecClientidaFatturare."Tipo Documento Emesso"::Fattura;
                    END;

                    NrDocTestata := TRS_Mng.Ins_testata(TipoDoc, lRecClientidaFatturare."Cod. Cliente", lRecClientidaFatturare."Cod. Spedizione");
                    lRecClientidaFatturare.Stato := lRecClientidaFatturare.Stato::"Documento Generato";
                    lRecClientidaFatturare."Nr. Documento Emesso" := NrDocTestata;
                    lRecClientidaFatturare.MODIFY;
                    intero := 0;

                    lRecCONFER_TMP.RESET;
                    IF lRecCONFER_TMP.FINDSET THEN
                        lRecCONFER_TMP.DELETEALL;

                    lRecContrattiClientiProduttori.RESET;
                    lRecContrattiClientiProduttori.SETCURRENTKEY("Cod. Cliente", "Spedire a Codice", "Articolo CER");
                    lRecContrattiClientiProduttori.SETRANGE("Cod. Cliente", lRecClientidaFatturare."Cod. Cliente");
                    lRecContrattiClientiProduttori.SETRANGE("Spedire a Codice", lRecClientidaFatturare."Cod. Spedizione");
                    lRecContrattiClientiProduttori.SETRANGE(Stato, lRecContrattiClientiProduttori.Stato::Attivo);
                    IF lRecContrattiClientiProduttori.FINDSET THEN BEGIN
                        REPEAT
                            lRecListaRiepilogoConferimenti.RESET;
                            lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", lRecContrattiClientiProduttori."Codice Produttore WinWaste");
                            lRecListaRiepilogoConferimenti.SETRANGE("Articolo CER", lRecContrattiClientiProduttori."Articolo CER");
                            lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lRecClientidaFatturare."Data Inizio Periodo");
                            IF lRecListaRiepilogoConferimenti.FINDSET THEN BEGIN
                                REPEAT
                                    lRecCONFER_TMP.RESET;
                                    IF lRecCONFER_TMP.FINDLAST THEN
                                        lIntNr := lRecCONFER_TMP.Nr
                                    ELSE
                                        lIntNr := 0;
                                    lIntNr := lIntNr + 1;
                                    lRecCONFER_TMP.RESET;
                                    lRecCONFER_TMP.SETCURRENTKEY("Cliente/Produttore", "Data Inizio", "Data Fine", Settimana);
                                    lRecCONFER_TMP.SETRANGE("Cliente/Produttore", lRecListaRiepilogoConferimenti."Cliente/Produttore");
                                    lRecCONFER_TMP.SETRANGE("Data Inizio", lRecListaRiepilogoConferimenti."Data Inizio");
                                    lRecCONFER_TMP.SETRANGE("Data Fine", lRecListaRiepilogoConferimenti."Data Fine");
                                    lRecCONFER_TMP.SETRANGE("Articolo CER", lRecListaRiepilogoConferimenti."Articolo CER");
                                    lRecCONFER_TMP.SETRANGE("Ultima Verifica Merceologica", lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica");
                                    lRecCONFER_TMP.SETRANGE(RifiutoInRecupero, lRecListaRiepilogoConferimenti.RifiutoInRecupero);
                                    IF lRecCONFER_TMP.FINDFIRST THEN BEGIN
                                        lRecCONFER_TMP."Qta Conferita" := lRecCONFER_TMP."Qta Conferita" + lRecListaRiepilogoConferimenti."Qta Conferita";
                                        //lRecCONFER_TMP."Importo Riga" := lRecCONFER_TMP."Importo Riga" + lRecListaRiepilogoConferimenti."Importo Riga";
                                        //lRecCONFER_TMP.Maggiorazione := lRecCONFER_TMP.Maggiorazione + lRecListaRiepilogoConferimenti.Maggiorazione;
                                        lRecCONFER_TMP.MODIFY;
                                    END
                                    ELSE BEGIN
                                        lRecCONFER_TMP.INIT;
                                        lRecCONFER_TMP.Nr := lIntNr;
                                        lRecCONFER_TMP."Cliente/Produttore" := lRecListaRiepilogoConferimenti."Cliente/Produttore";
                                        lRecCONFER_TMP.Periodo := FORMAT(lRecListaRiepilogoConferimenti."Data Inizio") + '..' + FORMAT(lRecListaRiepilogoConferimenti."Data Fine");
                                        lRecCONFER_TMP."Data Inizio" := lRecListaRiepilogoConferimenti."Data Inizio";
                                        lRecCONFER_TMP."Data Fine" := lRecListaRiepilogoConferimenti."Data Fine";
                                        lRecCONFER_TMP."Articolo CER" := lRecListaRiepilogoConferimenti."Articolo CER";
                                        lRecCONFER_TMP."Qta Conferita" := lRecListaRiepilogoConferimenti."Qta Conferita";
                                        lRecCONFER_TMP."Tariffa Applicata" := lRecListaRiepilogoConferimenti."Tariffa Applicata";
                                        lRecCONFER_TMP."Ultima Verifica Merceologica" := lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica";
                                        lRecCONFER_TMP.Maggiorazione := lRecListaRiepilogoConferimenti.Maggiorazione;
                                        lRecCONFER_TMP."Importo Riga" := lRecListaRiepilogoConferimenti."Importo Riga";
                                        lRecCONFER_TMP."Tariffa Verifica Merceologica" := lRecListaRiepilogoConferimenti."Tariffa Verifica Merceologica";
                                        lRecCONFER_TMP.RifiutoInRecupero := lRecListaRiepilogoConferimenti.RifiutoInRecupero;
                                        lRecCONFER_TMP."Data Fatturazione" := lRecListaRiepilogoConferimenti."Data Fatturazione";
                                        lRecCONFER_TMP."Settimana Fatturazione" := lRecListaRiepilogoConferimenti."Settimana Fatturazione";
                                        lRecCONFER_TMP.INSERT;
                                    END;
                                UNTIL lRecListaRiepilogoConferimenti.NEXT = 0;
                            END;
                            //intero := 0;
                            lRecCONFER_TMP.RESET;
                            IF lRecCONFER_TMP.FINDSET THEN
                                REPEAT
                                    TRS_Mng.Ins_righe(TipoDoc, NrDocTestata, lRecCONFER_TMP, intero, 'ITEM', lRecVPP);
                                    IF ((DATE2DMY(lRecCONFER_TMP."Ultima Verifica Merceologica", 2)) = (DATE2DMY(lRecCONFER_TMP."Data Inizio", 2))) THEN
                                        TRS_Mng.Ins_righe(TipoDoc, NrDocTestata, lRecCONFER_TMP, intero, 'VM', lRecVPP);
                                UNTIL lRecCONFER_TMP.NEXT = 0;

                            lRecCONFER_TMP.RESET;
                            IF lRecCONFER_TMP.FINDSET THEN
                                lRecCONFER_TMP.DELETEALL;

                            // addebito qtà non conferite
                            lRecVPP.RESET;
                            lRecVPP.SETRANGE("Cliente/Produttore", lRecContrattiClientiProduttori."Codice Produttore WinWaste");
                            lRecVPP.SETRANGE(Periodo, lRecClientidaFatturare."Periodo Fatturazione");
                            lRecVPP.SETRANGE("Articolo CER", lRecContrattiClientiProduttori."Articolo CER");
                            lRecVPP.SETFILTER("VPP-KG", '<>0');
                            IF lRecVPP.FINDSET THEN
                                REPEAT
                                    //
                                    lRecVPP_Comp.RESET;
                                    lRecVPP_Comp.SETRANGE(lRecVPP_Comp."Cliente/Produttore", lRecVPP."Cliente/Produttore");
                                    lRecVPP_Comp.SETFILTER(lRecVPP_Comp."Valore Compensabile Residuo", '<>0');
                                    // lRecVPP_Comp.SETRANGE(Periodo, lRecClientidaFatturare."Periodo Fatturazione");
                                    lRecVPP_Comp.SETFILTER("Data Fatturazione", lRecClientidaFatturare."Periodo Fatturazione");
                                    lRecVPP_Comp.SETRANGE(lRecVPP_Comp.Settimana, lRecVPP.Settimana);
                                    IF lRecVPP_Comp.FINDSET THEN
                                        REPEAT
                                            IF (lRecVPP_Comp."Valore Compensabile Residuo" >= lRecVPP."VPP-KG") THEN BEGIN
                                                lRecVPP."Valore Compensato" := lRecVPP."VPP-KG";
                                                lRecVPP.VALIDATE("VPP-KG", 0);
                                                lRecVPP_Comp."Valore Compensabile Residuo" := lRecVPP_Comp."Valore Compensabile Residuo" - lRecVPP."VPP-KG";
                                            END;

                                            IF (lRecVPP_Comp."Valore Compensabile Residuo" < lRecVPP."VPP-KG") THEN BEGIN
                                                lRecVPP."Valore Compensato" := lRecVPP_Comp."Valore Compensabile Residuo";
                                                lRecVPP.VALIDATE("VPP-KG", (lRecVPP."VPP-KG" - lRecVPP."Valore Compensato"));
                                                lRecVPP_Comp."Valore Compensabile Residuo" := 0;
                                            END;
                                            lRecVPP.MODIFY;
                                            lRecVPP_Comp.MODIFY;
                                        UNTIL lRecVPP_Comp.NEXT = 0;

                                UNTIL lRecVPP.NEXT = 0;

                            lRecVPP.RESET;
                            lRecVPP.SETRANGE("Cliente/Produttore", lRecContrattiClientiProduttori."Codice Produttore WinWaste");
                            //lRecVPP.SETRANGE(Periodo, lRecClientidaFatturare."Periodo Fatturazione");
                            lRecVPP.SETFILTER("Data Fatturazione", lRecClientidaFatturare."Periodo Fatturazione");
                            lRecVPP.SETRANGE("Articolo CER", lRecContrattiClientiProduttori."Articolo CER");
                            lRecVPP.SETFILTER("VPP-KG", '<>0');
                            IF lRecVPP.FINDSET THEN
                                REPEAT
                                    lDelibera := TRS_Mng.ControlloDelibera(lRecVPP.Settimana, lRecVPP."Data Inizio");
                                    IF (lDelibera = 0) THEN
                                        TRS_Mng.Ins_righe(TipoDoc, NrDocTestata, lRecCONFER_TMP, intero, 'VPP', lRecVPP);
                                UNTIL lRecVPP.NEXT = 0;
                            // spese analisi merciologiche
                        UNTIL lRecContrattiClientiProduttori.NEXT = 0;
                    END;
                END;
            UNTIL lRecClientidaFatturare.NEXT = 0;
    end;

    local procedure ApriDocumentoEmesso();
    var
        lRecSalesHeader: Record 36;

    begin
        Page.RunModal(0, lRecSalesHeader);
    end;

    local procedure ApriDocumentoEmessoScheda();
    var
        lRecSetupTersan: Record "Setup Tersan";
        lRecClientidaFatturare: Record "Clienti da Fatturare";
        lRecSalesHeader: Record 36;

    begin
        lRecSetupTersan.GET;
        CLEAR(lRecClientidaFatturare);
        CurrPage.SETSELECTIONFILTER(lRecClientidaFatturare);
        IF lRecClientidaFatturare.FINDSET THEN BEGIN
            IF ("Tipo Documento Emesso" = "Tipo Documento Emesso"::Ordine) THEN BEGIN
                lRecSalesHeader.GET(lRecSalesHeader."Document Type"::Order, lRecClientidaFatturare."Nr. Documento Emesso");
                PAGE.RUNMODAL(42, lRecSalesHeader);
            END;
            IF ("Tipo Documento Emesso" = "Tipo Documento Emesso"::Fattura) THEN BEGIN
                lRecSalesHeader.GET(lRecSalesHeader."Document Type"::Invoice, lRecClientidaFatturare."Nr. Documento Emesso");
                PAGE.RUNMODAL(43, lRecSalesHeader);
            END;
        END;
    end;
}

page 50107 "Lista Conf VPP"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Lista Tot. Conferimenti VPP";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Nr; Nr)
                {
                    ApplicationArea = All;
                }

                field(Periodo; Periodo)
                {
                    ApplicationArea = All;
                }
                field("Cliente/Produttore"; "Cliente/Produttore")
                {
                    ApplicationArea = All;
                }
                field("Qta Conferita"; "Qta Conferita")
                {
                    ApplicationArea = All;
                }
                field(Settimana; Settimana)
                {
                    ApplicationArea = All;
                }
                field("Data Inizio"; "Data Inizio")
                {
                    ApplicationArea = All;
                }
                field("Data Fine"; "Data Fine")
                {
                    ApplicationArea = All;
                }
                field("GG Settimana"; "GG Settimana")
                {
                    ApplicationArea = All;
                }
                field("VPP-TN"; "VPP-TN")
                {
                    ApplicationArea = All;
                }
                field("VPP-KG"; "VPP-KG")
                {
                    ApplicationArea = All;
                }
                field("Valore Compensabile"; "Valore Compensabile")
                {
                    ApplicationArea = All;
                }
                field("Valore Compensato"; "Valore Compensato")
                {
                    ApplicationArea = All;
                }
                field("Articolo CER"; "Articolo CER")
                {
                    ApplicationArea = All;
                }
                field("Articolo Compensabile"; "Articolo Compensabile")
                {
                    ApplicationArea = All;
                }
                field("Valore Compensabile Residuo"; "Valore Compensabile Residuo")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(Factboxes)
        {

        }
    }
    actions
    {
        area(Navigation)
        {
            action("Visualizza Movimenti")
            {
                ApplicationArea = All;
                //Image = "1099Form";
                //RunObject = codeunit "Document Totals";
                trigger OnAction();
                var
                    lRecMovConferimentoWINWASTE: Record MovConferimentoWINWASTE;
                begin
                    lRecMovConferimentoWINWASTE.RESET;
                    lRecMovConferimentoWINWASTE.SETRANGE(PROD, "Cliente/Produttore");
                    lRecMovConferimentoWINWASTE.SETRANGE("Data Movimento", Rec."Data Inizio", Rec."Data Fine");
                    lRecMovConferimentoWINWASTE.SETRANGE(CER, "Articolo CER");
                    IF lRecMovConferimentoWINWASTE.FINDSET THEN;

                    PAGE.RUNMODAL(50100, lRecMovConferimentoWINWASTE);

                end;

            }

        }

    }

}
page 50108 "Lista Delibere Cliente"
{
    PageType = List;
    //ApplicationArea = all;
    SourceTable = "Registro Delibere Cliente";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod. Cliente"; "Cod. Cliente")
                {
                    ApplicationArea = All;
                }

                field("Spedire a Codice"; "Spedire a Codice")
                {
                    ApplicationArea = All;
                }
                field("Codice Produttore WinWaste"; "Codice Produttore WinWaste")
                {
                    ApplicationArea = All;
                }
                field("Data Delibera"; "Data Delibera")
                {
                    ApplicationArea = All;
                }
                field(Protocollo; Protocollo)
                {
                    ApplicationArea = All;
                }
                field("Articolo CER WinWaste"; "Articolo CER WinWaste")
                {
                    ApplicationArea = All;
                }
                field("Importo Unitario"; "Importo Unitario")
                {
                    ApplicationArea = All;
                }
                field("Stato Delibera"; "Stato Delibera")
                {
                    ApplicationArea = All;
                }
                field("Data Inizio Validità"; "Data Inizio Validità")
                {
                    ApplicationArea = All;
                }
                field("Data Fine Validità"; "Data Fine Validità")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(Factboxes)
        {

        }
    }
}

pageextension 50109 ExtendNavigationArea extends "Business Manager Role Center"
{

    actions
    {
        addlast(Sections)
        {
            group("Fatturazione Tersan")
            {
                action("Lista Conferimenti WinWaste")
                {
                    RunObject = page 50100;
                    ApplicationArea = All;
                }
                action("Lista Categorie Winwaste")
                {
                    RunObject = page 50101;
                    ApplicationArea = All;
                }
                action("Contratti Clienti-Produttori")
                {
                    RunObject = page 50102;
                    ApplicationArea = All;
                }
                action("Lista Riepiloghi trasferimenti")
                {
                    RunObject = page 50103;
                    ApplicationArea = All;
                }
                action("Registro Analisi Merceologiche")
                {
                    RunObject = page 50104;
                    ApplicationArea = All;
                }

                action("Setup Tersan")
                {
                    RunObject = page 50105;
                    ApplicationArea = All;
                }

                action("Lista Clienti da Fatturare")
                {
                    RunObject = page 50106;
                    ApplicationArea = All;
                }
                action("Lista Conf VPP")
                {
                    RunObject = page 50107;
                    ApplicationArea = All;
                }
                action("Lista Delibere Cliente")
                {
                    RunObject = page 50108;
                    ApplicationArea = All;
                }

            }
        }
    }
}

pageextension 50110 ExtendActionCustomerList extends "Customer list"
{
    layout
    {
    }
    actions
    {
        addlast(Creation)
        {
            group("Tersan")
            {
                Action("Visualizza Contratti")
                {
                    ApplicationArea = All;
                    Caption = 'Visualizza Contratti';

                    trigger OnAction();
                    begin
                        VisualizzaContratti();
                    end;
                }
                Action("Elimina Tutti i Clienti")
                {
                    ApplicationArea = All;
                    Caption = 'Visualizza Contratti';

                    trigger OnAction();
                    begin
                        DeleteAll(true);
                    end;
                }

                Action("Registro Analisi Merceologiche")
                {
                    ApplicationArea = All;
                    Caption = 'Registro Analisi Merceologiche';

                    trigger OnAction();
                    begin
                        VisualizzaAnalisi();
                    end;
                }
                Action("Registro Delibere")
                {
                    ApplicationArea = All;
                    Caption = 'Registro Delibere';

                    trigger OnAction();
                    begin
                        VisualizzaDelibere();
                    end;
                }
            }

        }


    }
    procedure VisualizzaContratti();
    var
        lRecListaClientiProduttori: Record "Contratti Clienti-Produttori";

    begin
        lRecListaClientiProduttori.RESET;
        lRecListaClientiProduttori.SETRANGE("Cod. Cliente", "No.");
        IF lRecListaClientiProduttori.FINDFIRST THEN;
        PAGE.RUNMODAL(50102, lRecListaClientiProduttori);
    end;

    procedure VisualizzaAnalisi();
    var
        lRecRegistroAnalisiMerceologiche: record "Registro Analisi Merceologiche";

    begin
        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Cod. Cliente", "No.");
        IF lRecRegistroAnalisiMerceologiche.FINDFIRST THEN;
        PAGE.RUNMODAL(50104, lRecRegistroAnalisiMerceologiche);
    end;

    procedure VisualizzaDelibere();
    var
        lRecRegistroAnalisiMerceologiche: Record "Registro Delibere Cliente";
    begin
        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Cod. Cliente", "No.");
        IF lRecRegistroAnalisiMerceologiche.FINDFIRST THEN;
        PAGE.RUNMODAL(50108, lRecRegistroAnalisiMerceologiche);
    end;

}
pageextension 50111 ExtendActionCustomerCard extends "Customer Card"
{
    layout
    {
    }
    actions
    {
        addlast("F&unctions")
        {
            group("Tersan")
            {
                Action("Visualizza Contratti")
                {
                    ApplicationArea = All;
                    Caption = 'Visualizza Contratti';

                    trigger OnAction();
                    begin
                        VisualizzaContratti();
                    end;
                }

                Action("Registro Analisi Merceologiche")
                {
                    ApplicationArea = All;
                    Caption = 'Registro Analisi Merceologiche';

                    trigger OnAction();
                    begin
                        VisualizzaAnalisi();
                    end;
                }
                Action("Registro Delibere")
                {
                    ApplicationArea = All;
                    Caption = 'Registro Delibere';

                    trigger OnAction();
                    begin
                        VisualizzaDelibere();
                    end;
                }
            }

        }


    }
    procedure VisualizzaContratti();
    var
        lRecListaClientiProduttori: Record "Contratti Clienti-Produttori";

    begin
        lRecListaClientiProduttori.RESET;
        lRecListaClientiProduttori.SETRANGE("Cod. Cliente", "No.");
        IF lRecListaClientiProduttori.FINDFIRST THEN;
        PAGE.RUNMODAL(50102, lRecListaClientiProduttori);
    end;

    procedure VisualizzaAnalisi();
    var
        lRecRegistroAnalisiMerceologiche: record "Registro Analisi Merceologiche";

    begin
        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Cod. Cliente", "No.");
        IF lRecRegistroAnalisiMerceologiche.FINDFIRST THEN;
        PAGE.RUNMODAL(50104, lRecRegistroAnalisiMerceologiche);
    end;

    procedure VisualizzaDelibere();
    var
        lRecRegistroAnalisiMerceologiche: Record "Registro Delibere Cliente";
    begin
        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Cod. Cliente", "No.");
        IF lRecRegistroAnalisiMerceologiche.FINDFIRST THEN;
        PAGE.RUNMODAL(50108, lRecRegistroAnalisiMerceologiche);
    end;

}