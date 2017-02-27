       IDENTIFICATION        DIVISION.
       PROGRAM-ID.           BATCH-COMPUTING.
      *
       ENVIRONMENT           DIVISION.
       INPUT-OUTPUT          SECTION.
       FILE-CONTROL.
           SELECT OUT-FILE ASSIGN TO "result.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
      *
       DATA                  DIVISION.
       FILE                  SECTION.
       FD  OUT-FILE.
       01  ARGS-REC.
           02  COL-ARGCNT    PIC Z(5)9.
           02                PIC X(01).
           02  COL-ARG01     PIC X(15).
           02                PIC X(01).
           02  COL-ARG02     PIC X(15).
       01  ENVS-REC.
           02  COL-VERSION   PIC X(15).
           02                PIC X(01).
           02  COL-TARGET    PIC X(15).
       01  DATA-REC.
           02  COL-CNT       PIC Z(3)9.
           02                PIC X(01).
           02  COL-MM        PIC 9(02).
           02                PIC X(01).
           02  COL-SS        PIC 9(02).
      *
       WORKING-STORAGE       SECTION.
       01  ARG-CNT           PIC 9(02).
       01  ARG-VAL01         PIC X(15).
       01  ARG-VAL02         PIC X(15).
       01  ENV-VERSION       PIC X(15).
       01  ENV-TARGET        PIC X(15).
       01  CNT               PIC 9(03) VALUE 0.
       01  TIME-VARIABLES.
           02  HH            PIC 9(02).
           02  MM            PIC 9(02).
           02  SS            PIC 9(02).
      *
       PROCEDURE             DIVISION.
          OPEN OUTPUT OUT-FILE.
      * command-line arguments
          ACCEPT  ARG-CNT    FROM ARGUMENT-NUMBER.
          ACCEPT  ARG-VAL01  FROM ARGUMENT-VALUE.
          ACCEPT  ARG-VAL02  FROM ARGUMENT-VALUE.
      *
          MOVE   SPACE       TO ARGS-REC
          MOVE   ARG-CNT     TO COL-ARGCNT
          MOVE   ARG-VAL01   TO COL-ARG01
          MOVE   ARG-VAL02   TO COL-ARG02
          WRITE  ARGS-REC
      * environment variables
          DISPLAY "APP_VERSION" UPON ENVIRONMENT-NAME
          ACCEPT  ENV-VERSION   FROM ENVIRONMENT-VALUE.
          DISPLAY "APP_TARGET"  UPON ENVIRONMENT-NAME
          ACCEPT  ENV-TARGET    FROM ENVIRONMENT-VALUE.
      *
          MOVE   SPACE       TO ENVS-REC
          MOVE   ENV-VERSION TO COL-VERSION
          MOVE   ENV-TARGET  TO COL-TARGET
          WRITE  ENVS-REC
      * write contents
          PERFORM UNTIL CNT = 5
              ADD  1  TO  CNT
              ACCEPT TIME-VARIABLES FROM TIME
              MOVE   SPACE  TO DATA-REC
              MOVE   CNT    TO COL-CNT
              MOVE   MM     TO COL-MM
              MOVE   SS     TO COL-SS
              WRITE  DATA-REC
          END-PERFORM.
      *
          CLOSE OUT-FILE.
          STOP RUN.
