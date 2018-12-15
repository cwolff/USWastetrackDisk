*************************************************************************
*                                                                       *
* LISTTID >>> List transporter                                          *
*                                                                       *
*            entry : None                                               *
*            exit : None                                                *
*                                                                       *
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.  *
*                                                                       *
*************************************************************************

private CONTINUE
private REFRESH

store .F. to REFRESH
store .T. to CONTINUE

HEAD = "List Transporters"
L_TAIL = DTOC(date())
R_TAIL = "Press 0 to STOP"
do FRAME

MENU_CNT = 3
MENU_1 = "List Transporters by TID."
MENU_2 = "List Transporters by Company."
MENU_3 = "List Transporters by Zip."
do MENU

do while CONTINUE

   if REFRESH
      HEAD = "List Transporters"
      L_TAIL = DTOC(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "List Transporters by TID."
      MENU_2  = "List Transporters by Company."
      MENU_3 = "List Transporters by Zip."
      do MENU
   endif

   CHOICE = 3
   do GETMKEY

   do case

      case CHOICE = 0
         store .F. to CONTINUE

      case CHOICE = 1
         do CLRSCRN

         select A
         use TRANSPRT

         goto bottom
         TOT_TID = RECNO()

         set index to TIDNBR

         do TITLEPG

         HEADER = "<<< List of Transporters by TID " + DTOC(date()) + " <<<"
         do PRINTTID

         select A
         use

         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 2
         do CLRSCRN

         PMT_LINE = 10
         PMT_MSG = "One moment please indexing on company name."
         do PROMPT

         select A
         use TRANSPRT

         goto bottom
         TOT_TID = RECNO()

         index on T_T_COMPNY to data\TIDCMPNY

         set index to TIDCMPNY

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of Transporters by Company " + DTOC(date())
         HEADER = HEADER + " <<<"

         do PRINTTID

         select A
         use

         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 3
         do CLRSCRN

         PMT_LINE = 10
         PMT_MSG = "One moment please indexing on zip code."
         do PROMPT

         select A
         use TRANSPRT

         goto bottom
         TOT_TID = RECNO()

         index on T_T_ZIP to data\TIDZIP

         set index to TIDZIP

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of Transporters by Zip " + DTOC(date()) + " <<<"
         do PRINTTID

         select A
         use

         store .T. to REFRESH
         store .T. to CONTINUE

   endcase

enddo

return
