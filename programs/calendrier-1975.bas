10 REM ************************************************************
20 REM *  CALENDRIER PERPETUEL - 1975                             *
30 REM *  Style annees 1970 - Utilitaire de bureau et de gestion  *
40 REM *  Programme extremement courant dans les administrations, *
50 REM *  banques, et chez les particuliers equipes d'un micro    *
60 REM *  ou d'un terminal.                                       *
70 REM ************************************************************
80 REM
90 REM === VARIABLES ===
100 REM A = ANNEE
110 REM M = MOIS (1-12)
120 REM J = JOUR
130 REM H = INDICE DU JOUR DE LA SEMAINE (ZELLER)
140 REM L = NOMBRE DE JOURS DANS LE MOIS
150 REM F = PREMIER JOUR DU MOIS 
160 REM
170 DIM N(12)
180 REM
190 REM --- INITIALISATION NOMBRE DE JOURS ---
200 FOR I = 1 TO 12
210     READ N(I)
220 NEXT I
230 DATA 31,28,31,30,31,30,31,31,30,31,30,31
240 REM
250 PRINT
260 PRINT "========================================"
270 PRINT "    CALENDRIER PERPETUEL - 1975"
280 PRINT "========================================"
290 PRINT
300 PRINT "Ce programme calcule le jour de la semaine"
310 PRINT "et imprime un calendrier pour n'importe"
320 PRINT "quel mois entre 1800 et 2100 environ."
330 PRINT "Tres utilise pour la planification et les"
340 PRINT "echeances administratives."
350 PRINT
360 REM
370 PRINT "1 - Jour de la semaine pour une date"
380 PRINT "2 - Imprimer le calendrier d'un mois"
390 PRINT "3 - Quitter"
400 PRINT
410 INPUT "Votre choix "; C
420 IF C = 1 THEN 500
430 IF C = 2 THEN 700
440 IF C = 3 THEN 1200
450 GOTO 370
460 REM
470 REM === JOUR DE LA SEMAINE (ZELLER) ===
500 PRINT
510 INPUT "Annee  (ex 1975) : "; A
520 INPUT "Mois   (1-12)    : "; M
530 INPUT "Jour   (1-31)    : "; J
540 GOSUB 1300
550 PRINT
560 PRINT "Le "; J; "/"; M; "/"; A; " etait un ";
570 GOSUB 1400
580 PRINT
590 GOTO 360
600 REM
610 REM === IMPRESSION CALENDRIER MOIS ===
700 PRINT
710 INPUT "Annee  (ex 1975) : "; A
720 INPUT "Mois   (1-12)    : "; M
730 IF M < 1 OR M > 12 THEN 710
740 PRINT
750 REM --- TITRE ---
760 GOSUB 1500
770 PRINT "          "; M$; " "; A
780 PRINT "     DIM  LUN  MAR  MER  JEU  VEN  SAM"
790 PRINT "     ----------------------------------"
800 REM
810 REM --- CALCUL PREMIER JOUR (ZELLER) ---
820 J = 1
830 GOSUB 1300
840 LET F = H
850 REM Ajustement : h=1 (DIM) => offset 0
860 LET FIRST = (F - 1 + 7) MOD 7
870 REM
880 LET L = N(M)
890 IF M = 2 AND ((A MOD 4 = 0 AND A MOD 100 <> 0) OR A MOD 400 = 0) THEN LET L = 29
900 REM
910 REM --- ESPACES DEBUT DE MOIS ---
920 LET COL = 0
930 FOR I = 1 TO FIRST
940     PRINT "     ";
950     LET COL = COL + 1
960 NEXT I
970 REM
980 FOR JJ = 1 TO L
990     PRINT "  "; JJ;
1000     IF JJ < 10 THEN PRINT " ";
1010     LET COL = COL + 1
1020     IF COL = 7 THEN PRINT : LET COL = 0
1030 NEXT JJ
1040 IF COL <> 0 THEN PRINT
1050 PRINT "     ----------------------------------"
1060 PRINT
1070 GOTO 360
1080 REM
1090 REM === SOUS-ROUTINES ===
1100 REM
1110 REM 1300 : ZELLER (ne modifie pas A,M originaux)
1120 1300 LET AA = A : LET MM = M : LET JJJ = J
1130 IF MM < 3 THEN LET MM = MM + 12 : LET AA = AA - 1
1140 LET K = AA - INT(AA / 100) * 100
1150 LET JJ = INT(AA / 100)
1160 LET H = (JJJ + INT(13 * (MM + 1) / 5) + K + INT(K / 4) + INT(JJ / 4) - 2 * JJ) MOD 7
1170 RETURN
1180 REM
1190 REM 1400 : NOM DU JOUR
1200 1400 IF H = 0 THEN PRINT "SAMEDI";
1210 IF H = 1 THEN PRINT "DIMANCHE";
1220 IF H = 2 THEN PRINT "LUNDI";
1230 IF H = 3 THEN PRINT "MARDI";
1240 IF H = 4 THEN PRINT "MERCREDI";
1250 IF H = 5 THEN PRINT "JEUDI";
1260 IF H = 6 THEN PRINT "VENDREDI";
1270 RETURN
1280 REM
1290 REM 1500 : NOM DU MOIS
1300 1500 IF M = 1 THEN LET M$ = "JANVIER"
1310 IF M = 2 THEN LET M$ = "FEVRIER"
1320 IF M = 3 THEN LET M$ = "MARS"
1330 IF M = 4 THEN LET M$ = "AVRIL"
1340 IF M = 5 THEN LET M$ = "MAI"
1350 IF M = 6 THEN LET M$ = "JUIN"
1360 IF M = 7 THEN LET M$ = "JUILLET"
1370 IF M = 8 THEN LET M$ = "AOUT"
1380 IF M = 9 THEN LET M$ = "SEPTEMBRE"
1390 IF M = 10 THEN LET M$ = "OCTOBRE"
1400 IF M = 11 THEN LET M$ = "NOVEMBRE"
1410 IF M = 12 THEN LET M$ = "DECEMBRE"
1420 RETURN
1430 REM
1440 1200 PRINT
1450 PRINT "Merci d'avoir utilise le calendrier 1975."
1460 PRINT "A bientot pour vos echeances !"
1470 END
