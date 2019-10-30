report 50100 "Genera Fatture Clienti"
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnAfterGetRecord();
            begin
                w.UPDATE(1, Customer."No.");

                "Ship-to Address".RESET;
                "Ship-to Address".SETRANGE("Ship-to Address"."Customer No.", Customer."No.");
                IF "Ship-to Address".FINDSET THEN BEGIN
                    REPEAT
                        CreaMov(Customer."No.", "Ship-to Address".Code);
                        CreaRigaDaFatturare(Customer."No.", "Ship-to Address".Code);
                    UNTIL "Ship-to Address".NEXT = 0;
                END
                ELSE BEGIN
                    CreaMov(Customer."No.", '');
                    CreaRigaDaFatturare(Customer."No.", '');
                END;
            end;

            trigger OnPreDataItem();
            var
                lRecSetupTersan: Record "Setup Tersan";
                lRecListaRiepilogoConferimenti: Record "Lista Riepilogo Conferimenti";
                ListaTotConferimentiVPP: Record "Lista Tot. Conferimenti VPP";
                lRecMovConferimentoWINWASTE: Record MovConferimentoWINWASTE;

            begin
                w.OPEN('Cliente in lavorazione: ##1###############\Spedire a indirizzo: ##2###############');
                lRecSetupTersan.GET;

                IF CONFIRM('Vuoi eliminare tutti i dati prima dell''elaborazione?', TRUE) THEN BEGIN
                    lRecListaRiepilogoConferimenti.RESET;
                    IF lRecListaRiepilogoConferimenti.FINDSET THEN
                        lRecListaRiepilogoConferimenti.DELETEALL;

                    ListaTotConferimentiVPP.RESET;
                    IF ListaTotConferimentiVPP.FINDSET THEN
                        ListaTotConferimentiVPP.DELETEALL;

                    lRecMovConferimentoWINWASTE.RESET;
                    lRecMovConferimentoWINWASTE.MODIFYALL("MovimentoLavoratoinNAV", FALSE);
                END;
            end;

            trigger OnPostDataItem();
            begin
                w.close;
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Data Inizio Ricalcolo"; gDateInizio)
                    {
                        ApplicationArea = All;
                    }
                    field("Data Fine Ricalcolo"; gDateFine)
                    {
                        ApplicationArea = All;
                    }
                }
            }

        }


        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

    }

    var
        w: Dialog;
        "Ship-to Address": Record "Ship-to Address";
        TRS_Mng: Codeunit 50101;
        gDateInizio: Date;
        gDateFine: Date;
        gRecDateTMP: Record Date temporary;
        lRecSetupTersan: Record "Setup Tersan";
        TipoDoc: Text[10];
        NrDocTestata: Code[20];
        lRecDate: Record Date;
        lRecVPP: Record "Lista Tot. Conferimenti VPP";
        gInt: Integer;
        gData: Date;

    procedure CreaMov(VarNrCliente: Code[20]; VarNrSpedizione: Code[10]);
    var
        lRecListaClientiProduttori: Record "Contratti Clienti-Produttori";
        lDateDataInizioMovimento: Date;
        lDateDataFineMovimento: Date;

    begin
        w.UPDATE(2, VarNrSpedizione);

        lRecListaClientiProduttori.RESET;
        lRecListaClientiProduttori.SETRANGE("Cod. Cliente", VarNrCliente);
        lRecListaClientiProduttori.SETRANGE("Spedire a Codice", VarNrSpedizione);
        lRecListaClientiProduttori.SETRANGE(Stato, lRecListaClientiProduttori.Stato::Attivo);
        IF lRecListaClientiProduttori.FINDSET THEN
            REPEAT
                if (gDateInizio = 0D) then
                    Error('Controllare gDataInizio in CreaMov');
                if (gDateFine = 0D) then
                    Error('Controllare gDateFine in CreaMov');
                TRS_Mng.GeneraMovDaFatturare(gDateInizio, gDateFine, lRecListaClientiProduttori."Codice Produttore WinWaste", lRecListaClientiProduttori);
                lRecDate.RESET;
                lRecDate.SETRANGE(lRecDate."Period Start", gDateInizio, gDateFine);
                lRecDate.SETRANGE("Period Type", lRecDate."Period Type"::Week);
                IF lRecDate.FINDSET THEN
                    REPEAT
                        lDateDataInizioMovimento := DMY2DATE(1, DATE2DMY(lRecDate."Period Start", 2), DATE2DMY(lRecDate."Period Start", 3));
                        lDateDataFineMovimento := CALCDATE('+CM', lDateDataInizioMovimento);

                        lRecVPP.RESET;
                        lRecVPP.SETRANGE(Settimana, lRecDate."Period No.");
                        lRecVPP.SETRANGE("Cliente/Produttore", lRecListaClientiProduttori."Codice Produttore WinWaste");
                        lRecVPP.SETRANGE("Articolo CER", lRecListaClientiProduttori."Articolo CER");
                        IF NOT lRecVPP.FINDFIRST THEN BEGIN
                            lRecVPP.INIT;
                            lRecVPP."Cliente/Produttore" := lRecListaClientiProduttori."Codice Produttore WinWaste";
                            lRecVPP.Settimana := lRecDate."Period No.";
                            lRecVPP.Periodo := FORMAT(lDateDataInizioMovimento) + '..' + FORMAT(lDateDataFineMovimento);
                            lRecVPP."Data Inizio" := lDateDataInizioMovimento;
                            lRecVPP."Data Fine" := lDateDataFineMovimento;
                            lRecVPP."Articolo CER" := lRecListaClientiProduttori."Articolo CER";
                            lRecVPP."Qta Conferita" := 0;
                            lRecVPP.VALIDATE("VPP-KG", (lRecListaClientiProduttori."TN da Conferire (Settimana)" * 1000));
                            gInt := 0;
                            lRecVPP."GG Settimana" := gInt;
                            gData := TRS_Mng.PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecVPP.Settimana);
                            lRecVPP."Data Fatturazione" := gData;
                            lRecVPP."Tariffa VPP" := lRecListaClientiProduttori."Tariffa Base VPP";
                            lRecVPP."Settimana Fatturazione" := DATE2DWY(gData, 2);
                            IF (lRecVPP."Qta Conferita" >= 0) THEN BEGIN
                                lRecVPP.INSERT(TRUE);
                            END;
                        END;
                    UNTIL lRecDate.NEXT = 0;

            UNTIL lRecListaClientiProduttori.NEXT = 0;
    end;

    procedure CreaRigaDaFatturare(VarNrCliente: Code[20]; VarNrSpedizione: Code[10]);
    var
        lRecListaRiepilogoConferimenti: Record "Lista Riepilogo Conferimenti";
        lRecListaClientiProduttori: Record "Contratti Clienti-Produttori";
        lRecClientidaFatturare: Record "Clienti da Fatturare";

    begin
        lRecListaClientiProduttori.RESET;
        lRecListaClientiProduttori.SETRANGE("Cod. Cliente", VarNrCliente);
        lRecListaClientiProduttori.SETRANGE("Spedire a Codice", VarNrSpedizione);
        lRecListaClientiProduttori.SETRANGE(Stato, lRecListaClientiProduttori.Stato::Attivo);
        IF lRecListaClientiProduttori.FINDSET THEN BEGIN
            lRecListaRiepilogoConferimenti.RESET;
            lRecListaRiepilogoConferimenti.SETCURRENTKEY("Cliente/Produttore", "Movimento Fatturato");
            lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", lRecListaClientiProduttori."Codice Produttore WinWaste");
            lRecListaRiepilogoConferimenti.SETRANGE("Movimento Fatturato", FALSE);
            IF lRecListaRiepilogoConferimenti.FINDSET THEN
                REPEAT
                    if (lRecListaRiepilogoConferimenti."Data Inizio" = 0D) then
                        Error('Controllare Data Inizio in CreaRigaDaFatturare');
                    if (lRecListaRiepilogoConferimenti."Data Fine" = 0D) then
                        Error('Controllare Date Fine in CreaRigaDaFatturare');
                    lRecClientidaFatturare.INIT;
                    lRecClientidaFatturare."Cod. Cliente" := lRecListaClientiProduttori."Cod. Cliente";
                    lRecClientidaFatturare."Cod. Spedizione" := lRecListaClientiProduttori."Spedire a Codice";
                    lRecClientidaFatturare."Periodo Fatturazione" := lRecListaRiepilogoConferimenti.Periodo;
                    lRecClientidaFatturare."Data Inizio Periodo" := lRecListaRiepilogoConferimenti."Data Inizio";
                    lRecClientidaFatturare."Data Fine Periodo" := lRecListaRiepilogoConferimenti."Data Fine";
                    lRecClientidaFatturare.Stato := lRecClientidaFatturare.Stato::"Documento da Emettere";
                    IF NOT lRecClientidaFatturare.INSERT THEN
                        IF (lRecClientidaFatturare.Stato <> lRecClientidaFatturare.Stato::"Documento Generato") THEN
                            lRecClientidaFatturare.MODIFY
                        ELSE BEGIN
                            lRecClientidaFatturare.Stato := lRecClientidaFatturare.Stato::"Errore: rilevati movimenti in periodi chiusi";
                            lRecClientidaFatturare.MODIFY;
                        END;
                UNTIL lRecListaRiepilogoConferimenti.NEXT = 0;


        END;
    end;
}