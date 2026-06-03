10 REM ************************************************************
20 REM *  TABLEAU D'AMORTISSEMENT - PRET IMMOBILIER / CONSOMMATION*
30 REM *  Style annees 1970 - BASIC pour services des credits     *
40 REM *  Tres courant dans les banques et caisses d'epargne      *
50 REM *  sur minis (IBM 370, PDP-11, Honeywell) et premiers      *
60 REM *  vrais ordinateurs de gestion                          *
70 REM ************************************************************
80 REM
90 REM === VARIABLES (style 1975 : 1 ou 2 lettres) ===
100 REM P = CAPITAL (PRINCIPAL) DU PRET
110 REM R = TAUX D'INTERET ANNUEL EN %
120 REM D = DUREE EN ANNEES
130 REM N = NOMBRE DE MENSUALITES (D*12)
140 REM M = MENSUALITE
150 REM I = INTERETS DU MOIS
160 REM C = PARTIE CAPITAL DU MOIS
170 REM S = SOLDE RESTANT DU
180 REM T = TOTAL DES INTERETS
190 REM
200 PRINT
210 PRINT "========================================"
220 PRINT " TABLEAU D'AMORTISSEMENT - 1975"
230 PRINT "========================================"
240 PRINT
250 PRINT "Ce programme calcule le tableau complet"
260 PRINT "des echeances d'un pret a taux fixe."
270 PRINT "Utilise dans les etudes de credit et"
280 PRINT "les services contentieux."
290 PRINT
300 REM
310 INPUT "Montant du pret (F)   : "; P
320 INPUT "Taux d'interet annuel : "; R
330 INPUT "Duree en annees       : "; D
340 PRINT
350 IF P <= 0 OR R <= 0 OR D <= 0 THEN 310
360 REM
370 LET R = R / 100 / 12          REM TAUX MENSUEL
380 LET N = D * 12
390 LET M = P * R * (1 + R) ^ N / ((1 + R) ^ N - 1)
400 LET T = 0
410 LET S = P
420 REM
430 PRINT "MENSUALITE CALCULEE :"; M
440 PRINT "NOMBRE D'ECHEANCES  :"; N
450 PRINT
460 PRINT "Voulez-vous le tableau detaille (O/N) ?";
470 INPUT " "; A$
480 IF A$ <> "O" AND A$ <> "o" THEN 720
490 REM
500 PRINT
510 PRINT "=============================================================="
520 PRINT "  NO   ECHEANCE    INTERETS     CAPITAL     SOLDE RESTANT"
530 PRINT "=============================================================="
540 REM
550 FOR K = 1 TO N
560     LET I = S * R
570     LET C = M - I
580     LET S = S - C
590     IF S < 0.01 THEN LET S = 0
600     LET T = T + I
610     REM --- AFFICHAGE LIGNE (format listing 1975) ---
620     PRINT K;
630     PRINT TAB(6); M;
640     PRINT TAB(18); I;
650     PRINT TAB(30); C;
660     PRINT TAB(42); S
670 NEXT K
680 REM
690 PRINT "=============================================================="
700 PRINT "TOTAL DES INTERETS  :"; T
710 PRINT "TOTAL REMBOURSE     :"; M * N
720 PRINT "=============================================================="
730 PRINT
740 PRINT "Fin du tableau d'amortissement."
750 PRINT "Ce document etait imprime sur listing continu pour le client."
760 PRINT
770 GOTO 200
780 REM
790 REM (En 1975 on utilisait souvent GOTO pour les menus)
800 REM Les programmes etaient concus pour etre lances, imprimer
810 REM le listing et s'arreter. Ici on permet plusieurs calculs.
820 REM
830 END
