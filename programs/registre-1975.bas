10 REM ************************************************************
20 REM *  REGISTRE DE COMPTE / CHEQUIER - 1975                    *
30 REM *  Style annees 1970 - Outil quotidien des particuliers    *
40 REM *  et des petites entreprises. Equivalent numerique du     *
50 REM *  "carnet de cheques" ou du "registre de banque" papier.  *
60 REM ************************************************************
70 REM
80 REM === VARIABLES ===
90 REM N = NOMBRE D'OPERATIONS EN MEMOIRE (MAX 50)
100 REM D$(I) = DATE (JJ/MM/AA)
110 REM L$(I) = LIBELLE (25 CAR.)
120 REM M(I)  = MONTANT (POS = CREDIT, NEG = DEBIT)
130 REM S = SOLDE COURANT
140 REM
150 DIM D$(50), L$(50), M(50)
160 LET N = 0
170 LET S = 0
180 REM
190 PRINT
200 PRINT "========================================"
210 PRINT "   REGISTRE DE COMPTE PERSONNEL 1975"
220 PRINT "========================================"
230 PRINT
240 PRINT "Permet de tenir son compte a jour comme"
250 PRINT "sur un vrai registre papier de l'epoque."
260 PRINT
270 REM
280 PRINT "1 - Entrer un mouvement"
290 PRINT "2 - Afficher le registre"
300 PRINT "3 - Afficher le solde"
310 PRINT "4 - Releve du mois (somme debits/credits)"
320 PRINT "5 - Effacer tout (nouveau registre)"
330 PRINT "6 - Quitter"
340 PRINT
350 INPUT "Choix "; C
360 IF C = 1 THEN 400
370 IF C = 2 THEN 500
380 IF C = 3 THEN 600
390 IF C = 4 THEN 700
400 IF C = 5 THEN 800
410 IF C = 6 THEN 900
420 GOTO 280
430 REM
440 REM === SAISIE MOUVEMENT ===
450 400 PRINT
460 INPUT "Date (JJ/MM/AA) : "; DT$
470 INPUT "Libelle (max 25c): "; LB$
480 INPUT "Montant (+ credit / - debit) : "; MT
490 IF N >= 50 THEN PRINT "Registre plein !": GOTO 280
500 LET N = N + 1
510 LET D$(N) = DT$
520 LET L$(N) = LB$
530 LET M(N) = MT
540 LET S = S + MT
550 PRINT "Mouvement enregistre. Nouveau solde :"; S
560 PRINT
570 GOTO 280
580 REM
590 REM === LISTE COMPLETE ===
600 500 PRINT
610 PRINT "NO  DATE       LIBELLE                  MONTANT     "
620 PRINT "----------------------------------------------------"
630 LET SS = 0
640 FOR I = 1 TO N
650     PRINT I;
660     PRINT TAB(4); D$(I);
670     PRINT TAB(15); L$(I);
680     PRINT TAB(40); M(I)
690     LET SS = SS + M(I)
700 NEXT I
710 PRINT "----------------------------------------------------"
720 PRINT "SOLDE VERIFIE :"; SS
730 PRINT
740 GOTO 280
750 REM
760 REM === SOLDE ===
770 600 PRINT
780 PRINT "SOLDE ACTUEL DU COMPTE : "; S; " F"
790 PRINT "(D'apres les "; N; " operations en memoire)"
800 PRINT
810 GOTO 280
820 REM
830 REM === RELEVE MENSUEL ===
840 700 PRINT
850 INPUT "Mois (ex: 06/75) : "; MS$
860 LET TD = 0 : LET TC = 0 : LET NB = 0
870 FOR I = 1 TO N
880     IF LEN(D$(I)) < 5 THEN 910
890     IF MID$(D$(I),4,5) <> MS$ THEN 910
900     LET NB = NB + 1
910     IF M(I) < 0 THEN LET TD = TD + M(I)
920     IF M(I) > 0 THEN LET TC = TC + M(I)
930 NEXT I
940 PRINT
950 PRINT "RELEVE DU MOIS "; MS$
960 PRINT "Operations :"; NB
970 PRINT "Total credits (entrees) :"; TC
980 PRINT "Total debits  (sorties) :"; TD
990 PRINT "Mouvement net du mois   :"; TC + TD
1000 PRINT
1010 GOTO 280
1020 REM
1030 REM === NOUVEAU REGISTRE ===
1040 800 PRINT "Effacer toutes les operations ? (O/N)";
1050 INPUT " "; CF$
1060 IF CF$ <> "O" AND CF$ <> "o" THEN 280
1070 LET N = 0
1080 LET S = 0
1090 PRINT "Nouveau registre pret."
1100 GOTO 280
1110 REM
1120 900 PRINT
1130 PRINT "Merci d'avoir tenu votre registre avec soin."
1140 PRINT "En 1975, c'etait le travail de tous les jours."
1150 PRINT "A bientot !"
1160 END
