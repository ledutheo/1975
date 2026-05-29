10 REM ************************************************************
20 REM *                                                          *
30 REM *                    HAMMURABI                             *
40 REM *                                                          *
50 REM *   Le jeu mythique des annees 1968-1975                   *
60 REM *   Originalement ecrit en FOCAL par Doug Dyment (1968)    *
70 REM *   Puis largement diffuse en BASIC dans les universites  *
80 REM *   et les premiers clubs d'informatique (1970-1976)       *
90 REM *                                                          *
100 REM *   Tu es Hammurabi, souverain de Sumer.                   *
110 REM *   Tu dois faire survivre ton peuple pendant 10 ans.      *
120 REM *                                                          *
130 REM ************************************************************
140 REM
150 REM VARIABLES CLASSIQUES DE LA VERSION 1970s :
160 REM   P = POPULATION
170 REM   L = ACRES DE TERRE
180 REM   G = STOCK DE GRAIN
190 REM   Y = ANNEE EN COURS
200 REM   H = HECTARES SEMES
210 REM   C = GRAIN MANGE PAR TETE
220 REM   I = IMMIGRATION
230 REM   D = MORTS DE FAIM
240 REM   R = RATS (DESTRUCTION)
250 REM
260 PRINT
270 PRINT "****************************************"
280 PRINT "*         HAMMURABI - 1975             *"
290 PRINT "****************************************"
300 PRINT
310 PRINT "Tu es le grand Hammurabi, roi de Sumer."
320 PRINT "Ton peuple est entre tes mains."
330 PRINT "Tu dois gouverner pendant 10 ans."
340 PRINT
350 PRINT "Chaque annee tu decideras :"
360 PRINT "  - Combien de grain donner au peuple"
370 PRINT "  - Combien de terre semer"
380 PRINT "  - Combien de terre acheter ou vendre"
390 PRINT
400 REM INITIALISATION (VALEURS CLASSIQUES)
410 LET P = 100       : REM POPULATION
420 LET L = 1000      : REM ACRES
430 LET G = 2800      : REM GRAIN EN STOCK
440 LET Y = 1         : REM ANNEE
450 LET D1 = 0        : REM TOTAL MORTS
460 REM
470 REM ============================================
480 REM BOUCLE PRINCIPALE (10 ANNEES)
490 REM ============================================
500 PRINT
510 PRINT "========================================"
520 PRINT "ANNEE "; Y; " DE TON REGNE"
530 PRINT "========================================"
540 PRINT
550 PRINT "Population actuelle :"; P
560 PRINT "Terres possedees    :"; L; " acres"
570 PRINT "Grain en reserve    :"; G; " boisseaux"
580 PRINT
590 REM
600 REM --- VENTE / ACHAT DE TERRES ---
610 PRINT "Combien d'acres veux-tu acheter (0 = rien) ? ";
620 INPUT A
630 IF A < 0 THEN LET A = 0
640 LET G = G - A * 20   : REM Prix approx 20 boisseaux par acre
650 LET L = L + A
660 REM
670 PRINT "Combien d'acres veux-tu vendre ? ";
680 INPUT S
690 IF S > L THEN LET S = L
700 LET G = G + S * 18
710 LET L = L - S
720 REM
730 REM --- NOURRIR LE PEUPLE ---
740 PRINT
750 PRINT "Combien de boisseaux de grain pour nourrir"
760 PRINT "le peuple cette annee ? ";
770 INPUT C
780 IF C > G THEN LET C = G
790 LET G = G - C
800 REM
810 LET D = 0
820 IF C / P < 20 THEN LET D = INT(P - (C / 20))
830 IF D < 0 THEN LET D = 0
840 LET P = P - D
850 LET D1 = D1 + D
860 REM
870 REM --- SEMER ---
880 PRINT
890 PRINT "Combien d'acres veux-tu semer ? ";
900 INPUT H
910 IF H > L THEN LET H = L
920 IF H * 0.5 > G THEN LET H = INT(G / 0.5)
930 LET G = G - INT(H * 0.5)
940 REM
950 REM --- EVENEMENTS ALEATOIRES (1970s STYLE) ---
960 LET R = RND * 5 + 1
970 REM
980 REM Recolte
990 LET YIELD = INT(RND * 5) + 3
1000 LET G = G + H * YIELD
1010 PRINT
1020 PRINT "Cette annee, chaque acre a produit"; YIELD; " boisseaux."
1030 REM
1040 REM Rats
1050 IF R < 3 THEN 1080
1060 LET RATS = INT(G / 5)
1070 LET G = G - RATS
1080 PRINT "Les rats ont mange"; RATS; " boisseaux de grain."
1090 REM
1100 REM Immigration
1110 LET I = INT(RND * 20) + 5
1120 LET P = P + I
1130 PRINT I; " personnes ont immigre cette annee."
1140 REM
1150 REM Peste (rare mais dramatique)
1160 IF RND > 0.85 THEN 1190
1170 PRINT "*** UNE PESTE A FRAPPE ! ***"
1180 LET P = INT(P * 0.6)
1190 REM
1200 REM --- FIN D'ANNEE ---
1210 PRINT
1220 IF D > 0 THEN PRINT D; " personnes sont mortes de faim cette annee."
1230 PRINT "Population en fin d'annee :"; P
1240 PRINT "Grain en reserve :"; G
1250 PRINT
1260 REM
1270 LET Y = Y + 1
1280 IF Y > 10 THEN 1310
1290 GOTO 500
1300 REM
1310 REM ============================================
1320 REM FIN DU REGNE (10 ANS)
1330 REM ============================================
1340 PRINT
1350 PRINT "***************************************"
1360 PRINT "*         FIN DE TON REGNE            *"
1370 PRINT "***************************************"
1380 PRINT
1390 PRINT "Tu as gouverne pendant 10 ans."
1400 PRINT "Population finale :"; P
1410 PRINT "Terres            :"; L; " acres"
1420 PRINT "Grain final       :"; G
1430 PRINT "Morts de faim     :"; D1
1440 PRINT
1450 REM EVALUATION (CLASSIQUE)
1460 IF D1 > 100 THEN 1500
1470 IF P < 80 THEN 1530
1480 PRINT "Excellent ! Ton peuple t'aimait et"
1490 PRINT "tu as bien gouverne. Hammurabi serait fier."
1500 GOTO 1570
1510 REM
1520 PRINT "Beaucoup de gens sont morts de faim..."
1530 PRINT "Ton peuple n'oubliera pas ton regne."
1540 GOTO 1570
1550 REM
1560 PRINT "Ton regne a ete desastreux."
1570 PRINT
1580 PRINT "Fin du jeu HAMMURABI."
1590 END
