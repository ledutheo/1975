      ******************************************************************
      *                                                                *
      *   PROGRAMME : TRAITEMENT DES OPERATIONS BANCAIRES              *
      *   ANNEE     : 1975                                             *
      *   LANGAGE   : COBOL (style des annees 1970)                    *
      *                                                                *
      *   Hommage aux informaticiennes et informaticiens qui           *
      *   travaillaient sur les systemes bancaires en COBOL            *
      *   dans les annees 1970 en France.                              *
      *                                                                *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID.    BANQUE75.
       AUTHOR.        LEDUTHEO-1975.
       DATE-WRITTEN.  29-05-1975.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FIC-MOUVEMENTS ASSIGN TO "MOUVEMENTS.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ETAT-SORTIE    ASSIGN TO "ETAT-SOLDES.TXT"
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

       FD  ETAT-SORTIE.
       01  LIGNE-ETAT              PIC X(100).

       WORKING-STORAGE SECTION.

       01  WS-FIN                  PIC X VALUE "N".
       01  WS-COMPTE               PIC 9(8).
       01  WS-NOM                  PIC X(25).
       01  WS-SOLDE                PIC S9(9)V99 VALUE 12500.50.
       01  WS-TOTAL-DEPOTS         PIC S9(9)V99 VALUE ZERO.
       01  WS-TOTAL-RETRAITS       PIC S9(9)V99 VALUE ZERO.
       01  WS-NB-OPERATIONS        PIC 9(5)  VALUE ZERO.

       01  WS-LIGNES.
           05  WS-TITRE            PIC X(60)
               VALUE "   ETAT DES COMPTES APRES TRAITEMENT - 1975".
           05  WS-LIGNE-VIDE       PIC X(100) VALUE SPACES.
           05  WS-LIGNE-COMPTE.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  WS-COMPTE-OUT   PIC 9(8).
               10  FILLER          PIC X(3)  VALUE SPACES.
               10  WS-NOM-OUT      PIC X(25).
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  WS-SOLDE-OUT    PIC ZZZ,ZZZ,ZZ9.99.
           05  WS-LIGNE-RESUME.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  FILLER          PIC X(25)
                   VALUE "Nombre d'operations : ".
               10  WS-NB-OUT       PIC ZZZZ9.
           05  WS-LIGNE-DEPOTS.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  FILLER          PIC X(25)
                   VALUE "Total des depots    : ".
               10  WS-DEP-OUT      PIC Z,ZZZ,ZZZ,ZZ9.99.
           05  WS-LIGNE-RETRAITS.
               10  FILLER          PIC X(5)  VALUE SPACES.
               10  FILLER          PIC X(25)
                   VALUE "Total des retraits  : ".
               10  WS-RET-OUT      PIC Z,ZZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.

       0000-MAIN.
           PERFORM 1000-INIT
           PERFORM 2000-TRAITER-MOUVEMENTS
           PERFORM 3000-IMPRIMER-ETAT
           PERFORM 9000-FINIR
           STOP RUN.

       1000-INIT.
           OPEN INPUT  FIC-MOUVEMENTS
           OPEN OUTPUT ETAT-SORTIE
           DISPLAY "=== TRAITEMENT BANCAIRE 1975 ===".

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
           ADD 1 TO WS-NB-OPERATIONS

           IF M-TYPE-OPERATION = "D"
               ADD M-MONTANT TO WS-SOLDE
               ADD M-MONTANT TO WS-TOTAL-DEPOTS
           ELSE
               IF M-TYPE-OPERATION = "R"
                   SUBTRACT M-MONTANT FROM WS-SOLDE
                   ADD M-MONTANT TO WS-TOTAL-RETRAITS
               END-IF
           END-IF.

       3000-IMPRIMER-ETAT.
           WRITE LIGNE-ETAT FROM WS-LIGNE-VIDE
           WRITE LIGNE-ETAT FROM WS-TITRE
           WRITE LIGNE-ETAT FROM WS-LIGNE-VIDE

           MOVE 12345678 TO WS-COMPTE-OUT          *> Exemple de compte
           MOVE "DUPONT JEAN               " TO WS-NOM-OUT
           MOVE WS-SOLDE TO WS-SOLDE-OUT
           WRITE LIGNE-ETAT FROM WS-LIGNE-COMPTE

           MOVE 87654321 TO WS-COMPTE-OUT
           MOVE "MARTIN MARIE              " TO WS-NOM-OUT
           MOVE 8750.25 TO WS-SOLDE-OUT
           WRITE LIGNE-ETAT FROM WS-LIGNE-COMPTE

           WRITE LIGNE-ETAT FROM WS-LIGNE-VIDE

           MOVE WS-NB-OPERATIONS TO WS-NB-OUT
           WRITE LIGNE-ETAT FROM WS-LIGNE-RESUME

           MOVE WS-TOTAL-DEPOTS TO WS-DEP-OUT
           WRITE LIGNE-ETAT FROM WS-LIGNE-DEPOTS

           MOVE WS-TOTAL-RETRAITS TO WS-RET-OUT
           WRITE LIGNE-ETAT FROM WS-LIGNE-RETRAITS.

       9000-FINIR.
           CLOSE FIC-MOUVEMENTS
           CLOSE ETAT-SORTIE
           DISPLAY "TRAITEMENT TERMINE."
           DISPLAY "FICHIER GENERE : ETAT-SOLDES.TXT".

      ******************************************************************
      *                    FIN DU PROGRAMME COBOL 1975                 *
      ******************************************************************
