*************************************************************************
*                                                                       *
* LISTTSD >>> List treatment storage and disposal                       *
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

HEAD = "List T S D 's"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to STOP"
do FRAME

MENU_CNT = 3
MENU_1 = "List TSD facilities by TSD."
MENU_2 = "List TSD facilities by Company."
MENU_3 = "List TSD facilities by Zip."
do MENU

do while CONTINUE

   if REFRESH
      HEAD = "List T S D 's"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "List TSD facilities by TSD."
      MENU_2 = "List TSD facilities by Company."
      MENU_3 = "List TSD facilities by Zip."
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
         use WASTE

         goto bottom
         TOT_TSD = RECNO()

         set index to TSDNBR

         do TITLEPG

         HEADER = "<<< List of TSD facilities by TSD " + dtoc(date()) + " <<<"
         do PRINTTSD

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
         use WASTE

         goto bottom
         TOT_TSD = RECNO()

         index on W_W_COMPNY to data\TSDCMPNY

         set index to TSDCMPNY

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of TSD facilities by Company " + dtoc(date()) + " <<<"
         do PRINTTSD

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
         use WASTE

         goto bottom
         TOT_TSD = RECNO()

         index on W_W_ZIP to data\TSDZIP

         set index to TSDZIP

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of TSD facilities by Zip " + dtoc(date()) + " <<<"
         do PRINTTSD

         select A
         use

         store .T. to REFRESH
         store .T. to CONTINUE

   endcase

enddo

return
