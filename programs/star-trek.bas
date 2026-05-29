10 REM ************************************************************
20 REM *                                                          *
30 REM *          SUPER STAR TREK - 1975 VERSION                  *
40 REM *                                                          *
30 REM *   Classic text game widely distributed in BASIC          *
50 REM *   on university systems and early personal computers     *
60 REM *   between 1973 and 1978.                                 *
70 REM *                                                          *
80 REM *   Compatible with Commodore 64 BASIC, Apple II BASIC,    *
90 REM *   TRS-80 Level II BASIC, and most Microsoft BASICs.      *
100 REM *                                                          *
110 REM ************************************************************
120 REM
130 REM This is a playable implementation in the spirit of the
140 REM original games by Mike Mayfield (1971) and later ports.
150 REM
160 REM HOW TO PLAY:
170 REM - You command the USS Enterprise.
180 REM - Destroy all Klingon battle cruisers.
190 REM - Use limited energy and torpedoes wisely.
200 REM - Dock at starbases for repairs and resupply.
210 REM
220 REM COMMANDS:
230 REM   1 = SHORT RANGE SCAN
240 REM   2 = LONG RANGE SCAN
250 REM   3 = FIRE PHASERS
260 REM   4 = FIRE PHOTON TORPEDOES
270 REM   5 = WARP TO ANOTHER QUADRANT
280 REM   6 = DOCK AT STARBASE (if adjacent)
290 REM   7 = STATUS REPORT
300 REM   8 = QUIT
310 REM
320 REM ************************************************************
330 REM
340 REM --- INITIALIZATION ---
350 REM
360 LET E = 3000      : REM ENERGY
370 LET T = 0         : REM TORPEDOES
380 LET S = 0         : REM SHIELDS
390 LET D = 0         : REM DAMAGE
400 LET QX = 4        : REM QUADRANT X
410 LET QY = 4        : REM QUADRANT Y
420 LET K = 15        : REM KLINGONS LEFT (GOAL: 0)
430 LET B = 3         : REM STARBASES
440 LET ST = 30       : REM STARDATES LEFT
450 LET KX = 0        : REM KLINGON X IN QUADRANT
460 LET KY = 0
470 LET BX = 0        : REM STARBASE X IN QUADRANT
480 LET BY = 0
490 LET RND = 0       : REM USED FOR RANDOM
500 REM
510 PRINT
520 PRINT "***************************************"
530 PRINT "*      SUPER STAR TREK - 1975         *"
540 PRINT "***************************************"
550 PRINT
560 PRINT "YOU ARE IN COMMAND OF THE USS ENTERPRISE."
570 PRINT "YOUR MISSION: DESTROY ";K;" KLINGON SHIPS."
580 PRINT
590 REM
600 REM --- MAIN COMMAND LOOP ---
610 REM
620 PRINT
630 PRINT "COMMAND (1-8) ? ";
640 INPUT C
650 IF C = 1 THEN GOSUB 1000
660 IF C = 2 THEN GOSUB 2000
670 IF C = 3 THEN GOSUB 3000
680 IF C = 4 THEN GOSUB 4000
690 IF C = 5 THEN GOSUB 5000
700 IF C = 6 THEN GOSUB 6000
710 IF C = 7 THEN GOSUB 7000
720 IF C = 8 THEN 9000
730 REM
740 REM KLINGON ATTACK (IF ANY IN QUADRANT)
750 IF KX > 0 OR KY > 0 THEN GOSUB 8000
760 REM
770 REM CHECK WIN/LOSE CONDITIONS
780 IF K <= 0 THEN 8500
790 IF E <= 0 THEN 8700
800 IF ST <= 0 THEN 8800
810 GOTO 620
820 REM
830 REM ============================================
840 REM SHORT RANGE SCAN
850 REM ============================================
1000 PRINT
1010 PRINT "SHORT RANGE SCAN - QUADRANT ";QX;",";QY
1020 PRINT "-----------------------------"
1030 PRINT "ENTERPRISE POSITION: SECTOR 4,4"
1040 IF KX > 0 THEN PRINT "KLINGON DETECTED IN THIS QUADRANT!"
1050 IF BX > 0 THEN PRINT "STARBASE DETECTED IN THIS QUADRANT."
1060 PRINT "ENERGY:";E;"  TORPEDOES:";T;"  SHIELDS:";S
1070 PRINT
1080 RETURN
1090 REM
1100 REM ============================================
1110 REM LONG RANGE SCAN
1120 REM ============================================
2000 PRINT
2010 PRINT "LONG RANGE SCAN:"
2020 PRINT "KLINGONS IN SURROUNDING QUADRANTS:"
2030 PRINT " (SIMPLIFIED FOR 1975 BASIC)"
2040 PRINT "QUADRANTS AROUND YOU MAY CONTAIN ENEMIES."
2050 PRINT
2060 RETURN
2070 REM
2080 REM ============================================
2090 REM FIRE PHASERS
2100 REM ============================================
3000 PRINT
3010 PRINT "PHASERS ARMED."
3020 INPUT "ENERGY TO FIRE (MAX 500) ? "; P
3030 IF P > 500 THEN LET P = 500
3040 IF P > E THEN LET P = E
3050 LET E = E - P
3060 PRINT "FIRING PHASERS..."
3070 IF KX > 0 OR KY > 0 THEN 3090
3080 PRINT "NO TARGET IN RANGE." : RETURN
3090 LET DMG = P / 4
3100 PRINT "KLINGON HIT FOR"; DMG;" DAMAGE!"
3110 LET K = K - 1
3120 LET KX = 0 : LET KY = 0
3130 PRINT "KLINGON DESTROYED!"
3140 PRINT "KLINGONS REMAINING:";K
3150 RETURN
3160 REM
3170 REM ============================================
3180 REM FIRE TORPEDOES
3190 REM ============================================
4000 PRINT
4010 IF T <= 0 THEN PRINT "NO TORPEDOES LEFT!" : RETURN
4020 INPUT "FIRE TORPEDO (Y/N) ? "; A$
4030 IF A$ <> "Y" AND A$ <> "y" THEN RETURN
4040 LET T = T - 1
4050 LET E = E - 50
4060 PRINT "TORPEDO AWAY..."
4070 IF KX > 0 OR KY > 0 THEN 4100
4080 PRINT "MISSED!"
4090 RETURN
4100 PRINT "DIRECT HIT ON KLINGON!"
4110 LET K = K - 1
4120 LET KX = 0 : LET KY = 0
4130 PRINT "KLINGON DESTROYED! REMAINING:";K
4140 RETURN
4150 REM
4160 REM ============================================
4170 REM WARP
4180 REM ============================================
5000 PRINT
5010 PRINT "WARP DRIVE ENGAGED."
5020 INPUT "NEW QUADRANT X (1-8) ? "; QX
5030 INPUT "NEW QUADRANT Y (1-8) ? "; QY
5040 IF QX < 1 THEN LET QX = 1
5050 IF QX > 8 THEN LET QX = 8
5060 IF QY < 1 THEN LET QY = 1
5070 IF QY > 8 THEN LET QY = 8
5080 LET E = E - 100
5090 LET ST = ST - 1
5100 PRINT "ARRIVED IN QUADRANT ";QX;",";QY
5110 REM RANDOM ENCOUNTER
5120 LET R = RND
5130 IF R < 0.4 THEN 5160
5140 PRINT "THIS QUADRANT IS CLEAR."
5150 LET KX = 0 : LET KY = 0
5160 RETURN
5170 REM
5180 REM ============================================
5190 REM DOCK AT STARBASE
5200 REM ============================================
6000 PRINT
6010 IF BX = 0 THEN PRINT "NO STARBASE IN THIS QUADRANT!" : RETURN
6020 PRINT "DOCKING AT STARBASE..."
6030 LET E = 3000
6040 LET T = 10
6050 LET S = 1000
6060 PRINT "SHIELDS RECHARGED. ENERGY RESTORED."
6070 PRINT "TORPEDOES RESUPPLIED."
6080 RETURN
6090 REM
6100 REM ============================================
6110 REM STATUS REPORT
6120 REM ============================================
7000 PRINT
7010 PRINT "=== STATUS REPORT ==="
7020 PRINT "KLINGONS REMAINING :";K
7030 PRINT "STARBASES LEFT     :";B
7040 PRINT "STARDATES LEFT     :";ST
7050 PRINT "ENERGY             :";E
7060 PRINT "TORPEDOES          :";T
7070 PRINT "SHIELDS            :";S
7080 PRINT "====================="
7090 RETURN
7100 REM
7110 REM ============================================
7120 REM KLINGON ATTACK
7130 REM ============================================
8000 PRINT
8010 PRINT "*** KLINGON ATTACK! ***"
8020 LET DMG = 150 + RND * 100
8030 LET E = E - DMG
8040 PRINT "THE ENTERPRISE TAKES"; DMG;" DAMAGE!"
8050 IF E <= 0 THEN 8700
8060 PRINT "ENERGY NOW:";E
8070 RETURN
8080 REM
8090 REM ============================================
8100 REM WIN CONDITION
8110 REM ============================================
8500 PRINT
8510 PRINT "****************************************"
8520 PRINT "*   CONGRATULATIONS, CAPTAIN!          *"
8530 PRINT "*   ALL KLINGONS HAVE BEEN DESTROYED.  *"
8540 PRINT "****************************************"
8550 PRINT
8560 PRINT "YOU HAVE SAVED THE FEDERATION."
8570 GOTO 9000
8580 REM
8590 REM ============================================
8600 REM LOSE CONDITIONS
8610 REM ============================================
8700 PRINT
8710 PRINT "THE ENTERPRISE HAS BEEN DESTROYED."
8720 PRINT "MISSION FAILED."
8730 GOTO 9000
8740 REM
8800 PRINT
8810 PRINT "YOU RAN OUT OF TIME."
8820 PRINT "THE KLINGONS HAVE WON."
8830 GOTO 9000
8840 REM
8850 REM ============================================
8860 REM END OF GAME
8870 REM ============================================
9000 PRINT
9010 PRINT "THANK YOU FOR PLAYING SUPER STAR TREK."
9020 PRINT "GAME OVER."
9030 END
