10 REM ************************************************************
20 REM *  COMPOUND INTEREST & MORTGAGE CALCULATOR               *
30 REM *  Style annees 1970 - BASIC pour applications bancaires *
40 REM *  Tres courant sur les minis et les premiers micros     *
50 REM ************************************************************
60 REM
70 PRINT
80 PRINT "CALCULATEUR D'INTERETS COMPOSES"
90 PRINT "ET DE REMBOURSEMENT DE PRET"
100 PRINT "========================================"
110 PRINT
120 PRINT "1 - Calcul d'interets composes"
130 PRINT "2 - Calcul de mensualites de pret"
140 PRINT "3 - Quitter"
150 PRINT
160 INPUT "Votre choix "; C
170 IF C = 1 THEN 200
180 IF C = 2 THEN 400
190 IF C = 3 THEN 700
200 GOTO 160
210 REM
220 REM === INTERETS COMPOSES ===
230 PRINT
240 PRINT "--- CALCUL D'INTERETS COMPOSES ---"
250 PRINT
260 INPUT "Capital initial     : "; P
270 INPUT "Taux d'interet (%)  : "; R
280 INPUT "Nombre d'annees     : "; Y
290 INPUT "Capitalisations/an  : "; N
300 REM
310 LET R = R / 100
320 LET A = P * (1 + R / N) ^ (N * Y)
330 LET I = A - P
340 PRINT
350 PRINT "Capital final       :"; A
360 PRINT "Interets gagnes     :"; I
370 PRINT
380 GOTO 100
390 REM
400 REM === MENSUALITES DE PRET ===
410 PRINT
420 PRINT "--- CALCUL DE MENSUALITES ---"
430 PRINT
440 INPUT "Montant du pret     : "; P
450 INPUT "Taux d'interet (%)  : "; R
460 INPUT "Duree en annees     : "; Y
470 REM
480 LET R = R / 100 / 12
490 LET N = Y * 12
500 LET M = P * R * (1 + R) ^ N / ((1 + R) ^ N - 1)
510 LET T = M * N
520 LET I = T - P
530 PRINT
540 PRINT "Mensualite          :"; M
550 PRINT "Total paye          :"; T
560 PRINT "Total des interets  :"; I
570 PRINT
580 GOTO 100
590 REM
700 PRINT
710 PRINT "Merci d'avoir utilise ce programme."
720 PRINT "A bientot dans les annees 1970 !"
730 END
