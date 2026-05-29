10 REM ************************************************************
20 REM *  LUNAR LANDER SIMULATION - VERSION 1975                  *
30 REM *                                                          *
40 REM *  Ce programme est ecrit dans le style des BASIC          *
50 REM *  utilises sur les minis et premiers micro-ordinateurs    *
60 REM *  entre 1972 et 1978 (PDP-11, Altair 8800, Apple II, etc) *
70 REM *                                                          *
80 REM *  Style : Microsoft BASIC / Dartmouth BASIC               *
90 REM *  Auteur spirituel : nombreuses versions anonymes         *
100 REM *  diffusees dans les magazines et les universites.       *
110 REM ************************************************************
120 REM
130 REM === VARIABLES ===
140 REM A = ALTITUDE EN PIEDS
150 REM V = VITESSE (NEGATIF = DESCENTE)
160 REM F = CARBURANT RESTANT
170 REM M = MASSE DU MODULE
180 REM T = TEMPS ECOULE EN SECONDES
190 REM G = ACCELERATION GRAVITATIONNELLE LUNAIRE
200 REM
210 PRINT
220 PRINT "LUNAR LANDER - SIMULATION 1975"
230 PRINT "================================="
240 PRINT
250 PRINT "Vous pilotez le module d'atterrissage lunaire."
260 PRINT "Objectif : poser le module avec une vitesse"
270 PRINT "inferieure a 5 pieds par seconde."
280 PRINT
290 PRINT "INSTRUCTIONS :"
300 PRINT "  A chaque seconde, entrez la quantite de"
310 PRINT "  carburant a bruler (entre 0 et 100)."
320 PRINT "  0 = chute libre, 100 = poussée maximale."
330 PRINT
340 REM INITIALISATION
350 LET A = 5000
360 LET V = -50
370 LET F = 1000
380 LET M = 32500
390 LET T = 0
400 LET G = 5
410 REM
420 PRINT "ALT.   VITESSE   FUEL   TEMPS"
430 PRINT "-----------------------------"
440 REM
450 REM === BOUCLE DE VOL ===
460 IF A <= 0 THEN 620
470 PRINT A; TAB(7); V; TAB(16); F; TAB(23); T
480 PRINT
490 INPUT "CARBURANT (0-100) "; B
500 IF B < 0 THEN LET B = 0
510 IF B > 100 THEN LET B = 100
520 IF B > F THEN LET B = F
530 REM
540 REM PHYSIQUE (SIMPLIFIEE MAIS CREDIBLE POUR L'EPOQUE)
550 LET F = F - B
560 LET M = M - B
570 LET V = V + G - (B * 0.75)
580 LET A = A + V
590 LET T = T + 1
600 GOTO 460
610 REM
620 REM === ATTERRISSAGE ===
630 PRINT
640 PRINT "================================"
650 PRINT "CONTACT AU SOL !"
660 PRINT "================================"
670 PRINT
680 PRINT "Altitude finale :"; A
690 PRINT "Vitesse finale  :"; V; " pieds/seconde"
700 PRINT "Carburant reste :"; F
710 PRINT "Temps ecoule    :"; T; " secondes"
720 PRINT
730 REM EVALUATION
740 IF ABS(V) <= 5 THEN 780
750 IF ABS(V) <= 15 THEN 810
760 IF ABS(V) <= 30 THEN 840
770 GOTO 870
780 REM PARFAIT
790 PRINT "*** EXCELLENT ATTERRISSAGE ! ***"
800 PRINT "La NASA vous decerne une medaille."
810 GOTO 900
820 REM MOYEN
830 PRINT "*** ATTERRISSAGE CORRECT ***"
840 PRINT "Le module a survecu. L'equipage est"
850 PRINT "un peu secoue, mais vivant."
860 GOTO 900
870 REM CATASTROPHE
880 PRINT "*** CATASTROPHE ! ***"
890 PRINT "Le module s'est ecrase. RIP."
900 PRINT
910 PRINT "Fin de la simulation."
920 PRINT
930 END
