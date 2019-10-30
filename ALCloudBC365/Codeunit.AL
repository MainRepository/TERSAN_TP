codeunit 50101 "Tersan Mng"
{
    var
        //r: record Customer;
        gInt: Integer;
        gData: Date;

    trigger OnRun();
    begin
        GeneraMovProduttore;
    end;

    PROCEDURE GeneraMovDaFatturare(VarDataInizio: Date; VarDataFine: Date; VarCodeCliente: Code[20]; VarRecListaClientiProduttori: Record 50102);
    VAR
        lRecListaRiepilogoConferimenti: Record 50103;
        lRecMovConferimentoWINWASTE: Record 50100;
        lRecSetupTersan: Record 50105;
        ListaTotConferimentiVPP: Record 50106;
        lDateDataInizioMovimento: Date;
        lDateDataFineMovimento: Date;
        lRecDate: Record 2000000007;
        lRecRegistroDelibereCliente: Record 50109;
        lDateDataFinePeriodo: Date;
        lDelibera: Decimal;
        PercImpuritaApplicata: Decimal;
    BEGIN
        lRecSetupTersan.GET;

        lRecMovConferimentoWINWASTE.RESET;
        // 300419 al. PROD in CATS >>
        //lRecMovConferimentoWINWASTE.SETCURRENTKEY(PROD, "Data Movimento");
        //lRecMovConferimentoWINWASTE.SETRANGE(PROD, VarCodeCliente);
        lRecMovConferimentoWINWASTE.SETCURRENTKEY(CATS, "Data Movimento");
        lRecMovConferimentoWINWASTE.SETRANGE(CATS, VarCodeCliente);
        // test 111
        // 300419 al. PROD in CATS <<
        lRecMovConferimentoWINWASTE.SETRANGE("Data Movimento", VarDataInizio, VarDataFine);
        lRecMovConferimentoWINWASTE.SETRANGE(CER, VarRecListaClientiProduttori."Articolo CER");
        lRecMovConferimentoWINWASTE.SETRANGE("MovimentoLavoratoinNAV", FALSE);
        IF lRecMovConferimentoWINWASTE.FINDSET THEN
            REPEAT
                lDateDataInizioMovimento := DMY2DATE(1, DATE2DMY(lRecMovConferimentoWINWASTE."Data Movimento", 2), DATE2DMY(lRecMovConferimentoWINWASTE."Data Movimento", 3));
                lDateDataFineMovimento := CALCDATE('+CM', lDateDataInizioMovimento);
                // test 222+++++
                lRecListaRiepilogoConferimenti.RESET;
                lRecListaRiepilogoConferimenti.SETCURRENTKEY("Cliente/Produttore", "Data Inizio", "Data Fine", Settimana);
                lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", VarCodeCliente);
                lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE("Data Fine", lDateDataFineMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE(Settimana, lRecMovConferimentoWINWASTE."NrSettimana");
                lRecListaRiepilogoConferimenti.SETRANGE("Articolo CER", lRecMovConferimentoWINWASTE.CER);
                lRecListaRiepilogoConferimenti.SETRANGE("Perc. Impurità",
                      GetImpurità(lRecMovConferimentoWINWASTE."Data Movimento", VarCodeCliente, lRecMovConferimentoWINWASTE.CER));
                lRecListaRiepilogoConferimenti.SETRANGE(RifiutoInRecupero, lRecMovConferimentoWINWASTE.RifiutoInRecupero);
                IF lRecListaRiepilogoConferimenti.FINDFIRST THEN BEGIN
                    lRecListaRiepilogoConferimenti."Qta Conferita" := (lRecListaRiepilogoConferimenti."Qta Conferita" + lRecMovConferimentoWINWASTE."Quantita Da Fatturare");
                    lRecListaRiepilogoConferimenti."GG Settimana" := lRecMovConferimentoWINWASTE."NrGiorniAttivi";
                    lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica" := GetDataUltimaImpurità(lRecMovConferimentoWINWASTE."Data Movimento", VarCodeCliente, lRecMovConferimentoWINWASTE.CER);
                    gData := PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");
                    lRecListaRiepilogoConferimenti."Data Fatturazione" := gData;
                    lRecListaRiepilogoConferimenti."Movimento Fatturato" := FALSE;
                    lRecListaRiepilogoConferimenti."Settimana Fatturazione" := DATE2DWY(gData, 2);
                    //        IF (lRecListaRiepilogoConferimenti.Settimana = 22) THEN
                    //          MESSAGE('22');
                    InserisciTotConferimenti(lRecListaRiepilogoConferimenti, lRecMovConferimentoWINWASTE."Quantita da Fatturare", VarRecListaClientiProduttori);
                    lRecListaRiepilogoConferimenti.MODIFY(TRUE);
                END
                ELSE BEGIN
                    lRecListaRiepilogoConferimenti.INIT;
                    lRecListaRiepilogoConferimenti."Cliente/Produttore" := VarCodeCliente;
                    lRecListaRiepilogoConferimenti.Settimana := lRecMovConferimentoWINWASTE."NrSettimana";
                    lRecListaRiepilogoConferimenti.Periodo := FORMAT(lDateDataInizioMovimento) + '..' + FORMAT(lDateDataFineMovimento);
                    lRecListaRiepilogoConferimenti."Data Inizio" := lDateDataInizioMovimento;
                    lRecListaRiepilogoConferimenti."Data Fine" := lDateDataFineMovimento;
                    lRecListaRiepilogoConferimenti."Articolo CER" := lRecMovConferimentoWINWASTE.CER;
                    lRecListaRiepilogoConferimenti."Qta Conferita" := lRecMovConferimentoWINWASTE."Quantita da Fatturare";
                    lRecListaRiepilogoConferimenti."GG Settimana" := lRecMovConferimentoWINWASTE."NrGiorniAttivi";
                    lRecListaRiepilogoConferimenti."Perc. Impurità" := GetImpurità(lRecMovConferimentoWINWASTE."Data Movimento", VarCodeCliente, lRecMovConferimentoWINWASTE.CER);
                    lRecListaRiepilogoConferimenti."Tariffa Applicata" := VarRecListaClientiProduttori."Tariffa Base";
                    lRecListaRiepilogoConferimenti."Tariffa Verifica Merceologica" := VarRecListaClientiProduttori."Tariffa Verifica Merceologica";
                    lRecListaRiepilogoConferimenti."Tariffa VPP" := VarRecListaClientiProduttori."Tariffa Base VPP";
                    lRecListaRiepilogoConferimenti."Movimento Fatturato" := FALSE;
                    gData := PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");
                    lRecListaRiepilogoConferimenti."Data Fatturazione" := gData;
                    lRecListaRiepilogoConferimenti."Settimana Fatturazione" := DATE2DWY(gData, 2);
                    //        IF (lRecListaRiepilogoConferimenti.Settimana = 22) THEN
                    //          MESSAGE('22');
                    lRecListaRiepilogoConferimenti.RifiutoInRecupero := lRecMovConferimentoWINWASTE.RifiutoInRecupero;
                    lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica" := GetDataUltimaImpurità(lRecMovConferimentoWINWASTE."Data Movimento", VarCodeCliente, lRecMovConferimentoWINWASTE.CER);

                    PercImpuritaApplicata := 0;
                    IF (VarRecListaClientiProduttori."Percentuale Impurità Stabilita" <> 0) then
                        PercImpuritaApplicata := VarRecListaClientiProduttori."Percentuale Impurità Stabilita"
                    else
                        PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";

                    lRecListaRiepilogoConferimenti.Maggiorazione := (lRecListaRiepilogoConferimenti."Perc. Impurità" - PercImpuritaApplicata) *
                        VarRecListaClientiProduttori.Maggiorazione;
                    IF (lRecListaRiepilogoConferimenti.Maggiorazione < 0) THEN
                        lRecListaRiepilogoConferimenti.Maggiorazione := 0;
                    lRecListaRiepilogoConferimenti."Importo Riga" := (lRecListaRiepilogoConferimenti."Tariffa Applicata"
                          + lRecListaRiepilogoConferimenti.Maggiorazione);

                    IF (lRecListaRiepilogoConferimenti.RifiutoInRecupero) THEN BEGIN
                        lRecListaRiepilogoConferimenti."Importo Riga" := 0;
                    END;
                    IF (lRecListaRiepilogoConferimenti."Qta Conferita" <> 0) THEN BEGIN
                        InserisciTotConferimenti(lRecListaRiepilogoConferimenti, lRecMovConferimentoWINWASTE."Quantita da Fatturare", VarRecListaClientiProduttori);
                        lRecListaRiepilogoConferimenti.INSERT(TRUE);
                    END;
                    // verifico ed inserisco le delibere
                    VerificaDelibera(lDateDataInizioMovimento, lDateDataFineMovimento, VarRecListaClientiProduttori);
                END;
                lRecMovConferimentoWINWASTE."MovimentoLavoratoinNAV" := TRUE;
                lRecMovConferimentoWINWASTE.MODIFY;
            UNTIL lRecMovConferimentoWINWASTE.NEXT = 0;


        // inserisci settimane mancanti:

        lRecDate.RESET;
        lRecDate.SETRANGE(lRecDate."Period Start", VarDataInizio, VarDataFine);
        lRecDate.SETRANGE("Period Type", lRecDate."Period Type"::Week);
        IF lRecDate.FINDSET THEN
            REPEAT
                lDateDataInizioMovimento := DMY2DATE(1, DATE2DMY(lRecDate."Period Start", 2), DATE2DMY(lRecDate."Period Start", 3));
                lDateDataFineMovimento := CALCDATE('+CM', lDateDataInizioMovimento);

                lRecListaRiepilogoConferimenti.RESET;
                lRecListaRiepilogoConferimenti.SETRANGE(Settimana, lRecDate."Period No.");
                //lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE("Data Fine", lDateDataFineMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", VarRecListaClientiProduttori."Codice Produttore WinWaste");
                lRecListaRiepilogoConferimenti.SETRANGE("Articolo CER", VarRecListaClientiProduttori."Articolo CER");
                IF NOT lRecListaRiepilogoConferimenti.FIND THEN BEGIN
                    CLEAR(lRecMovConferimentoWINWASTE);
                    lRecListaRiepilogoConferimenti.INIT;
                    lRecListaRiepilogoConferimenti."Cliente/Produttore" := VarCodeCliente;
                    lRecListaRiepilogoConferimenti.Settimana := lRecDate."Period No.";
                    lRecListaRiepilogoConferimenti.Periodo := FORMAT(lDateDataInizioMovimento) + '..' + FORMAT(lDateDataFineMovimento);
                    lRecListaRiepilogoConferimenti."Data Inizio" := lDateDataInizioMovimento;
                    lRecListaRiepilogoConferimenti."Data Fine" := lDateDataFineMovimento;
                    lRecListaRiepilogoConferimenti."Articolo CER" := VarRecListaClientiProduttori."Articolo CER";
                    lRecListaRiepilogoConferimenti."Qta Conferita" := 0;
                    gInt := 0;
                    lRecMovConferimentoWINWASTE.VerificaTipoSettimana(lRecDate."Period No.", gInt);
                    lRecListaRiepilogoConferimenti."GG Settimana" := gInt;
                    gData := PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");
                    lRecListaRiepilogoConferimenti."Data Fatturazione" := gData;
                    lRecListaRiepilogoConferimenti."Perc. Impurità" := GetImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");
                    lRecListaRiepilogoConferimenti."Tariffa Applicata" := VarRecListaClientiProduttori."Tariffa Base";
                    lRecListaRiepilogoConferimenti."Tariffa Verifica Merceologica" := VarRecListaClientiProduttori."Tariffa Verifica Merceologica";
                    lRecListaRiepilogoConferimenti."Tariffa VPP" := VarRecListaClientiProduttori."Tariffa Base VPP";
                    lRecListaRiepilogoConferimenti."Movimento Fatturato" := FALSE;
                    lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica" := GetDataUltimaImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");

                    PercImpuritaApplicata := 0;
                    IF (VarRecListaClientiProduttori."Percentuale Impurità Stabilita" <> 0) then
                        PercImpuritaApplicata := VarRecListaClientiProduttori."Percentuale Impurità Stabilita"
                    else
                        PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";

                    lRecListaRiepilogoConferimenti.Maggiorazione := (lRecListaRiepilogoConferimenti."Perc. Impurità" - PercImpuritaApplicata) *
                        VarRecListaClientiProduttori.Maggiorazione;
                    IF (lRecListaRiepilogoConferimenti.Maggiorazione < 0) THEN
                        lRecListaRiepilogoConferimenti.Maggiorazione := 0;
                    lRecListaRiepilogoConferimenti."Importo Riga" := (lRecListaRiepilogoConferimenti."Tariffa Applicata"
                          + lRecListaRiepilogoConferimenti.Maggiorazione);
                    IF (lRecListaRiepilogoConferimenti."Qta Conferita" >= 0) THEN BEGIN
                        InserisciTotConferimenti(lRecListaRiepilogoConferimenti, lRecMovConferimentoWINWASTE."Quantita da Fatturare", VarRecListaClientiProduttori);
                        lRecListaRiepilogoConferimenti.INSERT(TRUE);
                    END;
                END;
                lDateDataFinePeriodo := DMY2DATE(1, DATE2DMY(lRecDate."Period End", 2), DATE2DMY(lRecDate."Period End", 3));
                IF (lDateDataFinePeriodo <> lDateDataInizioMovimento) THEN BEGIN
                    lDateDataInizioMovimento := DMY2DATE(1, DATE2DMY(lRecDate."Period End", 2), DATE2DMY(lRecDate."Period End", 3));
                    lDateDataFineMovimento := CALCDATE('+CM', lDateDataInizioMovimento);
                    lRecListaRiepilogoConferimenti.RESET;
                    lRecListaRiepilogoConferimenti.SETRANGE(Settimana, lRecDate."Period No.");
                    lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                    lRecListaRiepilogoConferimenti.SETRANGE("Data Fine", lDateDataFineMovimento);
                    //lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                    lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", VarRecListaClientiProduttori."Codice Produttore WinWaste");
                    lRecListaRiepilogoConferimenti.SETRANGE("Articolo CER", VarRecListaClientiProduttori."Articolo CER");
                    IF NOT lRecListaRiepilogoConferimenti.FIND THEN BEGIN
                        CLEAR(lRecMovConferimentoWINWASTE);
                        lRecListaRiepilogoConferimenti.INIT;
                        lRecListaRiepilogoConferimenti."Cliente/Produttore" := VarCodeCliente;
                        lRecListaRiepilogoConferimenti.Settimana := lRecDate."Period No.";
                        lRecListaRiepilogoConferimenti.Periodo := FORMAT(lDateDataInizioMovimento) + '..' + FORMAT(lDateDataFineMovimento);
                        lRecListaRiepilogoConferimenti."Data Inizio" := lDateDataInizioMovimento;
                        lRecListaRiepilogoConferimenti."Data Fine" := lDateDataFineMovimento;
                        lRecListaRiepilogoConferimenti."Articolo CER" := VarRecListaClientiProduttori."Articolo CER";
                        lRecListaRiepilogoConferimenti."Qta Conferita" := 0;
                        gInt := 0;
                        lRecMovConferimentoWINWASTE.VerificaTipoSettimana(lRecDate."Period No.", gInt);
                        lRecListaRiepilogoConferimenti."GG Settimana" := 5 - gInt;
                        lRecListaRiepilogoConferimenti."Perc. Impurità" := GetImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");
                        lRecListaRiepilogoConferimenti."Tariffa Applicata" := VarRecListaClientiProduttori."Tariffa Base";
                        lRecListaRiepilogoConferimenti."Tariffa Verifica Merceologica" := VarRecListaClientiProduttori."Tariffa Verifica Merceologica";
                        lRecListaRiepilogoConferimenti."Tariffa VPP" := VarRecListaClientiProduttori."Tariffa Base VPP";
                        lRecListaRiepilogoConferimenti."Movimento Fatturato" := FALSE;
                        gData := PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");
                        lRecListaRiepilogoConferimenti."Data Fatturazione" := gData;
                        lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica" := GetDataUltimaImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");
                        PercImpuritaApplicata := 0;
                        IF (VarRecListaClientiProduttori."Percentuale Impurità Stabilita" <> 0) then
                            PercImpuritaApplicata := VarRecListaClientiProduttori."Percentuale Impurità Stabilita"
                        else
                            PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";

                        lRecListaRiepilogoConferimenti.Maggiorazione := (lRecListaRiepilogoConferimenti."Perc. Impurità" - PercImpuritaApplicata) *
                            VarRecListaClientiProduttori.Maggiorazione;
                        IF (lRecListaRiepilogoConferimenti.Maggiorazione < 0) THEN
                            lRecListaRiepilogoConferimenti.Maggiorazione := 0;
                        lRecListaRiepilogoConferimenti."Importo Riga" := (lRecListaRiepilogoConferimenti."Tariffa Applicata"
                              + lRecListaRiepilogoConferimenti.Maggiorazione);
                        IF (lRecListaRiepilogoConferimenti."Qta Conferita" >= 0) THEN BEGIN
                            InserisciTotConferimenti(lRecListaRiepilogoConferimenti, lRecMovConferimentoWINWASTE."Quantita da Fatturare", VarRecListaClientiProduttori);
                            lRecListaRiepilogoConferimenti.INSERT(TRUE);
                        END;
                    END;
                END;

            UNTIL lRecDate.NEXT = 0;

        lRecDate.RESET;
        lRecDate.SETRANGE(lRecDate."Period End", VarDataInizio, VarDataFine);
        lRecDate.SETRANGE("Period Type", lRecDate."Period Type"::Week);
        IF lRecDate.FINDSET THEN
            REPEAT
                lDateDataInizioMovimento := DMY2DATE(1, DATE2DMY(lRecDate."Period Start", 2), DATE2DMY(lRecDate."Period Start", 3));
                lDateDataFineMovimento := CALCDATE('+CM', lDateDataInizioMovimento);
                lRecListaRiepilogoConferimenti.RESET;
                lRecListaRiepilogoConferimenti.SETRANGE(Settimana, lRecDate."Period No.");
                //lRecListaRiepilogoConferimenti.SETRANGE("Data Inizio", lDateDataInizioMovimento);
                lRecListaRiepilogoConferimenti.SETRANGE("Cliente/Produttore", VarRecListaClientiProduttori."Codice Produttore WinWaste");
                lRecListaRiepilogoConferimenti.SETRANGE("Articolo CER", VarRecListaClientiProduttori."Articolo CER");
                IF NOT lRecListaRiepilogoConferimenti.FIND THEN BEGIN
                    CLEAR(lRecMovConferimentoWINWASTE);

                    lRecListaRiepilogoConferimenti.INIT;
                    lRecListaRiepilogoConferimenti."Cliente/Produttore" := VarCodeCliente;
                    lRecListaRiepilogoConferimenti.Settimana := lRecDate."Period No.";
                    lRecListaRiepilogoConferimenti.Periodo := FORMAT(lDateDataInizioMovimento) + '..' + FORMAT(lDateDataFineMovimento);
                    lRecListaRiepilogoConferimenti."Data Inizio" := lDateDataInizioMovimento;
                    lRecListaRiepilogoConferimenti."Data Fine" := lDateDataFineMovimento;
                    lRecListaRiepilogoConferimenti."Articolo CER" := VarRecListaClientiProduttori."Articolo CER";
                    lRecListaRiepilogoConferimenti."Qta Conferita" := 0;
                    gInt := 0;
                    lRecMovConferimentoWINWASTE.VerificaTipoSettimana(lRecDate."Period No.", gInt);
                    lRecListaRiepilogoConferimenti."GG Settimana" := gInt;
                    lRecListaRiepilogoConferimenti."Perc. Impurità" := GetImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");
                    lRecListaRiepilogoConferimenti."Tariffa Applicata" := VarRecListaClientiProduttori."Tariffa Base";
                    lRecListaRiepilogoConferimenti."Tariffa Verifica Merceologica" := VarRecListaClientiProduttori."Tariffa Verifica Merceologica";
                    lRecListaRiepilogoConferimenti."Tariffa VPP" := VarRecListaClientiProduttori."Tariffa Base VPP";
                    lRecListaRiepilogoConferimenti."Movimento Fatturato" := FALSE;
                    gData := PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");
                    lRecListaRiepilogoConferimenti."Data Fatturazione" := gData;
                    lRecListaRiepilogoConferimenti."Ultima Verifica Merceologica" := GetDataUltimaImpurità(lDateDataInizioMovimento, VarCodeCliente, VarRecListaClientiProduttori."Articolo CER");
                    PercImpuritaApplicata := 0;
                    IF (VarRecListaClientiProduttori."Percentuale Impurità Stabilita" <> 0) then
                        PercImpuritaApplicata := VarRecListaClientiProduttori."Percentuale Impurità Stabilita"
                    else
                        PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";
                    lRecListaRiepilogoConferimenti.Maggiorazione := (lRecListaRiepilogoConferimenti."Perc. Impurità" - PercImpuritaApplicata) *
                        VarRecListaClientiProduttori.Maggiorazione;
                    IF (lRecListaRiepilogoConferimenti.Maggiorazione < 0) THEN
                        lRecListaRiepilogoConferimenti.Maggiorazione := 0;
                    lRecListaRiepilogoConferimenti."Importo Riga" := (lRecListaRiepilogoConferimenti."Tariffa Applicata"
                          + lRecListaRiepilogoConferimenti.Maggiorazione);
                    IF (lRecListaRiepilogoConferimenti."Qta Conferita" >= 0) THEN BEGIN
                        InserisciTotConferimenti(lRecListaRiepilogoConferimenti, lRecMovConferimentoWINWASTE."Quantita da Fatturare", VarRecListaClientiProduttori);
                        lRecListaRiepilogoConferimenti.INSERT(TRUE);
                    END;
                END;
            UNTIL lRecDate.NEXT = 0;

        // ListaTotConferimentiVPP.RESET;
        // ListaTotConferimentiVPP.SETRANGE("Data Inizio",  VarDataInizio);
        // ListaTotConferimentiVPP.SETRANGE("Data Fine", VarDataFine);
        // IF ListaTotConferimentiVPP.FINDSET THEN
        //  REPEAT
        //    //
        //    lDelibera := ControlloDelibera(ListaTotConferimentiVPP.Settimana, ListaTotConferimentiVPP."Data Inizio");
        //    IF (lDelibera <> 0) THEN
        //      BEGIN
        //          IF (ListaTotConferimentiVPP."Qta Conferita" = 0) THEN
        //            BEGIN
        //              ListaTotConferimentiVPP."Qta Conferita":= 37000;
        //              ListaTotConferimentiVPP.MODIFY;
        //            END;
        //      END;
        //  UNTIL ListaTotConferimentiVPP.NEXT=0;
    END;

    PROCEDURE GeneraMovProduttore();
    VAR
        lRecListaClientiProduttori: Record 50102;
    BEGIN
        ERROR('Test');
        lRecListaClientiProduttori.RESET;
        // inserire filtri su contratti attivi e relativi controlli
        lRecListaClientiProduttori.SETRANGE(Stato, lRecListaClientiProduttori.Stato::Attivo);
        IF lRecListaClientiProduttori.FINDSET THEN
            REPEAT
                GeneraMovDaFatturare(20180701D, 20180731D, lRecListaClientiProduttori."Codice Produttore WinWaste", lRecListaClientiProduttori);
            UNTIL lRecListaClientiProduttori.NEXT = 0;
    END;

    LOCAL PROCEDURE GetImpurità(VarData: Date; VarCliente: Code[20]; VarArticolo: Code[10]): Decimal;
    VAR
        lRecRegistroAnalisiMerceologiche: Record 50104;
        lRecSetupTersan: Record 50105;
        PercImpuritaApplicata: Decimal;
        VarRecListaClientiProduttori: Record 50102;
    BEGIN
        lRecSetupTersan.GET;

        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Codice Produttore WinWaste", VarCliente);
        lRecRegistroAnalisiMerceologiche.SETFILTER("Data Analisi", '..%1', VarData);
        lRecRegistroAnalisiMerceologiche.SETRANGE("Articolo CER WinWaste", VarArticolo);
        IF lRecRegistroAnalisiMerceologiche.FINDLAST THEN
            EXIT(lRecRegistroAnalisiMerceologiche."Impurità Rilevata");

        PercImpuritaApplicata := 0;
        VarRecListaClientiProduttori.Reset();
        VarRecListaClientiProduttori.SetRange("Cod. Cliente", VarCliente);
        VarRecListaClientiProduttori.SetRange("Articolo CER", VarArticolo);
        if VarRecListaClientiProduttori.FindFirst() then begin
            IF (VarRecListaClientiProduttori."Percentuale Impurità Stabilita" <> 0) then
                PercImpuritaApplicata := VarRecListaClientiProduttori."Percentuale Impurità Stabilita"
            else
                PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";
        end
        else begin
            PercImpuritaApplicata := lRecSetupTersan."Perc. Impurità Autorizzata";
        end;
        EXIT(PercImpuritaApplicata);
    END;

    LOCAL PROCEDURE InserisciTotConferimenti(VarRecListaRiepilogoConferimenti: Record 50103; VarQuantita: Decimal; VarContrattiClientiProduttori: Record 50102);
    VAR
        ListaTotConferimentiVPP: Record 50106;
        lRecSetupTersan: Record 50105;
        lDecQtaConfContr: Decimal;
        lDecQtaConfMax: Decimal;
        lDelibera: Decimal;
    BEGIN
        lRecSetupTersan.GET;

        lDecQtaConfContr := 0;
        lDecQtaConfMax := 0;
        lDecQtaConfContr := VarContrattiClientiProduttori."TN da Conferire (Settimana)" * 1000;
        lDecQtaConfMax := lDecQtaConfContr * lRecSetupTersan."Perc. Soglia Conferimento VPP" / 100;


        ListaTotConferimentiVPP.RESET;
        ListaTotConferimentiVPP.SETCURRENTKEY("Cliente/Produttore", "Data Inizio", "Data Fine", Settimana);
        ListaTotConferimentiVPP.SETRANGE("Cliente/Produttore", VarRecListaRiepilogoConferimenti."Cliente/Produttore");
        //ListaTotConferimentiVPP.SETRANGE("Data Inizio", VarRecListaRiepilogoConferimenti."Data Inizio");
        //ListaTotConferimentiVPP.SETRANGE("Data Fine", VarRecListaRiepilogoConferimenti."Data Fine");
        //ListaTotConferimentiVPP.SETRANGE(Settimana, VarRecListaRiepilogoConferimenti.Settimana);
        ListaTotConferimentiVPP.SETRANGE(Settimana, VarRecListaRiepilogoConferimenti."Settimana Fatturazione");
        ListaTotConferimentiVPP.SETRANGE("Articolo CER", VarRecListaRiepilogoConferimenti."Articolo CER");
        IF ListaTotConferimentiVPP.FINDFIRST THEN BEGIN
            ListaTotConferimentiVPP."Qta Conferita" := (ListaTotConferimentiVPP."Qta Conferita" + VarQuantita);
            // IF (( ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfMax) OR (ListaTotConferimentiVPP."GG Settimana" < 5)) THEN // rimossi giorni e presi gg fatturabili
            IF (ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfMax) THEN BEGIN
                ListaTotConferimentiVPP."Valore Compensabile" := 0;
                ListaTotConferimentiVPP.VALIDATE("VPP-KG", 0);
                IF (ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfContr) THEN
                    IF (lDecQtaConfContr <> 0) THEN BEGIN
                        ListaTotConferimentiVPP."Valore Compensabile" := ListaTotConferimentiVPP."Qta Conferita" - lDecQtaConfContr;
                        ListaTotConferimentiVPP."Valore Compensabile Residuo" := ListaTotConferimentiVPP."Valore Compensabile";
                    END;
            END
            ELSE
                ListaTotConferimentiVPP.VALIDATE("VPP-KG", (lDecQtaConfContr - ListaTotConferimentiVPP."Qta Conferita"));
            ListaTotConferimentiVPP.MODIFY(TRUE);
        END
        ELSE BEGIN
            ListaTotConferimentiVPP.INIT;
            ListaTotConferimentiVPP."Cliente/Produttore" := VarRecListaRiepilogoConferimenti."Cliente/Produttore";
            ListaTotConferimentiVPP.Settimana := VarRecListaRiepilogoConferimenti.Settimana;
            ListaTotConferimentiVPP.Periodo := VarRecListaRiepilogoConferimenti.Periodo;
            ListaTotConferimentiVPP."Data Inizio" := VarRecListaRiepilogoConferimenti."Data Inizio";
            ListaTotConferimentiVPP."Data Fine" := VarRecListaRiepilogoConferimenti."Data Fine";
            ListaTotConferimentiVPP."Qta Conferita" := VarQuantita;
            ListaTotConferimentiVPP."Articolo CER" := VarRecListaRiepilogoConferimenti."Articolo CER";
            ListaTotConferimentiVPP."Tariffa VPP" := VarRecListaRiepilogoConferimenti."Tariffa VPP";
            ListaTotConferimentiVPP."GG Settimana" := VarRecListaRiepilogoConferimenti."GG Settimana";
            ListaTotConferimentiVPP.Settimana := VarRecListaRiepilogoConferimenti."Settimana Fatturazione";
            gData := PrendiGiornoFatturazione(VarRecListaRiepilogoConferimenti."Data Inizio", VarRecListaRiepilogoConferimenti."Data Fine", VarRecListaRiepilogoConferimenti.Settimana);
            ListaTotConferimentiVPP."Data Fatturazione" := gData;

            //IF (( ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfMax) OR (ListaTotConferimentiVPP."GG Settimana" < 5)) THEN controllare
            // rimosso per cotnrollo su venerd
            // IF (( ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfMax) OR (ListaTotConferimentiVPP."GG Settimana" <
            // VarContrattiClientiProduttori."Addebito VPP sopra N gg")) THEN
            // rimosso per cotnrollo su venerd -
            IF (ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfMax) THEN BEGIN
                ListaTotConferimentiVPP."Valore Compensabile" := 0;
                ListaTotConferimentiVPP.VALIDATE("VPP-KG", 0);
                IF (ListaTotConferimentiVPP."Qta Conferita" >= lDecQtaConfContr) THEN
                    IF (lDecQtaConfContr <> 0) THEN BEGIN
                        ListaTotConferimentiVPP."Valore Compensabile" := ListaTotConferimentiVPP."Qta Conferita" - lDecQtaConfContr;
                        ListaTotConferimentiVPP."Valore Compensabile Residuo" := ListaTotConferimentiVPP."Valore Compensabile";
                    END;
            END
            ELSE
                ListaTotConferimentiVPP.INSERT(TRUE);
        END;
    END;

    PROCEDURE Ins_testata(par_TipoDoc: Text[10]; Var_Cliente: Code[20]; var_csped: Code[10]) Var_NrDocumento: Code[20];
    VAR
        CodAgente: Code[20];
        Customer: Record 18;
        t_agenti: Record 13;
        l_ReasonCode: Record 231;
        lRecSetupTersan: Record 50105;
        t_36: Record 36;
        t_37: Record 37;
    BEGIN

        lRecSetupTersan.GET;

        //IF NOT (CheckUserPermission(lRecSetupRDA."Ruolo Creazione Ordini")) THEN
        //ERROR(Text002);

        t_36.INIT;
        /*  
            {
              IF ((par_TipoDoc = 'OC') OR (par_TipoDoc = 'PR') OR (par_TipoDoc = 'VB')) THEN
                BEGIN
                  t_36."Document Type" := t_36."Document Type"::Order;
                  t_36."Reason Code" := par_TipoDoc;
                END;

              IF (par_TipoDoc = 'FT') THEN
                BEGIN
                  t_36."Document Type" := t_36."Document Type"::Invoice;
                  t_36."Reason Code" := par_TipoDoc;
                END;

              IF (par_TipoDoc = 'RC') THEN
                BEGIN
                  t_36."Document Type" := t_36."Document Type"::"Return Order";
                  t_36."Reason Code" := par_TipoDoc;
                END;
              }
        */

        IF (par_TipoDoc = 'OF') THEN BEGIN
            t_36."Document Type" := t_36."Document Type"::Quote;
            t_36."Reason Code" := par_TipoDoc;
        END;

        IF (par_TipoDoc = 'OC') THEN BEGIN
            t_36."Document Type" := t_36."Document Type"::Order;
            t_36."Reason Code" := par_TipoDoc;
        END;

        IF (par_TipoDoc = 'FT') THEN BEGIN
            t_36."Document Type" := t_36."Document Type"::Invoice;
            t_36."Reason Code" := par_TipoDoc;
        END;

        t_36."No." := '';
        /*
              {
              IF t_36."No." = '' THEN BEGIN
                    t_36."No." := NoSeriesMgt.GetNextNo(GetNoSeriesCode, t_36."Posting Date", TRUE);
                    NrDoc := t_36."No.";
                END;
              }
        */

        //t_36.

        //t_36."External Document No." := Zero_documento.id;

        //IF Customer.GET(Var_RDAFornitoririchiesti."Nr. Fornitore") THEN
        t_36.VALIDATE("Sell-to Customer No.", Var_Cliente);
        t_36.VALIDATE("Ship-to Code", var_csped);

        //t_36."Your Reference" := Var_NrDocumento;

        // traccio inserimento e modifica
        //t_36."Data Inserimento" := TODAY;
        //t_36."Ora Inserimento" := TIME;
        //t_36."Data Ultima Modifica" := TODAY;
        //t_36."Ora Ultima Modifica" := TIME;



        //t_36."Customer Price Group"
        t_36."Activity Code" := 'VEN';
        t_36.INSERT(TRUE);


        t_36."Posting Date" := WORKDATE;
        t_36."Operation Occurred Date" := t_36."Posting Date";

        t_36."Posting Description" := ''; //COPYSTR("Crm Order Sinc".DescrizioneBreve, 1,50);

        t_36."Order Date" := t_36."Posting Date";
        t_36."Document Date" := t_36."Posting Date";
        Var_NrDocumento := t_36."No.";
        t_36.MODIFY;
    END;

    PROCEDURE Ins_righe(par_TipoDoc: Text[10]; Var_NrDocumento: Code[20]; Var_Conferimenti_TMP: Record 50103; VAR intero: Integer; TipoRiga: Text[20]; Var_Conferimenti_VPP: Record 50106);
    VAR
        l_DimensionValue: Record 349;
        t_37: Record 37;
        lRecSalespersonPurchaser: Record 13;
        lTxtFormulaSconto: Text[100];
        lRecSalesHeader: Record 38;
        lRecSetupTersan: Record 50105;
        t_36: Record 36;
        Descrizione_Estesa: Text[250];
        qtaConf: Decimal;
        importoConf: Decimal;
    BEGIN
        //
        lRecSetupTersan.GET;

        t_37.INIT;

        IF ((par_TipoDoc = 'OC') OR (par_TipoDoc = 'PR') OR (par_TipoDoc = 'VB')) THEN
            t_37."Document Type" := t_37."Document Type"::Order;

        IF (par_TipoDoc = 'FT') THEN
            t_37."Document Type" := t_37."Document Type"::Invoice;

        IF (par_TipoDoc = 'RC') THEN BEGIN
            t_37."Document Type" := t_37."Document Type"::"Return Order";
        END;

        IF ((par_TipoDoc = 'OF')) THEN
            t_37."Document Type" := t_37."Document Type"::Quote;

        t_37."Document No." := Var_NrDocumento;


        IF NOT t_36.GET(t_37."Document Type", t_37."Document No.") THEN
            EXIT;

        intero := intero + 100;
        //intero := (intero * 1000);  ***
        t_37."Line No." := intero;

        t_37."Sell-to Customer No." := t_36."Sell-to Customer No.";
        t_37.VALIDATE("Sell-to Customer No.");

        //lRecRigheRDA.GET(Var_RDAFornitoririchiesti."Nr. Richiesta", Var_RDAFornitoririchiesti."Nr. Riga Richiesta");

        IF (TipoRiga = 'ITEM') THEN BEGIN
            t_37.Type := t_37.Type::Item;
            IF NOT (Var_Conferimenti_TMP.RifiutoInRecupero) THEN
                t_37."No." := '00200'//Var_Conferimenti_TMP."Articolo CER";
            ELSE
                t_37."No." := lRecSetupTersan."Nr. Articolo Servizio Stocc";
        END;
        IF (TipoRiga = 'VPP') THEN BEGIN
            t_37.Type := t_37.Type::Item;
            t_37."No." := '00204';//Var_Conferimenti_TMP."Articolo CER";
        END;

        IF (TipoRiga = 'VM') THEN BEGIN
            t_37.Type := t_37.Type::Item;
            t_37."No." := '70064';//Var_Conferimenti_TMP."Articolo CER";
        END;

        t_37.VALIDATE("No.");

        IF (t_37."VAT Prod. Posting Group" = '') THEN
            t_37.VALIDATE("VAT Prod. Posting Group", '022');

        qtaConf := 0;
        importoConf := 0;
        Descrizione_Estesa := '';

        IF (TipoRiga = 'ITEM') THEN BEGIN
            qtaConf := Var_Conferimenti_TMP."Qta Conferita";
            importoConf := Var_Conferimenti_TMP."Importo Riga";
            Descrizione_Estesa := 'Recupero Rifiuti CER' + Var_Conferimenti_TMP."Articolo CER" + ' tariffa applicata da ' + FORMAT(Var_Conferimenti_TMP."Ultima Verifica Merceologica");
            IF ((DATE2DMY(Var_Conferimenti_TMP."Ultima Verifica Merceologica", 2)) = (DATE2DMY(Var_Conferimenti_TMP."Data Inizio", 2))) THEN
                Descrizione_Estesa := Descrizione_Estesa + ' Applicazione differente tariffa a seguito Verifica Merceologica Secondo l''articolo 5.4 del contratto.';
        END;

        IF (TipoRiga = 'VPP') THEN BEGIN
            qtaConf := Var_Conferimenti_VPP."VPP-KG"; //Var_Conferimenti_VPP."Qta Conferita";
            importoConf := Var_Conferimenti_VPP."Tariffa VPP";
            Descrizione_Estesa := 'Addebito qt… non conferite CER' + Var_Conferimenti_VPP."Articolo CER" + ' Sett. Nr. ' + FORMAT(Var_Conferimenti_VPP.Settimana);
        END;

        IF (TipoRiga = 'VM') THEN BEGIN
            qtaConf := 1000;
            importoConf := Var_Conferimenti_TMP."Tariffa Verifica Merceologica";
            Descrizione_Estesa := 'Addebito Spese Verifica Merceologica su rifiuto in ingresso CER ' + Var_Conferimenti_VPP."Articolo CER" + ' effettuata in data ' +
                FORMAT(Var_Conferimenti_TMP."Ultima Verifica Merceologica");
        END;

        t_37.Description := COPYSTR(Descrizione_Estesa, 1, 50);

        IF (STRLEN(Descrizione_Estesa) > 50) THEN
            Ins_righe_testi(t_37, intero, Descrizione_Estesa);

        t_37.VALIDATE(Quantity, (qtaConf / 1000));
        IF (importoConf <> 0) THEN
            t_37.VALIDATE("Unit Price", importoConf);

        //IF NOT t_37.INSERT(TRUE) THEN
        //t_37.MODIFY(TRUE);

        IF (t_37.Quantity <> 0) THEN
            t_37.INSERT(TRUE);

    END;

    LOCAL PROCEDURE GetDataUltimaImpurità(VarData: Date; VarCliente: Code[20]; VarArticolo: Code[10]): Date;
    VAR
        lRecRegistroAnalisiMerceologiche: Record 50104;
        lRecSetupTersan: Record 50105;
    BEGIN
        lRecSetupTersan.GET;

        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Codice Produttore WinWaste", VarCliente);
        lRecRegistroAnalisiMerceologiche.SETFILTER("Data Analisi", '..%1', VarData);
        lRecRegistroAnalisiMerceologiche.SETRANGE("Articolo CER WinWaste", VarArticolo);
        IF lRecRegistroAnalisiMerceologiche.FINDLAST THEN
            EXIT(lRecRegistroAnalisiMerceologiche."Data Analisi");

        EXIT(20000101D);
    END;

    PROCEDURE Ins_righe_testi(Par_riga: Record 37; VAR intero: Integer; Var_Descrizione: Text[250]);
    VAR
        l_DimensionValue: Record 349;
        t_37: Record 37;
        lRecSalespersonPurchaser: Record 13;
        lTxtFormulaSconto: Text[100];
        lRecSalesHeader: Record 38;
        lRecSetupTersan: Record 50105;
        t_36: Record 36;
        lTxtDescrizione_Estesa: Text[250];
        qtaConf: Decimal;
        importoConf: Decimal;
    BEGIN
        lRecSetupTersan.GET;

        lTxtDescrizione_Estesa := COPYSTR(Var_Descrizione, 51, 250);

        REPEAT
            //
            t_37.INIT;
            t_37."Document Type" := Par_riga."Document Type";
            t_37."Document No." := Par_riga."Document No.";
            intero := intero + 100;
            t_37."Line No." := intero;
            t_37."Sell-to Customer No." := Par_riga."Sell-to Customer No.";
            t_37.VALIDATE("Sell-to Customer No.");
            t_37.Type := t_37.Type::" ";
            t_37."No." := ' ';
            t_37.VALIDATE("No.");
            t_37.Description := COPYSTR(lTxtDescrizione_Estesa, 1, 50);
            lTxtDescrizione_Estesa := COPYSTR(lTxtDescrizione_Estesa, 51, 250);
            t_37.INSERT(TRUE);
        UNTIL (lTxtDescrizione_Estesa <> '') OR (STRLEN(lTxtDescrizione_Estesa) = 0);
    END;

    LOCAL PROCEDURE GetDelibera(VarData: Date; VarCliente: Code[20]; VarArticolo: Code[10]): Code[20];
    VAR
        lRecRegistroAnalisiMerceologiche: Record 50109;
        lRecSetupTersan: Record 50105;
        lDateDatainizio: Date;
        lDateDataFine: Date;
    BEGIN
        lRecSetupTersan.GET;

        lDateDatainizio := DMY2DATE(1, (DATE2DMY(VarData, 2)), (DATE2DMY(VarData, 3)));
        lDateDataFine := CALCDATE('+CM', lDateDatainizio);


        lRecRegistroAnalisiMerceologiche.RESET;
        lRecRegistroAnalisiMerceologiche.SETRANGE("Codice Produttore WinWaste", VarCliente);
        lRecRegistroAnalisiMerceologiche.SETRANGE("Data Delibera", lDateDatainizio, lDateDataFine);
        lRecRegistroAnalisiMerceologiche.SETRANGE("Articolo CER WinWaste", VarArticolo);
        lRecRegistroAnalisiMerceologiche.SETRANGE("Stato Delibera", lRecRegistroAnalisiMerceologiche."Stato Delibera"::Attivo);
        IF lRecRegistroAnalisiMerceologiche.FINDSET THEN
            REPEAT
                IF (lRecRegistroAnalisiMerceologiche."Data Delibera" <= VarData) THEN
                    EXIT(lRecRegistroAnalisiMerceologiche.Protocollo);
            UNTIL lRecRegistroAnalisiMerceologiche.NEXT = 0;

        EXIT('');
    END;

    LOCAL PROCEDURE VerificaDelibera(VarDataInizio: Date; VarDataFine: Date; VarRecListaClientiProduttori: Record 50102);
    VAR
        lRecRegistroDelibereCliente: Record 50109;
        lRecConferimentiFLAG: Record 50100;
        lRecCampoRelazioneWinWaste: Record 50108;
        lRecRegistroDelibereTOT: Record 50110;
    BEGIN

        lRecRegistroDelibereCliente.RESET;

        lRecConferimentiFLAG.RESET;
        //lRecConferimentiFLAG.SETCURRENTKEY(PROD, "Data Movimento");
        lRecConferimentiFLAG.SETCURRENTKEY(CATS, "Data Movimento");
        lRecConferimentiFLAG.SETRANGE(RifiutoInRecupero, TRUE);
        //lRecConferimentiFLAG.SETRANGE(PROD, VarRecListaClientiProduttori."Codice Produttore WinWaste");
        lRecConferimentiFLAG.SetRange(CATS, VarRecListaClientiProduttori."Codice Produttore WinWaste");
        lRecConferimentiFLAG.SETRANGE("Data Movimento", VarDataInizio, VarDataFine);
        IF lRecConferimentiFLAG.FINDSET THEN BEGIN
            lRecRegistroDelibereCliente.INIT;
            lRecRegistroDelibereCliente."Cod. Cliente" := VarRecListaClientiProduttori."Cod. Cliente";
            lRecRegistroDelibereCliente."Spedire a Codice" := VarRecListaClientiProduttori."Spedire a Codice";
            lRecRegistroDelibereCliente."Codice Produttore WinWaste" := VarRecListaClientiProduttori."Codice Produttore WinWaste";
            lRecRegistroDelibereCliente."Data Delibera" := lRecConferimentiFLAG."Data Movimento";
            lRecCampoRelazioneWinWaste.RESET;
            lRecCampoRelazioneWinWaste.SETRANGE(lRecCampoRelazioneWinWaste."Campo C", lRecConferimentiFLAG.Codice);
            IF lRecCampoRelazioneWinWaste.FINDFIRST THEN BEGIN
                IF (lRecCampoRelazioneWinWaste."Data Movimento causale 24" < lRecRegistroDelibereCliente."Data Delibera") THEN
                    lRecRegistroDelibereCliente."Data Delibera" := lRecCampoRelazioneWinWaste."Data Movimento causale 24";
            END;
            lRecRegistroDelibereCliente."Articolo CER WinWaste" := VarRecListaClientiProduttori."Articolo CER";
            lRecRegistroDelibereCliente."Stato Delibera" := lRecRegistroDelibereCliente."Stato Delibera"::Attivo;
            lRecRegistroDelibereCliente."Data Inizio Validità" := lRecRegistroDelibereCliente."Data Delibera";
            lRecConferimentiFLAG.FINDLAST;
            lRecRegistroDelibereCliente."Data Fine Validità" := lRecConferimentiFLAG."Data Movimento";
            IF lRecRegistroDelibereCliente.INSERT(TRUE) THEN;

            lRecRegistroDelibereTOT.RESET;
            lRecRegistroDelibereTOT.SETRANGE("MM Inizio", lRecRegistroDelibereCliente."MM Inizio");
            lRecRegistroDelibereTOT.SETRANGE("AAAA Inizio", lRecRegistroDelibereCliente."AAAA Inizio");
            IF lRecRegistroDelibereTOT.FINDFIRST THEN BEGIN
                IF (lRecRegistroDelibereTOT."Data Delibera" < lRecRegistroDelibereCliente."Data Delibera") THEN BEGIN
                    //lRecRegistroDelibereCliente."Data Delibera" := lRecRegistroDelibereTOT."Data Delibera";
                    //lRecRegistroDelibereCliente.MODIFY;
                END
                ELSE BEGIN
                    lRecRegistroDelibereTOT."Data Delibera" := lRecRegistroDelibereCliente."Data Delibera";
                    lRecRegistroDelibereTOT."Data Inizio Validità" := lRecRegistroDelibereCliente."Data Inizio Validità";
                    lRecRegistroDelibereTOT.MODIFY;
                END;
            END
            ELSE BEGIN
                //
                lRecRegistroDelibereTOT.INIT;
                //lRecRegistroDelibereTOT.Nr := ;
                lRecRegistroDelibereTOT."Data Delibera" := lRecRegistroDelibereCliente."Data Delibera";
                //lRecRegistroDelibereTOT."Articolo CER WinWaste" := ;
                lRecRegistroDelibereTOT."Stato Delibera" := lRecRegistroDelibereTOT."Stato Delibera"::Attivo;
                lRecRegistroDelibereTOT."Data Inizio Validità" := lRecRegistroDelibereCliente."Data Inizio Validità";
                lRecRegistroDelibereTOT."Data Fine Validità" := lRecRegistroDelibereCliente."Data Fine Validità";
                lRecRegistroDelibereTOT.INSERT(TRUE);
            END;

        END;
    END;

    PROCEDURE ControlloDelibera(VarSettimana: Integer; VarData: Date): Decimal;
    VAR
        lRecRegistroDelibereTOT: Record 50110;
        sett_del: Integer;
        sett_mov: Integer;
    BEGIN
        // ControlloDelibera
        //"NrSettimana" := DATE2DWY("Data Movimento", 2);

        lRecRegistroDelibereTOT.RESET;
        lRecRegistroDelibereTOT.SETRANGE("MM Inizio", DATE2DMY(VarData, 2));
        lRecRegistroDelibereTOT.SETRANGE("AAAA Inizio", DATE2DMY(VarData, 3));
        IF lRecRegistroDelibereTOT.FINDSET THEN BEGIN
            sett_del := DATE2DWY(lRecRegistroDelibereTOT."Data Inizio Validità", 2);
            sett_mov := VarSettimana;
            IF (sett_mov >= sett_del) THEN
                EXIT(1);
        END;

        EXIT(0);
    END;

    PROCEDURE PrendiGiornoFatturazione(VarDataInizio: Date; VarDataFine: Date; VarNrSettimana: Integer) UltimaDataLavorativa: Date;
    VAR
        CalendarMgmt: Codeunit 7600;
        lRecDate: Record 2000000007;
        lRecDate1: Record 2000000007;
        lTextDescr: Text[50];
    BEGIN
        // PrendiGiornoFatturazione(lDateDataInizioMovimento, lDateDataFineMovimento, lRecMovConferimentoWINWASTE."NrSettimana");

        UltimaDataLavorativa := 0D;

        VarDataInizio := DMY2DATE(1, 1, (DATE2DMY(VarDataInizio, 3)));
        VarDataFine := DMY2DATE(31, 12, (DATE2DMY(VarDataInizio, 3)));

        lRecDate.RESET;
        lRecDate.SETRANGE(lRecDate."Period Start", VarDataInizio, VarDataFine);
        lRecDate.SETRANGE("Period Type", lRecDate."Period Type"::Week);
        lRecDate.SETRANGE("Period No.", VarNrSettimana);
        IF lRecDate.FINDSET THEN BEGIN
            lRecDate1.RESET;
            lRecDate1.SETRANGE("Period Start", lRecDate."Period Start", lRecDate."Period End");
            lRecDate1.SETRANGE("Period Type", lRecDate."Period Type"::Date);
            IF lRecDate1.FINDSET THEN
                REPEAT
                    //
                    IF NOT (CalendarMgmt.CheckDateStatus('TERSAN', lRecDate1."Period Start", lTextDescr)) THEN
                        UltimaDataLavorativa := lRecDate1."Period Start";

                UNTIL lRecDate1.NEXT = 0;
        END;

        EXIT(UltimaDataLavorativa);
    END;
}