      ******************************************************************
      *                                                                *
      *   PROGRAMME : EDITION DU RELEVE MENSUEL DE COMPTE              *
      *   ANNEE     : 1975                                             *
      *   LANGAGE   : COBOL                                            *
      *                                                                *
      *   Traitement batch typique des services comptabilite           *
      *   bancaire : lecture des mouvements du mois, calcul des        *
      *   totaux et impression du releve client sur listing.            *
      *                                                                *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    RELEVE75.
       AUTHOR.        LEDUTHEO-1975.
       DATE-WRITTEN.  07-06-1975.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FIC-MOUVEMENTS ASSIGN TO "MOUVEMENTS.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT RELEVE-SORTIE   ASSIGN TO "RELEVE-MENSUEL.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  FIC-MOUVEMENTS.
       01  MOUVEMENT-RECORD.
           05  M-NUMERO-COMPTE     PIC 9(8).
           05  FILLER              PIC X.
           05  M-TYPE-OPERATION    PIC X.
           05  FILLER              PIC X.
           05  M-MONTANT           PIC 9(7)V99.

       FD  RELEVE-SORTIE.
       01  LIGNE-RELEVE            PIC X(100).

       WORKING-STORAGE SECTION.

       01  WS-FIN                  PIC X VALUE "N".
       01  WS-COMPTE-COURANT       PIC 9(8) VALUE 12345678.
       01  WS-SOLDE-INITIAL        PIC S9(9)V99 VALUE 12500.50.
       01  WS-SOLDE-COURANT        PIC S9(9)V99.
       01  WS-TOTAL-CREDITS        PIC S9(9)V99 VALUE ZERO.
       01  WS-TOTAL-DEBITS         PIC S9(9)V99 VALUE ZERO.
       01  WS-NB-MOUVEMENTS        PIC 9(5)  VALUE ZERO.

       01  WS-LIGNES.
           05  WS-TITRE            PIC X(60)
               VALUE "   RELEVE MENSUEL DE COMPTE - JUIN 1975".
           05  WS-LIGNE-VIDE       PIC X(100) VALUE SPACES.
           05  WS-LIGNE-ENTETE.
               10  FILLER          PIC X(10) VALUE "COMPTE N :".
               10  WS-COMPTE-OUT   PIC 9(8).
               10  FILLER          PIC X(15) VALUE SPACES.
               10  FILLER          PIC X(18) VALUE "SOLDE INITIAL : ".
               10  WS-SOLDE-INI-OUT PIC ZZZ,ZZZ,ZZ9.99.
           05  WS-LIGNE-SEP        PIC X(80) VALUE ALL "-".
           05  WS-LIGNE-MVT.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  WS-TYPE-OUT     PIC X.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  WS-MONTANT-OUT  PIC Z,ZZZ,ZZ9.99.
           05  WS-LIGNE-TOTAL-CRED.
               10  FILLER          PIC X(10) VALUE "CREDITS : ".
               10  WS-CRED-OUT     PIC Z,ZZZ,ZZZ,ZZ9.99.
           05  WS-LIGNE-TOTAL-DEB.
               10  FILLER          PIC X(10) VALUE "DEBITS  : ".
               10  WS-DEB-OUT      PIC Z,ZZZ,ZZZ,ZZ9.99.
           05  WS-LIGNE-SOLDE-FINAL.
               10  FILLER          PIC X(10) VALUE "SOLDE   : ".
               10  WS-SOLDE-FIN-OUT PIC Z,ZZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.

       0000-MAIN.
           PERFORM 1000-INIT
           PERFORM 2000-TRAITER-MOUVEMENTS
           PERFORM 3000-IMPRIMER-TOTAUX
           PERFORM 9000-FINIR
           STOP RUN.

       1000-INIT.
           MOVE WS-SOLDE-INITIAL TO WS-SOLDE-COURANT
           OPEN INPUT  FIC-MOUVEMENTS
           OPEN OUTPUT RELEVE-SORTIE
           DISPLAY "=== EDITION RELEVE MENSUEL 1975 ==="
           WRITE LIGNE-RELEVE FROM WS-LIGNE-VIDE
           WRITE LIGNE-RELEVE FROM WS-TITRE
           WRITE LIGNE-RELEVE FROM WS-LIGNE-VIDE
           MOVE WS-COMPTE-COURANT TO WS-COMPTE-OUT
           MOVE WS-SOLDE-INITIAL TO WS-SOLDE-INI-OUT
           WRITE LIGNE-RELEVE FROM WS-LIGNE-ENTETE
           WRITE LIGNE-RELEVE FROM WS-LIGNE-SEP.

       2000-TRAITER-MOUVEMENTS.
           PERFORM UNTIL WS-FIN = "O"
               READ FIC-MOUVEMENTS
                   AT END
                       MOVE "O" TO WS-FIN
                   NOT AT END
                       PERFORM 2100-APPLIQUER-MOUVEMENT
               END-READ
           END-PERFORM.

       2100-APPLIQUER-MOUVEMENT.
           IF M-NUMERO-COMPTE NOT = WS-COMPTE-COURANT
               EXIT PARAGRAPH
           END-IF

           ADD 1 TO WS-NB-MOUVEMENTS
           MOVE M-TYPE-OPERATION TO WS-TYPE-OUT
           MOVE M-MONTANT TO WS-MONTANT-OUT
           WRITE LIGNE-RELEVE FROM WS-LIGNE-MVT

           IF M-TYPE-OPERATION = "D"
               ADD M-MONTANT TO WS-TOTAL-CREDITS
               ADD M-MONTANT TO WS-SOLDE-COURANT
           ELSE
               IF M-TYPE-OPERATION = "R"
                   ADD M-MONTANT TO WS-TOTAL-DEBITS
                   SUBTRACT M-MONTANT FROM WS-SOLDE-COURANT
               END-IF
           END-IF.

       3000-IMPRIMER-TOTAUX.
           WRITE LIGNE-RELEVE FROM WS-LIGNE-SEP
           MOVE WS-TOTAL-CREDITS TO WS-CRED-OUT
           WRITE LIGNE-RELEVE FROM WS-LIGNE-TOTAL-CRED
           MOVE WS-TOTAL-DEBITS TO WS-DEB-OUT
           WRITE LIGNE-RELEVE FROM WS-LIGNE-TOTAL-DEB
           MOVE WS-SOLDE-COURANT TO WS-SOLDE-FIN-OUT
           WRITE LIGNE-RELEVE FROM WS-LIGNE-SOLDE-FINAL.

       9000-FINIR.
           CLOSE FIC-MOUVEMENTS
           CLOSE RELEVE-SORTIE
           DISPLAY "RELEVE MENSUEL EDITE : RELEVE-MENSUEL.TXT".

      ******************************************************************
      *                    FIN DU PROGRAMME COBOL 1975                 *
      ******************************************************************
